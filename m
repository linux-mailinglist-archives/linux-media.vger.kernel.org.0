Return-Path: <linux-media+bounces-28521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F1FA6A2F6
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 10:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E71B46326A
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 09:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BBA1F0984;
	Thu, 20 Mar 2025 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o3KPZWg5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADEB23A0
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742464230; cv=none; b=BUSCXUqLOvWt5frrcZoQCodv4SkqST/JhbZK9EMI8FfqrCoPOlPkPFQ3BSYaHM9AHuenvKBXIjv0gxwt7yr14BshW3dKp/p4Hj7JjQ8GDE1/whjyElBaGk2CPKQXohp6WJtZagFo27nriViYxzQmAEMiqR7H/t+CsyvDcZYy0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742464230; c=relaxed/simple;
	bh=jK8zPyn51ibZC2k1KcWCTfFdjiIJfQV0B+TLE+OYZtk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=n+MO/Z0LxXa1NF8jsKlLWmcd1Ek5yJzwAw693lsJ54Kyw0cd79j2AdnHwKsorBUJv1R51871o7Q3awOUy3P25Eu5wyZUmzYBklLVBPvzh1O4kJdEaTtkk10zMshIRPVaXEZ+JC3zkZIl4EQtJ95TM7fzjP0bjK+orMy3HhWE+qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o3KPZWg5; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d42f08219so204580241.0
        for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742464227; x=1743069027; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=91+1pwQNQl8kPf/HghWNvlhI7XTd07SABpnZUQWDpHw=;
        b=o3KPZWg5mKeTbu5B39ocqslu0U3DAB7T3fDRXtQ/kzcxPWNhJolZb+hmNKGOCZ6xcX
         dpa50Acn+M63avVFXQzpSxWZPSZMfYFc24WEf3sDJvrxmidb26e1cHXrgUdnvGFIMsfQ
         BiErJ3hL6xl5iHqlxNzdigMTJvviYYjVR4bFMyVYJaCOnPMBMcNGeZEuLqtv8Ca2zD65
         BS4+xvMe7M9iYPDp88WbGEhSdzLciA9Hpx3f2Y1PNXQCtkQsCqH5+F78OJtk4YLOu0lH
         vXM73WGyvCNvaHQUg5al5UnCdJetCIXdEFcuqbf9pOcDsyC+WTISoKrWAiWXbm9/CO4l
         nS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742464227; x=1743069027;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91+1pwQNQl8kPf/HghWNvlhI7XTd07SABpnZUQWDpHw=;
        b=MvvzueBmiVNxoFAnOEAsLUG8VlPkCSzq4P5fOYFmgElUMS4mzfUZsGd8UdVfSOOJU9
         1e+Z5BUltvnMsYocul7FDd1l11pw47a5rI5TSelkGkGgXZ17eu4KSDtMeIk55VgUSJUi
         ar4CA6d3rXFt7QMt08i++M5jOUHsA4u0t/d/rpwLY9p9Nn5s3NUz4/9NqnRuiqkJRgE7
         TcjxBwFh+/X5Mu7mru+4FSGxg4c2q1/TdKB33ThUbYVjZLfcflQrapWLxgK/JNFa7Kxq
         j66/qTFSyZdKYYY7bcA0W6liDLXXI0LhO91F/ds7NmFp2iTYu3QPhH6DUmG5Tt8trrAo
         fTmw==
X-Forwarded-Encrypted: i=1; AJvYcCWLJt6+nAZ2cXSPU/CAlE6Mhac9IloXCGHqzNZlPSlD1zFk4o+R+HHTH0CewjOhImoaLs4SWL0WwSOi1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0hLVpEMhFeokc99ZnQeTOoa/CqZCJAkLrkNFAXaNrHlHeLjOX
	fBo+1hiRretJzzWVK2sUbsXbETqzIfh7Oo4Xak2medyhkGbc1EtA/MXmHGXTF6OBUvUL3IIJlZg
	HMG1eTUBvJZzKsZIdrpc4q8vVvXQdUzSIxGNaVzXcYGUs+bhl
