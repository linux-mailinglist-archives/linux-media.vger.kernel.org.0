Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 118631686A
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 18:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfEGQyI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 12:54:08 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42483 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbfEGQyH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 12:54:07 -0400
Received: by mail-lj1-f196.google.com with SMTP id y10so8449095lji.9
        for <linux-media@vger.kernel.org>; Tue, 07 May 2019 09:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B6zYDfIbsh4fVsiu8ZkF/mnbm8ndRtPN2deL3LIfJ84=;
        b=EKcDa+QDVLkg6+3F8xbsv66Xjpqs7OCvn17LDo9ArsHIg8OaBH61OtNHdmo4oEUq5n
         ZwK1/9qEBuAd0IgekzYIK3To6Nzsd0YeQOP7JwPvcMYhjWGcFE6o0ORE/sI5twuTDy4T
         gUUgf+pxkfNjY0XhhVXhUlQ712ZFrn7yP8jrjpXunN1rMkY78mCOxdF6DbrTVbpIEsea
         Tq3vmVUjR7DDqWaAe0GaXrnlTxTKQmPJx7hit+oPKdybNnPwtNo5QS9GLvS0oXFFASeE
         fS2/5GIeEQ4IVQl813CT7q2XFlPxVtCT+mYkhINKA2uRoG4mtGsnIvFlVKBZ5CGXrKd5
         91KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B6zYDfIbsh4fVsiu8ZkF/mnbm8ndRtPN2deL3LIfJ84=;
        b=lhTafTeZnJMm/uSugL2ewXM7vHzIxVhleNZ1luZiH957VCL/UKaxcAtbVsBFpSoS2F
         CeDGhjvIz2vd31XS5uoyd8I7eldDaQxzPXny1/drNAqQJRJpfRxEAPSidxU54XJBSalQ
         QeJNh+6v2yWC5xPtYzH0lcwTMPaWDeOkDA09FQLbu2cs+pz4G4PARPmWpqNchzc4sS/x
         wfvpid4WAQ8fsLja8bMf/Pq9jDti6UICuqwKuk8DNH4f9Pm+nSmRzu5XTWEryAu8pIgE
         QEYDrckLzU/UBVKn3NgG4Xp7u14eR5PNQtvYFPbuzf0sW+Samwcelz2qxCgUKmh3cV6p
         V4pQ==
X-Gm-Message-State: APjAAAUKCXM4EbjxFYgMMr6ggkHD4+woLxSWwe4/3/P0xC90D6LGVTn6
        ZkM0j6BUboeTUMz29OI24j43/EuIHjI=
X-Google-Smtp-Source: APXvYqyhBj0Cyym7O8BCcezWKbBr4/wUsQ/rLaB9CojWM34lke/HKUoy6IgewO93/sjprcXXThVOXw==
X-Received: by 2002:a2e:86c5:: with SMTP id n5mr18423638ljj.184.1557248045227;
        Tue, 07 May 2019 09:54:05 -0700 (PDT)
Received: from [192.168.1.9] (hst-221-118.medicom.bg. [84.238.221.118])
        by smtp.googlemail.com with ESMTPSA id n10sm3877075ljh.36.2019.05.07.09.54.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 09:54:04 -0700 (PDT)
Subject: Re: [PATCH v2] media/doc: Allow sizeimage to be set by v4l clients
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190412155915.16849-1-stanimir.varbanov@linaro.org>
 <20190502095550.31282c0d@coco.lan>
 <ee78effa-f678-5d15-3802-bb787e7057e2@xs4all.nl>
 <20190502102956.70aed1c3@coco.lan>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <5a94d216-dc61-968e-2eda-8f460c42b4ca@linaro.org>
Date:   Tue, 7 May 2019 19:54:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502102956.70aed1c3@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for comments!

