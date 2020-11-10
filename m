Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1FF2AD338
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 11:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgKJKNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 05:13:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgKJKNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 05:13:12 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B480C0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 02:13:12 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c16so2432376wmd.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 02:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=81I9lvfrdyPbV0Zv1LF5At7fH+qtvyCe4iN6MGiOylA=;
        b=hl8b31BC5nqy/25RShPeBz1hnO+VADpNVy3T2GuMawHYaOeuvEYi5KLWfF1su1WU4A
         C7kWLrMDXugBUE/oIFdGkj8BUlxCEuFFz9bWEZwbhQXOHw/q1uS+zIlDlKdSxdBHa9x6
         ySvU9UURMoZ9yrIGgKt8vyDKWCGkptDqBGppy2bAyPEfZKplxU8VT4mC0VJkhwJD1vPy
         Zii8jj8br4cL5rBcK1YG4I+Lzh9ZSb6ICdpE44SHnulK95xVaqjBcB6LjL381Q/qke6/
         HMGd91IH3lytKdXZ4rS4EspG8zHOcMCmsAohE32QYE/jtetI6+n16jrxdGWJl0SfW9e4
         7Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=81I9lvfrdyPbV0Zv1LF5At7fH+qtvyCe4iN6MGiOylA=;
        b=oxdfGTB+C0T1QBUIvVTP55fbADiQuydjhGhfThS8tWBEARx/gVvWRcSrEcgKLyKuIT
         C21d5J4Sjsc7dWm31WIuP9Q+nplSfmZHr/zaa73QQbzrvpFT6AXwCUi6UiFsHGtUA0Bm
         PgyIDTGG6R2jrjqxK9h3W9Q30HpU4KXUp63GkzypMuPIWq6d9ugLslGakLc5jEKR371I
         SMlduNTYEitvTj2B5+HrVwfj6Xf/li0iwz8UCOXTty1YMNt5mjV8cxXmDz5ClFDd1Rna
         jawsM1NvSyC5CxyP+9lifwkKend22I1CsfQVzXoRzT+rz5SC1RT4DsofFF3Ssr90d7+Q
         p38w==
X-Gm-Message-State: AOAM533DqOm0YqRhQV0aGMJIfONf3MNWeOU619M1XAqS4glYLt6wUHmh
        Ixho7m5MDUsu7d5QV9lnVZvLLQ==
X-Google-Smtp-Source: ABdhPJxsb+fbImcS3cdrZSPiEPaZpjgLAXdCK2tJL/itsfTsc70k9Kq2nYXZhHhswKD8mFUpjpe4ng==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr3841043wml.174.1605003191052;
        Tue, 10 Nov 2020 02:13:11 -0800 (PST)
Received: from [192.168.0.4] (hst-221-71.medicom.bg. [84.238.221.71])
        by smtp.googlemail.com with ESMTPSA id g138sm2377956wme.39.2020.11.10.02.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 02:13:10 -0800 (PST)
Subject: Re: [PATCH 1/3] v4l: Add HDR10 HEVC static metadata controls
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
 <20201109173153.23720-2-stanimir.varbanov@linaro.org>
 <dc70bc75-62af-1bdb-1feb-bb58e6f1ff8c@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <ba370fa4-37ab-32c4-dfcc-c56a4be0cb3a@linaro.org>
Date:   Tue, 10 Nov 2020 12:13:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dc70bc75-62af-1bdb-1feb-bb58e6f1ff8c@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/10/20 11:43 AM, Hans Verkuil wrote:
> On 09/11/2020 18:31, Stanimir Varbanov wrote:
>> Add Content light level and Mastering display colour volume v4l2
>> compounf controls, relevant payload structures and validation.
> 
> Typo: compounf -> compound
> 
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/v4l2-core/v4l2-ctrls.c | 61 ++++++++++++++++++++++++++++
>>  include/media/hevc-ctrls.h           | 41 +++++++++++++++++++
>>  include/media/v4l2-ctrls.h           |  2 +
>>  3 files changed, 104 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index bd7f330c941c..f70eaa6a46df 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -1023,6 +1023,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO:			return "HEVC Content Light Info";
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY:	return "HEVC Mastering Display";
> 
> Why is this split up in two controls? Can you have one, but not the other?
> 
> From what I can tell they are always combined (see CTA-861-G, SMPTE 2086).

