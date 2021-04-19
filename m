Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40FEC364133
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 14:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbhDSMDR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 08:03:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46906 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232272AbhDSMDQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 08:03:16 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2625499;
        Mon, 19 Apr 2021 14:02:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618833766;
        bh=yY08OZYa45z9YPN5D6lVXb0X5+U/a1cNg3s3ytr618I=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=qyMtMfQVimuX3a0dcRt9plhqpw+03ScVx5bwmDLn1lD98Rj/vzqgrF8i27HsTU2CC
         xZzlKcNTTxW/FKni2KxQQuAfGJE7iAY+t2uu9JMuHZUCkvINxkkV1XPBY4Phg49CnD
         64ksImTwj5/+SUDbAiBshxNuenhYENQbzxyEhkSw=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-20-tomi.valkeinen@ideasonboard.com>
 <YHwuZJJR6sbKcNsT@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 19/28] media: ti-vpe: cal: add cal_ctx_wr_dma_enable and
 fix a race
Message-ID: <2939e7aa-c797-a189-d5d2-0d62bb7bb436@ideasonboard.com>
Date:   Mon, 19 Apr 2021 15:02:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwuZJJR6sbKcNsT@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 16:04, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:48PM +0300, Tomi Valkeinen wrote:
>> I have not noticed any errors due to this, but the DMA configuration
>> looks racy. Setting the DMA mode bitfield in CAL_WR_DMA_CTRL supposedly
>> enables the DMA. However, the driver currently a) continues configuring
>> the DMA after setting the mode, and b) enables the DMA interrupts only
>> after setting the mode.
>>
>> This probably doesn't cause any issues as there should be no data coming
>> in to the DMA yet, but it's still better to fix this.
>>
>> Add a new function, cal_ctx_wr_dma_enable(), to set the DMA mode field,
>> and call that function only after the DMA config and the irq enabling
>> has been done.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index a1d173bd4613..0fef892854ef 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -409,8 +409,6 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
>>   		      CAL_WR_DMA_CTRL_YSIZE_MASK);
>>   	cal_set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
>>   		      CAL_WR_DMA_CTRL_DTAG_MASK);
>> -	cal_set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
>> -		      CAL_WR_DMA_CTRL_MODE_MASK);
>>   	cal_set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
>>   		      CAL_WR_DMA_CTRL_PATTERN_MASK);
>>   	cal_set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
>> @@ -442,6 +440,15 @@ void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr)
>>   	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->dma_ctx), addr);
>>   }
>>   
>> +static void cal_ctx_wr_dma_enable(struct cal_ctx *ctx)
>> +{
>> +	u32 val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx));
>> +
>> +	cal_set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
>> +		      CAL_WR_DMA_CTRL_MODE_MASK);
>> +	cal_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx), val);
>> +}
>> +
>>   static void cal_ctx_wr_dma_disable(struct cal_ctx *ctx)
>>   {
>>   	u32 val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx));
>> @@ -500,6 +507,8 @@ void cal_ctx_start(struct cal_ctx *ctx)
>>   		  CAL_HL_IRQ_WDMA_END_MASK(ctx->dma_ctx));
>>   	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(2),
>>   		  CAL_HL_IRQ_WDMA_START_MASK(ctx->dma_ctx));
>> +
>> +	cal_ctx_wr_dma_enable(ctx);
>>   }
> 
> You could also move the IRQ enabling before the call to
> cal_ctx_wr_dma_config(), and reorder the configuration in
> cal_ctx_wr_dma_config() to write CAL_WR_DMA_CTRL last. That would save a
> read-modify-write cycle.

Yes, I did that initially, but then ended up with a separate dma_enable 
call for clarity (I find it a bit misleading that cal_ctx_wr_dma_config 
would start the dma) and to have matching dma_enable and dma_disable calls.

  Tomi
