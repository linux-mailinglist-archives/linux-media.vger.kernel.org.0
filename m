Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5319A41821
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 00:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392070AbfFKW2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 18:28:01 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:37169 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391979AbfFKW2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 18:28:01 -0400
Received: by mail-it1-f193.google.com with SMTP id x22so7489068itl.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 15:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+X9der8NXdhTZrpKs7ARdC9UNxvkpwzf4UU4Vx5Hsq4=;
        b=e4Npqn3VAgKiaPp80W37qxc1orZz3dpQR7luq/0MoHQ9azCxskb/8ERBGSD4AmvRpK
         6a3YkPRDfCcxHlcoecJV8zMLhO4Ak8zIp+jFb+snV7+LH4GbZWI6J4MAX7JGcmLpMj9v
         mGyCh53uPjlxb2gyL203LHr7bZyRI2Zf7dX7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+X9der8NXdhTZrpKs7ARdC9UNxvkpwzf4UU4Vx5Hsq4=;
        b=dhgljOK3j7tIJyaMuh50szBWm8dOrIbGIzvAkfWF/fK/ohLyNI18wqmD/2asjgPT/q
         JWtnYlIdBBsPDUU2aLUItEtajJDf5lWfeT/q0lOBo2WzFRm0iW5iDpowIqE/LYgtnll8
         nFZ382nb/80JYI2GdKsns21anFUNZkEMbNP77bC/s2KcBDZ/v+BFn25riWwZFNIYUPCC
         sGo7sLQt1YQBatV19riVQ8fQSJ1DKgKNYEUHhwYU2ElO+y+xo4Hu1xgVmuGH+YhMUo8F
         9LH6AX2yw/D03EwDYtKzTo1Is46p6uJeF043QApgPjQyDo6EteEHZtoRaBfDVmG7ElwT
         2bew==
X-Gm-Message-State: APjAAAVKjlRB8UyGGBMkhRaoHbJa68V9pUnSeAI8zHq9dq75prJLfAFw
        8Naf8LacL0bdLQnrza8CASpXfzjlt/c=
X-Google-Smtp-Source: APXvYqzY62xsZhPwvlwvKnXn2UnexiJcXOMLbaA2+xsHl+lom4K3vDxJ8RyO06LXn/4Y8oTp0K7J3w==
X-Received: by 2002:a02:1a86:: with SMTP id 128mr52536525jai.95.1560292080103;
        Tue, 11 Jun 2019 15:28:00 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e26sm4683086iod.10.2019.06.11.15.27.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 15:27:59 -0700 (PDT)
Subject: Re: [PATCH 1/2] media: v4l2-core: Shifting signed 32-bit value by 31
 bits error
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se, ezequiel@collabora.com,
        paul.kocialkowski@bootlin.com
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1559764506.git.skhan@linuxfoundation.org>
 <bac3ee3b10de409b6cdf7286e0e84737e63662ee.1559764506.git.skhan@linuxfoundation.org>
 <8cc03625-f41d-6009-d50c-823e5f498dca@infradead.org>
 <7819cae4-58e5-cbe1-ac9d-bca00d390066@xs4all.nl>
 <d5aea86a-b556-aae4-0b97-9add8878f99f@linuxfoundation.org>
 <6b4654b1-7cd5-8fea-8c08-472ade8f3ebb@xs4all.nl>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9f925e72-4d55-0cfc-ace6-dfe69bbc6903@linuxfoundation.org>
Date:   Tue, 11 Jun 2019 16:27:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6b4654b1-7cd5-8fea-8c08-472ade8f3ebb@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/11/19 2:50 PM, Hans Verkuil wrote:
> On 6/11/19 9:42 PM, Shuah Khan wrote:
>> On 6/6/19 12:33 AM, Hans Verkuil wrote:
>>> On 6/6/19 5:22 AM, Randy Dunlap wrote:
>>>> On 6/5/19 2:53 PM, Shuah Khan wrote:
>>>>> Fix the following cppcheck error:
>>>>>
>>>>> Checking drivers/media/v4l2-core/v4l2-ioctl.c ...
>>>>> [drivers/media/v4l2-core/v4l2-ioctl.c:1370]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
>>>>>
>>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>>> ---
>>>>>    drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> index 6859bdac86fe..333e387bafeb 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> @@ -1364,7 +1364,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>>    					(char)((fmt->pixelformat >> 8) & 0x7f),
>>>>>    					(char)((fmt->pixelformat >> 16) & 0x7f),
>>>>>    					(char)((fmt->pixelformat >> 24) & 0x7f),
>>>>> -					(fmt->pixelformat & (1 << 31)) ? "-BE" : "");
>>>>> +					(fmt->pixelformat & BIT(31)) ? "-BE" : "");
>>>>>    			break;
>>>>>    		}
>>>>>    	}
>>>>>
>>>>
>>>> If this builds, I guess #define BIT(x) got pulled in indirectly
>>>> since bits.h nor bitops.h is currently #included in that source file.
>>>>
>>
>> It does build. You are right that I should have included bitops.h
>>
>>>> Documentation/process/submit-checklist.rst rule #1 says:
>>>> 1) If you use a facility then #include the file that defines/declares
>>>>      that facility.  Don't depend on other header files pulling in ones
>>>>      that you use.
>>>>
>>>> Please add #include <linux/bits or bitops.h>
>>>>
>>>
>>> I'm not sure about this patch. '1 << 31' is used all over in the kernel,
>>> including in public headers (e.g. media.h, videodev2.h).
>>>
>>> It seems arbitrary to change it only here, but not anywhere else.
>>>
>>
>> Right. We have several places in the kernel that do that.
>>
>>> In this particular example for the fourcc handling I would prefer to just
>>> use '1U << 31', both in v4l2-ioctl.c and videodev2.h.
>>>
>>
>> If you would like to take the patch, I can send v2 fixing it using
>> 1U << 31 - This is simpler since it doesn't nee additional includes.
> 
> I would like to have this cleaned up in the public media APIs. Those can be
> used by other compilers as well and it makes sense to me not to have
> undefined behavior in those headers.
> 

Great. That is a good point. I will start looking at the public media
APIs.

>>
>>> A separate patch doing the same for MEDIA_ENT_ID_FLAG_NEXT in media.h would
>>> probably be a good idea either: that way the public API at least will do
>>> the right thing.
>>>

Sounds good.

>>
>> I should have explained it better. I wanted to start with one or two
>> places first to see if it is worth our time to fix these:
>>
>> The full kernel cppcheck log for "Shifting signed 32-bit value by 31
>> bits is undefined behaviour" can be found at:
>>
>> https://drive.google.com/file/d/19Xu7UqBGJ7BpzxEp92ZQYb6F8UPrk3z3/view
> 
> I don't think it makes sense to fix this for drivers. If gcc would do this
> wrong, we'd have noticed it ages ago.

Agreed. I am not concerned about it being incorrect. More for silencing
cppcheck. I do agree that it isn't of a great value to us.

> 
> But I think it makes sense to fix this in public headers.
> 

Yes. This would definitely help.

thanks,
-- Shuah
