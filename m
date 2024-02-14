Return-Path: <linux-media+bounces-5162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C8854EE6
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 17:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1C40B278CB
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 16:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D9441C6B;
	Wed, 14 Feb 2024 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PAh8yZUK"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0350F604BC
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707928842; cv=none; b=aeii7bs0VjoEO9clpm1QIc6nYma6wu5kJitROg2jXkK4ENixI2u0XzQKbjKjWrVkWkSSkri2df0CcdNtetRGURlBJ1+HD+r6jL9uuidy5x1otlKFm1jYUM79AReVld1C3lEC4UhVzqQSGgTHMIPeoL3ICmenrE/75Y5PRrGD824=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707928842; c=relaxed/simple;
	bh=ogscxsj8diiw3J3rmEz4VsmbyG97kKILvylY5O6qXmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OagX3MvzJKsYC8qxNvaupt7vx5VBD+bfASt1gSxGF87fr3tSo7ZDF+GLxI48nWgGFhf1Qp5a3Fh57Xbm3H+S4c6ShkpZ/1/xz/8IOsMT24BMAYOMk/mVBxrSig+ELqekvhZTvsnZwwgYehGTkh/B9Uhie4JLmWS+5On/M95dQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PAh8yZUK; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707928839;
	bh=ogscxsj8diiw3J3rmEz4VsmbyG97kKILvylY5O6qXmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PAh8yZUKVZs0atFbYtV0kFVfwnnDBzCOf99pmjVw+UeHtvNsskQSVO5B4G2hqb2jw
	 xZsrb+hy7sgOu2Y/YxrMGgxyTwyPSDhd6NMMI8xeYXjkS8q1CXpiYvFkAcqvuTp6M0
	 hoYY2LSnqUFik35e7P5Wh0lSiqK82cCy0TP+XcMH54VlkSKyoYknnQxQC+ZismCoPI
	 aEjvuTVh/6t87meW4XzPZqRDTYkU+plNYN9jb4MLDKCH0yhz32jRr6U2K2mbXp5iH5
	 5RU/pzUBavFDxci67ZIPR/hbdAkWKERsb4+cZj3wjT6gsxQkxeVVpnZ+TRzyk5V99E
	 B8B299nE2qcXw==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9AC5F3781F8E;
	Wed, 14 Feb 2024 16:40:38 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Subject: Re: [GIT PULL FOR v6.9] Various fixes and enhancements
Date: Wed, 14 Feb 2024 11:40:49 -0500
Message-ID: <11131784.CDJkKcVGEf@arisu>
In-Reply-To: <12e4850c-0ae2-4d9f-83b7-8c762e6e3756@xs4all.nl>
References: <12e4850c-0ae2-4d9f-83b7-8c762e6e3756@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5104106.5fSG56mABF";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5104106.5fSG56mABF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [GIT PULL FOR v6.9] Various fixes and enhancements
Date: Wed, 14 Feb 2024 11:40:49 -0500
Message-ID: <11131784.CDJkKcVGEf@arisu>
In-Reply-To: <12e4850c-0ae2-4d9f-83b7-8c762e6e3756@xs4all.nl>
References: <12e4850c-0ae2-4d9f-83b7-8c762e6e3756@xs4all.nl>
MIME-Version: 1.0

Hi Hans,

I see that my visl patches on that branch are the v4. But I recently sent a=
=20
v5, fixing a checkpatch warning (but also fixed by you) and removing unnece=
ssary=20
code changes: https://lore.kernel.org/linux-media/20240117151202.405426-1-d=
etlev.casanova@collabora.com/

These are not big changes, so I don't mind keeping v4 and dropping v5 if th=
at=20
is easier for you.

Regards,
Detlev

