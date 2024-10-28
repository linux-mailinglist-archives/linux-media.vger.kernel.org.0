Return-Path: <linux-media+bounces-20393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1B9B29B2
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 09:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 136EE1C21ACE
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 08:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779C11D8E1E;
	Mon, 28 Oct 2024 07:55:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA6E1D8E16;
	Mon, 28 Oct 2024 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102123; cv=none; b=nMEdICOA2R9HHd4Mz0oew6Kx0+jJLoZ8r0NGucE8ErZOeX4pHa5ytp7g8v2XPUCkTHw4LFF/UaP+RYZkI7jC8SVEAA8+lBwG5TAjKw5/MDe1iwwPkrUjbOIVhhNNLRtc0lbXK9z1ys07WqqB5oI8TMXJ0O7V1OqDT3OqlcdgwDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102123; c=relaxed/simple;
	bh=oHzDb5GlF3neFmxlMFihpK2dMHb+4FxmG/831aKSukM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tooix5zk/5vXGHAJPKoAoEA2x8bQagKvkO+37/EYJtOsDB6BlcMIakff8rYJFwjy3klbyHcuT09cN4Wb+hCKk6+GLVVvz+QG5X/emRl3YfzUwbp6pGt6pcSSvR0q5tfU8c3918GX6jvRBro6MRAEz1lIWVZLDpvzZHA5+DjkUFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B50C4CEC3;
	Mon, 28 Oct 2024 07:55:19 +0000 (UTC)
Message-ID: <17c06e51-ff5e-45f0-8292-14c77f6fd19c@xs4all.nl>
Date: Mon, 28 Oct 2024 08:55:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 4/4] media: v4l2-ctrls: Add video encoder ROI ctrls
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org
Cc: yunkec@google.com, nicolas@ndufresne.ca, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241022084040.3390878-1-ming.qian@nxp.com>
 <20241022084040.3390878-5-ming.qian@nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241022084040.3390878-5-ming.qian@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2024 10:40, Ming Qian wrote:
> Add some ctrls to support the video encoder region-of-interest(ROI)
> feature. The ROI QP Map and rectangular configuration are supported.
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 95 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 46 +++++++++
>  include/uapi/linux/v4l2-controls.h            | 16 ++++
>  3 files changed, 157 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 4a379bd9e3fb..7188d8212677 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1667,6 +1667,101 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      Codecs need to always use the specified range, rather then a HW custom range.
>      Applicable to encoders
>  
> +``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    (enum)
> +
> +enum v4l2_mpeg_video_roi_mode -
> +    Indicates Video Encoding region-of-interest (ROI) Mode.
> +    Possible values are:
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
> +      - No ROI in the MPEG stream
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``
> +      - Rectangle ROI mode and specifies ROI delta QP.
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``
> +      - Rectangle ROI mode and specifies ROI priority.
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP``
> +      - Map ROI mode and specifies ROI delta QP
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP``
> +      - Map ROI mode and specifies ROI absolute QP value

You need to extend these descriptions, it is really vague.

Also point to the controls that are involved: e.g. for _RECT_DELTA_QP
you need to provide V4L2_CID_MPEG_VIDEO_ROI_RECT + V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP.

> +
> +``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE (struct)``
> +    This control returns the ROI block size in pixels. The struct
> +    :c:type:`v4l2_area` provides the width and height in separate
> +    fields. The resolution of the frame will be rounded up to be
> +    aligned to this value when it's partitioned in blocks for QP
> +    maps and the number of QP values in those maps will be the
> +    number of blocks of these indicated pixel size that comprise
> +    a full frame. This control depends on the encoding format,
> +    and the detailed encoder hardware.
> +    Applicable to encoders.

You should mention that this is a read-only control.

> +
> +``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
> +    A struct :c:type:`v4l2_rect` provides the rectangular region
> +    described by the position of its top-left corner, the width
> +    and the height. The unit is in pixels. And it should be aligned
> +    to the ROI block size, which can be queried from
> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. X,Y gets rounded down,
> +    and width/height up. The maximum number of rectangular regions

So this rounding down/up happens if the rectangle is NOT aligned to
the ROI block size, right?

It is probably good to mention this:

"If it is not aligned to the ROI block size, then X, Y gets..."

