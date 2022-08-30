Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7831D5A6BE5
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 20:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbiH3SRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 14:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbiH3SRE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 14:17:04 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6174CA33
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 11:17:02 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oT558-005qxi-0V; Tue, 30 Aug 2022 17:31:22 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oT54w-00CdCw-3I; Tue, 30 Aug 2022 17:31:11 +0000
Date:   Tue, 30 Aug 2022 17:31:07 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1425823412.0.1661880668375@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #290
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

See <https://builder.linuxtv.org/job/linux-media/290/display/redirect>

Changes:


------------------------------------------
[...truncated 119293 lines...]
  CC      drivers/nvmem/qcom-spmi-sdam.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_phycfg.o
  CC      drivers/fpga/zynq-fpga.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_rf6052.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_sta_mgt.o
  AR      drivers/fsi/built-in.a
  CC [M]  drivers/staging/vt6655/channel.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_wlan_util.o
  CC      drivers/mux/gpio.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_xmit.o
  CC      drivers/nvmem/rockchip-efuse.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_rxdesc.o
  CC [M]  drivers/staging/gdm724x/gdm_lte.o
  CC [M]  drivers/staging/vt6655/mac.o
  CC [M]  drivers/staging/vt6655/baseband.o
  CC      drivers/fpga/zynqmp-fpga.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_xmit.o
  CC [M]  drivers/staging/vt6656/main_usb.o
  CC      drivers/mux/mmio.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_intf.o
  CC [M]  drivers/staging/vt6656/card.o
  CC [M]  drivers/staging/vt6655/rxtx.o
  CC      drivers/nvmem/rockchip-otp.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188eu_recv.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188eu_xmit.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_com.o
  CC [M]  drivers/staging/vt6656/mac.o
  CC      drivers/fpga/versal-fpga.o
  AR      drivers/mux/built-in.a
  CC [M]  drivers/staging/rtl8723bs/hal/hal_com_phycfg.o
  CC [M]  drivers/staging/vt6655/dpc.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_btcoex.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_sdio.o
  CC [M]  drivers/staging/r8188eu/hal/usb_halinit.o
  CC      drivers/nvmem/stm32-romem.o
  CC [M]  drivers/staging/gdm724x/netlink_k.o
  CC [M]  drivers/staging/vt6656/baseband.o
  CC [M]  drivers/staging/vt6656/wcmd.o
  CC [M]  drivers/staging/r8188eu/hal/usb_ops_linux.o
  CC [M]  drivers/staging/vt6655/power.o
  CC [M]  drivers/staging/r8188eu/os_dep/ioctl_linux.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_pwr_seq.o
  CC      drivers/nvmem/uniphier-efuse.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalPhyRf.o
  CC [M]  drivers/staging/vt6655/srom.o
  CC [M]  drivers/staging/vt6656/rxtx.o
  CC      drivers/fpga/altera-pr-ip-core.o
  CC [M]  drivers/staging/vt6656/power.o
  CC [M]  drivers/staging/r8188eu/os_dep/mlme_linux.o
  CC [M]  drivers/staging/r8188eu/os_dep/os_intfs.o
  CC [M]  drivers/staging/gdm724x/gdm_usb.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.o
  CC [M]  drivers/staging/r8188eu/os_dep/osdep_service.o
  CC [M]  drivers/staging/vt6656/key.o
  CC [M]  drivers/staging/vt6655/key.o
  CC      drivers/nvmem/vf610-ocotp.o
  CC      drivers/nvmem/meson-mx-efuse.o
  CC      drivers/fpga/altera-pr-ip-core-plat.o
  CC      drivers/nvmem/snvs_lpgpr.o
  CC [M]  drivers/staging/gdm724x/gdm_endian.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm.o
  CC [M]  drivers/staging/r8188eu/os_dep/recv_linux.o
  CC [M]  drivers/staging/vt6655/rf.o
  CC [M]  drivers/staging/vt6656/rf.o
  CC [M]  drivers/staging/gdm724x/gdm_tty.o
  CC      drivers/fpga/fpga-bridge.o
  CC [M]  drivers/staging/gdm724x/gdm_mux.o
  CC [M]  drivers/staging/vt6656/usbpipe.o
  CC [M]  drivers/staging/r8188eu/os_dep/usb_intf.o
  CC      drivers/nvmem/rave-sp-eeprom.o
  CC      drivers/fpga/altera-freeze-bridge.o
  LD [M]  drivers/staging/vt6655/vt6655_stage.o
  CC      drivers/fpga/xilinx-pr-decoupler.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_CfoTracking.o
  CC [M]  drivers/staging/vt6656/channel.o
  LD [M]  drivers/staging/gdm724x/gdmulte.o
  LD [M]  drivers/staging/gdm724x/gdmtty.o
  AR      drivers/staging/built-in.a
  CC      drivers/fpga/fpga-region.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DIG.o
  CC      drivers/nvmem/sc27xx-efuse.o
  CC [M]  drivers/staging/r8188eu/os_dep/usb_ops_linux.o
  CC      drivers/fpga/of-fpga-region.o
  LD [M]  drivers/staging/vt6656/vt6656_stage.o
  CC      drivers/nvmem/sprd-efuse.o
  CC [M]  drivers/staging/r8188eu/os_dep/xmit_linux.o
  CC      drivers/siox/siox-core.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ap.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.o
  CC      drivers/fpga/dfl.o
  CC      drivers/nvmem/rmem.o
  CC      drivers/siox/siox-bus-gpio.o
  CC      drivers/nvmem/brcm_nvram.o
  CC      drivers/nvmem/layerscape-sfp.o
  CC [M]  drivers/staging/r8188eu/core/rtw_br_ext.o
  CC [M]  drivers/staging/r8188eu/core/rtw_cmd.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_HWConfig.o
  AR      drivers/siox/built-in.a
  CC [M]  drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.o
  CC      drivers/nvmem/sunplus-ocotp.o
  CC      drivers/nvmem/apple-efuses.o
  CC      drivers/fpga/dfl-fme-main.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.o
  CC      drivers/fpga/dfl-fme-pr.o
  CC      drivers/fpga/dfl-fme-error.o
  CC      drivers/gnss/core.o
  CC      drivers/fpga/dfl-fme-perf.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.o
  CC      drivers/fpga/dfl-fme-mgr.o
  CC      drivers/nvmem/microchip-otpc.o
  CC [M]  drivers/staging/r8188eu/core/rtw_efuse.o
  CC [M]  drivers/staging/r8188eu/core/rtw_fw.o
  CC      drivers/fpga/dfl-fme-br.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_dm.o
  CC      drivers/gnss/serial.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ieee80211.o
  CC      drivers/fpga/dfl-fme-region.o
  CC      drivers/fpga/dfl-afu-main.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ioctl_set.o
  AR      drivers/nvmem/built-in.a
  CC [M]  drivers/staging/r8188eu/core/rtw_iol.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.o
  CC [M]  drivers/staging/r8188eu/core/rtw_led.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.o
  CC [M]  drivers/staging/r8188eu/core/rtw_mlme.o
  CC      drivers/fpga/dfl-afu-region.o
  CC      drivers/fpga/dfl-afu-dma-region.o
  CC      drivers/gnss/mtk.o
  CC [M]  drivers/staging/r8188eu/core/rtw_mlme_ext.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.o
  CC [M]  drivers/staging/r8188eu/core/rtw_pwrctrl.o
  CC      drivers/gnss/sirf.o
  CC      drivers/gnss/ubx.o
  CC      drivers/fpga/dfl-afu-error.o
  CC [M]  drivers/staging/r8188eu/core/rtw_p2p.o
  CC      drivers/fpga/dfl-n3000-nios.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.o
  CC [M]  drivers/staging/r8188eu/core/rtw_recv.o
  CC      drivers/fpga/dfl-pci.o
  CC [M]  drivers/staging/r8188eu/core/rtw_rf.o
  CC      drivers/fpga/microchip-spi.o
  CC      drivers/fpga/intel-m10-bmc-sec-update.o
  CC      drivers/gnss/usb.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723bs_recv.o
  CC [M]  drivers/staging/r8188eu/core/rtw_security.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.o
  CC      drivers/interconnect/core.o
  CC [M]  drivers/staging/rtl8723bs/hal/sdio_halinit.o
  CC      drivers/interconnect/bulk.o
  CC [M]  drivers/staging/r8188eu/core/rtw_sta_mgt.o
  CC [M]  drivers/staging/rtl8723bs/hal/sdio_ops.o
  AR      drivers/fpga/built-in.a
  CC      drivers/interconnect/imx/imx.o
  CC      drivers/interconnect/samsung/exynos.o
  AR      drivers/gnss/built-in.a
  CC      drivers/interconnect/imx/imx8mm.o
  CC      drivers/interconnect/imx/imx8mq.o
  CC      drivers/interconnect/imx/imx8mn.o
  CC      drivers/most/core.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.o
  CC      drivers/counter/counter-core.o
  CC [M]  drivers/staging/r8188eu/core/rtw_wlan_util.o
  CC [M]  drivers/staging/r8188eu/core/rtw_xmit.o
  CC      drivers/most/configfs.o
  CC      drivers/most/most_usb.o
  CC      drivers/interconnect/imx/imx8mp.o
  AR      drivers/interconnect/samsung/built-in.a
  CC [M]  drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.o
  CC      drivers/most/most_cdev.o
  CC      drivers/most/most_snd.o
  LD [M]  drivers/staging/r8188eu/r8188eu.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.o
  CC      drivers/counter/counter-sysfs.o
  CC      drivers/counter/counter-chrdev.o
  AR      drivers/interconnect/imx/built-in.a
  AR      drivers/interconnect/built-in.a
  CC      drivers/counter/104-quad-8.o
  CC      drivers/hte/hte.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.o
  CC      drivers/peci/core.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.o
  CC      drivers/peci/request.o
  AR      drivers/most/built-in.a
  CC      drivers/peci/device.o
  CC      drivers/counter/interrupt-cnt.o
  AR      drivers/hte/built-in.a
  CC      drivers/peci/sysfs.o
  CC      drivers/counter/stm32-timer-cnt.o
  CC      drivers/peci/cpu.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.o
  CC      drivers/counter/stm32-lptimer-cnt.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.o
  CC      drivers/peci/controller/peci-aspeed.o
  CC      drivers/counter/ti-eqep.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/ioctl_linux.o
  CC      drivers/counter/ftm-quaddec.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/mlme_linux.o
  CC      drivers/counter/microchip-tcb-capture.o
  CC      drivers/counter/intel-qep.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/osdep_service.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/os_intfs.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/recv_linux.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/sdio_intf.o
  AR      drivers/peci/controller/built-in.a
  AR      drivers/peci/built-in.a
  CC [M]  drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/wifi_regd.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/xmit_linux.o
  AR      drivers/counter/built-in.a
  LD [M]  drivers/staging/rtl8723bs/r8723bs.o
  AR      drivers/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
Killed
make[2]: *** [../scripts/Makefile.vmlinux_o:68: vmlinux.o] Error 137
make[2]: *** Deleting file 'vmlinux.o'
make[1]: *** [/var/lib/jenkins/workspace/linux-media/Makefile:1171: vmlinux] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_yes'
make: *** [Makefile:222: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch x86_64 (builtin/mod)
Killed
make[2]: *** [../scripts/Makefile.vmlinux_o:68: vmlinux.o] Error 137
make[2]: *** Deleting file 'vmlinux.o'
make[1]: *** [/var/lib/jenkins/workspace/linux-media@2/Makefile:1171: vmlinux] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media@2/arm_yes'
make: *** [Makefile:222: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch arm/aarch64 (builtin)
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] step
