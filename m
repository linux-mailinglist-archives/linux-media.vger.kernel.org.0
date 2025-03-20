Return-Path: <linux-media+bounces-28536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0CA6ABCB
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 18:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49A438A0EA4
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 17:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C588224B1A;
	Thu, 20 Mar 2025 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="Mniw8kI4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A7C224AFE;
	Thu, 20 Mar 2025 17:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742490965; cv=none; b=jMBh+IEeywapprX2HNQPd+46hwHipLaAGUAzyimzq2DHR4rgnWc5K1oqtX2Qj0MMDSZP/dGKSXgVVvJnnUb7MghvvgjOd0g6jZpXyKKp6QbQKvUFR0rxQpv71SDvgK9k4Gdlpd8QYA4lEF8iQdT7frfoIMf932an2surhIpkGnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742490965; c=relaxed/simple;
	bh=iCUm3cz07SoJifB1jws8MO4I8p5x/cX1a06zAggGGCE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9pGRW9DvuB6ZJxEQbiLYYYrG2Tdf2JJ+VKYtBTEb6oG4dxYRnBtyp1eY/AeGpN2gAqkzU/mPKin5VkO6jN1wnRFIkIiAdCKUi30xmYT+iEIOq1QA/ALJMJJwjrIRX7h4o+jdmvq8wfAsmcjU9/5TLjhAS8G+CLkRPy4qAR5g18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=Mniw8kI4; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1742490945; x=1742750145;
	bh=8s4CLVsTPqA5OkrrKoDhvv+p0QpHdEK3MwJf50PKGw0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Mniw8kI4IBjUmtIH6Z4NWTLmoQoG0nRwd/TO08os0nQAtcLJavP/9VWprJ3kpkpyV
	 yxobPjcCttb4kSqDY6Y5XOEeZlvY6/BnthkypnaaG9ENeujNOL1gEFIcXYAoZMnlGU
	 OHelBTUNNb2x96PidJq+H4kfjQcv2s0/icr01bK1bG143Rwd2krYo6X/vHAGUxLFMo
	 oo879wW1bxcrLgbWDVo4fWoG7Nj8Cofk8gi7hy7z7XUDu4tPRgEyLbmr0I2tUh+5wT
	 65UtDYhmvzLWMGaxOux9xibxS0kFSasC+NutLH9ccm+HTFqg7pPg7xW7Ym3KxTAusZ
	 HDPXbfASklWoQ==
