Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D29265201
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 23:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgIJVGR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 17:06:17 -0400
Received: from foss.arm.com ([217.140.110.172]:37582 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731060AbgIJOgK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 10:36:10 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1CB8113E;
        Thu, 10 Sep 2020 07:36:09 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 314173F66E;
        Thu, 10 Sep 2020 07:36:09 -0700 (PDT)
Subject: Re: [PATCH] media: venus: core: Drop local dma_parms
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com>
 <c474d49b-7800-28c6-d73b-20a6d2258e9e@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <8781a8eb-e472-0201-b773-e8b82325675c@arm.com>
Date:   Thu, 10 Sep 2020 15:36:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c474d49b-7800-28c6-d73b-20a6d2258e9e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-09-04 21:26, Stanimir Varbanov wrote:
> Hi Robin,
> 
> Thanks for the patch!
> 
> On 9/4/20 12:14 AM, Robin Murphy wrote:
>> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
>> for platform devices"), struct platform_device already provides a
>> dma_parms structure, so we can save allocating another one.
>>
>> Also the DMA segment size is simply a size, not a bitmask.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/media/platform/qcom/venus/core.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index 203c6538044f..2fa9275d75ff 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -226,13 +226,7 @@ static int venus_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (!dev->dma_parms) {
>> -		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
>> -					      GFP_KERNEL);
>> -		if (!dev->dma_parms)
>> -			return -ENOMEM;
>> -	}
>> -	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
>> +	dma_set_max_seg_size(dev, UINT_MAX);
> 
> To be correct we should check for EIO error?

Well, half the point of 9495b7e92f71 was to make sure that 
dma_set_max_seg_size() cannot fail for platform drivers. Thus if we're 
taking advantage of that change to make the assumption that we never 
need to allocate dma_parms here, then an error check would be redundant 
by definition ;)

Robin.

> 
>>   
>>   	INIT_LIST_HEAD(&core->instances);
>>   	mutex_init(&core->lock);
>>
> 
