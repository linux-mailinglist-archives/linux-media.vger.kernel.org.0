Return-Path: <linux-media+bounces-34789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF2AD95A6
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 21:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1EB73A8114
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 19:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15EA24BD02;
	Fri, 13 Jun 2025 19:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iAttJWTE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EC0244676;
	Fri, 13 Jun 2025 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843381; cv=none; b=lxEkARlQEB3JK6r3mHmsQUYuBBOK3Yrn1kqDDpHxG3Shxhrq9vr6oA81xYeC38CNqCHLs+CkxlM1ftna3tP5Rh6NlcSk+iR2mPqDjhxrMFIvs93AXlTntnMxtbuxlxkQQfMwdLDfdXXML7meQD8xCJzg+7/qL8KncTH6JzGgD5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843381; c=relaxed/simple;
	bh=3bAStTG8Xbiu0b4IUjyqoXZTl2QC9BunZP5qfRZfcp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvP0neyP0oKDpoyhR9TaS6HB5jOUkmFt+wS3MkVIg4BH50BYoE/XPeNorX/qQAmrdzBNr3RO7kKRxY590Q4qsGviIuBFIwIzt7cJIy233ZjUcp7X/RRZyrqPuLlj/0IdoYjG52Hl0c32OgZ5CZ9ffnNkwq6agpnziPJe7qjjHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iAttJWTE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C943DB5;
	Fri, 13 Jun 2025 21:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749843367;
	bh=3bAStTG8Xbiu0b4IUjyqoXZTl2QC9BunZP5qfRZfcp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAttJWTENplyScYjgbDSoEACbKZQkbhJdxucvnL4gUget0ogCiiDchwI5BzvHCIvs
	 2hXLHxOunQfHr2m+jkjdVaz7Av4HRsuAvFuSoqmiLdJGnVjNI0JLUL1XWTw1kWujqF
	 QHp0muobUeR0/ff8stRmlNAIBgqWuXjfnKDRIJOc=
Date: Fri, 13 Jun 2025 22:36:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v10] media: vsp1: Add VSPX support
Message-ID: <20250613193601.GA14438@pendragon.ideasonboard.com>
References: <20250529-b4-vspx-v10-1-02a9cb000853@ideasonboard.com>
 <20250607143808.GF2780410@ragnatech.se>
 <4lnsdnsv5h2aza2bkup3bwgqwrlt3i4wtj3jkde24fqingnqlc@2drah4ntnrzz>
 <20250609144208.GJ2780410@ragnatech.se>
 <20250613002417.GJ10542@pendragon.ideasonboard.com>
 <20250613102745.GD1002387@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613102745.GD1002387@ragnatech.se>

