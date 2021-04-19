Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78530364113
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 13:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbhDSLy3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 07:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232272AbhDSLy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 07:54:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B338C06174A
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 04:53:58 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8833A499;
        Mon, 19 Apr 2021 13:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618833236;
        bh=TMWucD4WPRZWGzSXV9Rr3pTKletj/KnlpNUpenuly60=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=URs6ARLP8t/97B2GnckWgbOdbWt0LABbBx0ZTBhw5+Xkuxt4DzhJdjRnp7cnEmNNJ
         oqJ2WUeRlOuRhV2e6tFSlW6aMXonhYrIJI1fnK4dQ8/LPXCAM4O4BEK9RPAm7/5PAV
         XKvZUqtv9KvsDnPXqFjf9OOnwJ7A90529rWFq/C0=
Subject: Re: [PATCH 18/28] media: ti-vpe: cal: add 'use_pix_proc' field
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-19-tomi.valkeinen@ideasonboard.com>
 <YHwtdPrlkpXeyDP6@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <95b7e178-3448-e3b0-6fd7-93dfd932626b@ideasonboard.com>
Date:   Mon, 19 Apr 2021 14:53:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwtdPrlkpXeyDP6@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 16:00, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:47PM +0300, Tomi Valkeinen wrote:
>> We already have functions to reserve and release a pix proc unit, but we
>> always reserve such and the code expects the pix proc unit to be used.
>>
>> Add a new field, 'use_pix_proc', to indicate if the pix prox unit has
>> been reserved and should be used. Use the flag to skip programming pix
>> proc unit when not needed.
>>
>> Note that we still always set the use_pix_proc flag to true.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c | 10 +++++++---
>>   drivers/media/platform/ti-vpe/cal.h |  2 ++
>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index e397f59d3bbc..a1d173bd4613 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -473,13 +473,15 @@ int cal_ctx_prepare(struct cal_ctx *ctx)
>>   	}
>>   
>>   	ctx->pix_proc = ret;
>> +	ctx->use_pix_proc = true;
>>   
>>   	return 0;
>>   }
>>   
>>   void cal_ctx_unprepare(struct cal_ctx *ctx)
>>   {
>> -	cal_release_pix_proc(ctx->cal, ctx->pix_proc);
>> +	if (ctx->use_pix_proc)
>> +		cal_release_pix_proc(ctx->cal, ctx->pix_proc);
>>   }
>>   
>>   void cal_ctx_start(struct cal_ctx *ctx)
>> @@ -489,7 +491,8 @@ void cal_ctx_start(struct cal_ctx *ctx)
>>   
>>   	/* Configure the CSI-2, pixel processing and write DMA contexts. */
>>   	cal_ctx_csi2_config(ctx);
>> -	cal_ctx_pix_proc_config(ctx);
>> +	if (ctx->use_pix_proc)
>> +		cal_ctx_pix_proc_config(ctx);
>>   	cal_ctx_wr_dma_config(ctx);
>>   
>>   	/* Enable IRQ_WDMA_END and IRQ_WDMA_START. */
>> @@ -530,7 +533,8 @@ void cal_ctx_stop(struct cal_ctx *ctx)
>>   	cal_write(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx), 0);
>>   
>>   	/* Disable pix proc */
>> -	cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
>> +	if (ctx->use_pix_proc)
>> +		cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
>>   }
>>   
>>   /* ------------------------------------------------------------------
>> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
>> index 01e05e46e48d..409b7276a1fa 100644
>> --- a/drivers/media/platform/ti-vpe/cal.h
>> +++ b/drivers/media/platform/ti-vpe/cal.h
>> @@ -223,6 +223,8 @@ struct cal_ctx {
>>   	u8			cport;
>>   	u8			ppi_ctx;
>>   	u8			pix_proc;
>> +
>> +	bool use_pix_proc;
> 
> Indentation ?
> 
> How about turning pix_proc to a signed value, and using -1 to indicate
> it's not used ?

I considered that. But then, instead of "if (ctx->use_pix_proc)" I would 
have "if (ctx->use_pix_proc >= 0)". I think the former is better. And 
having a non-zero default value always makes me a bit uneasy.

  Tomi
