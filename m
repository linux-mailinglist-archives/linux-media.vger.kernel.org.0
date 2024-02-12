Return-Path: <linux-media+bounces-4978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 213568513CD
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 13:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBEBC282A87
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 12:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A032239FFF;
	Mon, 12 Feb 2024 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="vqE8/Cgv"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4388539FEE
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707742174; cv=pass; b=vBaAZusj+d/dDxBtPCY8niypvl3RGZnTuseGlI0hGvRIfS0Wv3FnItYcEoNS/55b38NqU9cwCoAVIW3doFhO20hjf+DUCv/4vNi3FJnxPSKrktm1hA/LNd1LCLS+HdxLJz/UYqWJ+TUnGimlYzJ6YUvdzYqAcZvcF/JsZsckR2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707742174; c=relaxed/simple;
	bh=StGVc45FM1xUQVxnq/2PKlK00D6BDue1CfBCb6yht/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hf9I5Yree8yCdrJOetbf3BO9VDMQAVrRI4P9+naJPbaoRafFErHVL91tT8hL9v5xwvu8V0ue2jFNp6EdYxG5Kd2Yl4tHQRiuNgwHKQwiOxY/CMPqLwPZ42R5d28zy3DXKtD38RTUanYal2w1psLYBgObQ+fRiu3+IkfiE8zpA4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=vqE8/Cgv; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TYPRN6QVgzyNC;
	Mon, 12 Feb 2024 14:49:20 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1707742163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Doys4q2GXsBTaPZ1TSoAORLUXat3NlbgMcvMidTfqm0=;
	b=vqE8/CgvS6KmTemlmzSFLvENnIqmEAsyUPkmvPlNZm+BXSsAD1HVVDeUHjAlg4WgZ4f4PX
	zkPqb0gUA95lb2s6o8UwLvb/zUWoKIonWN19d95eQTwFcxMz2IeCTmDtApFz41NkSoui8b
	4ZuHBX1HaTXE+CwrNWDg1z2muc0uLlE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1707742163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Doys4q2GXsBTaPZ1TSoAORLUXat3NlbgMcvMidTfqm0=;
	b=wXaTOT8wx0g+tItj76YOIUqMsiXky/dMOAIL8s+vzPxNtGr0SQGEf40gWs46ruygL+h8rk
	pS3vxW6feTdBKegcyzf+Tr/C0QiWMYeY8xd3qK437IJRF0q7GaP6FvpQTUNn5fNtZb+5Ap
	taIkJfRN794MMD9+gzNB4qYK7msiupU=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1707742163; a=rsa-sha256; cv=none;
	b=fSLdQChaIY1qraN+XTWHOPNCUCOWeCzdGogSGbzhB0iU9l4IL9f/V+TV8ghSheY3k0wrKr
	0AofuoSxzDDiGilhqnUEWQ5vD/2sknMNRAs0888Fx6Z0lNbFlwgdze12zRkWPSEufT8/sf
	ianzQCIwfafDtNSJ1b0rUgSd/zsibYA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5B64F634C93;
	Mon, 12 Feb 2024 14:49:19 +0200 (EET)
Date: Mon, 12 Feb 2024 12:49:19 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/8] media: Add a pixel format for MIPI packed 12bit luma
 only.
Message-ID: <ZcoTzydgE6bo7lpO@valkosipuli.retiisi.eu>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-2-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209164825.166800-2-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

On Fri, Feb 09, 2024 at 05:48:16PM +0100, Jacopo Mondi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> This is the format used by monochrome 12bit image sensors.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-y12p.rst   | 38 +++++++++++++++++++
>  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 41 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> new file mode 100644
> index 000000000000..b2eb4a72724d
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> @@ -0,0 +1,38 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _V4L2-PIX-FMT-Y12P:
> +
> +******************************
> +V4L2_PIX_FMT_Y12P ('Y12P')
> +******************************

You have extra asterisks here.

> +
> +Grey-scale image as a MIPI RAW12 packed array

I think you may mention it aligns with MIPI CSI-2 but the same packing may
be used elsewhere, it's fairly trivial. The similar Bayer format
definitions don't mention this.

> +
> +
> +Description
> +===========
> +
> +This is a packed grey-scale image format with a depth of 12 bits per
> +pixel. Two consecutive pixels are packed into 3 bytes. The first 2 bytes
> +contain the 8 high order bits of the pixels, and the 3rd byte contains the 4
> +least significants bits of each pixel, in the same order.
> +
> +**Byte Order.**
> +Each cell is one byte.
> +
> +.. tabularcolumns:: |p{2.2cm}|p{1.2cm}|p{1.2cm}|p{3.1cm}|
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       2 1 1 1
> +
> +
> +    -  -  start + 0:
> +       -  Y'\ :sub:`00high`
> +       -  Y'\ :sub:`01high`
> +       -  Y'\ :sub:`01low`\ (bits 7--4)
> +

Is the newline here intentional?

> +          Y'\ :sub:`00low`\ (bits 3--0)
> +
> diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> index 24b34cdfa6fe..7c9ccfdd94cd 100644
> --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> @@ -267,6 +267,7 @@ image.
>      pixfmt-packed-yuv
>      pixfmt-yuv-planar
>      pixfmt-yuv-luma
> +    pixfmt-y12p
>      pixfmt-y8i
>      pixfmt-y12i
>      pixfmt-uv8
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 33076af4dfdb..483498c55899 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1311,6 +1311,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
>  	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
>  	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
> +	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
>  	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
>  	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index a8015e5e7fa4..11ebf9b22ccb 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -598,6 +598,7 @@ struct v4l2_pix_format {
>  /* Grey bit-packed formats */
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
> +#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
>  #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
>  
>  /* Palette formats */

-- 
Regards,

Sakari Ailus