X-Gm-Gg: ASbGncsH4EJvSEpOosLvHNEO7muU9kmSMD+V+koniBaXGghcEJkVbOqeeYvatu393ly
	U/yatJLhIbth84m+p4Us6+sg2Ursg0ynrQgY7GizhjGY+PVdmqdIhbAlBeifmay7tWF506kBdWs
	QreKMVk3IhV+hg1yt6DomQ847fsytcKeCDpVVDX4lMLS87/w428QVIJtF7I0qIpyZzgA==
X-Google-Smtp-Source: AGHT+IHjmhKILTPy96D1p7uyvSzcXS9MF1P55nhqY0CxmjDVATtPXvEPQ7Fj/CrEydFvSGXmwvuFSqL93NyDDBFF3jo=
X-Received: by 2002:a05:6102:549f:b0:4c1:8b8e:e9f7 with SMTP id
 ada2fe7eead31-4c4ec63a201mr5023131137.8.1742464226618; Thu, 20 Mar 2025
 02:50:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 20 Mar 2025 15:20:14 +0530
X-Gm-Features: AQ5f1Jql1-DJ_kcAW7zxPA6HFZrFt_2BSzusITPrABo17flcdRcAdXkCTahAxI8
Message-ID: <CA+G9fYuquxGrt81z4FBSEDuvAMpu2qYAoFXwYKpfSuw2YYNS0w@mail.gmail.com>
Subject: stable-rc-6.13.8-rc1: Dragonboard 845c: kernel NULL pointer
 dereference - camss_find_sensor
To: open list <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc: rfoss@kernel.org, Todor Tomov <todor.too@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm64 Dragonboard 845c boot failed with stable-rc 6.13.8-rc1

Regressions found on Dragonboard 845c :
 - boot (debug Kconfigs)

Regression Analysis:
 - New regression? Not sure. But the crash looks new.
 - Reproducible? Intermittent

Since it is not easy to reproduce this crash, it is hard to bisect.

