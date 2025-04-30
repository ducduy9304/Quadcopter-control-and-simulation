# Quadcopter-control-and-simulation

This project contains a complete simulation framework for quadcopter UAV control using MATLAB and Simulink. It includes modeling, trajectory planning, parameter configuration, and 3D visualization.

<p align="center">
  <img src="https://github.com/yourusername/Quadcopter-control-and-simulation/assets/yourimage.png" width="500"/>
</p>

## 📌 Features

- ✅ Full Simulink model of UAV dynamics (`UAV_control.slx`)
- ✅ MATLAB scripts for:
  - UAV parameters (`parameters_UAV.m`)
  - Flight trajectory definition (`trajectory.m`)
  - Simulation control (`simulation.m`)
- ✅ Visual 3D animation of UAV flight
- ✅ Compatible with MATLAB and Simulink (tested on R2023a+)
- ✅ Includes documentation (`.docx` and `.pdf`)

## 🛠 Files Description

| File/Folder            | Description                                       |
|------------------------|---------------------------------------------------|
| `UAV_control.slx`      | Simulink model of the UAV controller              |
| `parameters_UAV.m`     | Defines physical and control parameters of UAV    |
| `simulation.m`         | Runs the simulation and calls other modules       |
| `trajectory.m`         | Defines 3D flight path for the UAV                |
| `slprj/`               | Simulink cache files (auto-generated)             |
| `DinhDucDuy-*.doc/pdf` | Project report in Word and PDF format             |

## 🚁 Simulation Output

The simulation generates a 3D trajectory of the quadcopter as shown below:

<p align="center">
  <img src="docs/uav_trajectory.png" width="500"/>
</p>

## ▶️ How to Run

1. Open `UAV_control.slx` in MATLAB Simulink.
2. Run `simulation.m` script.
3. Observe the flight path animation and control response.

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

### 📧 Contact

Developed by [Duc Duy](https://github.com/ducduy9304). For questions or contributions, feel free to open issues or submit pull requests.
