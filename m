Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CB225D57A
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 11:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729950AbgIDJyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 05:54:39 -0400
Received: from foss.arm.com ([217.140.110.172]:47448 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729824AbgIDJyj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 05:54:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF624101E;
        Fri,  4 Sep 2020 02:54:38 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0C7F3F66F;
        Fri,  4 Sep 2020 02:54:37 -0700 (PDT)
Subject: Re: [PATCH] media: rcar-fcp: Drop local dma_parms
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20426a75cba769372c2f3f12f44a477e6fc8e979.1599167414.git.robin.murphy@arm.com>
 <20200903215335.GH6492@pendragon.ideasonboard.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <8217e7ee-7162-e02a-87ba-4b5be30360b6@arm.com>
Date:   Fri, 4 Sep 2020 10:54:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903215335.GH6492@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-09-03 22:53, Laurent Pinchart wrote:
> Hi Robin,
> 
> Thank you for the patch.
> 
> On Thu, Sep 03, 2020 at 10:12:27PM +0100, Robin Murphy wrote:
>> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
>> for platform devices"), struct platform_device already provides a
>> dma_parms structure, so we can save allocating another one.
>>
>> Also the DMA segment size is simply a size, not a bitmask.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> Looks good to me, I like the simplification.
> 
> Should I get this upstream, or do you have other similar patches
> tree-wide that you plan to get merged in one go ?

No, there's no dependency here - I did these as individual per-driver 
patches so that they can be applied however, please go ahead :)

Thanks,
Robin.

>> ---
>>   drivers/media/platform/rcar-fcp.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
>> index 5c6b00737fe7..13a84c7e3586 100644
>> --- a/drivers/media/platform/rcar-fcp.c
>> +++ b/drivers/media/platform/rcar-fcp.c
>> @@ -22,7 +22,6 @@
>>   struct rcar_fcp_device {
>>   	struct list_head list;
>>   	struct device *dev;
>> -	struct device_dma_parameters dma_parms;
>>   };
>>   
>>   static LIST_HEAD(fcp_devices);
>> @@ -138,8 +137,7 @@ static int rcar_fcp_probe(struct platform_device *pdev)
>>   
>>   	fcp->dev = &pdev->dev;
>>   
>> -	fcp->dev->dma_parms = &fcp->dma_parms;
>> -	dma_set_max_seg_size(fcp->dev, DMA_BIT_MASK(32));
>> +	dma_set_max_seg_size(fcp->dev, UINT_MAX);
>>   
>>   	pm_runtime_enable(&pdev->dev);
>>   
> 
