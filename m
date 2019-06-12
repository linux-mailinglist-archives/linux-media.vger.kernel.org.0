Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3034D447E4
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 19:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729790AbfFMRCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 13:02:50 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:54473 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729501AbfFLXEQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 19:04:16 -0400
Received: by mail-it1-f193.google.com with SMTP id m138so13673344ita.4
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 16:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xXTsl9abuCJP4gMkG5zbGPKcEw/zSKuHmG+emo/prKw=;
        b=Y2OL6auF7oqK2mhZntML81cQMd7aEghXbMGNkTISj+me2jhT/RmN+um0VcQm8fKypg
         mqwU7R9MrBBwRFqV51j9wq3FQgaxdm/mYHPDZZwE0jf/EDum3Po5fuGXb0vFulxYkFZL
         nE3dleL5HcgGdE5jWPqNkTye/TUOhHNe7uwKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xXTsl9abuCJP4gMkG5zbGPKcEw/zSKuHmG+emo/prKw=;
        b=Y7/9vf2K3N5uSxC1rGWPpLzeI3FSlm5BBoHUWpuzR1korq8wuNlbtFmr4GQBBesNlA
         mKLMmmbQskrbndXrIOWSpLrkpeHOR1BwPpVj8bMkLolpV9NAaxH+rmiXPkqZm4qiwojt
         hwqPN7CxC5YdWeFZkK2GSMuC/+RMIrVOuL3qwN2ZF1fgYfaPIGcx7BOQXL6p5jRFh5iT
         2xFiTiEmg7yIlZInubSrFDxukWCzKWs+MDDVqWpSb30tRDLVbMcTWs0mzkStl5gv1kZK
         AcMhrwWQOeovTdyvG8m/xHFJ6WZwNeYERvUbIFmSJXP+/15Wmbvr68LMCISuiqJAASv+
         QlzQ==
X-Gm-Message-State: APjAAAXh5DunspoFpayAo7HlHYkV2kR5aJbESbb8ZoWAU21IfDOyZ1nw
        cqEwnq7X5fBkwHIigye6XQU7BQ==
X-Google-Smtp-Source: APXvYqzAChvmhnqCnuAGx0CRA159GDYS6DtCqUXh1HjwHgCtLP+8HSINmvJsYj+qqrL9kOEZnRfmag==
X-Received: by 2002:a02:ccdc:: with SMTP id k28mr8409969jaq.41.1560380655147;
        Wed, 12 Jun 2019 16:04:15 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id r185sm558413itd.42.2019.06.12.16.04.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 16:04:14 -0700 (PDT)
Subject: Re: [PATCH 1/2] media: v4l2-core: Shifting signed 32-bit value by 31
 bits error
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se, ezequiel@collabora.com,
        paul.kocialkowski@bootlin.com
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <cover.1559764506.git.skhan@linuxfoundation.org>
 <bac3ee3b10de409b6cdf7286e0e84737e63662ee.1559764506.git.skhan@linuxfoundation.org>
 <8cc03625-f41d-6009-d50c-823e5f498dca@infradead.org>
 <7819cae4-58e5-cbe1-ac9d-bca00d390066@xs4all.nl>
 <d5aea86a-b556-aae4-0b97-9add8878f99f@linuxfoundation.org>
 <6b4654b1-7cd5-8fea-8c08-472ade8f3ebb@xs4all.nl>
 <9f925e72-4d55-0cfc-ace6-dfe69bbc6903@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0dbeb68c-592c-1665-35fb-6b1a3aa98160@linuxfoundation.org>
