Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE255F8AAE
	for <lists+linux-media@lfdr.de>; Sun,  9 Oct 2022 12:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbiJIKg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 06:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbiJIKf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 06:35:59 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1CE8248F1
        for <linux-media@vger.kernel.org>; Sun,  9 Oct 2022 03:35:06 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ohTeB-002YWH-JI; Sun, 09 Oct 2022 10:35:03 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ohTe8-00FOxO-Jn; Sun, 09 Oct 2022 10:35:00 +0000
Date:   Sun, 9 Oct 2022 10:34:58 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <608148551.0.1665311699951@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #295
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

See <https://builder.linuxtv.org/job/linux-media/295/display/redirect>

Changes:


------------------------------------------
[...truncated 98194 lines...]
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_dm.o
  CC      drivers/staging/fbtft/fb_tls8204.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DIG.o
  CC [M]  drivers/staging/rtl8192e/rtl819x_BAProc.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.o
  CC [M]  drivers/staging/rtl8192e/rtl819x_HTProc.o
  CC [M]  drivers/staging/rtl8192e/rtl819x_TSProc.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_hal_init.o
  CC      drivers/staging/fbtft/fb_uc1611.o
  CC [M]  drivers/staging/rtl8192e/rtllib_crypt_ccmp.o
  CC [M]  drivers/staging/rtl8192e/rtllib_crypt_tkip.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/dot11d.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_HWConfig.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.o
  LD [M]  drivers/staging/rtl8192u/r8192u_usb.o
  CC [M]  drivers/staging/rtl8192e/rtllib_crypt_wep.o
  CC      drivers/staging/fbtft/fb_uc1701.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_phycfg.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_dm.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.o
  CC      drivers/staging/fbtft/fb_upd161704.o
  LD [M]  drivers/staging/rtl8192e/rtllib.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_rf6052.o
  CC [M]  drivers/staging/vt6655/device_main.o
  CC [M]  drivers/staging/vt6655/card.o
  CC [M]  drivers/staging/vt6655/channel.o
  CC [M]  drivers/staging/vt6655/mac.o
  CC [M]  drivers/staging/vt6655/baseband.o
  CC [M]  drivers/staging/vt6655/rxtx.o
  AR      drivers/staging/fbtft/built-in.a
  CC [M]  drivers/staging/vt6656/main_usb.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_rxdesc.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723bs_recv.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.o
  CC [M]  drivers/staging/rtl8723bs/hal/sdio_halinit.o
  CC [M]  drivers/staging/rtl8723bs/hal/sdio_ops.o
  CC [M]  drivers/staging/vt6655/dpc.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_xmit.o
  CC [M]  drivers/staging/vt6655/power.o
  CC [M]  drivers/staging/vt6655/srom.o
  CC [M]  drivers/staging/vt6656/card.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188eu_recv.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.o
  CC [M]  drivers/staging/vt6655/key.o
  CC [M]  drivers/staging/vt6655/rf.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188eu_xmit.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.o
  CC [M]  drivers/staging/r8188eu/hal/usb_halinit.o
  CC [M]  drivers/staging/vt6656/mac.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.o
  CC [M]  drivers/staging/r8188eu/hal/usb_ops_linux.o
  CC [M]  drivers/staging/r8188eu/os_dep/ioctl_linux.o
  LD [M]  drivers/staging/vt6655/vt6655_stage.o
  CC [M]  drivers/staging/r8188eu/os_dep/mlme_linux.o
  CC [M]  drivers/staging/r8188eu/os_dep/os_intfs.o
  CC [M]  drivers/staging/r8188eu/os_dep/osdep_service.o
  CC [M]  drivers/staging/r8188eu/os_dep/recv_linux.o
  CC [M]  drivers/staging/r8188eu/os_dep/usb_intf.o
  CC [M]  drivers/staging/r8188eu/os_dep/usb_ops_linux.o
  CC [M]  drivers/staging/r8188eu/os_dep/xmit_linux.o
  CC [M]  drivers/staging/vt6656/baseband.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ap.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/ioctl_linux.o
  CC [M]  drivers/staging/r8188eu/core/rtw_br_ext.o
  CC [M]  drivers/staging/r8188eu/core/rtw_cmd.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/mlme_linux.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/osdep_service.o
  CC [M]  drivers/staging/r8188eu/core/rtw_efuse.o
  CC [M]  drivers/staging/vt6656/wcmd.o
  CC [M]  drivers/staging/vt6656/rxtx.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/os_intfs.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/recv_linux.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/sdio_intf.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.o
  CC [M]  drivers/staging/r8188eu/core/rtw_fw.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/wifi_regd.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ieee80211.o
  CC [M]  drivers/staging/vt6656/power.o
  CC [M]  drivers/staging/vt6656/key.o
  CC      drivers/fpga/fpga-mgr.o
  CC [M]  drivers/staging/vt6656/rf.o
  CC [M]  drivers/staging/gdm724x/gdm_lte.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ioctl_set.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/xmit_linux.o
  CC      drivers/fpga/altera-cvp.o
  CC [M]  drivers/staging/r8188eu/core/rtw_iol.o
  AR      drivers/staging/built-in.a
  CC [M]  drivers/staging/gdm724x/netlink_k.o
  CC [M]  drivers/staging/vt6656/usbpipe.o
  CC [M]  drivers/staging/r8188eu/core/rtw_led.o
  CC [M]  drivers/staging/r8188eu/core/rtw_mlme.o
  CC [M]  drivers/staging/r8188eu/core/rtw_mlme_ext.o
  CC      drivers/fpga/altera-ps-spi.o
  CC [M]  drivers/staging/gdm724x/gdm_usb.o
  CC [M]  drivers/staging/gdm724x/gdm_endian.o
  CC [M]  drivers/staging/r8188eu/core/rtw_pwrctrl.o
  CC [M]  drivers/staging/vt6656/channel.o
  CC [M]  drivers/staging/r8188eu/core/rtw_p2p.o
  LD [M]  drivers/staging/rtl8723bs/r8723bs.o
  CC [M]  drivers/staging/gdm724x/gdm_tty.o
  CC      drivers/fpga/ice40-spi.o
  CC      drivers/fpga/machxo2-spi.o
  CC [M]  drivers/staging/r8188eu/core/rtw_recv.o
  CC      drivers/fpga/socfpga.o
  CC [M]  drivers/staging/gdm724x/gdm_mux.o
  CC [M]  drivers/staging/r8188eu/core/rtw_rf.o
  LD [M]  drivers/staging/gdm724x/gdmulte.o
  CC      drivers/fpga/socfpga-a10.o
  LD [M]  drivers/staging/vt6656/vt6656_stage.o
  CC      drivers/fpga/xilinx-spi.o
  CC [M]  drivers/staging/r8188eu/core/rtw_security.o
  CC      drivers/fpga/zynq-fpga.o
  CC [M]  drivers/staging/r8188eu/core/rtw_sta_mgt.o
  CC [M]  drivers/staging/r8188eu/core/rtw_wlan_util.o
  CC      drivers/fpga/zynqmp-fpga.o
  CC [M]  drivers/staging/r8188eu/core/rtw_xmit.o
  CC      drivers/fpga/versal-fpga.o
  CC      drivers/fpga/microchip-spi.o
  LD [M]  drivers/staging/gdm724x/gdmtty.o
  CC      drivers/fpga/altera-pr-ip-core.o
  CC      drivers/fpga/altera-pr-ip-core-plat.o
  CC      drivers/fpga/intel-m10-bmc-sec-update.o
  CC      drivers/fpga/fpga-bridge.o
  CC      drivers/fpga/altera-freeze-bridge.o
  CC      drivers/fpga/xilinx-pr-decoupler.o
  CC      drivers/fpga/fpga-region.o
  CC      drivers/fsi/fsi-core.o
  LD [M]  drivers/staging/r8188eu/r8188eu.o
  CC      drivers/fsi/fsi-master-hub.o
  CC      drivers/fsi/fsi-master-aspeed.o
  CC      drivers/fsi/fsi-master-gpio.o
  CC      drivers/fsi/fsi-master-ast-cf.o
  CC      drivers/fpga/of-fpga-region.o
  CC      drivers/mux/core.o
  CC      drivers/tee/amdtee/core.o
  CC      drivers/mux/adg792a.o
  CC      drivers/mux/adgs1408.o
  CC      drivers/mux/gpio.o
  CC      drivers/fpga/dfl.o
  CC      drivers/fpga/dfl-fme-main.o
  CC      drivers/fpga/dfl-fme-pr.o
  CC      drivers/tee/amdtee/call.o
  CC      drivers/fpga/dfl-fme-error.o
  CC      drivers/fsi/fsi-scom.o
  CC      drivers/fsi/fsi-sbefifo.o
  CC      drivers/fsi/fsi-occ.o
  CC      drivers/mux/mmio.o
  CC      drivers/fpga/dfl-fme-perf.o
  CC      drivers/fpga/dfl-fme-mgr.o
  CC      drivers/tee/amdtee/shm_pool.o
  CC      drivers/fpga/dfl-fme-br.o
  CC      drivers/fpga/dfl-fme-region.o
  CC      drivers/fpga/dfl-afu-main.o
  CC      drivers/fpga/dfl-afu-region.o
  AR      drivers/fsi/built-in.a
  AR      drivers/mux/built-in.a
  CC      drivers/siox/siox-core.o
  CC      drivers/gnss/core.o
  AR      drivers/tee/amdtee/built-in.a
  CC      drivers/tee/tee_core.o
  CC      drivers/gnss/serial.o
  CC      drivers/gnss/mtk.o
  CC      drivers/fpga/dfl-afu-dma-region.o
  CC      drivers/tee/tee_shm.o
  CC      drivers/gnss/sirf.o
  CC      drivers/gnss/ubx.o
  CC      drivers/siox/siox-bus-gpio.o
  CC      drivers/fpga/dfl-afu-error.o
  CC      drivers/gnss/usb.o
  CC      drivers/fpga/dfl-n3000-nios.o
  CC      drivers/tee/tee_shm_pool.o
  AR      drivers/siox/built-in.a
  CC      drivers/fpga/dfl-pci.o
  CC      drivers/counter/counter-core.o
  CC      drivers/interconnect/imx/imx.o
  CC      drivers/interconnect/samsung/exynos.o
  CC      drivers/interconnect/imx/imx8mm.o
  CC      drivers/counter/counter-sysfs.o
  AR      drivers/gnss/built-in.a
  CC      drivers/counter/counter-chrdev.o
  AR      drivers/tee/built-in.a
  CC      drivers/counter/104-quad-8.o
  CC      drivers/counter/interrupt-cnt.o
  CC      drivers/most/core.o
  AR      drivers/interconnect/samsung/built-in.a
  CC      drivers/interconnect/core.o
  CC      drivers/interconnect/imx/imx8mq.o
  CC      drivers/interconnect/imx/imx8mn.o
  CC      drivers/interconnect/imx/imx8mp.o
  AR      drivers/fpga/built-in.a
  CC      drivers/counter/stm32-timer-cnt.o
  CC      drivers/peci/controller/peci-aspeed.o
  CC      drivers/counter/stm32-lptimer-cnt.o
  CC      drivers/interconnect/bulk.o
  CC      drivers/counter/ti-eqep.o
  AR      drivers/interconnect/imx/built-in.a
  CC      drivers/hte/hte.o
  CC      drivers/counter/ftm-quaddec.o
  CC      drivers/most/configfs.o
  CC      drivers/most/most_usb.o
  CC      drivers/most/most_cdev.o
  AR      drivers/interconnect/built-in.a
  AR      drivers/peci/controller/built-in.a
  CC      drivers/most/most_snd.o
  CC      drivers/peci/core.o
  AR      drivers/hte/built-in.a
  CC      drivers/counter/microchip-tcb-capture.o
  CC      drivers/peci/request.o
  CC      drivers/counter/intel-qep.o
  CC      drivers/peci/device.o
  CC      drivers/peci/sysfs.o
  CC      drivers/peci/cpu.o
  AR      drivers/most/built-in.a
  AR      drivers/counter/built-in.a
  AR      drivers/peci/built-in.a
  AR      drivers/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
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
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] step