On Wednesday, February 14, 2024 10:17:54 A.M. EST Hans Verkuil wrote:
> If there are no comments, then I'll push this tomorrow or Friday.
>=20
> Regards,
>=20
> 	Hans
>=20
> The following changes since commit 8c64f4cdf4e6cc5682c52523713af8c39c94e6=
d5:
>=20
>   media: edia: dvbdev: fix a use-after-free (2024-02-07 06:06:03 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.9d
>=20
> for you to fetch changes up to 10a934521ad37903bc290ed9b5fac5cd3c1e26a0:
>=20
>   media: v4l: marvell: select CONFIG_V4L2_ASYNC where needed (2024-02-14
> 16:14:11 +0100)
>=20
> ----------------------------------------------------------------
> Tag branch
>=20
> ----------------------------------------------------------------
> Andrzej Pietrasiewicz (1):
>       media: videobuf2: Add missing doc comment for waiting_in_dqbuf
>=20
> Arnd Bergmann (3):
>       media: sta2x11: fix irq handler cast
>       media: pvrusb2: fix pvr2_stream_callback casts
>       media: v4l: marvell: select CONFIG_V4L2_ASYNC where needed
>=20
> Changhuang Liang (1):
>       staging: media: starfive: Set 16 bpp for capture_raw device
>=20
> Colin Ian King (2):
>       media: tda18271: remove redundant assignment to variable bcal
>       media: i2c: st-vgxy61: remove redundant initialization of pointer m=
ode
>=20
> Daniil Dulov (2):
>       media: go7007: add check of return value of go7007_read_addr()
>       media: pvrusb2: remove redundant NULL check
>=20
> Detlev Casanova (4):
>       media: visl,vidtv: Set parameters permissions to 0444
>       media: visl: Add a tpg_verbose parameter
>       doc: media: visl: Document tpg_verbose parameter
>       media: visl: Add codec specific variability on output frames
>=20
> Hans Verkuil (3):
>       media: staging: imx: controls are from another device, mark this
>       media: v4l2-ctrls-core.c: check min/max for menu, controls
>       media: core: v4l2-ioctl.c: use is_valid_ioctl()
>=20
> Hsia-Jun(Randy) Li (1):
>       media: v4l2-mem2mem: fix mem order in last buf
>=20
> Jernej Skrabec (4):
>       media: cedrus: h265: Fix configuring bitstream size
>       media: sun8i-di: Fix coefficient writes
>       media: sun8i-di: Fix power on/off sequences
>       media: sun8i-di: Fix chroma difference threshold
>=20
> Kells Ping (1):
>       media: platform: cros-ec: Add Dita to the match table
>=20
> Kevin Hao (3):
>       media: dvb_frontend: Use wait_event_freezable_timeout() for freezab=
le
> kthread media: msp3400: Use wait_event_freezable_timeout() in msp_sleep()
> media: pvrusb2: Use wait_event_freezable() for freezable kthread
>=20
> Lucas Stach (1):
>       media: imx: csc/scaler: fix v4l2_ctrl_handler memory leak
>=20
> Markus Elfring (1):
>       media: ti: Use devm_platform_ioremap_resource() in ti_csi2rx_probe()
>=20
> Matthias Schwarzott (1):
>       media: zl10036: Fix my email address
>=20
> Ming Qian (2):
>       media: imx-jpeg: Support for negotiating bytesperline with client
>       media: amphion: Abort vpu parsing directly in seek
>=20
> Niklas S=F6derlund (1):
>       media: rcar-csi2: Move driver to renesas directory
>=20
> Ricardo B. Marliere (1):
>       media: bt8xx: make bttv_sub_bus_type const
>=20
> Vincenzo Mezzela (1):
>       docs: media: fix typo in docs
>=20
> XueBing Chen (4):
>       media: dvb-frontends: Clean up errors in cx24110.h
>       media: stv6110x: Clean up errors in stv6110x.h
>       media: Clean up errors in bcm3510_priv.h
>       media: dvb-frontends: Clean up errors in tda8083.h
>=20
> Yang Li (1):
>       media: mediatek: vcodec: Remove unneeded semicolon
>=20
>  Documentation/admin-guide/media/visl.rst                                =
  |
>  12 +- Documentation/driver-api/media/v4l2-subdev.rst                    =
 =20
>      |   2 +- MAINTAINERS                                                =
 =20
>             |   1 + drivers/media/cec/platform/cros-ec/cros-ec-cec.c     =
 =20
>                   |   2 + drivers/media/dvb-core/dvb_frontend.c          =
 =20
>                         |  13 +- drivers/media/dvb-frontends/bcm3510_priv=
=2Eh
>                                |   6 +-
> drivers/media/dvb-frontends/cx24110.h                                    =
 |
>   8 +- drivers/media/dvb-frontends/stv6110x_priv.h                       =
 =20
>      |   8 +- drivers/media/dvb-frontends/tda8083.h                      =
 =20
>             |   8 +- drivers/media/dvb-frontends/zl10036.c               =
 =20
>                    |   2 +- drivers/media/dvb-frontends/zl10036.h        =
 =20
>                           |   2 +- drivers/media/i2c/msp3400-driver.c    =
 =20
>                                  |  20 +--
> drivers/media/i2c/msp3400-driver.h                                       =
 |
>   2 +- drivers/media/i2c/st-vgxy61.c                                     =
 =20
>      |   2 +- drivers/media/pci/bt8xx/bttv-gpio.c                        =
 =20
>             |   2 +- drivers/media/pci/bt8xx/bttvp.h                     =
 =20
>                    |   2 +- drivers/media/pci/sta2x11/sta2x11_vip.c      =
 =20
>                           |   9 +- drivers/media/platform/amphion/vdec.c =
 =20
>                                  |   4 +-
> drivers/media/platform/marvell/Kconfig                                   =
 |
>   2 +
> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c=
 |
>  14 +- drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                    =
 =20
>      |  16 ++ drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h             =
 =20
>             |   1 + drivers/media/platform/renesas/Kconfig               =
 =20
>                   |  16 ++ drivers/media/platform/renesas/Makefile       =
 =20
>                          |   1 + drivers/media/platform/renesas/{rcar-vin
> =3D> }/rcar-csi2.c                 |   0
> drivers/media/platform/renesas/rcar-vin/Kconfig                          =
 |
>  16 -- drivers/media/platform/renesas/rcar-vin/Makefile                  =
 =20
>      |   1 - drivers/media/platform/sunxi/sun8i-di/sun8i-di.c            =
 =20
>            |  69 ++++----
> drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c                    =
 |
>   5 +- drivers/media/test-drivers/vidtv/vidtv_bridge.c                   =
 =20
>      |  26 +-- drivers/media/test-drivers/visl/visl-core.c               =
 =20
>              |  15 +- drivers/media/test-drivers/visl/visl-dec.c         =
 =20
>                     | 344 +++++++++++++++++++++++-----------------
> drivers/media/test-drivers/visl/visl.h                                   =
 |
>   1 + drivers/media/tuners/tda18271-fe.c                                 =
 =20
>     |   1 - drivers/media/usb/go7007/go7007-usb.c                        =
 =20
>           |   4 +- drivers/media/usb/pvrusb2/pvrusb2-context.c           =
 =20
>                  |   8 +- drivers/media/usb/pvrusb2/pvrusb2-dvb.c        =
 =20
>                         |  12 +- drivers/media/usb/pvrusb2/pvrusb2-v4l2.c=
 =20
>                                |  11 +-
> drivers/media/v4l2-core/v4l2-ctrls-api.c                                 =
 |
>   2 +- drivers/media/v4l2-core/v4l2-ctrls-core.c                         =
 =20
>      |   5 +- drivers/media/v4l2-core/v4l2-ioctl.c                       =
 =20
>             |   2 +- drivers/media/v4l2-core/v4l2-mem2mem.c              =
 =20
>                    |   4 +-
> drivers/staging/media/imx/imx-media-csc-scaler.c                         =
 |
>   1 + drivers/staging/media/imx/imx-media-fim.c                          =
 =20
>     |   2 +- drivers/staging/media/starfive/camss/stf-capture.c          =
 =20
>            |   8 +- drivers/staging/media/sunxi/cedrus/cedrus_h265.c     =
 =20
>                   |  10 +- include/media/videobuf2-core.h                =
 =20
>                          |  13 +- 47 files changed, 398 insertions(+), 317
> deletions(-)
>  rename drivers/media/platform/renesas/{rcar-vin =3D> }/rcar-csi2.c (100%)


--nextPart5104106.5fSG56mABF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmXM7REACgkQ5EFKUk4x
7bZHZAf9HxP06Tb491M1ImNZTP95p9h1MlwCbUa3FcP6FXxxMS10sxt3glxdFJN2
icKeKGDGZS/p9ls9RDf9UpXidMiu8IqfNQxB72avVXWeHUK6GxAO18jwNy4Pho34
rhhDGlzfTFW4KNyhdwclD6KRSLufppKfwNfmml3JQvjeDQlCVRUS1UhBn2FBNQtU
Yse95KyyCGw/BQjU0T/lYMXnNRtvGlAdOtO05CM8ZGARDtgKbQIyhixy17Of60bZ
SuB6NCAI5QBMjOiN5CDzCsCgA/AAJf7etFRX2A5MaQT9sa/aMxyQ6aHr/Wv8GHKn
kPVSIlRH+MzMgLedtycO1HjEYbjsAA==
=g5K0
-----END PGP SIGNATURE-----

--nextPart5104106.5fSG56mABF--




