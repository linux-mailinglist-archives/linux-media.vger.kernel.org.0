Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0EED450354
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 12:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbhKOLZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 06:25:14 -0500
Received: from www.linuxtv.org ([130.149.80.248]:52022 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231236AbhKOLZF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 06:25:05 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mma3p-00ED3x-Qb; Mon, 15 Nov 2021 11:22:05 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mma3n-006z3r-Uv; Mon, 15 Nov 2021 11:22:03 +0000
Date:   Mon, 15 Nov 2021 11:22:02 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <119059566.1.1636975323398@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #255
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

See <https://builder.linuxtv.org/job/linux-media/255/display/redirect>

Changes:


------------------------------------------
[...truncated 113056 lines...]
  CC [M]  drivers/staging/rtl8192u/r8192U_core.o
  CC      drivers/staging/fieldbus/anybuss/hms-profinet.o
  CC      drivers/staging/wfx/hwio.o
  CC [M]  drivers/staging/rtl8192e/rtllib_module.o
  AR      drivers/staging/fieldbus/anybuss/built-in.a
  AR      drivers/staging/fieldbus/built-in.a
  CC [M]  drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_ap.o
  CC [M]  drivers/staging/vt6656/main_usb.o
  CC [M]  drivers/staging/gdm724x/gdm_lte.o
  CC [M]  drivers/staging/vt6655/card.o
  CC      drivers/staging/qlge/qlge_mpi.o
  CC [M]  drivers/staging/r8188eu/hal/HalHWImg8188E_BB.o
  CC [M]  drivers/staging/rtl8192e/rtllib_rx.o
  CC      drivers/staging/wfx/fwio.o
  CC [M]  drivers/staging/rtl8192u/r8180_93cx6.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_btcoex.o
  CC [M]  drivers/staging/vt6655/channel.o
  CC [M]  drivers/staging/vt6656/card.o
  CC [M]  drivers/staging/r8188eu/hal/HalHWImg8188E_RF.o
  CC [M]  drivers/staging/gdm724x/netlink_k.o
  CC      drivers/staging/qlge/qlge_ethtool.o
  CC      drivers/staging/wfx/hif_tx_mib.o
  CC [M]  drivers/staging/r8188eu/hal/HalPhyRf_8188e.o
  CC [M]  drivers/staging/rtl8192u/r8192U_wx.o
  CC [M]  drivers/staging/vt6655/mac.o
  CC [M]  drivers/staging/vt6656/mac.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_cmd.o
  CC      drivers/staging/qlge/qlge_devlink.o
  CC [M]  drivers/staging/gdm724x/gdm_usb.o
  CC      drivers/staging/wfx/hif_tx.o
  CC [M]  drivers/staging/rtl8192e/rtllib_tx.o
  CC [M]  drivers/staging/r8188eu/hal/HalPwrSeqCmd.o
  AR      drivers/staging/qlge/built-in.a
  CC [M]  drivers/staging/rtl8192e/rtllib_wx.o
  CC [M]  drivers/staging/rtl8192u/r8190_rtl8256.o
  CC [M]  drivers/staging/vt6656/baseband.o
  CC [M]  drivers/staging/vt6655/baseband.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_debug.o
  CC [M]  drivers/staging/r8188eu/hal/Hal8188EPwrSeq.o
  CC [M]  drivers/staging/gdm724x/gdm_endian.o
  CC [M]  drivers/staging/rtl8192u/r819xU_phy.o
  CC [M]  drivers/staging/gdm724x/gdm_tty.o
  CC      drivers/staging/wfx/hif_rx.o
  CC [M]  drivers/staging/gdm724x/gdm_mux.o
  CC [M]  drivers/staging/rtl8192e/rtllib_softmac.o
  CC [M]  drivers/staging/rtl8192e/rtllib_softmac_wx.o
  LD [M]  drivers/staging/gdm724x/gdmulte.o
  LD [M]  drivers/staging/gdm724x/gdmtty.o
  CC [M]  drivers/staging/r8188eu/hal/Hal8188ERateAdaptive.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_efuse.o
  CC [M]  drivers/staging/vt6656/wcmd.o
  CC [M]  drivers/staging/vt6655/rxtx.o
  CC [M]  drivers/staging/vt6655/dpc.o
  CC [M]  drivers/staging/rtl8192u/r819xU_firmware.o
  CC      drivers/staging/wfx/queue.o
  CC [M]  drivers/staging/vt6655/power.o
  CC [M]  drivers/staging/vt6656/rxtx.o
  CC [M]  drivers/staging/rtl8192e/rtl819x_BAProc.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_io.o
  CC [M]  drivers/staging/r8188eu/hal/hal_intf.o
  CC [M]  drivers/staging/rtl8192e/rtl819x_HTProc.o
  CC [M]  drivers/staging/rtl8192u/r819xU_cmdpkt.o
  CC [M]  drivers/staging/rtl8192u/r8192U_dm.o
  CC [M]  drivers/staging/r8188eu/hal/hal_com.o
  CC      drivers/staging/wfx/data_tx.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_ioctl_set.o
  CC [M]  drivers/staging/vt6656/power.o
  CC [M]  drivers/staging/vt6656/key.o
  CC [M]  drivers/staging/vt6655/srom.o
  CC [M]  drivers/staging/rtl8192e/rtl819x_TSProc.o
  CC [M]  drivers/staging/vt6656/rf.o
  CC [M]  drivers/staging/r8188eu/hal/odm.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_ieee80211.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_mlme.o
  CC [M]  drivers/staging/rtl8192u/r819xU_firmware_img.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/ieee80211_crypt.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.o
  CC [M]  drivers/staging/vt6655/key.o
  CC [M]  drivers/staging/rtl8192e/rtllib_crypt_ccmp.o
  CC [M]  drivers/staging/vt6656/usbpipe.o
  CC      drivers/staging/wfx/data_rx.o
  CC [M]  drivers/staging/vt6655/rf.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_ccmp.o
  CC [M]  drivers/staging/r8188eu/hal/odm_debug.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_wep.o
  CC [M]  drivers/staging/rtl8192e/rtllib_crypt_tkip.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_mlme_ext.o
  CC [M]  drivers/staging/vt6656/channel.o
  CC [M]  drivers/staging/rtl8192e/rtllib_crypt_wep.o
  CC      drivers/staging/wfx/scan.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_odm.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/ieee80211_rx.o
  LD [M]  drivers/staging/vt6655/vt6655_stage.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.o
  CC [M]  drivers/staging/r8188eu/hal/odm_interface.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/ieee80211_tx.o
  LD [M]  drivers/staging/vt6656/vt6656_stage.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/ieee80211_wx.o
  CC [M]  drivers/staging/r8188eu/hal/odm_HWConfig.o
  CC      drivers/staging/wfx/sta.o
  CC      drivers/staging/wfx/key.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/r8192E_dev.o
  CC      drivers/staging/wfx/main.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_pwrctrl.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/ieee80211_module.o
  CC [M]  drivers/staging/r8188eu/hal/odm_RegConfig8188E.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/ieee80211_softmac_wx.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/rtl819x_TSProc.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.o
  CC      drivers/staging/wfx/debug.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_recv.o
  CC [M]  drivers/staging/r8188eu/hal/odm_RTL8188E.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.o
  CC [M]  drivers/staging/rtl8192u/ieee80211/dot11d.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_rf.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_security.o
  CC      drivers/staging/wfx/bus_spi.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_cmd.o
  CC      drivers/staging/wfx/bus_sdio.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_sta_mgt.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_wlan_util.o
  LD [M]  drivers/staging/rtl8192u/r8192u_usb.o
  CC [M]  drivers/staging/rtl8723bs/core/rtw_xmit.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_intf.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_com.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_com_phycfg.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_dm.o
  AR      drivers/staging/wfx/built-in.a
  CC [M]  drivers/staging/rtl8723bs/hal/hal_btcoex.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_hal_init.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_cam.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_core.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_dm.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_eeprom.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_ethtool.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_pci.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_pm.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_phycfg.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_sdio.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_ps.o
  CC [M]  drivers/staging/rtl8723bs/hal/hal_pwr_seq.o
  CC [M]  drivers/staging/rtl8192e/rtl8192e/rtl_wx.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalPhyRf.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_rf6052.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_rxdesc.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_sreset.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188e_xmit.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188eu_led.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188eu_recv.o
  LD [M]  drivers/staging/rtl8192e/rtl8192e/r8192e_pci.o
  CC [M]  drivers/staging/r8188eu/hal/rtl8188eu_xmit.o
  LD [M]  drivers/staging/rtl8192e/rtllib.o
  AR      drivers/staging/built-in.a
  CC [M]  drivers/staging/r8188eu/hal/usb_halinit.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm.o
  CC [M]  drivers/staging/r8188eu/hal/usb_ops_linux.o
  CC [M]  drivers/staging/r8188eu/os_dep/ioctl_linux.o
  CC [M]  drivers/staging/r8188eu/os_dep/mlme_linux.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_CfoTracking.o
  CC [M]  drivers/staging/r8188eu/os_dep/os_intfs.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DIG.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.o
  CC [M]  drivers/staging/r8188eu/os_dep/osdep_service.o
  CC [M]  drivers/staging/r8188eu/os_dep/recv_linux.o
  CC [M]  drivers/staging/r8188eu/os_dep/usb_intf.o
  CC [M]  drivers/staging/r8188eu/os_dep/usb_ops_linux.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_HWConfig.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.o
  CC [M]  drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.o
  CC [M]  drivers/staging/r8188eu/os_dep/xmit_linux.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ap.o
  CC [M]  drivers/staging/r8188eu/core/rtw_br_ext.o
  CC [M]  drivers/staging/r8188eu/core/rtw_cmd.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_dm.o
  CC [M]  drivers/staging/r8188eu/core/rtw_efuse.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ieee80211.o
  CC [M]  drivers/staging/r8188eu/core/rtw_ioctl_set.o
  CC [M]  drivers/staging/r8188eu/core/rtw_iol.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.o
  CC [M]  drivers/staging/r8188eu/core/rtw_led.o
  CC [M]  drivers/staging/r8188eu/core/rtw_mlme.o
  CC [M]  drivers/staging/r8188eu/core/rtw_mlme_ext.o
  CC [M]  drivers/staging/r8188eu/core/rtw_pwrctrl.o
  CC [M]  drivers/staging/r8188eu/core/rtw_p2p.o
  CC [M]  drivers/staging/r8188eu/core/rtw_recv.o
  CC [M]  drivers/staging/r8188eu/core/rtw_rf.o
  CC [M]  drivers/staging/r8188eu/core/rtw_security.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.o
  CC [M]  drivers/staging/r8188eu/core/rtw_sta_mgt.o
  CC [M]  drivers/staging/r8188eu/core/rtw_wlan_util.o
  CC [M]  drivers/staging/r8188eu/core/rtw_xmit.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723bs_recv.o
  CC [M]  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.o
  CC [M]  drivers/staging/rtl8723bs/hal/sdio_halinit.o
  CC [M]  drivers/staging/rtl8723bs/hal/sdio_ops.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.o
  LD [M]  drivers/staging/r8188eu/r8188eu.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.o
  CC [M]  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/ioctl_linux.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/mlme_linux.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/osdep_service.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/os_intfs.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/recv_linux.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/sdio_intf.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/wifi_regd.o
  CC [M]  drivers/staging/rtl8723bs/os_dep/xmit_linux.o
  LD [M]  drivers/staging/rtl8723bs/r8723bs.o
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
