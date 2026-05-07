Return-Path: <linux-media+bounces-60826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKCEAVWp/GkNSgAAu9opvQ
	(envelope-from <linux-media+bounces-60826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:01:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA54EAB8C
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E27D430B2E96
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 14:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A603A8752;
	Thu,  7 May 2026 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="biSdJiwe"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAC5392814;
	Thu,  7 May 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165704; cv=pass; b=bBCwi/xYSotILPcEFVKPNHA7IGonfAQSVDvONTvXeScpD1Hh6K81x0EG8d5WLiYgV/Ignp4lGPb0iShVpZxjsy9cZ2zyn6q/FlPuxnSeW1sNlhyXupKDt76DsoBCKeAxpQY63poAwGGvQ2D4at5zyq7aWJh5RIyBIgArgl8LOes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165704; c=relaxed/simple;
	bh=pqd/CyDVGUc5B44/qWXRjpdss9q6LFyyid1Yucmtxf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDYHGM4Hi2tpKP8FcGMxKUOGEETAWTKsEgYqUL9xs221SaeprqdJ8K2Gb+zn1jS8QuqICs9KbH9M40R5GhTwnbY3QnSa9ZVEiSj5mrOLK46uEfsFkgH9tE5W9X8fQ9gn0osORaO5HJhg6iLX2T0KhkFjwxtQZNuwz+I//BKQsR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=biSdJiwe; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778165671; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T8Ex0I6R6Kc95dgWSzf49Nw5eDqQnUIdIobggoG+yhFnDI14pX3v/So6Ofta8XQ7LfDF+jMnt/vJzzybHqvSTMUz3qGpHhFWlc78ZOCDxTyWC8obSsd/FiEBkw+9C1sBr14sbDYwjfXzN/UFY4UZx25trcMM7jq5bNfMBa1okZI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778165671; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tNetuxkRt+N+4b2uSrH5ou0P5bOjAaDGsQRXbP0f+Xw=; 
	b=bbqTPH4v2MNwkXrRMOvT0NWaeya0EUs1bWLuGn9FHYPtY7NKv8+qoDv+Wu1u3OTOzB+pfGI7shTRh/o/1Yy/9QUs7y6INH9nHZLxiVkanOIuPyKOx6U7ayAD5juPBknsuu49KXFo0X+IaqhcdMypji6BLWRnUofWiFm7FV6tKl4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778165671;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=tNetuxkRt+N+4b2uSrH5ou0P5bOjAaDGsQRXbP0f+Xw=;
	b=biSdJiwecFJhgMX9AlCKB0S+0fCEKx89Auy+BkwYYsIwiTPt4cXifAV3ZgPlscQS
	vZwoGuYKPiNTxB3P3zMTUv/yR+zGXHbBxmZlnO4BYgCTo20ErY1EehOIAYv+1qwv5w2
	ay8jEoqxvcEtC+f4kjHZ5A9yJ7sqJWMPdn99460M=
Received: by mx.zohomail.com with SMTPS id 1778165669942952.534754209186;
	Thu, 7 May 2026 07:54:29 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Ketil Johnsen <ketil.johnsen@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/8] drm/panthor: Explicit expansion of locked VM region