Date: Thu, 20 Mar 2025 17:15:40 +0000
To: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, lkft-triage@lists.linaro.org
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: rfoss@kernel.org, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Subject: Re: stable-rc-6.13.8-rc1: Dragonboard 845c: kernel NULL pointer dereference - camss_find_sensor
Message-ID: <b8624ef5-d806-4016-b51d-1f23ddb65054@nxsw.ie>
In-Reply-To: <CA+G9fYuquxGrt81z4FBSEDuvAMpu2qYAoFXwYKpfSuw2YYNS0w@mail.gmail.com>
References: <CA+G9fYuquxGrt81z4FBSEDuvAMpu2qYAoFXwYKpfSuw2YYNS0w@mail.gmail.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: c20da753203358c08d171fb80624a061b27d370f
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20/03/2025 09:50, Naresh Kamboju wrote:
> Regressions on arm64 Dragonboard 845c boot failed with stable-rc 6.13.8-r=
c1
>=20
> Regressions found on Dragonboard 845c :
>   - boot (debug Kconfigs)
>=20
> Regression Analysis:
>   - New regression? Not sure. But the crash looks new.
>   - Reproducible? Intermittent
>=20
> Since it is not easy to reproduce this crash, it is hard to bisect.
>=20
> Boot regression: Dragonboard 845c kernel NULL pointer dereference
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>=20
> ## Boot log
> [    7.871211] xhci-pci-renesas 0000:01:00.0: failed to load firmware
> renesas_usb_fw.mem, fallback to ROM
> [    7.877652] CAN device driver interface
> [    7.879182] Bluetooth: hci0: setting up wcn399x
> [    7.884439] Bluetooth: HCI UART protocol Marvell registered
> [    7.890767] xhci-pci-renesas 0000:01:00.0: xHCI Host Controller
> [    7.938433] xhci-pci-renesas 0000:01:00.0: new USB bus registered,
> assigned bus number 3
> [    7.941274] spi_master spi0: will run message pump with realtime prior=
ity
> [    7.946642] xhci-pci-renesas 0000:01:00.0: Zeroing 64bit base
> registers, expecting fault
> [    7.969396] ath10k_snoc 18800000.wifi: Adding to iommu group 16
> [    7.983424] mcp251xfd spi0.0 can0: MCP2517FD rev0.0 (-RX_INT -PLL
> +MAB_NO_WARN +CRC_REG +CRC_RX +CRC_TX +ECC -HD o:40.00MHz c:40.00MHz
> m:10.00MHz rs:10.00MHz es:0.00MHz rf:10.00MHz ef:0.00MHz) successfully
> initialized.
> [    7.987793] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000030
> [    8.001412] ath10k_snoc 18800000.wifi: supply vdd-3.3-ch1 not
> found, using dummy regulator
> [    8.004533] Bluetooth: hci0: QCA Product ID   :0x0000000a
> [    8.015039] Mem abort info:
> [    8.020189] Bluetooth: hci0: QCA SOC Version  :0x40010214
> [    8.020197] Bluetooth: hci0: QCA ROM Version  :0x00000201
> [    8.020204] Bluetooth: hci0: QCA Patch Version:0x00000001
> [    8.025657]   ESR =3D 0x0000000096000006
> [    8.039667] Bluetooth: hci0: QCA controller version 0x02140201
> [    8.044983]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    8.044988]   SET =3D 0, FnV =3D 0
> [    8.044990]   EA =3D 0, S1PTW =3D 0
> [    8.044992]   FSC =3D 0x06: level 2 translation fault
> [    8.044995] Data abort info:
> [    8.044997]   ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00000000
> [    8.044999]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [    8.045002]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [    8.045004] user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000010cbec00=
0
> [    8.045007] [0000000000000030] pgd=3D080000010cbf4403,
> p4d=3D080000010cbf4403, pud=3D080000010cbf5403, pmd=3D0000000000000000
> [    8.045019] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> [    8.045022] Modules linked in: venus_enc venus_dec ath10k_snoc
> mcp251xfd videobuf2_dma_contig ath10k_core lontium_lt9611(+)
> xhci_pci_renesas(+) can_dev ath msm leds_qcom_lpg mac80211 qcom_pbs
> hci_uart ocmem rtc_pm8xxx btqca drm_exec led_class_multicolor
> gpu_sched snd_soc_sdm845 qcom_pon qcom_spmi_temp_alarm drm_dp_aux_bus
> snd_soc_rt5663 drm_display_helper qcom_spmi_adc5 btbcm
> snd_soc_qcom_sdw drm_client_lib qcom_camss camcc_sdm845
> qcom_vadc_common snd_soc_qcom_common snd_soc_rl6231 videobuf2_dma_sg
> qcom_stats crct10dif_ce coresight_stm soundwire_bus videobuf2_memops
> reset_qcom_pdc cfg80211 venus_core phy_qcom_qmp_combo bluetooth
> aux_bridge v4l2_mem2mem videobuf2_v4l2 i2c_qcom_geni pwrseq_core
> spi_geni_qcom videobuf2_common typec qcom_rng gpi phy_qcom_qmp_usb
> qcom_q6v5_mss stm_core qcrypto icc_osm_l3 ufs_qcom phy_qcom_qmp_ufs
> phy_qcom_qmp_pcie lmh rfkill slim_qcom_ngd_ctrl qrtr slimbus
> pdr_interface qcom_pdr_msg qcom_wdt llcc_qcom qcom_q6v5_pas icc_bwmon
> qcom_pil_info qcom_q6v5 display_connector qcom_sysmon qcom_common
> [    8.045106]  drm_kms_helper qcom_glink_smem mdt_loader qmi_helpers
> drm backlight socinfo rmtfs_mem
> [    8.045116] CPU: 7 UID: 0 PID: 430 Comm: v4l_id Not tainted 6.13.8-rc1=
 #1
