Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4532D2DC6
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 16:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730007AbgLHPBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 10:01:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729949AbgLHPBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 10:01:31 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672ACC0611CB
        for <linux-media@vger.kernel.org>; Tue,  8 Dec 2020 07:00:32 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id lt17so25063928ejb.3
        for <linux-media@vger.kernel.org>; Tue, 08 Dec 2020 07:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EwLGS2M7y7kAQoWd9CP/FtUXOvPaPRZho3I3VBDdvSE=;
        b=mh4HWibLr/WMMNOUtj568Jf2f5UknXO+4WtgQnrWBt/nMR44C2d5d7/UyNG5IDZ/xM
         SF3OBmS9HyGRKgJpxN3Dxoz9PSPPAK4AwvbYsSB6L6ju4uj4kgzwByolft4z4Nl5RgIF
         wJFKIb46oEAJ9yL5nNtS/4zvxL4qfQWMs5IeSDxNyqKawyW7c1PRuuy6NmENffy1wBF9
         /vHk9c7ZxLV94bRpDGGW/m+uXHE6f2nsLmct1OsWGTjXdUcVav9QDLjdXvWWJRHmrZDO
         Sf8bRbFEo9TYtvDgpyO1JB8HtDRalk/d+fI+Pv7CsKqh4U/xREDDK7Bs7AsjcH4Hi2nF
         5eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EwLGS2M7y7kAQoWd9CP/FtUXOvPaPRZho3I3VBDdvSE=;
        b=QK/XI+pyIRZI25a1lDjCgk7LAiIo3cUO16er6ayP89WdTvD75wOr4eiwV6FinjRL03
         xCMdRJG8rMAY36vZHY9L7J4IfCRpw4a22L7H+Y2DpbNrYXkyEyhqLz3poA+2w/FqP6DD
         INu/TcSgV7ON1hhR5xVe69wwyK/R8UNVsgFxFOkyV3lilE5QLa5+iOOhIuPugi+Mf+SZ
         kf3i/hqEFG7xad6VMXfjLoOa0OI2qKOYOlWrwAOnOSU4hiJskSc/RlC04PtDcbmOWmhG
         QsLQR9bD9/2MR9kfoDukEh1bfM5SukIt1OObWk9awuPIhyRhiC/lrkEFlMj515HAdaEY
         PwFw==
X-Gm-Message-State: AOAM531ttHsEUzjHlVumm70Ahwpx1i297nUpXWqoVjHb361QU8DR9knW
        h2j7GCWLmWd67zVdonAch5OL9w==
X-Google-Smtp-Source: ABdhPJwak8sUz3xv3qH0vNk5T/u+IokUT+RE1bbpNw6/No1+dlQHNjDcl/oAuNU4+D+u2oAHmTQfzg==
X-Received: by 2002:a17:906:e18:: with SMTP id l24mr22630567eji.434.1607439630987;
        Tue, 08 Dec 2020 07:00:30 -0800 (PST)
Received: from [192.168.1.9] (hst-221-93.medicom.bg. [84.238.221.93])
        by smtp.googlemail.com with ESMTPSA id ot18sm15822687ejb.54.2020.12.08.07.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 07:00:30 -0800 (PST)
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
 <c0346859-91b2-90b9-16b6-f0c364351562@linaro.org>
 <3d6a99b2-5467-d6ce-f602-f81da615c912@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <2c5559f3-c88f-d2d0-b369-e2947564b3b6@linaro.org>
