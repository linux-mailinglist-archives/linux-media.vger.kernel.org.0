Return-Path: <linux-media+bounces-32297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E531AB33D5
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 11:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7322F188C77B
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E3825CC6E;
	Mon, 12 May 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cLePiQvH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B933225A63D;
	Mon, 12 May 2025 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042780; cv=none; b=dOsL/CINYHyNfP8SO3BBJWvzoPPejZeEWbDVqnQKKW9H3dheB/wkBRgBRyYWit43ISFceeHOb+65qARSsfZ5Lslbz1KwivcQDWctB0Hyjt3roW/N8mvjVzE8ioglXEf9raQaBDlqlAou3izadxE8C/tDrdML3hgoh2CKO/dQAfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042780; c=relaxed/simple;
	bh=8pIofJX98o0cdPyYqZkkS+G0EsgCpIFSgSko0exkC/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIIejRLYXKkDosECJkiVkCckIKGYjg4bQJ6XHB0lWm4FGMWqXdkv/LinUlhst8ROHg4kJB4OLYp6v/ANciPXcO+ie/WV4bmIjLbChtzGGt+G1sydBE6Ux7O2QIWuhvCgLk+sUDHh8DhBWz2faDsA+IzomVXcSjQhrUgqN9kr2V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cLePiQvH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747042769;
	bh=8pIofJX98o0cdPyYqZkkS+G0EsgCpIFSgSko0exkC/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cLePiQvHIO7Or+Bk1M9a799SsIP2jkdNVY5Yma0C2x0XderpsBMLejrR+Xpp+qymN
	 ytpRRUVP3+rDC2jknnWTB6NvWKfO+vkRQj0E0PlekQPT8Pav03OV9efpX+IoDJ82Ia
	 rdZbzAWR7WcGb5/S+vG+eOqVuhQlid4f4NaLHPi8IgMv+wcpWkMedftHdyvyBKnqMl
	 jbolJjGDV8+TXEi5jFP843u9qKahOIAIB9SbwrOufMcvoGPx9pSS+eBBHx3IVV9vJF
	 RELmmQ5kacueviEq1rKW4weL+Eiju9OgzdT5jkUfPhkUW8THOdNd1C3XRF7SjYadve
	 Wd9K47Oibm+QQ==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D32017E049F;
	Mon, 12 May 2025 11:39:28 +0200 (CEST)
Message-ID: <b9135684-5623-4d87-94ea-b9699b7fec44@collabora.com>
Date: Mon, 12 May 2025 11:39:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] media: rockchip: add a driver for the rockchip
 camera interface
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hans@jjverkuil.nl>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-6-d2f5fbee1551@collabora.com>
 <fx5zweayuzo2vcov7i5d6itlizw4bwmr3wwbd4m6mdjsiou5zb@osl3u2ijv3uj>
 <90192c74-f5ca-404b-8b95-3df0819e4bc9@collabora.com>
 <pmjd65zzypo7kyi3mkpqd4pf6dqz5ssxxhwnicav57trzxt3ni@ph665okjfo2s>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <pmjd65zzypo7kyi3mkpqd4pf6dqz5ssxxhwnicav57trzxt3ni@ph665okjfo2s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

On 5/7/25 11:36, Mehdi Djait wrote:
> Hi Michael,
> 
> On Tue, May 06, 2025 at 10:32:59PM +0200, Michael Riesch wrote:
>> Hi Mehdi,
>>
>> Thanks for your review!
>>
>> On 5/6/25 12:37, Mehdi Djait wrote:
>>> Hi Michael,
>>>
>>> Thank you for the patch!
>>>
>>> Is it possible to sent the v4l2-compliance output in the next version ?

Missed that remark. Yes, I'll take care to send the output (maybe as
reply to v7, though).

