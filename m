Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C6B107EB1
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 14:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbfKWNxf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 08:53:35 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:45187 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726463AbfKWNxe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 08:53:34 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YVqpiCBqWLwWdYVqtiRyf4; Sat, 23 Nov 2019 14:53:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574517212; bh=qSXyafRMbCZEKJw8Y/CqGBXN60PgnzKw0CVa03HkNdg=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gaGdFHwBWj3Tlny59qZTP6jhCXJe1zLL+C6H93zWZmiX//62G8UDV39yB1mebD/nF
         C7aIX8ikP2mgqE2YaDZ94k2r1WqRimbWXhMLGP5YDKrCKCFVmKtzhOW+azCFFrTiLT
         FA1wv2BAhHR+vMzl4caOBj1zatECH7AAHeyXnEi04rCCol/gbaw9p7Hd3/sXcAWwxN
         BiRiRDm+xDBRRW201i/ZcBBFX+Qd9rW1SlDDNBRCtc9TXplgXLB+2rf7HVmZHtdy1M
         GH1GPlMrthBABG7T2kxWKYSy9P9BF1FG1bNOfg5bb9HIu7sF+h/l04Nt1yFfe1/u6Y
         97gK48UtVKisQ==
Subject: Re: [PATCH 4/5] input/rmi4/rmi_driver: check if irq_find_mapping
 returns 0
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Lucas Stach <l.stach@pengutronix.de>, linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
 <20191119105118.54285-5-hverkuil-cisco@xs4all.nl>
 <3f4c87125e5021622fe80cc85411c5b1d25bc427.camel@pengutronix.de>
 <23edf0ed-55a1-d70d-e7ed-78a62617b1cc@xs4all.nl>
Message-ID: <67116e00-fe6e-2d3f-1122-16e7c34b6af1@xs4all.nl>
Date:   Sat, 23 Nov 2019 14:53:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <23edf0ed-55a1-d70d-e7ed-78a62617b1cc@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLX/AR7P6OXJlVDixN06RPJcudeeLA7TqI8I4rk/rbRDz3vHJFW3BhTZv5V4/Nu0Rzmt47lpb8Bdb4rbyEImKxYeV8CktSyjIVhOtVqRoJCB1qeBVglh
 nV7LtSeTcOGkp7LIZDeVQ+CA7/AjnXw0yGGOsPy/Osc54s+1MeSuZpcCJ6ZSyR4bHWw0MLFifmWYrTX11PH0ci0GtXaI7ciiPWlKdcAI75ie94xbchazswph
 NZ7UR6/8JnAtku3Vjj0Ox0Z4F6ELfjOvOoUOs1/2doetWkgEa6azXFPdjfi3G304YaAUUWeFYpqofozEtPkdnE3dMJPYf7lAd4kZXAFySGndBAEmwb5Z9+xV
 i1u1T1yRRFoW02eWopiDWuG+zQptFNCHVXqFENFZ0vMgftTUtRcmZ7pH98DprGfNq1azPqG7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/19/19 12:43 PM, Hans Verkuil wrote:
> On 11/19/19 12:38 PM, Lucas Stach wrote:
>> Hi Hans,
>>
>> On Di, 2019-11-19 at 11:51 +0100, Hans Verkuil wrote:
>>> The irq_find_mapping() function can return 0 when called in the
>>> rmi_process_interrupt_requests() function.
>>>
>>> This causes a kernel crash. Check for a 0 value and skip calling
>>> handle_nested_irq() in that case.
>>>
>>> This was tested with the F54 function enabled on a Lenovo X1 Carbon.
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
>>
>> This is already fixed upstream by 549766ac2ac1
>> "Input: synaptics-rmi4 - clear IRQ enables for F54"
> 
> Good news. I'm not subscribed to the linux-input ML, so I never saw that.
> 
> Ah, I now see that I'm missing a whole bunch of patches that were added
> after v5.4-rc1. I'll test this again next week (I don't have access to my
> Lenovo at the moment).

Tested with v5.4-rc8 and I can confirm that this patch is not needed anymore
and can be dropped.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Regards,
>> Lucas
>>
>>> ---
>>>  drivers/input/rmi4/rmi_driver.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
>>> index 772493b1f665..6085ec424a84 100644
>>> --- a/drivers/input/rmi4/rmi_driver.c
>>> +++ b/drivers/input/rmi4/rmi_driver.c
>>> @@ -154,8 +154,12 @@ static int rmi_process_interrupt_requests(struct rmi_device *rmi_dev)
>>>  	 */
>>>  	mutex_unlock(&data->irq_mutex);
>>>  
>>> -	for_each_set_bit(i, data->irq_status, data->irq_count)
>>> -		handle_nested_irq(irq_find_mapping(data->irqdomain, i));
>>> +	for_each_set_bit(i, data->irq_status, data->irq_count) {
>>> +		unsigned int irq = irq_find_mapping(data->irqdomain, i);
>>> +
>>> +		if (irq)
>>> +			handle_nested_irq(irq);
>>> +	}
>>>  
>>>  	if (data->input)
>>>  		input_sync(data->input);
>>
> 

