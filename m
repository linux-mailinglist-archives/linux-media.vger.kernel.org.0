Return-Path: <linux-media+bounces-23154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA19EC3F5
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 05:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C950016846A
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 04:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60731BEF82;
	Wed, 11 Dec 2024 04:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b="iiQ3brZ9"
X-Original-To: linux-media@vger.kernel.org
Received: from omr011.pc5.atmailcloud.com (omr011.pc5.atmailcloud.com [103.150.252.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749F51BD9CE
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 04:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733891120; cv=none; b=tIh5boqANcK0Y+iABHwCIol2cQPq/+nO5PLOuXjeLRwV32Grz7MsrTpiBRsNT6WUyjaAx99Uu9RRs+lhTy/1CDZHLeZG2e9v8zdiq8IrRAnfvVx4xV1iRkEQawckd8SITltEuEtVVdwLGGsrp43zNxb8KR/i703MBx8+5VDsrvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733891120; c=relaxed/simple;
	bh=sJA9WY2iN8EtgWdnwBFCMgJQtv9Jypqa4GO8znrM3mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8XFBl+laK6r+Kke03ayx+tm6GnjYII/lfSpZ3A6FREeaJEwOOosE/oODN3LZeLHkmE+zeNTDu1Zb+hCfAPBhURp59olrHPShvHyJxf2sYl7vabWmZ/H0lPBTAXNy/7XOrtJ3SkXkE5caW0ugWyZa26bGSirbrbh0l/u5EuAEAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net; spf=pass smtp.mailfrom=internode.on.net; dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b=iiQ3brZ9; arc=none smtp.client-ip=103.150.252.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=internode.on.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=internode.on.net; s=202309; h=MIME-Version:Message-ID:Date:Subject:To:From:
	content-type; bh=cNccfrg1OFV/QfmFeZ7Rp6yCaO916Z+OTqbkoM9wrWI=; b=iiQ3brZ9lOg/
	+TwyPMFZVabIh7LKzH0fP2wsClrelLf2UevSVW9xGobKjcjc13mMk8w/BBxMtGLT1ZkfJOLb/iqll
	xPHXiQxN/07sQ23/RV5NYLqaTg5CqpOvWM4mbEKyd6yha37K2tR5kzhdYeO9XrYynhdPg/taoZNSY
	gjVY8ffBp5sYsKxhPZHUDR6P9qwVgbLDYYwMisnP0SB/ScyAIEXKwqrFA+ws2Z7Z8YCjcXmW7FyaA
	1agG9eF/mwwrBhXA2jhTo+PQ9E2bkDjqVqHb5rC7jooFAUVB/yzoSJF3pkzJrcYIhNymWdB8yvhba
	77kNvfNxNE6qYJubx+PPlQ==;
Received: from cmr-kakadu01.internal.pc5.atmailcloud.com (cmr-kakadu01.internal.pc5.atmailcloud.com [192.168.1.3]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu01.i-0f1ffa3a6e13ce9c7) with ESMTPS
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1tLEH8-000000003Va-2pQb ;
	Wed, 11 Dec 2024 04:24:38 +0000
Received: from [118.211.83.144] (helo=localhost)
	 by CMR-KAKADU01.i-0f1ffa3a6e13ce9c7 with esmtpsa
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1tLEH1-0000000079s-0NQT;
	Wed, 11 Dec 2024 04:24:31 +0000
Received: from amarsh04 by localhost with local (Exim 4.98)
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1tLEGS-000000002Ct-0TcY;
	Wed, 11 Dec 2024 14:53:56 +1030
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: hverkuil@xs4all.nl
Cc: alain.volmat@foss.st.com,
	alexandre.belloni@bootlin.com,
	alexandre.torgue@foss.st.com,
	alim.akhtar@samsung.com,
	andrew-ct.chen@mediatek.com,
	andrew@codeconstruct.com.au,
	andrey_utkin@fastmail.com,
	andrzej.hajda@intel.com,
	andrzejtp2010@gmail.com,
	andy@kernel.org,
	angelogioacchino.delregno@collabora.com,
	awalls@md.metrocast.net,
	bcm-kernel-feedback-list@broadcom.com,
	bin.liu@mediatek.com,
	bingbu.cao@intel.com,
	bparrot@ti.com,
	bryan.odonoghue@linaro.org,
	changhuang.liang@starfivetech.com,
	clabbe@baylibre.com,
	claudiu.beznea@tuxon.dev,
	dafna@fastmail.com,
	daniel.almeida@collabora.com,
	devarsht@ti.com,
	digetx@gmail.com,
	djrscally@gmail.com,
	eagle.zhou@nxp.com,
	eajames@linux.ibm.com,
	eugen.hristev@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	fabien.dessenne@foss.st.com,
	fabrizio.castro.jz@renesas.com,
	festevam@gmail.com,
	florian.fainelli@broadcom.com,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	hugues.fruchet@foss.st.com,
	ismael@iodev.co.uk,
	jacek.anaszewski@gmail.com,
	jack.zhu@starfivetech.com,
	jackson.lee@chipsnmedia.com,
	jacob-chen@iotwrt.com,
	jacopo.mondi@ideasonboard.com,
	jai.luthra@linux.dev,
	jbrunet@baylibre.com,
	jean-christophe.trotin@foss.st.com,
	jernej.skrabec@gmail.com,
	joel@jms.id.au,
	jonathanh@nvidia.com,
	kernel-list@raspberrypi.com,
	kernel@pengutronix.de,
	kernel@puri.sm,
	kflin@nuvoton.com,
	khilman@baylibre.com,
	kieran.bingham+renesas@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	krzk@kernel.org,
	kwliu@nuvoton.com,
	l.stelmach@samsung.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	m.szyprowski@samsung.com,
	m.tretter@pengutronix.de,
	maintainers@bluecherrydvr.com,
	martin.blumenstingl@googlemail.com,
	martin.tuma@digiteqautomotive.com,
	martink@posteo.de,
	matt@ranostay.sg,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	michal.simek@amd.com,
	mikhail.ulyanov@cogentembedded.com,
	ming.qian@nxp.com,
	minghsiu.tsai@mediatek.com,
	mirela.rabulea@nxp.com,
	mkrufky@linuxtv.org,
	mripard@kernel.org,
	nas.chung@chipsnmedia.com,
	neil.armstrong@linaro.org,
	nicolas.ferre@microchip.com,
	niklas.soderlund@ragnatech.se,
	p.zabel@pengutronix.de,
	paul.kocialkowski@bootlin.com,
	quic_vgarodia@quicinc.com,
	rfoss@kernel.org,
	rjui@broadcom.com,
	rmfrfs@gmail.com,
	s.hauer@pengutronix.de,
	s.nawrocki@samsung.com,
	sakari.ailus@linux.intel.com,
	samuel@sholland.org,
	sbranden@broadcom.com,
	shawnguo@kernel.org,
	skhan@linuxfoundation.org,
	skomatineni@nvidia.com,
	slongerbeam@gmail.com,
	stanimir.k.varbanov@gmail.com,
	tfiga@chromium.org,
	thierry.reding@gmail.com,
	tian.shu.qiu@intel.com,
	tiffany.lin@mediatek.com,
	todor.too@gmail.com,
	wens@csie.org,
	xavier.roumegue@oss.nxp.com,
	yong.deng@magewell.com,
	yong.zhi@intel.com,
	yunfei.dong@mediatek.com
Subject: [PATCH 06/10] media: rtl2832_sdr: drop vb2_ops_wait_prepare/finish
Date: Wed, 11 Dec 2024 14:53:54 +1030
Message-ID: <20241211042355.8479-1-user@am64>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241014-vb2-wait-v1-6-8c3ee25c618c@xs4all.nl>
References: <20241014-vb2-wait-v1-6-8c3ee25c618c@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Atmail-Id: arthur.marsh@internode.on.net
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=E9vLp7dl c=1 sm=1 tr=0 ts=675913ff a=YhrmIPeZMvUzDXTVr6+epg==:117 a=YhrmIPeZMvUzDXTVr6+epg==:17 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=xOd6jRPJAAAA:8 a=pk8YUlzwTyVrD-VeNkgA:9
X-Cm-Envelope: MS4xfLo8VoWfVuianp4iNULT/NvSli+z6gutFGQsHdd+Oa6bvQviyrU5q+ZkpaLimcuaMlCNQDkklabTJeO8J0Efb0lxFZ8OJyf3uWdNNkx/lBwfxkmT8qa1 3d7M+LjaKhKfsoNADnBgrhcxmSAFHEKPeYdAN6h1MniG/yJXewZBmhEQVPT1d8pWaa/SOQMxDXzkgA==
X-atmailcloud-route: unknown

Hi, I had the following when rtl2832_sdr was loading:

 Linux version 6.13.0-rc2 (root@am64) (gcc-14 (Debian 14.2.0-8) 14.2.0, GNU=
 ld (GNU Binutils for Debian) 2.43.50.20241204) #6236 SMP PREEMPT_RT Mon De=
c  9 10:25:04 ACDT 2024

 usb 9-5: new low-speed USB device number 2 using ohci-pci
 usb 4-3: New USB device found, idVendor=3D0bda, idProduct=3D2838, bcdDevic=
e=3D 1.00
 usb 4-3: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
 usb 4-3: Product: RTL2838UHIDIR
 usb 4-3: Manufacturer: Realtek

 usb 4-3: dvb_usb_v2: found a 'Realtek RTL2832U reference design' in warm s=
tate
 usb 4-3: dvb_usb_v2: will pass the complete MPEG2 transport stream to the =
software demuxer
 dvbdev: DVB: registering new adapter (Realtek RTL2832U reference design)
 usb 4-3: media controller created
 dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
 i2c i2c-5: Added multiplexed i2c bus 6
 rtl2832 5-0010: Realtek RTL2832 successfully attached
 usb 4-3: DVB: registering adapter 0 frontend 0 (Realtek RTL2832 (DVB-T))...
 dvbdev: dvb_create_media_entity: media entity 'Realtek RTL2832 (DVB-T)' re=
gistered.
 i2c i2c-6: fc0012: Fitipower FC0012 successfully identified
 videodev: Linux video capture interface: v2.00
 [drm] ib test on ring 6 succeeded
 ------------[ cut here ]------------
 WARNING: CPU: 1 PID: 453 at drivers/media/common/videobuf2/videobuf2-core.=
c:2661 vb2_core_queue_init+0x272/0x280 [videobuf2_common]
 Modules linked in: rtl2832_sdr videobuf2_vmalloc videobuf2_memops videobuf=
2_v4l2 videobuf2_common videodev fc0012 rtl2832 i2c_mux dvb_usb_rtl28xxu(+)=
 dvb_usb_v2 dvb_core mc radeon(+) snd_emu10k1_synth snd_emux_synth snd_seq_=
midi_emul snd_seq_virmidi snd_seq_midi snd_seq_midi_event drm_ttm_helper sn=
d_seq ttm snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg drm_client_lib =
drm_suballoc_helper snd_emu10k1 drm_display_helper snd_hda_codec edac_mce_a=
md sha512_ssse3 sha512_generic sha256_ssse3 snd_util_mem sha1_ssse3 drm_kms=
_helper aesni_intel snd_ac97_codec snd_hda_core ac97_bus snd_rawmidi snd_se=
q_device snd_hwdep k10temp drm gf128mul snd_pcm crypto_simd cryptd pcspkr a=
t24 evdev serio_raw acpi_cpufreq emu10k1_gp gameport regmap_i2c i2c_algo_bi=
t snd_timer video snd wmi soundcore sp5100_tco button ext4 crc32c_generic c=
rc16 mbcache jbd2 uas usb_storage hid_generic usbhid hid sg sr_mod cdrom sd=
_mod ata_generic firewire_ohci ahci crc32_pclmul crc32c_intel firewire_core=
 crc_itu_t pata_atiixp xhci_pci_renesas libahci
  ohci_pci i2c_piix4 i2c_smbus xhci_pci ehci_pci ohci_hcd libata ehci_hcd x=
hci_hcd r8169 realtek mdio_devres scsi_mod usbcore libphy scsi_common usb_c=
ommon
 CPU: 1 UID: 0 PID: 453 Comm: udevd Not tainted 6.13.0-rc2 #6236
 Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./F2A78M=
-HD2, BIOS F2 05/28/2014
 RIP: 0010:vb2_core_queue_init+0x272/0x280 [videobuf2_common]
 Code: 90 0f 1f 80 00 00 00 00 eb be 0f 0b eb ba 0f 0b 90 0f 1f 80 00 00 00=
 00 eb ae 0f 0b eb aa 0f 0b 90 0f 1f 80 00 00 00 00 eb 9e <0f> 0b eb 9a 66 =
2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
 RSP: 0018:ffffb26cc13d3780 EFLAGS: 00010246
 RAX: 0000000000000000 RBX: ffff90e6856d85a0 RCX: ffffffffc0d03320
 RDX: 0000000000000001 RSI: 0000000000000001 RDI: 0000000000000000
 RBP: ffff90e6837ada80 R08: 0000000000001000 R09: 0000000000000000
 R10: ffff90e6856d8000 R11: 6f7475612e312e72 R12: 0000000000000000
 R13: ffff90e6856d8000 R14: ffff90e6856d8790 R15: ffff90e6856d85a0
 FS:  00007fbae6471840(0000) GS:ffff90e9af880000(0000) knlGS:00000000000000=
00
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 00007f6c22049e76 CR3: 0000000102ba4000 CR4: 00000000000406f0
 Call Trace:
  <TASK>
  ? vb2_core_queue_init+0x272/0x280 [videobuf2_common]
  ? __warn.cold+0xad/0x111
  ? vb2_core_queue_init+0x272/0x280 [videobuf2_common]
  ? report_bug+0x10e/0x1a0
  ? handle_bug+0x53/0x90
  ? exc_invalid_op+0x1f/0x90
  ? asm_exc_invalid_op+0x16/0x20
  ? vb2_core_queue_init+0x272/0x280 [videobuf2_common]
  rtl2832_sdr_probe+0x188/0x490 [rtl2832_sdr]
  ? __pfx___device_attach_driver+0x10/0x10
  platform_probe+0x4d/0xa0
  ? driver_sysfs_add+0x73/0xd0
  really_probe+0xde/0x350
  ? pm_runtime_barrier+0x61/0xb0
  __driver_probe_device+0x78/0x110
  driver_probe_device+0x2d/0xc0
  __device_attach_driver+0x8c/0x100
  bus_for_each_drv+0x86/0xe0
  __device_attach+0xb0/0x1b0
  bus_probe_device+0x92/0xb0
  device_add+0x654/0x870
  ? dev_set_name+0x43/0x50
  platform_device_add+0xe6/0x250
  platform_device_register_full+0x117/0x1a0
  rtl2832u_tuner_attach+0x2e0/0x9e0 [dvb_usb_rtl28xxu]
  dvb_usbv2_probe.cold+0xba6/0xccd [dvb_usb_v2]
  ? __pm_runtime_set_status+0x19b/0x2e0
  usb_probe_interface+0x16e/0x360 [usbcore]
  really_probe+0xde/0x350
  ? pm_runtime_barrier+0x61/0xb0
  ? __pfx___driver_attach+0x10/0x10
  __driver_probe_device+0x78/0x110
  driver_probe_device+0x2d/0xc0
  __driver_attach+0xc9/0x1c0
  bus_for_each_dev+0x6a/0xb0
  ? migrate_enable+0xbf/0xf0
  bus_add_driver+0x139/0x220
  driver_register+0x6e/0xc0
  usb_register_driver+0x93/0x140 [usbcore]
  ? __pfx_rtl28xxu_usb_driver_init+0x10/0x10 [dvb_usb_rtl28xxu]
  do_one_initcall+0x42/0x210
  ? __kmalloc_cache_noprof+0x98/0x240
  do_init_module+0x60/0x210
  init_module_from_file+0x89/0xc0
  __x64_sys_finit_module+0x143/0x390
  do_syscall_64+0x47/0x110
  entry_SYSCALL_64_after_hwframe+0x76/0x7e
 RIP: 0033:0x7fbae62a25b9
 Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7=
 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff =
ff 73 01 c3 48 8b 0d 37 88 0d 00 f7 d8 64 89 01 48
 RSP: 002b:00007ffdcfa41df8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
 RAX: ffffffffffffffda RBX: 000055a9baaadff0 RCX: 00007fbae62a25b9
 RDX: 0000000000000000 RSI: 00007fbae63a2541 RDI: 000000000000000d
 RBP: 0000000000000000 R08: 00007fbae637bad0 R09: 000055a9baaa2540
 R10: 0000000000000000 R11: 0000000000000246 R12: 00007fbae63a2541
 R13: 0000000000020000 R14: 000055a9baab55f0 R15: 0000000000000000
  </TASK>
 ---[ end trace 0000000000000000 ]---
 rtl2832_sdr rtl2832_sdr.1.auto: Could not initialize vb2 queue
 rtl2832_sdr rtl2832_sdr.1.auto: probe with driver rtl2832_sdr failed with =
error -22
 usb 4-3: dvb_usb_v2: 'Realtek RTL2832U reference design' successfully init=
ialized and connected
 usbcore: registered new interface driver dvb_usb_rtl28xxu

It was git-bisected back to:

commit 8fcd2795d22a7b6aa0671aaa67a74c0f776707af
Author: Hans Verkuil <hverkuil@xs4all.nl>
Date:   Mon Oct 14 17:06:33 2024 +0200

    media: rtl2832_sdr: drop vb2_ops_wait_prepare/finish
=20=20=20=20
    Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
    are NULL") it is no longer needed to set the wait_prepare/finish
    vb2_ops callbacks as long as the lock field in vb2_queue is set.
=20=20=20=20
    Since the vb2_ops_wait_prepare/finish callbacks already rely on that fi=
eld,
    we can safely drop these callbacks.
=20=20=20=20
    This simplifies the code and this is a step towards the goal of deleting
    these callbacks.
=20=20=20=20
    Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-=
frontends/rtl2832_sdr.c
index 922c1662f1f0..05254d8717db 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -947,8 +947,6 @@ static const struct vb2_ops rtl2832_sdr_vb2_ops =3D {
 	.buf_queue              =3D rtl2832_sdr_buf_queue,
 	.start_streaming        =3D rtl2832_sdr_start_streaming,
 	.stop_streaming         =3D rtl2832_sdr_stop_streaming,
-	.wait_prepare           =3D vb2_ops_wait_prepare,
-	.wait_finish            =3D vb2_ops_wait_finish,
 };
=20
 static int rtl2832_sdr_g_tuner(struct file *file, void *priv,

Reversing this patch to the current Linus git head kernel resulted in an
apparently successful load:

[   19.678284] rtl2832 5-0010: Realtek RTL2832 successfully attached
[   20.477909] rtl2832_sdr rtl2832_sdr.1.auto: Registered as swradio0
[   20.477916] rtl2832_sdr rtl2832_sdr.1.auto: Realtek RTL2832 SDR attached
[   20.477919] rtl2832_sdr rtl2832_sdr.1.auto: SDR API is still slightly ex=
perimental and functionality changes may follow

I have not tested the sdr functionality though.

Arthur Marsh.