I split to two control IDs because in ITU-T Rec. H265 CLL and Mastering
Display colour volume are different SEI messages. I guessed that they
could exist in the bitstream independently, though I'm not sure about that.

I think, if we decide that hdr10-ctrls.h will be better place for these
controls we can combine CLL and Mastering display in one control -
V4L2_CID_MPEG_HDR10_STATIC_METADATA.
And later we could introduce V4L2_CID_MPEG_HDR10_DYNAMIC_METADATA for
hdr10+ (2094-40).

> 
> Regards,
> 
> 	Hans
> 
>>  
>>  	/* CAMERA controls */
>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>> @@ -1461,6 +1463,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
>>  		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
>>  		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO:
>> +		*type = V4L2_CTRL_TYPE_HEVC_CLL_INFO;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY:
>> +		*type = V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY;
>> +		break;
>>  	case V4L2_CID_UNIT_CELL_SIZE:
>>  		*type = V4L2_CTRL_TYPE_AREA;
>>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> @@ -1775,6 +1783,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>> +	struct v4l2_ctrl_hevc_mastering_display *p_hevc_mastering;
>>  	struct v4l2_area *area;
>>  	void *p = ptr.p + idx * ctrl->elem_size;
>>  	unsigned int i;
>> @@ -1934,6 +1943,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>  		zero_padding(*p_hevc_slice_params);
>>  		break;
>>  
>> +	case V4L2_CTRL_TYPE_HEVC_CLL_INFO:
>> +		break;
>> +
>> +	case V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY:
>> +		p_hevc_mastering = p;
>> +
>> +		for (i = 0; i < 3; ++i) {
>> +			if (p_hevc_mastering->display_primaries_x[i] <
>> +				V4L2_HEVC_MASTERING_PRIMARIES_X_LOW ||
>> +			    p_hevc_mastering->display_primaries_x[i] >
>> +				V4L2_HEVC_MASTERING_PRIMARIES_X_HIGH ||
>> +			    p_hevc_mastering->display_primaries_y[i] <
>> +				V4L2_HEVC_MASTERING_PRIMARIES_Y_LOW ||
>> +			    p_hevc_mastering->display_primaries_y[i] >
>> +				V4L2_HEVC_MASTERING_PRIMARIES_Y_HIGH)
>> +				return -EINVAL;
>> +		}
>> +
>> +		if (p_hevc_mastering->white_point_x <
>> +			V4L2_HEVC_MASTERING_WHITE_POINT_X_LOW ||
>> +		    p_hevc_mastering->white_point_x >
>> +			V4L2_HEVC_MASTERING_WHITE_POINT_X_HIGH ||
>> +		    p_hevc_mastering->white_point_y <
>> +			V4L2_HEVC_MASTERING_WHITE_POINT_Y_LOW ||
>> +		    p_hevc_mastering->white_point_y >
>> +			V4L2_HEVC_MASTERING_WHITE_POINT_Y_HIGH)
>> +			return -EINVAL;
>> +
>> +		if (p_hevc_mastering->max_luminance <
>> +			V4L2_HEVC_MASTERING_MAX_LUMA_LOW ||
>> +		    p_hevc_mastering->max_luminance >
>> +			V4L2_HEVC_MASTERING_MAX_LUMA_HIGH ||
>> +		    p_hevc_mastering->min_luminance <
>> +			V4L2_HEVC_MASTERING_MIN_LUMA_LOW ||
>> +		    p_hevc_mastering->min_luminance >
>> +			V4L2_HEVC_MASTERING_MIN_LUMA_HIGH)
>> +			return -EINVAL;
>> +
>> +		if (p_hevc_mastering->max_luminance ==
>> +			V4L2_HEVC_MASTERING_MAX_LUMA_LOW &&
>> +		    p_hevc_mastering->min_luminance ==
>> +			V4L2_HEVC_MASTERING_MIN_LUMA_HIGH)
>> +			return -EINVAL;
>> +
>> +		break;
>> +
>>  	case V4L2_CTRL_TYPE_AREA:
>>  		area = p;
>>  		if (!area->width || !area->height)
>> @@ -2626,6 +2681,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>  	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>>  		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
>>  		break;
>> +	case V4L2_CTRL_TYPE_HEVC_CLL_INFO:
>> +		elem_size = sizeof(struct v4l2_ctrl_hevc_cll_info);
>> +		break;
>> +	case V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY:
>> +		elem_size = sizeof(struct v4l2_ctrl_hevc_mastering_display);
>> +		break;
>>  	case V4L2_CTRL_TYPE_AREA:
>>  		elem_size = sizeof(struct v4l2_area);
>>  		break;
>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>> index 1009cf0891cc..d254457d2846 100644
>> --- a/include/media/hevc-ctrls.h
>> +++ b/include/media/hevc-ctrls.h
>> @@ -209,4 +209,45 @@ struct v4l2_ctrl_hevc_slice_params {
>>  	__u64	flags;
>>  };
>>  
>> +/*
>> + * Content light level information.
>> + * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.35
>> + */
>> +#define V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO	(V4L2_CID_MPEG_BASE + 1017)
>> +#define V4L2_CTRL_TYPE_HEVC_CLL_INFO		0x0123
>> +
>> +struct v4l2_ctrl_hevc_cll_info {
>> +	__u16 max_content_light_level;
>> +	__u16 max_pic_average_light_level;
>> +};
>> +
>> +/*
>> + * Mastering display colour volume.
>> + * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.28
>> + */
>> +#define V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY (V4L2_CID_MPEG_BASE + 1018)
>> +#define V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY	0x0124
>> +
>> +#define V4L2_HEVC_MASTERING_PRIMARIES_X_LOW	5
>> +#define V4L2_HEVC_MASTERING_PRIMARIES_X_HIGH	37000
>> +#define V4L2_HEVC_MASTERING_PRIMARIES_Y_LOW	5
>> +#define V4L2_HEVC_MASTERING_PRIMARIES_Y_HIGH	42000
>> +#define V4L2_HEVC_MASTERING_WHITE_POINT_X_LOW	5
>> +#define V4L2_HEVC_MASTERING_WHITE_POINT_X_HIGH	37000
>> +#define V4L2_HEVC_MASTERING_WHITE_POINT_Y_LOW	5
>> +#define V4L2_HEVC_MASTERING_WHITE_POINT_Y_HIGH	42000
>> +#define V4L2_HEVC_MASTERING_MAX_LUMA_LOW	50000
>> +#define V4L2_HEVC_MASTERING_MAX_LUMA_HIGH	100000000
>> +#define V4L2_HEVC_MASTERING_MIN_LUMA_LOW	1
>> +#define V4L2_HEVC_MASTERING_MIN_LUMA_HIGH	50000
>> +
>> +struct v4l2_ctrl_hevc_mastering_display {
>> +	__u16 display_primaries_x[3];
>> +	__u16 display_primaries_y[3];
>> +	__u16 white_point_x;
>> +	__u16 white_point_y;
>> +	__u32 max_luminance;
>> +	__u32 min_luminance;
>> +};
>> +
>>  #endif
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index cb25f345e9ad..6120e29945e1 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -80,6 +80,8 @@ union v4l2_ctrl_ptr {
>>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>> +	struct v4l2_ctrl_hevc_cll_info *p_hevc_cll;
>> +	struct v4l2_ctrl_hevc_mastering_display *p_hevc_mastering;
>>  	struct v4l2_area *p_area;
>>  	void *p;
>>  	const void *p_const;
>>
> 

-- 
regards,
Stan
