Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA74344449
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 14:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbhCVM7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 08:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhCVM40 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 08:56:26 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4182FC061574
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 05:56:25 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id bf3so19213787edb.6
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zs+ZH9HXMqh8babYlbIqR838NjF1riAx4sjNseIdfRw=;
        b=x2vM4o/6Wsn/lSI0D6O95oh5osrTnZAFWch/RKQYjcEcMbGvRb6sl6JzQ+FX6nBR2T
         pwD1Vq/9wzTxLEa1u03ucukGMKAa1u4VmX9kUkRGL7i5L58Ahq33fR6f5QvAeizXzJgk
         6avDopOGNoPGpvr51XvV8pkzb383P5BHX/Z7xOUV0JdMMdoTSPGfLBvdIP6GB6j7cw/J
         q2lduXjS32g9R44Q6LkaXLTJBe0jO0Wegftyi2e+qoaL5/hAkHXtQq9XwE3PYvcYAXX5
         uIzMZ4+5DKGYEAIWsPUaG3Z7Szq57rq3FnQbkkGlgXaypfRHJWtsFrCprdFNeKIcitMN
         myjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zs+ZH9HXMqh8babYlbIqR838NjF1riAx4sjNseIdfRw=;
        b=PQEV9J77rTGOr0FEQB4PKZbhmi/2uqRHJwURsHa0NwYf7GO4YVdmXQ7JG4XhbIMIuZ
         mQU/TiaG7YK42fDY+KJWxQ7xrmPN1Aj+ZVz+a0KtI9dNS+sB2RZW8P55LJNG2fHl6XL4
         09CEF3I3Mn11TQtu0H/cIFZCRdg5HkINlxwvD5/B6cpNTGazmWMHtu5gqkg2/PICC/LJ
         yapyQ4Dy/yQ8P5jyufwNfU+mWhNU39UNncLzIXJL3ltR3XlyW00DOWAtACxN39axQehD
         5VugH4nOh7N0U7Nxk3eecEw9QofPf4dA3T64E0TBZhymYmq+B6dja/62NiL5DbZBqJi6
         7/hQ==
X-Gm-Message-State: AOAM532y7Wec1eFDvIEKNdX2tGmMc52PwzrufGUJEzjsXkWTbO24tGHR
        AvImaVb7zHGviV321utVSBbjSQ==
X-Google-Smtp-Source: ABdhPJx0f4ywhsWqQWmPcKkaeoHZsJanVj6wLKqLHWXx1SQoOjZVxgaafrESVD8ugBzylZ4RVVcgXg==
X-Received: by 2002:a05:6402:9:: with SMTP id d9mr25375592edu.67.1616417784029;
        Mon, 22 Mar 2021 05:56:24 -0700 (PDT)
Received: from [192.168.1.54] (hst-221-58.medicom.bg. [84.238.221.58])
        by smtp.googlemail.com with ESMTPSA id q19sm1849796ejy.50.2021.03.22.05.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 05:56:23 -0700 (PDT)
Subject: Re: [PATCH v5 3/5] v4l: Add HDR10 static metadata controls
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
 <20210209162425.3970393-4-stanimir.varbanov@linaro.org>
 <77ac3b63-9995-e08f-9e6e-7a7d75c64ec1@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <444bb318-169f-6d30-2b7c-31d19d98a548@linaro.org>
Date:   Mon, 22 Mar 2021 14:56:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <77ac3b63-9995-e08f-9e6e-7a7d75c64ec1@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 3/16/21 2:16 PM, Hans Verkuil wrote:
> On 09/02/2021 17:24, Stanimir Varbanov wrote:
>> Introduce Content light level and Mastering display colour
>> volume Colorimetry compound controls with relevant payload
>> structures and validation.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/v4l2-core/v4l2-ctrls.c | 67 ++++++++++++++++++++++++++++
>>  include/media/v4l2-ctrls.h           |  4 ++
>>  include/uapi/linux/v4l2-controls.h   | 31 +++++++++++++
>>  include/uapi/linux/videodev2.h       |  3 ++
>>  4 files changed, 105 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 335cf354f51b..8bd3cf0e1e4f 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -1205,6 +1205,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	/* Colorimetry controls */
>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>>  	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
>> +	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
>> +	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
>>  	default:
>>  		return NULL;
>>  	}
>> @@ -1491,6 +1493,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  		*type = V4L2_CTRL_TYPE_AREA;
>>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>  		break;
>> +	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:
>> +		*type = V4L2_CTRL_TYPE_HDR10_CLL_INFO;
>> +		break;
>> +	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>> +		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>> +		break;
>>  	default:
>>  		*type = V4L2_CTRL_TYPE_INTEGER;
>>  		break;
>> @@ -1786,6 +1794,12 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>>  	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>>  		pr_cont("FWHT_PARAMS");
>>  		break;
>> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>> +		pr_cont("HDR10_CLL_INFO");
>> +		break;
>> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
>> +		pr_cont("HDR10_MASTERING_DISPLAY");
>> +		break;
>>  	default:
>>  		pr_cont("unknown type %d", ctrl->type);
>>  		break;
>> @@ -1838,6 +1852,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>>  	struct v4l2_area *area;
>>  	void *p = ptr.p + idx * ctrl->elem_size;
>>  	unsigned int i;
>> @@ -2133,6 +2148,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
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
>> +		if (p_hdr10_mastering->max_display_mastering_luminance <
>> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
>> +		    p_hdr10_mastering->max_display_mastering_luminance >
>> +			V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
>> +		    p_hdr10_mastering->min_display_mastering_luminance <
>> +			V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
>> +		    p_hdr10_mastering->min_display_mastering_luminance >
>> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
>> +			return -EINVAL;
>> +
>> +		if (p_hdr10_mastering->max_display_mastering_luminance ==
>> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW &&
>> +		    p_hdr10_mastering->min_display_mastering_luminance ==
>> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
> 
> I had to think about this one :-)
> 
> Isn't it clearer to write:
> 
> 		if (p_hdr10_mastering->min_display_mastering_luminance >=
> 		    p_hdr10_mastering->max_display_mastering_luminance)
> 
> (even though it can't be >, but >= is probably more robust and future proof)
> 
> And is it indeed invalid if both are the same?

This what the ITU-T Rec. H.265 spec says:

"When max_display_mastering_luminance is equal to 50 000,
min_display_mastering_luminance shall not be equal to 50 000."


-- 
regards,
Stan