>>>
>>> On Wed, Apr 30, 2025 at 11:15:55AM +0200, Michael Riesch via B4 Relay wrote:
>>>> From: Michael Riesch <michael.riesch@wolfvision.net>
>>>>
>>>
>>> SNIP
>>>
>>>> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
>>>> +{
>>>> +	struct device *dev = ctx;
>>>> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
>>>> +	struct rkcif_stream *stream;
>>>> +	u32 intstat, lastline, lastpix, cif_frmst;
>>>> +	irqreturn_t ret = IRQ_NONE;
>>>> +
>>>> +	if (!rkcif->match_data->dvp)
>>>> +		return ret;
>>>> +
>>>> +	intstat = cif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
>>>> +	cif_frmst = cif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
>>>> +	lastline = RKCIF_FETCH_Y(cif_dvp_read(rkcif, RKCIF_DVP_LAST_LINE));
>>>> +	lastpix = RKCIF_FETCH_Y(cif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
>>>> +
>>>> +	if (intstat & RKCIF_INTSTAT_FRAME_END) {
>>>> +		cif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
>>>> +			      RKCIF_INTSTAT_FRAME_END_CLR |
>>>> +				      RKCIF_INTSTAT_LINE_END_CLR);
>>>> +
>>>> +		stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
>>>> +
>>>> +		if (stream->stopping) {
>>>> +			cif_dvp_stop_streaming(stream);
>>>> +			wake_up(&stream->wq_stopped);
>>>> +			return IRQ_HANDLED;
>>>> +		}
>>>> +
>>>> +		if (lastline != stream->pix.height) {
>>>> +			v4l2_err(&rkcif->v4l2_dev,
>>>> +				 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
>>>> +				 intstat, cif_frmst, lastpix, lastline);
>>>> +
>>>> +			cif_dvp_reset_stream(rkcif);
>>>> +		}
>>>> +
>>>> +		rkcif_stream_pingpong(stream);
>>>> +
>>>> +		ret = IRQ_HANDLED;
>>>
>>> just return IRQ_HANDLED like above ?
>>
>> I think I'll go along Bryan's suggestion to make it more consistent.
>>
>>>
>>>> +	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +int rkcif_dvp_register(struct rkcif_device *rkcif)
>>>> +{
>>>> +	struct rkcif_interface *interface;
>>>> +	int ret, i;
>>>> +
>>>> +	if (!rkcif->match_data->dvp)
>>>> +		return 0;
>>>> +
>>>> +	interface = &rkcif->interfaces[RKCIF_DVP];
>>>> +	interface->index = RKCIF_DVP;
>>>> +	interface->type = RKCIF_IF_DVP;
>>>> +	interface->in_fmts = rkcif->match_data->dvp->in_fmts;
>>>> +	interface->in_fmts_num = rkcif->match_data->dvp->in_fmts_num;
>>>> +	interface->set_crop = rkcif_dvp_set_crop;
>>>> +	ret = rkcif_interface_register(rkcif, interface);
>>>> +	if (ret)
>>>> +		return 0;
>>> 		|
>>> 		+-> Copy-paste error ?
>>
>> Hm. It's not a mistake. But maybe it is a bit misleading.
>>
>> The point here is that if something fails with registering the DVP, the
>> driver may continue to register other entities, such as the MIPI capture
>> thing.
> 
> what if you want to register the DVP interface and it fails ? Maybe two
> separate function for rkcif_{dvp,mipi}_interface_register(), call one of
> them based on match_data and verify the ret code --> fail if non-zero ?

Seems I prepared everything in rkcif-dev.c, but failed to complete it in
rkcif_{dvp,mipi}_capture :-/

rkcif_register() in rkcif-dev.c tolerates -ENODEV, so if e.g. DVP is not
available on a board, the function will proceed to call
rkcif_mipi_register. So we should return ret; here. Sounds reasonable?

> 
>>
>> I'll have another look over this mechanism and will try to make it more
>> comprehensible.
>>
>>>
>>>> +
>>>> +	if (rkcif->match_data->dvp->setup)
>>>> +		rkcif->match_data->dvp->setup(rkcif);
>>>> +
>>>> +	interface->streams_num = rkcif->match_data->dvp->has_ids ? 4 : 1;
>>>> +	for (i = 0; i < interface->streams_num; i++) {
>>>> +		struct rkcif_stream *stream = &interface->streams[i];
>>>> +
>>>> +		stream->id = i;
>>>> +		stream->interface = interface;
>>>> +		stream->out_fmts = rkcif->match_data->dvp->out_fmts;
>>>> +		stream->out_fmts_num = rkcif->match_data->dvp->out_fmts_num;
>>>> +		stream->queue_buffer = cif_dvp_queue_buffer;
>>>> +		stream->start_streaming = cif_dvp_start_streaming;
>>>> +		stream->stop_streaming = cif_dvp_stop_streaming;
>>>> +
>>>> +		ret = rkcif_stream_register(rkcif, stream);
>>>> +		if (ret)
>>>> +			goto err_streams_unregister;
>>>> +	}
>>>> +	return 0;
>>>> +
>>>> +err_streams_unregister:
>>>> +	for (; i >= 0; i--)
>>>> +		rkcif_stream_unregister(&interface->streams[i]);
>>>> +	rkcif_interface_unregister(interface);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>
>>> SNIP
>>>
>>>> +static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
>>>> +{
>>>> +	return container_of(vb, struct rkcif_buffer, vb);
>>>> +}
>>>> +
>>>> +static inline struct rkcif_stream *to_rkcif_stream(struct video_device *vdev)
>>>> +{
>>>> +	return container_of(vdev, struct rkcif_stream, vdev);
>>>> +}
>>>> +
>>>> +static struct rkcif_buffer *rkcif_stream_pop_buffer(struct rkcif_stream *stream)
>>>> +{
>>>> +	struct rkcif_buffer *buffer = NULL;
>>>> +	unsigned long lock_flags;
>>>> +
>>>> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
>>>
>>> guard(spinlock_irqsave)(&stream->driver_queue_lock) will simplify this function.
>>
>> I'll guard up these methods in v7.
>>
>>>
>>>> +
>>>> +	if (list_empty(&stream->driver_queue))
>>>> +		goto err_empty;
>>>> +
>>>> +	buffer = list_first_entry(&stream->driver_queue, struct rkcif_buffer,
>>>> +				  queue);
>>>> +	list_del(&buffer->queue);
>>>> +
>>>> +err_empty:
>>>> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
>>>> +	return buffer;
>>>> +}
>>>> +
>>>> +static void rkcif_stream_push_buffer(struct rkcif_stream *stream,
>>>> +				     struct rkcif_buffer *buffer)
>>>> +{
>>>> +	unsigned long lock_flags;
>>>> +
>>>> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
>>>> +	list_add_tail(&buffer->queue, &stream->driver_queue);
>>>> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
>>>> +}
>>>> +
>>>> +static inline void rkcif_stream_return_buffer(struct rkcif_buffer *buffer,
>>>> +					      enum vb2_buffer_state state)
>>>> +{
>>>> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
>>>> +
>>>> +	vb2_buffer_done(&vb->vb2_buf, state);
>>>> +}
>>>> +
>>>> +static void rkcif_stream_complete_buffer(struct rkcif_stream *stream,
>>>> +					 struct rkcif_buffer *buffer)
>>>> +{
>>>> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
>>>> +
>>>> +	vb->vb2_buf.timestamp = ktime_get_ns();
>>>> +	vb->sequence = stream->frame_idx;
>>>> +	vb2_buffer_done(&vb->vb2_buf, VB2_BUF_STATE_DONE);
>>>> +	stream->frame_idx++;
>>>> +}
>>>> +
>>>> +void rkcif_stream_pingpong(struct rkcif_stream *stream)
>>>> +{
>>>> +	struct rkcif_buffer *buffer;
>>>> +
>>>> +	buffer = stream->buffers[stream->frame_phase];
>>>> +	if (!buffer->is_dummy)
>>>> +		rkcif_stream_complete_buffer(stream, buffer);
>>>
>>> You can actually keep this frame dropping mechanism without using the
>>> dummy buffer.
>>>
>>> You can set a drop flag to TRUE: keep overwriting the buffer you already have
>>> without returning it to user-space until you can get another buffer, set
>>> the flag again to FALSE and resume returning the buffers to user-space.
>>
>> The approach you describe is what the downstream driver does and I am
>> not really happy with it. A perfectly fine frame is sacrificed in a
>> buffer starvation situation.
> 
> Oh I thought the downstream driver does it with the dummy buffer.
> 
>>
>> The approach in the patch series at hand follows the example in the
>> rkisp1 driver, which should be a good reference.
> 
> Ack.

Just FWIW: after some discussions off-list I am not sure anymore that
the dummy buffer approach is a good idea. However, maybe we can defer
this -- this is something that can be changed anytime once the initial
driver is mainline.

> 
>>
>>>> +
>>>> +	buffer = rkcif_stream_pop_buffer(stream);
>>>> +	if (buffer) {
>>>> +		stream->buffers[stream->frame_phase] = buffer;
>>>> +		stream->buffers[stream->frame_phase]->is_dummy = false;
>>>> +	} else {
>>>> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
>>>> +		stream->buffers[stream->frame_phase]->is_dummy = true;
>>>> +		dev_warn(stream->rkcif->dev,
>>>> +			 "no buffer available, frame will be dropped\n");
>>>
>>> This warning can quickly flood the kernel logs if the user-space is too slow in
>>> enqueuing the buffers.
>>
>> True. dev_warn_ratelimited(...)?
>>
> 
> Does frame dropping deserve a warning ? If you don't think so, maybe a
> debug or info ?

_dbg sounds reasonable for that.

> 
>>>
>>>> +	}
>>>> +
>>>> +	if (stream->queue_buffer)
>>>> +		stream->queue_buffer(stream, stream->frame_phase);
>>>
>>> is this if statement really needed ?
>>
>> I find it good practice to check the callbacks before calling them. But
>> this is a matter of taste, of course.
>>
>>>
>>>> +
>>>> +	stream->frame_phase = 1 - stream->frame_phase;
>>>> +}
>>>> +
>>>> +static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
>>>> +{
>>>> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
>>>> +	int i;
>>>> +
>>>> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
>>>> +	if (!stream->buffers[0])
>>>> +		goto err_buff_0;
>>>> +
>>>> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
>>>> +	if (!stream->buffers[1])
>>>> +		goto err_buff_1;
>>>> +
>>>> +	if (stream->queue_buffer) {
>>>> +		stream->queue_buffer(stream, 0);
>>>> +		stream->queue_buffer(stream, 1);
>>>> +	}
>>>> +
>>>> +	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
>>>> +	stream->dummy.vaddr =
>>>> +		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
>>>> +				&stream->dummy.buffer.buff_addr[0], GFP_KERNEL,
>>>> +				DMA_ATTR_NO_KERNEL_MAPPING);
>>>> +	if (!stream->dummy.vaddr)
>>>> +		goto err_dummy;
>>>> +
>>>> +	for (i = 1; i < pix->num_planes; i++)
>>>> +		stream->dummy.buffer.buff_addr[i] =
>>>> +			stream->dummy.buffer.buff_addr[i - 1] +
>>>> +			pix->plane_fmt[i - 1].bytesperline * pix->height;
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_dummy:
>>>> +	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
>>>> +	stream->buffers[1] = NULL;
>>>> +
>>>> +err_buff_1:
>>>> +	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
>>>> +	stream->buffers[0] = NULL;
>>>> +err_buff_0:
>>>> +	return -EINVAL;
>>>> +}
>>>> +
>>>
>>> SNIP
>>>
>>>> +static int rkcif_stream_init_vb2_queue(struct vb2_queue *q,
>>>> +				       struct rkcif_stream *stream)
>>>> +{
>>>> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>>> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
>>>> +	q->drv_priv = stream;
>>>> +	q->ops = &rkcif_stream_vb2_ops;
>>>> +	q->mem_ops = &vb2_dma_contig_memops;
>>>> +	q->buf_struct_size = sizeof(struct rkcif_buffer);
>>>> +	q->min_queued_buffers = CIF_REQ_BUFS_MIN;
>>>
>>> If I recall correctly min_queued_buffers should be the strict minimum
>>> number of buffers you need to start streaming. So in this case it should
>>> be 3 = 2 pingpong buffers + 1 dummy buffer.
>>
>> The dummy buffer is allocated separately and does not need to be
>> accounted for.
>>
>> Two pingpong buffers is what the hardware can queue, but in practice, to
>> start (and, above all, keep on) streaming you'll need more.
>>
>>> VIDIOC_REQBUFS will allocate min_queued_buffers + 1 and user-space will
>>> probably allocate even more anyway.
>>
>> Is that so? I found that user space relies too much on this minimum
>> buffer count and experienced several buffer starvation situations
>> because kernel AND user space were to cheap in terms of buffer count.
>> Maybe 8 is too many, but in practice four buffers are required at least
>> for a decent 2160p stream (one ready for DMA write, one ongoing DMA
>> write, one stable for processing (maybe DRM scanout or whatever the
>> application is), one spare).
>>
>> I am open to suggestions but please keep real life situations in mind
>> and move away from theoretical stand-alone-capture-hw setups.
> 
> so the documentation says:
> --------------------------------------------------------------------------
> min_queued_buffers is used when a DMA engine cannot be started unless at
> least this number of buffers have been queued into the driver.
> --------------------------------------------------------------------------
> 
> and:
> --------------------------------------------------------------------------
> VIDIOC_REQBUFS will ensure at least @min_queued_buffers + 1
> buffers will be allocated.
> --------------------------------------------------------------------------
> 
> I also found theses patches:
> https://lore.kernel.org/linux-media/20231211133251.150999-1-benjamin.gaignard@collabora.com/
> https://lore.kernel.org/all/20241007124225.63463-1-jacopo.mondi@ideasonboard.com/
> 
> If I understood correctly there is a difference between:
> 
> - the minimal number of buffers to be allocated with VIDIOC_REQBUFS
> - the minimal number of buffers to make it possible to start streaming
> 
> what you are setting is the latter, which means you need 8 buffers to
> even start streaming which should not be the case for rkcif, which
> should only need two (of course when using pingpong)
> 
> what you mentioned with the minimum number of buffers for a decent stream seems
> to point more towards @min_reqbufs_allocation:
> --------------------------------------------------------------------------
> Drivers can set this if there has to be a certain number of
> buffers available for the hardware to work effectively.
> --------------------------------------------------------------------------
> 
> of course this being said I am not the expert here so feel free to ask
> @Laurent @Hans

Thanks a lot for digging out all this info. In particular, the pointer
to Jacopo's change to the rkisp1 is interesting. I feel kind of stupid
now because I stumbled over this exact issue when I tried to capture a
single frame with the rkisp1 driver.

So in general we should let user space decide, as user space knows best
about the exact application (one-shot capture, stream capture, stream
capture with extended postprocessing = deeper pipeline, ...).

And following Jacopo's reasoning for the rkisp1 we should set the value
to 1 here, as we also have a dummy buffer approach.

Best regards,
Michael

> 
> --
> Kind Regards
> Mehdi Djait


