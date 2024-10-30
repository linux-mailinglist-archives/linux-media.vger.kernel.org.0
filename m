Return-Path: <linux-media+bounces-20562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D16BA9B5CFD
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 08:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60DF51F22D51
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 07:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B142B1DF993;
	Wed, 30 Oct 2024 07:32:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D24D1C4608;
	Wed, 30 Oct 2024 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730273574; cv=none; b=I22XJLN3JOU+hJqXHT9uJpNGaQFauEdkVUn7QA7U07ReOpNyQd5ExtuO91QItFUAKRuVWx2d9rs8LgU2QqJphDWaeDtK+TjBV2CcYMtNUgl+gGhJm/GHKBrRjoo5v4IBDuuPdjk8jk6sbF2U7jcsmrkD5nXSOMM6EWWBfzhWPfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730273574; c=relaxed/simple;
	bh=GZGAlyOcQLZE+o9mgrXfkdG5uAj1m3DKoFhanKqiEUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uL16rAngJXDkh7T2b/sOJrat0JUAx5bOxwK8jUgmpuHc5rEq+ss5rElsy1w0p+KX0EulWaOOsslZBatIgHjZ+n+KPr2zfN14/5MT97relrEqzK+Y+fVbfOrvkk+1ZtgORZzsurbL4HJHsC3C8Vq4L+7S5vP4W5o1LUY7/L130vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A5FC4CEE6;
	Wed, 30 Oct 2024 07:32:50 +0000 (UTC)
Message-ID: <6b38f07f-f992-4b25-af09-4e106e875994@xs4all.nl>
Date: Wed, 30 Oct 2024 08:32:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 4/4] media: v4l2-ctrls: Add video encoder ROI ctrls
To: ming.qian@oss.nxp.com, mchehab@kernel.org
Cc: yunkec@google.com, nicolas@ndufresne.ca, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
 <20241030022134.1098589-5-ming.qian@oss.nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241030022134.1098589-5-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ming Qian,

Thank you for this, these descriptions are much better!

I still have a few comments, though. See below.

On 30/10/2024 03:21, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@nxp.com>
> 
> Add some ctrls to support the video encoder region-of-interest(ROI)
> feature. The ROI QP Map and rectangular configuration are supported.
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 131 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 ++++++
>  include/uapi/linux/v4l2-controls.h            |  16 +++
>  3 files changed, 193 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 4a379bd9e3fb..7b4327c4a14e 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1667,6 +1667,137 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      Codecs need to always use the specified range, rather then a HW custom range.
>      Applicable to encoders
>  
> +``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    (enum)
> +
> +enum v4l2_mpeg_video_roi_mode -
> +    Indicates Video Encoding region-of-interest (ROI) Mode, enable different
> +    encoding strategies based on selected areas within a frame. Choosing a
> +    specific mode activates corresponding control or combinations of controls
> +    to configure the ROI, e.g. for rectangle delta QP mode, you need to provide
> +    V4L2_CID_MPEG_VIDEO_ROI_RECT and V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP.
> +    Applicable to encoders.
> +
> +    Possible values are:
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
> +      - No ROI in the MPEG stream. Default mode.
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``
> +      - Rectangle ROI mode and specifies ROI delta QP.
> +        When enabled, define one or more rectangular ROI areas
> +        where QP delta is applied. The control
> +        V4L2_CID_MPEG_VIDEO_ROI_RECT is used to set ROI areas
> +        and V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP is used to
> +        set QP delta value.
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``
> +      - Rectangle ROI mode and specifies ROI priority.
> +        When enabled, define one or more rectangular ROI areas
> +        where priority is applied. The control
> +        V4L2_CID_MPEG_VIDEO_ROI_RECT is used to set ROI areas
> +        and V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY is used to
> +        set priority.
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP``
> +      - Map ROI mode and specifies ROI delta QP.
> +        When enabled, the whole frame is configured into a grid map
> +        according to the ROI block region size in raster scan order,
> +        and each region can have a QP delta applied.
> +        The control V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP
> +        is used to configure the ROI Map with QP delta values.
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP``
> +      - Map ROI mode and specifies ROI absolute QP value.
> +        When enabled, configure a grid ROI map where each region
> +        has an absolute QP value assigned. The control
> +        V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP is used to
> +        configure the ROI Map with absolute QP values.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE (struct)``
> +    This read-only control returns the ROI block size in pixels. The struct
> +    :c:type:`v4l2_area` provides the width and height in separate
> +    fields. The resolution of the frame will be rounded up to be
> +    aligned to this value when it's partitioned in blocks for QP
> +    maps and the number of QP values in those maps will be the
> +    number of blocks of these indicated pixel size that comprise
> +    a full frame. This control depends on the encoding format,
> +    and the detailed encoder hardware.
> +    Applicable to encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
> +    A struct :c:type:`v4l2_rect` provides the rectangular region
> +    described by the position of its top-left corner, the width
> +    and the height. The unit is in pixels. And it should be aligned
> +    to the ROI block size, which can be queried from
> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. If it is not aligned to
> +    the ROI block size, then X,Y gets rounded down, and width/height up.
> +    The maximum number of rectangular regions depends on the hardware.

What happens with rectangles that are completely outside the frame?
I assume those will be ignored?

> +    This control is a dynamically sized array.
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
> +    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``, and must be used
> +    in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
> +    This control is a dynamically sized array, and the array size
> +    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``. If not match,
> +    the number of configured regions is the minimum value.

I'd rephrase this:

"If the array sizes do not match, then use the smallest size for
both controls and ignore the remaining elements in the larger array."

> +    Applicable to encoders.
> +
> +``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY (integer)``
> +    Specifies the ROI priority of a rectangular region. it can
> +    be positive (more important) or negative (less important)
> +    values and is compared with non-ROI region (taken as value 0).
> +    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``, and must
> +    be used in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
> +    This control is a dynamically sized array, and the array size
> +    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``. If not match,
> +    the number of configured regions is the minimum value.

Same here.

> +    Applicable to encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP (integer)``
> +    Configure a frame-wide grid map that divides the entire
> +    frame into blocks of the ROI block size, where each
> +    region will have a QP delta applied. The ROI map is
> +    arranged in raster scan order, and it's configured
> +    as an integer array. The block size can be got from
> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
> +    dynamically sized array, the array size can be calculated
> +    from video resolution and the ROI block size, and the
> +    width and height should be rounded up to be aligned to
> +    the block size. This control is applicable when
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP``.
> +    If the array size is too small, the control should
> +    return error. Applicable to encoders.

"If the array size is too small, the control should return error."

That doesn't really work. You can set the control, then change the
video format causing the control array size to be too small, but
that won't return an error.

I think you should either ignore the control completely in case
of a mismatch, or assume that the remainder of the grid map will
use a delta QP of 0. The latter would be my preference.

> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP (integer)``
> +    Configure a frame-wide grid map that divides the entire
> +    frame into blocks of the ROI block size, where each
> +    region will have an absolute QP applied. The ROI map is
> +    arranged in raster scan order, and it's configured
> +    as an integer array. The block size can be got from
> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
> +    dynamically sized array, the array size can be calculated
> +    from video resolution and the ROI block size, and the
> +    width and height should be rounded up to be aligned to
> +    the block size. This control is applicable when
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP``.
> +    If the array size is too small, the control should
> +    return error. Applicable to encoders.

You have the same problem here. Except that you can't use a QP
value of 0 if the array is too short, but you can probably substitute
the value from one of the existing codec-specific QP controls.

If that doesn't work, then ignoring arrays that are too short
is probably the better approach.

Regards,

	Hans

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


