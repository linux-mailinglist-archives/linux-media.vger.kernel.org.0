Return-Path: <linux-media+bounces-6548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46600873236
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 10:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF3128AE0F
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 09:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA945F555;
	Wed,  6 Mar 2024 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EzduFJEx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68DE5F548
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709716090; cv=none; b=IfqrmJlcaz2Vxky6J2mOy44eqKVIgr0bmpbH8FPODZYJZpGPJeX265Aux6MgyDDP2hdxMNqBVl1wJD/QKhiAk6N/wbZfQ7LULCeAsgWdRK5jB23+ePzmGPL46VP/q02WijlVU3UZudfdhCl/rp7QL8BDNMnnrK4rmLN8plBf5Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709716090; c=relaxed/simple;
	bh=0lvlB7585IXKF57TWbD0VWO/kAh7excaJL4dCS2Z1fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEKtadprHqAsWwlM0aM8lF90jVyAXfKTewl9FD+IA349WP66XixD5PFTyspFinLO3TOdqjKnffQ23G1veSYEXfkgQ+YbwDbag8IBsCgKjTzbjSaTkUpYf9KSKhjXXeRL/ND27140NN7lXrHqoQtHpZzi+WrIgbV4YylWmcCQ+Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EzduFJEx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39E36552;
	Wed,  6 Mar 2024 10:07:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709716069;
	bh=0lvlB7585IXKF57TWbD0VWO/kAh7excaJL4dCS2Z1fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzduFJExF50/vKphYiKO12jXJnLxWFrHCuxiH8lptxDHtYQm8/9Tnj5EkZOSJUPWU
	 lCYmRI0rmNRrm0dlUGlr5kQ1hcN+c06SJPwWUNfk1+AHOLU66UMwawoUc/vB5nl4qS
	 vQJUPSotRQXD8RqasNige7Ogv+yK6fFdl8kWkHe4=
Date: Wed, 6 Mar 2024 10:08:03 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 4/9] media: uapi: Add a pixel format for BGR48 and
 RGB48
Message-ID: <ryhhu62qybrkzb57rlfpf5owm2el2phh3l5uroepfrj6s2svbb@ympavpoqgz6m>
References: <20240305160855.147483-1-jacopo.mondi@ideasonboard.com>
 <20240305160855.147483-5-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240305160855.147483-5-jacopo.mondi@ideasonboard.com>

I just noticed a few things on this patch

On Tue, Mar 05, 2024 at 05:08:47PM +0100, Jacopo Mondi wrote:
> Add BGR48 and RGB48 16-bit per component image formats.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 53 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |  2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
>  include/uapi/linux/videodev2.h                |  4 ++
>  4 files changed, 61 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index b71b80d634d6..4e282b8b962e 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -996,6 +996,59 @@ arranged in little endian order.
>
>      \normalsize
>
> +16 Bits Per Component
> +=====================
> +
> +These formats store an RGB triplet in six bytes, with 16 bits per component
> +stored in memory in little endian byte order. They are named based on the order
> +of the RGB components as stored in memory. For instance, RGB48 stores R\
> +:sub:`7:0` and R\ :sub:`15:8` in bytes 0 and 1 respectively. This differs from
> +the DRM format nomenclature that instead uses the order of components as seen in
> +the 48-bits little endian word.
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
> +      - Byte 0
> +      - Byte 1
> +      - Byte 2
> +      - Byte 3
> +      - Byte 4
> +      - Byte 5

Maybe an empty line here

> +    * .. _V4L2-PIX-FMT-BGR48:
> +
> +      - ``V4L2_PIX_FMT_BGR48``
> +      - 'BGR6'
> +
> +      - B\ :sub:`7-0`
> +      - B\ :sub:`15-8`
> +      - G\ :sub:`7-0`
> +      - G\ :sub:`15-8`
> +      - R\ :sub:`7-0`
> +      - R\ :sub:`15-8`
> +
> +    * .. _V4L2-PIX-FMT-RGB48:
> +
> +      - ``V4L2_PIX_FMT_RGB48``
> +      - 'RGB6'
> +
> +      - R\ :sub:`7-0`
> +      - R\ :sub:`15-8`
> +      - G\ :sub:`7-0`
> +      - G\ :sub:`15-8`
> +      - B\ :sub:`7-0`
> +      - B\ :sub:`15-8`
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

The comment should probably be
        /* 48  RGB 16-bit per component */

to match the previous entries and these two can be moved in the previous
block that enumerates 6 and 8 bytes formats already.

I'll send an update for this patch only.


>  /* Grey formats */
>  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
>  #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Greyscale     */
> --
> 2.43.2
>

