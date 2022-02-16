Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 206914B8BD1
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 15:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235222AbiBPOxN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 09:53:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbiBPOxM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 09:53:12 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE711F5CB8
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 06:52:58 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id bg21-20020a05600c3c9500b0035283e7a012so1820891wmb.0
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 06:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/6Uq/Ixg1AERSvnJhMiDe0T9+SVuHJc1uoRjbp9pvos=;
        b=HaJnbrYQsRJOys0TZgfEaWlYL8lBNgHvROsfRpF1bwaUMiI/0d4YLiC7J/Ye1GgikI
         ygTd1h00a69d1y3sEjfO4g/+HEQEXz2otWzotAm9LJfhJxiL/xTzRnK7mC9P5+wAYklk
         y/zMoD6214E+EaQ1loyfvTIMGjeJxYlWqvINsOb78XGQtiBlDZLrEBYRlpcyfHTv8yJ9
         wwHR8Fn0vPk6KSdssQRLeBjmtUXGODMLhT6x5xODYUgfebuYafjQRQNchImjimQtlEWR
         ViIuhAu4dICiwgmUE3jrFnqwEiQdTjMGP+X8558S2pd19kPPbmCtQ2hb2Dir2RLI+2t8
         ie3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/6Uq/Ixg1AERSvnJhMiDe0T9+SVuHJc1uoRjbp9pvos=;
        b=QuKoJCoGlULjup+MCmJJNar7ORMzO7D92cpR4J7JiNnP9KUZpKRlKCJOFUXEQACcbr
         IIG13vb1R7ofjZ64DPwf+XyWLF3JrpfOg/k4WWc3k0FeBJGAAuHINyHOaI9g36EGru2Y
         9zV1e8hu38Wfj3auBvjuvb/rWD8bgqtAtfUtEH6KbmnZxB/SG/3WI3FX92lcsElycrFv
         O4d2kB4WOD49g1Hq+x44IYQs/L+znEVNmS9/Eu0kYNl1G85ftsoNUdBzFkmar0jdS9Gs
         5V638YKYUJ9hqDQ3i8QuwBlsjFl6Tl6P6b1cW1FHsCz7viLRxbaK8Ct3pgCoKHl6hvjS
         npow==
X-Gm-Message-State: AOAM530ZymNbxapIjEl3oHiJJHhYXbUAWpyS/o2X2JoymP8ee8NJUxYA
        +DsN0zDLLtUVSuwXxXlXKCQ=
X-Google-Smtp-Source: ABdhPJylFUHAsg7zqxXf7jnk064AydbfggrUkpahANnF8i6u3hjMX+myB6p4Ar/QjInvgPrOpCOaTg==
X-Received: by 2002:a05:600c:3585:b0:37b:d7f3:c839 with SMTP id p5-20020a05600c358500b0037bd7f3c839mr2039036wmq.95.1645023176581;
        Wed, 16 Feb 2022 06:52:56 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id az2sm27979070wmb.2.2022.02.16.06.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 06:52:55 -0800 (PST)
Message-ID: <c0ff6e19-319c-7596-dc0e-81a71b43b4ce@gmail.com>
Date:   Wed, 16 Feb 2022 14:52:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/10] media: uapi: Add IPU3 packed Y10 format
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
References: <20220215230737.1870630-1-djrscally@gmail.com>
 <20220215230737.1870630-2-djrscally@gmail.com>
 <5684fa5b826bb89354be846ff4d698a97d693962.camel@ndufresne.ca>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <5684fa5b826bb89354be846ff4d698a97d693962.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas

On 16/02/2022 13:28, Nicolas Dufresne wrote:
> Le mardi 15 février 2022 à 23:07 +0000, Daniel Scally a écrit :
>> Some platforms with an Intel IPU3 have an IR sensor producing 10 bit
>> greyscale format data that is transmitted over a CSI-2 bus to a CIO2
>> device - this packs the data into 32 bytes per 25 pixels. Detail that
>> format.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    | 14 +++++++++++++-
>>  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
>>  include/uapi/linux/videodev2.h                     |  1 +
>>  3 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
>> index 8ebd58c3588f..5465ce3bb533 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
>> @@ -48,6 +48,17 @@ are often referred to as greyscale formats.
>>        - ...
>>        - ...
>>  
>> +    * .. _V4L2-PIX-FMT-IPU3-Y10:
>> +
>> +      - ``V4L2_PIX_FMT_IPU3_Y10``
>> +      - 'ip3y'
>> +
>> +      - Y'\ :sub:`0`\ [7:0]
>> +      - Y'\ :sub:`1`\ [5:0] Y'\ :sub:`0`\ [9:8]
>> +      - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
>> +      - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [9:4]
>> +      - Y'\ :sub:`3`\ [9:2]
>> +
>>      * .. _V4L2-PIX-FMT-Y10:
>>  
>>        - ``V4L2_PIX_FMT_Y10``
>> @@ -133,4 +144,5 @@ are often referred to as greyscale formats.
>>  
>>      For the Y16 and Y16_BE formats, the actual sampling precision may be lower
>>      than 16 bits. For example, 10 bits per pixel uses values in the range 0 to
>> -    1023.
>> +    1023. For the ip3y format 25 pixels are packed into 32 bytes, which leaves
> nit: ip3y-> IPU3_Y10, to be consistent with previous paragraph not using fourcc.


Ack

>
> I don't have very strong preference, but this could have been sorted into vendor
> formats, as its specific to a HW design, unlike MIPI which is a HW standard.


Yeah I vacillated between putting it in here and with the other IPU3
formats [1], but because those are in the "bayer formats" section it
sorta stuck out so I eventually settled on sticking it with
greyscale...but maybe there needs to be another section for "Hardware
Specific Formats" or something instead of either option.


[1]
https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/pixfmt-srggb10-ipu3.html

>
> In any case, with the nit fixed, you can add my:
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>


Thank you


Dan

>
> cheers,
> Nicolas
>
>> +    the 6 most significant bits of the last byte padded with 0.
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 642cb90f457c..89691bbb372d 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1265,6 +1265,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
>>  	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
>>  	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
>> +	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
>>  	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
>>  	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
>>  	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index df8b9c486ba1..b378c7e37eac 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -569,6 +569,7 @@ struct v4l2_pix_format {
>>  /* Grey bit-packed formats */
>>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
>> +#define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
>>  
>>  /* Palette formats */
>>  #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
