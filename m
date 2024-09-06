Return-Path: <linux-media+bounces-17727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBF196E96B
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 07:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238E71F21275
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 05:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986C2130A47;
	Fri,  6 Sep 2024 05:44:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0193EA71;
	Fri,  6 Sep 2024 05:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725601449; cv=none; b=DT4Iyh42LV4/7u7O70q03NNLDkiRONbNM/v3gjBLns+nevtykhsvAxt4X7pjZBCcdXCxMqn8D0H3S/+8nJzChvDXPy6JErUCc6FebjuDX8YX8WETjW7izM+H4Siy9YZl/KWT1PB3iDfFEPB2fwM9fxkOrCuHQe/7DGqsaAJN+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725601449; c=relaxed/simple;
	bh=x0sTSRSJwVt/NcZ9e2iIEEOQ3sDAj1QcUi0CZsId3LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krUwX0j3tsJNX0nTM99CS5SozH5BGKuwOWYBP7uzKMOdhGfCG9pYpkHG6SYD06CXGAFerhFPWilaw9GNnFovg5jMqLYaf24c6ZubA8Kasz0FAJj8EM1BoegzDwFQYqgVkMZgLEWXr/XgkiRt08a0+hfJ0M78PJiF6Zycq+XW06c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C2EC4CEC4;
	Fri,  6 Sep 2024 05:44:06 +0000 (UTC)
Message-ID: <3690e2f3-17e7-4758-a3c9-05320cc92f1d@xs4all.nl>
Date: Fri, 6 Sep 2024 07:44:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC v2 8/9] media: v4l: ctrls: Add a control for
 companding
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
 <20240905225308.11267-9-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240905225308.11267-9-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/2024 00:53, Laurent Pinchart wrote:
> Companding refers to compression and expansion of pixel data to fit in a
> smaller range. The control is named V4L2_CID_COMPANDING, and only
> supports compression initially.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Rename V4L2_COMPANDING_ALAW to V4L2_COMPANDING_COMPRESS
> - Document V4L2_COMPANDING_LINEAR and V4L2_COMPANDING_COMPRESS
> ---
>  .../media/v4l/ext-ctrls-image-process.rst        | 16 ++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  9 +++++++++
>  include/uapi/linux/v4l2-controls.h               |  5 +++++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index b1c2ab2854af..d529b0a8cd41 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -55,3 +55,19 @@ Image Process Control IDs
>      control value divided by e.g. 0x100, meaning that to get no
>      digital gain the control value needs to be 0x100. The no-gain
>      configuration is also typically the default.
> +
> +``V4L2_CID_COMPANDING (menu)``
> +    Companding refers to compression and expansion of pixel data to fit in a
> +    smaller range.
> +
> +
> +.. tabularcolumns:: |p{5.7cm}|p{11.8cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_COMPANDING_LINEAR``
> +      - No companding.
> +    * - ``V4L2_COMPANDING_COMPRESS``

It's weird that this is called 'COMPRESS',

> +      - Compress the data using a device-specific curve.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 1ea52011247a..841e415a88ae 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -611,6 +611,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"Cyclic",
>  		NULL,
>  	};
> +	static const char * const companding[] = {
> +		"Linear",
> +		"A-Law",

but it is called 'A-Law' here. I think the same name should be used for both
as this is confusing.

Regards,

	Hans

> +		NULL
> +	};
>  
>  	switch (id) {
>  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
> @@ -750,6 +755,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return camera_orientation;
>  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
>  		return intra_refresh_period_type;
> +	case V4L2_CID_COMPANDING:
> +		return companding;
>  	default:
>  		return NULL;
>  	}
> @@ -1164,6 +1171,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
>  	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
>  	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
> +	case V4L2_CID_COMPANDING:		return "Companding";
>  
>  	/* DV controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1421,6 +1429,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_CAMERA_ORIENTATION:
>  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
>  	case V4L2_CID_HDR_SENSOR_MODE:
> +	case V4L2_CID_COMPANDING:
>  		*type = V4L2_CTRL_TYPE_MENU;
>  		break;
>  	case V4L2_CID_LINK_FREQ:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 974fd254e573..ca9e25f72886 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1225,6 +1225,11 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
>  #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
>  #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
> +#define V4L2_CID_COMPANDING			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
> +enum v4l2_companding {
> +	V4L2_COMPANDING_LINEAR		= 0,
> +	V4L2_COMPANDING_COMPRESS	= 1,
> +};
>  
>  /*  DV-class control IDs defined by V4L2 */
>  #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)


