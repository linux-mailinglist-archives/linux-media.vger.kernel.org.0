Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F7BC3EC6
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 19:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731338AbfJARiE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 13:38:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43970 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731299AbfJARiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 13:38:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id E85A728A934
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
 <f5120bc3-9fe8-e8ec-af2c-c24331031885@collabora.com>
 <34c85156-418c-cd00-78ad-b80cfc5832be@collabora.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <aed609bc-6ffa-48bb-b983-a12ce98ca1dc@collabora.com>
Date:   Tue, 1 Oct 2019 19:38:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <34c85156-418c-cd00-78ad-b80cfc5832be@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

W dniu 01.10.2019 o 19:35, Helen Koike pisze:
> 

<snip>

>>>
>>> I believe just the kcalloc bellow should fix the issue.
>>> But if you want to do this cleanup anyway, I would suggest sending a separate patch for it.
>>>
>>>> @@ -199,7 +197,7 @@ static int vimc_register_devices(struct vimc_device *vimc)
>>>>        }
>>>>          /* allocate ent_devs */
>>>> -    vimc->ent_devs = kmalloc_array(vimc->pipe_cfg->num_ents,
>>>> +    vimc->ent_devs = kcalloc(vimc->pipe_cfg->num_ents,
>>>>                           sizeof(*vimc->ent_devs),
>>>>                           GFP_KERNEL);
>>>
>>> Could you fix the alignment of the params here?
>>
>> Isn't the above change (kmalloc_array() to kcalloc()) alone enough
>> to ensure the promise from the patch title is fulfilled?
> 
> I fully agree. That is why I mentioned above in "I believe just the kcalloc bellow should fix the issue."
> Sorry if I wasn't clear.
> 

Thanks for teaching me how to read :D

Andrzej
