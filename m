Return-Path: <linux-media+bounces-34989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF2ADB718
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B43E18833F7
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A56A2874E9;
	Mon, 16 Jun 2025 16:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ava16lS+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289D320FAA4;
	Mon, 16 Jun 2025 16:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091808; cv=none; b=HjHGCJ9qQpoWl2oXf4EGoWqWso1UEojXd7ckxp68CTXagA1VkVvxPcgEmkGZ1ExvhmmKunJuR909kA8mDheJiSfqRNZTnrey6BDL+7J7RVdbpqF29eYb+c72MXjJnr8XBYyYfWlG960gBwjoStTyN1X+p/nt/YXVjuIoSoVLv04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091808; c=relaxed/simple;
	bh=6tS0pM1bqQSVbstQT6/4C05p4mBWaR3lP9ai0blW/wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ql4BUGLTDbKEC1oRN+L9+WYGh846NmRV4aAJ13DTZXvtDJ32UKZ6Bea5YSmSnwiVXcuDITwzWjunXJjz8lx4W3Gr4VDcLCRuhry35AIsgNpdfIsVh7D/0E1XLcwg4L6X0YqEDvmzG3/EGiF+CMu9r6+g0BJH2Ooq4iPX7K28+bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ava16lS+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A13F752;
	Mon, 16 Jun 2025 18:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750091793;
	bh=6tS0pM1bqQSVbstQT6/4C05p4mBWaR3lP9ai0blW/wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ava16lS+Bf5mafRgOTmqhALXcWqlgWDBDad505Fb0pcugmiSTg6P6uj2/9DYMfjnR
	 cREcXrjVKstg3y1WvrD766K+fj0Ikqa6YVD2PgncJbJVuIBLvFHi9zA0fcl2AHf7LU
	 hEeXQy5Rbv1CY2TVrA1NSTQKccZCHsQa+3txaRIE=
Date: Mon, 16 Jun 2025 19:36:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v11] media: vsp1: Add VSPX support
Message-ID: <20250616163629.GJ10542@pendragon.ideasonboard.com>
References: <20250616-b4-vspx-v11-1-69af6398c185@ideasonboard.com>
 <20250616151003.GE10542@pendragon.ideasonboard.com>
 <w3rgfqjdy3pg2xouzdc4ziz5sdwdjrnnhpclabbli3oxsarqsm@ab7aq4yo544k>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <w3rgfqjdy3pg2xouzdc4ziz5sdwdjrnnhpclabbli3oxsarqsm@ab7aq4yo544k>

