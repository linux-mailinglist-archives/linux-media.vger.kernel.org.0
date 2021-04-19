Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912E03640BE
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 13:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238781AbhDSLq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 07:46:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46612 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238774AbhDSLq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 07:46:26 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21927D4A;
        Mon, 19 Apr 2021 13:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618832754;
        bh=Dam3k33WJG2Z/zemgekG2nmABo03nrv1peQwp6PX+e8=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=BpkaFtUS8cOvrW20BGOevvzRTOCF2hphQaNBNO5I7rGwqg+wzL7UXowsContkpmvz
         hk5J2TPdjCarol9TqjjhetRyTXR7TmlACqWmAS+SqAOygkS+0DDa6LWDJ0EPclQuhc
         0ymACZuuf4U4MG+nFBCQrI2gZ5oQZUELdZEgY5VY=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-18-tomi.valkeinen@ideasonboard.com>
 <YHwtI+WIlHWCBEH5@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 17/28] media: ti-vpe: cal: allocate pix proc dynamically
Message-ID: <5e91c272-67a5-ed76-63c3-6c0972d42cf7@ideasonboard.com>
Date:   Mon, 19 Apr 2021 14:45:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwtI+WIlHWCBEH5@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 15:59, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:46PM +0300, Tomi Valkeinen wrote:
>> CAL has 4 pixel processing units but the units are not needed e.g. for
>> metadata. As we could be capturing 4 pixel streams and 4 metadata
>> streams, i.e. using 8 DMA contexts, we cannot assign a pixel processing
>> unit to every DMA context. Instead we need to reserve a pixel processing
>> unit only when needed.
>>
>> Add functions to reserve and release a pix proc unit, and use them in
>> cal_ctx_prepare/unprepare. Note that for the time being we still always
>> reserve a pix proc unit.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c | 44 +++++++++++++++++++++++++++--
>>   drivers/media/platform/ti-vpe/cal.h |  2 ++
>>   2 files changed, 44 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index a6ca341c98bd..e397f59d3bbc 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -290,6 +290,37 @@ void cal_quickdump_regs(struct cal_dev *cal)
>>    * ------------------------------------------------------------------
>>    */
>>   
>> +#define CAL_MAX_PIX_PROC 4
>> +
>> +static int cal_reserve_pix_proc(struct cal_dev *cal)
>> +{
>> +	unsigned long ret;
>> +
>> +	spin_lock(&cal->v4l2_dev.lock);
>> +
>> +	ret = find_first_zero_bit(&cal->reserve_pix_proc_mask, CAL_MAX_PIX_PROC);
>> +
>> +	if (ret == CAL_MAX_PIX_PROC) {
>> +		spin_unlock(&cal->v4l2_dev.lock);
>> +		return -ENOSPC;
>> +	}
>> +
>> +	cal->reserve_pix_proc_mask |= BIT(ret);
>> +
>> +	spin_unlock(&cal->v4l2_dev.lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static void cal_release_pix_proc(struct cal_dev *cal, unsigned int pix_proc_num)
>> +{
>> +	spin_lock(&cal->v4l2_dev.lock);
>> +
>> +	cal->reserve_pix_proc_mask &= ~BIT(pix_proc_num);
>> +
>> +	spin_unlock(&cal->v4l2_dev.lock);
>> +}
>> +
>>   static void cal_ctx_csi2_config(struct cal_ctx *ctx)
>>   {
>>   	u32 val;
>> @@ -433,12 +464,22 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
>>   
>>   int cal_ctx_prepare(struct cal_ctx *ctx)
>>   {
>> +	int ret;
>> +
>> +	ret = cal_reserve_pix_proc(ctx->cal);
>> +	if (ret < 0) {
>> +		ctx_err(ctx, "Failed to reserve pix proc: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ctx->pix_proc = ret;
> 
> I wonder if this is the right place to allocate a context, it may be
> better to reject invalid pipeline configurations earlier on. It's fine
> for now, we can revisit this in subsequent patches, with the full
> multiplexed streams implementation.

Earlier than what? Even before cal_start_streaming()? I guess we could 
do this in cal_vb2_ioctl_reqbufs and cal_vb2_ioctl_create_bufs, but then 
I'm not sure where to free the pix proc.

> Another option would be to allocate the context in cal_ctx_create() for
> now, with a call to cal_reserve_pix_proc(), and move it later in the
> context of the patch series that implements support for multiplexed
> streams.

For now cal_reserve_pix_proc() will always succeed, as we have 4 pix 
procs but only ever allocate 2 at the same time. If there is a better 
place to do this for multiplexed streams, which is not available yet at 
this patch, then I agree, we could just do this in cal_ctx_create until 
we have that better place available.

>> +
>>   	return 0;
>>   }
>>   
>>   void cal_ctx_unprepare(struct cal_ctx *ctx)
>>   {
>> -
>> +	cal_release_pix_proc(ctx->cal, ctx->pix_proc);
>>   }
>>   
>>   void cal_ctx_start(struct cal_ctx *ctx)
>> @@ -872,7 +913,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
>>   	ctx->dma_ctx = inst;
>>   	ctx->ppi_ctx = inst;
>>   	ctx->cport = inst;
>> -	ctx->pix_proc = inst;
>>   
>>   	ret = cal_ctx_v4l2_init(ctx);
>>   	if (ret)
>> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
>> index c34b843d2019..01e05e46e48d 100644
>> --- a/drivers/media/platform/ti-vpe/cal.h
>> +++ b/drivers/media/platform/ti-vpe/cal.h
>> @@ -188,6 +188,8 @@ struct cal_dev {
>>   	struct media_device	mdev;
>>   	struct v4l2_device	v4l2_dev;
>>   	struct v4l2_async_notifier notifier;
>> +
>> +	unsigned long reserve_pix_proc_mask;
> 
> I would have named this used_pix_proc_mask.

The name has a typo, and should actually be 'reserved_pix_proc_mask'. 
Doesn't 'used' mean that something was used, but may not be used 
anymore? So... in_use_pix_proc_mask? 'active'? I don't know, I like 
'reserved' best here.

  Tomi
