Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7ADC2DBDC5
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 10:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgLPJjX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 04:39:23 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:43123 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725889AbgLPJjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 04:39:23 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pTGXkOjPbynrEpTGakpafo; Wed, 16 Dec 2020 10:38:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1608111521; bh=KXHBueOjDbo6cNmvea+XKTXDVux7va/DaIm14CAlSxY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wSuoBl2w39m+LtyBlld1XHvXDuU0AklIGh1K38If9ePpHhC5DrOVDown4dTHFefC8
         X2h+XueHJwdXbB31tNG6QtCpqfDevF6OL0ui0m4fJ+TXfpW7fjD5TZ3ywL/cGIBVZ7
         YxCSnJPN8sOo6Z2cybHKifij5BIzFrl1/aVQ2mzyOUpMJga85v1JqzF/quxBWkImbo
         rNyNEnV1CH2bS26eBdXbmqkCdyVKI8MuNmz0kc2lw8HYeddkMMDv+6uBlsHZKVCDRs
         ISo7dEnSkqcG9OdUuiZc9RbjQgXEpqEiVOA5CFhWZLwZ/ktLe6GDpOuttwLzHnXGce
         wUwLo9F9z+3Sg==
Subject: Re: [PATCH] media: allegro: Fix use after free on error
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chuhong Yuan <hslester96@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
References: <X9dShwq8PrThDpn9@mwanda> <20201214171627.GE1861@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7f7011dd-ceb2-67de-1f9b-9edd0777c04d@xs4all.nl>
Date:   Wed, 16 Dec 2020 10:38:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201214171627.GE1861@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEXhxv8wK2HMnRg9PJqD/Jk1kJWKXA/KSh5IEuI0F6AoeYMO6Oy0+VhEWfIoog/2cPqTMEEGM6HjxUce041XaPcFfNijzRdIvn+HeQBQNwSbRQTSQl0w
 LL5pEyQ/+ljdZ2UuUKYu8W1w2fwVWZtkb+A9G+IiwHN5qmG8LrAe3l64XNUIj4ldgjT+UJ4Hh0m7s3egkPyqu64osW+Bo45poR30eAr+LczDF+6M0JWL6Ol2
 lIqBjqFOlG2MaNzx+9qms+NimmRHs+r/SiKfSWEbKtc7bNLDyiBPNtBYtzJuNrrFTCD/xJt5gzswbWORp5JRqZ4EIwfCC5qQO0XfbvUI/cADS1WK3lkoEiv/
 9ZzKoaN1dzBRw1xaeRfdGiKL9TjXRAZBS/887l5asljdfzkYdFggYhqMsmB0vHr7rYLz23Y/N0UbfASTGNNe1hxk+keY9IO5mxqwKzsuyWjqpBT1ZpQzgdYQ
 nHm38PJbjScvFz2CNivbk5pMJf7R8HE7r+dbyQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/12/2020 18:16, Michael Tretter wrote:
> On Mon, 14 Dec 2020 14:54:47 +0300, Dan Carpenter wrote:
>> The "channel" is added to the "dev->channels" but then if
>> v4l2_m2m_ctx_init() fails then we free "channel" but it's still on the
>> list so it could lead to a use after free.  Let's not add it to the
>> list until after v4l2_m2m_ctx_init() succeeds.
> 
> Thanks.
> 
> The patch conflicts with the series that moves the driver from staging to
> mainline [0]. I'm not sure, which patch should go in first.

I'll take care of the conflict.

Regards,

	Hans

> 
> It is also correct to not change the order of list_del and
> v4l2_m2m_ctx_release in allegro_release. The list is used to relate messages
> from the VCU to their destination channel and this should be possible until
> the context has been released and no further messages are expected for that
> channel.
> 
> [0] https://lore.kernel.org/linux-media/20201202133040.1954837-1-m.tretter@pengutronix.de/
> 
>>
>> Fixes: cc62c74749a3 ("media: allegro: add missed checks in allegro_open()")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
> 
>> ---
>> From static analysis.  Not tested.
>>
>>  drivers/staging/media/allegro-dvt/allegro-core.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
>> index 9f718f43282b..640451134072 100644
>> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
>> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
>> @@ -2483,8 +2483,6 @@ static int allegro_open(struct file *file)
>>  	INIT_LIST_HEAD(&channel->buffers_reference);
>>  	INIT_LIST_HEAD(&channel->buffers_intermediate);
>>  
>> -	list_add(&channel->list, &dev->channels);
>> -
>>  	channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
>>  						allegro_queue_init);
>>  
>> @@ -2493,6 +2491,7 @@ static int allegro_open(struct file *file)
>>  		goto error;
>>  	}
>>  
>> +	list_add(&channel->list, &dev->channels);
>>  	file->private_data = &channel->fh;
>>  	v4l2_fh_add(&channel->fh);
>>  
>> -- 
>> 2.29.2
>>
>>

