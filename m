Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64482D0CA2
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 10:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgLGJHN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 04:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgLGJHM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 04:07:12 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9449CC0613D3
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 01:06:35 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id g185so12917183wmf.3
        for <linux-media@vger.kernel.org>; Mon, 07 Dec 2020 01:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QjxDW2drtGiPZSkPSVEeerKiZkSzCtUcHw8vu7Bw0GQ=;
        b=xrZY5ZLgMpunieRnA2RuUoGzUxAJmIF+az8XAF86NbzKXL0ZnHErUKcr4zgJBCP3S1
         9Fg92hNQsPwhh2SmIVOPSP5k+qDAH8AbAtzVVDpN2sVdJCT7XVnDIXhQu7IHkyzSqGJC
         1aEanLUsG6DkR/mTrTVKdV3+cHNuYsmJzZts6qv84WVxp856g0kQErnfuC/L341GrsQz
         Cess4c3QxczikoqUQy3pr/ADERQfTNJn9L5kIqJURzX5KKQRs9lfUoFAX3YaPrdxJZ2N
         HP0dXU8w9o1KCJ/ihjZvMDNO0507xrmqfGej4rHEeB+UJE3IHBZ7De92Hfl/o/9m2MYU
         wB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QjxDW2drtGiPZSkPSVEeerKiZkSzCtUcHw8vu7Bw0GQ=;
        b=OPhMV1Ls645gvrPTd31vV2jF6H7/28XcLnxBuA6Ar31+meeMYR8ku8VfO1m3ij3cK5
         8t6jfouxohpvWZJ5054AmLf7mukCNcRzVWXwDhG2+RUYBn8zd40L2hD7FFThPWZarGQ2
         miF4WH0GBms9Q8HKsIRR7LVZ+T+z0hzNfMulFfURPQulFO7N3CsfzxDMkvlNxFZqsT7N
         K4J9sY31BHku3644lLZiJnRdS18RztV00MYhCVzXHYQz5RQKRyEoGCR07Tv04uDHkot3
         cBpNvn3EPi8mvPQDZn/hkDNLjH2ZBjViumbtVypfUYPJX5jqDovANCLK6ucCelpXC4W5
         Bi8Q==
X-Gm-Message-State: AOAM530wRsJteMt1SclbVAeLbUjAZO6ihapUskKiaBq9z7Z4FhLJA0qZ
        YzuoLcGycboUEQfSgZ8LvK+EAw==
X-Google-Smtp-Source: ABdhPJyDwFXiJ9eLgCiqwKy+Q8kcZpDo54W7x5DIT4GqeWajdD3VhI+ZGc6tPZIkxLN3QFREAxOjEA==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr2161434wma.9.1607331993523;
        Mon, 07 Dec 2020 01:06:33 -0800 (PST)
Received: from [192.168.1.9] (hst-221-6.medicom.bg. [84.238.221.6])
        by smtp.googlemail.com with ESMTPSA id n189sm13279173wmf.20.2020.12.07.01.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 01:06:32 -0800 (PST)
Subject: Re: [PATCH v2 1/3] v4l: Add HDR10 static metadata controls
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20201123230257.31690-1-stanimir.varbanov@linaro.org>
 <20201123230257.31690-2-stanimir.varbanov@linaro.org>
 <17035750-c01e-1601-756b-6c2c87e6b828@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c0346859-91b2-90b9-16b6-f0c364351562@linaro.org>
