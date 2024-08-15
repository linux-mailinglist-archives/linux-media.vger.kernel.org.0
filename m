Return-Path: <linux-media+bounces-16336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C26952D03
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 12:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 337961F227C3
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 10:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9AE1AC897;
	Thu, 15 Aug 2024 10:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WZVHE9nA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2A31AC886;
	Thu, 15 Aug 2024 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723719027; cv=none; b=OkGwb+xVHgaUS0Xt5plNeVzmf87vj03ikkz/tuKU5+PtWzHQsR8LHxci+WaFxKf4snVWT9KKfYieo+MNuiaFNaewPVmcLhkrigakjVLv6z7vBdOLy9j1wFTgHCp54Kw9MMoe6GY6egLIRbcP+jScqEaNYm5Uz2wY/23D96WOt1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723719027; c=relaxed/simple;
	bh=im0u3eDxsETwiNVKDYspTSbhx4x8HTTNFfvIT6Catbg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=LLidX+DrKX88vOS9p/a+ifiWuN9Hzg4zTBaS9+mJp/n7Ir/GeAyR3d7J7/hmC9sVzsAdld7xrfJgTdxroJWTA5+YrSs2Q9OOVMvlM7fsRMZqavh1eQ69Yx57sndeDHvV7wgLXynQlkbKqr9qX9QOXahdDcFN7eR2bZUUn+bGSrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WZVHE9nA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EC226CA;
	Thu, 15 Aug 2024 12:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723718965;
	bh=im0u3eDxsETwiNVKDYspTSbhx4x8HTTNFfvIT6Catbg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WZVHE9nAE+7a65O4hOU2HZcKLgPmwe+X5btJh95wCAbicNv8tCZrrOpcc197HHqmW
	 i/jJLe8nqGbiKZxXGIwkQGB853C9uX3KkaKJGfF2ShaT72Ae2+9HZuR8q1mC+iwc7V
	 OZPwCQ1z99EZWpGm4i8sGXTSqfnUZfOJ+PnsDKpk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240813-imx335-binned-mode-v1-1-edbb3718ab0f@ideasonboard.com>
References: <20240813-imx335-binned-mode-v1-1-edbb3718ab0f@ideasonboard.com>
Subject: Re: [PATCH] media: imx283: Add 3/3 binning mode
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Umang Jain <umang.jain@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <umang.jain@ideasonboard.com>
Date: Thu, 15 Aug 2024 11:50:21 +0100
Message-ID: <172371902103.129190.2742499360622510193@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-08-13 06:52:00)
> IMX283 supports 12-bit 3/3 binning mode with 1824x1216 resolution.
> Introduce the mode config for the same.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
> Patch to introduce 3/3 binning mode - 1824x1216 12-bit output.
> ---
>  drivers/media/i2c/imx283.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 8490618c5071..94276f4f2d83 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -465,6 +465,39 @@ static const struct imx283_mode supported_modes_12bi=
t[] =3D {
>                 .horizontal_ob =3D 48,
>                 .vertical_ob =3D 4,
> =20
> +               .crop =3D {

I still wonder if these crops for full resolution mode can be set as:

 	.crop =3D imx283_active_area,

But that's a separate patch/discussion.


> +                       .top =3D 40,
> +                       .left =3D 108,
> +                       .width =3D 5472,
> +                       .height =3D 3648,
> +               },
> +       },
> +       {
> +               /*
> +                * Readout mode 3 : 3/3 binned mode (1824x1216)
> +                */
> +               .mode =3D IMX283_MODE_3,
> +               .bpp =3D 12,
> +               .width =3D 1824,
> +               .height =3D 1216,
> +               .min_hmax =3D 1894, /* Pixels (284 * 480MHz/72MHz + paddi=
ng) */
> +               .min_vmax =3D 4200, /* Lines */
> +
> +               /* 60.00 fps */
> +               .default_hmax =3D 1900, /* 285 @ 480MHz/72Mhz */
> +               .default_vmax =3D 4200,
> +
> +               .veff =3D 1234,
> +               .vst =3D 0,
> +               .vct =3D 0,
> +
> +               .hbin_ratio =3D 3,
> +               .vbin_ratio =3D 3,
> +
> +               .min_shr =3D 16,
> +               .horizontal_ob =3D 32,
> +               .vertical_ob =3D 4,
> +

Everything there matches my expectations and the datasheet:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>                 .crop =3D {
>                         .top =3D 40,
>                         .left =3D 108,
>=20
> ---
> base-commit: 68a72104cbcf38ad16500216e213fa4eb21c4be2
> change-id: 20240813-imx335-binned-mode-98b2b7ee5ba0
>=20
> Best regards,
> --=20
> Umang Jain <umang.jain@ideasonboard.com>
>