> +    depends on the hardware. This control is a dynamically sized array.
> +    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP`` or
> +    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``. For overlapping
> +    regions, the value that is first in the ROI array will have priority.
> +    Applicable to encoders.
> +
> +``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP (integer)``
> +    Specifies the ROI delta QP of a rectangular region. The delta QP
> +    is the value that will be added on top of the frame level QP.
> +    It can be positive (more distortion) or negative (less distortion)
> +    values. This control is applicable when
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
> +    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``, and need to be used

need to -> must

> +    in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
> +    This control is a dynamically sized array, and the array size
> +    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.

What happens if it does not match the V4L2_CID_MPEG_VIDEO_ROI_RECT array size?

> +    Applicable to encoders.
> +
> +``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY (integer)``
> +    Specifies the ROI priority of a rectangular region. it can
> +    be positive (more important) or negative (less important)
> +    values and is compared with non-ROI region (taken as value 0).
> +    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``, and need

need to -> must

> +    to be used in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.

Add:

    This control is a dynamically sized array, and the array size
    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.

> +    Applicable to encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP (integer)``
> +    This is to configure ROI as a map as an integer array,

"configure ROI as a map as an integer array": not a very clear
description. I had to read this control description several times before
I understood what it does.

> +    each value represents the delta QP of a block region
> +    in raster scan order. The block size can be got from
> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
> +    dynamically sized array, the array size can be calculated
> +    from video resolution and the ROI block size, and the
> +    width and height should be rounded up to be aligned to

What happens if the array size is too small?

> +    the block size. This control is applicable when
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP``.
> +    Applicable to encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP (integer)``
> +    This is to configure ROI as a map as an integer array,
> +    each value represents the absolute QP of a block region
> +    in raster scan order. The block size can be got from
> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
> +    dynamically sized array, the array size can be calculated
> +    from video resolution and the ROI block size, and the
> +    width and height should be rounded up to be aligned to
> +    the block size. This control is applicable when
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP``.
> +    Applicable to encoders.
> +
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 1ea52011247a..4d89309bf8d0 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -612,6 +612,15 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		NULL,
>  	};
>  
> +	static const char * const mpeg_video_roi_mode[] = {
> +		"None",
> +		"Rectangle Delta QP",
> +		"Rectangle Priority",
> +		"Map Delta QP",
> +		"Map Absolute QP",
> +		NULL,
> +	};
> +
>  	switch (id) {
>  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
>  		return mpeg_audio_sampling_freq;
> @@ -750,6 +759,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return camera_orientation;
>  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
>  		return intra_refresh_period_type;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
> +		return mpeg_video_roi_mode;
>  	default:
>  		return NULL;
>  	}
> @@ -971,6 +982,13 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
>  	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
>  	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:		return "Video ROI Mode";
> +	case V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE:	return "Video ROI Block Size";
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT:		return "Video ROI Rectangle Region";
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP:	return "Video ROI Rectangle Delta QP";
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY:	return "Video ROI Rectangle Priority";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP:	return "Video ROI Delta QP Map";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP:	return "Video ROI Absolute QP Map";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
>  
> @@ -1512,6 +1530,34 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
> +		*type = V4L2_CTRL_TYPE_MENU;
> +		*flags |= V4L2_CTRL_FLAG_UPDATE;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE:
> +		*type = V4L2_CTRL_TYPE_AREA;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT:
> +		*type = V4L2_CTRL_TYPE_RECT;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
>  	case V4L2_CID_PIXEL_RATE:
>  		*type = V4L2_CTRL_TYPE_INTEGER64;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 974fd254e573..bf67d53af737 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -900,6 +900,22 @@ enum v4l2_mpeg_video_av1_level {
>  
>  #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>  
> +enum v4l2_mpeg_video_roi_mode {
> +	V4L2_MPEG_VIDEO_ROI_MODE_NONE,
> +	V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP,
> +	V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY,
> +	V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP,
> +	V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP
> +};
> +
> +#define V4L2_CID_MPEG_VIDEO_ROI_MODE			(V4L2_CID_CODEC_BASE + 658)
> +#define V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE		(V4L2_CID_CODEC_BASE + 659)
> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT			(V4L2_CID_CODEC_BASE + 660)
> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP		(V4L2_CID_CODEC_BASE + 661)
> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY		(V4L2_CID_CODEC_BASE + 662)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP		(V4L2_CID_CODEC_BASE + 663)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP		(V4L2_CID_CODEC_BASE + 664)
> +
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)

Regards,

	Hans

