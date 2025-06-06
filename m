Return-Path: <linux-media+bounces-34209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EDEACFEE4
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 11:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E0A87A4300
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 09:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F00286413;
	Fri,  6 Jun 2025 09:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KYyCdDgV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547A286405
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749201075; cv=none; b=IOwiIp2yuJKh4gzawIYSscIDzKY6UTUwn2kwfo+osQDT6wVQSO9HidpItARfU58f/OoWKRUoc2M38U3BX0gBI6OWrrK05E06Sir7pEDAiOcIFfFjjgDff2qaGHwbmOX7J9tzyNGUMTFUXi5anJzB1iRvUJSN0AT2d74qFXQt0is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749201075; c=relaxed/simple;
	bh=9937TRbT8MggXh0mBLEOsuxYl3YvY65NN6qvcxmxPbs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qtReLf7gd9SHhODOOS2P8ItHVhGV/nrp0JIknQnbPS9MEtL259IZb1yEHhv1q8jeWN111ZHedYhFqQ1HBmcmSkN3AYXfy02cfH5qNoq6zXqp6NpDQOi51uREXkOFsl2cLIaI+kh6bp8D0bAmzD3+y3YGijX9k+RlhBWzHKWABtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KYyCdDgV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:4842:8d57:2a74:e585])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5EC5011DD;
	Fri,  6 Jun 2025 11:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749201066;
	bh=9937TRbT8MggXh0mBLEOsuxYl3YvY65NN6qvcxmxPbs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KYyCdDgV2BE0zQhjHrjmLoWTRm791s9fJiII2xWyR8TqqZuSbsdfgyLudZhUAj6aE
	 xT9kglSxEYnefiWyXyZGciGYxpv8MjBQ1mlCMBccYt/UrJGQxaJiX7bypZks8WJpci
	 mpuYwpx3L5t9uS6GtLFZrAC9EWgrsyFYaMB4o/Kw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250606090533.10711-1-laurent.pinchart@ideasonboard.com>
References: <20250606090533.10711-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: imx-mipi-csis: Use CSI-2 data type macros from mipi-csi2.h
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, imx@lists.linux.dev
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Date: Fri, 06 Jun 2025 11:11:07 +0200
Message-ID: <174920106757.119329.6456362062712317459@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Laurent,

Thank you for the patch.

Quoting Laurent Pinchart (2025-06-06 11:05:33)
> The imx-mipi-csis defines custom macros for the CSI-2 data types,
> duplicating the centralized macros defines in mipi-csi2.h. Replace them
> with the latter.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Looks good to me.
Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>=20