On 5/2/19 4:29 PM, Mauro Carvalho Chehab wrote:
> Em Thu, 2 May 2019 15:16:54 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> On 5/2/19 2:55 PM, Mauro Carvalho Chehab wrote:
>>> Em Fri, 12 Apr 2019 18:59:15 +0300
>>> Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:
>>>   
>>>> This changes v4l2_pix_format and v4l2_plane_pix_format sizeimage
>>>> field description to allow v4l clients to set bigger image size
>>>> in case of variable length compressed data.
>>>>
>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>> ---
>>>>  Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst | 13 ++++++++++++-
>>>>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst        | 11 ++++++++++-
>>>>  2 files changed, 22 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
>>>> index 5688c816e334..005428a8121e 100644
>>>> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
>>>> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
>>>> @@ -31,7 +31,18 @@ describing all planes of that format.
>>>>  
>>>>      * - __u32
>>>>        - ``sizeimage``
>>>> -      - Maximum size in bytes required for image data in this plane.
>>>> +      - Maximum size in bytes required for image data in this plane,
>>>> +	set by the driver. When the image consists of variable length
>>>> +	compressed data this is the number of bytes required by the
>>>> +	codec to support the worst-case compression scenario.
>>>> +
>>>> +	For uncompressed images the driver will set the value. For
>>>> +	variable length compressed data clients are allowed to set
>>>> +	the sizeimage field, but the driver may ignore it and set the
>>>> +	value itself, or it may modify the provided value based on
>>>> +	alignment requirements or minimum/maximum size requirements.
>>>> +	If the client wants to leave this to the driver, then it should
>>>> +	set sizeimage to 0.
>>>>      * - __u32
>>>>        - ``bytesperline``
>>>>        - Distance in bytes between the leftmost pixels in two adjacent
>>>> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
>>>> index 71eebfc6d853..0f7771151db9 100644
>>>> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
>>>> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
>>>> @@ -89,7 +89,16 @@ Single-planar format structure
>>>>        - Size in bytes of the buffer to hold a complete image, set by the
>>>>  	driver. Usually this is ``bytesperline`` times ``height``. When
>>>>  	the image consists of variable length compressed data this is the
>>>> -	maximum number of bytes required to hold an image.
>>>> +	number of bytes required by the codec to support the worst-case
>>>> +	compression scenario.
>>>> +
>>>> +	For uncompressed images the driver will set the value. For
>>>> +	variable length compressed data clients are allowed to set
>>>> +	the sizeimage field, but the driver may ignore it and set the
>>>> +	value itself, or it may modify the provided value based on
>>>> +	alignment requirements or minimum/maximum size requirements.
>>>> +	If the client wants to leave this to the driver, then it should
>>>> +	set sizeimage to 0.  
>>>
>>> It is very confusing to understand what you meant by the above paragraph,
>>> as you inverted the sentence order and forgot a comma.
>>>
>>> I would, instead, write the phrases using the direct order, and break
>>> into two paragraphs, e. g., changing the above to:
>>>
>>> 	"The driver will set the value for uncompressed images.
>>>
>>> 	Clients are allowed to set the sizeimage field for variable length
>>> 	compressed data, but the driver may ignore it and set the
>>> 	value itself, or it may modify the provided value based on
>>> 	alignment requirements or minimum/maximum size requirements.
>>> 	If the client wants to leave this to the driver, then it should
>>> 	set sizeimage to 0."
>>>
>>> That makes it a lot easier to read, hopefully preventing mistakes from
>>> app and driver developers when reading about sizeimage.
>>>
>>> Yet, I'm not too comfortable on letting this too generic. I mean,
>>> how an app writer would know what formats are "variable length
>>> compressed data", specially since libv4l may actually change that.  
>>
>> It's actually quite clearly defined: compressed formats set the
>> V4L2_FMT_FLAG_COMPRESSED flag in VIDIOC_ENUMFMT.
> 
> Ok, so let's be explicit here, e. g. something like:
> 
>  	"Clients are allowed to set the sizeimage field for variable length
>  	compressed data flagged with V4L2_FMT_FLAG_COMPRESSED at
> 	VIDIOC_ENUMFMT, but the driver may ignore it and set the
>  	value itself, or it may modify the provided value based on
>  	alignment requirements or minimum/maximum size requirements.
>  	If the client wants to leave this to the driver, then it should
>  	set sizeimage to 0."
> 
> That makes clear for app developers when they can use this new
> feature.

OK, I will resend with that description.

> 
> That still leads us to what happens at libv4l with sizeimage
> for a compressed format that got uncompressed by the library, in
> order to ensure that a change like this won't cause breakages at
> existing userspace apps.

libv4l can decompress formats like MJPEG, right? I mean it isn't to
decompress MPEG/H264 for example.

-- 
-- 
regards,
Stan
