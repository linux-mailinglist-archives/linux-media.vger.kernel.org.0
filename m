Return-Path: <linux-media+bounces-20426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C199B3426
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC4CAB234D3
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 14:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29141DE2D5;
	Mon, 28 Oct 2024 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pRPrwI11"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632AF1DD88F
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730127497; cv=none; b=FHq4oeCKN9tbJ0NLUEOA4nLD2X7FxluCltr3BmDGigaGx+TTYYgIfyCC23WiXhOWMs1q4gUYd++2du52Gej2oX9sCYxKhD1UlrphQofVgs3h9mUwdQ7y44VfSGZxgN2Xf7e4H/KJ0dE3n5rmt0jDFm68gAnRO/NYmdCT7nkoETU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730127497; c=relaxed/simple;
	bh=+Vf2HYNrH6isM+S+2H64QOdU/e6QAm2KbJmcNUjlXWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ARoxuCujbN8dRy/wU0FF3rwBp0IhoxbPxVQIBxnFk4Vb742paQe4EtgmIOWnXy5TxwVm8GbrO8h2KtuM3CwLQQUaGWWyowF0fWIR8f57utBge/8lhErueG6NK+QiRZIfAQ4RTWfql/4t//h/AmO/Bw7yjBi5+QaGi298ysPseIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pRPrwI11; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B0A1641;
	Mon, 28 Oct 2024 15:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730127490;
	bh=+Vf2HYNrH6isM+S+2H64QOdU/e6QAm2KbJmcNUjlXWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pRPrwI11erJcOGhKRn9RQPNeRQ2woKpee6/blbfkk7a4Qr44FWNWXN3OFTa1HFLlB
	 kRMRAk+uOiNCj151OGxzuS0eyH103sn+mK4cJElYIA01zULo4vCzkbiqa/9oLdZRP6
	 hitSWWjboeCZ00NuEThJsQqBO/sKMB9t60OljeNM=
Message-ID: <50cb01e5-11f3-4a9c-bb0a-ddb67b59eccb@ideasonboard.com>
Date: Mon, 28 Oct 2024 20:28:07 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dw100: Enable dynamic vertex map
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20241022063155.506191-1-umang.jain@ideasonboard.com>
 <a73be13d-a2ed-48cd-a84e-805fb379dc09@oss.nxp.com>
 <20241027144040.GI6519@pendragon.ideasonboard.com>
 <4a443d84-7566-4bed-820b-1e9c07248732@ideasonboard.com>
 <20241028143212.GG24052@pendragon.ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20241028143212.GG24052@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent,

On 28/10/24 8:02 pm, Laurent Pinchart wrote:
> Hi Umang,
>
> On Mon, Oct 28, 2024 at 12:57:52PM +0530, Umang Jain wrote:
>> On 27/10/24 8:10 pm, Laurent Pinchart wrote:
>>> On Sat, Oct 26, 2024 at 09:52:43PM +0200, Xavier Roumegue wrote:
>>>> On 10/22/24 8:31 AM, Umang Jain wrote:
>>>>> Currently, vertex maps cannot be updated dynamically while dw100
>>>>> is streaming. This patch enables the support to update the vertex
>>>>> map dynamically at runtime.
>>>>>
>>>>> To support this functionality, we need to allocate and track two
>>>>> sets of DMA-allocated vertex maps, one for the currently applied map
>>>>> and another for the updated (pending) map. Before the start of next
>>>>> frame, if a new user-supplied vertex map is available, the hardware
>>>>> mapping is changed to use new vertex map, thus enabling the user to
>>>>> update the vertex map at runtime.
>>> How do you synchronize the new map with the jobs ? That doesn't seem to
>>> be supported by the patch, is it a feature that you don't need ?
>> First question around running jobs - isn't the DW100 dewarper run with 1
>> src buffer and 1 dst buffer per context ? Do we need addiitonal
>> synchronisation there? I think same point was mentioned by you for
>> scaler crop setting but maybe I am missing something to see here.
>>
>>   From the description of .job_ready():
>>
>>    * @job_ready:  optional. Should return 0 if the driver does not have a job
>>    *              fully prepared to run yet (i.e. it will not be able to finish a
>>    *              transaction without sleeping). If not provided, it will be
>>    *              assumed that one source and one destination buffer are all
>>    *              that is required for the driver to perform one full transaction.
>>    *              This method may not sleep.
>>
>> And when the IRQ handler completes, it calls to v4l2_m2m_job_finish
>> which then schedules the next job through v4l2_m2m_schedule_next_job()
>>
>> So I assumed that, .device_run() and ... in the IRQ handler (call
>> to v4l2_m2m_job_finish) will be counted as one job transaction - since
>> we are not working with multiple source and destination buffers for one
>> transaction.
> Correct, but userspace can queue multiple jobs by queuing multiple
> output and capture buffers, one of each per job. It doesn't have to wait
> for the completion of a job before starting the next one.

