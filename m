Return-Path: <linux-media+bounces-34212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F701ACFF49
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 11:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B549D1894E5A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 09:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC717286898;
	Fri,  6 Jun 2025 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mP24ZOSM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3791D27468
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202111; cv=none; b=ohszTQescoEWE+DnUTO2RxrCuruuNwFAULwgMfgbUBGCZmlRqT5wP2YBwbXJbt8CIWOjlgia8A66g619mBYOHbEIbSnLR/IQQzEjNZHn+OQYGBvaZbWpWwMqdHU3K+KJyYtQ/m5nPkuvqog1MD3DJcIbKHYa77FOyE0MKwgbgwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202111; c=relaxed/simple;
	bh=0doAiajRRvvEMk5cGmmO3oLLBcTxRUG2QibubLx7Mco=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=adPVmpnJrk1kPRdbyiEc1B7BJt+Lc65noynvrS6skzoXrjPbitDiGJFcyNpQvGYo3evvXlmVtKaYSPas7zmHxGM8fLY48Eyf9lRgoW2OZjiu2SnVj2m60PV4TzEBD/VUOKidemBoL0XtU9UL81VQHHr7YXlds4AmSfyIHdTETv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mP24ZOSM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a5257748e1so1366809f8f.2
        for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749202107; x=1749806907; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlmfCFjMuzs1N1lUzyEgna955CGY1iJJdCz7vJgm8m8=;
        b=mP24ZOSMjp/ksgs+stvawhAHaJ48FZONNmdJK/HJP6kBZnqvdSm6BNIfnPceSKTe3R
         jQTlTiFGDitX4nd0MrCBeXO72Kqzn0VZiye+S34Hc+RYQlKaYoxSqLwbeN3eMRMwgKjM
         u6r3ttFaKLzebYOFGTBLzb6Ew/e2N2K2TLQiEyIAe7UGrt/LzjzM9jE2bY3DFxnqYKhT
         yjWQckfR28xW0oLCx0MRdj6WjSC/Ao+LDB3OG9qvZwQ4wvlYvxvgOhVmlrjwKSPmann6
         47+FhXImX4axI/f57Tz1AOpkLyrziPmraI6NRRJypVhld5z/QJIU2CLEb+ph3DkRHgR4
         yvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202107; x=1749806907;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LlmfCFjMuzs1N1lUzyEgna955CGY1iJJdCz7vJgm8m8=;
        b=e5t6FI9MZmTninMQ66qWfC4FGczyVXOVr/e64hWzgVVrVnmec1ts4Sn5+kgcs3lq03
         Udl3tI2dapacss1NJptEytE49GHCrxY674SunB6J2KLoabAq9hCNffNdWav5268X6j/M
         q10DUziIdMnvKEcFPyPmuQTQXqpEHBr+9vA0DXlO4zgKk0UwUxziZ2Xi/Ezbms/OMF2I
         EAs1ApL+q6FOgH7XNzmXxYcZ/cbV8O5aMGnIQG/L95Vrcq1v24dohg5kGp7DURWeF0MA
         v8g69Ywr3lfQA0Vh/o+2aplV/941QX8jZw/gNkGM0efNZo7iOnbeZsUjxzRPLFFVhahi
         mkJg==
X-Forwarded-Encrypted: i=1; AJvYcCXV5wPKsGiL5XfhbM9C4Hg9L/hlfe5yfGoFXYORNQljg4nlm6f9sQluoJtRSgk4JaRYOWsZTNFEosZ6qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwucAYVNQ0tySPRLONJxbvaJqMdFW+kzvAiYIQLst6fvgSUGVKM
	14k7ZqEMIzZdZ3+SlnpnqEx0GPGZ9RuBDXYmq7xUg55FGDjtfaX07gHU
X-Gm-Gg: ASbGncshKZgETtv7D679AvKZEkm/+nJiJI0rZNLJivnJVXwbAwzGkQx7rdIehKqYUAE
	qYo0rw1ZcYsnoXdFe4zx+bdgK3q7TVnW/bI8xLlZOe7X/cTgWZRHIeHKfTjbhKeYQ03eI3lgpTp
	farnU0lsZIcW25wzTMGvgaUFJTChmE4UBuvhfXSGCYvaRFNC2RjQN860B0xVpCADnVGmzKpPjGv
	ELFD4oxDRcKLEgmVkWpb/8URtCeXug3Uuj9nquPyANsAaVgHNm/5nF24UwQyL1BIzc+ZSaLBvvo
	Si3ai5XPagl1OChitpHZT1lQgBgH7LA5VoUJ3kLmTBz1/eIQRnP+n2FaW+HJ7EKSOGHwTcKaf8s
	YoWo=
X-Google-Smtp-Source: AGHT+IFXqDfgMTtfe8cy9h2sP2ZJe7Kh/xgvxpDhb7elUjTlSiIFsinjlxm/PD0rKLcQuBTqLIbUqw==
X-Received: by 2002:a05:6000:250f:b0:3a4:d02e:84af with SMTP id ffacd0b85a97d-3a5319b5ca5mr2268379f8f.58.1749202107146;
        Fri, 06 Jun 2025 02:28:27 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5323c0819sm1302118f8f.45.2025.06.06.02.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:28:26 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 10:28:25 +0100