Date:   Tue, 8 Dec 2020 17:00:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3d6a99b2-5467-d6ce-f602-f81da615c912@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 12/7/20 11:21 AM, Hans Verkuil wrote:
> On 07/12/2020 10:06, Stanimir Varbanov wrote:
>>
>>
>> On 12/2/20 1:12 PM, Hans Verkuil wrote:
>>> On 24/11/2020 00:02, Stanimir Varbanov wrote:
>>>> Add Content light level and Mastering display colour volume v4l2
>>>> compounf controls, relevant payload structures and validation.
>>>
>>> compounf -> compound
>>>
>>>>
>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-ctrls.c | 62 ++++++++++++++++++++++++++++
>>>>  include/media/hdr10-ctrls.h          | 55 ++++++++++++++++++++++++
>>>>  include/media/v4l2-ctrls.h           |  3 ++
>>>>  3 files changed, 120 insertions(+)
>>>>  create mode 100644 include/media/hdr10-ctrls.h
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>> index ad47d00e28d6..028630576401 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>> @@ -1024,6 +1024,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>>>>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
>>>>  
>>>> +	case V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
>>>> +	case V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
>>>> +
>>>>  	/* CAMERA controls */
>>>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>>>>  	case V4L2_CID_CAMERA_CLASS:		return "Camera Controls";
>>>> @@ -1461,6 +1464,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
>>>>  		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
>>>>  		break;
>>>> +	case V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO:
>>>> +		*type = V4L2_CTRL_TYPE_HDR10_CLL_INFO;
>>>> +		break;
>>>> +	case V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY:
>>>> +		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>>>> +		break;
>>>>  	case V4L2_CID_UNIT_CELL_SIZE:
>>>>  		*type = V4L2_CTRL_TYPE_AREA;
>>>>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>> @@ -1775,6 +1784,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>>>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>>>>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>>>>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>>>> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>>>>  	struct v4l2_area *area;
>>>>  	void *p = ptr.p + idx * ctrl->elem_size;
>>>>  	unsigned int i;
>>>> @@ -1934,6 +1944,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>>>  		zero_padding(*p_hevc_slice_params);
>>>>  		break;
>>>>  
>>>> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>>> +		break;
>>>> +
>>>> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
>>>> +		p_hdr10_mastering = p;
>>>> +
>>>> +		for (i = 0; i < 3; ++i) {
>>>> +			if (p_hdr10_mastering->display_primaries_x[i] <
>>>> +				V4L2_HDR10_MASTERING_PRIMARIES_X_LOW ||
>>>> +			    p_hdr10_mastering->display_primaries_x[i] >
>>>> +				V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH ||
>>>> +			    p_hdr10_mastering->display_primaries_y[i] <
>>>> +				V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW ||
>>>> +			    p_hdr10_mastering->display_primaries_y[i] >
>>>> +				V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH)
>>>> +				return -EINVAL;
>>>> +		}
>>>> +
>>>> +		if (p_hdr10_mastering->white_point_x <
>>>> +			V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW ||
>>>> +		    p_hdr10_mastering->white_point_x >
>>>> +			V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH ||
>>>> +		    p_hdr10_mastering->white_point_y <
>>>> +			V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW ||
>>>> +		    p_hdr10_mastering->white_point_y >
>>>> +			V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH)
>>>> +			return -EINVAL;
>>>> +
>>>> +		if (p_hdr10_mastering->max_luminance <
>>>> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
>>>> +		    p_hdr10_mastering->max_luminance >
>>>> +			V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
>>>> +		    p_hdr10_mastering->min_luminance <
>>>> +			V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
>>>> +		    p_hdr10_mastering->min_luminance >
>>>> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
>>>> +			return -EINVAL;
>>>> +
>>>> +		if (p_hdr10_mastering->max_luminance ==
>>>> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW &&
>>>> +		    p_hdr10_mastering->min_luminance ==
>>>> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
>>>> +			return -EINVAL;
>>>> +
>>>> +		break;
>>>> +
>>>>  	case V4L2_CTRL_TYPE_AREA:
>>>>  		area = p;
>>>>  		if (!area->width || !area->height)
>>>> @@ -2626,6 +2682,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>>>  	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>>>>  		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
>>>>  		break;
>>>> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>>> +		elem_size = sizeof(struct v4l2_ctrl_hdr10_cll_info);
>>>> +		break;
>>>> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
>>>> +		elem_size = sizeof(struct v4l2_ctrl_hdr10_mastering_display);
>>>> +		break;
>>>>  	case V4L2_CTRL_TYPE_AREA:
>>>>  		elem_size = sizeof(struct v4l2_area);
>>>>  		break;
>>>> diff --git a/include/media/hdr10-ctrls.h b/include/media/hdr10-ctrls.h
>>>> new file mode 100644
>>>> index 000000000000..f6f77edc0b60
>>>> --- /dev/null
>>>> +++ b/include/media/hdr10-ctrls.h
>>>> @@ -0,0 +1,55 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * These are the HEVC state controls for use with stateless HEVC
>>>> + * codec drivers.
>>>> + *
>>>> + * It turns out that these structs are not stable yet and will undergo
>>>> + * more changes. So keep them private until they are stable and ready to
>>>> + * become part of the official public API.
>>>> + */
>>>> +
>>>> +#ifndef _HDR10_CTRLS_H_
>>>> +#define _HDR10_CTRLS_H_
>>>> +
>>>> +/*
>>>> + * Content light level information.
>>>> + * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.35
>>>> + */
>>>> +#define V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO	(V4L2_CID_MPEG_BASE + 1017)
>>>> +#define V4L2_CTRL_TYPE_HDR10_CLL_INFO		0x0123
>>>> +
>>>> +struct v4l2_ctrl_hdr10_cll_info {
>>>> +	__u16 max_content_light_level;
>>>> +	__u16 max_pic_average_light_level;
>>>> +};
>>>> +
>>>> +/*
>>>> + * Mastering display colour volume.
>>>> + * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.28
>>>> + */
>>>> +#define V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY (V4L2_CID_MPEG_BASE + 1018)
>>>
>>> I don't think this should be part of the codec control class. It is also needed
>>> for HDMI receivers, for example.
>>>
>>> I think it is better to create a new "Colorimetry" control class for controls like
>>> this.
>>
>> I guess in this case I need to create a new ext-ctrls-colorimetry.rst,
>> right?
> 
> Yes.
> 
>>
>>>
>>> But I advise that you wait until this PR is merged:
>>> https://patchwork.linuxtv.org/project/linux-media/patch/d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl/
>>>
>>> Note that you also need to add validation support for this to std_validate_compound()
>>> and possibly add initialization to std_init_compound() is v4l2-ctrls.c.
>>
>> The patch has validation for mastering display already. But I wonder do
>> we really need this validation because CTA-861-G is more liberal about
>> the values comparing with Rec. ITU-T H.265. Or the other option is to
>> combine both of them?
> 
> After thinking about this a bit more, validation makes no sense for decoders
> or HDMI/DP receivers: you have no control over the contents of this data in
> those cases, it should just contain what you receive as-is, and if you receive
> buggy data, then userspace has to decide what to do with that.
> 
> This is something that should be documented, I think. You have to be aware as
> userspace that the data needs to be checked for validity.
> 
> For encoders and HDMI/DP output validation would make sense, but I think that
> for now we should just drop validation altogether.

Well, my doubts expressed above wasn't do we need validation or not but
for the ranges of the parameters CTA-861-G vs Rec. ITU-T H.265.

In that regard I think it is better to have validation for encoders
because out of spec ranges could be dangerous for display panels.

> 
> Regards,
> 
> 	Hans
> 
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>> +#define V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	0x0124
>>>> +
>>>> +#define V4L2_HDR10_MASTERING_PRIMARIES_X_LOW	5
>>>> +#define V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH	37000
>>>> +#define V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW	5
>>>> +#define V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH	42000
>>>> +#define V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW	5
>>>> +#define V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH	37000
>>>> +#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW	5
>>>> +#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH	42000
>>>> +#define V4L2_HDR10_MASTERING_MAX_LUMA_LOW	50000
>>>> +#define V4L2_HDR10_MASTERING_MAX_LUMA_HIGH	100000000
>>>> +#define V4L2_HDR10_MASTERING_MIN_LUMA_LOW	1
>>>> +#define V4L2_HDR10_MASTERING_MIN_LUMA_HIGH	50000
>>>> +
>>>> +struct v4l2_ctrl_hdr10_mastering_display {
>>>> +	__u16 display_primaries_x[3];
>>>> +	__u16 display_primaries_y[3];
>>>> +	__u16 white_point_x;
>>>> +	__u16 white_point_y;
>>>> +	__u32 max_luminance;
>>>> +	__u32 min_luminance;
>>>> +};
>>>> +
>>>> +#endif
>>>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>>>> index 4fbace0fc7e5..81bd026fc1ea 100644
>>>> --- a/include/media/v4l2-ctrls.h
>>>> +++ b/include/media/v4l2-ctrls.h
>>>> @@ -19,6 +19,7 @@
>>>>   */
>>>>  #include <media/mpeg2-ctrls.h>
>>>>  #include <media/fwht-ctrls.h>
>>>> +#include <media/hdr10-ctrls.h>
>>>>  #include <media/h264-ctrls.h>
>>>>  #include <media/vp8-ctrls.h>
>>>>  #include <media/hevc-ctrls.h>
>>>> @@ -80,6 +81,8 @@ union v4l2_ctrl_ptr {
>>>>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>>>>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>>>>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>>>> +	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
>>>> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>>>>  	struct v4l2_area *p_area;
>>>>  	void *p;
>>>>  	const void *p_const;
>>>>
>>>
>>
> 

-- 
regards,
Stan