On Fri, Jun 13, 2025 at 12:27:45PM +0200, Niklas Söderlund wrote:
> On 2025-06-13 03:24:17 +0300, Laurent Pinchart wrote:
> > On Mon, Jun 09, 2025 at 04:42:08PM +0200, Niklas Söderlund wrote:
> > > On 2025-06-09 15:24:56 +0200, Jacopo Mondi wrote:
> > > > On Sat, Jun 07, 2025 at 04:38:08PM +0200, Niklas Söderlund wrote:
> > > > > On 2025-05-29 18:44:17 +0200, Jacopo Mondi wrote:
> > > > > > Add support for VSPX, a specialized version of the VSP2 that
> > > > > > transfers data to the ISP. The VSPX is composed of two RPF units
> > > > > > to read data from external memory and an IIF instance that performs
> > > > > > transfer towards the ISP.
> > > > > >
> > > > > > The VSPX is supported through a newly introduced vsp1_vspx.c file that
> > > > > > exposes two interfaces: vsp1_vspx interface, declared in vsp1_vspx.h
> > > > > > for the vsp1 core to initialize and cleanup the VSPX, and a vsp1_isp
> > > > > > interface, declared in include/media/vsp1.h for the ISP driver to
> > > > > > control the VSPX operations.
> > > > > >
> > > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > > 
> > > > [snip]
> > > > 
> > > > > > +
> > > > > > +	/* Configure WPF0 to enable RPF0 as source. */
> > > > > > +	vsp1_entity_route_setup(&pipe->output->entity, pipe, dlb);
> > > > > > +	vsp1_entity_configure_stream(&pipe->output->entity,
> > > > > > +				     pipe->output->entity.state, pipe,
> > > > > > +				     dl, dlb);
> > > > > > +
> > > > > > +	if (job->config.pairs) {
> > > > > > +		/*
> > > > > > +		 * Configure RPF0 for ConfigDMA data. Transfer the number of
> > > > > > +		 * configuration pairs plus 2 words for the header.
> > > > > > +		 */
> > > > > > +		ret = vsp1_vspx_pipeline_configure(vsp1, job->config.mem,
> > > > > > +						   V4L2_META_FMT_GENERIC_8,
> > > > > > +						   job->config.pairs * 2 + 2, 1,
> > > > > > +						   job->config.pairs * 2 + 2,
> > > > > > +						   VSPX_IIF_SINK_PAD_CONFIG,
> > > > > > +						   dl, dlb);
> > > > >
> > > > > I have run into a new "feature" of the ConfigDMA interface. It don't
> > > > > seem to be to happy when feed too small config buffers. Feeding it
> > > > > configuration data containing 16 or less pairs effects operation in bad
> > > > > ways.
> > > > >
> > > > > Feeding it less then 16 pairs causes corruption of the image buffer
> > > > > which follows the config buffer. Feeding it exactly 16 pairs freezes the
> > > > > VSPX. While feeding it 17 or more pairs all seems to work perfectly. I'm
> > > > > not sure why this is, maybe the minimum buffer constrains are kicking
> > > > > in?
> > > > >
> > > > > This is not a blocker IMHO, we can pad the config buffer with dummy
> > > > > writes or fallback to MMIO for small buffers. For now in the ISP driver
> > > > > I opted for the later as this proves VSPX can function without config
> > > > > DMA while also proving MMIO operation works. The later will become
> > > > > important if we ever try to use the ISP in-line as that mode of
> > > > > operation don't support Config DMA.
> > > > >
> > > > > Maybe a bounds check would be useful here so the VSPX refuses config
> > > > > buffers that are too small?
> > > > 
> > > > The datasheet reports a minimum input size for the IIF of 128x32
> > > > pixels.
> > > > 
> > > > Now, we know that the configDMA is a 1D buffer retroffitted to match a
> > > > 2D API which expresses buffers size as WxH. We currently program an
> > > > height of 1, so I'm not sure where those minimum in the datasheet come from.
> > > > 
> > > > Would padding the config with 0s work in your testing ?
> > > 
> > > I did test adding padding, but not with 0 but with dummy writes to RPP 
> > > registers that had no effect. I'm a bit scared of adding random register 
> > > writes such as writing 0 to address 0 to the config buffer.
> > > 
> > > But padding with basically nop writes worked.
> > 
> > The config buffer starts with the number of register/value pairs,
> > followed by the pairs. Do you experience bad behaviour when the buffer
> > is larger than 16 pairs but the number of pairs in the first field is
> > smaller than 16 ?
> 
> As we don't know how many pairs are needed when we allocate the buffer 
> the current design always allocates space for (1024 - 1) pairs [*].
> 
> For all tests done the buffer is always the same size. The difference is 
> the number of pairs set in the header word, if set to a value bellow 
> (bad image), equal (vsp freeze) or larger then 16 (good image).

Looking at the code I think there's another difference. The buffer size
may always be the same, but the size transferred by the VSPX is equal to
job->config.pairs * 2 + 2. What I'm wondering is if the hardware would
misbehave if we always transferred at least 17 * 2 + 2 = 36 bytes, with
the number of pairs in the header being smaller than 16.

> *: It do check for overflows and will not allow more then that to be 
> written to the buffer and warns about it so we can increase it if we 
> ever need to. But with current blocks enabled we have space to grow.  
> This limit is also a purely internal thing not exposed to user-space.
> 
> > > > > > +		if (ret)
> > > > > > +			goto error_put_dl;
> > > > > > +
> > > > > > +		second_dl = vsp1_dl_list_get(pipe->output->dlm);
> > > > > > +		if (!second_dl) {
> > > > > > +			ret = -ENOMEM;
> > > > > > +			goto error_put_dl;
> > > > > > +		}
> > > > > > +
> > > > > > +		dl = second_dl;
> > > > > > +		dlb = vsp1_dl_list_get_body0(dl);
> > > > > > +	}
> > > > > > +
> > > > > > +	/* Configure RPF0 for RAW image transfer. */
> > > > > > +	pix_mp = &job->img.fmt.fmt.pix_mp;
> > > > >
> > > > > I think adding a check on V4L2_TYPE_IS_MULTIPLANAR(job->img.fmt.type) or
> > > > > something similar could be added here. When using this interface I once
> > > > > waked into the trap of feeding it a non-planar confirmation which it
> > > > > happy accepted.
> > > > 
> > > > This might be a good idea. We could also switch on (job->img.fmt.type)
> > > > so that we can chose which member of the fmt union to use.
> > > > 
> > > > I recall initially I had a struct v4l2_pix_format_mplane, but the we
> > > > decided to pass the whole struct v4l2_format. Do you remember why ?
> > > 
> > > We discussed it briefly and opted to go for the whole struct to make 
> > > the API future proof IIRC.
> > 
> > I don't recall why. I don't mind much either way, but given that new
> > drivers should always use the multi-planar API, maybe
> > v4l2_pix_format_mplane is all we need ?
> > 
> > > > > These two small issues aside this iteration works perfectly, nice work!
> > > > > My stress test can't provoke any issues and the algorithms I have
> > > > > enabled on the ISP are happy and so are the libcamera pipeline and
> > > > > output images.
> > > > 
> > > > That's very good news, looking forward to developments on the
> > > > libcamera side then!
> > > > 
> > > > > > +	ret = vsp1_vspx_pipeline_configure(vsp1, job->img.mem,
> > > > > > +					   pix_mp->pixelformat,
> > > > > > +					   pix_mp->width, pix_mp->height,
> > > > > > +					   pix_mp->plane_fmt[0].bytesperline,
> > > > > > +					   VSPX_IIF_SINK_PAD_IMG, dl, dlb);
> > > > > > +	if (ret)
> > > > > > +		goto error_put_dl;
> > > > > > +
> > > > > > +	if (second_dl)
> > > > > > +		vsp1_dl_list_add_chain(job->dl, second_dl);
> > > > > > +
> > > > > > +	return 0;
> > > > > > +
> > > > > > +error_put_dl:
> > > > > > +	if (second_dl)
> > > > > > +		vsp1_dl_list_put(second_dl);
> > > > > > +	vsp1_dl_list_put(job->dl);
> > > > > > +	return ret;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(vsp1_isp_job_prepare);
> > > > > > +
> > > > > > +/**
> > > > > > + * vsp1_isp_job_run - Run a buffer transfer job
> > > > > > + * @dev: The VSP1 struct device
> > > > > > + * @job: The job to be run
> > > > > > + *
> > > > > > + * Run the display list contained in the job description provided by the caller.
> > > > > > + * The job must have been prepared with a call to vsp1_isp_job_prepare() and
> > > > > > + * the job's display list shall be valid.
> > > > > > + *
> > > > > > + * Return: %0 on success or a negative error code on failure
> > > > > > + */
> > > > > > +int vsp1_isp_job_run(struct device *dev, struct vsp1_isp_job_desc *job)
> > > > > > +{
> > > > > > +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > > > > > +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> > > > > > +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> > > > > > +	u32 value;
> > > > > > +
> > > > > > +	/* Make sure VSPX is not busy processing a frame. */
> > > > > > +	value = vsp1_read(vsp1, VI6_CMD(0));
> > > > > > +	if (value) {
> > > > > > +		dev_err(vsp1->dev,
> > > > > > +			"%s: Starting of WPF0 already reserved\n", __func__);
> > > > > > +		return -EBUSY;
> > > > > > +	}
> > > > > > +
> > > > > > +	scoped_guard(spinlock_irqsave, &vspx_pipe->lock) {
> > > > > > +		/*
> > > > > > +		 * If a new job is scheduled when the VSPX is stopping, do
> > > > > > +		 * not run it.
> > > > > > +		 */
> > > > > > +		if (!vspx_pipe->enabled)
> > > > > > +			return 0;
> > > > > > +
> > > > > > +		vsp1_dl_list_commit(job->dl, 0);
> > > > > > +	}
> > > > > > +
> > > > > > +	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> > > > > > +		vsp1_pipeline_run(pipe);
> > > > > > +	}
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(vsp1_isp_job_run);
> > > > > > +
> > > > > > +/**
> > > > > > + * vsp1_isp_job_release - Release a non processed transfer job
> > > > > > + * @dev: The VSP1 struct device
> > > > > > + * @job: The job to release
> > > > > > + *
> > > > > > + * Release a job prepared by a call to vsp1_isp_job_prepare() and not yet
> > > > > > + * run. All pending jobs shall be released after streaming has been stopped.
> > > > > > + */
> > > > > > +void vsp1_isp_job_release(struct device *dev,
> > > > > > +			  struct vsp1_isp_job_desc *job)
> > > > > > +{
> > > > > > +	vsp1_dl_list_put(job->dl);
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(vsp1_isp_job_release);
> > > > > > +
> > > > > > +/* -----------------------------------------------------------------------------
> > > > > > + * Initialization and cleanup
> > > > > > + */
> > > > > > +
> > > > > > +int vsp1_vspx_init(struct vsp1_device *vsp1)
> > > > > > +{
> > > > > > +	struct vsp1_vspx_pipeline *vspx_pipe;
> > > > > > +	struct vsp1_pipeline *pipe;
> > > > > > +
> > > > > > +	vsp1->vspx = devm_kzalloc(vsp1->dev, sizeof(*vsp1->vspx), GFP_KERNEL);
> > > > > > +	if (!vsp1->vspx)
> > > > > > +		return -ENOMEM;
> > > > > > +
> > > > > > +	vsp1->vspx->vsp1 = vsp1;
> > > > > > +
> > > > > > +	vspx_pipe = &vsp1->vspx->pipe;
> > > > > > +	vspx_pipe->enabled = false;
> > > > > > +
> > > > > > +	pipe = &vspx_pipe->pipe;
> > > > > > +
> > > > > > +	vsp1_pipeline_init(pipe);
> > > > > > +
> > > > > > +	pipe->partitions = 1;
> > > > > > +	pipe->part_table = &vspx_pipe->partition;
> > > > > > +	pipe->interlaced = false;
> > > > > > +	pipe->frame_end = vsp1_vspx_pipeline_frame_end;
> > > > > > +
> > > > > > +	spin_lock_init(&vspx_pipe->lock);
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Initialize RPF0 as input for VSPX and use it unconditionally for
> > > > > > +	 * now.
> > > > > > +	 */
> > > > > > +	pipe->inputs[0] = vsp1->rpf[0];
> > > > > > +	pipe->inputs[0]->entity.pipe = pipe;
> > > > > > +	pipe->inputs[0]->entity.sink = &vsp1->iif->entity;
> > > > > > +	list_add_tail(&pipe->inputs[0]->entity.list_pipe, &pipe->entities);
> > > > > > +
> > > > > > +	pipe->iif = &vsp1->iif->entity;
> > > > > > +	pipe->iif->pipe = pipe;
> > > > > > +	pipe->iif->sink = &vsp1->wpf[0]->entity;
> > > > > > +	pipe->iif->sink_pad = RWPF_PAD_SINK;
> > > > > > +	list_add_tail(&pipe->iif->list_pipe, &pipe->entities);
> > > > > > +
> > > > > > +	pipe->output = vsp1->wpf[0];
> > > > > > +	pipe->output->entity.pipe = pipe;
> > > > > > +	list_add_tail(&pipe->output->entity.list_pipe, &pipe->entities);
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +void vsp1_vspx_cleanup(struct vsp1_device *vsp1)
> > > > > > +{
> > > > > > +}
> > > > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.h b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..f871bf9e7dec
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
> > > > > > @@ -0,0 +1,16 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > > > +/*
> > > > > > + * vsp1_vspx.h  --  R-Car Gen 4 VSPX
> > > > > > + *
> > > > > > + * Copyright (C) 2025 Ideas On Board Oy
> > > > > > + * Copyright (C) 2025 Renesas Electronics Corporation
> > > > > > + */
> > > > > > +#ifndef __VSP1_VSPX_H__
> > > > > > +#define __VSP1_VSPX_H__
> > > > > > +
> > > > > > +#include "vsp1.h"
> > > > > > +
> > > > > > +int vsp1_vspx_init(struct vsp1_device *vsp1);
> > > > > > +void vsp1_vspx_cleanup(struct vsp1_device *vsp1);
> > > > > > +
> > > > > > +#endif /* __VSP1_VSPX_H__ */
> > > > > > diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> > > > > > index 4ea6352fd63f..5148c782580d 100644
> > > > > > --- a/include/media/vsp1.h
> > > > > > +++ b/include/media/vsp1.h
> > > > > > @@ -15,6 +15,10 @@
> > > > > >
> > > > > >  struct device;
> > > > > >
> > > > > > +/* -----------------------------------------------------------------------------
> > > > > > + * VSP1 DU interface
> > > > > > + */
> > > > > > +
> > > > > >  int vsp1_du_init(struct device *dev);
> > > > > >
> > > > > >  #define VSP1_DU_STATUS_COMPLETE		BIT(0)
> > > > > > @@ -121,4 +125,84 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
> > > > > >  int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt);
> > > > > >  void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt);
> > > > > >
> > > > > > +/* -----------------------------------------------------------------------------
> > > > > > + * VSP1 ISP interface
> > > > > > + */
> > > > > > +
> > > > > > +/**
> > > > > > + * struct vsp1_isp_buffer_desc - Describe a buffer allocated by VSPX
> > > > > > + * @size: Byte size of the buffer allocated by VSPX
> > > > > > + * @cpu_addr: CPU-mapped address of a buffer allocated by VSPX
> > > > > > + * @dma_addr: bus address of a buffer allocated by VSPX
> > > > > > + */
> > > > > > +struct vsp1_isp_buffer_desc {
> > > > > > +	size_t size;
> > > > > > +	void *cpu_addr;
> > > > > > +	dma_addr_t dma_addr;
> > > > > > +};
> > > > > > +
> > > > > > +/**
> > > > > > + * struct vsp1_isp_job_desc - Describe a VSPX buffer transfer request
> > > > > > + * @config: ConfigDMA buffer descriptor
> > > > > > + * @config.pairs: number of reg-value pairs in the ConfigDMA buffer
> > > > > > + * @config.mem: bus address of the ConfigDMA buffer
> > > > > > + * @img: RAW image buffer descriptor
> > > > > > + * @img.fmt: RAW image format
> > > > > > + * @img.mem: bus address of the RAW image buffer
> > > > > > + * @dl: pointer to the display list populated by the VSPX driver in the
> > > > > > + *      vsp1_isp_job_prepare() function
> > > > > > + *
> > > > > > + * Describe a transfer request for the VSPX to perform on behalf of the ISP.
> > > > > > + * The job descriptor contains an optional ConfigDMA buffer and one RAW image
> > > > > > + * buffer. Set config.pairs to 0 if no ConfigDMA buffer should be transferred.
> > > > > > + *
> > > > > > + * The ISP driver shall pass an instance this type to the vsp1_isp_job_prepare()
> > > > > > + * function that will populate the display list pointer @dl using the @config
> > > > > > + * and @img descriptors. When the job has to be run on the VSPX, the descriptor
> > > > > > + * shall be passed to vsp1_isp_job_run() which consumes the display list.
> > > > > > + *
> > > > > > + * Job descriptors not yet run shall be released with a call to
> > > > > > + * vsp1_isp_job_release() when stopping the streaming in order to properly
> > > > > > + * release the resources acquired by vsp1_isp_job_prepare().
> > > > > > + */
> > > > > > +struct vsp1_dl_list;
> > > > > > +struct vsp1_isp_job_desc {
> > > > > > +	struct {
> > > > > > +		unsigned int pairs;
> > > > > > +		dma_addr_t mem;
> > > > > > +	} config;
> > > > > > +	struct {
> > > > > > +		struct v4l2_format fmt;
> > > > > > +		dma_addr_t mem;
> > > > > > +	} img;
> > > > > > +	struct vsp1_dl_list *dl;
> > > > > > +};
> > > > > > +
> > > > > > +/**
> > > > > > + * struct vsp1_vspx_frame_end - VSPX frame end callback data
> > > > > > + * @vspx_frame_end: Frame end callback. Called after a transfer job has been
> > > > > > + *		    completed. If the job includes both a ConfigDMA and a
> > > > > > + *		    RAW image, the callback is called after both have been
> > > > > > + *		    transferred
> > > > > > + * @frame_end_data: Frame end callback data, passed to vspx_frame_end
> > > > > > + */
> > > > > > +struct vsp1_vspx_frame_end {
> > > > > > +	void (*vspx_frame_end)(void *data);
> > > > > > +	void *frame_end_data;
> > > > > > +};
> > > > > > +
> > > > > > +int vsp1_isp_init(struct device *dev);
> > > > > > +struct device *vsp1_isp_get_bus_master(struct device *dev);
> > > > > > +int vsp1_isp_alloc_buffer(struct device *dev, size_t size,
> > > > > > +			  struct vsp1_isp_buffer_desc *buffer_desc);
> > > > > > +void vsp1_isp_free_buffer(struct device *dev,
> > > > > > +			  struct vsp1_isp_buffer_desc *buffer_desc);
> > > > > > +int vsp1_isp_start_streaming(struct device *dev,
> > > > > > +			     struct vsp1_vspx_frame_end *frame_end);
> > > > > > +void vsp1_isp_stop_streaming(struct device *dev);
> > > > > > +int vsp1_isp_job_prepare(struct device *dev,
> > > > > > +			 struct vsp1_isp_job_desc *job);
> > > > > > +int vsp1_isp_job_run(struct device *dev, struct vsp1_isp_job_desc *job);
> > > > > > +void vsp1_isp_job_release(struct device *dev,  struct vsp1_isp_job_desc *job);
> > > > > > +
> > > > > >  #endif /* __MEDIA_VSP1_H__ */
> > > > > >
> > > > > > ---
> > > > > > base-commit: 1d41f477d6ff5f5eb0b78b37644ffac0785602c9
> > > > > > change-id: 20250502-b4-vspx-90c815bff6dd

-- 
Regards,

Laurent Pinchart