Date:   Wed, 12 Jun 2019 17:04:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9f925e72-4d55-0cfc-ace6-dfe69bbc6903@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/11/19 4:27 PM, Shuah Khan wrote:
> On 6/11/19 2:50 PM, Hans Verkuil wrote:
>> On 6/11/19 9:42 PM, Shuah Khan wrote:
>>> On 6/6/19 12:33 AM, Hans Verkuil wrote:
>>>> On 6/6/19 5:22 AM, Randy Dunlap wrote:
>>>>> On 6/5/19 2:53 PM, Shuah Khan wrote:
>>>>>> Fix the following cppcheck error:
>>>>>>
>>>>>> Checking drivers/media/v4l2-core/v4l2-ioctl.c ...
>>>>>> [drivers/media/v4l2-core/v4l2-ioctl.c:1370]: (error) Shifting 
>>>>>> signed 32-bit value by 31 bits is undefined behaviour
>>>>>>
>>>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>>>> ---
>>>>>>    drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c 
>>>>>> b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>>> index 6859bdac86fe..333e387bafeb 100644
>>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>>> @@ -1364,7 +1364,7 @@ static void v4l_fill_fmtdesc(struct 
>>>>>> v4l2_fmtdesc *fmt)
>>>>>>                        (char)((fmt->pixelformat >> 8) & 0x7f),
>>>>>>                        (char)((fmt->pixelformat >> 16) & 0x7f),
>>>>>>                        (char)((fmt->pixelformat >> 24) & 0x7f),
>>>>>> -                    (fmt->pixelformat & (1 << 31)) ? "-BE" : "");
>>>>>> +                    (fmt->pixelformat & BIT(31)) ? "-BE" : "");
>>>>>>                break;
>>>>>>            }
>>>>>>        }
>>>>>>
>>>>>
>>>>> If this builds, I guess #define BIT(x) got pulled in indirectly
>>>>> since bits.h nor bitops.h is currently #included in that source file.
>>>>>
>>>
>>> It does build. You are right that I should have included bitops.h
>>>
>>>>> Documentation/process/submit-checklist.rst rule #1 says:
>>>>> 1) If you use a facility then #include the file that defines/declares
>>>>>      that facility.  Don't depend on other header files pulling in 
>>>>> ones
>>>>>      that you use.
>>>>>
>>>>> Please add #include <linux/bits or bitops.h>
>>>>>
>>>>
>>>> I'm not sure about this patch. '1 << 31' is used all over in the 
>>>> kernel,
>>>> including in public headers (e.g. media.h, videodev2.h).
>>>>
>>>> It seems arbitrary to change it only here, but not anywhere else.
>>>>
>>>
>>> Right. We have several places in the kernel that do that.
>>>
>>>> In this particular example for the fourcc handling I would prefer to 
>>>> just
>>>> use '1U << 31', both in v4l2-ioctl.c and videodev2.h.
>>>>
>>>
>>> If you would like to take the patch, I can send v2 fixing it using
>>> 1U << 31 - This is simpler since it doesn't nee additional includes.
>>
>> I would like to have this cleaned up in the public media APIs. Those 
>> can be
>> used by other compilers as well and it makes sense to me not to have
>> undefined behavior in those headers.
>>
> 
> Great. That is a good point. I will start looking at the public media
> APIs.
> 
>>>
>>>> A separate patch doing the same for MEDIA_ENT_ID_FLAG_NEXT in 
>>>> media.h would
>>>> probably be a good idea either: that way the public API at least 
>>>> will do
>>>> the right thing.
>>>>
> 
> Sounds good.
> 
>>>
>>> I should have explained it better. I wanted to start with one or two
>>> places first to see if it is worth our time to fix these:
>>>
>>> The full kernel cppcheck log for "Shifting signed 32-bit value by 31
>>> bits is undefined behaviour" can be found at:
>>>
>>> https://drive.google.com/file/d/19Xu7UqBGJ7BpzxEp92ZQYb6F8UPrk3z3/view
>>
>> I don't think it makes sense to fix this for drivers. If gcc would do 
>> this
>> wrong, we'd have noticed it ages ago.
> 

Did some research into this. We are fine with gcc, however looks like
clang had the problem which has been fixed very recently in late 2018
in 6.0 release. This will be a problem even for kernel/drivers if older
clang is used to build it.

I am sending the two header fixes (media.h, and videodev2.h) to start
with.

thanks,
-- Shuah
