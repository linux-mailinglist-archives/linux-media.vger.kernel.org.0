Return-Path: <linux-media+bounces-19841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E79A3560
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 08:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA9E4B21D00
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 06:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CE6185B6F;
	Fri, 18 Oct 2024 06:27:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839E5168C3F;
	Fri, 18 Oct 2024 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729232873; cv=none; b=CPt87KLY+KMY2tKVvFgdH7v9KK1HXADaI+k+9Yr/b6F5YPmxo15bVdBRPjq63n8rxbWa8krbSGzsV1eUpEE4hzG2Nbhcfh5+lygxdZyGrDqiLd89R07NBGofdRm13C3BPe6jEe7HGO4+SeOaLt+NKj8z4cet2bnAtGLotCvSD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729232873; c=relaxed/simple;
	bh=3GSSLALAwUy7M5hozWs8dJRtWJVQG7LsIfxb144DR9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bHqNPABifjlS3bxgCzI/EtN16xK6W0hRnSqiFmmGWGnCmeP+i52liMFSNG8flVdHX4KgvOmO5mtvaqU4YPeVunkgiJvF7G7QEuPOow8YE28iPATKlQv2E0mr4/Byx5fsY92ds27iTzmL4XpFIy1YrJ/0cTw+d2MSYI6WkUa4syk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9600C4CEC3;
	Fri, 18 Oct 2024 06:27:49 +0000 (UTC)
Message-ID: <6bde2e39-b422-490f-b3b1-142a5671e770@xs4all.nl>
Date: Fri, 18 Oct 2024 08:27:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 5/6] media: v4l2-ctrls: Add video roi ctrls
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org
Cc: yunkec@google.com, nicolas@ndufresne.ca, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241018054448.3190423-1-ming.qian@nxp.com>
 <20241018054448.3190423-6-ming.qian@nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241018054448.3190423-6-ming.qian@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2024 07:44, Ming Qian wrote:
> Add some ctrls to support the video encoder ROI feature.
> Support 2 encoder ROI configurations that are rectangular region and
> QP map
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 73 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 29 ++++++++
>  include/uapi/linux/v4l2-controls.h            | 11 +++
>  3 files changed, 113 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 4a379bd9e3fb..6b972247778c 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1667,6 +1667,79 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      Codecs need to always use the specified range, rather then a HW custom range.
>      Applicable to encoders
>  
> +``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    (enum)
> +
> +enum v4l2_mpeg_video_roi_mode -
> +    Video roi mode. Possible values are:
> +
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
> +      - No ROI in the MPEG stream
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT``
> +      - Rectangle ROI mode
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``
> +      - Map ROI mode
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
> +    Select rectangular regions and specify the QP offset. The
> +    struct :c:type:`v4l2_ctrl_video_region_param` provides the
> +    rectangular region and the parameter to describe QP offset.
> +    The maximum number of rectangular regions depends on the
> +    hardware.  This control is a dynamically sized array. This
> +    control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT``. Applicable to
> +    encoders.
> +
> +.. c:type:: v4l2_ctrl_video_region_param
> +
> +.. raw:: latex
> +
> +    \small
> +
> +.. tabularcolumns:: |p{4.0cm}|p{4.0cm}|p{4.0cm}|
> +
> +.. flat-table:: struct v4l2_ctrl_video_region_param
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 1
> +
> +    * - struct :c:type:`v4l2_rect`
> +      - ``rect``
> +      - The rectangular region

What is the unit? I assume pixels. And inside what larger area is this
rectangle located? It probably needs to refer to one of the SEL_TGT targets as
described here:

https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/v4l2-selection-targets.html

> +    * - __s32
> +      - ``parameter``
> +      -

So what is the parameter? It has no description.

> +    * - __u32
> +      - ``reserved[2]``
> +      -

Add "Applications and drivers must set this to zero."

> +
> +.. raw:: latex
> +
> +    \normalsize
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MAP (integer)``
> +    Specifies the QP offset for each block. This control is a
> +    dynamically sized array. The array size can be calculated
> +    from video resolution and the roi map block size which can
> +    be got from ``V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE``. This
> +    control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``. Applicable to
> +    encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE (struct)``
> +    This control returns the roi block size in pixels. The struct
> +    :c:type:`v4l2_area` provides the width and height in separate
> +    fields. This control is applicable when
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
> +    ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``. This control depends on the
> +    encoding format. Applicable to encoders.
> +
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 1ea52011247a..54219a3b215a 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -612,6 +612,13 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		NULL,
>  	};
>  
> +	static const char * const mpeg_video_roi_mode[] = {
> +		"None",
> +		"Rectangle",
> +		"Map",
> +		NULL,
> +	};
> +
>  	switch (id) {
>  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
>  		return mpeg_audio_sampling_freq;
> @@ -750,6 +757,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return camera_orientation;
>  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
>  		return intra_refresh_period_type;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
> +		return mpeg_video_roi_mode;
>  	default:
>  		return NULL;
>  	}
> @@ -971,6 +980,10 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
>  	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
>  	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:			return "Video ROI Mode";
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT:			return "Video ROI Rectangle";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP:			return "Video ROI Map";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE:		return "Video ROI Map Block Size";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
>  
> @@ -1512,6 +1525,22 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
> +		*type = V4L2_CTRL_TYPE_MENU;
> +		*flags |= V4L2_CTRL_FLAG_UPDATE;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT:
> +		*type =	V4L2_CTRL_TYPE_REGION;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE:
> +		*type = V4L2_CTRL_TYPE_AREA;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
>  	case V4L2_CID_PIXEL_RATE:
>  		*type = V4L2_CTRL_TYPE_INTEGER64;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 974fd254e573..169a676fd64c 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -900,6 +900,17 @@ enum v4l2_mpeg_video_av1_level {
>  
>  #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>  
> +enum v4l2_mpeg_video_roi_mode {
> +	V4L2_MPEG_VIDEO_ROI_MODE_NONE,
> +	V4L2_MPEG_VIDEO_ROI_MODE_RECT,
> +	V4L2_MPEG_VIDEO_ROI_MODE_MAP
> +};
> +
> +#define V4L2_CID_MPEG_VIDEO_ROI_MODE		(V4L2_CID_CODEC_BASE + 658)
> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT		(V4L2_CID_CODEC_BASE + 659)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MAP		(V4L2_CID_CODEC_BASE + 660)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE	(V4L2_CID_CODEC_BASE + 661)
> +
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)


