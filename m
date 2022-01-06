Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD02486541
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 14:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239549AbiAFNZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 08:25:36 -0500
Received: from www.linuxtv.org ([130.149.80.248]:56466 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239337AbiAFNZf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jan 2022 08:25:35 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1n5Slq-00Fy3y-HD; Thu, 06 Jan 2022 13:25:34 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1n5Slo-00A85Y-B8; Thu, 06 Jan 2022 13:25:31 +0000
Date:   Thu, 6 Jan 2022 13:25:31 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1551196177.1.1641475531747@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #265
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: linux-media
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/linux-media/265/display/redirect>

Changes:


------------------------------------------
[...truncated 55104 lines...]
  CC      drivers/iio/adc/xilinx-xadc-core.o
  CC      drivers/iio/humidity/am2315.o
  CC      drivers/iio/multiplexer/iio-mux.o
  CC      drivers/iio/humidity/dht11.o
  CC      drivers/iio/adc/xilinx-xadc-events.o
  CC      drivers/iio/imu/adis16400.o
  CC      drivers/iio/orientation/hid-sensor-incl-3d.o
  CC      drivers/iio/orientation/hid-sensor-rotation.o
  CC      drivers/iio/humidity/hdc100x.o
  CC      drivers/iio/adc/sd_adc_modulator.o
  AR      drivers/iio/multiplexer/built-in.a
  CC      drivers/iio/magnetometer/ak8974.o
  CC      drivers/iio/position/hid-sensor-custom-intel-hinge.o
  CC      drivers/iio/humidity/hdc2010.o
  CC      drivers/iio/imu/adis16460.o
  AR      drivers/iio/adc/built-in.a
  AR      drivers/iio/orientation/built-in.a
  CC      drivers/iio/humidity/hid-sensor-humidity.o
  CC      drivers/iio/position/iqs624-pos.o
  CC      drivers/iio/imu/adis16475.o
  CC      drivers/iio/humidity/hts221_core.o
  CC      drivers/iio/imu/adis16480.o
  CC      drivers/iio/magnetometer/ak8975.o
  CC      drivers/iio/potentiometer/ad5110.o
  CC      drivers/iio/potentiostat/lmp91000.o
  CC      drivers/iio/light/acpi-als.o
  AR      drivers/iio/position/built-in.a
  CC      drivers/iio/light/adjd_s311.o
  CC      drivers/iio/light/adux1020.o
  CC      drivers/iio/potentiometer/ad5272.o
  CC      drivers/iio/potentiometer/ds1803.o
  CC      drivers/iio/magnetometer/bmc150_magn.o
  CC      drivers/iio/humidity/hts221_buffer.o
  CC      drivers/iio/imu/adis.o
  AR      drivers/iio/potentiostat/built-in.a
  CC      drivers/iio/magnetometer/bmc150_magn_i2c.o
  CC      drivers/iio/magnetometer/bmc150_magn_spi.o
  CC      drivers/iio/magnetometer/mag3110.o
  CC      drivers/iio/magnetometer/hid-sensor-magn-3d.o
  CC      drivers/iio/humidity/hts221_i2c.o
  CC      drivers/iio/humidity/hts221_spi.o
  CC      drivers/iio/light/al3010.o
  CC      drivers/iio/imu/adis_trigger.o
  CC      drivers/iio/light/al3320a.o
  CC      drivers/iio/potentiometer/max5432.o
  CC      drivers/iio/imu/adis_buffer.o
  CC      drivers/iio/light/apds9300.o
  CC      drivers/iio/magnetometer/mmc35240.o
  CC      drivers/iio/potentiometer/max5481.o
  CC      drivers/iio/magnetometer/st_magn_core.o
  CC      drivers/iio/imu/bmi160/bmi160_core.o
  CC      drivers/iio/light/apds9960.o
  CC      drivers/iio/humidity/htu21.o
  CC      drivers/iio/humidity/si7005.o
  CC      drivers/iio/light/as73211.o
  CC      drivers/iio/imu/bmi160/bmi160_i2c.o
  CC      drivers/iio/imu/bmi160/bmi160_spi.o
  CC      drivers/iio/magnetometer/st_magn_buffer.o
  CC      drivers/iio/potentiometer/max5487.o
  CC      drivers/iio/magnetometer/st_magn_i2c.o
  CC      drivers/iio/magnetometer/st_magn_spi.o
  CC      drivers/iio/magnetometer/hmc5843_core.o
  CC      drivers/iio/light/bh1750.o
  CC      drivers/iio/humidity/si7020.o
  CC      drivers/iio/magnetometer/hmc5843_i2c.o
  CC      drivers/iio/magnetometer/hmc5843_spi.o
  CC      drivers/iio/potentiometer/mcp4018.o
  CC      drivers/iio/potentiometer/mcp4131.o
  CC      drivers/iio/light/bh1780.o
  CC      drivers/iio/magnetometer/rm3100-core.o
  AR      drivers/iio/imu/bmi160/built-in.a
  CC      drivers/iio/imu/fxos8700_core.o
  AR      drivers/iio/humidity/built-in.a
  CC      drivers/iio/imu/fxos8700_i2c.o
  CC      drivers/iio/magnetometer/rm3100-i2c.o
  CC      drivers/iio/potentiometer/mcp4531.o
  CC      drivers/iio/magnetometer/rm3100-spi.o
  CC      drivers/iio/magnetometer/yamaha-yas530.o
  CC      drivers/iio/resolver/ad2s90.o
  CC      drivers/iio/light/cm32181.o
  CC      drivers/iio/imu/fxos8700_spi.o
  CC      drivers/iio/light/cm3232.o
  CC      drivers/iio/light/cm3323.o
  CC      drivers/iio/proximity/as3935.o
  CC      drivers/iio/potentiometer/mcp41010.o
  CC      drivers/iio/potentiometer/tpl0102.o
  AR      drivers/iio/magnetometer/built-in.a
  CC      drivers/iio/proximity/cros_ec_mkbp_proximity.o
  CC      drivers/iio/resolver/ad2s1200.o
  CC      drivers/iio/pressure/abp060mg.o
  CC      drivers/iio/proximity/isl29501.o
  CC      drivers/iio/light/cm3605.o
  CC      drivers/iio/proximity/pulsedlight-lidar-lite-v2.o
  CC      drivers/iio/proximity/mb1232.o
  CC      drivers/iio/light/cm36651.o
  AR      drivers/iio/resolver/built-in.a
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_core.o
  AR      drivers/iio/potentiometer/built-in.a
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_ring.o
  CC      drivers/iio/test/iio-test-format.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_core.o
  CC      drivers/iio/pressure/bmp280-core.o
  CC      drivers/iio/temperature/iqs620at-temp.o
  CC      drivers/iio/light/cros_ec_light_prox.o
  CC      drivers/iio/trigger/iio-trig-hrtimer.o
  CC      drivers/iio/proximity/ping.o
  AR      drivers/iio/test/built-in.a
  CC      drivers/iio/proximity/rfd77402.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.o
  CC      drivers/iio/pressure/bmp280-regmap.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_accel.o
  CC      drivers/iio/temperature/ltc2983.o
  CC      drivers/iio/proximity/srf04.o
  CC      drivers/iio/light/gp2ap002.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.o
  CC      drivers/iio/trigger/iio-trig-interrupt.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_aux.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_magn.o
  CC      drivers/iio/proximity/srf08.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_temp.o
  CC      drivers/iio/pressure/bmp280-i2c.o
  CC      drivers/iio/trigger/stm32-lptimer-trigger.o
  CC      drivers/iio/temperature/hid-sensor-temperature.o
  CC      drivers/iio/temperature/maxim_thermocouple.o
  CC      drivers/iio/light/gp2ap020a00f.o
  CC      drivers/iio/light/hid-sensor-als.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.o
  CC      drivers/iio/proximity/sx9310.o
  CC      drivers/iio/pressure/bmp280-spi.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.o
  CC      drivers/iio/trigger/stm32-timer-trigger.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_spi.o
  CC      drivers/iio/temperature/max31856.o
  CC      drivers/iio/light/hid-sensor-prox.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.o
  CC      drivers/iio/pressure/dlhl60d.o
  CC      drivers/iio/proximity/sx9500.o
  CC      drivers/iio/trigger/iio-trig-sysfs.o
  CC      drivers/iio/proximity/vcnl3020.o
  CC      drivers/iio/light/iqs621-als.o
  CC      drivers/iio/light/isl29018.o
  AR      drivers/iio/imu/inv_mpu6050/built-in.a
  CC      drivers/iio/temperature/max31865.o
  CC      drivers/iio/light/isl29028.o
  CC      drivers/iio/pressure/dps310.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_spi.o
  CC      drivers/iio/trigger/iio-trig-loop.o
  CC      drivers/iio/light/isl29125.o
  CC      drivers/iio/light/jsa1212.o
  CC      drivers/iio/proximity/vl53l0x-i2c.o
  CC      drivers/iio/light/lm3533-als.o
  AR      drivers/iio/trigger/built-in.a
  CC      drivers/iio/temperature/mlx90614.o
  CC      drivers/iio/light/ltr501.o
  CC      drivers/iio/light/lv0104cs.o
  CC      drivers/iio/pressure/cros_ec_baro.o
  CC      drivers/iio/light/max44000.o
  CC      drivers/iio/light/max44009.o
  AR      drivers/iio/imu/inv_icm42600/built-in.a
  CC      drivers/iio/imu/kmx61.o
  AR      drivers/iio/proximity/built-in.a
  CC      drivers/iio/light/noa1305.o
  CC      drivers/iio/temperature/mlx90632.o
  CC      drivers/iio/pressure/hid-sensor-press.o
  CC      drivers/iio/light/opt3001.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.o
  CC      drivers/iio/light/pa12203001.o
  CC      drivers/iio/light/rpr0521.o
  CC      drivers/iio/light/tsl2563.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.o
  CC      drivers/iio/pressure/hp03.o
  CC      drivers/iio/light/si1133.o
  CC      drivers/iio/light/si1145.o
  CC      drivers/iio/temperature/tmp006.o
  CC      drivers/iio/temperature/tmp007.o
  CC      drivers/iio/temperature/tmp117.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.o
  CC      drivers/iio/light/stk3310.o
  CC      drivers/iio/light/st_uvis25_core.o
  CC      drivers/iio/pressure/icp10100.o
  CC      drivers/iio/light/st_uvis25_i2c.o
  CC      drivers/iio/light/st_uvis25_spi.o
  CC      drivers/iio/light/tcs3414.o
  CC      drivers/iio/temperature/tsys01.o
  CC      drivers/iio/temperature/tsys02d.o
  CC      drivers/iio/light/tcs3472.o
  CC      drivers/iio/pressure/mpl115.o
  CC      drivers/iio/light/tsl2583.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.o
  CC      drivers/iio/pressure/mpl115_i2c.o
  CC      drivers/iio/pressure/mpl115_spi.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.o
  CC      drivers/iio/pressure/mpl3115.o
  CC      drivers/iio/pressure/ms5611_core.o
  AR      drivers/iio/temperature/built-in.a
  CC      drivers/iio/pressure/ms5611_i2c.o
  CC      drivers/iio/pressure/ms5611_spi.o
  CC      drivers/iio/pressure/ms5637.o
  CC      drivers/iio/pressure/st_pressure_core.o
  AR      drivers/iio/imu/st_lsm6dsx/built-in.a
  AR      drivers/iio/imu/built-in.a
  CC      drivers/iio/pressure/st_pressure_buffer.o
  CC      drivers/iio/light/tsl2591.o
  CC      drivers/iio/light/tsl2772.o
  CC      drivers/iio/light/tsl4531.o
  CC      drivers/iio/light/us5182d.o
  CC      drivers/iio/pressure/t5403.o
  CC      drivers/iio/pressure/hp206c.o
  CC      drivers/iio/pressure/zpa2326.o
  CC      drivers/iio/pressure/zpa2326_i2c.o
  CC      drivers/iio/light/vcnl4000.o
  CC      drivers/iio/pressure/zpa2326_spi.o
  CC      drivers/iio/light/vcnl4035.o
  CC      drivers/iio/light/veml6030.o
  CC      drivers/iio/light/veml6070.o
  CC      drivers/iio/pressure/st_pressure_i2c.o
  CC      drivers/iio/light/vl6180.o
  CC      drivers/iio/pressure/st_pressure_spi.o
  CC      drivers/iio/light/zopt2201.o
  AR      drivers/iio/light/built-in.a
  AR      drivers/iio/pressure/built-in.a
  AR      drivers/iio/built-in.a
  AR      drivers/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  OBJTOOL vmlinux.o
Killed
make[1]: *** [/var/lib/jenkins/workspace/linux-media/Makefile:1161: vmlinux] Error 137
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
make: *** [Makefile:219: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch x86_64 (builtin/mod)
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] step
