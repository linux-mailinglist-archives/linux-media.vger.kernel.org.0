Return-Path: <linux-media+bounces-41443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82610B3E747
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 16:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D6823A8EE8
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56248322550;
	Mon,  1 Sep 2025 14:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kflT5ruq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3132E88A8
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 14:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756737307; cv=none; b=TpB3MKLaKsqITiwgs5AG2rMJT4nXneBNC/tjzkX8K+jGvLl683PImz4/EBZBxXJFSPBeFOAcJXgvEMFosHLikVKqylYvb1G8G1MAHDjY/tQw7UtjRjC+6iutj5UFQlUPF2WuQHA6Q2f1sAFBtFTuH2TpxaOhZ4qmaK2P5AfpteI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756737307; c=relaxed/simple;
	bh=tlvRZg62LpCUyrR7HV33aHxbKuGRHBajeWClhFsiZeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEp+0X8RDLUChJsgZ+z6uOAuHMU97KTbfCLdosYmjs7QtihCRGZb1P9AIq5xpXv+YLfSpo2qZGRt+V/2PVCK4bCpJTwo8hY1u3VuvjlZbA5vomy0ZszgbyQViuQdcnuZJoRX+wI3pqsQIHN9f/Fsiur70yfZt9OEf6h5zPEYa9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kflT5ruq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D90C650A;
	Mon,  1 Sep 2025 16:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756737234;
	bh=tlvRZg62LpCUyrR7HV33aHxbKuGRHBajeWClhFsiZeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kflT5ruq0ACRusVnF0xunn+uyDgH0Aq0BVsR87SpDteBHbe7JkMhUNokOBCLYwedX
	 J7qi9dq6HunZuxV+A7zAEUnbSM2zbsicpSjQ/tiPR9U7eluLC+/DwQT7rMnd5M0Qi7
	 /Hnzle4ahj26zlSl5SQyog/2uBTHBCLDzTNeIzSg=
Date: Mon, 1 Sep 2025 16:34:56 +0200
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
Subject: Re: [PATCH v11 21/66] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <b2yrfklofl6qpoekmy3r745gk4fvgdlpcdppatwwr3y34kn5zv@xusoi3rasdrc>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-22-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-22-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:22PM +0300, Sakari Ailus wrote:
> Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
> flipping results in a change in the sensor's color pattern, separately
> horizontally and vertically. The information is essential for raw formats
> when using generic raw mbus codes.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
>  include/uapi/linux/v4l2-controls.h                     |  6 ++++++
>  3 files changed, 18 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 0fcd60d8c621..ef3784d1119a 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -133,3 +133,13 @@ Image Source Control IDs
>        - Raw Bayer, with alternating lines beginning with green, blue pixels and
>          red, green pixels.
>        - 3
> +
> +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``

I still believe that having this and V4L2_CTRL_FLAG_MODIFY_LAYOUT
might be confusing. Should sensor driver that registers H/VFLIP still
mark those controls as V4L2_CTRL_FLAG_MODIFY_LAYOUT or should they
implement V4L2_CID_COLOR_PATTERN_FLIP, or do both ?

Should we deprectate V4L2_CTRL_FLAG_MODIFY_LAYOUT for flip controls ?
In this case I think the documentation of the flag should be updated.

> +    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
> +    V4L2_CID_VFLIP) have an effect on the pixel order of the output color
> +    pattern. Macros ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> +    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If
> +    either horizontal or vertical bit is set, the readout pattern order is that
> +    of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both

I don't think

"the readout pattern order is that of the reversed readout." is very
clear.

Providing examples might be convenient

In libcamera we have:

 * Applying a transform to an image stored in a Bayer format affects the Bayer
 * order. For example, performing a horizontal flip on the Bayer pattern RGGB
 * causes the RG rows of pixels to become GR, and the GB rows to become BG. The
 * transformed image would have a GRBG order. Performing a vertical flip on the
 * Bayer pattern RGGB causes the GB rows to come before the RG ones and the
 * transformed image would have GBRG order. Applying both vertical and
 * horizontal flips on the Bayer patter RGGB results in transformed images with
 * BGGR order. The bit depth and modifiers are not affected.

Should we at least make a table for the most common Bayer CFA ?


> +    ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> +    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.

Personally I don't like V4L2_COLOR_PATTERN_FLIP_BOTH much, and would
prefer to have the two flags separate, but it might be just personal
tastes.

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
> index e552f6655fd0..eb9ffdd74d32 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1233,6 +1233,12 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_COLOR_PATTERN_BGGR			2U
>  #define V4L2_COLOR_PATTERN_GBRG			3U
>
> +#define V4L2_CID_COLOR_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
> +#define V4L2_COLOR_PATTERN_FLIP_HORIZONTAL	(1U << 0)
> +#define V4L2_COLOR_PATTERN_FLIP_VERTICAL	(1U << 1)
> +#define V4L2_COLOR_PATTERN_FLIP_BOTH \
> +	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
> +
>
>  /* Image processing controls */
>
> --
> 2.47.2
>
>

