Return-Path: <linux-media+bounces-35489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC3AE1AC0
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 14:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87D3E7AA9A3
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 12:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323C728AAFC;
	Fri, 20 Jun 2025 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o1Ya2vsh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167C728315F
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421691; cv=none; b=WsdHSCVUk0BvCcUPa3u7KBBJdg15X6VocEum4LsPhaekVFr+Tqvn/dhZkWR8bIArpZZz4J4iYImWHL+pgngPd/e1DhcpST//Hhd2Rx8xJPuGziVObsvXNz+6TwdV6YZfzZvyD58hS9fR10aebu4g41bUdwRNj3KscsQiDqzhnI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421691; c=relaxed/simple;
	bh=arhHdAHeMxslNXT93UWyDewFOrhLC9Cd7hdrLcvV5oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGBXL7+8Xj7SQJeBCnMNsopqaSDS/uajzoheYfgXu4OFGy50FhiJsgwUo9T00h1jzMTKKtKXxT1fm2RaUjpx5Uwl32CiOwfjVunqqqc5K8jO/t8VZYVdGpF4w+YEpJMwcmfp+nHxgjnZkmDQds+KcY+d9YwBbWCd/Fxmz393wDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o1Ya2vsh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD56E7FA;
	Fri, 20 Jun 2025 14:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750421673;
	bh=arhHdAHeMxslNXT93UWyDewFOrhLC9Cd7hdrLcvV5oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1Ya2vshwQJPMhA7bDosbbU+7iXlvyTwNqsM7sXnjy61cP2W7EnolCZ/hmrSP1Kzl
	 WdBYhC9CX4Y/JZLOKMHq2JvFXC36HmbPKG46ySkQmBSXf7Ww/rrEdIPNgiVsVed4Ho
	 eopRCru//haA9Oth+8lz5AGyYNIwi/JOXKP5qfY4=
Date: Fri, 20 Jun 2025 14:14:44 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 19/64] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <6nnjs7lwgf6auy2jsa5nrutz5kd6hbzbwlazbqv2p3dypdm46d@uxkudk2rnz7b>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-20-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-20-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:51PM +0300, Sakari Ailus wrote:
> Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether

Is this the same control you have referred to in
"media: uapi: Add new media bus codes for generic raw formats" as
V4L2_CID_COLOUR_PATTERN_MODIFY ?

> flipping results in a change in the sensor's color pattern, separately
> horizontally and vertically. The information is essential for raw formats
> when using generic raw mbus codes.

Probably the distinction between horizontal and vertical changes is
the reason why V4L2_CTRL_FLAG_MODIFY_LAYOUT can't be resused ?

Hoever the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag is specified per-control,
so if it applies to vflip it conveys already that the bayer ordering
is flipped in the vertical direction (likewise for hflip).

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
>  include/uapi/linux/v4l2-controls.h                     |  5 +++++
>  3 files changed, 17 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index b19aaaffbce0..43a62a85afb8 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -131,3 +131,13 @@ Image Source Control IDs
>        - Raw Bayer, with alternating lines beginning with green, blue pixels and
>          red, green pixels.
>        - 3
> +
> +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
> +    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
> +    V4L2_CID_VFLIP) have an effect on the pixel order of the output color
> +    pattern. Macros ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> +    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If
> +    either horizontal or vertical bit is set, the readout pattern order is that
> +    of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
> +    ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> +    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 8119012c2638..9ec65998a8f7 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1156,6 +1156,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
>  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
>  	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
> +	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
>
>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1484,6 +1485,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*type = V4L2_CTRL_TYPE_BITMASK;
>  		break;
>  	case V4L2_CID_CONFIG_MODEL:
> +	case V4L2_CID_COLOR_PATTERN_FLIP:
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		*type = V4L2_CTRL_TYPE_BITMASK;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 09e5d5bbe7f8..740bf8544446 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1227,6 +1227,11 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_COLOR_PATTERN_BGGR			2U
>  #define V4L2_COLOR_PATTERN_GBRG			3U
>
> +#define V4L2_CID_COLOR_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
> +#define V4L2_COLOR_PATTERN_FLIP_HORIZONTAL	(1U << 0)
> +#define V4L2_COLOR_PATTERN_FLIP_VERTICAL	(1U << 1)
> +#define V4L2_COLOR_PATTERN_FLIP_BOTH \
> +	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
>
>  /* Image processing controls */
>
> --
> 2.39.5
>
>

