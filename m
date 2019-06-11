Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B20A4166D
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 22:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406669AbfFKUuX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 16:50:23 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47005 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406215AbfFKUuX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 16:50:23 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aniihmt7M41bFanilhFqre; Tue, 11 Jun 2019 22:50:21 +0200
Subject: Re: [PATCH 1/2] media: v4l2-core: Shifting signed 32-bit value by 31
 bits error
To:     Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se, ezequiel@collabora.com,
        paul.kocialkowski@bootlin.com
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1559764506.git.skhan@linuxfoundation.org>
 <bac3ee3b10de409b6cdf7286e0e84737e63662ee.1559764506.git.skhan@linuxfoundation.org>
 <8cc03625-f41d-6009-d50c-823e5f498dca@infradead.org>
 <7819cae4-58e5-cbe1-ac9d-bca00d390066@xs4all.nl>
 <d5aea86a-b556-aae4-0b97-9add8878f99f@linuxfoundation.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6b4654b1-7cd5-8fea-8c08-472ade8f3ebb@xs4all.nl>
Date:   Tue, 11 Jun 2019 22:50:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d5aea86a-b556-aae4-0b97-9add8878f99f@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDqPdampvam9t1IRzB0iFELc7nEPX5OR/TF9QssU3HBs2KYkud1TLt9b109GhAPvLE53p88JAm+woywM+u645zJD/YfA8UkYGOxZDLwgwjZweqeV0xO1
 t5gaPWld559PAdtOK2f9oA26Mymc6A/ITMeypImIZb3FY769jcbWGPlZjE/tV/Z4XIU3sK4A9FNoKRBJBNFNOlr+7c/hFJ561VqKTuzDNqa+j8R91UHuWEFl
 doRRN6I3zjythBcykNWoHsAITIHf4nNgzuxfQsI6jf6A77ZF34L7TvGGEqGiQxuafXQGfwHB8Tg6eol3yH7oxbfekZ4nQdmIzMR+J27eOMeD3nVRifH7kmEn
 jeJh5QXZUenJSXYGSkdEO6pJnHLQviiM9YN0wvj8k2FwhEcFyJBl7kb3n98uiizXyM3umuIQgm//BGXm198n67sNhBqM0TGzirCufTaZWbYeb6PhNJVqByWR
 1/I4Ew74pZyYKub+QKawTMqZ/JKO0n9SXXfoDA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/11/19 9:42 PM, Shuah Khan wrote:
> On 6/6/19 12:33 AM, Hans Verkuil wrote:
>> On 6/6/19 5:22 AM, Randy Dunlap wrote:
>>> On 6/5/19 2:53 PM, Shuah Khan wrote:
>>>> Fix the following cppcheck error:
>>>>
>>>> Checking drivers/media/v4l2-core/v4l2-ioctl.c ...
>>>> [drivers/media/v4l2-core/v4l2-ioctl.c:1370]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
>>>>
>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>> ---
>>>>   drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> index 6859bdac86fe..333e387bafeb 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> @@ -1364,7 +1364,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>   					(char)((fmt->pixelformat >> 8) & 0x7f),
>>>>   					(char)((fmt->pixelformat >> 16) & 0x7f),
>>>>   					(char)((fmt->pixelformat >> 24) & 0x7f),
>>>> -					(fmt->pixelformat & (1 << 31)) ? "-BE" : "");
>>>> +					(fmt->pixelformat & BIT(31)) ? "-BE" : "");
>>>>   			break;
>>>>   		}
>>>>   	}
>>>>
>>>
>>> If this builds, I guess #define BIT(x) got pulled in indirectly
>>> since bits.h nor bitops.h is currently #included in that source file.
>>>
> 
> It does build. You are right that I should have included bitops.h
> 
>>> Documentation/process/submit-checklist.rst rule #1 says:
>>> 1) If you use a facility then #include the file that defines/declares
>>>     that facility.  Don't depend on other header files pulling in ones
>>>     that you use.
>>>
>>> Please add #include <linux/bits or bitops.h>
>>>
>>
>> I'm not sure about this patch. '1 << 31' is used all over in the kernel,
>> including in public headers (e.g. media.h, videodev2.h).
>>
>> It seems arbitrary to change it only here, but not anywhere else.
>>
> 
> Right. We have several places in the kernel that do that.
> 
>> In this particular example for the fourcc handling I would prefer to just
>> use '1U << 31', both in v4l2-ioctl.c and videodev2.h.
>>
> 
> If you would like to take the patch, I can send v2 fixing it using
> 1U << 31 - This is simpler since it doesn't nee additional includes.

I would like to have this cleaned up in the public media APIs. Those can be
used by other compilers as well and it makes sense to me not to have
undefined behavior in those headers.

> 
>> A separate patch doing the same for MEDIA_ENT_ID_FLAG_NEXT in media.h would
>> probably be a good idea either: that way the public API at least will do
>> the right thing.
>>
> 
> I should have explained it better. I wanted to start with one or two
> places first to see if it is worth our time to fix these:
> 
> The full kernel cppcheck log for "Shifting signed 32-bit value by 31 
> bits is undefined behaviour" can be found at:
> 
> https://drive.google.com/file/d/19Xu7UqBGJ7BpzxEp92ZQYb6F8UPrk3z3/view

I don't think it makes sense to fix this for drivers. If gcc would do this
wrong, we'd have noticed it ages ago.

But I think it makes sense to fix this in public headers.

Regards,

	Hans
