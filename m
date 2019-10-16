Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F30D8FFB
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 13:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391019AbfJPLvU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 07:51:20 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:60087 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727249AbfJPLvU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 07:51:20 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KhpiiHG0xPduvKhpmiqmHK; Wed, 16 Oct 2019 13:51:18 +0200
Subject: Re: [PATCH 30/34] media: cec-gpio: Use CONFIG_PREEMPTION
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org
Cc:     tglx@linutronix.de, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-31-bigeasy@linutronix.de>
 <6897ccdb-e2b7-7739-e6b9-872306895a4f@xs4all.nl>
Message-ID: <23950aea-3972-64fd-9493-d7f9f81db9d2@xs4all.nl>
Date:   Wed, 16 Oct 2019 13:51:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6897ccdb-e2b7-7739-e6b9-872306895a4f@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIhXhW4TPSxZDRTyavvaBBxDjxQ3w/5OPf+azD6t1mKrv3YBVixNbFesDUWQ20mwLMrmpuOtI4gGZ6dyZVy+Mdz9uB4VL/PNrICANdiPIDS2btItFSd7
 HF1xvg59w+Do0TVnerO5l5RZvzBBt0yfQ8woDHOm92X92/0oYhQ91lqp+PyKmdY8K5es7YiBFfW7TLZV5jus40pkHajDBkKLF2dzKXMPiRkXsSZJ+PIZB3LE
 3c3UuU10gc97Pkic5w9ScBhXdwFhwh1Br26+rqWwt2CoY2yjZqtTgLOBahSnus8L61GjmZ+AYz42MBif4AoDnw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/15/19 9:53 PM, Hans Verkuil wrote:
> On 10/15/19 9:18 PM, Sebastian Andrzej Siewior wrote:
>> CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
>> Both PREEMPT and PREEMPT_RT require the same functionality which today
>> depends on CONFIG_PREEMPT.
>>
>> Switch the Kconfig dependency to CONFIG_PREEMPTION.
>>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: linux-media@vger.kernel.org
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Do you want me to take this patch? Just checking.

Regards,

	Hans

> 
> Thanks!
> 
> 	Hans
> 
>> ---
>>  drivers/media/platform/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>> index f1f61419fd292..56d4c1e91c276 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -585,7 +585,7 @@ config VIDEO_MESON_G12A_AO_CEC
>>  
>>  config CEC_GPIO
>>  	tristate "Generic GPIO-based CEC driver"
>> -	depends on PREEMPT || COMPILE_TEST
>> +	depends on PREEMPTION || COMPILE_TEST
>>  	select CEC_CORE
>>  	select CEC_PIN
>>  	select GPIOLIB
>>
> 

