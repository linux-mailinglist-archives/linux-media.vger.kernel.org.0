Return-Path: <linux-media+bounces-18691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5459882C4
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0822AB22840
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DC018953E;
	Fri, 27 Sep 2024 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YrtOi8qF"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0271667DA;
	Fri, 27 Sep 2024 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727434028; cv=none; b=WyKtCxzffmsoojAxl1CawvzbsmkcmUZjwG688Sy31yjBgGUB69ZvdIlUSFvZLbJp6Sv663fr5MmVd3OIkf6SzjVcT7ZfJrGdWCHujP2xYnl1ca1tV0tvZynTFFqm6ETg70x+lsl9PGH/fj0lPvLZSNYvYgSmgyjZRtzrlAgmRDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727434028; c=relaxed/simple;
	bh=0MUSaW8yiXU3o8iy47Ivbo8olVGNX/3KgJYQg0nP3o8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UVv/SiesRm84LASfvZR8Mv6Qh72oogfjaN2jhr9l9rvCxxVPXgmFSloDuQPfhtM6setZK61EXBfl8hLpQHt7d1mwteL/ak1A/GtQyTJB0PJNC91LSPf18vDwelKKrBsDcGgPxV0eDakj76AY+wsZzbd4bqFu7ygpyYCNSGZfBL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YrtOi8qF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727434024;
	bh=0MUSaW8yiXU3o8iy47Ivbo8olVGNX/3KgJYQg0nP3o8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YrtOi8qFMY6nZb1gYLITuz8Po95nmgRK6QmnGSeYsyZJ3Iw+9Hf0iTCJO4RS33Ltd
	 GUdiaAUyEw2gY0AP+Agt1N8X671QlGic61+blFtdJ5t62BzigROuVYrUD+tYVg2w02
	 H0govE2NyucsAwsFLXQaGpA0mo0uktwo+TujmQUMA3glXVvKF6d5CwvMlCZExMlTOf
	 Jes5kfZWOMstn0NMeeLDTWuydhOI8ttJzcWLvb8ju4+f+IpIOcQcrR/k0k8zQWbg6+
	 Lke9uqMVLgGI+azoPkBz0DfVRzicT7YLgu2458qXtWXkgQRyT8BkhLt/JUqFplOjeH
	 CE+HTCi5PyAuQ==
Received: from device-68.home (2a01cb088ccA73006086F5f072C6A07A.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B58EF17E120B;
	Fri, 27 Sep 2024 12:47:03 +0200 (CEST)
Message-ID: <8d281bcbc504abaa9838ff666a36515cf7e57239.camel@collabora.com>
Subject: Re: [PATCH] media: i2c: max96717: clean up on error in
 max96717_subdev_init()
From: Julien Massot <julien.massot@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Date: Fri, 27 Sep 2024 12:47:03 +0200
In-Reply-To: <23251b8e-c148-44ef-bc9b-f39cecc4fb12@stanley.mountain>
References: <23251b8e-c148-44ef-bc9b-f39cecc4fb12@stanley.mountain>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,
On Thu, 2024-09-12 at 11:51 +0300, Dan Carpenter wrote:
> Call v4l2_ctrl_handler_free() to clean up from
> v4l2_ctrl_handler_init().
>=20
> Fixes: 50f222455793 ("media: i2c: add MAX96717 driver")

The right commit to fix is:
Fixes: 19b5e5511ca4f ("media: i2c: max96717: add test pattern ctrl")

Since there was no control to free in the initial driver.

Reviewed-by: Julien Massot <julien.massot@collabora.com>

Regards,
Julien

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> From static analysis.=C2=A0 Not tested.
>=20
> =C2=A0drivers/media/i2c/max96717.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/max96717.c
> b/drivers/media/i2c/max96717.c
> index 4e85b8eb1e77..9259d58ba734 100644
> --- a/drivers/media/i2c/max96717.c
> +++ b/drivers/media/i2c/max96717.c
> @@ -697,8 +697,10 @@ static int max96717_subdev_init(struct
> max96717_priv *priv)
> =C2=A0	priv->pads[MAX96717_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
> =C2=A0
> =C2=A0	ret =3D media_entity_pads_init(&priv->sd.entity, 2, priv-
> >pads);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to init
> pads\n");
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to init pads\n");
> +		goto err_free_ctrl;
> +	}
> =C2=A0
> =C2=A0	ret =3D v4l2_subdev_init_finalize(&priv->sd);
> =C2=A0	if (ret) {

--=20
--=20
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

