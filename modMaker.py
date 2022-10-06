import shutil
from pathlib import Path
import os


userPath = os.path.expanduser("~")
factorioPath = userPath + "/.factorio/mods/"

# The Folder-Name of the Mod without the version
targetMod = "TrainCargoCalculator"
targetFolder = ""


# get the target mod from the target folder
for target in os.listdir("."):
    if os.path.isdir(target) and targetMod in target:
        targetFolder = target
        break

# exit if target mod hasn't been found
if targetFolder == "":
    error_code = -1
    print("Error {0}: Mod-Folder on Desktop not found".format(error_code))
    exit(error_code)


targetToRemove = ""

# get the previous iteration from the mod folder
for mod in os.listdir(factorioPath):
    if Path(mod).suffix == ".zip" and targetMod in mod:
        targetToRemove = mod
        break


# remove the previous iteration of the mod if possible
if targetToRemove != "":
    targetToRemove = factorioPath + targetToRemove

    if os.path.exists(targetToRemove) and Path(targetToRemove).suffix == ".zip":
        os.remove(targetToRemove)
else:
    print("No Target-Mod like {0} in Factorio-Mod Folder found".format(targetMod))


completeModPath = factorioPath + targetFolder

# Copy the Mod into a new Folder with the same name
shutil.copytree(targetFolder, completeModPath + "/" + targetFolder)

# Make zip
shutil.make_archive(completeModPath, format="zip", root_dir=completeModPath)

# Delete the unzipped Mod folder
if os.path.exists(completeModPath) and os.path.isdir(completeModPath):
    shutil.rmtree(completeModPath)
