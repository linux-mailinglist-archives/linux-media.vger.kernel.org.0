Return-Path: <linux-media+bounces-13439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D890B1EE
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D98061F24D1F
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 14:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C011AED36;
	Mon, 17 Jun 2024 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S3HkmBr6"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C91AED24;
	Mon, 17 Jun 2024 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718631817; cv=none; b=NyF3nKvBeuImKxDxQgdwbI9gCwfTRYxJKazqwxWUs5NasgN0VYlqLlPmRt7LYlVrf3raWcd/MYGQHTRj0xPUjB7fpvJ+MuoBQC/oP1YR/LGqot6DUqadlgBiq2TdOXmPnw81Kr19BRe1nWBJilOiN7mn0myE8bW1pP7vPpQj1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718631817; c=relaxed/simple;
	bh=wPdlMn4BkQJ1i+WvuHCmNwqJAwmoMMcYl971v9DomFs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qx4zdbnv2Qg8BSc21KFZfBUvdnlFrBtfowTfiQN0y+m4JuWbkv74F9xTwXYB5/q14HFL6RK66EwJPSS5UgdK7VOiM0U2TioNGxcYc+m8N7YGkLWmVrTD6VTIZgbXZehSzpel+IjPPkHcdiU+YdCsACFoD+ykculXWQuS1HIh0o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S3HkmBr6; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718631814;
	bh=wPdlMn4BkQJ1i+WvuHCmNwqJAwmoMMcYl971v9DomFs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=S3HkmBr6agUfW95p6IZ5XRCZ8SXGakexEfxerssqNteb6ERE+9IrPn+eIzXQ3pPwT
	 QRQcBuxxe/IdVRooZRu4o6xbj88PsaPT0WRD7HzPGgSeFCnVoavP/DQJB7t8eKL9gP
	 GEClxw+4Gn1LePmGb7jSe7RM4T09+hfsHST1NeqyQDdJOHvOdbpbP0LVG7K7j/DxS+
	 gc2UJuy5w7VXuaOlPt+5WIvUXr4S97awQsFm5m1SjMBFPkxpnEP0rzHEhR5UPX99je
	 f417DkkCcpc9mkI4RuDtBywU40yoThKahWTcPehbESaQIyfFwJhaHm4gPpQYvorx3E
	 jb7T1pIkbGI/Q==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6CB9E3782121;
	Mon, 17 Jun 2024 13:43:32 +0000 (UTC)
Message-ID: <ec8e632a80a8d4ded6f692d92dff9f699881773e.camel@collabora.com>
Subject: Re: [PATCH v4 00/11] media: rkvdec: Add H.264 High 10 and 4:2:2
 profile support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Diederik de Haas <didi.debian@cknow.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,  Andy
 Yan <andyshrk@163.com>
Cc: Alex Bee <knaerzche@gmail.com>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>, Sebastian Fricke
	 <sebastian.fricke@collabora.com>, Christopher Obbard
	 <chris.obbard@collabora.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 17 Jun 2024 09:43:29 -0400
In-Reply-To: <122755518.lCnTqr06ca@bagend>
References: <20231105165521.3592037-1-jonas@kwiboo.se>
	 <122755518.lCnTqr06ca@bagend>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le dimanche 16 juin 2024 =C3=A0 11:47 +0200, Diederik de Haas a =C3=A9crit=
