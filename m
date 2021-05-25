Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EBD38FBF0
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 09:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhEYHoD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 03:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbhEYHoC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 03:44:02 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF201C061574
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 00:42:32 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id f18so15600793ejq.10
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 00:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5kojNRTkJM0Iidaye2FhD+TiafPI3/iaR/OGMpQj/hU=;
        b=OQPY9l7I74iZ5U/s6wwAOFN/jUAKY050LoujmzJ1dw+Wy0sxW9wAshNHpCmjCXI2H1
         1J3U9dB9gYtD1AXhUK5UaulV9mtccIyq/pD3hq0XSZz9cMdtgoQUp9Qth/TFTRW9jjVE
         3DadpPoV+wkLg09ZfFmdbfAidzC8TNjzPu8q6GpP1zbRuV14b7fE+Wd+ZjLAmoeh1ZSn
         MLHMbrJW9+RcQ28KcmPHsoc62fzhhbaCTIwccxHEUznqxrQCrx9kzWGhNXb3Q0j19LT6
         xWCLkZ8yZNA4j98MoF3oj9Ib6URcKPjWj41iMTojYGWPWWwz+N1ecyNWaPrDXNHaHBJj
         99Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5kojNRTkJM0Iidaye2FhD+TiafPI3/iaR/OGMpQj/hU=;
        b=OB6Vew+i4sBoJ5o1nEkyYYyS9x+2pGhlRaQtXv47xJzXqc8m5MpGxccR0csslNLloG
         A/0NsdUin2LQvt9HD7MH+z4SQNR3V+KAI7vvy1CZnoWx0CUg4v7SGGIxpghoqsBamvZN
         r4jmTBeeUiULK66YFs31Kvg27niQHt1sidnvwE9iJ3z/r/dYt1m2/gKnmT+Lnoheje2t
         B41gJmSbzcYAlA+k5yx1f/9Svey0DHN+Z2ZzBfzPVrG0LK34WVGIcWS8yazOIg8dimth
         yxpttmNCXb54QGbN3JUw2fPaWcxxI5YFAr7OxZmnCi4mP6BbVRpubAynBPuwBP5uls63
         dGdQ==
X-Gm-Message-State: AOAM532PJat2ExpbUV50mSEI7wm1IAfuBUptQxbm1uxmo4pvt6AiiM5O
        8vdXb7Cmk344HDwWk4WZVHmDzdpYkXTYp26/
X-Google-Smtp-Source: ABdhPJwygnwtG22qLKjSh9l2jV/HkrIH8pisJsofcR1vJTKm/4wQDcOrfbfZInMYvtFUTIz1lPC5dw==
X-Received: by 2002:a17:906:11c8:: with SMTP id o8mr26921460eja.499.1621928551243;
        Tue, 25 May 2021 00:42:31 -0700 (PDT)
Received: from [192.168.1.12] ([84.238.208.204])
        by smtp.googlemail.com with ESMTPSA id ia23sm4593804ejc.70.2021.05.25.00.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 00:42:30 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [RFC/WIP 1/4] media: Add HEIC compressed pixel format
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
 <20210429132833.2802390-2-stanimir.varbanov@linaro.org>
 <f1ebf16082af8a540e34d834d33a1f48bc267e91.camel@ndufresne.ca>
Message-ID: <c1693dc3-4cfa-6a1a-1981-affd0ee4f3f3@linaro.org>
Date:   Tue, 25 May 2021 10:42:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f1ebf16082af8a540e34d834d33a1f48bc267e91.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/18/21 8:11 PM, Nicolas Dufresne wrote:
> Le jeudi 29 avril 2021 à 16:28 +0300, Stanimir Varbanov a écrit :
>> Add HEIC (High-Efficiency Image Container) pixel format. This an
>> image container which use HEVC codec to encoded images.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  .../userspace-api/media/v4l/pixfmt-compressed.rst    | 12 ++++++++++++
>>  drivers/media/v4l2-core/v4l2-ioctl.c                 |  1 +
>>  include/uapi/linux/videodev2.h                       |  1 +
>>  3 files changed, 14 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> index ba6c0c961204..246bff90dcac 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> @@ -186,6 +186,18 @@ Compressed Formats
>>  	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
>>  	then the decoder has no	requirements since it can parse all the
>>  	information from the raw bytestream.
>> +    * .. _V4L2-PIX-FMT-HEIC:
>> +
>> +      - ``V4L2_PIX_FMT_HEIC``
>> +      - 'HEIC'
>> +      - High Efficiency Image Container is an image container file format which
>> +        uses HEVC encoding and it is a variant of HEIF (High Efficiency Image File)
>> +        format.
> 
> Can you clarify, is it expected that an HEIF container be compatible or not ?
> Assuming this exist. The HEIC being a brand name, and not really a standard
> seems rather confusing. Is this is right name, or should you introduce HEIF with
> variant control, similar to HEVC profile control.


V4L2_PIX_FMT_HFIF_HEVC is a good option, I guess.

> 
> Speaking of profile, does it inherit anything from HEVC ? So we need to set HEVC
> pofile/level ? Is there some way's to affect the quality or is it the HEVC QP
> controls ?

V4L2_PIX_FMT_HFIF_HEVC will accept
V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE profile and the image
quality is set through V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY

> 
>>
>>
>> +	The decoder expects one Access Unit per buffer.
>> +	The encoder generates one Access Unit per buffer.
>> +	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
>> +	then the decoder has no	requirements since it can parse all the
>> +	information from the raw bytestream.
>>      * .. _V4L2-PIX-FMT-HEVC-SLICE:
>>  
>>        - ``V4L2_PIX_FMT_HEVC_SLICE``
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 31d1342e61e8..3a1b4c3a76c8 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1454,6 +1454,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
>>  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>>  		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
>> +		case V4L2_PIX_FMT_HEIC:		descr = "HEIC Image Format"; break;
>>  		default:
>>  			if (fmt->description[0])
>>  				return;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 79dbde3bcf8d..2153b5c31d46 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -699,6 +699,7 @@ struct v4l2_pix_format {
>>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
>>  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
>>  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>> +#define V4L2_PIX_FMT_HEIC	v4l2_fourcc('H', 'E', 'I', 'C') /* HEIC HEVC image format */
>>  
>>  /*  Vendor-specific formats   */
>>  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
> 
> 

-- 
regards,
Stan
