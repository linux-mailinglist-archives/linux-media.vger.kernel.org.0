Return-Path: <linux-media+bounces-25700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C8EA2975B
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7951F3A2062
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756A61FBEAF;
	Wed,  5 Feb 2025 17:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="PL1hactd"
X-Original-To: linux-media@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766401519AD
	for <linux-media@vger.kernel.org>; Wed,  5 Feb 2025 17:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738776626; cv=none; b=MJ4Une0m+61Qmsbmncka97Gk8WMEcQ7nYuNKosXNnJvfDib90jNuFOblvGIsBhsPriqpF5U/iN9D8qyBgehpmGBM9zwp6ZEpQVJoO/+u3zQ/+7VUkWDM79Se9VYrFhtJfYBdapn8lTR9lo43CqwTyXyoHUkOWqj7tZgjjlcL6J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738776626; c=relaxed/simple;
	bh=f2yEvU4TM3aZYdPhq5G+l+SmpWWP3YrRm11kspLYSHc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mtwlovdtMWmCdHdxjDVA52SNADzMRQrZwINvFQsVh9KphQ4srdRUFmI53j4eSwwriinfNUSM89fpXM6iMpC35JKpIuH0OK4bfQshRobAmP0mnQB1vzUonIob6PaXIQxEoC7KXmfKsCDzjQ50sjxmIxGKD9Z3hQzYs0tCmrmVdcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=PL1hactd; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 84A68240027
	for <linux-media@vger.kernel.org>; Wed,  5 Feb 2025 18:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1738776622; bh=f2yEvU4TM3aZYdPhq5G+l+SmpWWP3YrRm11kspLYSHc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=PL1hactd8RdLkszMUmEdepRdB2nlcyk9mAUuzhmQDw87OY0Wy6vu09upgrTLphbd1
	 HQwrtbjeGyVijzLY1XSUIT7ybkpqK1tOeUFfgt9m6LvXqiyyTwugJHUVhxkzSj+WaJ
	 1aF5YpEbpw+E9NOC09TRUTFgVL+FHNk/u3IHwDGZYqnvTFN6orpvybyLfPDAJeLDGY
	 Z31ALiMFc9Hx21frrtnfjRFp5SJ9IpR3PhkFNTIgAvxmEVof7+/3tVtU26RSdGekr/
	 C8SqW2TzhnJk5F4oYnh69j5tuebBTEelGWnF1K1zmCTK2volCF56HaVepfjXvtuumd
	 2fZzdoQxB3snw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yp6gv6fyqz9rxK;
	Wed,  5 Feb 2025 18:30:19 +0100 (CET)
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: [PATCH] media: nxp: imx8-isi: check return value of media_pad_remote_pad_first()
Date: Wed,  5 Feb 2025 17:29:57 +0000
Message-Id: <20250205172957.182362-1-martink@posteo.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

media_pad_remote_pad_first() return NULL if "no enabled link has been found".
Check for that.

backstory
=========
While trying to get a (Y10 grey) sensor working on imx8mp (v6.12.12 now and
I know the hardware works on an ancient nxp-kernel),
I tried to enable the sensor link, set formats and stream:

media-ctl -d 1 --links "'vc-mipi-cam 3-001a':0->'csis-32e50000.csi':0[1]"
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"vc-mipi-cam 3-001a":0[fmt:Y10_1X10/2592x1944 field:none]'
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"csis-32e50000.csi":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"crossbar":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"mxc_isi.0":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
v4l2-ctl -d /dev/video1 --set-fmt-video=width=2592,height=1944,pixelformat="Y10 "
v4l2-ctl --verbose --device /dev/video1 --stream-mmap

and what I got was the NULL pointer deref, I append below. With this patch I
at least get a nice "VIDIOC_STREAMON returned -1 (Broken pipe)".

