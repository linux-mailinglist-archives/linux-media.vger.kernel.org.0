Return-Path: <linux-media+bounces-31944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4018AADB88
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46F564A36FB
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65E61F9F61;
	Wed,  7 May 2025 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBCuaS6B"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7411E7648;
	Wed,  7 May 2025 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610601; cv=none; b=SSzVUOunCEC0YxPGPwCPK4xvYU5jD6xjgpHa+4SRAvN509P/ooLGnLavsUdUTTy8UcqgCdV/xJjzN/QpvlsYQ8c2e9UP43/zsXd4CKOGrCTMrFg3CXKubwVxmA4yeo3dJvZ8Rir84nQZJJOZnbhQpCC8BM2tM8DMIJK3MIvpsuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610601; c=relaxed/simple;
	bh=V0bp+e0dFB81Wgp9gmw0QbHjjX607NfUw9UgONQ6nM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVPOtW6bgM04kvjx5xJnimcSW9RNogVSC/P055gK0qqW1Ms48usb5Q42RQehPhgz4318Yjtgmap1rMA7kCGc9bdEncjMbuZr6dP3FSxX/0weEs1CFYKw3oobnTmnXu4U8uIJ0HbQPjb8bSY9PkxpTmwkRtUfOnN/xUsT9o3QuNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBCuaS6B; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746610600; x=1778146600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V0bp+e0dFB81Wgp9gmw0QbHjjX607NfUw9UgONQ6nM4=;
  b=dBCuaS6BFoN6WGZ5qUJJwDXS+eUnzDLgtis9y+1ip5pT06f008F/asoq
   QNycs9fhshLDsL9XzHXMaCCSS8xWcTMk48hG9D4wNEwHFp747PRfOineq
   tmC8B3ACbiuz5ujKWkbU6JpZ1mRx8bCaOAiJjT4hdzKvPINqZ+/bHWkwy
   /lrL1Bv/x/mlr8F/X3Ot6uCxIaZcUr0Lhlms1yS1oxBLJq4DJALYp7mFm
   cB59YFkakvRFv/kTjjezJHndLXRSBtIV9WcrxnF5ZR9mEDdTCrFUBjukU
   +W0D+UiCZLnujurG8Vi2/oSretocA18Osr/ILw8vXLEiBDKk6a20bUfSn
   Q==;
X-CSE-ConnectionGUID: ZukgLC8sTPGO0iaINqQRug==
X-CSE-MsgGUID: G/aEAZZ3TQm8zaNZDg/pDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48340492"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48340492"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:36:38 -0700
X-CSE-ConnectionGUID: OAI137YdQHOyDFY5g5Bu8g==
X-CSE-MsgGUID: ZXk7I5/MS6KwVLth5IVmMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136423681"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.211])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:36:32 -0700
Date: Wed, 7 May 2025 11:36:24 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Michael Riesch <michael.riesch@wolfvision.net>, Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v6 06/13] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <pmjd65zzypo7kyi3mkpqd4pf6dqz5ssxxhwnicav57trzxt3ni@ph665okjfo2s>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-6-d2f5fbee1551@collabora.com>
 <fx5zweayuzo2vcov7i5d6itlizw4bwmr3wwbd4m6mdjsiou5zb@osl3u2ijv3uj>
 <90192c74-f5ca-404b-8b95-3df0819e4bc9@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90192c74-f5ca-404b-8b95-3df0819e4bc9@collabora.com>

Hi Michael,