Cheers,
Stefan

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 68 ++++++++--------------
>  1 file changed, 25 insertions(+), 43 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index d060eadebc7a..2beb5f43c2c0 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -28,6 +28,7 @@
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
> =20
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -229,25 +230,6 @@
> =20
>  #define DEFAULT_SCLK_CSIS_FREQ                 166000000UL
> =20
> -/* MIPI CSI-2 Data Types */
> -#define MIPI_CSI2_DATA_TYPE_YUV420_8           0x18
> -#define MIPI_CSI2_DATA_TYPE_YUV420_10          0x19
> -#define MIPI_CSI2_DATA_TYPE_LE_YUV420_8                0x1a
> -#define MIPI_CSI2_DATA_TYPE_CS_YUV420_8                0x1c
> -#define MIPI_CSI2_DATA_TYPE_CS_YUV420_10       0x1d
> -#define MIPI_CSI2_DATA_TYPE_YUV422_8           0x1e
> -#define MIPI_CSI2_DATA_TYPE_YUV422_10          0x1f
> -#define MIPI_CSI2_DATA_TYPE_RGB565             0x22
> -#define MIPI_CSI2_DATA_TYPE_RGB666             0x23
> -#define MIPI_CSI2_DATA_TYPE_RGB888             0x24
> -#define MIPI_CSI2_DATA_TYPE_RAW6               0x28
> -#define MIPI_CSI2_DATA_TYPE_RAW7               0x29
> -#define MIPI_CSI2_DATA_TYPE_RAW8               0x2a
> -#define MIPI_CSI2_DATA_TYPE_RAW10              0x2b
> -#define MIPI_CSI2_DATA_TYPE_RAW12              0x2c
> -#define MIPI_CSI2_DATA_TYPE_RAW14              0x2d
> -#define MIPI_CSI2_DATA_TYPE_USER(x)            (0x30 + (x))
> -
>  struct mipi_csis_event {
>         bool debug;
>         u32 mask;
> @@ -357,116 +339,116 @@ static const struct csis_pix_format mipi_csis_for=
mats[] =3D {
>         {
>                 .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
>                 .output =3D MEDIA_BUS_FMT_UYVY8_1X16,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_YUV422_8,
> +               .data_type =3D MIPI_CSI2_DT_YUV422_8B,
>                 .width =3D 16,
>         },
>         /* RGB formats. */
>         {
>                 .code =3D MEDIA_BUS_FMT_RGB565_1X16,
>                 .output =3D MEDIA_BUS_FMT_RGB565_1X16,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RGB565,
> +               .data_type =3D MIPI_CSI2_DT_RGB565,
>                 .width =3D 16,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_BGR888_1X24,
>                 .output =3D MEDIA_BUS_FMT_RGB888_1X24,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RGB888,
> +               .data_type =3D MIPI_CSI2_DT_RGB888,
>                 .width =3D 24,
>         },
>         /* RAW (Bayer and greyscale) formats. */
>         {
>                 .code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
>                 .output =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +               .data_type =3D MIPI_CSI2_DT_RAW8,
>                 .width =3D 8,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
>                 .output =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +               .data_type =3D MIPI_CSI2_DT_RAW8,
>                 .width =3D 8,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
>                 .output =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +               .data_type =3D MIPI_CSI2_DT_RAW8,
>                 .width =3D 8,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
>                 .output =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +               .data_type =3D MIPI_CSI2_DT_RAW8,
>                 .width =3D 8,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_Y8_1X8,
>                 .output =3D MEDIA_BUS_FMT_Y8_1X8,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +               .data_type =3D MIPI_CSI2_DT_RAW8,
>                 .width =3D 8,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
>                 .output =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +               .data_type =3D MIPI_CSI2_DT_RAW10,
>                 .width =3D 10,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
>                 .output =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +               .data_type =3D MIPI_CSI2_DT_RAW10,
>                 .width =3D 10,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
>                 .output =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +               .data_type =3D MIPI_CSI2_DT_RAW10,
>                 .width =3D 10,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
>                 .output =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +               .data_type =3D MIPI_CSI2_DT_RAW10,
>                 .width =3D 10,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_Y10_1X10,
>                 .output =3D MEDIA_BUS_FMT_Y10_1X10,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +               .data_type =3D MIPI_CSI2_DT_RAW10,
>                 .width =3D 10,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
>                 .output =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +               .data_type =3D MIPI_CSI2_DT_RAW12,
>                 .width =3D 12,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
>                 .output =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +               .data_type =3D MIPI_CSI2_DT_RAW12,
>                 .width =3D 12,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
>                 .output =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +               .data_type =3D MIPI_CSI2_DT_RAW12,
>                 .width =3D 12,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
>                 .output =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +               .data_type =3D MIPI_CSI2_DT_RAW12,
>                 .width =3D 12,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_Y12_1X12,
>                 .output =3D MEDIA_BUS_FMT_Y12_1X12,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +               .data_type =3D MIPI_CSI2_DT_RAW12,
>                 .width =3D 12,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SBGGR14_1X14,
>                 .output =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +               .data_type =3D MIPI_CSI2_DT_RAW14,
>                 .width =3D 14,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SGBRG14_1X14,
>                 .output =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +               .data_type =3D MIPI_CSI2_DT_RAW14,
>                 .width =3D 14,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SGRBG14_1X14,
>                 .output =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +               .data_type =3D MIPI_CSI2_DT_RAW14,
>                 .width =3D 14,
>         }, {
>                 .code =3D MEDIA_BUS_FMT_SRGGB14_1X14,
>                 .output =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +               .data_type =3D MIPI_CSI2_DT_RAW14,
>                 .width =3D 14,
>         },
>         /* JPEG */
> @@ -494,7 +476,7 @@ static const struct csis_pix_format mipi_csis_formats=
[] =3D {
>                  * SoC that can support quad pixel mode, this will have t=
o be
>                  * revisited.
>                  */
> -               .data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +               .data_type =3D MIPI_CSI2_DT_RAW8,
>                 .width =3D 8,
>         }
>  };
> @@ -583,7 +565,7 @@ static void __mipi_csis_set_format(struct mipi_csis_d=
evice *csis,
>          *
>          * TODO: Verify which other formats require DUAL (or QUAD) modes.
>          */
> -       if (csis_fmt->data_type =3D=3D MIPI_CSI2_DATA_TYPE_YUV422_8)
> +       if (csis_fmt->data_type =3D=3D MIPI_CSI2_DT_YUV422_8B)
>                 val |=3D MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> =20
>         val |=3D MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
>=20
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> --=20
> Regards,
>=20
> Laurent Pinchart
>

