Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 217AE10237B
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfKSLnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:43:55 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:58851 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726000AbfKSLnz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:43:55 -0500
Received: from [IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7]
 ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X1vEiDA1jcs92X1vFiz7Ed; Tue, 19 Nov 2019 12:43:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574163833; bh=rQJlO19AWhRERux5Y3iBdKrXBzaqK0QxaeqA+280qfI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eO6c92NzBJ/eQWOLOY6c/ziDvifAWegNPYsh9veRluhMTbmueSUskfGiLOHrcO35H
         3WNE3Zl6YUE3Xt6wWKyHMDms/lUeM2sdPVi5iNm8m6Em3N8FETXGMWt7iTOCT9tOz1
         IqWZ+zzrzNpQRJqp05tgFj2SGRciOojm1612kjbGi58J41nAvV3+Gx0Vm22acS+x2K
         dIG/yB26hPG/lwX+5PODdTzR6Yr+ayFj9S88vAnB74HsFFnkw+mZ1u0jWW1ooXGdIj
         uZol7fPM58ea3pFfCbKOxa9AFinFb+IocxCaFToy/5JenAvebuTwxDvzYdDKqesjuu
         XaSAR38APgKiA==
Subject: Re: [PATCH 4/5] input/rmi4/rmi_driver: check if irq_find_mapping
 returns 0
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <23edf0ed-55a1-d70d-e7ed-78a62617b1cc@xs4all.nl>
Date:   Tue, 19 Nov 2019 12:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3f4c87125e5021622fe80cc85411c5b1d25bc427.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI93dUlPV2EG3aXFLWKFlnePd6Ok+qy9oXUbPjX4k2eIKT5VGyF/myFrAHVFtvEcFVKuZzwUM5+iB/KL1PeaVI+gy1vUbATM53w1WkGWTJQmubOOksNU
 EzTJ16xW3SFtbin6SvYCROnd2tfCpOrxGcSykVZWuP1SwbZl3ZY2Zbj5xKe9L2PzvU9am0qJVyWFdEO+BqxIxdaMugFpzm2bAQcoHeHR4cYfazgpSX9vVTp+
 Sk8FdaIc/1nqWqvP0iWeVl9Jaf32d4Of62EwdSVloPoq4r+AUlNV/OWlZEBRYvrdqEDTI90PftRDUH49mibZ4fHs/8FP4hR4OJnUEUWOJtRvpfIrA55m83eM
 GZMvL4fZxDLFTBABRU2jTpzvO/stL1dl7GaDM89S2R8+hg2KsvcokirRLOJ87fG1FWepGiB0IuCFb11RM8gfmYZxg4G0NSX5y0FrJPgn13su4QV5hgmglHLt
 VZNC8QDkmFgDjn5gfALdX4kKRPRI2jUcicS+A/J+r5eZnSoSNltbs4aX9cI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/19/19 12:38 PM, Lucas Stach wrote:
> Hi Hans,
> 
> On Di, 2019-11-19 at 11:51 +0100, Hans Verkuil wrote:
>> The irq_find_mapping() function can return 0 when called in the
>> rmi_process_interrupt_requests() function.
>>
>> This causes a kernel crash. Check for a 0 value and skip calling
>> handle_nested_irq() in that case.
>>
>> This was tested with the F54 function enabled on a Lenovo X1 Carbon.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
> 
> This is already fixed upstream by 549766ac2ac1
> "Input: synaptics-rmi4 - clear IRQ enables for F54"

Good news. I'm not subscribed to the linux-input ML, so I never saw that.

Ah, I now see that I'm missing a whole bunch of patches that were added
after v5.4-rc1. I'll test this again next week (I don't have access to my
Lenovo at the moment).

Regards,

	Hans

> 
> Regards,
> Lucas
> 
>> ---
>>  drivers/input/rmi4/rmi_driver.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
>> index 772493b1f665..6085ec424a84 100644
>> --- a/drivers/input/rmi4/rmi_driver.c
>> +++ b/drivers/input/rmi4/rmi_driver.c
>> @@ -154,8 +154,12 @@ static int rmi_process_interrupt_requests(struct rmi_device *rmi_dev)
>>  	 */
>>  	mutex_unlock(&data->irq_mutex);
>>  
>> -	for_each_set_bit(i, data->irq_status, data->irq_count)
>> -		handle_nested_irq(irq_find_mapping(data->irqdomain, i));
>> +	for_each_set_bit(i, data->irq_status, data->irq_count) {
>> +		unsigned int irq = irq_find_mapping(data->irqdomain, i);
>> +
>> +		if (irq)
>> +			handle_nested_irq(irq);
>> +	}
>>  
>>  	if (data->input)
>>  		input_sync(data->input);
> 

