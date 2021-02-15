Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9949331B80A
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 12:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhBOLdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 06:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhBOLdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 06:33:09 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A74C061574
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 03:32:28 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id w1so10476228ejf.11
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 03:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=h0PbOw1QnykMU+cJkTod7obeXaHoBYiSFuCrLUWBeAA=;
        b=WlLw7XtuJt/3SCNQ9pkKVKhoKzyvOLEeV+Yy3uoDo3NxxdhYpvvGIKNQeswZHrzyEn
         uHjgcyIVO959TN+ssBwC2uA65KpHW5NQrYUAwWohdIXMBtQ6Wr8nJMuIfh485C6Dymtn
         8abZqXcW/iVeEM+6VHkSeCF8S6GFmOYJFq7CFgL5ObAog1dIz2ZT7FRiFOp3z4K1yqG6
         DKPF1g+7T44lPKaqkWrSaatCU7ifc5LL/VzrnrAsdGPSelIdHTDY26DOBDoRxEM+MbG5
         YBbqVVx68RIErlOxeBFOWMnJ1Ls8ks8XsjgvoBAK2LkzSKFQBNVYrarvko7tJupxQGHK
         5z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h0PbOw1QnykMU+cJkTod7obeXaHoBYiSFuCrLUWBeAA=;
        b=FQ+3IMQK21jnzgUMIV7vZws7gw0QUu0YLqFT3uGqESi41acCJiGzHqlXJVFsBntTaX
         qMFPj4MPInA/G2/jn+WbSzlO4m6QW6w0266oxHAuVUuKJLCRZQygOXia0RRiI2CkU/VC
         EgHjmjnZhCbq9H1Xgvn2FGv5Pm0XIT+Be6lq1UYlpoQ8MAmcWLv+HkEPtJzh2Q8fBdnS
         Flal0NNjwPRv6DlyFxO56iDay1ecgvpdikYrzXHrJ6rqRmxMDhEKIad0d+bYXV8/rXxS
         qrQic7OfAHpln0zoCyurWA6RnF7zFNG/hMw8ZFxe5W6klq4b0Tjrcpw1qVZa0P1e3aTC
         7mkQ==
X-Gm-Message-State: AOAM531nCQ8h/oztauNstyLr3JDSxltgKDwGxfGqKBvnuSC74kspWxL0
        oCn7NI/5jfj9s33253tTsaAcSw==
X-Google-Smtp-Source: ABdhPJzFhQfaXYc6TE/l49yGks3K1vhhPRxfgiYQKjBQRuW77bI+gETekoPft9m/iVmzf0P/Pq1ECQ==
X-Received: by 2002:a17:906:ccd6:: with SMTP id ot22mr1461681ejb.165.1613388746938;
        Mon, 15 Feb 2021 03:32:26 -0800 (PST)
Received: from [192.168.0.4] (hst-221-123.medicom.bg. [84.238.221.123])
        by smtp.googlemail.com with ESMTPSA id a15sm9663066edv.95.2021.02.15.03.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 03:32:26 -0800 (PST)
Subject: Re: [PATCH 1/2] v4l2-ctrl: Add decoder conceal color control
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
 <20210209094527.2173690-2-stanimir.varbanov@linaro.org>
 <cccae00e-e30e-6691-d954-27379a104115@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <489f1417-085d-4057-f2e8-1cc8db0ed161@linaro.org>
Date:   Mon, 15 Feb 2021 13:32:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cccae00e-e30e-6691-d954-27379a104115@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/9/21 1:05 PM, Hans Verkuil wrote:
> On 09/02/2021 10:45, Stanimir Varbanov wrote:
>> Add decoder v4l2 control to set conceal color.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  .../media/v4l/ext-ctrls-codec.rst             | 20 +++++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++++++
>>  include/uapi/linux/v4l2-controls.h            |  1 +
>>  3 files changed, 30 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 00944e97d638..994650052333 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -674,6 +674,26 @@ enum v4l2_mpeg_video_frame_skip_mode -
>>      is currently displayed (decoded). This value is reset to 0 whenever
>>      the decoder is started.
>>  
>> +``V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR (integer64)``
>> +    This control sets conceal color in YUV color space. It describes the
>> +    client preference of error conceal color in case of error where
>> +    reference frame is missing. The decoder would paint the reference
>> +    buffer with preferred color and use it for future decoding.
>> +    Applicable to decoders.
> 
> You should mention explicitly that this is using 16-bit color components
> and expects Limited Range.

I don't want to limit the client to Limited range only. I'll mention in
the description that both ranges are valid.

> 
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +
>> +    * - Bit 0:15
>> +      - Y luminance
>> +    * - Bit 16:31
>> +      - Cb chrominance
>> +    * - Bit 32:47
>> +      - Cr chrominance
>> +    * - Bit 48:63
>> +      - Must be zero
>> +
>>  ``V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE (boolean)``
>>      If enabled the decoder expects to receive a single slice per buffer,
>>      otherwise the decoder expects a single frame in per buffer.
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 016cf6204cbb..a3b9d28a00b7 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -945,6 +945,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
>>  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
>>  	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
>> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
>>  	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
>>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
>> @@ -1430,6 +1431,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  		*max = 0x7fffffffffffffffLL;
>>  		*step = 1;
>>  		break;
>> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
>> +		*type = V4L2_CTRL_TYPE_INTEGER64;
>> +		*min = 0;
>> +		/* default for 8bit black, luma is 16, chroma is 128 */
> 
> Since this is 16 bit the actual default luma value for black is 4096 and for chroma use
> 32768 (i.e. both values are times 256).

If we follow this for pixel format with 10bit per channel we have to
multiply by 64?

> 
>> +		*def = 0x8000800010LL;
>> +		*max = 0xffffffffffffLL;
>> +		*step = 1;
>> +		break;
>>  	case V4L2_CID_PIXEL_RATE:
>>  		*type = V4L2_CTRL_TYPE_INTEGER64;
>>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 039c0d7add1b..5e5a3068be2d 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -428,6 +428,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
>>  #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
>> +#define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+231)
>>  
>>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
>>
> 
> Regards,
> 
> 	Hans
> 

-- 
regards,
Stan