> [    8.045119] Hardware name: Thundercomm Dragonboard 845c (DT)
> [    8.045121] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    8.045123] pc : camss_find_sensor+0x24/0x80 qcom_camss
> [    8.045141] lr : camss_get_pixel_clock+0x20/0x70 qcom_camss
> [    8.045152] sp : ffff80008177b8b0
> [    8.045153] x29: ffff80008177b8b0 x28: ffff80008177bc30 x27: ffff6d630=
04043c0
> [    8.045157] x26: 0000000000000000 x25: 0000000000000000 x24: ffff80008=
177b908
> [    8.045161] x23: ffff6d630d1f5e48 x22: ffff6d630d1f7a98 x21: ffff80008=
177b920
> [    8.045164] x20: 0000000000000003 x19: 0000000000020001 x18: 000000000=
0000000
> [    8.045167] x17: 0000000000000000 x16: ffffceec8fe80380 x15: 000000000=
0000000
> [    8.045170] x14: 0000000000000000 x13: 0000000000000000 x12: 000000000=
0000001
> [    8.045173] x11: ffff6d6301abd000 x10: 0000000000000c80 x9 : ffffceec2=
0623b90
> [    8.045177] x8 : ffff80008177b7b8 x7 : 0000000000000000 x6 : 000000000=
0000001
> [    8.045179] x5 : ffff6d630d1f7158 x4 : 000000000fffffff x3 : ffff6d630=
d1f7028
> [    8.045183] x2 : ffff6d630d1f6568 x1 : ffff80008177b920 x0 : 000000000=
0000000
> [    8.045186] Call trace:
> [    8.045188] camss_find_sensor+0x24/0x80 qcom_camss (P)
> [    8.045200] camss_get_pixel_clock+0x20/0x70 qcom_camss
> [    8.045210] vfe_get+0xcc/0x530 qcom_camss
> [    8.049208] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
> [    8.054874] vfe_set_power+0x38/0x68 qcom_camss
> [    8.054886] pipeline_pm_power_one
> (drivers/media/v4l2-core/v4l2-mc.c:492 (discriminator 12))
> [    8.054894] pipeline_pm_power (drivers/media/v4l2-core/v4l2-mc.c:529)
> [    8.054896] v4l2_pipeline_pm_use (drivers/media/v4l2-core/v4l2-mc.c:55=
7)
> [    8.054899] v4l2_pipeline_pm_get (drivers/media/v4l2-core/v4l2-mc.c:56=
9)
> [    8.054902] video_open+0x7c/0x100 qcom_camss
> [    8.054913] v4l2_open (drivers/media/v4l2-core/v4l2-dev.c:434)
> [    8.054918] chrdev_open (fs/char_dev.c:414)
> [    8.054924] do_dentry_open (fs/open.c:945)
> [    8.054928] vfs_open (fs/open.c:1075)
> [    8.054932] path_openat (fs/namei.c:3828 fs/namei.c:3987)
> [    8.054935] do_filp_open (fs/namei.c:4014)
> [    8.054938] do_sys_openat2 (fs/open.c:1402)
> [    8.054941] __arm64_sys_openat (fs/open.c:1428)
> [    8.054945] invoke_syscall (arch/arm64/include/asm/current.h:19
> arch/arm64/kernel/syscall.c:54)
> [    8.054950] el0_svc_common.constprop.0
> (include/linux/thread_info.h:135 (discriminator 2)
> arch/arm64/kernel/syscall.c:140 (discriminator 2))
> [    8.054954] do_el0_svc (arch/arm64/kernel/syscall.c:152)
> [    8.054957] el0_svc (arch/arm64/include/asm/irqflags.h:82
> (discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
> 1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
> arch/arm64/kernel/entry-common.c:165 (discriminator 1)
> arch/arm64/kernel/entry-common.c:178 (discriminator 1)
> arch/arm64/kernel/entry-common.c:745 (discriminator 1))
> [    8.054962] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:763=
)
> [    8.054965] el0t_64_sync (arch/arm64/kernel/entry.S:600)
> [ 8.054969] Code: f9000bf3 52800033 72a00053 f9402400 (f9401801)
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>     0: f9000bf3 str x19, [sp, #16]
>     4: 52800033 mov w19, #0x1                    // #1
>     8: 72a00053 movk w19, #0x2, lsl #16
>     c: f9402400 ldr x0, [x0, #72]
>    10:* f9401801 ldr x1, [x0, #48] <-- trapping instruction
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0: f9401801 ldr x1, [x0, #48]
> [    8.054972] ---[ end trace 0000000000000000 ]---
> [    8.062891] xhci-pci-renesas 0000:01:00.0: hcc params 0x014051cf
> hci version 0x100 quirks 0x0000000100000010
> [    8.063966] bluetooth hci0: Direct firmware load for
> qca/crbtfw21.tlv failed with error -2
>=20
> ## Source
> * Kernel version: 6.13.8-rc1
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable-rc.git
> * Git sha: 14de9a7d510fcfb3bd35e275eda09724bda4d440
> * Git describe: v6.13.7-242-g14de9a7d510f
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.=
13.7-242-g14de9a7d510f/
>=20
> ## Build
> * Build log: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1=
3.y/build/v6.13.7-242-g14de9a7d510f/testrun/27687746/suite/boot/test/gcc-13=
-lkftconfig-debug/log
> * Build history:
> https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.=
13.7-242-g14de9a7d510f/testrun/27687746/suite/boot/test/gcc-13-lkftconfig-d=
ebug/history/
> * Build details:
> https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.=
13.7-242-g14de9a7d510f/testrun/27687746/suite/boot/test/gcc-13-lkftconfig-d=
ebug/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uXZ=
p3X2U4uKizZrPK3SAiZuzXS/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2uXZp3X2U4uKizZrPK=
3SAiZuzXS/config
>=20
>=20
> --
> Linaro LKFT
> https://lkft.linaro.org
>=20

Thanks for the report.

Let me see if I can replicate this bug.

---
bod


