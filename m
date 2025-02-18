Return-Path: <linux-media+bounces-26281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F053FA39DB0
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E71A07A60FE
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 13:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA27C26A1B4;
	Tue, 18 Feb 2025 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F0FzXyX2"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5D326A0E0;
	Tue, 18 Feb 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739885375; cv=none; b=dyvRsaTRRhwbYzcrgrT7a2ZkC6d+SpLj2sIf8F2RB5ora3dDF6CqM53yYNNRN047qeT1ahYUTPzso2GzH5bRIdFS37xdMcP9WLIZmmVTbQEZfhtXTW/+vGyPHXE8mqf+KiGZ0HEaBMFJCr3e6NeNy6SgrNyfqLfCEUYMGPSxrkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739885375; c=relaxed/simple;
	bh=Qhw7xz3QE6C5sz/1TvP2I0rfQnWItujEDhsFqK78yGc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qtRydnSYa0WxRyZAaNB02BXGkAqNj/35qiWIm76WHQKFnPT9ALSvID6EshJ0me9z54kiw4DcdffnomtiWg4EfM5U/d0I12PiZXw+tJHx04kdNE+zCAkRoi1fL9pUWkAkV0adCyNRj0HYQt+Bs6QR4qivJcSu3yrfRradn+l3QcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F0FzXyX2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739885371;
	bh=Qhw7xz3QE6C5sz/1TvP2I0rfQnWItujEDhsFqK78yGc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=F0FzXyX2pRpCvAuq6fvRu7z2M92/3+no6svgawt51AQjO3TnfjzLlH1OrOiLLoNx5
	 XK2vQ4i0Jkv0qTViG4WAJsBBtO+L1f3PeDSEMBq+TSx/1o7Fr0BcxmwQXn0OAzvn8+
	 rzRRDoj678ijhDtXhK4k1wOS727PEHtQ+LG1UHGQSqdK82MsVAxZ2hqi0lWKn3Uw8v
	 uQ8CCiIiNfTJ63+vog6Ll01N2qWRwhuMRYkZxLZaj3/5t4AKQ1BChZBXhWFaBb2Pmc
	 39w7cKPA0tZ6/x67lcSxand4i57Rzcy9dzVjpg49KPhhU1j9VuB8c7kiJOjdnP/5qW
	 wb7rwLAaG31nQ==
Received: from apertis-1.home (2a01cb088CcA73006086F5f072c6a07a.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4FB8D17E0657;
	Tue, 18 Feb 2025 14:29:31 +0100 (CET)
Message-ID: <f5940c764af6587b97d39fdb9b64ec9bfe09b4e8.camel@collabora.com>
Subject: Re: [PATCH 2/5] media/i2c: max96717: implement the
 .get_frame_desc() operation
From: Julien Massot <julien.massot@collabora.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 18 Feb 2025 14:29:30 +0100
In-Reply-To: <20250207112958.2571600-3-laurentiu.palcu@oss.nxp.com>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
	 <20250207112958.2571600-3-laurentiu.palcu@oss.nxp.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Fri, 2025-02-07 at 13:29 +0200, Laurentiu Palcu wrote:
> Since the max96717 serializer can work with various sensors, we need to
> implement the .get_frame_desc() callback to get the VCs and DTs for the
> incoming stream(s).
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
> =C2=A0drivers/media/i2c/max96717.c | 21 +++++++++++++++++++++
> =C2=A01 file changed, 21 insertions(+)
>=20
> diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> index b1116aade0687..6a668a004c717 100644
> --- a/drivers/media/i2c/max96717.c
> +++ b/drivers/media/i2c/max96717.c
> @@ -575,12 +575,33 @@ static int max96717_disable_streams(struct v4l2_sub=
dev *sd,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int max96717_get_frame_desc(struct v4l2_subdev *sd, unsigned int =
pad,
> +				=C2=A0=C2=A0 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct max96717_priv *priv =3D sd_to_max96717(sd);
> +	int ret;
> +	struct v4l2_mbus_frame_desc source_fd;
> +
> +	if (pad !=3D MAX96717_PAD_SOURCE)
> +		return -EINVAL;
> +
Please check priv->source_sd first, we support the case where we only have =
a test pattern from
the serializer. Then we can simply return the result of v4l2_subdev_call.

        return v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
			       priv->source_sd_pad, fd);

> +	ret =3D v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->source_sd_pad, &source_fd)=
;
> +	if (ret)
> +		return ret;
> +
> +	*fd =3D source_fd;
> +
> +	return 0;
> +}
> +
> =C2=A0static const struct v4l2_subdev_pad_ops max96717_pad_ops =3D {
> =C2=A0	.enable_streams =3D max96717_enable_streams,
> =C2=A0	.disable_streams =3D max96717_disable_streams,
> =C2=A0	.set_routing =3D max96717_set_routing,
> =C2=A0	.get_fmt =3D v4l2_subdev_get_fmt,
> =C2=A0	.set_fmt =3D max96717_set_fmt,
> +	.get_frame_desc =3D max96717_get_frame_desc,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct v4l2_subdev_core_ops max96717_subdev_core_ops =
=3D {

Regards,
--=20
Julien

