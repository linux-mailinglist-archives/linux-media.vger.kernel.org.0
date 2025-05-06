Return-Path: <linux-media+bounces-31834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B183DAAC17F
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C22AD3B55C8
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14BA278742;
	Tue,  6 May 2025 10:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WomXh1eB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBFE2459D8;
	Tue,  6 May 2025 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527872; cv=none; b=c9XzaAoJVhOwKZar8RaGZAEZVs3FmGCtSFR4eo9ESjmiFxeSvz7WC4Zcb6FtmgI6Ww98s/iTFVmJnj63SOYdN2LYQ9m2+xmC3yBYMuISD/P94MojdLX2YQ8mhvtsAZ9zS1oCFH5KdRPv/mZdWY1btLrWSpNdobtx6OBPbWEguo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527872; c=relaxed/simple;
	bh=XtJyhQdvGfr7mbAylqa9uwfJ4UqSMiFpvWs0eozYVp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teFb/tVqAAEnOaKpPclhtNwCGfSZUiAa6BfK7ICQ8156ocPGZe9LWhZAkvW0jBNPhqnQiUXOupWJ57VfDNPltk55f3V7yez7FPaS7YpGpuMGzil9cLl0FVuqOYKLDAqFxjOMyiKCmGENHUTAee72iTZFndbFzpUGOLPaWUPodiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WomXh1eB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746527870; x=1778063870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XtJyhQdvGfr7mbAylqa9uwfJ4UqSMiFpvWs0eozYVp4=;
  b=WomXh1eB2BYPyD1WkrAcezaQfjDI+xKx+QI0fkYOY3VwSGWAIxg7EBnB
   pBl/AfHLU00tXnZFRjiEg1868to86o6afvMmozf8bjtiHtCXuhupWsjPW
   0DxL1dOB7k/x9vN5aAcMkg+b1XdVqrRXS9eclHqV4C3T28v7EKt281AXm
   tx8VmV19xt5JHgskQgjKOf77AX7b7sU0xF2UXAMYLDnFMExiZQBCmD0ah
   xbAwNJMHvrTpd3Gq/vM24JuzYIxn5KjfQX9U8PxUvNHyepXuWJ+UdWxpP
   85Xl/Y3H4eBCYEZ91xLWqNTLlNhhZkNbTcPIhSBWbpiPl8JZwCUKCOoX4
   g==;
X-CSE-ConnectionGUID: 0WHtCJRUR8GZKl0mUaU2Yg==
X-CSE-MsgGUID: 3VmTCYCQRaC/ooNAT7IXCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48323586"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="48323586"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 03:37:49 -0700
X-CSE-ConnectionGUID: GWxWfPhwRXe2gHswx3a2Pw==
X-CSE-MsgGUID: XCWAf+28TdeIOZ7pUIX3Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136574157"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.251])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 03:37:45 -0700
Date: Tue, 6 May 2025 12:37:34 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
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
Message-ID: <fx5zweayuzo2vcov7i5d6itlizw4bwmr3wwbd4m6mdjsiou5zb@osl3u2ijv3uj>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-6-d2f5fbee1551@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v6-6-d2f5fbee1551@collabora.com>

Hi Michael,

Thank you for the patch!

Is it possible to sent the v4l2-compliance output in the next version ?

On Wed, Apr 30, 2025 at 11:15:55AM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@wolfvision.net>
> 

SNIP

> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
> +{
> +	struct device *dev = ctx;
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +	struct rkcif_stream *stream;
> +	u32 intstat, lastline, lastpix, cif_frmst;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (!rkcif->match_data->dvp)
> +		return ret;
> +
> +	intstat = cif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
> +	cif_frmst = cif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
> +	lastline = RKCIF_FETCH_Y(cif_dvp_read(rkcif, RKCIF_DVP_LAST_LINE));
> +	lastpix = RKCIF_FETCH_Y(cif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
> +
> +	if (intstat & RKCIF_INTSTAT_FRAME_END) {
> +		cif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
> +			      RKCIF_INTSTAT_FRAME_END_CLR |
> +				      RKCIF_INTSTAT_LINE_END_CLR);
> +
> +		stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
> +
> +		if (stream->stopping) {
> +			cif_dvp_stop_streaming(stream);
> +			wake_up(&stream->wq_stopped);
> +			return IRQ_HANDLED;
> +		}
> +
> +		if (lastline != stream->pix.height) {
> +			v4l2_err(&rkcif->v4l2_dev,
> +				 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
> +				 intstat, cif_frmst, lastpix, lastline);
> +
> +			cif_dvp_reset_stream(rkcif);
> +		}
> +
> +		rkcif_stream_pingpong(stream);
> +
> +		ret = IRQ_HANDLED;

just return IRQ_HANDLED like above ?

> +	}
> +
> +	return ret;
> +}
> +
> +int rkcif_dvp_register(struct rkcif_device *rkcif)
> +{
> +	struct rkcif_interface *interface;
> +	int ret, i;
> +
> +	if (!rkcif->match_data->dvp)
> +		return 0;
> +
> +	interface = &rkcif->interfaces[RKCIF_DVP];
> +	interface->index = RKCIF_DVP;
> +	interface->type = RKCIF_IF_DVP;
> +	interface->in_fmts = rkcif->match_data->dvp->in_fmts;
> +	interface->in_fmts_num = rkcif->match_data->dvp->in_fmts_num;
> +	interface->set_crop = rkcif_dvp_set_crop;
> +	ret = rkcif_interface_register(rkcif, interface);
> +	if (ret)
> +		return 0;
		|
		+-> Copy-paste error ?

> +
> +	if (rkcif->match_data->dvp->setup)
> +		rkcif->match_data->dvp->setup(rkcif);
> +
> +	interface->streams_num = rkcif->match_data->dvp->has_ids ? 4 : 1;
> +	for (i = 0; i < interface->streams_num; i++) {
> +		struct rkcif_stream *stream = &interface->streams[i];
> +
> +		stream->id = i;
> +		stream->interface = interface;
> +		stream->out_fmts = rkcif->match_data->dvp->out_fmts;
> +		stream->out_fmts_num = rkcif->match_data->dvp->out_fmts_num;
> +		stream->queue_buffer = cif_dvp_queue_buffer;
> +		stream->start_streaming = cif_dvp_start_streaming;
> +		stream->stop_streaming = cif_dvp_stop_streaming;
> +
> +		ret = rkcif_stream_register(rkcif, stream);
> +		if (ret)
> +			goto err_streams_unregister;
> +	}
> +	return 0;
> +
> +err_streams_unregister:
> +	for (; i >= 0; i--)
> +		rkcif_stream_unregister(&interface->streams[i]);
> +	rkcif_interface_unregister(interface);
> +
> +	return ret;
> +}
> +

SNIP

> +static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
> +{
> +	return container_of(vb, struct rkcif_buffer, vb);
> +}
> +
> +static inline struct rkcif_stream *to_rkcif_stream(struct video_device *vdev)
> +{
> +	return container_of(vdev, struct rkcif_stream, vdev);
> +}
> +
> +static struct rkcif_buffer *rkcif_stream_pop_buffer(struct rkcif_stream *stream)
> +{
> +	struct rkcif_buffer *buffer = NULL;
> +	unsigned long lock_flags;
> +
> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);

guard(spinlock_irqsave)(&stream->driver_queue_lock) will simplify this function.

