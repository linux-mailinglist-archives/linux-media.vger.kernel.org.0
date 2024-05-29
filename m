Return-Path: <linux-media+bounces-12190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F362C8D3E3D
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 20:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AABBB285893
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 18:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1545181BA9;
	Wed, 29 May 2024 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UGBtNV6U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA3415CD4D;
	Wed, 29 May 2024 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717006738; cv=none; b=XG5ZsupYdMd+5s8U9fq64JbhNNxnngRVQ04TMgXEaYJ5erJ8MaPPALyGPROk7xdpdqKmtpoO8QZ050y94PBlHAaT4nJBY7AwJRFC+IPNEKBv+h548GDcGZ/BljOGrOUIlUG/oYfdfimxk6Q2aHg+q9Jw1OoAAxaPJMD3LTtMtY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717006738; c=relaxed/simple;
	bh=x2yklQM+akOGnNT4XFqoInKtXLBUc/QOAQOQyOJVhAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPvBKFFATGfXF++CYVh4NV+BWuaZHVPbEfpLSfLaaYXTzAdRK6rbV07d2u2KyV4RXb+ztbuKRhCm0j/zVLOewg49ytON+/6zCJMr3sq7eGO63dnlqez3nnVMA6KX4G+qe643P/9ugMMX3q2Qr4JBZKDJ3W1mIOAKGlPOkdsSh8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UGBtNV6U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF26DB53;
	Wed, 29 May 2024 20:18:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717006731;
	bh=x2yklQM+akOGnNT4XFqoInKtXLBUc/QOAQOQyOJVhAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGBtNV6U3BTuNf9S3Q8lkNePqEILbLDC34wH/T9SBiVdjoDp9QJsaLINPMyuK74/D
	 ihXRNgVQpWMHjS6V18KwWGO5R8+27cNoPPtmp5YzogfduwUxeSFjeJRy1tZge2NvBO
	 BIrl8JsWl+co9lnGcZcdHvNab13soefYO0bcIGAA=
Date: Wed, 29 May 2024 21:18:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v5 02/16] media: uapi: Add 20-bit bayer formats
Message-ID: <20240529181842.GB10586@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-3-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240529152858.183799-3-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, May 29, 2024 at 04:28:44PM +0100, Daniel Scally wrote:
> The Mali-C55 requires input data be in 20-bit format, MSB aligned.
> Add some new media bus format macros to represent that input format.
> 
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v5:
> 
> 	- New patch
> 
>  .../media/v4l/subdev-formats.rst              | 100 ++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |   6 +-
>  2 files changed, 105 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 8d164a9a9e15..f986dfc52879 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3445,6 +3445,106 @@ organization is given as an example for the first pixel only.
>        - r\ :sub:`2`
>        - r\ :sub:`1`
>        - r\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SBGGR20-1X20:
> +
> +      - MEDIA_BUS_FMT_SBGGR20_1X20
> +      - 0x3021
> +      -
> +      - r\ :sub:`19`
> +      - r\ :sub:`18`
> +      - r\ :sub:`17`
> +      - r\ :sub:`16`
> +      - r\ :sub:`15`
> +      - r\ :sub:`14`
> +      - r\ :sub:`13`
> +      - r\ :sub:`12`
> +      - r\ :sub:`11`
> +      - r\ :sub:`10`
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`

The table currently has 16 columns for data bits. You need to expand
that to 20 columns.

> +    * .. _MEDIA-BUS-FMT-SGBRG20-1X20:
> +
> +      - MEDIA_BUS_FMT_SGBRG20_1X20
> +      - 0x3022
> +      -
> +      - r\ :sub:`19`
> +      - r\ :sub:`18`
> +      - r\ :sub:`17`
> +      - r\ :sub:`16`
> +      - r\ :sub:`15`
> +      - r\ :sub:`14`
> +      - r\ :sub:`13`
> +      - r\ :sub:`12`
> +      - r\ :sub:`11`
> +      - r\ :sub:`10`
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SGRBG20-1X20:
> +
> +      - MEDIA_BUS_FMT_SGRBG20_1X20
> +      - 0x3023
> +      -
> +      - r\ :sub:`19`
> +      - r\ :sub:`18`
> +      - r\ :sub:`17`
> +      - r\ :sub:`16`
> +      - r\ :sub:`15`
> +      - r\ :sub:`14`
> +      - r\ :sub:`13`
> +      - r\ :sub:`12`
> +      - r\ :sub:`11`
> +      - r\ :sub:`10`
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SRGGB20-1X20:
> +
> +      - MEDIA_BUS_FMT_SRGGB20_1X20
> +      - 0x3024
> +      -
> +      - r\ :sub:`19`
> +      - r\ :sub:`18`
> +      - r\ :sub:`17`
> +      - r\ :sub:`16`
> +      - r\ :sub:`15`
> +      - r\ :sub:`14`
> +      - r\ :sub:`13`
> +      - r\ :sub:`12`
> +      - r\ :sub:`11`
> +      - r\ :sub:`10`
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
>  
>  .. raw:: latex
>  
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 49be328d9a3b..b6acf8c8e383 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -122,7 +122,7 @@
>  #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
>  
> -/* Bayer - next is	0x3021 */
> +/* Bayer - next is	0x3025 */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
>  #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
>  #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
> @@ -155,6 +155,10 @@
>  #define MEDIA_BUS_FMT_SGBRG16_1X16		0x301e
>  #define MEDIA_BUS_FMT_SGRBG16_1X16		0x301f
>  #define MEDIA_BUS_FMT_SRGGB16_1X16		0x3020
> +#define MEDIA_BUS_FMT_SBGGR20_1X20		0x3021
> +#define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
> +#define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
> +#define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
>  
>  /* JPEG compressed formats - next is	0x4002 */
>  #define MEDIA_BUS_FMT_JPEG_1X8			0x4001

-- 
Regards,

Laurent Pinchart

