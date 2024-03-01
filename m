Return-Path: <linux-media+bounces-6276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F2086EB97
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 23:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45DA02860C7
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780D159153;
	Fri,  1 Mar 2024 22:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iI4UqYAb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5292358ABF
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 22:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709330966; cv=none; b=B0Ko58zreqk8xlvrYmizxkceuRiQGnrFkcc8hQLmDvo93nKyFq/bobbasF12WiwMinoMtso0CReAPFnssMcg/sopqzWQSXWjfGEO4lB5zNBJVGFV9LOBxn4J80KXQCL7wbaORvNJD81t9n+lTE0mUONrWfUwSgPiAjk448zG0kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709330966; c=relaxed/simple;
	bh=3VjG81cuKyAdlhRmoKQU5WHT0UtfXe8cOQadbrwKpmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUOKjzJMpNGmMFiKXcdNMqHKuLWnlVJkTgb7lRnX/6MDaDdLfoItNZtQkvxmmPG3sXcKrnZgryGVfhinOMq1P+yidd+RlKdeuNB8gtwOOXl/BkgIxHEfSXOQC4MTb+zOG4ua7yVwI+DWDqNBudEUQT/hhHZ11SQTqaTygdjPTUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iI4UqYAb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B5639CE;
	Fri,  1 Mar 2024 23:09:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709330949;
	bh=3VjG81cuKyAdlhRmoKQU5WHT0UtfXe8cOQadbrwKpmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iI4UqYAbjiDuv/ZV4zAE7nq7gukqHUGUlc8EqhqpAuS2ZUqJIWMjHTlMsdVEN/j8X
	 +TFcKiE7C3YFLg7/ku6BpvPCQWAjC1SM5ly1Xoj8gLGxiK0o5m6vkGleQ05Gk2I3k+
	 4f5fWbpj2SGzjAtqXZJY6BorXsrPwG0hloXpdwsQ=
Date: Sat, 2 Mar 2024 00:09:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/9] media: uapi: Add MIPI packed 14bit luma
Message-ID: <20240301220926.GQ30889@pendragon.ideasonboard.com>
References: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
 <20240223163012.300763-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240223163012.300763-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, Feb 23, 2024 at 05:30:04PM +0100, Jacopo Mondi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Add the Y14P format to describe monochrome 14 bit image format
> packed according to the RAW14 format as defined by the MIPI
> CSI-2 specification.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../media/v4l/pixfmt-yuv-luma.rst             | 37 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  3 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index 585d736f36e5..3af6e3cb70c4 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -36,6 +36,8 @@ are often referred to as greyscale formats.
>        - Byte 2
>        - Byte 3
>        - Byte 4
> +      - Byte 5
> +      - Byte 6
>  
>      * .. _V4L2-PIX-FMT-GREY:
>  
> @@ -47,6 +49,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-IPU3-Y10:
>  
> @@ -58,6 +62,8 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
>        - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [9:4]
>        - Y'\ :sub:`3`\ [9:2]
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y10:
>  
> @@ -69,6 +75,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y10BPACK:
>  
> @@ -80,6 +88,8 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`2`\ [9:6]
>        - Y'\ :sub:`2`\ [5:0] Y'\ :sub:`3`\ [9:8]
>        - Y'\ :sub:`3`\ [7:0]
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y10P:
>  
> @@ -91,6 +101,8 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`2`\ [9:2]
>        - Y'\ :sub:`3`\ [9:2]
>        - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y12:
>  
> @@ -102,6 +114,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y012:
>  
> @@ -113,6 +127,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y12P:
>  
> @@ -124,6 +140,8 @@ are often referred to as greyscale formats.
>        -  Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [3:0]
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y14:
>  
> @@ -135,6 +153,21 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
> +
> +    * .. _V4L2-PIX-FMT-Y14P:
> +
> +      - ``V4L2_PIX_FMT_Y14P``
> +      - 'Y14P'
> +
> +      -  Y'\ :sub:`0`\ [13:6]
> +      -  Y'\ :sub:`1`\ [13:6]
> +      -  Y'\ :sub:`2`\ [13:6]
> +      -  Y'\ :sub:`3`\ [13:6]
> +      -  Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [5:0]
> +      -  Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [5:2]
> +      -  Y'\ :sub:`3`\ [5:0] Y'\ :sub:`2`\ [5:4]
>  
>      * .. _V4L2-PIX-FMT-Y16:
>  
> @@ -146,6 +179,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>      * .. _V4L2-PIX-FMT-Y16-BE:
>  
> @@ -157,6 +192,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>  
>  .. raw:: latex
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 9cb09334161b..d0724240a446 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1312,6 +1312,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
>  	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
>  	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
> +	case V4L2_PIX_FMT_Y14P:		descr = "14-bit Greyscale (MIPI Packed)"; break;
>  	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
>  	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 11ebf9b22ccb..911f00ed28fd 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -599,6 +599,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
>  #define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
> +#define V4L2_PIX_FMT_Y14P    v4l2_fourcc('Y', '1', '4', 'P') /* 14  Greyscale, MIPI RAW14 packed */
>  #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
>  
>  /* Palette formats */

-- 
Regards,

Laurent Pinchart

