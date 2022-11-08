Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794F5620F81
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 12:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbiKHLuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 06:50:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbiKHLuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 06:50:21 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABFA11811
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 03:50:19 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1osN7R-000j5g-39; Tue, 08 Nov 2022 11:50:17 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1osN7J-00Ezk2-1e; Tue, 08 Nov 2022 11:50:09 +0000
Date:   Tue, 8 Nov 2022 11:50:06 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1011107154.0.1667908208323@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #298
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: linux-media
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/linux-media/298/display/redirect>

Changes:


------------------------------------------
[...truncated 113754 lines...]
  CC      drivers/iio/light/iqs621-als.o
  CC      drivers/gnss/mtk.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.o
  CC      drivers/fpga/dfl-fme-pr.o
  AR      drivers/iio/position/built-in.a
  CC      drivers/fpga/dfl-fme-error.o
  AR      drivers/nvmem/built-in.a
  CC      drivers/net/ethernet/pensando/ionic/ionic_txrx.o
  CC      drivers/iio/potentiometer/ad5272.o
  CC      drivers/iio/light/isl29018.o
  CC      drivers/iio/light/isl29028.o
  CC      drivers/iio/magnetometer/st_magn_i2c.o
  CC      drivers/gnss/sirf.o
  CC      drivers/net/ethernet/pensando/ionic/ionic_stats.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_accel.o
  CC      drivers/fpga/dfl-fme-perf.o
  CC      drivers/iio/potentiometer/ds1803.o
  CC      drivers/gnss/ubx.o
  CC      drivers/iio/magnetometer/st_magn_spi.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_temp.o
  CC      drivers/iio/potentiostat/lmp91000.o
  CC      drivers/iio/light/isl29125.o
  CC      drivers/iio/potentiometer/max5432.o
  CC      drivers/fpga/dfl-fme-mgr.o
  CC      drivers/iio/magnetometer/hmc5843_core.o
  CC      drivers/gnss/usb.o
  CC      drivers/net/ethernet/pensando/ionic/ionic_fw.o
  CC      drivers/net/ethernet/pensando/ionic/ionic_phc.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.o
  CC      drivers/fpga/dfl-fme-br.o
  CC      drivers/iio/light/jsa1212.o
  AR      drivers/iio/potentiostat/built-in.a
  CC      drivers/iio/light/lm3533-als.o
  CC      drivers/iio/potentiometer/max5481.o
  CC      drivers/iio/magnetometer/hmc5843_i2c.o
  AR      drivers/gnss/built-in.a
  CC      drivers/iio/light/ltr501.o
  CC      drivers/fpga/dfl-fme-region.o
  CC      drivers/iio/light/ltrf216a.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.o
  CC      drivers/iio/potentiometer/max5487.o
  AR      drivers/net/ethernet/pensando/ionic/built-in.a
  AR      drivers/net/ethernet/pensando/built-in.a
  AR      drivers/net/ethernet/built-in.a
  CC      drivers/iio/magnetometer/hmc5843_spi.o
  CC      drivers/fpga/dfl-afu-main.o
  AR      drivers/net/built-in.a
  CC      drivers/iio/potentiometer/mcp4018.o
  CC      drivers/iio/light/lv0104cs.o
  CC      drivers/iio/potentiometer/mcp4131.o
  CC      drivers/iio/proximity/as3935.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.o
  CC      drivers/iio/pressure/abp060mg.o
  CC      drivers/iio/magnetometer/rm3100-core.o
  CC      drivers/iio/magnetometer/rm3100-i2c.o
  CC      drivers/fpga/dfl-afu-region.o
  CC      drivers/iio/magnetometer/rm3100-spi.o
  CC      drivers/iio/proximity/cros_ec_mkbp_proximity.o
  CC      drivers/iio/potentiometer/mcp4531.o
  CC      drivers/iio/imu/inv_icm42600/inv_icm42600_spi.o
  CC      drivers/iio/light/max44000.o
  CC      drivers/iio/pressure/bmp280-core.o
  CC      drivers/iio/pressure/bmp280-regmap.o
  CC      drivers/fpga/dfl-afu-dma-region.o
  CC      drivers/iio/resolver/ad2s90.o
  CC      drivers/iio/proximity/isl29501.o
  CC      drivers/iio/magnetometer/yamaha-yas530.o
  CC      drivers/iio/potentiometer/mcp41010.o
  CC      drivers/iio/light/max44009.o
  AR      drivers/iio/imu/inv_icm42600/built-in.a
  CC      drivers/fpga/dfl-afu-error.o
  CC      drivers/iio/resolver/ad2s1200.o
  CC      drivers/iio/pressure/bmp280-i2c.o
  CC      drivers/iio/proximity/pulsedlight-lidar-lite-v2.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_core.o
  CC      drivers/iio/light/noa1305.o
  AR      drivers/iio/magnetometer/built-in.a
  CC      drivers/iio/potentiometer/tpl0102.o
  CC      drivers/iio/proximity/mb1232.o
  CC      drivers/iio/temperature/iqs620at-temp.o
  CC      drivers/fpga/dfl-n3000-nios.o
  AR      drivers/iio/resolver/built-in.a
  CC      drivers/iio/pressure/bmp280-spi.o
  CC      drivers/iio/temperature/ltc2983.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_ring.o
  CC      drivers/iio/test/iio-test-rescale.o
  CC      drivers/iio/light/opt3001.o
  CC      drivers/iio/light/pa12203001.o
  CC      drivers/iio/proximity/ping.o
  AR      drivers/iio/potentiometer/built-in.a
  CC      drivers/fpga/dfl-pci.o
  CC      drivers/iio/temperature/hid-sensor-temperature.o
  CC      drivers/iio/pressure/dlhl60d.o
  CC      drivers/iio/pressure/dps310.o
  CC      drivers/iio/proximity/rfd77402.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.o
  CC      drivers/iio/test/iio-test-format.o
  CC      drivers/iio/pressure/cros_ec_baro.o
  CC      drivers/iio/light/rpr0521.o
  AR      drivers/fpga/built-in.a
  CC      drivers/iio/pressure/hid-sensor-press.o
  CC      drivers/iio/proximity/srf04.o
  CC      drivers/iio/temperature/maxim_thermocouple.o
  CC      drivers/iio/proximity/srf08.o
  AR      drivers/iio/test/built-in.a
  CC      drivers/iio/proximity/sx9310.o
  CC      drivers/iio/pressure/hp03.o
  CC      drivers/iio/proximity/sx9324.o
  CC      drivers/iio/proximity/sx9360.o
  CC      drivers/iio/trigger/iio-trig-hrtimer.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_aux.o
  CC      drivers/iio/light/tsl2563.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_magn.o
  CC      drivers/iio/temperature/max31856.o
  CC      drivers/iio/pressure/icp10100.o
  CC      drivers/iio/trigger/iio-trig-interrupt.o
  CC      drivers/iio/trigger/stm32-lptimer-trigger.o
  CC      drivers/iio/trigger/stm32-timer-trigger.o
  CC      drivers/iio/light/si1133.o
  CC      drivers/iio/proximity/sx_common.o
  CC      drivers/iio/proximity/sx9500.o
  CC      drivers/iio/temperature/max31865.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.o
  CC      drivers/iio/proximity/vcnl3020.o
  CC      drivers/iio/pressure/mpl115.o
  CC      drivers/iio/temperature/mlx90614.o
  CC      drivers/iio/trigger/iio-trig-sysfs.o
  CC      drivers/iio/light/si1145.o
  CC      drivers/iio/light/stk3310.o
  CC      drivers/iio/light/st_uvis25_core.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.o
  CC      drivers/iio/imu/inv_mpu6050/inv_mpu_spi.o
  CC      drivers/iio/pressure/mpl115_i2c.o
  CC      drivers/iio/proximity/vl53l0x-i2c.o
  CC      drivers/iio/temperature/mlx90632.o
  CC      drivers/iio/trigger/iio-trig-loop.o
  CC      drivers/iio/temperature/tmp006.o
  CC      drivers/iio/temperature/tmp007.o
  CC      drivers/iio/temperature/tmp117.o
  CC      drivers/iio/light/st_uvis25_i2c.o
  CC      drivers/iio/pressure/mpl115_spi.o
  AR      drivers/iio/trigger/built-in.a
  CC      drivers/iio/pressure/mpl3115.o
  AR      drivers/iio/proximity/built-in.a
  CC      drivers/iio/light/st_uvis25_spi.o
  AR      drivers/iio/imu/inv_mpu6050/built-in.a
  CC      drivers/iio/imu/kmx61.o
  CC      drivers/iio/light/tcs3414.o
  CC      drivers/iio/light/tcs3472.o
  CC      drivers/iio/light/tsl2583.o
  CC      drivers/iio/temperature/tsys01.o
  CC      drivers/iio/temperature/tsys02d.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.o
  CC      drivers/iio/pressure/ms5611_core.o
  CC      drivers/interconnect/core.o
  CC      drivers/iio/pressure/ms5611_i2c.o
  CC      drivers/interconnect/bulk.o
  CC      drivers/iio/light/tsl2591.o
  AR      drivers/iio/temperature/built-in.a
  CC      drivers/iio/pressure/ms5611_spi.o
  CC      drivers/most/core.o
  CC      drivers/interconnect/imx/imx.o
  CC      drivers/peci/core.o
  CC      drivers/hte/hte.o
  CC      drivers/counter/counter-core.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.o
  AR      drivers/hte/built-in.a
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.o
  CC      drivers/iio/pressure/ms5637.o
  CC      drivers/interconnect/imx/imx8mm.o
  CC      drivers/iio/light/tsl2772.o
  CC      drivers/peci/request.o
  CC      drivers/counter/counter-sysfs.o
  CC      drivers/most/configfs.o
  CC      drivers/counter/counter-chrdev.o
  CC      drivers/interconnect/imx/imx8mq.o
  CC      drivers/iio/pressure/st_pressure_core.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.o
  CC      drivers/interconnect/imx/imx8mn.o
  CC      drivers/peci/device.o
  CC      drivers/most/most_usb.o
  CC      drivers/iio/light/tsl4531.o
  CC      drivers/peci/sysfs.o
  CC      drivers/interconnect/imx/imx8mp.o
  CC      drivers/peci/cpu.o
  CC      drivers/counter/104-quad-8.o
  CC      drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.o
  CC      drivers/iio/pressure/st_pressure_buffer.o
  CC      drivers/iio/pressure/t5403.o
  CC      drivers/iio/pressure/hp206c.o
  AR      drivers/interconnect/imx/built-in.a
  CC      drivers/interconnect/samsung/exynos.o
  CC      drivers/peci/controller/peci-aspeed.o
  CC      drivers/iio/light/us5182d.o
  CC      drivers/counter/interrupt-cnt.o
  AR      drivers/iio/imu/st_lsm6dsx/built-in.a
  AR      drivers/iio/imu/built-in.a
  CC      drivers/iio/light/vcnl4000.o
  CC      drivers/iio/light/vcnl4035.o
  CC      drivers/most/most_cdev.o
  CC      drivers/iio/light/veml6030.o
  CC      drivers/iio/pressure/zpa2326.o
  AR      drivers/interconnect/samsung/built-in.a
  AR      drivers/peci/controller/built-in.a
  AR      drivers/interconnect/built-in.a
  AR      drivers/peci/built-in.a
  CC      drivers/iio/light/veml6070.o
  CC      drivers/iio/light/vl6180.o
  CC      drivers/most/most_snd.o
  CC      drivers/counter/stm32-timer-cnt.o
  CC      drivers/iio/pressure/zpa2326_i2c.o
  CC      drivers/iio/light/zopt2201.o
  CC      drivers/counter/stm32-lptimer-cnt.o
  CC      drivers/counter/ti-eqep.o
  CC      drivers/iio/pressure/zpa2326_spi.o
  CC      drivers/counter/ftm-quaddec.o
  CC      drivers/counter/microchip-tcb-capture.o
  AR      drivers/most/built-in.a
  CC      drivers/counter/intel-qep.o
  CC      drivers/counter/ti-ecap-capture.o
  CC      drivers/iio/pressure/st_pressure_i2c.o
  CC      drivers/iio/pressure/st_pressure_spi.o
  AR      drivers/iio/light/built-in.a
  AR      drivers/iio/pressure/built-in.a
  AR      drivers/iio/built-in.a
  AR      drivers/counter/built-in.a
  AR      drivers/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
Killed
make[2]: *** [../scripts/Makefile.vmlinux_o:61: vmlinux.o] Error 137
make[2]: *** Deleting file 'vmlinux.o'
make[1]: *** [/var/lib/jenkins/workspace/linux-media/Makefile:1229: vmlinux_o] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
make: *** [Makefile:231: __sub-make] Error 2
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