On Mon, Jun 16, 2025 at 05:31:57PM +0200, Jacopo Mondi wrote:
> On Mon, Jun 16, 2025 at 06:10:03PM +0300, Laurent Pinchart wrote:
> 
> [snip]
> 
> > > + *
> > > + * Return: %0 on success or a negative error code on failure
> > > + */
> > > +int vsp1_isp_job_run(struct device *dev, struct vsp1_isp_job_desc *job)
> > > +{
> > > +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > > +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> > > +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> > > +	u32 value;
> > > +
> > > +	/* Make sure VSPX is not busy processing a frame. */
> > > +	value = vsp1_read(vsp1, VI6_CMD(0));
> > > +	if (value) {
> > > +		dev_err(vsp1->dev,
> > > +			"%s: Starting of WPF0 already reserved\n", __func__);
> > > +		return -EBUSY;
> > > +	}
> > > +
> > > +	scoped_guard(spinlock, &vspx_pipe->lock) {
> >
> > I think this needs to be spinlock_irqsave, as this function can run in
> > interrupt context (unless I'm mistaken).
> 
> I thought this always run from an irq context, but there's a path in
> start streaming that gets here, so yes, it needs irqsave
> 
> > > +		/*
> > > +		 * If a new job is scheduled when the VSPX is stopped, do
> > > +		 * not run it.
> >
> > Reflow to 80 columns.
> >
> > > +		 */
> > > +		if (!vspx_pipe->enabled)
> > > +			return -EINVAL;
> > > +
> > > +		vsp1_dl_list_commit(job->dl, 0);
> > > +	}
> > > +
> > > +	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> > > +		vsp1_pipeline_run(pipe);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(vsp1_isp_job_run);
> > > +
> > > +/**
> > > + * vsp1_isp_job_release - Release a non processed transfer job
> > > + * @dev: The VSP1 struct device
> > > + * @job: The job to release
> > > + *
> > > + * Release a job prepared by a call to vsp1_isp_job_prepare() and not yet
> > > + * run. All pending jobs shall be released after streaming has been stopped.
> >
> > "not yet run" doesn't seem right. I don't see where jobs that are being
> > run are released in this patch. Am I missing something ?
> 
> It is responsibility of the caller to release jobs which have not been
> run.
> 
> Jobs which are run are "released" in the sense that once consumed
> their display lists are returned by the DLM by the vsp1 library in the
> irq handler call path see (vsp1_dlm_irq_frame_end())
> 
> Am I missing something here ?

No you're not. Releasing a job indeed only requires releasing the DL,
which will be handled by the driver once the job completes. I got
confused by the fact that the job structure is prepared explicitly by
the caller and never explicitly released. This may cause issues if we
later add resources to vsp1_isp_job_desc that need to be released upon
job completion, but I suppose we can handle that later.

Could you set job->dl to NULL at the end of vsp1_isp_job_run() with a
comment to explain this ?

> > > + */
> > > +void vsp1_isp_job_release(struct device *dev,
> > > +			  struct vsp1_isp_job_desc *job)
> > > +{
> > > +	vsp1_dl_list_put(job->dl);
> > > +}
> > > +EXPORT_SYMBOL_GPL(vsp1_isp_job_release);
> > > +
> > > +/* -----------------------------------------------------------------------------
> > > + * Initialization and cleanup
> > > + */
> > > +
> > > +int vsp1_vspx_init(struct vsp1_device *vsp1)
> > > +{
> > > +	struct vsp1_vspx_pipeline *vspx_pipe;
> > > +	struct vsp1_pipeline *pipe;
> > > +
> > > +	vsp1->vspx = devm_kzalloc(vsp1->dev, sizeof(*vsp1->vspx), GFP_KERNEL);
> > > +	if (!vsp1->vspx)
> > > +		return -ENOMEM;
> > > +
> > > +	vsp1->vspx->vsp1 = vsp1;
> > > +
> > > +	vspx_pipe = &vsp1->vspx->pipe;
> > > +	vspx_pipe->enabled = false;
> > > +
> > > +	pipe = &vspx_pipe->pipe;
> > > +
> > > +	vsp1_pipeline_init(pipe);
> > > +
> > > +	pipe->partitions = 1;
> > > +	pipe->part_table = &vspx_pipe->partition;
> > > +	pipe->interlaced = false;
> > > +	pipe->frame_end = vsp1_vspx_pipeline_frame_end;
> > > +
> > > +	mutex_init(&vspx_pipe->mutex);
> > > +	spin_lock_init(&vspx_pipe->lock);
> > > +
> > > +	/*
> > > +	 * Initialize RPF0 as input for VSPX and use it unconditionally for
> > > +	 * now.
> > > +	 */
> > > +	pipe->inputs[0] = vsp1->rpf[0];
> > > +	pipe->inputs[0]->entity.pipe = pipe;
> > > +	pipe->inputs[0]->entity.sink = &vsp1->iif->entity;
> > > +	list_add_tail(&pipe->inputs[0]->entity.list_pipe, &pipe->entities);
> > > +
> > > +	pipe->iif = &vsp1->iif->entity;
> > > +	pipe->iif->pipe = pipe;
> > > +	pipe->iif->sink = &vsp1->wpf[0]->entity;
> > > +	pipe->iif->sink_pad = RWPF_PAD_SINK;
> > > +	list_add_tail(&pipe->iif->list_pipe, &pipe->entities);
> > > +
> > > +	pipe->output = vsp1->wpf[0];
> > > +	pipe->output->entity.pipe = pipe;
> > > +	list_add_tail(&pipe->output->entity.list_pipe, &pipe->entities);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void vsp1_vspx_cleanup(struct vsp1_device *vsp1)
> > > +{
> > > +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> > > +
> > > +	mutex_destroy(&vspx_pipe->mutex);
> > > +}
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.h b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..f871bf9e7dece112c89bf493729cf627731be1d2
> > > --- /dev/null
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
> > > @@ -0,0 +1,16 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * vsp1_vspx.h  --  R-Car Gen 4 VSPX
> > > + *
> > > + * Copyright (C) 2025 Ideas On Board Oy
> > > + * Copyright (C) 2025 Renesas Electronics Corporation
> > > + */
> > > +#ifndef __VSP1_VSPX_H__
> > > +#define __VSP1_VSPX_H__
> > > +
> > > +#include "vsp1.h"
> > > +
> > > +int vsp1_vspx_init(struct vsp1_device *vsp1);
> > > +void vsp1_vspx_cleanup(struct vsp1_device *vsp1);
> > > +
> > > +#endif /* __VSP1_VSPX_H__ */
> > > diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> > > index 4ea6352fd63fec152593133845f684e0c32f34d4..c9cdb3774a088f1c1fc48babad43cfd9774cedba 100644
> > > --- a/include/media/vsp1.h
> > > +++ b/include/media/vsp1.h
> > > @@ -15,6 +15,10 @@
> > >
> > >  struct device;
> > >
> > > +/* -----------------------------------------------------------------------------
> > > + * VSP1 DU interface
> > > + */
> > > +
> > >  int vsp1_du_init(struct device *dev);
> > >
> > >  #define VSP1_DU_STATUS_COMPLETE		BIT(0)
> > > @@ -121,4 +125,89 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
> > >  int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt);
> > >  void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt);
> > >
> > > +/* -----------------------------------------------------------------------------
> > > + * VSP1 ISP interface
> > > + */
> > > +
> > > +/**
> > > + * struct vsp1_isp_buffer_desc - Describe a buffer allocated by VSPX
> > > + * @size: Byte size of the buffer allocated by VSPX
> > > + * @cpu_addr: CPU-mapped address of a buffer allocated by VSPX
> > > + * @dma_addr: bus address of a buffer allocated by VSPX
> > > + */
> > > +struct vsp1_isp_buffer_desc {
> > > +	size_t size;
> > > +	void *cpu_addr;
> > > +	dma_addr_t dma_addr;
> > > +};
> > > +
> > > +/**
> > > + * struct vsp1_isp_job_desc - Describe a VSPX buffer transfer request
> > > + * @config: ConfigDMA buffer descriptor
> > > + * @config.pairs: number of reg-value pairs in the ConfigDMA buffer
> > > + * @config.mem: bus address of the ConfigDMA buffer
> > > + * @img: RAW image buffer descriptor
> > > + * @img.fmt: RAW image format
> > > + * @img.mem: bus address of the RAW image buffer
> > > + * @dl: pointer to the display list populated by the VSPX driver in the
> > > + *      vsp1_isp_job_prepare() function
> > > + *
> > > + * Describe a transfer request for the VSPX to perform on behalf of the ISP.
> > > + * The job descriptor contains an optional ConfigDMA buffer and one RAW image
> > > + * buffer. Set config.pairs to 0 if no ConfigDMA buffer should be transferred.
> > > + * The minimum number of config.pairs that can be written using ConfigDMA is 17.
> > > + * A number of pairs < 16 corrupts the output image. A number of pairs == 16
> > > + * freezes the VSPX operation. If the ISP driver wants has to write less than
> >
> > s/wants has/wants/ (or has)
> >
> > > + * 17 pairs it shall pad the buffer with writes directed to registers that have
> > > + * no effect or avoid using ConfigDMA at all for such small write sequences.
> > > + *
> > > + * The ISP driver shall pass an instance this type to the vsp1_isp_job_prepare()
> > > + * function that will populate the display list pointer @dl using the @config
> > > + * and @img descriptors. When the job has to be run on the VSPX, the descriptor
> > > + * shall be passed to vsp1_isp_job_run() which consumes the display list.
> > > + *
> > > + * Job descriptors not yet run shall be released with a call to
> > > + * vsp1_isp_job_release() when stopping the streaming in order to properly
> > > + * release the resources acquired by vsp1_isp_job_prepare().
> > > + */
> > > +struct vsp1_dl_list;
> >
> > Please move the forward declaration to the beginning of the file, with
> > the other one.
> >
> > > +struct vsp1_isp_job_desc {
> > > +	struct {
> > > +		unsigned int pairs;
> > > +		dma_addr_t mem;
> > > +	} config;
> > > +	struct {
> > > +		struct v4l2_pix_format_mplane fmt;
> > > +		dma_addr_t mem;
> > > +	} img;
> > > +	struct vsp1_dl_list *dl;
> > > +};
> > > +
> > > +/**
> > > + * struct vsp1_vspx_frame_end - VSPX frame end callback data
> > > + * @vspx_frame_end: Frame end callback. Called after a transfer job has been
> > > + *		    completed. If the job includes both a ConfigDMA and a
> > > + *		    RAW image, the callback is called after both have been
> > > + *		    transferred
> > > + * @frame_end_data: Frame end callback data, passed to vspx_frame_end
> > > + */
> > > +struct vsp1_vspx_frame_end {
> > > +	void (*vspx_frame_end)(void *data);
> > > +	void *frame_end_data;
> > > +};
> > > +
> > > +int vsp1_isp_init(struct device *dev);
> > > +struct device *vsp1_isp_get_bus_master(struct device *dev);
> > > +int vsp1_isp_alloc_buffer(struct device *dev, size_t size,
> > > +			  struct vsp1_isp_buffer_desc *buffer_desc);
> > > +void vsp1_isp_free_buffer(struct device *dev,
> > > +			  struct vsp1_isp_buffer_desc *buffer_desc);
> > > +int vsp1_isp_start_streaming(struct device *dev,
> > > +			     struct vsp1_vspx_frame_end *frame_end);
> > > +void vsp1_isp_stop_streaming(struct device *dev);
> > > +int vsp1_isp_job_prepare(struct device *dev,
> > > +			 struct vsp1_isp_job_desc *job);
> > > +int vsp1_isp_job_run(struct device *dev, struct vsp1_isp_job_desc *job);
> > > +void vsp1_isp_job_release(struct device *dev,  struct vsp1_isp_job_desc *job);
> > > +
> > >  #endif /* __MEDIA_VSP1_H__ */
> > >
> > > ---
> > > base-commit: 4d2c3d70799f5eb210003613766bbd113bbebc1a
> > > change-id: 20250502-b4-vspx-90c815bff6dd

-- 
Regards,

Laurent Pinchart

