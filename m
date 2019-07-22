Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8E8D70174
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 15:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729708AbfGVNoR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 09:44:17 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44178 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729188AbfGVNoQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 09:44:16 -0400
Received: by mail-pf1-f195.google.com with SMTP id t16so17379416pfe.11
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2019 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DJ/uDnwZtRa/WIpL5XNGddtxQKDvNvsyVQzQE3LJ4gw=;
        b=ZlDEAdHEBQVvAOC5iy9LBvzMxroJH0uBe9X14guv8oxOPmuwO0Xl3rljszEAJcg8oV
         tm4OWnPKo0vPh5ZjqyaNoZ38zOBSUuqwo5ez7qwuaeag459SQGTgruZ0s5dRVaoIUz3u
         yDMEWWT3DnjLQWNcebIaVQw3j29/4V7EKFw6P7oKIwTfDnmQxMVd++FmuB/9FmPwJjvx
         uxozzjK1p8uSgNvmEZoqaXFV+b8/4bwp24GG8F1V1akXRtmCRQvme5yAvJLv/uMgdjT2
         Z7pz1slJCBQN5QLmZ9oGFdjiPZXVOA3qVqxS6OF8/YMI0wo2GORYUHFT9QMJ5h7efnYI
         lU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DJ/uDnwZtRa/WIpL5XNGddtxQKDvNvsyVQzQE3LJ4gw=;
        b=BkKq/QlS1eJ+4x1utApMpJ3vb/TMqk6qGf98RLP3yx1r8Zy0jQphZV0ZEkON/erxND
         JZg1WTQgaw+1wuSDHTAzanB7fE94gIDHmIaGRMJifv57yPwKur8s3ge5JDKfOXMd4AQ2
         NAoLY8UMFRJVMV6h+W22NodTp9DureyJXchksZ3WDPAxm4i2XxE9nnY9K45WMjkA/UE7
         oTWvmoWWeT489ant+AzwxXeIe+JxTzGNp0Rn68a0vWG5g6vDtrT6OwG+decPrJwyY3Q4
         G1YTx1KBw8xyfkv1o9x5e9Zatfe4ajJIkjJhDAazTwWlOdPCGjVQWlK/AOPYmdHJrw/Y
         9Lug==
X-Gm-Message-State: APjAAAXmm0T9MhnDp9L/t8CqO5yHovi1jfhMJRzxNl8Y1Irx7GOIrYt7
        CEmbRZX9uB/UgUIMIELhWo8k76FB
X-Google-Smtp-Source: APXvYqxICN12ZjuVSVVmzEOLJ9xxnOHnvJY5tJdkiIIv9PDq92RdhBheLNi1HuoHWeityZ+SY89Sjg==
X-Received: by 2002:a63:d555:: with SMTP id v21mr49533803pgi.179.1563803055330;
        Mon, 22 Jul 2019 06:44:15 -0700 (PDT)
Received: from [10.0.2.15] ([122.163.0.39])
        by smtp.gmail.com with ESMTPSA id k64sm20592830pge.65.2019.07.22.06.44.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 06:44:14 -0700 (PDT)
Subject: Re: [PATCH v2] staging: media: sunxi: Add bool cast to value
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jeremy Sowden <jeremy@azazel.net>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
References: <20190722060651.6538-1-nishkadg.linux@gmail.com>
 <20190722111225.GA2695@azazel.net> <20190722122438.GA1908@aptenodytes>
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
Message-ID: <45555499-57f3-a315-6f84-f878c3aa0130@gmail.com>
Date:   Mon, 22 Jul 2019 19:14:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722122438.GA1908@aptenodytes>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/07/19 5:54 PM, Paul Kocialkowski wrote:
> Hi,
> 
> On Mon 22 Jul 19, 12:12, Jeremy Sowden wrote:
>> On 2019-07-22, at 11:36:51 +0530, Nishka Dasgupta wrote:
>>> Typecast as bool the return value of cedrus_find_format in
>>> cedrus_check_format as the return value of cedrus_check_format is
>>> always treated like a boolean value.
>>>
>>> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Add !! to the returned pointer to ensure that the return value is
>>>    always either true or false, and never a non-zero value other than
>>>    true.
>>>
>>>   drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>>> index e2b530b1a956..b731745f21f8 100644
>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
>>> @@ -86,7 +86,7 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
>>>   static bool cedrus_check_format(u32 pixelformat, u32 directions,
>>>   				unsigned int capabilities)
>>>   {
>>> -	return cedrus_find_format(pixelformat, directions, capabilities);
>>> +	return !!(bool)cedrus_find_format(pixelformat, directions, capabilities);
>>>   }
>>
>> I think the original was fine.  The return value of cedrus_find_format
>> will be automatically converted to bool before being returned from
>> cedrus_check_format since that is the return-type of the function, and
>> the result of converting any non-zero value to bool is 1.
> 
> Okay I was a bit unsure about that and wanted to play it on the safe side
> without really looking it up, but that gave me the occasion to verify.
> 
>  From what I could find (from my GNU system's /usr/include/unistring/stdbool.h):
> 
>     Limitations of this substitute, when used in a C89 environment:
> 
>         - In C99, casts and automatic conversions to '_Bool' or 'bool' are
>           performed in such a way that every nonzero value gets converted
>           to 'true', and zero gets converted to 'false'.  This doesn't work
>           with this substitute.  With this substitute, only the values 0 and 1
>           give the expected result when converted to _Bool' or 'bool'.
> 
> So since the kernel is built for C89 (unless I'm mistaken), I don't think the
> compiler provides any guarantee about bool values being converted to 1 when
> they are non-zero. As a result, I think it's best to be careful.
> 
> However, I'm not sure I really see what cocinelle was unhappy about. You
> mentionned single-line functions, but I don't see how that can be a problem.

It's not a problem per se. I'm just working on a cleanup project for 
which I went through all of staging replacing single-line functions with 
what they were calling. In some cases that makes it easier to figure out 
what a particular function call does, since the called function actually 
does something itself instead of just calling a different function?
This function was also flagged as one such potentially-removable 
function by Coccinelle; but in order to do the same replacement that I'd 
done in other staging drivers, I thought I would do something about the 
type mismatch first, especially since find_format doesn't appear to be 
used anywhere else.
However, now I won't remove check_format and replace it with find_format 
as I'd originally planned, since you've said that isn't necessary here. 
That leaves the return type issue.


> So in the end, I think we should keep the !! and drop the (bool) cast if there's
> no particular warning about it.

Should I send a version 3 that does this?

Thanking you,
Nishka

> What do you think?
> 
> Cheers,
> 
> Paul
> 
>>>   static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
>>> --
>>> 2.19.1
> 