> +
> +	if (list_empty(&stream->driver_queue))
> +		goto err_empty;
> +
> +	buffer = list_first_entry(&stream->driver_queue, struct rkcif_buffer,
> +				  queue);
> +	list_del(&buffer->queue);
> +
> +err_empty:
> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> +	return buffer;
> +}
> +
> +static void rkcif_stream_push_buffer(struct rkcif_stream *stream,
> +				     struct rkcif_buffer *buffer)
> +{
> +	unsigned long lock_flags;
> +
> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
> +	list_add_tail(&buffer->queue, &stream->driver_queue);
> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> +}
> +
> +static inline void rkcif_stream_return_buffer(struct rkcif_buffer *buffer,
> +					      enum vb2_buffer_state state)
> +{
> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> +
> +	vb2_buffer_done(&vb->vb2_buf, state);
> +}
> +
> +static void rkcif_stream_complete_buffer(struct rkcif_stream *stream,
> +					 struct rkcif_buffer *buffer)
> +{
> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> +
> +	vb->vb2_buf.timestamp = ktime_get_ns();
> +	vb->sequence = stream->frame_idx;
> +	vb2_buffer_done(&vb->vb2_buf, VB2_BUF_STATE_DONE);
> +	stream->frame_idx++;
> +}
> +
> +void rkcif_stream_pingpong(struct rkcif_stream *stream)
> +{
> +	struct rkcif_buffer *buffer;
> +
> +	buffer = stream->buffers[stream->frame_phase];
> +	if (!buffer->is_dummy)
> +		rkcif_stream_complete_buffer(stream, buffer);

You can actually keep this frame dropping mechanism without using the
dummy buffer.

You can set a drop flag to TRUE: keep overwriting the buffer you already have
without returning it to user-space until you can get another buffer, set
the flag again to FALSE and resume returning the buffers to user-space.

> +
> +	buffer = rkcif_stream_pop_buffer(stream);
> +	if (buffer) {
> +		stream->buffers[stream->frame_phase] = buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = false;
> +	} else {
> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = true;
> +		dev_warn(stream->rkcif->dev,
> +			 "no buffer available, frame will be dropped\n");

This warning can quickly flood the kernel logs if the user-space is too slow in
enqueuing the buffers.

> +	}
> +
> +	if (stream->queue_buffer)
> +		stream->queue_buffer(stream, stream->frame_phase);

is this if statement really needed ?

> +
> +	stream->frame_phase = 1 - stream->frame_phase;
> +}
> +
> +static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
> +{
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +	int i;
> +
> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[0])
> +		goto err_buff_0;
> +
> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[1])
> +		goto err_buff_1;
> +
> +	if (stream->queue_buffer) {
> +		stream->queue_buffer(stream, 0);
> +		stream->queue_buffer(stream, 1);
> +	}
> +
> +	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
> +	stream->dummy.vaddr =
> +		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> +				&stream->dummy.buffer.buff_addr[0], GFP_KERNEL,
> +				DMA_ATTR_NO_KERNEL_MAPPING);
> +	if (!stream->dummy.vaddr)
> +		goto err_dummy;
> +
> +	for (i = 1; i < pix->num_planes; i++)
> +		stream->dummy.buffer.buff_addr[i] =
> +			stream->dummy.buffer.buff_addr[i - 1] +
> +			pix->plane_fmt[i - 1].bytesperline * pix->height;
> +
> +	return 0;
> +
> +err_dummy:
> +	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
> +	stream->buffers[1] = NULL;
> +
> +err_buff_1:
> +	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
> +	stream->buffers[0] = NULL;
> +err_buff_0:
> +	return -EINVAL;
> +}
> +

SNIP

> +static int rkcif_stream_init_vb2_queue(struct vb2_queue *q,
> +				       struct rkcif_stream *stream)
> +{
> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->drv_priv = stream;
> +	q->ops = &rkcif_stream_vb2_ops;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->buf_struct_size = sizeof(struct rkcif_buffer);
> +	q->min_queued_buffers = CIF_REQ_BUFS_MIN;

If I recall correctly min_queued_buffers should be the strict minimum
number of buffers you need to start streaming. So in this case it should
be 3 = 2 pingpong buffers + 1 dummy buffer.

VIDIOC_REQBUFS will allocate min_queued_buffers + 1 and user-space will
probably allocate even more anyway.

> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->lock = &stream->vlock;
> +	q->dev = stream->rkcif->dev;
> +
> +	return vb2_queue_init(q);
> +}

--
Kind Regards
Mehdi Djait

