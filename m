Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F47496086
	for <lists+linux-media@lfdr.de>; Fri, 21 Jan 2022 15:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380989AbiAUOMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 09:12:38 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36736 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1380987AbiAUOMh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 09:12:37 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nAuea-001cUl-Dr; Fri, 21 Jan 2022 14:12:36 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nAueY-00AKAc-H1; Fri, 21 Jan 2022 14:12:34 +0000
Date:   Fri, 21 Jan 2022 14:12:33 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1682432619.0.1642774353901@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #266
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

See <https://builder.linuxtv.org/job/linux-media/266/display/redirect>

Changes:


------------------------------------------
[...truncated 22782 lines...]
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_core.o
  CC      drivers/iio/pressure/st_pressure_core.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_pwr_seq.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalPhyRf.o
  CC      drivers/iio/pressure/st_pressure_buffer.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.o
  CC      drivers/iio/light/vcnl4000.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm.o
  CC      drivers/iio/pressure/t5403.o
  CC      drivers/iio/pressure/hp206c.o
  CC [M]  drivers/staging/r8188eu/hal/odm_debug.o
  CC      drivers/iio/pressure/zpa2326.o
  CC      drivers/iio/pressure/zpa2326_i2c.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_dm.o
  CC      drivers/iio/light/vcnl4035.o
  CC      drivers/iio/pressure/zpa2326_spi.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_CfoTracking.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DIG.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.o
  CC      drivers/iio/light/veml6030.o
  CC      drivers/iio/light/veml6070.o
  CC      drivers/iio/pressure/st_pressure_i2c.o
  CC      drivers/iio/light/vl6180.o
  CC      drivers/iio/light/zopt2201.o
  CC [M]  drivers/staging/r8188eu/hal/odm_interface.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_eeprom.o
  CC [M]  drivers/staging/r8188eu/hal/odm_HWConfig.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.o
  CC      drivers/iio/pressure/st_pressure_spi.o
  CC [M]  drivers/staging/r8188eu/hal/odm_RegConfig8188E.o
  AR      drivers/iio/light/built-in.a
  CC [M]  drivers/staging/r8188eu/hal/odm_RTL8188E.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_cmd.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_ethtool.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_dm.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_HWConfig.o
  AR      drivers/iio/pressure/built-in.a
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_hal_init.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_phycfg.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_pci.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_rf6052.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_rxdesc.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.o
  CC [M]  drivers/staging/vt6655/device_main.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_sreset.o
  CC [M]  drivers/staging/vt6655/card.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_pm.o
  CC      drivers/iio/proximity/as3935.o
  CC      drivers/iio/proximity/cros_ec_mkbp_proximity.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_ps.o
  CC [M]  drivers/staging/vt6656/main_usb.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_xmit.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188eu_led.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188eu_recv.o
  CC      drivers/iio/proximity/isl29501.o
  CC      drivers/iio/proximity/pulsedlight-lidar-lite-v2.o
  CC [M]  drivers/staging/vt6655/channel.o
  CC [M]  drivers/staging/vt6656/card.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_wx.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_dm.o
  CC [M]  drivers/staging/vt6655/mac.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188eu_xmit.o
  CC      drivers/iio/proximity/mb1232.o
  CC      drivers/iio/proximity/ping.o
  CC [M]  drivers/staging/vt6656/mac.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.o
  CC [M]  drivers/staging/vt6655/baseband.o
  CC      drivers/iio/proximity/rfd77402.o
  CC [M]  drivers/staging/r8188eu/hal/usb_halinit.o
  CC      drivers/iio/proximity/srf04.o
  LD [M]  drivers/staging/rtl8192e/rtl8192e/r8192e_pci.o
  CC [M]  drivers/staging/r8188eu/hal/usb_ops_linux.o
  LD [M]  drivers/staging/rtl8192e/rtllib.o
  CC [M]  drivers/staging/r8188eu/os_dep/ioctl_linux.o
  CC [M]  drivers/staging/r8188eu/os_dep/mlme_linux.o
  CC [M]  drivers/staging/r8188eu/os_dep/os_intfs.o
  CC      drivers/iio/proximity/srf08.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.o
  CC [M]  drivers/staging/r8188eu/os_dep/osdep_service.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723bs_recv.o
  CC [M]  drivers/staging/vt6656/baseband.o
  CC [M]  drivers/staging/vt6655/rxtx.o
  CC [M]  drivers/staging/r8188eu/os_dep/recv_linux.o
  CC      drivers/iio/proximity/sx9310.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.o
  CC [M]  drivers/staging/r8188eu/os_dep/usb_intf.o
  CC [M]  drivers/staging/rtl8723bs/hal/sdio_halinit.o
  CC [M]  drivers/staging/r8188eu/os_dep/usb_ops_linux.o
  CC [M]  drivers/staging/vt6656/wcmd.o
  CC [M]  drivers/staging/r8188eu/os_dep/xmit_linux.o
  CC [M]  drivers/staging/vt6655/dpc.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ap.o
  CC      drivers/iio/proximity/sx9500.o
  CC [M]  drivers/staging/rtl8723bs/hal/sdio_ops.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.o
  CC      drivers/iio/proximity/vcnl3020.o
  CC [M]  drivers/staging/r8188eu/core/rtw_br_ext.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.o
  CC [M]  drivers/staging/vt6656/rxtx.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.o
  CC [M]  drivers/staging/vt6655/power.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.o
  CC      drivers/iio/proximity/vl53l0x-i2c.o
  CC [M]  drivers/staging/r8188eu/core/rtw_cmd.o
  CC [M]  drivers/staging/vt6655/srom.o
  CC [M]  drivers/staging/vt6656/power.o
  CC [M]  drivers/staging/vt6656/key.o
  CC [M]  drivers/staging/vt6656/rf.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.o
  CC [M]  drivers/staging/vt6656/usbpipe.o
  AR      drivers/iio/proximity/built-in.a
  CC [M]  drivers/staging/vt6655/key.o
  CC [M]  drivers/staging/r8188eu/core/rtw_efuse.o
  CC [M]  drivers/staging/vt6656/channel.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/ioctl_linux.o
  CC      drivers/iio/resolver/ad2s90.o
  CC      drivers/iio/resolver/ad2s1200.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/mlme_linux.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/osdep_service.o
  CC [M]  drivers/staging/vt6655/rf.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ieee80211.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/os_intfs.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/recv_linux.o
  AR      drivers/iio/resolver/built-in.a
  CC [M]  drivers/staging/rtl8723bs/os_dep/sdio_intf.o
  LD [M]  drivers/staging/vt6656/vt6656_stage.o
  LD [M]  drivers/staging/vt6655/vt6655_stage.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.o
  CC      drivers/iio/test/iio-test-format.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/wifi_regd.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/xmit_linux.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ioctl_set.o
  CC      drivers/iio/trigger/iio-trig-hrtimer.o
  CC      drivers/iio/trigger/iio-trig-interrupt.o
  CC [M]  drivers/staging/gdm724x/gdm_lte.o
  CC      drivers/iio/temperature/iqs620at-temp.o
  AR      drivers/iio/test/built-in.a
  CC      drivers/iio/temperature/ltc2983.o
  CC      drivers/iio/temperature/hid-sensor-temperature.o
  CC      drivers/iio/trigger/stm32-lptimer-trigger.o
  CC [M]  drivers/staging/r8188eu/core/rtw_iol.o
  CC [M]  drivers/staging/r8188eu/core/rtw_led.o
  LD [M]  drivers/staging/rtl8723bs/r8723bs.o
  CC [M]  drivers/staging/r8188eu/core/rtw_mlme.o
  CC [M]  drivers/staging/r8188eu/core/rtw_mlme_ext.o
  CC      drivers/iio/temperature/maxim_thermocouple.o
  CC [M]  drivers/staging/gdm724x/netlink_k.o
  CC      drivers/iio/trigger/stm32-timer-trigger.o
  CC      drivers/iio/trigger/iio-trig-sysfs.o
  CC      drivers/iio/trigger/iio-trig-loop.o
  CC [M]  drivers/staging/gdm724x/gdm_usb.o
  AR      drivers/staging/built-in.a
  CC [M]  drivers/staging/gdm724x/gdm_endian.o
  CC      drivers/iio/temperature/max31856.o
  CC [M]  drivers/staging/r8188eu/core/rtw_pwrctrl.o
  CC [M]  drivers/staging/gdm724x/gdm_tty.o
  CC [M]  drivers/staging/gdm724x/gdm_mux.o
  CC      drivers/iio/temperature/max31865.o
  CC [M]  drivers/staging/r8188eu/core/rtw_p2p.o
  CC      drivers/iio/temperature/mlx90614.o
  AR      drivers/iio/trigger/built-in.a
  CC      drivers/iio/temperature/mlx90632.o
  CC [M]  drivers/staging/r8188eu/core/rtw_recv.o
  LD [M]  drivers/staging/gdm724x/gdmulte.o
  LD [M]  drivers/staging/gdm724x/gdmtty.o
  CC      drivers/iio/temperature/tmp006.o
  CC      drivers/iio/temperature/tmp007.o
  CC      drivers/iio/temperature/tmp117.o
  CC      drivers/iio/temperature/tsys01.o
  CC      drivers/iio/temperature/tsys02d.o
  CC [M]  drivers/staging/r8188eu/core/rtw_rf.o
  CC [M]  drivers/staging/r8188eu/core/rtw_security.o
  CC [M]  drivers/staging/r8188eu/core/rtw_sta_mgt.o
  CC [M]  drivers/staging/r8188eu/core/rtw_wlan_util.o
  CC [M]  drivers/staging/r8188eu/core/rtw_xmit.o
  AR      drivers/iio/temperature/built-in.a
  AR      drivers/iio/built-in.a
  LD [M]  drivers/staging/r8188eu/r8188eu.o
  AR      drivers/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  LD [M]  kernel/kheaders.ko
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
+ make O=x86_64_yes allyesconfig
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
  GEN     Makefile
#
# configuration written to .config
#
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
+ ./scripts/config --file x86_64_yes/.config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS
+ make O=x86_64_yes -j9
make[1]: Entering directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  DESCEND objtool
  CALL    ../scripts/atomic/check-atomics.sh
  CALL    ../scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     kernel/kheaders_data.tar.xz
  GEN     kernel/kheaders_data.tar.xz
  CC      kernel/kheaders.o
  AR      kernel/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  OBJTOOL vmlinux.o
Killed
make[1]: *** [/var/lib/jenkins/workspace/linux-media@2/Makefile:1161: vmlinux] Error 137
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
make: *** [Makefile:219: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch arm/aarch64 (builtin)
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
