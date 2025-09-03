Return-Path: <linux-media+bounces-41714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD2CB42463
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A548D7B649B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74755313524;
	Wed,  3 Sep 2025 15:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jkli27YN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2FC3128C8
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 15:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911931; cv=none; b=cCsul1/jyzS/UskJYqmiUhSzfDK1r297TAvbmbqCQXnDz2+BlBZ+/c8MoJd+Ix1IknAmCVO7LYXhCJfxnkFSHbuekGlFg9d+mDPIRBgdPzp5RxE0ZoOEH3FtkgEawXUF0PQ/3C2tiY15QdO9CyCwR1uCsmLmjgPz9dLsC3JKKCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911931; c=relaxed/simple;
	bh=pUuc3cBgiMqIsUd5TVf5FcW7rvoTIhxiCIe5BnKqdQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocYj0Yp9rd2uWImC6vwxYDP9cHJODo3q0OJUWsWV5c43d9b0I0CQir50dQmdSgelexyv6IUqd/kvexdhyouRaknUR+92TcaL4FTw1wqGbLGdLdkvY1yrz2GSu81bq+yBceJ3Q9MZfofG1uTiLMloX4sTwyaKA8Qttlpx51tso+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jkli27YN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 02CB2C6D;
	Wed,  3 Sep 2025 17:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756911859;
	bh=pUuc3cBgiMqIsUd5TVf5FcW7rvoTIhxiCIe5BnKqdQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkli27YNACDBMJHe4F7LWswYe+tyX56AutwKXmZlNXvieW9IazFcWjcubKu6u5EPF
	 rMHCnpGxM8368hpF3w4LwZlcyJFXLMnDemueyMS4VUDqFuh1oWgHlTpS9E4ddgOGG1
	 WIyLpJkVwY8TYwRtbVLHeFP4VX+w0n3GP4dKiyxU=
Date: Wed, 3 Sep 2025 17:05:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 19/66] media: uapi: Add V4L2_CID_COLOR_PATTERN for
 describing color patterns
Message-ID: <20250903150507.GO3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-20-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-20-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Aug 25, 2025 at 12:50:20PM +0300, Sakari Ailus wrote:
> Add V4L2_CID_COLOR_PATTERN to tell the camera sensor's native color
> pattern.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/v4l/ext-ctrls-image-source.rst      | 39 +++++++++++++++++++
>  .../media/v4l/subdev-formats.rst              |  2 +
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
>  include/uapi/linux/v4l2-controls.h            |  6 +++
>  4 files changed, 48 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 71f23f131f97..b19aaaffbce0 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -92,3 +92,42 @@ Image Source Control IDs
>      representing a gain of exactly 1.0. For example, if this default value
>      is reported as being (say) 128, then a value of 192 would represent
>      a gain of exactly 1.5.
> +
> +``V4L2_CID_COLOR_PATTERN (integer)``
> +    This control determines the color components and native pixel order in the
> +    sensor's CFA (Color Filter Array) when used in conjunction with
> +    :ref:`generic raw mbus codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit
> +    depth) <v4l2-mbus-pixelcode-generic-raw>` pixelcodes. The native pixel
> +    order is constant for a given device, it is not affected by cropping or
> +    flipping.
> +
> +    This control may only be used on V4L2 sub-devices.
> +
> +    This is a read-only control.
> +
> +    Available patterns:
> +
> +.. flat-table:: V4L2 color patterns
> +    :header-rows:  1
> +    :stub-columns: 0
> +    :widths:       1 2 1
> +
> +    * - Macro name
> +      - Synopsis
> +      - Value
> +    * - V4L2_COLOR_PATTERN_GRBG
> +      - Raw Bayer, with alternating lines beginning with green, red pixels and
> +        blue, green pixels.

I know what you mean, but it's a bit vague. Let's try to be more
precise:

      - Bayer pattern with 2x2 macroblocks. Each macroblock stores pixels in
        green, red, blue, green order.

Or even more precise

      - Bayer pattern with 2x2 macroblocks. Each macroblock has a green filter
        in the top-left and bottom-right pixels, a red filter in the top-right
	pixel, and a blue filter in the bottom-left pixel.

> +      - 0
> +    * - V4L2_COLOR_PATTERN_RGGB
> +      - Raw Bayer, with alternating lines beginning with red, green pixels and
> +        green, blue pixels.
> +      - 1
> +    * - V4L2_COLOR_PATTERN_BGGR
> +      - Raw Bayer, with alternating lines beginning with blue, green pixels and
> +        green, red pixels.
> +      - 2
> +    * - V4L2_COLOR_PATTERN_GBRG
> +      - Raw Bayer, with alternating lines beginning with green, blue pixels and
> +        red, green pixels.
> +      - 3
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 1a51b5c817f1..e77b4ad19737 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3434,6 +3434,8 @@ organization is given as an example for the first pixel only.
>  
>      \endgroup
>  
> +.. _v4l2-mbus-pixelcode-generic-raw:
> +

I'd move this to the patch that adds the raw formats. No big deal
though.

>  Generic raw formats on serial interfaces
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index dd5f06546773..8119012c2638 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1155,6 +1155,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
>  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> +	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
>  

Shouldn't you also patch v4l2_ctrl_fill() ?

>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 3c0f6afe7500..e552f6655fd0 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1227,6 +1227,12 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
>  #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
>  
> +#define V4L2_CID_COLOR_PATTERN			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> +#define V4L2_COLOR_PATTERN_GRBG			0U
> +#define V4L2_COLOR_PATTERN_RGGB			1U
> +#define V4L2_COLOR_PATTERN_BGGR			2U
> +#define V4L2_COLOR_PATTERN_GBRG			3U

How about V4L2_CID_CFA_PATTERN and V4L2_CFA_PATTERN_* ?

> +
>  
>  /* Image processing controls */
>  

-- 
Regards,

Laurent Pinchart

