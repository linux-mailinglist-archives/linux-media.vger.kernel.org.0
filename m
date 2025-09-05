Return-Path: <linux-media+bounces-41833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 204ABB455BA
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 13:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4C013A1E71
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 11:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB760341AC1;
	Fri,  5 Sep 2025 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wazxqZos"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FE3179BD;
	Fri,  5 Sep 2025 11:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757070465; cv=none; b=ppo9rhI4TuotqM/QjLMycS4KY/EUV25uFaIb5yrARSFM2UBZkcJ2bBIzf/tfj5anEHjpikwZsYkIX5oFrEthhqzb0DvzFcYGGNwulXd6w57RGb7j7vswlwOUb3cd8mXEuQg2Kvruw/JjPg1T5R/tx7rG9YCeYirzUaY8EJmHIYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757070465; c=relaxed/simple;
	bh=PuxLCceEcWNaF0wlDR9k3nAjW6PvbIkpdu97KH9DeAw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fMm/CabmcNmXXLu4fpwjebFKbpNw96AV39W11VinJlOdX98tRJp4ub3YF86/u5Egj9kr0/9GZFN8kh6JiamSdsscA4+blvshfIJlT0uGqKQpXdZ8vynlt6UPr7ZNyACTBxF7vxjpsrbGa+zkYynlgk6getvvL7cOcUVx9/ugsSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wazxqZos; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:84a2:d86d:fcf7:24b4:e467])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A6E47F0;
	Fri,  5 Sep 2025 13:06:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757070390;
	bh=PuxLCceEcWNaF0wlDR9k3nAjW6PvbIkpdu97KH9DeAw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=wazxqZosvmbXS0f2HZx9eriHBDT68T/ZV6Vogn+Ls8m0kB+01CMEmeJOOM2FwQmGX
	 e2ZLPP+OS5+jsuY4LEOJN0EZmX/dwlObHYNglYO+alxSFtpBEDAqEDJocnFfOd5Fds
	 XjGLwntzggrApIauDlAlwvpBSYzrBEBQZ2y4Sj14=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250825142522.1826188-2-r-donadkar@ti.com>
References: <20250825142522.1826188-1-r-donadkar@ti.com> <20250825142522.1826188-2-r-donadkar@ti.com>
Subject: Re: [PATCH v5 01/14] media: ti: j721e-csi2rx: Remove word size alignment on frame width
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Fri, 05 Sep 2025 16:37:35 +0530
Message-ID: <175707045529.8095.7424566069689990352@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Rishikesh,

Quoting Rishikesh Donadkar (2025-08-25 19:55:09)
> j721e-csi2rx driver has a limitation of frame width being a multiple
> word size. However, there is no such limitation imposed by the
> hardware [1].

Is there no limitation for the step size, or also not limitation for the
minimum size of transfer?

>=20
> Remove this limitation from the driver.
>=20
> Link: https://www.ti.com/lit/pdf/spruj16
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c     | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 3992f8b754b7..b3a27f4c3210 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -260,9 +260,6 @@ static void ti_csi2rx_fill_fmt(const struct ti_csi2rx=
_fmt *csi_fmt,
>                              MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);

Here the pix->width is restricted to be at minimum pixels_in_word.
So TRY_FMT/S_FMT with a width =3D 1 will be clamped by the driver.

>         pix->height =3D clamp_t(unsigned int, pix->height, 1, MAX_HEIGHT_=
LINES);
> =20
> -       /* Width should be a multiple of transfer word-size */
> -       pix->width =3D rounddown(pix->width, pixels_in_word);
> -
>         v4l2_fmt->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
>         pix->pixelformat =3D csi_fmt->fourcc;
>         pix->bytesperline =3D pix->width * (csi_fmt->bpp / 8);
> @@ -360,23 +357,15 @@ static int ti_csi2rx_enum_framesizes(struct file *f=
ile, void *fh,
>                                      struct v4l2_frmsizeenum *fsize)
>  {
>         const struct ti_csi2rx_fmt *fmt;
> -       unsigned int pixels_in_word;
> =20
>         fmt =3D find_format_by_fourcc(fsize->pixel_format);
>         if (!fmt || fsize->index !=3D 0)
>                 return -EINVAL;
> =20
> -       /*
> -        * Number of pixels in one PSI-L word. The transfer happens in mu=
ltiples
> -        * of PSI-L word sizes.
> -        */
> -       pixels_in_word =3D PSIL_WORD_SIZE_BYTES * 8 / fmt->bpp;
> -
>         fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> -       fsize->stepwise.min_width =3D pixels_in_word;
> -       fsize->stepwise.max_width =3D rounddown(MAX_WIDTH_BYTES * 8 / fmt=
->bpp,
> -                                             pixels_in_word);
> -       fsize->stepwise.step_width =3D pixels_in_word;
> +       fsize->stepwise.min_width =3D 1;

But here, in ENUM_FRAMESIZES we allow width to go as low as 1.

Can you make sure both of them match whatever is correct (and possible by
the hardware)?

> +       fsize->stepwise.max_width =3D MAX_WIDTH_BYTES * 8 / fmt->bpp;
> +       fsize->stepwise.step_width =3D 1;
>         fsize->stepwise.min_height =3D 1;
>         fsize->stepwise.max_height =3D MAX_HEIGHT_LINES;
>         fsize->stepwise.step_height =3D 1;
> --=20
> 2.34.1
>=20

Thanks,
    Jai