Date:   Mon, 7 Dec 2020 11:06:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <17035750-c01e-1601-756b-6c2c87e6b828@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/2/20 1:12 PM, Hans Verkuil wrote:
> On 24/11/2020 00:02, Stanimir Varbanov wrote:
>> Add Content light level and Mastering display colour volume v4l2
>> compounf controls, relevant payload structures and validation.
> 
> compounf -> compound
> 
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/v4l2-core/v4l2-ctrls.c | 62 ++++++++++++++++++++++++++++
>>  include/media/hdr10-ctrls.h          | 55 ++++++++++++++++++++++++
>>  include/media/v4l2-ctrls.h           |  3 ++
>>  3 files changed, 120 insertions(+)
>>  create mode 100644 include/media/hdr10-ctrls.h
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index ad47d00e28d6..028630576401 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -1024,6 +1024,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
>>  
>> +	case V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
>> +	case V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
>> +
>>  	/* CAMERA controls */
>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>>  	case V4L2_CID_CAMERA_CLASS:		return "Camera Controls";
>> @@ -1461,6 +1464,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
>>  		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
>>  		break;
>> +	case V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO:
>> +		*type = V4L2_CTRL_TYPE_HDR10_CLL_INFO;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY:
>> +		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>> +		break;
>>  	case V4L2_CID_UNIT_CELL_SIZE:
>>  		*type = V4L2_CTRL_TYPE_AREA;
>>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> @@ -1775,6 +1784,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>>  	struct v4l2_area *area;
>>  	void *p = ptr.p + idx * ctrl->elem_size;
>>  	unsigned int i;
>> @@ -1934,6 +1944,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>  		zero_padding(*p_hevc_slice_params);
>>  		break;
>>  
>> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>> +		break;
>> +
>> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
>> +		p_hdr10_mastering = p;
>> +
>> +		for (i = 0; i < 3; ++i) {
>> +			if (p_hdr10_mastering->display_primaries_x[i] <
>> +				V4L2_HDR10_MASTERING_PRIMARIES_X_LOW ||
>> +			    p_hdr10_mastering->display_primaries_x[i] >
>> +				V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH ||
>> +			    p_hdr10_mastering->display_primaries_y[i] <
>> +				V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW ||
>> +			    p_hdr10_mastering->display_primaries_y[i] >
>> +				V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH)
>> +				return -EINVAL;
>> +		}
>> +
>> +		if (p_hdr10_mastering->white_point_x <
>> +			V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW ||
>> +		    p_hdr10_mastering->white_point_x >
>> +			V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH ||
>> +		    p_hdr10_mastering->white_point_y <
>> +			V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW ||
>> +		    p_hdr10_mastering->white_point_y >
>> +			V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH)
>> +			return -EINVAL;
>> +
>> +		if (p_hdr10_mastering->max_luminance <
>> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
>> +		    p_hdr10_mastering->max_luminance >
>> +			V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
>> +		    p_hdr10_mastering->min_luminance <
>> +			V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
>> +		    p_hdr10_mastering->min_luminance >
>> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
>> +			return -EINVAL;
>> +
>> +		if (p_hdr10_mastering->max_luminance ==
>> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW &&
>> +		    p_hdr10_mastering->min_luminance ==
>> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
>> +			return -EINVAL;
>> +
>> +		break;
>> +
>>  	case V4L2_CTRL_TYPE_AREA:
>>  		area = p;
>>  		if (!area->width || !area->height)
>> @@ -2626,6 +2682,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>  	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>>  		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
>>  		break;
>> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>> +		elem_size = sizeof(struct v4l2_ctrl_hdr10_cll_info);
>> +		break;
>> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
>> +		elem_size = sizeof(struct v4l2_ctrl_hdr10_mastering_display);
>> +		break;
>>  	case V4L2_CTRL_TYPE_AREA:
>>  		elem_size = sizeof(struct v4l2_area);
>>  		break;
>> diff --git a/include/media/hdr10-ctrls.h b/include/media/hdr10-ctrls.h
>> new file mode 100644
>> index 000000000000..f6f77edc0b60
>> --- /dev/null
>> +++ b/include/media/hdr10-ctrls.h
>> @@ -0,0 +1,55 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * These are the HEVC state controls for use with stateless HEVC
>> + * codec drivers.
>> + *
>> + * It turns out that these structs are not stable yet and will undergo
>> + * more changes. So keep them private until they are stable and ready to
>> + * become part of the official public API.
>> + */
>> +
>> +#ifndef _HDR10_CTRLS_H_
>> +#define _HDR10_CTRLS_H_
>> +
>> +/*
>> + * Content light level information.
>> + * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.35
>> + */
>> +#define V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO	(V4L2_CID_MPEG_BASE + 1017)
>> +#define V4L2_CTRL_TYPE_HDR10_CLL_INFO		0x0123
>> +
>> +struct v4l2_ctrl_hdr10_cll_info {
>> +	__u16 max_content_light_level;
>> +	__u16 max_pic_average_light_level;
>> +};
>> +
>> +/*
>> + * Mastering display colour volume.
>> + * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.28
>> + */
>> +#define V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY (V4L2_CID_MPEG_BASE + 1018)
> 
> I don't think this should be part of the codec control class. It is also needed
> for HDMI receivers, for example.
> 
> I think it is better to create a new "Colorimetry" control class for controls like
> this.

I guess in this case I need to create a new ext-ctrls-colorimetry.rst,
right?

> 
> But I advise that you wait until this PR is merged:
> https://patchwork.linuxtv.org/project/linux-media/patch/d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl/
> 
> Note that you also need to add validation support for this to std_validate_compound()
> and possibly add initialization to std_init_compound() is v4l2-ctrls.c.

The patch has validation for mastering display already. But I wonder do
we really need this validation because CTA-861-G is more liberal about
the values comparing with Rec. ITU-T H.265. Or the other option is to
combine both of them?

> 
> Regards,
> 
> 	Hans
> 
>> +#define V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	0x0124
>> +
>> +#define V4L2_HDR10_MASTERING_PRIMARIES_X_LOW	5
>> +#define V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH	37000
>> +#define V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW	5
>> +#define V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH	42000
>> +#define V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW	5
>> +#define V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH	37000
>> +#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW	5
>> +#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH	42000
>> +#define V4L2_HDR10_MASTERING_MAX_LUMA_LOW	50000
>> +#define V4L2_HDR10_MASTERING_MAX_LUMA_HIGH	100000000
>> +#define V4L2_HDR10_MASTERING_MIN_LUMA_LOW	1
>> +#define V4L2_HDR10_MASTERING_MIN_LUMA_HIGH	50000
>> +
>> +struct v4l2_ctrl_hdr10_mastering_display {
>> +	__u16 display_primaries_x[3];
>> +	__u16 display_primaries_y[3];
>> +	__u16 white_point_x;
>> +	__u16 white_point_y;
>> +	__u32 max_luminance;
>> +	__u32 min_luminance;
>> +};
>> +
>> +#endif
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 4fbace0fc7e5..81bd026fc1ea 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -19,6 +19,7 @@
>>   */
>>  #include <media/mpeg2-ctrls.h>
>>  #include <media/fwht-ctrls.h>
>> +#include <media/hdr10-ctrls.h>
>>  #include <media/h264-ctrls.h>
>>  #include <media/vp8-ctrls.h>
>>  #include <media/hevc-ctrls.h>
>> @@ -80,6 +81,8 @@ union v4l2_ctrl_ptr {
>>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>> +	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
>> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>>  	struct v4l2_area *p_area;
>>  	void *p;
>>  	const void *p_const;
>>
> 

-- 
regards,
Stan