=C2=A0:
> On Sunday, 5 November 2023 17:54:59 CEST Jonas Karlman wrote:
> > This is a revival of a 3 year old series [1] now that NV15/NV20/NV30 su=
pport
> > for display driver have landed in mainline tree.
> >=20
> > This series adds H.264 High 10 and 4:2:2 profile support to the Rockchi=
p
> > Video Decoder driver.
> >=20
> > Patch 1 adds helpers for calculating plane bytesperline and sizeimage.
> > Patch 2 adds two new pixelformats for semi-planer 10-bit 4:2:0/4:2:2 YU=
V.
> >=20
> > Patch 3 change to use bytesperline and buffer height to configure strid=
es.
> > Patch 4 change to use values from SPS/PPS control to configure the HW.
> > Patch 5 remove an unnecessary call to validate sps at streaming start.
> >=20
> > Patch 6-10 refactor code to support filtering of CAPUTRE formats based
> > on the image format returned from a get_image_fmt ops.
> >=20
> > Patch 11 adds final bits to support H.264 High 10 and 4:2:2 profiles.
> >=20
> > Tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
> >=20
> >   v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
> >   ...
> >   Total for rkvdec device /dev/video1: 46, Succeeded: 46, Failed: 0,
> > Warnings: 0
> >=20
> >   Running test suite JVT-FR-EXT with decoder FFmpeg-H.264-V4L2-request
> >   ...
> >   Ran 65/69 tests successfully
> >=20
> >   Running test suite JVT-AVC_V1 with decoder FFmpeg-H.264-V4L2-request
> >   ...
> >   Ran 127/135 tests successfully
> >=20
> > Before this series:
> >=20
> >   Running test suite JVT-FR-EXT with decoder FFmpeg-H.264-V4L2-request
> >   ...
> >   Ran 44/69 tests successfully
> >=20
> > ...
> >=20
> > Following commits adds support for NV15/NV20/NV30 to VOP driver:
> > 728c15b4b5f3 ("drm/fourcc: Add NV20 and NV30 YUV formats")
> > d4b384228562 ("drm/rockchip: vop: Add NV15, NV20 and NV30 support")
> >=20
> > To fully runtime test this series you may need above drm commits and ff=
mpeg
> > patches from [2], this series and drm patches is also available at [3].
> >=20
> > [1]
> > https://lore.kernel.org/linux-media/20200706215430.22859-1-jonas@kwiboo=
.se/
> > [2] https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-n6.1-dev/ [3]
> > https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-high-10=
-v4/
> > [4] https://gist.github.com/Kwiboo/f4ac15576b2c72887ae2bc5d58b5c865 [5]
> > https://gist.github.com/Kwiboo/459a1c8f1dcb56e45dc7a7a29cc28adf
>=20
> Reviving this old thread now that rkvdec2 'stuff' emerged.
> I have (actually) done quite some tests with this (and "media: rkvdec: Ad=
d=20
> HEVC backend" patch set) and they have been part of my kernel builds ever=
=20
> since.
> I _think_, but don't know, that is relevant for Andy's question:
>=20
> On zondag 16 juni 2024 08:58:20 CEST Andy Yan <andyshrk@163.com> wrote:
> > How can I test these patches? Do they require any additional userspace
> > patches?
>=20
> I have the same question and I think you'd need this and the HEVC patch s=
et=20
> and then also patch FFmpeg and then it should enable HW acceleration.
> So my question boils down to: with the rkvdec2 patch set, should V4L2-req=
uests=20
> now also work with rkvdec, so not just Hantro anymore?

FFmpeg changes are still downstream, and different people (even within
LibreELEC) seems to have slightly different version or alteration. It would=
 be
really nice if this work could move upstream FFMpeg so that we can be more =
sure
what what "working with FFmpeg v4l2-requests" means.

Meanwhile, support in upstream GStreamer is stable on Hantro G2 and Mediate=
k
VCODEC. In theory, it works fine with RKVDEC, and it will certainly work wi=
th
RKVDEC2 when we get to write the HEVC support.

>=20
> BTW: the libdrm commits have been merged upstream quite some time ago, so=
 if=20
> you have a recent version of that, you don't need to patch that.
> If you use FFmpeg 7.0, then Jonas has a branch for that too (haven't trie=
d it=20
> yet though).
>=20
> FWIW: my test results were a bit mixed. I didn't post them before as I do=
n't=20
> fully/really understand this 'video stuff', and I didn't want you all to =
suffer=20
> from what was likely a PEBKAC issue.
>=20
> On my PineTab2 (rk3566) I had some h.264 videos HW accelerated, but not a=
ll.=20
> My guess is that it's related to the resolution. 1920x1080 worked, while =
it=20
> didn't work with a 1280x640 video. The video still played, just not HW=
=20
> accelerated. IOW: improvements in some and otherwise it was just rendered=
 by=20
> the CPU (I think), just like before.

This is because all rk35XX have two hardware video decoders for H.264. This=
 is
not to be be confused with rkvdec which is gone. It has a modified Hantro G=
1
core (limited to 1080p60) and rkvdec2 core (driver in progress). I don't th=
ink
Rockchip really expected the first one to be ever used, but upstream has be=
en
pushy and its now enabled upstream. That has a side effect, which is that
userspace will have to work harder on these platform to pick the right HW f=
or
the task.

>=20
> On my Rock64 I got a pink tint with all videos, like described here:
> https://github.com/mpv-player/mpv/issues/12968
> IIUC, that's actually a problem in the lima driver?

Its not clear from the bug report. This visual artefact has been seen with
wayland compositors lately (notably weston). Notably, this can happen if yo=
u try
and import NV12 with mesa (panfrost and lima included) but forcing a TEXTUR=
E_2D
target instead of external target. Normally this should be rejected by mesa=
, but
is accidentally not, and cause miss-render.

Nicolas

>=20
> Cheers,
>   Diederik


