Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6553433DB5
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 19:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234682AbhJSRtM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 13:49:12 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:55024 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhJSRtL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 13:49:11 -0400
Received: from [192.168.1.18] ([92.140.161.106])
        by smtp.orange.fr with ESMTPA
        id ctCRmJ9pTPNphctCSm4oEL; Tue, 19 Oct 2021 19:46:57 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 19 Oct 2021 19:46:57 +0200
X-ME-IP: 92.140.161.106
Subject: Re: [PATCH] media: tw5864: Simplify 'tw5864_finidev()'
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        andrey.utkin@corp.bluecherry.net, anton@corp.bluecherry.net,
        maintainers@bluecherrydvr.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <189d4fd72db8707cb495e3a29ab7a276e07f62a0.1634373552.git.christophe.jaillet@wanadoo.fr>
 <163463974453.1853916.7698473612617245785@Monstersaurus>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <36d2d114-00be-f509-d6e0-424ef65af9b9@wanadoo.fr>
Date:   Tue, 19 Oct 2021 19:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163463974453.1853916.7698473612617245785@Monstersaurus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 19/10/2021 à 12:35, Kieran Bingham a écrit :
> Quoting Christophe JAILLET (2021-10-16 09:40:29)
>> Some resources are allocated with 'pci_request_regions()', so use
>> 'pci_release_regions()' to free them, instead of a verbose
>> 'release_mem_region()'.
> 
> And the driver was even already using pci_release_regions() in
> tw5864_initdev(), so indeed this makes it more consistent too.
> 
> I'm curious that tw5864_initdev() calls pci_enable_device() (and
> pci_disable_device in it's error path), while tw5864_finidev() doesn't.

I agree with you. I should have spotted it when I've looked at the probe 
and remove functions :(

> 
> Would you like to submit a patch to fix that on top of this one? or should I?

Either way is fine for me.
If it's fine for you to fix it, I leave it to you.

A more invasive fix could be to switch to 'pcim_enable_device()' and 
remove both 'pci_release_regions()' and 'pci_disable_device()' calls.

CJ

> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
>> There is no point in calling 'devm_kfree()'. The corresponding resource is
>> managed, so it will be fried automatically.
> 
> Indeed.
> 
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/media/pci/tw5864/tw5864-core.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/pci/tw5864/tw5864-core.c b/drivers/media/pci/tw5864/tw5864-core.c
>> index 23d3cae54a5d..fee3b7711901 100644
>> --- a/drivers/media/pci/tw5864/tw5864-core.c
>> +++ b/drivers/media/pci/tw5864/tw5864-core.c
>> @@ -333,11 +333,9 @@ static void tw5864_finidev(struct pci_dev *pci_dev)
>>   
>>          /* release resources */
>>          iounmap(dev->mmio);
>> -       release_mem_region(pci_resource_start(pci_dev, 0),
>> -                          pci_resource_len(pci_dev, 0));
>> +       pci_release_regions(pci_dev);
>>   
>>          v4l2_device_unregister(&dev->v4l2_dev);
>> -       devm_kfree(&pci_dev->dev, dev);
>>   }
>>   
>>   static struct pci_driver tw5864_pci_driver = {
>> -- 
>> 2.30.2
>>
> 

