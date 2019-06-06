Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC01A36C55
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 08:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFFGde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 02:33:34 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:46165 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725766AbfFFGde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 02:33:34 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Ylxghf5RAsDWyYlxkh2OZE; Thu, 06 Jun 2019 08:33:32 +0200
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7819cae4-58e5-cbe1-ac9d-bca00d390066@xs4all.nl>
Date:   Thu, 6 Jun 2019 08:33:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8cc03625-f41d-6009-d50c-823e5f498dca@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCqAYO0ihncoGTKo329zWC1gdF8JaulHT0j0v6Ht2YI9jDKe/bIL9y8zuDYshGhhsoJruWi7+oE6lfPUkqfGjs2tK2nOIA8V3IL4WiXLj69/z6uNJi5/
 WSKSzH7fScCdAvKixvxNEICWsXr1rLUYZHsJlBUCmq3Fzs3uemD0L/VM7QBj7QP1EKnIxdi1BoaY0JIcNRnSnTdznKPRUj4ZRGgunZXvkFZ3zdrZJCyugYgD
 xgObuEYnLaPVjNdqgavrta/HVJZ6x3gku4A5GOhl2LDHQhdJwk9W/qyBdDLU99s72A+hkh4Tav6sc1xRYmP5LKlxa36IuqBHpTS2gf6I4pi13GBfGclTTKof
 RhgFPdNggOnHd7SRjp14ITZbpt9Fe5sDSDo9D4+mwgj5Z7e3ObdVFPkKj+pM48BLMhvD0tBaCyWjkJHYSldxtVQ9DDAWUDboYXayMuAcPQgwpYxOCLM6Je6V
 MOXhcd1ALgt1Qnwm3XolI4mppki8N/R5WFjwwA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/6/19 5:22 AM, Randy Dunlap wrote:
> On 6/5/19 2:53 PM, Shuah Khan wrote:
>> Fix the following cppcheck error:
>>
>> Checking drivers/media/v4l2-core/v4l2-ioctl.c ...
>> [drivers/media/v4l2-core/v4l2-ioctl.c:1370]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 6859bdac86fe..333e387bafeb 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1364,7 +1364,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  					(char)((fmt->pixelformat >> 8) & 0x7f),
>>  					(char)((fmt->pixelformat >> 16) & 0x7f),
>>  					(char)((fmt->pixelformat >> 24) & 0x7f),
>> -					(fmt->pixelformat & (1 << 31)) ? "-BE" : "");
>> +					(fmt->pixelformat & BIT(31)) ? "-BE" : "");
>>  			break;
>>  		}
>>  	}
>>
> 
> If this builds, I guess #define BIT(x) got pulled in indirectly
> since bits.h nor bitops.h is currently #included in that source file.
> 
> Documentation/process/submit-checklist.rst rule #1 says:
> 1) If you use a facility then #include the file that defines/declares
>    that facility.  Don't depend on other header files pulling in ones
>    that you use.
> 
> Please add #include <linux/bits or bitops.h>
> 

I'm not sure about this patch. '1 << 31' is used all over in the kernel,
including in public headers (e.g. media.h, videodev2.h).

It seems arbitrary to change it only here, but not anywhere else.

In this particular example for the fourcc handling I would prefer to just
use '1U << 31', both in v4l2-ioctl.c and videodev2.h.

A separate patch doing the same for MEDIA_ENT_ID_FLAG_NEXT in media.h would
probably be a good idea either: that way the public API at least will do
the right thing.

Regards,

	Hans