[   29.936640] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
[   29.947993] Mem abort info:
[   29.950791]   ESR = 0x0000000096000006
[   29.954544]   EC = 0x25: DABT (current EL), IL = 32 bits
[   29.959861]   SET = 0, FnV = 0
[   29.962935]   EA = 0, S1PTW = 0
[   29.966084]   FSC = 0x06: level 2 translation fault
[   29.970977] Data abort info:
[   29.973860]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
[   29.979358]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   29.984414]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   29.989740] user pgtable: 4k pages, 48-bit VAs, pgdp=000000004536d000
[   29.996186] [0000000000000020] pgd=08000000452ec003, p4d=08000000452ec003, pud=080000004361a003, pmd=0000000000000000
[   30.006820] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
[   30.013087] Modules linked in:
[   30.016143] CPU: 3 UID: 0 PID: 433 Comm: v4l2-ctl Not tainted 6.12.12-ge-24.09+-gd7393141dd76 #104
[   30.025102] Hardware name: MMI4.0 i.MX8MPlus (DT)
[   30.029804] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   30.036766] pc : mxc_isi_crossbar_xlate_streams+0xb0/0x10c
[   30.042258] lr : mxc_isi_crossbar_xlate_streams+0xac/0x10c
[   30.047745] sp : ffff800083db3930
[   30.051058] x29: ffff800083db3930 x28: ffff800083db39e8 x27: ffff800083db39f0
[   30.058200] x26: ffff800083db39ec x25: ffff000002eff0a8 x24: 0000000000000000
[   30.065339] x23: 0000000000000001 x22: 0000000000000001 x21: 0000000000000001
[   30.072478] x20: 0000000000000003 x19: ffff000003e3c4b8 x18: 0000000000000000
[   30.079616] x17: 0000000000000000 x16: ffff800080000000 x15: 000000000099e000
[   30.086756] x14: 0000000000000002 x13: 0000000000036754 x12: 0000000000000010
[   30.093894] x11: 0000000000000001 x10: 0000000000000064 x9 : 0000000000000004
[   30.101032] x8 : ffff00000348332c x7 : ffff000003483200 x6 : ffff800083db39ec
[   30.108172] x5 : ffff000003483000 x4 : 000000000fffffff x3 : ffff000002eff110
[   30.115312] x2 : ffff0000048a5270 x1 : 0000000000000000 x0 : 0000000000000000
[   30.122453] Call trace:
[   30.124898]  mxc_isi_crossbar_xlate_streams+0xb0/0x10c
[   30.130038]  mxc_isi_crossbar_enable_streams+0x44/0x16c
[   30.135263]  v4l2_subdev_enable_streams.part.0+0x130/0x2ac
[   30.140750]  v4l2_subdev_enable_streams+0x48/0x68
[   30.145454]  mxc_isi_pipe_enable+0x1d4/0x24c
ed 0 (Success)
		[V  I D3I0O.C149725]  mxc_isi_vb2_start_streaming+0xa0/0xe4
[   30.156596]  vb2_start_streaming+0x6c/0x180
[   30.160782]  vb2_core_streamon+0x100/0x1c4
[   30.164880]  vb2_streamon+0x18/0x64
[   30.168369]  mxc_isi_video_streamon+0x284/0x2f4
[   30.172901]  v4l_streamon+0x24/0x30
[   30.176391]  __video_do_ioctl+0x15c/0x3c0
[   30.180402]  video_usercopy+0x1a4/0x67c
[   30.184240]  video_ioctl2+0x18/0x24
[   30.187732]  v4l2_ioctl+0x40/0x60
[   30.191047]  __arm64_sys_ioctl+0xac/0xf0
[   30.194972]  invoke_syscall+0x48/0x110
[   30.198726]  el0_svc_common.constprop.0+0x40/0xe0
[   30.203431]  do_el0_svc+0x1c/0x28
[   30.206747]  el0_svc+0x30/0xd0
[   30.209806]  el0t_64_sync_handler+0x100/0x12c
[   30.214164]  el0t_64_sync+0x190/0x194
[   30.217830] Code: 937a7f00 8b000020 97fec7a3 aa0003e1 (f9401000)
[   30.223923] ---[ end trace 0000000000000000 ]---
_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
---

the real problem
================
Obviously "broken pipe" for "stream on" is still not what I want :)

The "no enabled link has been found" seems to happen during "VIDIOC_QBUF".

Does anything come to mind what goes wrong here for me?

thanks a lot for having a look,

                                      martin




 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd173..e53a8e01c8be1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -160,6 +160,11 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
 	}
 
 	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
+	if (!pad) {
+		dev_warn(xbar->isi->dev, "no enabled link has been found.\n");
+		return ERR_PTR(-EPIPE);
+	}
+
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 	if (!sd) {
 		dev_dbg(xbar->isi->dev,
-- 
2.39.5


