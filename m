Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3002AD2B5
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 10:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729909AbgKJJnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 04:43:50 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56437 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727098AbgKJJnu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 04:43:50 -0500
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Nov 2020 04:43:47 EST
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id cQBjkko7yNanzcQBmk5E1g; Tue, 10 Nov 2020 10:43:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605001426; bh=MeSyd1KqKJIQE9jS4gEXULd/EYWz5zEO3mrs7cy4T+8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=k/whHSCZhLg30Yml6hdIf0pb5BmLuSGaGZr+7ic5z0HNOByZQgd/FJwJAXFvZ2f/7
         wDvpkN1dEQ7HzSwMKrePb7Pe/16TySQP8BJ+2HouxrOzLCnQSEv8vQjTmAup8OR3PR
         OoEvSaMykob8zOgn5x1bRKQwTtRz0/1r/c1Kth+skOswdlkqY4GmEJK9hbjhUJPpUZ
         J/hN+GA6PIQ+/qa1wMpXEqn28GXYhZURtjtktCR+T8HKRBZp9YpbG9AlKFp7thmlPR
         g/fI0fjFWgypJoH3QiUsVDATyBBu3TPAUNFZmljseteg/mT7jUqojVnkDhce3ebiq8
         jiklLDZ6M8ToA==
Subject: Re: [PATCH 1/3] v4l: Add HDR10 HEVC static metadata controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
 <20201109173153.23720-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <dc70bc75-62af-1bdb-1feb-bb58e6f1ff8c@xs4all.nl>
Date:   Tue, 10 Nov 2020 10:43:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109173153.23720-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLp3dgU2LB7drb9G6Q7yYxulK6Q5GZXqntaedYrCZ0GeaO3RCMeL6v9FNdGum47vYyI5N9l2XrswUNe2DywGe31HyucPbAjLCv9GP/mQRU/m5gFEdnV/
 mTc9AoH9+lVI/h6pEkogOVzRbTNKgdiM0zqtCuc+h6VO7R5u9WSCs6wdP2dQKGhm1KgPGJdW+hDa85QuF7LrZCCBMO0v1vvYGfX/RgLm3kX1CbEiECMYjU61
 XkBVBxRKiXyKb9OrE3Htd+dAfptVGYcATO69Qse+T6rMrTlMMq7iWL/3F7kqwZADwyLMgepVUyGWG/6Rj0xR1Dq0IOKjT94YoQVU+/2S0mzRES864qfE47fn
 sXyXnHrxTabjbvMzn2fqnP5I7512lVqGSgiaV+0hjgs//72PE/iD8mHREOL8d30F6g8GpNdr
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/11/2020 18:31, Stanimir Varbanov wrote:
> Add Content light level and Mastering display colour volume v4l2
> compounf controls, relevant payload structures and validation.

Typo: compounf -> compound

> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 61 ++++++++++++++++++++++++++++
>  include/media/hevc-ctrls.h           | 41 +++++++++++++++++++
>  include/media/v4l2-ctrls.h           |  2 +
>  3 files changed, 104 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index bd7f330c941c..f70eaa6a46df 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1023,6 +1023,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
> +	case V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO:			return "HEVC Content Light Info";
> +	case V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY:	return "HEVC Mastering Display";

Why is this split up in two controls? Can you have one, but not the other?

From what I can tell they are always combined (see CTA-861-G, SMPTE 2086).

Regards,

	Hans