Indeed, it seems to be possible - nothing is preventing the driver to 
accept multiple jobs

>
>> When the next job is started (i.e. dw100_start()) the vertex map index
>> which is updated, is programmed to the register. That's is why this
>> patch introduced two vertex maps for tracking - one which is applied and
>> other one which can be updated by user.
> When multiple jobs are queued, setting the control will become
> asynchronous relative to the jobs, you won't know to which job the new
> map applies. This is due to the asynchronous nature of V4L2 controls.
> The way to synchronize controls with jobs would be to use the request
> API, which adds complexity. Another option is to avoid queuing multiple
> jobs, which is a bit of a workaround that results in reduce throughput.
>
> What I wonder, and would like to have your feedback on, is whether
> synchronous operation is needed in some of the DW100 use cases (and in
> particular in your use cases).

We are probably operating from the view point that controls are applied 
for the next job that the the DW100 processes. But indeed, that's not 
the case due to the async V4L2 controls, as you said.

 From per-frame metadata reporting purposes - I think we will need to 
have synchronizing mechanism that the driver undertakes, to actually 
match that view point.

>
>>>>> We should ensure no race occurs when the vertex map is updated multiple
>>>>> times when a frame is processing. Hence, vertex map is never updated to
>>>>> the applied vertex map index in .s_ctrl(). It is always updated on the
>>>>> pending vertex map slot, with `maps_mutex` lock held. `maps_mutex` lock
>>>>> is also held when the pending vertex map is applied to the hardware in
>>>>> dw100_start().
>>>>>
>>>>> Ability to update the vertex map at runtime, enables abritrary rotation
>>> s/abritrary/arbitrary/
>>>
>>>>> and digital zoom features for the input frames, through the dw100
>>>>> hardware.
>>>>>
>>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>>>> ---
>>>>>     drivers/media/platform/nxp/dw100/dw100.c | 73 ++++++++++++++++++------
>>>>>     1 file changed, 56 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
>>>>> index 54ebf59df682..42712ccff754 100644
>>>>> --- a/drivers/media/platform/nxp/dw100/dw100.c
>>>>> +++ b/drivers/media/platform/nxp/dw100/dw100.c
>>>>> @@ -83,6 +83,11 @@ struct dw100_q_data {
>>>>>     	struct v4l2_rect		crop;
>>>>>     };
>>>>>     
>>>>> +struct dw100_map {
>>>>> +	unsigned int *map;
>>>>> +	dma_addr_t map_dma;
>>> I would have called the field just 'dma' as it's already qualified by
>>> the structure name or the field name in dw100_ctx.
>>>
>>>>> +};
>>>>> +
>>>>>     struct dw100_ctx {
>>>>>     	struct v4l2_fh			fh;
>>>>>     	struct dw100_device		*dw_dev;
>>>>> @@ -92,12 +97,14 @@ struct dw100_ctx {
>>>>>     	struct mutex			vq_mutex;
>>>>>     
>>>>>     	/* Look Up Table for pixel remapping */
>>>>> -	unsigned int			*map;
>>>>> -	dma_addr_t			map_dma;
>>>>> +	struct dw100_map		maps[2];
>>>>> +	unsigned int			applied_map_id;
>>>>>     	size_t				map_size;
>>>>>     	unsigned int			map_width;
>>>>>     	unsigned int			map_height;
>>>>>     	bool				user_map_is_set;
>>>>> +	bool				user_map_is_updated;
>>>>> +	struct mutex			maps_mutex;
>>>>>     
>>>>>     	/* Source and destination queue data */
>>>>>     	struct dw100_q_data		q_data[2];
>>>>> @@ -308,24 +315,31 @@ static int dw100_create_mapping(struct dw100_ctx *ctx)
>>>>>     {
>>>>>     	u32 *user_map;
>>>>>     
>>>>> -	if (ctx->map)
>>>>> -		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
>>>>> -				  ctx->map, ctx->map_dma);
>>>>> +	for (unsigned int i = 0; i < 2; i++) {
>>> 	for (unsigned int i = 0; i < ARRAY_SIZE(ctx->maps); i++) {
>>> 		struct dw100_map *map = &ctx->maps[i];
>>>
>>> and use map below.
>>>
>>>
>>>>> +		if (ctx->maps[i].map)
>>>>> +			dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
>>>>> +					  ctx->maps[i].map, ctx->maps[i].map_dma);
>>>>>     
>>>>> -	ctx->map = dma_alloc_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
>>>>> -				      &ctx->map_dma, GFP_KERNEL);
>>>>> +		ctx->maps[i].map = dma_alloc_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
>>>>> +						      &ctx->maps[i].map_dma, GFP_KERNEL);
>>>>>     
>>>>> -	if (!ctx->map)
>>>>> -		return -ENOMEM;
>>>>> +		if (!ctx->maps[i].map)
>>>>> +			return -ENOMEM;
>>>>> +	}
>>>>>     
>>>>>     	user_map = dw100_get_user_map(ctx);
>>>>> -	memcpy(ctx->map, user_map, ctx->map_size);
>>>>> +
>>>>> +	mutex_lock(&ctx->maps_mutex);
>>>>> +	ctx->applied_map_id = 0;
>>>>> +	memcpy(ctx->maps[ctx->applied_map_id].map, user_map, ctx->map_size);
>>>>> +	mutex_unlock(&ctx->maps_mutex);
>>>>>     
>>>>>     	dev_dbg(&ctx->dw_dev->pdev->dev,
>>>>>     		"%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n",
>>>>>     		ctx->map_width, ctx->map_height,
>>>>>     		ctx->user_map_is_set ? "user" : "identity",
>>>>> -		&ctx->map_dma, ctx->map,
>>>>> +		&ctx->maps[ctx->applied_map_id].map_dma,
>>>>> +		ctx->maps[ctx->applied_map_id].map,
>>>>>     		ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width,
>>>>>     		ctx->q_data[DW100_QUEUE_DST].pix_fmt.height,
>>>>>     		ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width,
>>>>> @@ -336,10 +350,12 @@ static int dw100_create_mapping(struct dw100_ctx *ctx)
>>>>>     
>>>>>     static void dw100_destroy_mapping(struct dw100_ctx *ctx)
>>>>>     {
>>>>> -	if (ctx->map) {
>>>>> -		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
>>>>> -				  ctx->map, ctx->map_dma);
>>>>> -		ctx->map = NULL;
>>>>> +	for (unsigned int i = 0; i < 2; i++) {
>>> 	for (unsigned int i = 0; i < ARRAY_SIZE(ctx->maps); i++) {
>>> 		struct dw100_map *map = &ctx->maps[i];
>>>
>>> and use map below.
>>>
>>>>> +		if (ctx->maps[i].map)
>>>>> +			dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
>>>>> +					  ctx->maps[i].map, ctx->maps[i].map_dma);
>>>>> +
>>>>> +		ctx->maps[i].map = NULL;
>>>>>     	}
>>>>>     }
>>>>>     
>>>>> @@ -350,6 +366,15 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
>>>>>     
>>>>>     	switch (ctrl->id) {
>>>>>     	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
>>>>> +		u32 *user_map = ctrl->p_new.p_u32;
>>>> A warning to fix here.
>>>>
>>>>> +		unsigned int id;
>>>>> +
>>>>> +		mutex_lock(&ctx->maps_mutex);
>>>>> +		id = ctx->applied_map_id ? 0 : 1;
>>>>> +		memcpy(ctx->maps[id].map, user_map, ctx->map_size);
>>>>> +		ctx->user_map_is_updated = true;
>>>> If you call the control before to start the stream, the dma mapping is
>>>> not yet done(dw100_create_mapping not yet called). Hence, copying the
>>>> user map to a NULL pointer.
>>> The maps could be allocated in dw100_open() when creating the context.
>>> That would likely require moving the initialization of ctx->map_width,
>>> ctx->map_height and ctx->map_size as well. The handling of the identity
>>> map would probably need to be rewritten too.
>>>
>>>>> +		mutex_unlock(&ctx->maps_mutex);
>>>>> +
>>>>>     		ctx->user_map_is_set = true;
>>>>>     		break;
>>>>>     	}
>>>>> @@ -655,6 +680,8 @@ static int dw100_open(struct file *file)
>>>>>     
>>>>>     	v4l2_fh_add(&ctx->fh);
>>>>>     
>>>>> +	mutex_init(&ctx->maps_mutex);
>>>>> +
>>>>>     	return 0;
>>>>>     
>>>>>     err:
>>>>> @@ -675,6 +702,7 @@ static int dw100_release(struct file *file)
>>>>>     	v4l2_ctrl_handler_free(&ctx->hdl);
>>>>>     	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>>>>>     	mutex_destroy(&ctx->vq_mutex);
>>>>> +	mutex_destroy(&ctx->maps_mutex);
>>>>>     	kfree(ctx);
>>>>>     
>>>>>     	return 0;
>>>>> @@ -1453,8 +1481,19 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>>>>>     	dw100_hw_set_destination(dw_dev, &ctx->q_data[DW100_QUEUE_DST],
>>>>>     				 ctx->q_data[DW100_QUEUE_SRC].fmt,
>>>>>     				 &out_vb->vb2_buf);
>>>>> -	dw100_hw_set_mapping(dw_dev, ctx->map_dma,
>>>>> -			     ctx->map_width, ctx->map_height);
>>>>> +
>>>>> +
>>>>> +	mutex_lock(&ctx->maps_mutex);
>>>>> +	if (ctx->user_map_is_updated) {
>>>> The hardware register must unconditionally be updated while starting a
>>>> new context, as a v4l2 m2m supports multi context operations. Otherwise,
>>>> you may be running with the user mapping used by the previous context.
>>>>
>>>> Moreover, the hardware mapping will not be set in case you use the
>>>> driver as a simple scaler without user mapping, which causes the process
>>>> to hang as the run does not start and never completes.
>>>>
>>>>> +		unsigned int id = ctx->applied_map_id ? 0 : 1;
>>>>> +
>>>>> +		dw100_hw_set_mapping(dw_dev, ctx->maps[id].map_dma,
>>>>> +				     ctx->map_width, ctx->map_height);
>>>>> +		ctx->applied_map_id = id;
>>>>> +		ctx->user_map_is_updated = false;
>>>>> +	}
>>>>> +	mutex_unlock(&ctx->maps_mutex);
>>>>> +
>>>>>     	dw100_hw_enable_irq(dw_dev);
>>>>>     	dw100_hw_dewarp_start(dw_dev);
>>>>>     
>>>> It sounds as this patch requires a collaborative application for running
>>>> well. All my simple tests failed.
>>>>
>>>> You can test a simple scaler/pixfmt conversion operation with v4l2 utils:
>>>>
>>>>
>>>> v4l2-ctl \
>>>> -d 0 \
>>>> --set-fmt-video-out width=640,height=480,pixelformat=NV12,field=none \
>>>> --set-fmt-video width=640,height=480,pixelformat=NV21,field=none \
>>>> --stream-out-pattern 3 \
>>>> --set-selection-output\
>>>> target=crop,top=0,left=0,width=640,height=480,flags= \
>>>> --stream-count 100 \
>>>> --stream-mmap \
>>>> --stream-out-mmap


