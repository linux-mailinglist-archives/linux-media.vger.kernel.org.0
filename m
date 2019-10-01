Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DCCC3E83
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 19:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730023AbfJARZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 13:25:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43794 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729900AbfJARZh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 13:25:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 0993F28D76D
Subject: Re: [PATCH 1/3] media: vimc: initialize vim entity pointers to NULL
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
References: <20191001165022.16263-1-dafna.hirschfeld@collabora.com>
 <20191001165022.16263-2-dafna.hirschfeld@collabora.com>
 <d2d5bf0d-1a21-1363-9450-ff1783f1790e@collabora.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <f5120bc3-9fe8-e8ec-af2c-c24331031885@collabora.com>
Date:   Tue, 1 Oct 2019 19:25:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d2d5bf0d-1a21-1363-9450-ff1783f1790e@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna, hi Helen,

W dniu 01.10.2019 o 19:19, Helen Koike pisze:
> Hi Dafna,
> 
> On 10/1/19 1:50 PM, Dafna Hirschfeld wrote:
>> since NULL value for vimc entity pointer indicates
>> that entity creation failed and this is tested, the
>> pointers should be initialized to NULL.
> 
> Nice catch :)
> 
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/media/platform/vimc/vimc-core.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
>> index 6e3e5c91ae39..32a79e578b78 100644
>> --- a/drivers/media/platform/vimc/vimc-core.c
>> +++ b/drivers/media/platform/vimc/vimc-core.c
>> @@ -160,19 +160,17 @@ static int vimc_create_links(struct vimc_device *vimc)
>>   static int vimc_add_subdevs(struct vimc_device *vimc)
>>   {
>>   	unsigned int i;
>> -	struct vimc_ent_device *ved;
>>   
>>   	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
>>   		dev_dbg(&vimc->pdev.dev, "new entity for %s\n",
>>   			vimc->pipe_cfg->ents[i].name);
>> -		ved = vimc->pipe_cfg->ents[i].add(vimc,
>> +		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].add(vimc,
>>   					vimc->pipe_cfg->ents[i].name);
>> -		if (!ved) {
>> +		if (!vimc->ent_devs[i]) {
>>   			dev_err(&vimc->pdev.dev, "add new entity for %s\n",
>>   				vimc->pipe_cfg->ents[i].name);
>>   			return -EINVAL;
>>   		}
>> -		vimc->ent_devs[i] = ved;
>>   	}
>>   	return 0;
>>   }
> 
> I believe just the kcalloc bellow should fix the issue.
> But if you want to do this cleanup anyway, I would suggest sending a separate patch for it.
> 
>> @@ -199,7 +197,7 @@ static int vimc_register_devices(struct vimc_device *vimc)
>>   	}
>>   
>>   	/* allocate ent_devs */
>> -	vimc->ent_devs = kmalloc_array(vimc->pipe_cfg->num_ents,
>> +	vimc->ent_devs = kcalloc(vimc->pipe_cfg->num_ents,
>>   				       sizeof(*vimc->ent_devs),
>>   				       GFP_KERNEL);
> 
> Could you fix the alignment of the params here?

Isn't the above change (kmalloc_array() to kcalloc()) alone enough
to ensure the promise from the patch title is fulfilled?

In other words, why remove the "ved" local variable in vimc_add_subdevs()?

Andrzej