Boot regression: Dragonboard 845c kernel NULL pointer dereference
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
[    7.871211] xhci-pci-renesas 0000:01:00.0: failed to load firmware
renesas_usb_fw.mem, fallback to ROM
[    7.877652] CAN device driver interface
[    7.879182] Bluetooth: hci0: setting up wcn399x
[    7.884439] Bluetooth: HCI UART protocol Marvell registered
[    7.890767] xhci-pci-renesas 0000:01:00.0: xHCI Host Controller
[    7.938433] xhci-pci-renesas 0000:01:00.0: new USB bus registered,
assigned bus number 3
[    7.941274] spi_master spi0: will run message pump with realtime priority
[    7.946642] xhci-pci-renesas 0000:01:00.0: Zeroing 64bit base
registers, expecting fault
[    7.969396] ath10k_snoc 18800000.wifi: Adding to iommu group 16
[    7.983424] mcp251xfd spi0.0 can0: MCP2517FD rev0.0 (-RX_INT -PLL
+MAB_NO_WARN +CRC_REG +CRC_RX +CRC_TX +ECC -HD o:40.00MHz c:40.00MHz
m:10.00MHz rs:10.00MHz es:0.00MHz rf:10.00MHz ef:0.00MHz) successfully
initialized.
[    7.987793] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000030
[    8.001412] ath10k_snoc 18800000.wifi: supply vdd-3.3-ch1 not
found, using dummy regulator
[    8.004533] Bluetooth: hci0: QCA Product ID   :0x0000000a
[    8.015039] Mem abort info:
[    8.020189] Bluetooth: hci0: QCA SOC Version  :0x40010214
[    8.020197] Bluetooth: hci0: QCA ROM Version  :0x00000201
[    8.020204] Bluetooth: hci0: QCA Patch Version:0x00000001
[    8.025657]   ESR = 0x0000000096000006
[    8.039667] Bluetooth: hci0: QCA controller version 0x02140201
[    8.044983]   EC = 0x25: DABT (current EL), IL = 32 bits
[    8.044988]   SET = 0, FnV = 0
[    8.044990]   EA = 0, S1PTW = 0
[    8.044992]   FSC = 0x06: level 2 translation fault
[    8.044995] Data abort info:
[    8.044997]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
[    8.044999]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    8.045002]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    8.045004] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010cbec000
[    8.045007] [0000000000000030] pgd=080000010cbf4403,
p4d=080000010cbf4403, pud=080000010cbf5403, pmd=0000000000000000
[    8.045019] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
[    8.045022] Modules linked in: venus_enc venus_dec ath10k_snoc
mcp251xfd videobuf2_dma_contig ath10k_core lontium_lt9611(+)
xhci_pci_renesas(+) can_dev ath msm leds_qcom_lpg mac80211 qcom_pbs
hci_uart ocmem rtc_pm8xxx btqca drm_exec led_class_multicolor
gpu_sched snd_soc_sdm845 qcom_pon qcom_spmi_temp_alarm drm_dp_aux_bus
snd_soc_rt5663 drm_display_helper qcom_spmi_adc5 btbcm
snd_soc_qcom_sdw drm_client_lib qcom_camss camcc_sdm845
qcom_vadc_common snd_soc_qcom_common snd_soc_rl6231 videobuf2_dma_sg
qcom_stats crct10dif_ce coresight_stm soundwire_bus videobuf2_memops
reset_qcom_pdc cfg80211 venus_core phy_qcom_qmp_combo bluetooth
aux_bridge v4l2_mem2mem videobuf2_v4l2 i2c_qcom_geni pwrseq_core
spi_geni_qcom videobuf2_common typec qcom_rng gpi phy_qcom_qmp_usb
qcom_q6v5_mss stm_core qcrypto icc_osm_l3 ufs_qcom phy_qcom_qmp_ufs
phy_qcom_qmp_pcie lmh rfkill slim_qcom_ngd_ctrl qrtr slimbus
pdr_interface qcom_pdr_msg qcom_wdt llcc_qcom qcom_q6v5_pas icc_bwmon
qcom_pil_info qcom_q6v5 display_connector qcom_sysmon qcom_common
[    8.045106]  drm_kms_helper qcom_glink_smem mdt_loader qmi_helpers
drm backlight socinfo rmtfs_mem
[    8.045116] CPU: 7 UID: 0 PID: 430 Comm: v4l_id Not tainted 6.13.8-rc1 #1
[    8.045119] Hardware name: Thundercomm Dragonboard 845c (DT)
[    8.045121] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    8.045123] pc : camss_find_sensor+0x24/0x80 qcom_camss
[    8.045141] lr : camss_get_pixel_clock+0x20/0x70 qcom_camss
[    8.045152] sp : ffff80008177b8b0
[    8.045153] x29: ffff80008177b8b0 x28: ffff80008177bc30 x27: ffff6d63004043c0
[    8.045157] x26: 0000000000000000 x25: 0000000000000000 x24: ffff80008177b908
[    8.045161] x23: ffff6d630d1f5e48 x22: ffff6d630d1f7a98 x21: ffff80008177b920
[    8.045164] x20: 0000000000000003 x19: 0000000000020001 x18: 0000000000000000
[    8.045167] x17: 0000000000000000 x16: ffffceec8fe80380 x15: 0000000000000000
[    8.045170] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000001
[    8.045173] x11: ffff6d6301abd000 x10: 0000000000000c80 x9 : ffffceec20623b90
[    8.045177] x8 : ffff80008177b7b8 x7 : 0000000000000000 x6 : 0000000000000001
[    8.045179] x5 : ffff6d630d1f7158 x4 : 000000000fffffff x3 : ffff6d630d1f7028
[    8.045183] x2 : ffff6d630d1f6568 x1 : ffff80008177b920 x0 : 0000000000000000
[    8.045186] Call trace:
[    8.045188] camss_find_sensor+0x24/0x80 qcom_camss (P)
[    8.045200] camss_get_pixel_clock+0x20/0x70 qcom_camss
[    8.045210] vfe_get+0xcc/0x530 qcom_camss
[    8.049208] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
[    8.054874] vfe_set_power+0x38/0x68 qcom_camss
[    8.054886] pipeline_pm_power_one
(drivers/media/v4l2-core/v4l2-mc.c:492 (discriminator 12))
[    8.054894] pipeline_pm_power (drivers/media/v4l2-core/v4l2-mc.c:529)
[    8.054896] v4l2_pipeline_pm_use (drivers/media/v4l2-core/v4l2-mc.c:557)
[    8.054899] v4l2_pipeline_pm_get (drivers/media/v4l2-core/v4l2-mc.c:569)
[    8.054902] video_open+0x7c/0x100 qcom_camss
[    8.054913] v4l2_open (drivers/media/v4l2-core/v4l2-dev.c:434)
[    8.054918] chrdev_open (fs/char_dev.c:414)
[    8.054924] do_dentry_open (fs/open.c:945)
[    8.054928] vfs_open (fs/open.c:1075)
[    8.054932] path_openat (fs/namei.c:3828 fs/namei.c:3987)
[    8.054935] do_filp_open (fs/namei.c:4014)
[    8.054938] do_sys_openat2 (fs/open.c:1402)
[    8.054941] __arm64_sys_openat (fs/open.c:1428)
[    8.054945] invoke_syscall (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/syscall.c:54)
[    8.054950] el0_svc_common.constprop.0
(include/linux/thread_info.h:135 (discriminator 2)
arch/arm64/kernel/syscall.c:140 (discriminator 2))
[    8.054954] do_el0_svc (arch/arm64/kernel/syscall.c:152)
[    8.054957] el0_svc (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:165 (discriminator 1)
arch/arm64/kernel/entry-common.c:178 (discriminator 1)
arch/arm64/kernel/entry-common.c:745 (discriminator 1))
[    8.054962] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:763)
[    8.054965] el0t_64_sync (arch/arm64/kernel/entry.S:600)
[ 8.054969] Code: f9000bf3 52800033 72a00053 f9402400 (f9401801)
All code
========
   0: f9000bf3 str x19, [sp, #16]
   4: 52800033 mov w19, #0x1                    // #1
   8: 72a00053 movk w19, #0x2, lsl #16
   c: f9402400 ldr x0, [x0, #72]
  10:* f9401801 ldr x1, [x0, #48] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f9401801 ldr x1, [x0, #48]
[    8.054972] ---[ end trace 0000000000000000 ]---
[    8.062891] xhci-pci-renesas 0000:01:00.0: hcc params 0x014051cf
hci version 0x100 quirks 0x0000000100000010
[    8.063966] bluetooth hci0: Direct firmware load for
qca/crbtfw21.tlv failed with error -2

## Source
* Kernel version: 6.13.8-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git sha: 14de9a7d510fcfb3bd35e275eda09724bda4d440
* Git describe: v6.13.7-242-g14de9a7d510f
* Project details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13.7-242-g14de9a7d510f/

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13.7-242-g14de9a7d510f/testrun/27687746/suite/boot/test/gcc-13-lkftconfig-debug/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13.7-242-g14de9a7d510f/testrun/27687746/suite/boot/test/gcc-13-lkftconfig-debug/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13.7-242-g14de9a7d510f/testrun/27687746/suite/boot/test/gcc-13-lkftconfig-debug/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uXZp3X2U4uKizZrPK3SAiZuzXS/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2uXZp3X2U4uKizZrPK3SAiZuzXS/config


--
Linaro LKFT
https://lkft.linaro.org

