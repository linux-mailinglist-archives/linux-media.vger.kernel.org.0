Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC604363E1E
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 11:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237649AbhDSJCU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 05:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238228AbhDSJCU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 05:02:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9424C06174A
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 02:01:50 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 204EAD4A;
        Mon, 19 Apr 2021 11:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618822909;
        bh=9rzXy2eK0HCOsB7hZ7JWKkolWW9WFuoW2sWb2GrBGHE=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=Es4dxalxWRftSlsY9fdyvvH2Bm1LAStskU1+EjuMB208OsJO77lm+SsX2c1S4Ra/I
         sos6Q4RwTDrz8S5jon+RvdE8EEfM7wYQmdNONRH+al4HA+F351j6QOit3ZFFbUkXak
         VdvtakLmAiH20WKytk1kvBY2/5/ocuSUTnPeHt74=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-10-tomi.valkeinen@ideasonboard.com>
 <YHwjdM92XD+Ml5Kq@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 09/28] media: ti-vpe: cal: Add PPI context
Message-ID: <9e573c64-d724-e4da-8f17-d3eed7bd8f39@ideasonboard.com>
Date:   Mon, 19 Apr 2021 12:01:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwjdM92XD+Ml5Kq@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 15:17, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:38PM +0300, Tomi Valkeinen wrote:
>> CAL has 8 PPI contexts per PHY, which are used to tag the incoming data.
>> The current driver only uses the first PPI, but we need to support all
>> of them to implement multi-stream support.
>>
>> Add a ppi_ctx field to cal_ctx, which indicates which of the 8 PPI
>> contexts is used for the particular cal_ctx. Also clean up the PPI
>> context register macros to take the PPI context number as a parameter.
> 
> As far as I can tell, the TRMs don't mention "PPI contexts". PPI stands
> for PHY Protocol Interface, it does identify a particular physical
> interface. Would it be better to rename ppi_ctx to csi2_ctx ?  This
> would match the register names too.

At least DRA76 TRM says, for example, these:

"Number of contexts for PPI interface #0"
"The PPI context IDs of interleaved streams must match."
"Each PPI FSM has 8 copies of the CAL_CSI2_CTXy_l (y = [0 to 7],
CAL_CSI2_CTX0_l through CAL_CSI2_CTX7_l) state registers (that is, 
contexts)."

It's true changing ppi_ctx to csi2_ctx would match the register names 
neatly. But then again, the TRM doesn't mention CSI2 context, as far as 
I can tell.

However, I think csi2_ctx is more understandable than ppi_ctx. So 
perhaps I'll change it.

>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c      | 10 ++++++----
>>   drivers/media/platform/ti-vpe/cal.h      |  1 +
>>   drivers/media/platform/ti-vpe/cal_regs.h | 18 ++----------------
>>   3 files changed, 9 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index 3d57aedbee0a..c550eeb27e79 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -294,7 +294,7 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
>>   {
>>   	u32 val;
>>   
>> -	val = cal_read(ctx->cal, CAL_CSI2_CTX0(ctx->index));
>> +	val = cal_read(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx));
>>   	cal_set_field(&val, ctx->cport, CAL_CSI2_CTX_CPORT_MASK);
>>   	/*
>>   	 * DT type: MIPI CSI-2 Specs
>> @@ -310,9 +310,10 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
>>   	cal_set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
>>   	cal_set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
>>   		      CAL_CSI2_CTX_PACK_MODE_MASK);
>> -	cal_write(ctx->cal, CAL_CSI2_CTX0(ctx->index), val);
>> -	ctx_dbg(3, ctx, "CAL_CSI2_CTX0(%d) = 0x%08x\n", ctx->index,
>> -		cal_read(ctx->cal, CAL_CSI2_CTX0(ctx->index)));
>> +	cal_write(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx), val);
>> +	ctx_dbg(3, ctx, "CAL_CSI2_CTX%d(%d) = 0x%08x\n",
>> +		ctx->phy->instance, ctx->ppi_ctx,
>> +		cal_read(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx)));
>>   }
>>   
>>   static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
>> @@ -854,6 +855,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
>>   	ctx->cal = cal;
>>   	ctx->phy = cal->phy[inst];
>>   	ctx->index = inst;
>> +	ctx->ppi_ctx = inst;
> 
> To avoid a functional change in this patch, should this be = 0 ?

Define "functional change" =). The context used may be different after 
this patch, but there's no change in how the HW functions. I changed it 
to 'inst' here, instead of keeping it as 0, as this works fine for both 
the legacy and new functionality and thus I don't need to remember to 
change it later.

I should mention this in the commit desc, though.

  Tomi
