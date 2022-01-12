Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E363748C26F
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 11:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352580AbiALKkX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 05:40:23 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.168]:27025 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239535AbiALKkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 05:40:23 -0500
X-KPN-MessageId: f3084771-7393-11ec-8862-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id f3084771-7393-11ec-8862-005056aba152;
        Wed, 12 Jan 2022 11:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=voSopkAronjPx45Y/VkX9JuTht6XzWdHYo7PEeArGJg=;
        b=oaLLvqidFpUL8rjrwf9yQkvRfCIL7wMgk9mYzuIRDIfKAqnjZ66xBzP4P5BMd9yv+H3uzOxm0/NmM
         6fNUEewAcEYIOqQNDtnPCs8tCm5pZ2RSkhH/TsRewBeQYLlzWZV3hlJOzaBIqA8lqFZ8BAQAe+2v62
         jL9r07ahWxZwilCoUg3TG9VMMbCplKRx1WUi4wiShpv6IUGIbORUTNaswy6jDnlF07S3aH1Ep1nkJb
         r6hvksSeZb3ZXmnduy7i71SMxfNV1eBPS900RYKgrln0kxAeU/4msavT0rF+1JlKjqw6e9jmi4xcqA
         f1XJXs1FNrTNEnVbot0aK2meKsF+7Vw==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|6qsLJ4w6h9J4dXQ7gC/oaAQX5AeFSDdTcYlEynEYxKgBcWROHqV1fAYIiuZTc9d
 +LJ2/Dh7oQIDNb5sVTB1JwQ==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 0ad95271-7394-11ec-b76f-005056ab7584;
        Wed, 12 Jan 2022 11:40:22 +0100 (CET)
Message-ID: <bb786c06-c198-f5c8-5ea8-7e617a00bb0a@xs4all.nl>
Date:   Wed, 12 Jan 2022 11:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH] media: docs: Change unintended assignment in v4l
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Daniel Lundberg Pedersen <dlp@qtec.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org
References: <20220111164855.147487-1-dlp@qtec.com>
 <164192283176.10801.16438722671029975593@Monstersaurus>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <164192283176.10801.16438722671029975593@Monstersaurus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/01/2022 18:40, Kieran Bingham wrote:
> Quoting Daniel Lundberg Pedersen (2022-01-11 16:48:55)
>> Example should be comparing errno to EINTR instead of doing assignment.
>>
> 
> Ouch - that's not helpful in documentation indeed.
> Good spot, and fix.
> 
> It might help to say 'in v4l2grab' in the $SUBJECT rather than 'v4l' as
> that would be a bit more specific.

Yes, ideally something like this:

"media: docs: v4l2grab.c.rst: change unintended assignment"

I see way too often patches that do NOT specify the driver (or in this
case the specific file) that has been changed. Just saying "media: docs:"
suggests a 'media docs'-wide change.

Please post a v2 with the correct subject, I want to crack down on this
practice.

While easy enough to fix, the problem is that by not mentioning what
was changed the correct maintainers won't see the patch. Not a big
deal here, but much more serious with driver patches.

Regards,

	Hans

> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
>> Signed-off-by: Daniel Lundberg Pedersen <dlp@qtec.com>
>> ---
>>  Documentation/userspace-api/media/v4l/v4l2grab.c.rst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/v4l2grab.c.rst b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
>> index eaa0f95048e7..c98a78d63a8b 100644
>> --- a/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
>> +++ b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
>> @@ -134,7 +134,7 @@ file: media/v4l/v4l2grab.c
>>                             tv.tv_usec = 0;
>>  
>>                             r = select(fd + 1, &fds, NULL, NULL, &tv);
>> -                   } while ((r == -1 && (errno = EINTR)));
>> +                   } while ((r == -1 && (errno == EINTR)));
>>                     if (r == -1) {
>>                             perror("select");
>>                             return errno;
>> -- 
>> 2.33.1
>>