Message-Id: <DAFCE9SLVTFF.2T9D30I3PYO02@linaro.com>
Cc: "Rui Miguel Silva" <rmfrfs@gmail.com>, "Martin Kepplinger"
 <martink@posteo.de>, "Purism Kernel Team" <kernel@puri.sm>, "Stefan Klug"
 <stefan.klug@ideasonboard.com>, <imx@lists.linux.dev>
Subject: Re: [PATCH] media: imx-mipi-csis: Use CSI-2 data type macros from
 mipi-csi2.h
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>
References: <20250606090533.10711-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250606090533.10711-1-laurent.pinchart@ideasonboard.com>

Hey Laurent,
On Fri Jun 6, 2025 at 10:05 AM WEST, Laurent Pinchart wrote:

> The imx-mipi-csis defines custom macros for the CSI-2 data types,
> duplicating the centralized macros defines in mipi-csi2.h. Replace them
> with the latter.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

All looks good.
Thanks.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
   Rui
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 68 ++++++++--------------
>  1 file changed, 25 insertions(+), 43 deletions(-)
>
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
>  #define DEFAULT_SCLK_CSIS_FREQ			166000000UL
> =20
> -/* MIPI CSI-2 Data Types */
> -#define MIPI_CSI2_DATA_TYPE_YUV420_8		0x18
> -#define MIPI_CSI2_DATA_TYPE_YUV420_10		0x19
> -#define MIPI_CSI2_DATA_TYPE_LE_YUV420_8		0x1a
> -#define MIPI_CSI2_DATA_TYPE_CS_YUV420_8		0x1c
> -#define MIPI_CSI2_DATA_TYPE_CS_YUV420_10	0x1d
> -#define MIPI_CSI2_DATA_TYPE_YUV422_8		0x1e
> -#define MIPI_CSI2_DATA_TYPE_YUV422_10		0x1f
> -#define MIPI_CSI2_DATA_TYPE_RGB565		0x22
> -#define MIPI_CSI2_DATA_TYPE_RGB666		0x23
> -#define MIPI_CSI2_DATA_TYPE_RGB888		0x24
> -#define MIPI_CSI2_DATA_TYPE_RAW6		0x28
> -#define MIPI_CSI2_DATA_TYPE_RAW7		0x29
> -#define MIPI_CSI2_DATA_TYPE_RAW8		0x2a
> -#define MIPI_CSI2_DATA_TYPE_RAW10		0x2b
> -#define MIPI_CSI2_DATA_TYPE_RAW12		0x2c
> -#define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
> -#define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
> -
>  struct mipi_csis_event {
>  	bool debug;
>  	u32 mask;
> @@ -357,116 +339,116 @@ static const struct csis_pix_format mipi_csis_for=
mats[] =3D {
>  	{
>  		.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
>  		.output =3D MEDIA_BUS_FMT_UYVY8_1X16,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_YUV422_8,
> +		.data_type =3D MIPI_CSI2_DT_YUV422_8B,
>  		.width =3D 16,
>  	},
>  	/* RGB formats. */
>  	{
>  		.code =3D MEDIA_BUS_FMT_RGB565_1X16,
>  		.output =3D MEDIA_BUS_FMT_RGB565_1X16,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RGB565,
> +		.data_type =3D MIPI_CSI2_DT_RGB565,
>  		.width =3D 16,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_BGR888_1X24,
>  		.output =3D MEDIA_BUS_FMT_RGB888_1X24,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RGB888,
> +		.data_type =3D MIPI_CSI2_DT_RGB888,
>  		.width =3D 24,
>  	},
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
>  		.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.output =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.output =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.output =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.output =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_Y8_1X8,
>  		.output =3D MEDIA_BUS_FMT_Y8_1X8,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.output =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
>  		.width =3D 10,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.output =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
>  		.width =3D 10,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.output =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
>  		.width =3D 10,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.output =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
>  		.width =3D 10,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_Y10_1X10,
>  		.output =3D MEDIA_BUS_FMT_Y10_1X10,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
>  		.width =3D 10,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.output =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
>  		.width =3D 12,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.output =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
>  		.width =3D 12,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.output =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
>  		.width =3D 12,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.output =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
>  		.width =3D 12,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_Y12_1X12,
>  		.output =3D MEDIA_BUS_FMT_Y12_1X12,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
>  		.width =3D 12,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SBGGR14_1X14,
>  		.output =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
>  		.width =3D 14,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGBRG14_1X14,
>  		.output =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
>  		.width =3D 14,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGRBG14_1X14,
>  		.output =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
>  		.width =3D 14,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SRGGB14_1X14,
>  		.output =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
>  		.width =3D 14,
>  	},
>  	/* JPEG */
> @@ -494,7 +476,7 @@ static const struct csis_pix_format mipi_csis_formats=
[] =3D {
>  		 * SoC that can support quad pixel mode, this will have to be
>  		 * revisited.
>  		 */
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}
>  };
> @@ -583,7 +565,7 @@ static void __mipi_csis_set_format(struct mipi_csis_d=
evice *csis,
>  	 *
>  	 * TODO: Verify which other formats require DUAL (or QUAD) modes.
>  	 */
> -	if (csis_fmt->data_type =3D=3D MIPI_CSI2_DATA_TYPE_YUV422_8)
> +	if (csis_fmt->data_type =3D=3D MIPI_CSI2_DT_YUV422_8B)
>  		val |=3D MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> =20
>  	val |=3D MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
>
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> --=20
> Regards,
>
> Laurent Pinchart




