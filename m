Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835F72CBB52
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 12:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbgLBLMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 06:12:55 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47877 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725885AbgLBLMz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 06:12:55 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kQ3LkDJpNN7XgkQ3PksccV; Wed, 02 Dec 2020 12:12:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606907531; bh=mKnJykdfJ9fVyVaxmBEJf57DbjlwINU3ARpiBnFa6nc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mo32Mvlvtdz0cMpfDzhvnphRynxxmY0h3N6HeJSFyXwVzbOMZhpDknUPd9Vidradu
         B/h3Vxyl/3LUEn2I7U0AR0y4jPYMD0v2/Y5zNsv9D5EgHjIKkO9Oq765DZYFZlQouv
         Twt2hIS9YpR7P2fGV5R4d1XJkH256aXZK7+scftJZ9hHsRcgI7LZmB/Dysx5KYdkI4
         KJ4kdhIL6p0HZ8PzIAbGh1NdjE3zKURfQz0an8/+e1iNCGp0dkQQsLEJ3msPvg1HRs
         VHiod3LvaVNOnf/KZBzb1qti7XIAr7U7Mod138k07kkzu4cad6ASE/r/E69ExieKkj
         cCt1kaSl4bcQw==
Subject: Re: [PATCH v2 1/3] v4l: Add HDR10 static metadata controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20201123230257.31690-1-stanimir.varbanov@linaro.org>
 <20201123230257.31690-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <17035750-c01e-1601-756b-6c2c87e6b828@xs4all.nl>
Date:   Wed, 2 Dec 2020 12:12:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201123230257.31690-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfN7Cfj+y/PgBr6dFSUVY0yocs6ChXS10Geb7uCETi+JEargNlnqGpc0g5LI4n5eMGtN1HBZtZQkRml/zQU0s+RQ/c5bZTwTHyztVDRyz+72bHULmfrDl
 nFR3qDrNVvZkJmr4SeD/v88NlW5kGaeYkfOjK/3r44rpn57hmir3reMzxeJ3jIvfzQDslIWMo4KzkSuqed+MBFeuyNLgYS1Ac0qRw7rF0bJgf6+XJNYYevB0
 GNS+EBQPfCZcTBsZ7fzjgm7vrdzAr3qkGgE9XW3593u9DH7jGZ+6EjV+eH813Bjl+SgjvFyiZR3lQdzyk9p76LT4VjWrPFtiUNnyJMu7f8hQOUx0Dzhys+Fj
 cOG5d6WayQgUgPIBc0eVEP6jEQbH2JajMZEwgUkIqOnxS5furIhs7yhZmV67BiJ2FhYWi3G9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/11/2020 00:02, Stanimir Varbanov wrote:
> Add Content light level and Mastering display colour volume v4l2
> compounf controls, relevant payload structures and validation.

compounf -> compound

> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 62 ++++++++++++++++++++++++++++
>  include/media/hdr10-ctrls.h          | 55 ++++++++++++++++++++++++
>  include/media/v4l2-ctrls.h           |  3 ++
>  3 files changed, 120 insertions(+)
>  create mode 100644 include/media/hdr10-ctrls.h
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index ad47d00e28d6..028630576401 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1024,6 +1024,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
>  
> +	case V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
> +	case V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
> +
>  	/* CAMERA controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>  	case V4L2_CID_CAMERA_CLASS:		return "Camera Controls";
> @@ -1461,6 +1464,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
>  		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO:
> +		*type = V4L2_CTRL_TYPE_HDR10_CLL_INFO;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY:
> +		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> +		break;
>  	case V4L2_CID_UNIT_CELL_SIZE:
>  		*type = V4L2_CTRL_TYPE_AREA;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> @@ -1775,6 +1784,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *area;
>  	void *p = ptr.p + idx * ctrl->elem_size;
>  	unsigned int i;
> @@ -1934,6 +1944,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		zero_padding(*p_hevc_slice_params);
>  		break;
>  
> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> +		break;
> +
> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
> +		p_hdr10_mastering = p;
> +
> +		for (i = 0; i < 3; ++i) {
> +			if (p_hdr10_mastering->display_primaries_x[i] <
> +				V4L2_HDR10_MASTERING_PRIMARIES_X_LOW ||
> +			    p_hdr10_mastering->display_primaries_x[i] >
> +				V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH ||
> +			    p_hdr10_mastering->display_primaries_y[i] <
> +				V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW ||
> +			    p_hdr10_mastering->display_primaries_y[i] >
> +				V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH)
> +				return -EINVAL;
> +		}
> +
> +		if (p_hdr10_mastering->white_point_x <
> +			V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW ||
> +		    p_hdr10_mastering->white_point_x >
> +			V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH ||
> +		    p_hdr10_mastering->white_point_y <
> +			V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW ||
> +		    p_hdr10_mastering->white_point_y >
> +			V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH)
> +			return -EINVAL;
> +
> +		if (p_hdr10_mastering->max_luminance <
> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
> +		    p_hdr10_mastering->max_luminance >
> +			V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
> +		    p_hdr10_mastering->min_luminance <
> +			V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
> +		    p_hdr10_mastering->min_luminance >
> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
> +			return -EINVAL;
> +
> +		if (p_hdr10_mastering->max_luminance ==
> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW &&
> +		    p_hdr10_mastering->min_luminance ==
> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
> +			return -EINVAL;
> +
> +		break;
> +
>  	case V4L2_CTRL_TYPE_AREA:
>  		area = p;
>  		if (!area->width || !area->height)
> @@ -2626,6 +2682,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>  		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
>  		break;
> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> +		elem_size = sizeof(struct v4l2_ctrl_hdr10_cll_info);
> +		break;
> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
> +		elem_size = sizeof(struct v4l2_ctrl_hdr10_mastering_display);
> +		break;
>  	case V4L2_CTRL_TYPE_AREA:
>  		elem_size = sizeof(struct v4l2_area);
>  		break;
> diff --git a/include/media/hdr10-ctrls.h b/include/media/hdr10-ctrls.h
> new file mode 100644
> index 000000000000..f6f77edc0b60
> --- /dev/null
> +++ b/include/media/hdr10-ctrls.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * These are the HEVC state controls for use with stateless HEVC
> + * codec drivers.
> + *
> + * It turns out that these structs are not stable yet and will undergo
> + * more changes. So keep them private until they are stable and ready to
> + * become part of the official public API.
> + */
> +
> +#ifndef _HDR10_CTRLS_H_
> +#define _HDR10_CTRLS_H_
> +
> +/*
> + * Content light level information.
> + * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.35
> + */
> +#define V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO	(V4L2_CID_MPEG_BASE + 1017)
> +#define V4L2_CTRL_TYPE_HDR10_CLL_INFO		0x0123
> +
> +struct v4l2_ctrl_hdr10_cll_info {
> +	__u16 max_content_light_level;
> +	__u16 max_pic_average_light_level;
> +};
> +
> +/*
> + * Mastering display colour volume.
> + * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.28
> + */
> +#define V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY (V4L2_CID_MPEG_BASE + 1018)

I don't think this should be part of the codec control class. It is also needed
for HDMI receivers, for example.

I think it is better to create a new "Colorimetry" control class for controls like
this.

But I advise that you wait until this PR is merged:
https://patchwork.linuxtv.org/project/linux-media/patch/d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl/

Note that you also need to add validation support for this to std_validate_compound()
and possibly add initialization to std_init_compound() is v4l2-ctrls.c.

Regards,

	Hans

> +#define V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	0x0124
> +
> +#define V4L2_HDR10_MASTERING_PRIMARIES_X_LOW	5
> +#define V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH	37000
> +#define V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW	5
> +#define V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH	42000
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW	5
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH	37000
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW	5
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH	42000
> +#define V4L2_HDR10_MASTERING_MAX_LUMA_LOW	50000
> +#define V4L2_HDR10_MASTERING_MAX_LUMA_HIGH	100000000
> +#define V4L2_HDR10_MASTERING_MIN_LUMA_LOW	1
> +#define V4L2_HDR10_MASTERING_MIN_LUMA_HIGH	50000
> +
> +struct v4l2_ctrl_hdr10_mastering_display {
> +	__u16 display_primaries_x[3];
> +	__u16 display_primaries_y[3];
> +	__u16 white_point_x;
> +	__u16 white_point_y;
> +	__u32 max_luminance;
> +	__u32 min_luminance;
> +};
> +
> +#endif
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 4fbace0fc7e5..81bd026fc1ea 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -19,6 +19,7 @@
>   */
>  #include <media/mpeg2-ctrls.h>
>  #include <media/fwht-ctrls.h>
> +#include <media/hdr10-ctrls.h>
>  #include <media/h264-ctrls.h>
>  #include <media/vp8-ctrls.h>
>  #include <media/hevc-ctrls.h>
> @@ -80,6 +81,8 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *p_area;
>  	void *p;
>  	const void *p_const;
> 

