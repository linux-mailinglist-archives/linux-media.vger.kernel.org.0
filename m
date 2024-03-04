Return-Path: <linux-media+bounces-6348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 087D4870001
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 12:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7E9B1F26046
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 11:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF64A39FEE;
	Mon,  4 Mar 2024 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oHsMJFPZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E557A39FE7
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550712; cv=none; b=BekHp2xEmtTiZTGnu6VBPXbvb6yP/nlgeerqfMYvoSvUkcfH94IICmzYpP3V7fO8nUOZcjcN3vi0DV8zCl/2M03kvVVgrKkAUVs9ZeAURhTAHLF77XGU9rz4aL+8WR7KOXR3eTprx+dsQHVKaFCYDOMPriS42LesVX+CTLuK+BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550712; c=relaxed/simple;
	bh=Q1SASmu/WJw2Mj5S2iPHKTsUZmshPIVg0+XqCsOB60k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0KUBgMvXHmbMDMosZtZXuuCC8okGCsV4XX5sDffv9YpRK63YvFm/2q/GZ3EcsDZnfGwanOMuIDabzaKtwHE+GWoGwFlZNBbkVicFimbSe0LyMJetUurFj13u3QEGsSEIsPUxGGxs16/d6l/H+aMWm5HIN146X0nYTCcv9ipNQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oHsMJFPZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFA763374;
	Mon,  4 Mar 2024 12:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709550691;
	bh=Q1SASmu/WJw2Mj5S2iPHKTsUZmshPIVg0+XqCsOB60k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oHsMJFPZuKZxVcG0pn9Vox/ZBc7FBzZw7t9Hn9gM/qc3bIUA60GG9OJc5eG24Y+Q1
	 iNiPVHu+x0n33hvjwdQqGJQ7OgQxAj13EwNTHf3QJFzEMWldI3Nl/3fRqcdQ0UBJHa
	 wmkg7096vZsiDX2tVDJ6bGWEHa47J8wXst/eY314=
Date: Mon, 4 Mar 2024 12:11:44 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Naushir Patuck <naush@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v6 06/15] media: v4l: Add V4L2-PIX-FMT-Y12P format
Message-ID: <dslznbfmxhshdipthsp3u624c33dfse2333xjgs6e4t3mfjozp@xmq5rm3ax2av>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-7-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240301213231.10340-7-laurent.pinchart@ideasonboard.com>

Hi Laurent

Ah
https://patchwork.linuxtv.org/project/linux-media/patch/20240223163012.300763-2-jacopo.mondi@ideasonboard.com/

same for the Y14 one

I guess we have upported the same patch twice ?

Whichever series gets in first wins

On Fri, Mar 01, 2024 at 11:32:21PM +0200, Laurent Pinchart wrote:
> From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
>
> This is a packed grey-scale image format with a depth of 12 bits per
> pixel. Two consecutive pixels are packed into 3 bytes. The first 2 bytes
> contain the 8 high order bits of the pixels, and the 3rd byte contains
> the 4 least significants bits of each pixel, in the same order.
>
> Add the entry in userspace API, and document it.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-yuv-luma.rst       | 11 +++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c                  |  1 +
>  include/uapi/linux/videodev2.h                        |  1 +
>  3 files changed, 13 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index cf8e4dfbfbd4..a650ceda7cdb 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -114,6 +114,17 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>
> +    * .. _V4L2-PIX-FMT-Y12P:
> +
> +      - ``V4L2_PIX_FMT_Y12P``
> +      - 'Y12P'
> +
> +      - Y'\ :sub:`0`\ [11:4]
> +      - Y'\ :sub:`1`\ [11:4]
> +      - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [3:0]
> +      - ...
> +      - ...
> +
>      * .. _V4L2-PIX-FMT-Y14:
>
>        - ``V4L2_PIX_FMT_Y14``
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index f3697ff65817..69ac4482d844 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1313,6 +1313,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
>  	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
>  	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
> +	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
>  	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 117a081c9db9..5122ac0c6765 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -599,6 +599,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
>  #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
> +#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
>
>  /* Palette formats */
>  #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
> --
> Regards,
>
> Laurent Pinchart
>
>