On Tue, May 06, 2025 at 10:32:59PM +0200, Michael Riesch wrote:
> Hi Mehdi,
> 
> Thanks for your review!
> 
> On 5/6/25 12:37, Mehdi Djait wrote:
> > Hi Michael,
> > 
> > Thank you for the patch!
> > 
> > Is it possible to sent the v4l2-compliance output in the next version ?
> > 
> > On Wed, Apr 30, 2025 at 11:15:55AM +0200, Michael Riesch via B4 Relay wrote:
> >> From: Michael Riesch <michael.riesch@wolfvision.net>
> >>
> > 
> > SNIP
> > 
> >> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
> >> +{
> >> +	struct device *dev = ctx;
> >> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> >> +	struct rkcif_stream *stream;
> >> +	u32 intstat, lastline, lastpix, cif_frmst;
> >> +	irqreturn_t ret = IRQ_NONE;
> >> +
> >> +	if (!rkcif->match_data->dvp)
> >> +		return ret;
> >> +
> >> +	intstat = cif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
> >> +	cif_frmst = cif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
> >> +	lastline = RKCIF_FETCH_Y(cif_dvp_read(rkcif, RKCIF_DVP_LAST_LINE));
> >> +	lastpix = RKCIF_FETCH_Y(cif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
> >> +
> >> +	if (intstat & RKCIF_INTSTAT_FRAME_END) {
> >> +		cif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
> >> +			      RKCIF_INTSTAT_FRAME_END_CLR |
> >> +				      RKCIF_INTSTAT_LINE_END_CLR);
> >> +
> >> +		stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
> >> +
> >> +		if (stream->stopping) {
> >> +			cif_dvp_stop_streaming(stream);
> >> +			wake_up(&stream->wq_stopped);
> >> +			return IRQ_HANDLED;
> >> +		}
> >> +
> >> +		if (lastline != stream->pix.height) {
> >> +			v4l2_err(&rkcif->v4l2_dev,
> >> +				 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
> >> +				 intstat, cif_frmst, lastpix, lastline);
> >> +
> >> +			cif_dvp_reset_stream(rkcif);
> >> +		}
> >> +
> >> +		rkcif_stream_pingpong(stream);
> >> +
> >> +		ret = IRQ_HANDLED;
> > 
> > just return IRQ_HANDLED like above ?
> 
> I think I'll go along Bryan's suggestion to make it more consistent.
> 
> > 
> >> +	}
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +int rkcif_dvp_register(struct rkcif_device *rkcif)
> >> +{
> >> +	struct rkcif_interface *interface;
> >> +	int ret, i;
> >> +
> >> +	if (!rkcif->match_data->dvp)
> >> +		return 0;
> >> +
> >> +	interface = &rkcif->interfaces[RKCIF_DVP];
> >> +	interface->index = RKCIF_DVP;
> >> +	interface->type = RKCIF_IF_DVP;
> >> +	interface->in_fmts = rkcif->match_data->dvp->in_fmts;
> >> +	interface->in_fmts_num = rkcif->match_data->dvp->in_fmts_num;
> >> +	interface->set_crop = rkcif_dvp_set_crop;
> >> +	ret = rkcif_interface_register(rkcif, interface);
> >> +	if (ret)
> >> +		return 0;
> > 		|
> > 		+-> Copy-paste error ?
> 
> Hm. It's not a mistake. But maybe it is a bit misleading.
> 
> The point here is that if something fails with registering the DVP, the
> driver may continue to register other entities, such as the MIPI capture
> thing.

what if you want to register the DVP interface and it fails ? Maybe two
separate function for rkcif_{dvp,mipi}_interface_register(), call one of
them based on match_data and verify the ret code --> fail if non-zero ?

> 
> I'll have another look over this mechanism and will try to make it more
> comprehensible.
> 
> > 
> >> +
> >> +	if (rkcif->match_data->dvp->setup)
> >> +		rkcif->match_data->dvp->setup(rkcif);
> >> +
> >> +	interface->streams_num = rkcif->match_data->dvp->has_ids ? 4 : 1;
> >> +	for (i = 0; i < interface->streams_num; i++) {
> >> +		struct rkcif_stream *stream = &interface->streams[i];
> >> +
> >> +		stream->id = i;
> >> +		stream->interface = interface;
> >> +		stream->out_fmts = rkcif->match_data->dvp->out_fmts;
> >> +		stream->out_fmts_num = rkcif->match_data->dvp->out_fmts_num;
> >> +		stream->queue_buffer = cif_dvp_queue_buffer;
> >> +		stream->start_streaming = cif_dvp_start_streaming;
> >> +		stream->stop_streaming = cif_dvp_stop_streaming;
> >> +
> >> +		ret = rkcif_stream_register(rkcif, stream);
> >> +		if (ret)
> >> +			goto err_streams_unregister;
> >> +	}
> >> +	return 0;
> >> +
> >> +err_streams_unregister:
> >> +	for (; i >= 0; i--)
> >> +		rkcif_stream_unregister(&interface->streams[i]);
> >> +	rkcif_interface_unregister(interface);
> >> +
> >> +	return ret;
> >> +}
> >> +
> > 
> > SNIP
> > 
> >> +static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
> >> +{
> >> +	return container_of(vb, struct rkcif_buffer, vb);
> >> +}
> >> +
> >> +static inline struct rkcif_stream *to_rkcif_stream(struct video_device *vdev)
> >> +{
> >> +	return container_of(vdev, struct rkcif_stream, vdev);
> >> +}
> >> +
> >> +static struct rkcif_buffer *rkcif_stream_pop_buffer(struct rkcif_stream *stream)
> >> +{
> >> +	struct rkcif_buffer *buffer = NULL;
> >> +	unsigned long lock_flags;
> >> +
> >> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
> > 
> > guard(spinlock_irqsave)(&stream->driver_queue_lock) will simplify this function.
> 
> I'll guard up these methods in v7.
> 
> > 
> >> +
> >> +	if (list_empty(&stream->driver_queue))
> >> +		goto err_empty;
> >> +
> >> +	buffer = list_first_entry(&stream->driver_queue, struct rkcif_buffer,
> >> +				  queue);
> >> +	list_del(&buffer->queue);
> >> +
> >> +err_empty:
> >> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> >> +	return buffer;
> >> +}
> >> +
> >> +static void rkcif_stream_push_buffer(struct rkcif_stream *stream,
> >> +				     struct rkcif_buffer *buffer)
> >> +{
> >> +	unsigned long lock_flags;
> >> +
> >> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
> >> +	list_add_tail(&buffer->queue, &stream->driver_queue);
> >> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> >> +}
> >> +
> >> +static inline void rkcif_stream_return_buffer(struct rkcif_buffer *buffer,
> >> +					      enum vb2_buffer_state state)
> >> +{
> >> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> >> +
> >> +	vb2_buffer_done(&vb->vb2_buf, state);
> >> +}
> >> +
> >> +static void rkcif_stream_complete_buffer(struct rkcif_stream *stream,
> >> +					 struct rkcif_buffer *buffer)
> >> +{
> >> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> >> +
> >> +	vb->vb2_buf.timestamp = ktime_get_ns();
> >> +	vb->sequence = stream->frame_idx;
> >> +	vb2_buffer_done(&vb->vb2_buf, VB2_BUF_STATE_DONE);
> >> +	stream->frame_idx++;
> >> +}
> >> +
> >> +void rkcif_stream_pingpong(struct rkcif_stream *stream)
> >> +{
> >> +	struct rkcif_buffer *buffer;
> >> +
> >> +	buffer = stream->buffers[stream->frame_phase];
> >> +	if (!buffer->is_dummy)
> >> +		rkcif_stream_complete_buffer(stream, buffer);
> > 
> > You can actually keep this frame dropping mechanism without using the
> > dummy buffer.
> > 
> > You can set a drop flag to TRUE: keep overwriting the buffer you already have
> > without returning it to user-space until you can get another buffer, set
> > the flag again to FALSE and resume returning the buffers to user-space.
> 
> The approach you describe is what the downstream driver does and I am
> not really happy with it. A perfectly fine frame is sacrificed in a
> buffer starvation situation.

Oh I thought the downstream driver does it with the dummy buffer.

> 
> The approach in the patch series at hand follows the example in the
> rkisp1 driver, which should be a good reference.

Ack.

> 
> >> +
> >> +	buffer = rkcif_stream_pop_buffer(stream);
> >> +	if (buffer) {
> >> +		stream->buffers[stream->frame_phase] = buffer;
> >> +		stream->buffers[stream->frame_phase]->is_dummy = false;
> >> +	} else {
> >> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
> >> +		stream->buffers[stream->frame_phase]->is_dummy = true;
> >> +		dev_warn(stream->rkcif->dev,
> >> +			 "no buffer available, frame will be dropped\n");
> > 
> > This warning can quickly flood the kernel logs if the user-space is too slow in
> > enqueuing the buffers.
> 
> True. dev_warn_ratelimited(...)?
> 

Does frame dropping deserve a warning ? If you don't think so, maybe a
debug or info ?

> > 
> >> +	}
> >> +
> >> +	if (stream->queue_buffer)
> >> +		stream->queue_buffer(stream, stream->frame_phase);
> > 
> > is this if statement really needed ?
> 
> I find it good practice to check the callbacks before calling them. But
> this is a matter of taste, of course.
> 
> > 
> >> +
> >> +	stream->frame_phase = 1 - stream->frame_phase;
> >> +}
> >> +
> >> +static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
> >> +{
> >> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> >> +	int i;
> >> +
> >> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> >> +	if (!stream->buffers[0])
> >> +		goto err_buff_0;
> >> +
> >> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> >> +	if (!stream->buffers[1])
> >> +		goto err_buff_1;
> >> +
> >> +	if (stream->queue_buffer) {
> >> +		stream->queue_buffer(stream, 0);
> >> +		stream->queue_buffer(stream, 1);
> >> +	}
> >> +
> >> +	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
> >> +	stream->dummy.vaddr =
> >> +		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> >> +				&stream->dummy.buffer.buff_addr[0], GFP_KERNEL,
> >> +				DMA_ATTR_NO_KERNEL_MAPPING);
> >> +	if (!stream->dummy.vaddr)
> >> +		goto err_dummy;
> >> +
> >> +	for (i = 1; i < pix->num_planes; i++)
> >> +		stream->dummy.buffer.buff_addr[i] =
> >> +			stream->dummy.buffer.buff_addr[i - 1] +
> >> +			pix->plane_fmt[i - 1].bytesperline * pix->height;
> >> +
> >> +	return 0;
> >> +
> >> +err_dummy:
> >> +	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
> >> +	stream->buffers[1] = NULL;
> >> +
> >> +err_buff_1:
> >> +	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
> >> +	stream->buffers[0] = NULL;
> >> +err_buff_0:
> >> +	return -EINVAL;
> >> +}
> >> +
> > 
> > SNIP
> > 
> >> +static int rkcif_stream_init_vb2_queue(struct vb2_queue *q,
> >> +				       struct rkcif_stream *stream)
> >> +{
> >> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> >> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> >> +	q->drv_priv = stream;
> >> +	q->ops = &rkcif_stream_vb2_ops;
> >> +	q->mem_ops = &vb2_dma_contig_memops;
> >> +	q->buf_struct_size = sizeof(struct rkcif_buffer);
> >> +	q->min_queued_buffers = CIF_REQ_BUFS_MIN;
> > 
> > If I recall correctly min_queued_buffers should be the strict minimum
> > number of buffers you need to start streaming. So in this case it should
> > be 3 = 2 pingpong buffers + 1 dummy buffer.
> 
> The dummy buffer is allocated separately and does not need to be
> accounted for.
> 
> Two pingpong buffers is what the hardware can queue, but in practice, to
> start (and, above all, keep on) streaming you'll need more.
> 
> > VIDIOC_REQBUFS will allocate min_queued_buffers + 1 and user-space will
> > probably allocate even more anyway.
> 
> Is that so? I found that user space relies too much on this minimum
> buffer count and experienced several buffer starvation situations
> because kernel AND user space were to cheap in terms of buffer count.
> Maybe 8 is too many, but in practice four buffers are required at least
> for a decent 2160p stream (one ready for DMA write, one ongoing DMA
> write, one stable for processing (maybe DRM scanout or whatever the
> application is), one spare).
> 
> I am open to suggestions but please keep real life situations in mind
> and move away from theoretical stand-alone-capture-hw setups.

so the documentation says:
--------------------------------------------------------------------------
min_queued_buffers is used when a DMA engine cannot be started unless at
least this number of buffers have been queued into the driver.
--------------------------------------------------------------------------

and:
--------------------------------------------------------------------------
VIDIOC_REQBUFS will ensure at least @min_queued_buffers + 1
buffers will be allocated.
--------------------------------------------------------------------------

I also found theses patches:
https://lore.kernel.org/linux-media/20231211133251.150999-1-benjamin.gaignard@collabora.com/
https://lore.kernel.org/all/20241007124225.63463-1-jacopo.mondi@ideasonboard.com/

If I understood correctly there is a difference between:

- the minimal number of buffers to be allocated with VIDIOC_REQBUFS
- the minimal number of buffers to make it possible to start streaming

what you are setting is the latter, which means you need 8 buffers to
even start streaming which should not be the case for rkcif, which
should only need two (of course when using pingpong)

what you mentioned with the minimum number of buffers for a decent stream seems
to point more towards @min_reqbufs_allocation:
--------------------------------------------------------------------------
Drivers can set this if there has to be a certain number of
buffers available for the hardware to work effectively.
--------------------------------------------------------------------------

of course this being said I am not the expert here so feel free to ask
@Laurent @Hans

--
Kind Regards
Mehdi Djait