>  
>  	/* CAMERA controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1461,6 +1463,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
>  		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO:
> +		*type = V4L2_CTRL_TYPE_HEVC_CLL_INFO;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY:
> +		*type = V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY;
> +		break;
>  	case V4L2_CID_UNIT_CELL_SIZE:
>  		*type = V4L2_CTRL_TYPE_AREA;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> @@ -1775,6 +1783,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hevc_mastering_display *p_hevc_mastering;
>  	struct v4l2_area *area;
>  	void *p = ptr.p + idx * ctrl->elem_size;
>  	unsigned int i;
> @@ -1934,6 +1943,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		zero_padding(*p_hevc_slice_params);
>  		break;
>  
> +	case V4L2_CTRL_TYPE_HEVC_CLL_INFO:
> +		break;
> +
> +	case V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY:
> +		p_hevc_mastering = p;
> +
> +		for (i = 0; i < 3; ++i) {
> +			if (p_hevc_mastering->display_primaries_x[i] <
> +				V4L2_HEVC_MASTERING_PRIMARIES_X_LOW ||
> +			    p_hevc_mastering->display_primaries_x[i] >
> +				V4L2_HEVC_MASTERING_PRIMARIES_X_HIGH ||
> +			    p_hevc_mastering->display_primaries_y[i] <
> +				V4L2_HEVC_MASTERING_PRIMARIES_Y_LOW ||
> +			    p_hevc_mastering->display_primaries_y[i] >
> +				V4L2_HEVC_MASTERING_PRIMARIES_Y_HIGH)
> +				return -EINVAL;
> +		}
> +
> +		if (p_hevc_mastering->white_point_x <
> +			V4L2_HEVC_MASTERING_WHITE_POINT_X_LOW ||
> +		    p_hevc_mastering->white_point_x >
> +			V4L2_HEVC_MASTERING_WHITE_POINT_X_HIGH ||
> +		    p_hevc_mastering->white_point_y <
> +			V4L2_HEVC_MASTERING_WHITE_POINT_Y_LOW ||
> +		    p_hevc_mastering->white_point_y >
> +			V4L2_HEVC_MASTERING_WHITE_POINT_Y_HIGH)
> +			return -EINVAL;
> +
> +		if (p_hevc_mastering->max_luminance <
> +			V4L2_HEVC_MASTERING_MAX_LUMA_LOW ||
> +		    p_hevc_mastering->max_luminance >
> +			V4L2_HEVC_MASTERING_MAX_LUMA_HIGH ||
> +		    p_hevc_mastering->min_luminance <
> +			V4L2_HEVC_MASTERING_MIN_LUMA_LOW ||
> +		    p_hevc_mastering->min_luminance >
> +			V4L2_HEVC_MASTERING_MIN_LUMA_HIGH)
> +			return -EINVAL;
> +
> +		if (p_hevc_mastering->max_luminance ==
> +			V4L2_HEVC_MASTERING_MAX_LUMA_LOW &&
> +		    p_hevc_mastering->min_luminance ==
> +			V4L2_HEVC_MASTERING_MIN_LUMA_HIGH)
> +			return -EINVAL;
> +
> +		break;
> +
>  	case V4L2_CTRL_TYPE_AREA:
>  		area = p;
>  		if (!area->width || !area->height)
> @@ -2626,6 +2681,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>  		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
>  		break;
> +	case V4L2_CTRL_TYPE_HEVC_CLL_INFO:
> +		elem_size = sizeof(struct v4l2_ctrl_hevc_cll_info);
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY:
> +		elem_size = sizeof(struct v4l2_ctrl_hevc_mastering_display);
> +		break;
>  	case V4L2_CTRL_TYPE_AREA:
>  		elem_size = sizeof(struct v4l2_area);
>  		break;
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index 1009cf0891cc..d254457d2846 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -209,4 +209,45 @@ struct v4l2_ctrl_hevc_slice_params {
>  	__u64	flags;
>  };
>  
> +/*
> + * Content light level information.
> + * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.35
> + */
> +#define V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO	(V4L2_CID_MPEG_BASE + 1017)
> +#define V4L2_CTRL_TYPE_HEVC_CLL_INFO		0x0123
> +
> +struct v4l2_ctrl_hevc_cll_info {
> +	__u16 max_content_light_level;
> +	__u16 max_pic_average_light_level;
> +};
> +
> +/*
> + * Mastering display colour volume.
> + * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.28
> + */
> +#define V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY (V4L2_CID_MPEG_BASE + 1018)
> +#define V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY	0x0124
> +
> +#define V4L2_HEVC_MASTERING_PRIMARIES_X_LOW	5
> +#define V4L2_HEVC_MASTERING_PRIMARIES_X_HIGH	37000
> +#define V4L2_HEVC_MASTERING_PRIMARIES_Y_LOW	5
> +#define V4L2_HEVC_MASTERING_PRIMARIES_Y_HIGH	42000
> +#define V4L2_HEVC_MASTERING_WHITE_POINT_X_LOW	5
> +#define V4L2_HEVC_MASTERING_WHITE_POINT_X_HIGH	37000
> +#define V4L2_HEVC_MASTERING_WHITE_POINT_Y_LOW	5
> +#define V4L2_HEVC_MASTERING_WHITE_POINT_Y_HIGH	42000
> +#define V4L2_HEVC_MASTERING_MAX_LUMA_LOW	50000
> +#define V4L2_HEVC_MASTERING_MAX_LUMA_HIGH	100000000
> +#define V4L2_HEVC_MASTERING_MIN_LUMA_LOW	1
> +#define V4L2_HEVC_MASTERING_MIN_LUMA_HIGH	50000
> +
> +struct v4l2_ctrl_hevc_mastering_display {
> +	__u16 display_primaries_x[3];
> +	__u16 display_primaries_y[3];
> +	__u16 white_point_x;
> +	__u16 white_point_y;
> +	__u32 max_luminance;
> +	__u32 min_luminance;
> +};
> +
>  #endif
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index cb25f345e9ad..6120e29945e1 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -80,6 +80,8 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hevc_cll_info *p_hevc_cll;
> +	struct v4l2_ctrl_hevc_mastering_display *p_hevc_mastering;
>  	struct v4l2_area *p_area;
>  	void *p;
>  	const void *p_const;
> 

