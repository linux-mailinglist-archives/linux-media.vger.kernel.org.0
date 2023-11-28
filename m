Return-Path: <linux-media+bounces-1193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2448F7FB5EB
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D41D828271C
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 09:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285C649F80;
	Tue, 28 Nov 2023 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="eVtpW1Ym"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B454109
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 01:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1701164073; x=1701423273;
	bh=CRK7C20YrPxM8btnj+K/OYyYmppC/jXXJ3DZupd/6l8=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eVtpW1Ymfg1SHmuqgte6q4wv5UosgEBhirb/tvT5OfRYwrzygTl4GOQRKgepoTf1K
	 wxdUV4X3AzUKNvBGo3f+mgepCcxyo1aH2sJ5Ax8e2FRZBr2CTBBVpKhugBSGIpLln6
	 PuMBFlfvq4+LoUc5ccCoNh6hxl98zO1gMWJMiofEDyRpugyFj0kDNpVwvflfqOBJP2
	 WL1ifFWVv1KO8dssVWBy+oGCe5doKuEUauv7UqZjdQ+/4YiaB2/HyLNs2vfpB4CQsl
	 cWoHM6lYej/bF74RG+5V+Dw2h0gR5CxZRnKV9L4pK1zlBa5JSoh2KzlkSJlPb7XbMv
	 hWMRQCs43R0Fw==
Date: Tue, 28 Nov 2023 09:34:15 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: rgem0 <rgem0@protonmail.com>
Subject: 20230115205210.20077-1-laurent.pinchart@ideasonboard.com
Message-ID: <MTHBXabvGtupXpPx3DLoDeC__bFtPZDSkuRzPj7x5-gi-GCE3_bJGLpnpFVkt2iMxFMB-ETDnsGQbu8Mwk0uC4kWnNfGIY2fNktVNMb8iHg=@protonmail.com>
Feedback-ID: 32723246:user:proton
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Jan. 16, 2023, 3:11 p.m. UTC, Ricardo Ribalda wrote:

> no need to change any code. Just do:
>=20
> sudo rmmod uvcvideo; sudo modprobe uvcvideo =C2=A0trace=3D0xffffffff
>=20
> then get some frames
>=20
> yavta --capture=3D3 /dev/video0
>=20
> then run dmesg
>=20
> Thanks!



Hi Ricardo,
I have a 4035:4035 and compiled the patched module today.
As I didn't see any update on the patchwork, I suppose no logs were brought=
 to you and therefore thought I could contribute.

Here is the dmesg output:


`[13784.543780] usb 3-6: uvc_v4l2_open
[13784.546197] usb 3-6: uvc_v4l2_mmap
[13784.546384] usb 3-6: uvc_v4l2_mmap
[13784.546497] usb 3-6: uvc_v4l2_mmap
[13784.546583] usb 3-6: uvc_v4l2_mmap
[13784.546668] usb 3-6: uvc_v4l2_mmap
[13784.546762] usb 3-6: uvc_v4l2_mmap
[13784.546853] usb 3-6: uvc_v4l2_mmap
[13784.546943] usb 3-6: uvc_v4l2_mmap
[13784.554953] usb 3-6: Device requested 3060 B/frame bandwidth
[13784.554965] usb 3-6: Selecting alternate setting 11 (3060 B/frame bandwi=
dth)
[13784.555469] usb 3-6: Allocated 5 URB buffers of 32x3060 bytes each
[13785.143551] usb 3-6: Frame complete (EOF found)
[13785.143556] usb 3-6: EOF in empty payload
[13785.143558] usb 3-6: frame 1 stats: 3967/694/4677 packets, 1/3966/4677 p=
ts (early initial), 4676/4677 scr, last pts/stc/sof 2481712061/2486485544/4=
59
[13785.143735] usb 3-6: uvc_v4l2_poll
[13785.243551] usb 3-6: Frame complete (EOF found)
[13785.243557] usb 3-6: frame 2 stats: 88/695/798 packets, 1/87/798 pts (ea=
rly initial), 797/798 scr, last pts/stc/sof 2486500781/2491273546/559
[13785.243749] usb 3-6: uvc_v4l2_poll
[13785.343633] usb 3-6: Frame complete (EOF found)
[13785.343648] usb 3-6: frame 3 stats: 88/694/798 packets, 1/87/798 pts (ea=
rly initial), 797/798 scr, last pts/stc/sof 2491289501/2496061546/658
[13785.343851] usb 3-6: uvc_v4l2_poll
[13785.344131] usb 3-6: uvc_v4l2_poll
[13785.345209] usb 3-6: uvc_v4l2_poll
[13785.345752] usb 3-6: uvc_v4l2_poll
[13785.346174] usb 3-6: uvc_v4l2_release`



And the yavta output:



`Device /dev/video0 opened: ACER HD User Facing: ACER HD Us (usb-0000:00:14=
.0-6).
Video format: YUYV (56595559) 1280x720
8 buffers requested.
length: 1843200 offset: 0
Buffer 0 mapped at address 0x7f9834044000.
length: 1843200 offset: 1843200
Buffer 1 mapped at address 0x7f9833e82000.
length: 1843200 offset: 3686400
Buffer 2 mapped at address 0x7f9833cc0000.
length: 1843200 offset: 5529600
Buffer 3 mapped at address 0x7f9833afe000.
length: 1843200 offset: 7372800
Buffer 4 mapped at address 0x7f983393c000.
length: 1843200 offset: 9216000
Buffer 5 mapped at address 0x7f983377a000.
length: 1843200 offset: 11059200
Buffer 6 mapped at address 0x7f98335b8000.
length: 1843200 offset: 12902400
Buffer 7 mapped at address 0x7f98333f6000.
0 (0) [-] 0 1843200 bytes 13784.183367 1701162393.013189
1 (1) [-] 1 1843200 bytes 13784.767378 1701162393.113229
2 (2) [-] 2 1843200 bytes 13784.867377 1701162393.213291
Captured 2 frames in 0.200301 seconds (9.984973 fps, 27606452.289305 B/s).
8 buffers released.`


Tell me if you need me to provide anything else.
Sorry if this issue has already been solved - I am new to this !

Best Regards

