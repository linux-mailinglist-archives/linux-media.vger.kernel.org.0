Return-Path: <linux-media+bounces-40448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA9B2E00B
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 911855E20D4
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24ABF320CBA;
	Wed, 20 Aug 2025 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="k/UopcBB"
X-Original-To: linux-media@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A36321430
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 14:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701685; cv=none; b=QxxTe85pthDB1K5kJLujPshCtinK2tW7W9W0vaVvhSc1oFn9DEsxUEWY482ZSDse/UU16obDPwTzGQxdSBVTL4lK70cdeTO2L/lRTtPRMpwcZGN+wqRPXBjP9klt7lUdmPNQPWP7r4RNMrqfIeXjdMLTx7jb+XeMgkBXz3qu+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701685; c=relaxed/simple;
	bh=Z0cFdbX/huRNt+rkKdguvr+JMHQ4LJ1mq0ULRA6KwE8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=blmyoaUyvGSamcy7XK0auz75+IIE57I5TtrfAAtWkzElISEKz+9g5ATuaFFjjAkp0I5i3atvng3aP23a2tIHHvMJ2J5m3efNdRWepoB9CoFmht1z2vNWBL0xhaM5li2kJNvM5yb3K2726e58CC4VLoIsJWxvJ5NT3KtkA/vP46Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=k/UopcBB; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B0A14240027
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 16:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1755701675; bh=RuQEgRxHcjCSAwP9bDowwwjk2VbVjxN07stQ0dNve5k=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=k/UopcBBT/aZjxVUhU/Vl6bkhobYNTOs0CA/eX5BwZMVlXnhQemGZYdcsX/yRTj70
	 evwvbtbjB02Ed8DOkSVcqqmIKWPiW3QgL44JL0RG4mn1Q7F21+PS7CGrvVLxyzPmi5
	 pfeRNpgJFTFKigNq0BHJxk0hFA5lyzxdfLR2DPpAwhbf48lanbAQrkU4oTvi/WWh/8
	 IYooTtErPW5L9j4ktoxeGX0y/xPPaeLa5sWzAzHTL01+MBqbUeG754+Zfxzofqn6Wd
	 uPhN3owEWQR/6AYYWZ7RMSFCtSl9B2+NUd8ig2wIpViCniOXxvwo2owBS9W49sfnIW
	 eU4w0laXwMenw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4c6Txh6q4Pz9rxQ;
	Wed, 20 Aug 2025 16:54:32 +0200 (CEST)
Message-ID: <af64e20ba242d4742f650057254029257a40ae79.camel@posteo.de>
Subject: Re: [PATCH] media: nxp: imx8-isi: check return value of
 media_pad_remote_pad_first()
From: Martin Kepplinger-Novakovic <martink@posteo.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 20 Aug 2025 14:54:35 +0000
In-Reply-To: <20250820140135.GA6190@pendragon.ideasonboard.com>
References: <20250205172957.182362-1-martink@posteo.de>
	 <1f4b4e707762c0926c0acece18cb9cc3ecc242bc.camel@posteo.de>
	 <20250820140135.GA6190@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Am Mittwoch, dem 20.08.2025 um 17:01 +0300 schrieb Laurent Pinchart:
> Hi Martin,
>=20
> On Thu, Feb 06, 2025 at 08:49:37AM +0000, Martin Kepplinger wrote:
> > Am Mittwoch, dem 05.02.2025 um 17:29 +0000 schrieb Martin
> > Kepplinger-
> > Novakovi=C4=87:
> > > media_pad_remote_pad_first() return NULL if "no enabled link has
> > > been
> > > found".
> > > Check for that.
> > >=20
> > > backstory
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > While trying to get a (Y10 grey) sensor working on imx8mp
> > > (v6.12.12
> > > now and
> > > I know the hardware works on an ancient nxp-kernel),
> > > I tried to enable the sensor link, set formats and stream:
> >=20
> > btw, that's roughly the
> > driver:=C2=A0
> > https://github.com/VC-MIPI-modules/vc_mipi_nxp/tree/master/src
> > that might need additions to with recent mainline kernels. Will the
> > sensor be the reason for the link not being found here?
>=20
> I've submitted
> https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pinchar=
t@ideasonboard.com
> ,
> which should fix this issue in a more generic way.
>=20


Hi, thank you. As posted over there, this indeed fixes the crash
itself.

P.S.:
Not that you should care :) But as for my specific "vision components"
sensor I want to use here, where this rpi-driver exists:
https://github.com/VC-MIPI-modules/vc_mipi_raspi/blob/main/src/vc_mipi_came=
ra/vc_mipi_camera.c
a script like

media-ctl -d 1 --links "'vc_mipi_camera 3-001a':0->'csis-
32e50000.csi':0[1]"

# format settings for mipi rx and ISI
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"vc_mipi_camera 3-
001a":0[fmt:Y10_1X10/2592x1944 field:none]'
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"csis-
32e50000.csi":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
media-ctl -d "platform:32e00000.isi" --set-v4l2
'"crossbar":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
media-ctl -d "platform:32e00000.isi" --set-v4l2
'"mxc_isi.0":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'

v4l2-ctl -d /dev/video2 --set-fmt-
video=3Dwidth=3D2592,height=3D1944,pixelformat=3D'Y10 '
v4l2-ctl --verbose --device=3D/dev/video2 --stream-mmap --stream-count=3D10


still fails with


[   34.642252] vc_mipi_camera 3-001a: vc_core_set_format(): Set format:
0x200a (Y10_1X10)
[   34.650227] vc_mipi_camera 3-001a: vc_core_try_format(): Try format
0x200a (Y10_1X10, format: 0x2b)
[   34.659284] vc_mipi_camera 3-001a: vc_core_try_format(): Checking
mode 0 (format: 0x2b)
[   34.667295] vc_mipi_camera 3-001a: vc_core_calculate_max_exposure():
period_1H_ns: 7407, vmax.max: 1048575, vmax.min: 9
[   34.678083] vc_mipi_camera 3-001a: vc_core_get_optimized_vmax():
vmax_def: 4500, v_factor: 0, height: 1944/1944
[   34.688178] vc_mipi_camera 3-001a:
vc_core_calculate_max_frame_rate(): period_1H_ns: 7407, vmax:
4500/4500, max_frame_rate: 30002
[   34.699833] vc_mipi_camera 3-001a: vc_core_update_controls():
num_lanes: 2, format 43, exposure.max: 7766728 us, framerate.max: 30002
mHz
[   34.712184] vc_mipi_camera 3-001a: vc_core_set_frame(): Set frame
(left: 0, top: 0, width: 2592, height: 1944)
[   34.722208] vc_mipi_camera 3-001a: vc_core_calculate_max_exposure():
period_1H_ns: 7407, vmax.max: 1048575, vmax.min: 9
[   34.733000] vc_mipi_camera 3-001a: vc_core_get_optimized_vmax():
vmax_def: 4500, v_factor: 0, height: 1944/1944
[   34.743112] vc_mipi_camera 3-001a:
vc_core_calculate_max_frame_rate(): period_1H_ns: 7407, vmax:
4500/4500, max_frame_rate: 30002
[   34.754768] vc_mipi_camera 3-001a: vc_core_update_controls():
num_lanes: 2, format 43, exposure.max: 7766728 us, framerate.max: 30002
mHz
VIDIOC_QUERYCAP: ok
		VIDIOC_REQBUFS returned 0 (Success)
		VIDIOC_CREATE_BUFS returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_G_FMT returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_STREAMON returned -1 (Broken pipe)