Date: Thu, 07 May 2026 16:54:21 +0200
Message-ID: <vq-4uSFHRCWR0Whm98eJ2Q@collabora.com>
In-Reply-To: <kC1hpRBAS8uGaw7vVFyW2g@collabora.com>
References:
 <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-7-ketil.johnsen@arm.com>
 <kC1hpRBAS8uGaw7vVFyW2g@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: AABA54EAB8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60826-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com];
	RSPAMD_URIBL_FAIL(0.00)[arm.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[collabora.com:query timed out];
	RSPAMD_EMAILBL_FAIL(0.00)[ketil.johnsen.arm.com:server fail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Action: no action

On Wednesday, 6 May 2026 17:14:45 Central European Summer Time Nicolas Frat=
taroli wrote:
> On Tuesday, 5 May 2026 16:05:12 Central European Summer Time Ketil Johnse=
n wrote:
> > Currently the panthor_vm_lock_region() function will implicitly expand
> > an already locked VM region. This can be problematic because the caller
> > do not reliably know if it needs to call panthor_vm_unlock_region()
> > or not.
> >=20
> > Worth noting, there is currently no known issues with this as the code
> > is written today.
> >=20
> > This change introduces panthor_vm_expand_region() which will only work
> > if there is already a locked VM region. This again means that the
> > original lock and unlock functions can work as a pair. This pairing is
> > needed for subsequent protected memory changes.
> >=20
> > Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 69 +++++++++++++++++++--------
> >  1 file changed, 50 insertions(+), 19 deletions(-)
> >=20
>=20
> While trying this series, I attempted my usual
> `modprobe -r panthor && modprobe panthor protected_heap_name=3Ddefault_cm=
a_region`.
>=20
> Unfortunately, it oopses when attempting to unmap the sg for a bo labeled
> "FW section" on panthor module unload, and I bisected it to this patch.

Okay, so this one is due to the iomem access rework having landed
in drm-misc-next already, but this series being based on something
before that, so now all the new gpu_read(_.*)? and gpu_write.* calls
pass a panthor_device to something that expects the iomem. Since the
iomem uses void pointers, this wasn't caught by the compiler.

So, no "real" bug here, just an incredible dice roll for luck from my side.

Kind regards
Nicolas Frattaroli

>=20
> The oops:
>=20
> [  598.515550] Unable to handle kernel paging request at virtual address =
0000000000400267
> [  598.516864] Mem abort info:
> [  598.517676]   ESR =3D 0x0000000096000004
> [  598.518560]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [  598.520414]   SET =3D 0, FnV =3D 0
> [  598.521275]   EA =3D 0, S1PTW =3D 0
> [  598.522099]   FSC =3D 0x04: level 0 translation fault
> [  598.523069] Data abort info:
> [  598.524311]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
> [  598.525566]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [  598.526850]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [  598.527905] user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000104056000
> [  598.529019] [0000000000400267] pgd=3D0000000000000000, p4d=3D000000000=
0000000
> [  598.530170] Internal error: Oops: 0000000096000004 [#1]  SMP
> [  598.531158] Modules linked in: btusb btrtl btmtk btintel btbcm bluetoo=
th ecdh_generic ecc kpp snd_soc_hdmi_codec cfg80211 r8169 rfkill_gpio pwm_f=
an rfkill snd_soc_es8316 rtc_hym8563 rk805_pwrkey at24 fusb302 tcpm aux_hpd=
_bridge display_connector snd_soc_simple_card phy_rockchip_samsung_hdptx ph=
y_rockchip_usbdp rockchip_thermal typec phy_rockchip_naneng_combphy rockchi=
p_saradc industrialio_triggered_buffer kfifo_buf rockchipdrm inno_hdmi dw_d=
p hantro_vpu rockchip_vdec dw_mipi_dsi2 v4l2_jpeg v4l2_vp9 rockchip_rga dw_=
mipi_dsi v4l2_h264 synopsys_hdmirx v4l2_dv_timings spi_rockchip_sfc videobu=
f2_dma_contig videobuf2_dma_sg v4l2_mem2mem videobuf2_memops dw_hdmi_qp onb=
oard_usb_dev analogix_dp videobuf2_v4l2 videobuf2_common snd_soc_rockchip_i=
2s_tdm dw_hdmi videodev mc drm_display_helper nvme cec panthor(-) drm_gpuvm=
 drm_exec gpu_sched drm_dp_aux_bus drm_dma_helper drm_client_lib nvme_core =
drm_kms_helper drm pci_endpoint_test backlight snd_soc_audio_graph_card snd=
_soc_simple_card_utils fuse dm_mod
> [  598.541237] CPU: 6 UID: 0 PID: 806 Comm: modprobe Not tainted 7.1.0-rc=
2-00726-g8ab0a3092b56-dirty #2 PREEMPT
> [  598.542733] Hardware name: Radxa ROCK 5T (DT)
> [  598.543746] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [  598.544991] pc : dma_unmap_sg_attrs (kernel/dma/mapping.c:0)
> [  598.546021] lr : panthor_gem_free_object (include/linux/dma-mapping.h:=
565 drivers/gpu/drm/panthor/panthor_gem.c:308 drivers/gpu/drm/panthor/panth=
or_gem.c:469) panthor
> [  598.547180] sp : ffff80008835bb90
> [  598.548123] x29: ffff80008835bb90 x28: ffff00012610bf00 x27: 000000000=
0000000
> [  598.549412] x26: 0000000000000000 x25: 0000000000000000 x24: 000000000=
0000000
> [  598.550696] x23: ffff000127194600 x22: ffff0001271943d0 x21: ffff00011=
8671000
> [  598.551984] x20: ffff000127194200 x19: ffff000127194600 x18: 000000000=
02ab980
> [  598.553273] x17: 00000000002ab980 x16: ffffa39a6b372a04 x15: 000000000=
0000000
> [  598.554568] x14: 0000000000000010 x13: 0000000000000000 x12: 000000000=
000003c
> [  598.555864] x11: 0000000000000002 x10: ffff000100a5d000 x9 : ffff00011=
8671000
> [  598.557164] x8 : ffff000102f8b490 x7 : ffff000149569000 x6 : ffff00014=
9569000
> [  598.558461] x5 : ffff000100faa7e8 x4 : 0000000000000000 x3 : 000000000=
0000000
> [  598.559763] x2 : 0000000000000010 x1 : ffff000127194000 x0 : 000000000=
040000f
> [  598.561069] Call trace:
> [  598.561961]  dma_unmap_sg_attrs (kernel/dma/mapping.c:0) (P)
> [  598.563038] panthor_gem_free_object (include/linux/dma-mapping.h:565 d=
rivers/gpu/drm/panthor/panthor_gem.c:308 drivers/gpu/drm/panthor/panthor_ge=
m.c:469) panthor
> [  598.564218] drm_gem_object_free (drivers/gpu/drm/drm_gem.c:1148) drm
> [  598.565386] panthor_kernel_bo_destroy (include/linux/kref.h:65 include=
/drm/drm_gem.h:565 include/drm/drm_gem.h:578 drivers/gpu/drm/panthor/pantho=
r_gem.c:1317) panthor
> [  598.566575] panthor_fw_unplug (drivers/gpu/drm/panthor/panthor_fw.c:13=
06) panthor
> [  598.567705] panthor_device_unplug (drivers/gpu/drm/panthor/panthor_dev=
ice.c:103) panthor
> [  598.568878] panthor_remove (drivers/gpu/drm/panthor/panthor_drv.c:1846=
) panthor
> [  598.569991]  platform_remove (drivers/base/platform.c:1435)
> [  598.571029]  device_release_driver_internal (drivers/base/dd.c:619 dri=
vers/base/dd.c:1352 drivers/base/dd.c:1375)
> [  598.572209]  driver_detach (drivers/base/dd.c:1438)
> [  598.573237]  bus_remove_driver (drivers/base/bus.c:825)
> [  598.574304]  driver_unregister (drivers/base/driver.c:277)
> [  598.575363]  platform_driver_unregister (drivers/base/platform.c:920)
> [  598.576494] cleanup_module (drivers/gpu/drm/panthor/panthor_devfreq.c:=
134) panthor
> [  598.577617]  __arm64_sys_delete_module (kernel/module/main.c:863 kerne=
l/module/main.c:804 kernel/module/main.c:804)
> [  598.578751]  invoke_syscall (arch/arm64/kernel/syscall.c:35 arch/arm64=
/kernel/syscall.c:49)
> [  598.579794]  el0_svc_common (arch/arm64/kernel/syscall.c:121)
> [  598.580842]  do_el0_svc (arch/arm64/kernel/syscall.c:140)
> [  598.581862]  el0_svc (arch/arm64/kernel/entry-common.c:723)
> [  598.582853]  el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:74=
2)
> [  598.583949]  el0t_64_sync (arch/arm64/kernel/entry.S:594)
>=20
> Kind regards,
> Nicolas Frattaroli
>=20
>=20
>=20





