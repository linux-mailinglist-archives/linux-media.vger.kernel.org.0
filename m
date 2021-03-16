Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D175733D3A8
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 13:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhCPMRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 08:17:17 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34861 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229814AbhCPMQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 08:16:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M8col1m4V4ywlM8crlArzu; Tue, 16 Mar 2021 13:16:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615897001; bh=eiXJFgGD4s5e7ZImPMrJsDKWM7SFFLr7+jdAldxt3Q8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Y5jo7RtNw/DWhwRI0/uc9948mpsnFYzJFscPag7W+q7WTnCyYLYrTkuw9+y65dJIS
         tf6Y4IvOrcupXLWxdgoW9Ma6O9v2PB0p9DWQXYonlIvUAHtEogziniEb/OIOpa5VmQ
         4c6Syjv/7EYZiqN8WwGGdNuEyHZOUGHe6czsvvDjeV1TxBdqrB6uxWsWCAw8k4NGTY
         xgHqihCVYpYWvquyQKVfmuA34y+fYb5K6gTQMSaWWAJPsSQsJbQGyr4h6vGr7hQhEg
         Hb0XRQhG7A00HzN/3KvYF/UKWkYjKBm8QosoVxRaF/OOBwDc76xt8c8vpougaiWwm8
         oOs+C1HnQjqKQ==
Subject: Re: [PATCH v5 3/5] v4l: Add HDR10 static metadata controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
 <20210209162425.3970393-4-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <77ac3b63-9995-e08f-9e6e-7a7d75c64ec1@xs4all.nl>
Date:   Tue, 16 Mar 2021 13:16:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209162425.3970393-4-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPkEmDrYY1btQh32QiFMEBw1wgdZisM6jhQEIM9LbPojV2mG6E8ICG4PreqszKgA1tL6v453KthXrzCdyION+k6b5mx/da1s9F/TeNz1+TZJ476dIAHn
 fsVoDNNVmaCWHlDhRZsABFg2iX8vBTfTf/XLhANnVYbqlXIWZa81CICFjzjgdaaLt3330TgUYlDr3EEyyMmhS3M+jO9vS9lfN3PtjGYJR78srPlCOsxrl+tD
 CgO7R2hBKBoYxx/4uMBAXkdG3F7peMzT8HU37ul/7aJtMYfnHoki7KF/nP26s3A8fuRt3dO35wZ2WMCnF7gYrWujHX1QYF22wgxqfc0AvvMqf/dxoZHWXH7P
 KBleS/88dMJKmWi3IlQ5X5e/30tL4SynbXrO+tHjFMX8YT+2nSC4vxVH9osPLGphK9tdG9OX
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/02/2021 17:24, Stanimir Varbanov wrote:
> Introduce Content light level and Mastering display colour
> volume Colorimetry compound controls with relevant payload
> structures and validation.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 67 ++++++++++++++++++++++++++++
>  include/media/v4l2-ctrls.h           |  4 ++
>  include/uapi/linux/v4l2-controls.h   | 31 +++++++++++++
>  include/uapi/linux/videodev2.h       |  3 ++
>  4 files changed, 105 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 335cf354f51b..8bd3cf0e1e4f 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1205,6 +1205,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	/* Colorimetry controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>  	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
> +	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
> +	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
>  	default:
>  		return NULL;
>  	}
> @@ -1491,6 +1493,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*type = V4L2_CTRL_TYPE_AREA;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		break;
> +	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:
> +		*type = V4L2_CTRL_TYPE_HDR10_CLL_INFO;
> +		break;
> +	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> +		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> @@ -1786,6 +1794,12 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>  		pr_cont("FWHT_PARAMS");
>  		break;
> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> +		pr_cont("HDR10_CLL_INFO");
> +		break;
> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
> +		pr_cont("HDR10_MASTERING_DISPLAY");
> +		break;
>  	default:
>  		pr_cont("unknown type %d", ctrl->type);
>  		break;
> @@ -1838,6 +1852,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *area;
>  	void *p = ptr.p + idx * ctrl->elem_size;
>  	unsigned int i;
> @@ -2133,6 +2148,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
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
> +		if (p_hdr10_mastering->max_display_mastering_luminance <
> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
> +		    p_hdr10_mastering->max_display_mastering_luminance >
> +			V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
> +		    p_hdr10_mastering->min_display_mastering_luminance <
> +			V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
> +		    p_hdr10_mastering->min_display_mastering_luminance >
> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
> +			return -EINVAL;
> +
> +		if (p_hdr10_mastering->max_display_mastering_luminance ==
> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW &&
> +		    p_hdr10_mastering->min_display_mastering_luminance ==
> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)

I had to think about this one :-)

Isn't it clearer to write:

		if (p_hdr10_mastering->min_display_mastering_luminance >=
		    p_hdr10_mastering->max_display_mastering_luminance)

(even though it can't be >, but >= is probably more robust and future proof)

And is it indeed invalid if both are the same?

> +			return -EINVAL;
> +
> +		break;
> +
>  	case V4L2_CTRL_TYPE_AREA:
>  		area = p;
>  		if (!area->width || !area->height)
> @@ -2826,6 +2887,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 167ca8c8424f..9c3ddbf3d099 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -54,6 +54,8 @@ struct video_device;
>   * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
>   * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
>   * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
> + * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
> + * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
>   * @p_area:			Pointer to an area.
>   * @p:				Pointer to a compound value.
>   * @p_const:			Pointer to a constant compound value.
> @@ -78,6 +80,8 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *p_area;
>  	void *p;
>  	const void *p_const;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a41039559193..349e86b18af7 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1661,6 +1661,37 @@ struct v4l2_ctrl_fwht_params {
>  #define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
>  #define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
>  
> +#define V4L2_CID_COLORIMETRY_HDR10_CLL_INFO	(V4L2_CID_COLORIMETRY_CLASS_BASE + 0)
> +
> +struct v4l2_ctrl_hdr10_cll_info {
> +	__u16 max_content_light_level;
> +	__u16 max_pic_average_light_level;
> +};
> +
> +#define V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY	(V4L2_CID_COLORIMETRY_CLASS_BASE + 1)
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
> +	__u32 max_display_mastering_luminance;
> +	__u32 min_display_mastering_luminance;
> +};
> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 79dbde3bcf8d..f5f971407b66 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1784,6 +1784,9 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
>  	V4L2_CTRL_TYPE_AREA          = 0x0106,
>  
> +	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
> +	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
> +
>  	V4L2_CTRL_TYPE_H264_SPS             = 0x0200,
>  	V4L2_CTRL_TYPE_H264_PPS		    = 0x0201,
>  	V4L2_CTRL_TYPE_H264_SCALING_MATRIX  = 0x0202,
> 

Regards,

	Hans
