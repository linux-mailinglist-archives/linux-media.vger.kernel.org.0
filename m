Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6864EFF83
	for <lists+linux-media@lfdr.de>; Sat,  2 Apr 2022 09:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238925AbiDBHzw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Apr 2022 03:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238906AbiDBHzv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Apr 2022 03:55:51 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A8952E1C
        for <linux-media@vger.kernel.org>; Sat,  2 Apr 2022 00:53:58 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1naYa5-00Gy8M-39; Sat, 02 Apr 2022 07:53:57 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1naYa1-00C8TK-37; Sat, 02 Apr 2022 07:53:52 +0000
Date:   Sat, 2 Apr 2022 07:53:50 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <393084583.0.1648886031831@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #275
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: linux-media
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/linux-media/275/display/redirect>

Changes:


------------------------------------------
[...truncated 23038 lines...]
  CC      drivers/iio/orientation/hid-sensor-rotation.o
  CC      drivers/iio/gyro/ssp_gyro_sensor.o
  CC      drivers/iio/magnetometer/st_magn_core.o
  CC      drivers/iio/position/iqs624-pos.o
  CC      drivers/iio/light/apds9960.o
  CC      drivers/iio/light/as73211.o
  CC      drivers/iio/light/bh1750.o
  AR      drivers/iio/imu/bmi160/built-in.a
  CC      drivers/iio/dac/ad5766.o
  CC      drivers/iio/imu/fxos8700_core.o
  CC      drivers/iio/gyro/st_gyro_core.o
  AR      drivers/iio/position/built-in.a
  AR      drivers/iio/orientation/built-in.a
  CC      drivers/iio/imu/fxos8700_i2c.o
  CC      drivers/iio/light/bh1780.o
  CC      drivers/iio/imu/fxos8700_spi.o
  CC      drivers/iio/magnetometer/st_magn_buffer.o
  CC      drivers/iio/light/cm32181.o
  CC      drivers/iio/gyro/st_gyro_buffer.o
  CC      drivers/iio/light/cm3232.o
  CC      drivers/iio/potentiostat/lmp91000.o
  CC      drivers/iio/dac/ad5770r.o
  CC      drivers/iio/dac/ad5791.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_core.o
  CC      drivers/iio/magnetometer/st_magn_i2c.o
  CC      drivers/iio/gyro/st_gyro_i2c.o
  CC      drivers/iio/gyro/st_gyro_spi.o
  CC      drivers/iio/potentiometer/ad5110.o
  AR      drivers/iio/potentiostat/built-in.a
  CC      drivers/iio/dac/ad5686.o
  CC      drivers/iio/light/cm3323.o
  CC      drivers/iio/potentiometer/ad5272.o
  CC      drivers/iio/potentiometer/ds1803.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.o
  CC      drivers/iio/magnetometer/st_magn_spi.o
  CC      drivers/iio/dac/ad5686-spi.o
  CC      drivers/iio/light/cm3605.o
  CC      drivers/iio/dac/ad5696-i2c.o
  AR      drivers/iio/gyro/built-in.a
  CC      drivers/iio/potentiometer/max5432.o
  CC      drivers/iio/potentiometer/max5481.o
  CC      drivers/iio/dac/ad7293.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_accel.o
  CC      drivers/iio/magnetometer/hmc5843_core.o
  CC      drivers/iio/potentiometer/max5487.o
  CC      drivers/iio/light/cm36651.o
  CC      drivers/iio/resolver/ad2s90.o
  CC      drivers/iio/proximity/as3935.o
  CC      drivers/iio/magnetometer/hmc5843_i2c.o
  CC      drivers/iio/resolver/ad2s1200.o
  CC      drivers/iio/proximity/cros_ec_mkbp_proximity.o
  CC      drivers/iio/potentiometer/mcp4018.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_temp.o
  CC      drivers/iio/light/cros_ec_light_prox.o
  CC      drivers/iio/dac/ad7303.o
  CC      drivers/iio/proximity/isl29501.o
  CC      drivers/iio/magnetometer/hmc5843_spi.o
  AR      drivers/iio/resolver/built-in.a
  CC      drivers/iio/temperature/iqs620at-temp.o
  CC      drivers/iio/light/gp2ap002.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.o
  CC      drivers/iio/potentiometer/mcp4131.o
  CC      drivers/iio/dac/ad8801.o
  CC      drivers/iio/magnetometer/rm3100-core.o
  CC      drivers/iio/temperature/ltc2983.o
  CC      drivers/iio/proximity/pulsedlight-lidar-lite-v2.o
  CC      drivers/iio/pressure/abp060mg.o
  CC      drivers/iio/test/iio-test-format.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.o
  CC      drivers/iio/light/gp2ap020a00f.o
  CC      drivers/iio/potentiometer/mcp4531.o
  CC      drivers/iio/magnetometer/rm3100-i2c.o
  CC      drivers/iio/dac/cio-dac.o
  CC      drivers/iio/proximity/mb1232.o
  AR      drivers/iio/test/built-in.a
  CC      drivers/iio/light/hid-sensor-als.o
  CC      drivers/iio/pressure/bmp280-core.o
  CC      drivers/iio/temperature/hid-sensor-temperature.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.o
  CC      drivers/iio/dac/dpot-dac.o
  CC      drivers/iio/dac/ds4424.o
  CC      drivers/iio/light/hid-sensor-prox.o
  CC      drivers/iio/proximity/ping.o
  CC      drivers/iio/potentiometer/mcp41010.o
  CC      drivers/iio/temperature/maxim_thermocouple.o
  CC      drivers/iio/magnetometer/rm3100-spi.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_spi.o
  CC      drivers/iio/pressure/bmp280-regmap.o
  CC      drivers/iio/dac/lpc18xx_dac.o
  CC      drivers/iio/proximity/rfd77402.o
  CC      drivers/iio/light/iqs621-als.o
  CC      drivers/iio/potentiometer/tpl0102.o
  CC      drivers/iio/temperature/max31856.o
  CC      drivers/iio/pressure/bmp280-i2c.o
  CC      drivers/iio/magnetometer/yamaha-yas530.o
  CC      drivers/iio/dac/ltc1660.o
  AR      drivers/iio/imu/inv_icm42600/built-in.a
  CC      drivers/iio/light/isl29018.o
  CC      drivers/iio/temperature/max31865.o
  CC      drivers/iio/proximity/srf04.o
  AR      drivers/iio/potentiometer/built-in.a
  CC      drivers/iio/trigger/iio-trig-hrtimer.o
  CC      drivers/iio/light/isl29028.o
  CC      drivers/iio/pressure/bmp280-spi.o
  CC      drivers/iio/dac/ltc2632.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_core.o
  AR      drivers/iio/magnetometer/built-in.a
  CC      drivers/iio/light/isl29125.o
  CC      drivers/iio/temperature/mlx90614.o
  CC      drivers/iio/proximity/srf08.o
  CC      drivers/iio/trigger/iio-trig-interrupt.o
  CC      drivers/iio/temperature/mlx90632.o
  CC      drivers/iio/pressure/dlhl60d.o
  CC      drivers/iio/dac/m62332.o
  CC      drivers/iio/light/jsa1212.o
  CC      drivers/iio/trigger/stm32-lptimer-trigger.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_ring.o
  CC      drivers/iio/light/lm3533-als.o
  CC      drivers/iio/pressure/dps310.o
  CC      drivers/iio/temperature/tmp006.o
  CC      drivers/iio/proximity/sx9310.o
  CC      drivers/iio/pressure/cros_ec_baro.o
  CC      drivers/iio/dac/max517.o
  CC      drivers/iio/trigger/stm32-timer-trigger.o
  CC      drivers/iio/pressure/hid-sensor-press.o
  CC      drivers/iio/light/ltr501.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.o
  CC      drivers/iio/light/lv0104cs.o
  CC      drivers/iio/light/max44000.o
  CC      drivers/iio/temperature/tmp007.o
  CC      drivers/iio/pressure/hp03.o
  CC      drivers/iio/dac/max5821.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_aux.o
  CC      drivers/iio/dac/mcp4725.o
  CC      drivers/iio/proximity/sx9500.o
  CC      drivers/iio/trigger/iio-trig-sysfs.o
  CC      drivers/iio/trigger/iio-trig-loop.o
  CC      drivers/iio/imu/kmx61.o
  CC      drivers/iio/light/max44009.o
  CC      drivers/iio/temperature/tmp117.o
  CC      drivers/iio/pressure/icp10100.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_magn.o
  CC      drivers/iio/proximity/vcnl3020.o
  CC      drivers/iio/pressure/mpl115.o
  CC      drivers/iio/dac/mcp4922.o
  AR      drivers/iio/trigger/built-in.a
  CC      drivers/iio/dac/stm32-dac-core.o
  CC      drivers/iio/temperature/tsys01.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.o
  CC      drivers/iio/light/noa1305.o
  CC      drivers/iio/pressure/mpl115_i2c.o
  CC      drivers/iio/light/opt3001.o
  CC      drivers/iio/proximity/vl53l0x-i2c.o
  CC      drivers/iio/temperature/tsys02d.o
  CC      drivers/iio/dac/stm32-dac.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_spi.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.o
  CC      drivers/iio/dac/ti-dac082s085.o
  CC      drivers/iio/pressure/mpl115_spi.o
  CC      drivers/iio/light/pa12203001.o
  CC      drivers/iio/light/rpr0521.o
  AR      drivers/iio/proximity/built-in.a
  CC      drivers/iio/pressure/mpl3115.o
  CC      drivers/iio/pressure/ms5611_core.o
  AR      drivers/iio/temperature/built-in.a
  CC      drivers/iio/dac/ti-dac5571.o
  AR      drivers/iio/imu/inv_mpu6050/built-in.a
  CC      drivers/iio/pressure/ms5611_i2c.o
  CC      drivers/iio/pressure/ms5611_spi.o
  CC      drivers/iio/dac/ti-dac7311.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.o
  CC      drivers/iio/light/tsl2563.o
  CC      drivers/iio/dac/ti-dac7612.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.o
  CC      drivers/iio/pressure/ms5637.o
  CC      drivers/iio/pressure/st_pressure_core.o
  CC      drivers/iio/pressure/st_pressure_buffer.o
  CC      drivers/iio/pressure/t5403.o
  CC      drivers/iio/dac/vf610_dac.o
  CC      drivers/iio/light/si1133.o
  CC      drivers/iio/light/si1145.o
  CC      drivers/iio/pressure/hp206c.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.o
  CC      drivers/iio/pressure/zpa2326.o
  AR      drivers/iio/dac/built-in.a
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.o
  CC      drivers/iio/pressure/zpa2326_i2c.o
  CC      drivers/iio/pressure/zpa2326_spi.o
  CC      drivers/iio/light/stk3310.o
  CC      drivers/iio/pressure/st_pressure_i2c.o
  CC      drivers/iio/pressure/st_pressure_spi.o
  CC      drivers/iio/light/st_uvis25_core.o
  CC      drivers/iio/light/st_uvis25_i2c.o
  CC      drivers/iio/light/st_uvis25_spi.o
  AR      drivers/iio/imu/st_lsm6dsx/built-in.a
  AR      drivers/iio/imu/built-in.a
  CC      drivers/iio/light/tcs3414.o
  CC      drivers/iio/light/tcs3472.o
  CC      drivers/iio/light/tsl2583.o
  CC      drivers/iio/light/tsl2591.o
  CC      drivers/iio/light/tsl2772.o
  CC      drivers/iio/light/tsl4531.o
  CC      drivers/iio/light/us5182d.o
  CC      drivers/iio/light/vcnl4000.o
  AR      drivers/iio/pressure/built-in.a
  CC      drivers/iio/light/vcnl4035.o
  CC      drivers/iio/light/veml6030.o
  CC      drivers/iio/light/veml6070.o
  CC      drivers/iio/light/vl6180.o
  CC      drivers/iio/light/zopt2201.o
  AR      drivers/iio/light/built-in.a
  AR      drivers/iio/built-in.a
  AR      drivers/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  OBJTOOL vmlinux.o
  OBJTOOL vmlinux.o
Killed
make[1]: *** [/var/lib/jenkins/workspace/linux-media@2/Makefile:1155: vmlinux] Error 137
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
make: *** [Makefile:219: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch arm/aarch64 (builtin)
Killed
make[1]: *** [/var/lib/jenkins/workspace/linux-media/Makefile:1155: vmlinux] Error 137
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
