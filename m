Return-Path: <linux-media+bounces-13820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F75910789
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA71A1F21973
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919731AD4B9;
	Thu, 20 Jun 2024 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RsiO9sOV"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2367E1AB91B;
	Thu, 20 Jun 2024 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718892499; cv=none; b=S/RhU8WxOB5QbWX6rzmDMLs8N9zf+k6gtloWUVEgqlBT/VzL433FOSRG8kq4CZ3Tu8ZlJGXPs1veRWcZh2u6ph6o8H7wQj9FSuBSEmY4FvYmeQzh1xPzii0ouiNP6Vr1VYxmKnPm72CtARFITKTx7wos2Ikvg2PNKEp6Q2POcBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718892499; c=relaxed/simple;
	bh=Obh1l7ctkuteMg1GKDKq263sZnU4xN5tzaYs6CgQKHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PS3XpYoRTZcey/xoJEJVcgIClJy/S/lPD5AC2cR+A8axlNfGEWies/kjFnNYQr3L2Cll5Ro/GZ8J2Ma3jRfkYST4fHm2v3JudoFb7sOQyZ89aq8MBezUVftptZa1MttcQJhlnvrxSs1Huatlk92lWraRH/uJ3k9Qx9K0Ll29LIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RsiO9sOV; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718892494;
	bh=Obh1l7ctkuteMg1GKDKq263sZnU4xN5tzaYs6CgQKHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RsiO9sOVDN2eJ/YtpjsnzPKkWk4fizsnrP5t/sQf/8gyHJW3uWq66biHXkTCKAze0
	 WR20iJ5rkAYZvv4ibNL+s5sGWvlzGBX/jVuLDeyEY828zUfg7kEagtD4JEdX/oIRDm
	 E3b79qQBjd4GTdhcdGAh32u5ngJe8Q5LUUUuC7/m1Eri/wlUs1nUfh9SOP0HleBPLI
	 R8L2xmpQ7+SxdOKryWI6RyIhZE2ZK5GvQ11pVcVzoxJhBJBYXEXchdNfPdUlLcbZAn
	 JRtBLyBrnOVPw0JNp8OhPTu3loixPRB/9veXLSRpxhXShbEU5nurV9jfTQMirryWbv
	 3kQO1zTY9c+Fg==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 835D037821C0;
	Thu, 20 Jun 2024 14:08:10 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: andy.yan@rock-chips.com, benjamin.gaignard@collabora.com,
 boris.brezillon@collabora.com, conor+dt@kernel.org,
 daniel.almeida@collabora.com, devicetree@vger.kernel.org,
 didi.debian@cknow.org, dsimic@manjaro.org, ezequiel@vanguardiasur.com.ar,
 gregkh@linuxfoundation.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
 jonas@kwiboo.se, knaerzche@gmail.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, mchehab@kernel.org,
 nicolas.dufresne@collabora.com, paul.kocialkowski@bootlin.com,
 robh@kernel.org, sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 2/4] media: rockchip: Introduce the rkvdec2 driver
Date: Thu, 20 Jun 2024 10:07:41 -0400
Message-ID: <2187039.irdbgypaU6@arisu>
Organization: Collabora
In-Reply-To: <20240619174623.270706-1-liujianfeng1994@gmail.com>
References:
 <20240619150029.59730-3-detlev.casanova@collabora.com>
 <20240619174623.270706-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13537518.uLZWGnKmhe";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart13537518.uLZWGnKmhe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Date: Thu, 20 Jun 2024 10:07:41 -0400
Message-ID: <2187039.irdbgypaU6@arisu>
Organization: Collabora
In-Reply-To: <20240619174623.270706-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0

Hi Jianfeng,

On Wednesday, June 19, 2024 1:46:23 P.M. EDT Jianfeng Liu wrote:
> Hi Detlev,
>=20
> On Wed, 19 Jun 2024 10:57:19 -0400, Detlev Casanova wrote:
> >+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> >+		height *=3D 2;
> >+
> >+	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
> >+	    height > ctx->coded_fmt.fmt.pix_mp.height)
> >+		return -EINVAL;
>=20
> I did further invesatigation on chromium. I find that before real video
> is decoded, chromium will call VIDIOC_STREAMON twice with value of
> sps->flags 0:
>=20
> At the first time width and height are 16; ctx->coded_fmt.fmt.pix_mp.width
> and coded_fmt.fmt.pix_mp.height are 16, which are the min size of decoder;
> At the second time width and height are still 16; while
> coded_fmt.fmt.pix_mp.width is 1920 and coded_fmt.fmt.pix_mp.height is
> 1088, which are the real size of video.
>=20
> So VIDIOC_STREAMON will fall at the first time call because sps->flags is
> 0 so V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set, and then height is
> doubled to 32 which is larger than 16.
>=20
> What do you think if we skip doubling height if sps->flags is 0 and at the
> same time V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set? The following hack
> did fix my chromium:
>=20
> --- a/drivers/staging/media/rkvdec2/rkvdec2-h264.c
> +++ b/drivers/staging/media/rkvdec2/rkvdec2-h264.c
> @@ -767,7 +767,7 @@ static int rkvdec2_h264_validate_sps(struct rkvdec2_c=
tx
> *ctx, * which is half the final height (see (7-18) in the
>          * specification)
>          */
> -       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> +       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) && sps->fla=
gs)
> height *=3D 2;
>=20
>         if (width > ctx->coded_fmt.fmt.pix_mp.width ||

I'm not sure what Chromium is trying to do here. But the spec is clear that=
=20
height should be multiplied by 2 (That's actually 7-8, not 7-18):

  FrameHeightInMbs =3D ( 2 =E2=80=93 frame_mbs_only_flag ) * PicHeightInMap=
Units

This feels like hacking the driver to please a specific userspace applicati=
on,=20
so I'd like to understand better what chromium is doing.

Regards,
Detlev.

--nextPart13537518.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZ0N60ACgkQ5EFKUk4x
7bbkywgAtKkDH6nMcaU7/h9CiC9sAFMgb3R0h3425HDWWYCWzlR6H3SNvlNc1AOu
8QBuQnqf/Q5FR8iYNfuTXiEDoCGfOVpxpKmUyh1gURZD5Ea5skFm0a7U6+HfmCr1
CWzNfTOoqqxNbkJSGwesshEB9bRS/r+fjLulIPhBiItnVOnnDMrWmdgpwcJya5RH
H6kOw/B3ENImQtlsbLhawoaULowVN832okdMrqC+/cRTenn+zOiRKlFYgBmJDm27
3jNAQNSfj65NBKZWr8Bwsv74dOcntvjLDEUeAExEPhyDcnu0KKhiNceKqQohei5b
E0Cylo58qmCvUjiEz2JjlAdG2CizfQ==
=S3/z
-----END PGP SIGNATURE-----

--nextPart13537518.uLZWGnKmhe--




