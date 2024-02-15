Return-Path: <linux-media+bounces-5224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF89F8569A4
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 17:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1CF2929DA
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 16:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F73135410;
	Thu, 15 Feb 2024 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GKdNLmcD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F1E134743;
	Thu, 15 Feb 2024 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708014801; cv=none; b=CEpmrL/w82uj60tNI2uv/72C1Li7pIgilVHKqWV4QFeovf1ClsPXNik4SD2K6KxHxgrTN1qirzG8+YD3U6XpiSwAv/TP8V6ykiKy6VxrCNtvPKZ49Mn8xGlGZOyDxWa26JLrwPqdScNWNwOJqzGnUm0UqXcV3AHfonZWts+FJ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708014801; c=relaxed/simple;
	bh=5+brZxpsplnpWF04LI1HfaObqf65WFWZyRNob6WvwS4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TUkv6PypNhozk2lFpf7yIMrsVrRuMdgpP78I/DxQ86tSB3H9tjP3nAwIwBK7CVpkcFwrt5KmNZgTLqyYnxOKGYCrYoLJkfBB+fXS2fGPM3mg1Qsh3dTrZsg8jqpX7E/yxkgBPTvUdQP6sfPiHYzE6cxCOAOBVjygufqSaxzX8yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GKdNLmcD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93F0AB3;
	Thu, 15 Feb 2024 17:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708014787;
	bh=5+brZxpsplnpWF04LI1HfaObqf65WFWZyRNob6WvwS4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GKdNLmcDBAbpidL+tDqtsZ1wt0KxuQMg867KIa9LxHenym/1pn/ETAnltm+wjx7z/
	 jz0PTraTeneYGd2bPqCaVmJoLIgHlc5Ykg68pKNC/UjpeTIvWbYl27BHY0fLDmAAiV
	 VMWNd3ZnnAQVY+3gdLlaTprRk7QVK4FVTzjwqcr0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240215144333.82036-1-biju.das.jz@bp.renesas.com>
References: <20240215144333.82036-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] media: i2c: ov5645: Remove software reset entry from ov5645_global_init_setting
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@kernel.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
To: Biju Das <biju.das.jz@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 15 Feb 2024 16:33:08 +0000
Message-ID: <170801478828.2629073.1256300005311782106@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Biju Das (2024-02-15 14:43:33)
> The SYSTEM_CTRL0 register in ov5645 is almost similar to ov5640. But the
> hard reset control is mandatory for the ov5645 device, so there is no
> need for soft reset in the driver.
>=20
> Add a 1msec delay for the software power up (OV5645_SYSTEM_CTRL0_START)
> register in ov5645_global_init_setting. Without this delay sometimes the
> image is not captured at all when the i2c frequency is 400kHz.
>=20
> The changes are fixing both the greenish issue and image capture at 400kHz
> i2c frequency on Renesas RZ/G2L SMARC EVK platforms.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped patch#2
>  * Updated commit header and description.
>  * Dropped unneeded software reset from ov5645_global_init_setting
>  * Added 1 msec delay for software power up from ov5645_*_init_setting.

As with all drivers, I'd love to see more cleanup to move the reset/init
sequences away from opaque tables. But for now this seems like a
reasonable improvement.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5645.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index a26ac11c989d..df86b951b9f3 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -118,7 +118,6 @@ static inline struct ov5645 *to_ov5645(struct v4l2_su=
bdev *sd)
> =20
>  static const struct reg_value ov5645_global_init_setting[] =3D {
>         { 0x3103, 0x11 },
> -       { 0x3008, 0x82 },
>         { 0x3008, 0x42 },
>         { 0x3103, 0x03 },
>         { 0x3503, 0x07 },
> @@ -627,6 +626,10 @@ static int ov5645_set_register_array(struct ov5645 *=
ov5645,
>                 ret =3D ov5645_write_reg(ov5645, settings->reg, settings-=
>val);
>                 if (ret < 0)
>                         return ret;
> +
> +               if (settings->reg =3D=3D OV5645_SYSTEM_CTRL0 &&
> +                   settings->val =3D=3D OV5645_SYSTEM_CTRL0_START)
> +                       usleep_range(1000, 2000);
>         }
> =20
>         return 0;
> --=20
> 2.25.1
>

