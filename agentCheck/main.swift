import Foundation

func checkAndInstallWazuhAgent() {
    let architecture = getCurrentArchitecture()
    let packageName: String
    
    switch architecture {
    case .x86_64:
        packageName = "wazuh-agent-4.7.3-1.intel64.pkg"
    case .arm64:
        packageName = "wazuh-agent-4.7.3-1.arm64.pkg"
    }
    
    let installURL = "https://packages.wazuh.com/4.x/macos/\(packageName)"
    let packagePath = "/tmp/\(packageName)"
    
    // Download the package
    let downloadTask = Process()
    downloadTask.launchPath = "/usr/bin/env"
    downloadTask.arguments = ["curl", "-L", installURL, "-o", packagePath]
    downloadTask.launch()
    downloadTask.waitUntilExit()

    // Install the package
    let installTask = Process()
    installTask.launchPath = "/usr/sbin/installer"
    installTask.arguments = ["-pkg", packagePath, "-target", "/"]
    installTask.launch()
    installTask.waitUntilExit()

    // Clean up downloaded package
    let fileManager = FileManager.default
    try? fileManager.removeItem(atPath: packagePath)
}

func getCurrentArchitecture() -> Architecture {
    let task = Process()
    task.launchPath = "/usr/sbin/sysctl"
    task.arguments = ["-n", "machdep.cpu.brand_string"]
    
    let pipe = Pipe()
    task.standardOutput = pipe
    
    task.launch()
    task.waitUntilExit()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)?.lowercased()
    
    if let output = output {
        if output.contains("m") {
            return .arm64
        } else if output.contains("intel") || output.contains("amd") {
            return .x86_64
        }
    }
    
    fatalError("Unsupported architecture")
}

enum Architecture {
    case x86_64
    case arm64
}

checkAndInstallWazuhAgent()
