Return-Path: <linux-media+bounces-36655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47108AF7326
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 14:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CAF11C2371F
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 12:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88812E612B;
	Thu,  3 Jul 2025 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="fp5cMGuX"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A72E6104;
	Thu,  3 Jul 2025 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543990; cv=none; b=qEtWQfaJLl0ORGLkgW/41R7KFW5bWNV1Z93GnuhXBenhuSr1UJ+AFsb+LuZrbUNF6H9zrBC+B4NhGYsD2FLyn31WKmB+yqGwiYqM/oDHKe/GfzAUGw5tCSlTFHOCcHcKHnxQKsYnRtDlqJzSyOVmwA4tGaP+7gDvYUdjVFdCpY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543990; c=relaxed/simple;
	bh=sZYpsHzqmWeXWVW2j4Vs1ALBYeiW3nF0dAuh/AU4rn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exBGe5pnAP1NcmpDFWNR4vtUdJmX8aKxpBjlH6OCtGA4yIRz6ZDIn+4qe0Bw6PfJgAUNKMq5Pqucyt8CSsBe4Zx+GAptaNWNgQgTgxpxVjCE/uB/sSht6G5lFRmoM3eWj0zF1fNQ2TUNDHWqUxE89zcnCrw7K7CK452XR3e+KMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=fp5cMGuX; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1751543958; x=1752148758; i=spasswolf@web.de;
	bh=fAi+xSb6cOO9vl4vl/HW3tePddcQqHbTiegUCqMdoew=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fp5cMGuX1ojUhcGOZ/sQ2h10EWD3Mw1LLpai978cZqsGk2dQWHnE310AGgtpA/EG
	 NlPoaY4drRJcxwxW42Ac/vPysdMQN9TACYsNHQLXfqiLHrPdVsmg8HCvmd5iKGNkE
	 9fQ2jqm/DzL0M90GTsik0sJfV7cBXw9ufP4rt4hLPxXWbxApr1TbvNwPyerOoYK12
	 MZ9jTC/8F70dTCtPRyYmtZT1hG5DLlxqH9vJQbgzjYEHf2/9XEwt217i8FaNc6unM
	 1p9qF3sNAGdrva0dgp3HUDzKd1K4bIYhDwsDV0WT4m1bp5mJfxaiv3dRb5okJU1OS
	 mmH2IyYqy8vC69pPww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from lisa ([95.223.134.88]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsaWF-1uqu3323Jr-015Cjx; Thu, 03
 Jul 2025 13:59:18 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Anusha Srivatsa <asrivats@redhat.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	stable@vger.kernel.org
Subject: Warnings in next-20250703 caused by commit 582111e630f5
Date: Thu,  3 Jul 2025 13:59:14 +0200
Message-ID: <20250703115915.3096-1-spasswolf@web.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: 20250630084001.293053-1-tzimmermann@suse.de
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8KV1YE7CqG6BhWOT9B5AdHrB9j349dXCEMpC4JxUYVHC7B5AxQp
 rElPAVGBHD7zzuHSe9uBeoGQmiTeRwoAzWcaQiK25MR+3gjDrbuwE7r2EhroPadRQqHl0r0
 RMQiT5t7wVcj0ku0wiSP67RK0HOWeaeKr4H6ccVKDcRFXE3fLCJyFuch/kWoz5vWhFC7I9A
 8ZsaYnbLUpaxGXyntTqVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BlKpp2FNSPE=;JfA52roChBtAs46Viu7CzJxipln
 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
 QYTangGAJhiJicw7SsxQ==

When booting next-20250703 on my Msi Alpha 15 Laptop running debian sid (la=
st
updated 20250703) I get a several warnings of the following kind:

    [    8.702999] [   T1628] ------------[ cut here ]------------
    [    8.703001] [   T1628] WARNING: drivers/gpu/drm/drm_gem.c:287 at drm=
_gem_object_handle_put_unlocked+0xaa/0xe0, CPU#14: Xorg/1628
    [    8.703007] [   T1628] Modules linked in: snd_seq_dummy snd_hrtimer =
snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device rfcomm b=
nep nls_ascii nls_cp437 vfat fat snd_ctl_led snd_hda_codec_realtek snd_hda_=
codec_generic snd_hda_scodec_component snd_hda_codec_hdmi snd_hda_intel btu=
sb snd_intel_dspcfg btrtl btintel snd_hda_codec uvcvideo snd_soc_dmic snd_a=
cp3x_pdm_dma btbcm snd_acp3x_rn btmtk snd_hwdep videobuf2_vmalloc snd_soc_c=
ore snd_hda_core videobuf2_memops snd_pcm_oss uvc videobuf2_v4l2 bluetooth =
snd_mixer_oss videodev snd_pcm snd_rn_pci_acp3x videobuf2_common snd_acp_co=
nfig snd_timer msi_wmi ecdh_generic snd_soc_acpi ecc mc sparse_keymap snd w=
mi_bmof edac_mce_amd k10temp soundcore snd_pci_acp3x ccp ac battery button =
joydev hid_sensor_accel_3d hid_sensor_prox hid_sensor_als hid_sensor_magn_3=
d hid_sensor_gyro_3d hid_sensor_trigger industrialio_triggered_buffer kfifo=
_buf industrialio hid_sensor_iio_common amd_pmc evdev mt7921e mt7921_common=
 mt792x_lib mt76_connac_lib mt76 mac80211 libarc4 cfg80211 rfkill msr fuse
    [    8.703056] [   T1628]  nvme_fabrics efi_pstore configfs efivarfs au=
tofs4 ext4 mbcache jbd2 usbhid amdgpu drm_client_lib i2c_algo_bit drm_ttm_h=
elper ttm drm_panel_backlight_quirks drm_exec drm_suballoc_helper amdxcp dr=
m_buddy xhci_pci gpu_sched xhci_hcd drm_display_helper hid_sensor_hub hid_m=
ultitouch mfd_core hid_generic drm_kms_helper psmouse i2c_hid_acpi nvme usb=
core amd_sfh i2c_hid hid cec serio_raw nvme_core r8169 crc16 i2c_piix4 usb_=
common i2c_smbus i2c_designware_platform i2c_designware_core
    [    8.703082] [   T1628] CPU: 14 UID: 1000 PID: 1628 Comm: Xorg Not ta=
inted 6.16.0-rc4-next-20250703-master #127 PREEMPT_{RT,(full)}
    [    8.703085] [   T1628] Hardware name: Micro-Star International Co., =
Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/11/2024
    [    8.703086] [   T1628] RIP: 0010:drm_gem_object_handle_put_unlocked+=
0xaa/0xe0
    [    8.703088] [   T1628] Code: c7 f6 8a ff 48 89 ef e8 94 d4 2e 00 eb =
d8 48 8b 43 08 48 8d b8 d8 06 00 00 e8 52 78 2b 00 c7 83 08 01 00 00 00 00 =
00 00 eb 98 <0f> 0b 5b 5d e9 98 f6 8a ff 48 8b 83 68 01 00 00 48 8b 00 48 8=
5 c0
    [    8.703089] [   T1628] RSP: 0018:ffffb8e8c7fbfb00 EFLAGS: 00010246
    [    8.703091] [   T1628] RAX: 0000000000000000 RBX: 0000000000000001 R=
CX: 0000000000000000
    [    8.703092] [   T1628] RDX: 0000000000000000 RSI: ffff94cdc062b478 R=
DI: ffff94ce71390448
    [    8.703093] [   T1628] RBP: ffff94ce14780010 R08: ffff94cdc062b618 R=
09: ffff94ce14780278
    [    8.703094] [   T1628] R10: 0000000000000001 R11: ffff94cdc062b478 R=
12: ffff94ce14780010
    [    8.703095] [   T1628] R13: 0000000000000007 R14: 0000000000000004 R=
15: ffff94ce14780010
    [    8.703096] [   T1628] FS:  00007fc164276b00(0000) GS:ffff94dcb49cf0=
00(0000) knlGS:0000000000000000
    [    8.703097] [   T1628] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
    [    8.703098] [   T1628] CR2: 00005647ccd53008 CR3: 000000012533f000 C=
R4: 0000000000750ef0
    [    8.703099] [   T1628] PKRU: 55555554
    [    8.703100] [   T1628] Call Trace:
    [    8.703101] [   T1628]  <TASK>
    [    8.703104] [   T1628]  drm_gem_fb_destroy+0x27/0x50 [drm_kms_helper]
    [    8.703113] [   T1628]  __drm_atomic_helper_plane_destroy_state+0x1a=
/0xa0 [drm_kms_helper]
    [    8.703119] [   T1628]  drm_atomic_helper_plane_destroy_state+0x10/0=
x20 [drm_kms_helper]
    [    8.703124] [   T1628]  drm_atomic_state_default_clear+0x1c0/0x2e0
    [    8.703127] [   T1628]  __drm_atomic_state_free+0x6c/0xb0
    [    8.703129] [   T1628]  drm_atomic_helper_disable_plane+0x92/0xe0 [d=
rm_kms_helper]
    [    8.703135] [   T1628]  drm_mode_cursor_universal+0xf2/0x2a0
    [    8.703140] [   T1628]  drm_mode_cursor_common.part.0+0x9c/0x1e0
    [    8.703144] [   T1628]  ? drm_mode_setplane+0x320/0x320
    [    8.703146] [   T1628]  drm_mode_cursor_ioctl+0x8a/0xa0
    [    8.703148] [   T1628]  drm_ioctl_kernel+0xa1/0xf0
    [    8.703151] [   T1628]  drm_ioctl+0x26a/0x510
    [    8.703153] [   T1628]  ? drm_mode_setplane+0x320/0x320
    [    8.703155] [   T1628]  ? srso_alias_return_thunk+0x5/0xfbef5
    [    8.703157] [   T1628]  ? rt_spin_unlock+0x12/0x40
    [    8.703159] [   T1628]  ? do_setitimer+0x185/0x1d0
    [    8.703161] [   T1628]  ? srso_alias_return_thunk+0x5/0xfbef5
    [    8.703164] [   T1628]  amdgpu_drm_ioctl+0x46/0x90 [amdgpu]
    [    8.703283] [   T1628]  __x64_sys_ioctl+0x91/0xe0
    [    8.703286] [   T1628]  do_syscall_64+0x65/0xfc0
    [    8.703289] [   T1628]  entry_SYSCALL_64_after_hwframe+0x55/0x5d
    [    8.703291] [   T1628] RIP: 0033:0x7fc1645f78db
    [    8.703292] [   T1628] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 =
c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 =
00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 0=
0 00
    [    8.703294] [   T1628] RSP: 002b:00007ffd75bce430 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000010
    [    8.703295] [   T1628] RAX: ffffffffffffffda RBX: 000056224e896ea0 R=
CX: 00007fc1645f78db
    [    8.703296] [   T1628] RDX: 00007ffd75bce4c0 RSI: 00000000c01c64a3 R=
DI: 000000000000000f
    [    8.703297] [   T1628] RBP: 00007ffd75bce4c0 R08: 0000000000000100 R=
09: 0000562210547ab0
    [    8.703298] [   T1628] R10: 000000000000004c R11: 0000000000000246 R=
12: 00000000c01c64a3
    [    8.703298] [   T1628] R13: 000000000000000f R14: 0000000000000000 R=
15: 000056224e5c1cd0
    [    8.703302] [   T1628]  </TASK>
    [    8.703303] [   T1628] ---[ end trace 0000000000000000 ]---

As the warnings do not occur in next-20250702, I looked at the commits give=
n by
$ git log --oneline next-20250702..next-20250703 drivers/gpu/drm
to search for a culprit. So I reverted the most likely candidate,
commit 582111e630f5 ("drm/gem: Acquire references on GEM handles for frameb=
uffers"),
in next-20250703 and the warnings disappeared.
This is the hardware I used:
$ lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne Root=
 Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne IOMMU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost Bridge
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Brid=
ge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost Bridge
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP Bridge
00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP Bridge
00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP Bridge
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP Bridge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe=
 GPP Bridge to Bus
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 51)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric=
; Function 7
01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstr=
eam Port of PCI Express Switch (rev c3)
02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downs=
tream Port of PCI Express Switch
03:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23 =
[Radeon RX 6600/6600 XT/6600M] (rev c3)
03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDM=
I/DP Audio Controller
04:00.0 Network controller: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80MHz
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
211/8411 PCI Express Gigabit Ethernet Controller (rev 15)
06:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc. K=
C3000/FURY Renegade NVMe SSD [E18] (rev 01)
07:00.0 Non-Volatile memory controller: Micron/Crucial Technology P1 NVMe P=
CIe SSD[Frampton] (rev 03)
08:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] C=
ezanne [Radeon Vega Series / Radeon Vega Mobile Series] (rev c5)
08:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir Radeon =
High Definition Audio Controller
08:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family 17=
h (Models 10h-1fh) Platform Security Processor
08:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne U=
SB 3.1
08:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne U=
SB 3.1
08:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Audio Cop=
rocessor (rev 01)
08:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19h/1ah=
 HD Audio Controller
08:00.7 Signal processing controller: Advanced Micro Devices, Inc. [AMD] Se=
nsor Fusion Hub


Bert Karwatzki

