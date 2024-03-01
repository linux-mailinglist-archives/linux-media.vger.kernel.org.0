Return-Path: <linux-media+bounces-6278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB8F86EB9B
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 23:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8D0F1C21548
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A675915F;
	Fri,  1 Mar 2024 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qhWcvH3L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4DA58ADD
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 22:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709331294; cv=none; b=h4VfIcQjPW1LR927I5tEL426HQaMTJ01cdNG2ALyFtRNiQeFrMR9C52+XOdz94V5SCPPmX4MpcPDK0XCFFCAK6LXse6lPobQ3aX4CEqruNdf5xx4cVA9BU3sLf86s3jeNDmF0fFvK2AAvt75P/G0PW4hO0m/hdqxJKKpHAs/GQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709331294; c=relaxed/simple;
	bh=ERezWGhJceHhaFNTA5xwSnSm4vHIqXGwDeYUb/rOQp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jz49c84x1pv+FOgFNrIOU0DrsWt4kzvthh0nsgrCENF2WrE+NG8Dyb0MaAPLKRZxK/v7xNd+L6OdWAVZOK2k8OlNheSoAiM097FW1oPB/zAsZh4Y2p2ZpnIb1svd8RWiwOBYzkztD5kyNuUGL/BpJBRKuzFFavcS2QpHKt7mbZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qhWcvH3L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB7769CE;
	Fri,  1 Mar 2024 23:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709331277;
	bh=ERezWGhJceHhaFNTA5xwSnSm4vHIqXGwDeYUb/rOQp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhWcvH3LyhqTADGijzSTCcHs3EYSk0U6ta3GjeOpHNmLlw/RcLWgFn9or+AbfKZvb
	 1e7tizXQw+4mTqtSCg4P8l/aogtLMdv+/d04Wr76XHPvvlbF549fmJDNRDiEi36u4H
	 Rk0u187Ej6WeSnkCid/UKi4idEVehM4+JQSIOhz0=
Date: Sat, 2 Mar 2024 00:14:53 +0200
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
Subject: Re: [PATCH v2 4/9] media: uapi: Add a pixel format for BGR48 and
 RGB48
Message-ID: <20240301221453.GS30889@pendragon.ideasonboard.com>
References: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
 <20240223163012.300763-5-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240223163012.300763-5-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, Feb 23, 2024 at 05:30:06PM +0100, Jacopo Mondi wrote:
> Add BGR48 and RGB48 16-bit per component image formats.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 39 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |  2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
>  include/uapi/linux/videodev2.h                |  4 ++
>  4 files changed, 47 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index b71b80d634d6..458308ae4eb8 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -996,6 +996,45 @@ arranged in little endian order.
>  
>      \normalsize
>  
> +16 Bits Per Component
> +=====================
> +
> +These formats store an RGB triplet in six bytes, with 16 bits per component.

You should document here if the 16-bit values are stored in little
endian or big endian. It would also be clearer if the table below had 6
bytes columns instead of 3, it would remove any ambiguity.

> +
> +.. raw:: latex
> +
> +    \small
> +
> +.. flat-table:: RGB Formats With 16 Bits Per Component
> +    :header-rows:  1
> +
> +    * - Identifier
> +      - Code
> +      - Byte 1-0
> +      - Byte 3-2
> +      - Byte 5-4
> +    * .. _V4L2-PIX-FMT-BGR48:
> +
> +      - ``V4L2_PIX_FMT_BGR48``
> +      - 'BGR6'
> +
> +      - B\ :sub:`15-0`
> +      - G\ :sub:`15-0`
> +      - R\ :sub:`15-0`
> +      -
> +    * .. _V4L2-PIX-FMT-RGB48:
> +
> +      - ``V4L2_PIX_FMT_RGB48``
> +      - 'RGB6'
> +
> +      - R\ :sub:`15-0`
> +      - G\ :sub:`15-0`
> +      - B\ :sub:`15-0`
> +
> +.. raw:: latex
> +
> +    \normalsize
> +
>  Deprecated RGB Formats
>  ======================
>  
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index d34d210908d9..ff4b4d2de9d2 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -253,6 +253,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_BGR48_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_BGR48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_RGB48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_ABGR64_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_RGBA1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_RGBX1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index d0724240a446..a2f9c446a565 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1298,6 +1298,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_RGBX1010102:	descr = "32-bit RGBX 10-10-10-2"; break;
>  	case V4L2_PIX_FMT_RGBA1010102:	descr = "32-bit RGBA 10-10-10-2"; break;
>  	case V4L2_PIX_FMT_ARGB2101010:	descr = "32-bit ARGB 2-10-10-10"; break;
> +	case V4L2_PIX_FMT_BGR48:	descr = "48-bit BGR 16-16-16"; break;
> +	case V4L2_PIX_FMT_RGB48:	descr = "48-bit RGB 16-16-16"; break;
>  	case V4L2_PIX_FMT_BGR48_12:	descr = "12-bit Depth BGR"; break;
>  	case V4L2_PIX_FMT_ABGR64_12:	descr = "12-bit Depth BGRA"; break;
>  	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 911f00ed28fd..89b2b409fc03 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -584,6 +584,10 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_BGR48_12    v4l2_fourcc('B', '3', '1', '2') /* 48  BGR 12-bit per component */
>  #define V4L2_PIX_FMT_ABGR64_12   v4l2_fourcc('B', '4', '1', '2') /* 64  BGRA 12-bit per component */
>  
> +/* RGB formats (6 bytes per pixel) */
> +#define V4L2_PIX_FMT_BGR48 v4l2_fourcc('B', 'G', 'R', '6') /* 16  BGR-16-16-16 */
> +#define V4L2_PIX_FMT_RGB48 v4l2_fourcc('R', 'G', 'B', '6') /* 16  RGB-16-16-16 */
> +
>  /* Grey formats */
>  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
>  #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Greyscale     */

-- 
Regards,

Laurent Pinchart

