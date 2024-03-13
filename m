Return-Path: <linux-media+bounces-6988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A460487A639
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 11:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07BB91F21F79
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 10:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA76C3D548;
	Wed, 13 Mar 2024 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vYC0Dyl2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDE33EA6C
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710327480; cv=none; b=ICs94sHbps2TnOCsgg1K61nnFsH/xStoQhhVn9TTDzq4+nOWHgB6BAk7m/w0yG4qZYY7s/X8iziW1s6+I6+QhYQk7lJ1CNrlOziqjjgluo9gC65Al00B4JyHgAuH7GrVlCwWZ3si8SmDrRTzUj/PTgKoVNmZDcErF0mwMNARpwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710327480; c=relaxed/simple;
	bh=L1fhJ5D53261mzFshfuTQDN2lomQReNcTNHYHKy8nWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQsRjsN3TtcDNCWiTxNx2Idke7vLBU1OApMGL0z5jc+pZjqeywm0ogNs4jFeIx44hmxTIN3741uhs2Mz6jsyPOfbBXz0TcDDmlEoh+jlh/Z10V5LPRKwfrfujWdxrcCVT8njcEV0p+bii1SB0ibBtI+6a0y27LHxZYN4rSDNyZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vYC0Dyl2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF919899;
	Wed, 13 Mar 2024 11:57:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710327446;
	bh=L1fhJ5D53261mzFshfuTQDN2lomQReNcTNHYHKy8nWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vYC0Dyl2DCLX7yxRzi/cnHvf6SFqjdIr64ETjrcDYtyhVv1YaReBvV4hJ0yRECA9r
	 5sI98o8L8NL9+NmJ2zToObiylpCctIUulVSYPPoHuE8xO6aC63mtOiTYk+7nDwxwvj
	 OlG4EOUZE1Yv58JWXR2Q9oCw0gncy9gvrNmAKGJg=
Date: Wed, 13 Mar 2024 11:57:45 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, David Plowman <david.plowman@raspberrypi.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 8/9] media: raspberrypi: Add support for PiSP BE
Message-ID: <lsnv73m36ajckpgaurn7zbt2ybmdgiuyv3nbykzjo5n5vb63mh@yvwoh2bwgieg>
References: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com>
 <20240308085028.44388-9-jacopo.mondi@ideasonboard.com>
 <Ze7UsGgZ6W42fmgT@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ze7UsGgZ6W42fmgT@valkosipuli.retiisi.eu>

On Mon, Mar 11, 2024 at 09:53:52AM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, Mar 08, 2024 at 09:50:26AM +0100, Jacopo Mondi wrote:
> > diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> > new file mode 100644
> > index 000000000000..e3cbc3063342
> > --- /dev/null
> > +++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> > @@ -0,0 +1,13 @@
> > +config VIDEO_RASPBERRYPI_PISP_BE
> > +	tristate "Raspberry Pi PiSP Backend (BE) ISP driver"
> > +	depends on V4L_PLATFORM_DRIVERS
> > +	depends on VIDEO_DEV && PM
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select MEDIA_CONTROLLER
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	select V4L2_FWNODE
>
> Do you need v4l2-fwnode?
>

Ah no I don't

> > +	help
> > +	  Say Y here to enable support for the PiSP Backend (BE) ISP driver.
> > +
> > +	  To compile this driver as a module, choose M here. The module will be
> > +	  called pisp-be.
> > diff --git a/drivers/media/platform/raspberrypi/pisp_be/Makefile b/drivers/media/platform/raspberrypi/pisp_be/Makefile
> > new file mode 100644
> > index 000000000000..a70bf5716824
> > --- /dev/null
> > +++ b/drivers/media/platform/raspberrypi/pisp_be/Makefile
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Makefile for Raspberry Pi PiSP Backend driver
> > +#
> > +pisp-be-objs := pisp_be.o
> > +obj-$(CONFIG_VIDEO_RASPBERRYPI_PISP_BE) += pisp-be.o
> > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > new file mode 100644
> > index 000000000000..46f8b326c73d
> > --- /dev/null
> > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > @@ -0,0 +1,1859 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * PiSP Back End driver.
> > + * Copyright (c) 2021-2022 Raspberry Pi Limited.
>
> 2024 maybe?
>
> > + *
> > + */
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/lockdep.h>
> > +#include <linux/media/raspberrypi/pisp_be_config.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <media/videobuf2-vmalloc.h>
> > +
> > +#include "pisp_be_formats.h"
> > +
>
> ...
>
> > +/*
> > + * Prepare a job description to be submitted to the HW.
> > + *
> > + * To schedule a job, we need all streaming nodes (apart from Output0,
> > + * Output1, Tdn and Stitch) to have a buffer ready, which must
> > + * include at least a config buffer and a main input image.
> > + *
> > + * For Output0, Output1, Tdn and Stitch, a buffer only needs to be
> > + * available if the blocks are enabled in the config.
> > + *
> > + * Needs to be called with hw_lock held.
> > + *
> > + * Returns 0 if a job has been successfully prepared, < 0 otherwise.
> > + */
> > +static int pispbe_prepare_job(struct pispbe_node_group *node_group,
> > +			      struct pispbe_job_descriptor *job)
> > +{
> > +	struct pispbe_buffer *buf[PISPBE_NUM_NODES] = {};
> > +	struct pispbe_dev *pispbe = node_group->pispbe;
> > +	unsigned int config_index;
> > +	struct pispbe_node *node;
> > +	unsigned long flags;
> > +
> > +	lockdep_assert_held(&pispbe->hw_lock);
> > +
> > +	memset(job, 0, sizeof(struct pispbe_job_descriptor));
> > +
> > +	if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) &
> > +		node_group->streaming_map) !=
> > +			(BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
> > +		return -ENODEV;
> > +
> > +	node = &node_group->node[CONFIG_NODE];
> > +	spin_lock_irqsave(&node->ready_lock, flags);
> > +	buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
> > +						    struct pispbe_buffer,
> > +						    ready_list);
> > +	if (buf[CONFIG_NODE]) {
> > +		list_del(&buf[CONFIG_NODE]->ready_list);
> > +		pispbe->queued_job.buf[CONFIG_NODE] = buf[CONFIG_NODE];
> > +	}
> > +	spin_unlock_irqrestore(&node->ready_lock, flags);
> > +
> > +	/* Exit early if no config buffer has been queued. */
> > +	if (!buf[CONFIG_NODE])
> > +		return -ENODEV;
> > +
> > +	config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
> > +	job->config = &node_group->config[config_index];
> > +	job->tiles = node_group->config_dma_addr
> > +		   + config_index * sizeof(struct pisp_be_tiles_config)
> > +		   + offsetof(struct pisp_be_tiles_config, tiles);
>
> The operators should be on the previous lines.
>

May I ask why ?

> > +
> > +	/* remember: srcimages, captures then metadata */
> > +	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++) {
> > +		unsigned int bayer_en =
> > +			job->config->config.global.bayer_enables;
> > +		unsigned int rgb_en =
> > +			job->config->config.global.rgb_enables;
> > +		bool ignore_buffers = false;
> > +
> > +		/* Config node is handled outside the loop above. */
> > +		if (i == CONFIG_NODE)
> > +			continue;
> > +
> > +		buf[i] = NULL;
> > +		if (!(node_group->streaming_map & BIT(i)))
> > +			continue;
> > +
> > +		if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
> > +		     i == OUTPUT0_NODE) ||
> > +		    (!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT1) &&
> > +		     i == OUTPUT1_NODE) ||
> > +		    (!(bayer_en & PISP_BE_BAYER_ENABLE_TDN_INPUT) &&
> > +		     i == TDN_INPUT_NODE) ||
> > +		    (!(bayer_en & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) &&
> > +		     i == TDN_OUTPUT_NODE) ||
> > +		    (!(bayer_en & PISP_BE_BAYER_ENABLE_STITCH_INPUT) &&
> > +		     i == STITCH_INPUT_NODE) ||
> > +		    (!(bayer_en & PISP_BE_BAYER_ENABLE_STITCH_OUTPUT) &&
> > +		     i == STITCH_OUTPUT_NODE)) {
> > +			/*
> > +			 * Ignore Output0/Output1/Tdn/Stitch buffer check if the
> > +			 * global enables aren't set for these blocks. If a
> > +			 * buffer has been provided, we dequeue it back to the
> > +			 * user with the other in-use buffers.
> > +			 */
> > +			ignore_buffers = true;
> > +		}
> > +
> > +		node = &node_group->node[i];
> > +
> > +		/* Pull a buffer from each V4L2 queue to form the queued job */
> > +		spin_lock_irqsave(&node->ready_lock, flags);
> > +		buf[i] = list_first_entry_or_null(&node->ready_queue,
> > +						  struct pispbe_buffer,
> > +						  ready_list);
> > +		if (buf[i]) {
> > +			list_del(&buf[i]->ready_list);
> > +			pispbe->queued_job.buf[i] = buf[i];
> > +		}
> > +		spin_unlock_irqrestore(&node->ready_lock, flags);
> > +
> > +		if (!buf[i] && !ignore_buffers)
> > +			goto err_return_buffers;
> > +	}
> > +
> > +	pispbe->queued_job.node_group = node_group;
> > +
> > +	/* Convert buffers to DMA addresses for the hardware */
> > +	pispbe_xlate_addrs(job->hw_dma_addrs, job->hw_enables,
> > +			   job->config, buf, node_group);
> > +
> > +	return 0;
> > +
> > +err_return_buffers:
> > +	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++) {
> > +		struct pispbe_node *n =  &node_group->node[i];
> > +
> > +		if (!buf[i])
> > +			continue;
> > +
> > +		/* Return the buffer to the ready_list queue */
> > +		spin_lock_irqsave(&n->ready_lock, flags);
> > +		list_add(&buf[i]->ready_list, &n->ready_queue);
> > +		spin_unlock_irqrestore(&n->ready_lock, flags);
> > +	}
> > +
> > +	memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
> > +
> > +	return -ENODEV;
> > +}
>
> ...
>
> > +static int pisp_be_validate_config(struct pispbe_node_group *node_group,
> > +				   struct pisp_be_tiles_config *config)
> > +{
> > +	u32 bayer_enables = config->config.global.bayer_enables;
> > +	u32 rgb_enables = config->config.global.rgb_enables;
> > +	struct device *dev = node_group->pispbe->dev;
> > +	struct v4l2_format *fmt;
> > +	unsigned int bpl, size;
> > +
> > +	if (!(bayer_enables & PISP_BE_BAYER_ENABLE_INPUT) ==
> > +	    !(rgb_enables & PISP_BE_RGB_ENABLE_INPUT)) {
> > +		dev_err(dev, "%s: Not one input enabled\n", __func__);
> > +		return -EIO;
> > +	}
> > +
> > +	/* Ensure output config strides and buffer sizes match the V4L2 formats. */
> > +	fmt = &node_group->node[TDN_OUTPUT_NODE].format;
> > +	if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {
> > +		bpl = config->config.tdn_output_format.stride;
> > +		size = bpl * config->config.tdn_output_format.height;
> > +		if (fmt->fmt.pix_mp.plane_fmt[0].bytesperline < bpl) {
> > +			dev_err(dev, "%s: bpl mismatch on tdn_output\n",
> > +				__func__);
>
> Aren't you validating user-provided configuration here? Then use dev_dbg(),
> as a regular user isn't supposed to trigger log-filling by simply throwing
> invalid configuration to the kernel.
>
> Same below (and above, too).
>

Ack, will make it dev_dbg

> > +			return -EINVAL;
> > +		}
> > +		if (fmt->fmt.pix_mp.plane_fmt[0].sizeimage < size) {
> > +			dev_err(dev, "%s: size mismatch on tdn_output\n",
> > +				__func__);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	fmt = &node_group->node[STITCH_OUTPUT_NODE].format;
> > +	if (bayer_enables & PISP_BE_BAYER_ENABLE_STITCH_OUTPUT) {
> > +		bpl = config->config.stitch_output_format.stride;
> > +		size = bpl * config->config.stitch_output_format.height;
> > +		if (fmt->fmt.pix_mp.plane_fmt[0].bytesperline < bpl) {
> > +			dev_err(dev, "%s: bpl mismatch on stitch_output\n",
> > +				__func__);
> > +			return -EINVAL;
> > +		}
> > +		if (fmt->fmt.pix_mp.plane_fmt[0].sizeimage < size) {
> > +			dev_err(dev, "%s: size mismatch on stitch_output\n",
> > +				__func__);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	for (unsigned int j = 0; j < PISP_BACK_END_NUM_OUTPUTS; j++) {
> > +		if (!(rgb_enables & PISP_BE_RGB_ENABLE_OUTPUT(j)))
> > +			continue;
> > +		if (config->config.output_format[j].image.format &
> > +		    PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
> > +			continue; /* TODO: Size checks for wallpaper formats */
> > +
> > +		fmt = &node_group->node[OUTPUT0_NODE + j].format;
> > +		for (unsigned int i = 0; i < fmt->fmt.pix_mp.num_planes; i++) {
> > +			bpl = !i ? config->config.output_format[j].image.stride
> > +			    : config->config.output_format[j].image.stride2;
> > +			size = bpl * config->config.output_format[j].image.height;
> > +
> > +			if (config->config.output_format[j].image.format &
> > +						PISP_IMAGE_FORMAT_SAMPLING_420)
> > +				size >>= 1;
> > +			if (fmt->fmt.pix_mp.plane_fmt[i].bytesperline < bpl) {
> > +				dev_err(dev, "%s: bpl mismatch on output %d\n",
> > +					__func__, j);
> > +				return -EINVAL;
> > +			}
> > +			if (fmt->fmt.pix_mp.plane_fmt[i].sizeimage < size) {
> > +				dev_err(dev, "%s: size mismatch on output\n",
> > +					__func__);
> > +				return -EINVAL;
> > +			}
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int pispbe_node_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
> > +				   unsigned int *nplanes, unsigned int sizes[],
> > +				   struct device *alloc_devs[])
> > +{
> > +	struct pispbe_node *node = vb2_get_drv_priv(q);
> > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > +
> > +	*nplanes = 1;
> > +	if (NODE_IS_MPLANE(node)) {
> > +		*nplanes = node->format.fmt.pix_mp.num_planes;
> > +		for (unsigned int i = 0; i < *nplanes; i++) {
> > +			unsigned int size =
> > +				node->format.fmt.pix_mp.plane_fmt[i].sizeimage;
>
> A newline would be nice here.
>

Ack

> > +			if (sizes[i] && sizes[i] < size) {
> > +				dev_err(pispbe->dev, "%s: size %u < %u\n",
> > +					__func__, sizes[i], size);
> > +				return -EINVAL;
> > +			}
> > +			sizes[i] = size;
> > +		}
> > +	} else if (NODE_IS_META(node)) {
> > +		sizes[0] = node->format.fmt.meta.buffersize;
> > +		/*
> > +		 * Limit the config node buffer count to the number of internal
> > +		 * buffers allocated.
> > +		 */
> > +		if (node->id == CONFIG_NODE)
> > +			*nbuffers = min_t(unsigned int, *nbuffers,
> > +					  PISP_BE_NUM_CONFIG_BUFFERS);
> > +	}
> > +
> > +	dev_dbg(pispbe->dev,
> > +		"Image (or metadata) size %u, nbuffers %u for node %s\n",
> > +		sizes[0], *nbuffers, NODE_NAME(node));
> > +
> > +	return 0;
> > +}
> > +
> > +static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
> > +{
> > +	struct pispbe_node *node = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > +	unsigned long size = 0;
> > +	unsigned int num_planes = NODE_IS_MPLANE(node)
> > +				? node->format.fmt.pix_mp.num_planes : 1;
> > +
> > +	for (unsigned int i = 0; i < num_planes; i++) {
> > +		size = NODE_IS_MPLANE(node)
> > +			? node->format.fmt.pix_mp.plane_fmt[i].sizeimage
> > +			: node->format.fmt.meta.buffersize;
> > +
> > +		if (vb2_plane_size(vb, i) < size) {
> > +			dev_err(pispbe->dev,
> > +				"data will not fit into plane %d (%lu < %lu)\n",
> > +				i, vb2_plane_size(vb, i), size);
> > +			return -EINVAL;
> > +		}
> > +
> > +		vb2_set_plane_payload(vb, i, size);
> > +	}
> > +
> > +	if (node->id == CONFIG_NODE) {
> > +		void *dst = &node->node_group->config[vb->index];
> > +		void *src = vb2_plane_vaddr(vb, 0);
> > +
> > +		memcpy(dst, src, sizeof(struct pisp_be_tiles_config));
>
> Here, too.
>

Ack

> > +		return pisp_be_validate_config(node->node_group, dst);
> > +	}
> > +
> > +	return 0;
> > +}
>
> ...
>
> > +static int pispbe_node_g_fmt_meta_out(struct file *file, void *priv,
> > +				      struct v4l2_format *f)
> > +{
> > +	struct pispbe_node *node = video_drvdata(file);
> > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > +
> > +	if (!NODE_IS_META(node) || NODE_IS_CAPTURE(node)) {
> > +		dev_err(pispbe->dev,
> > +			"Cannot get capture fmt for meta output node %s\n",
> > +			NODE_NAME(node));
> > +		return -EINVAL;
> > +	}
> > +	*f = node->format;
> > +	dev_dbg(pispbe->dev, "Get output format for meta node %s\n",
> > +		NODE_NAME(node));
>
> Ditto.
>
> > +	return 0;
> > +}
>
> ...
>
> > +static int pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
> > +{
> > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > +	u32 pixfmt = f->fmt.pix_mp.pixelformat;
> > +	const struct pisp_be_format *fmt;
> > +	bool is_rgb;
> > +
> > +	dev_dbg(pispbe->dev,
> > +		"%s: [%s] req %ux%u %p4cc, planes %d\n",
> > +		__func__, NODE_NAME(node), f->fmt.pix_mp.width,
> > +		f->fmt.pix_mp.height, &pixfmt,
> > +		f->fmt.pix_mp.num_planes);
> > +
> > +	fmt = pispbe_find_fmt(pixfmt);
> > +	if (!fmt) {
> > +		dev_dbg(pispbe->dev,
> > +			"%s: [%s] Format not found, defaulting to YUV420\n",
> > +			__func__, NODE_NAME(node));
> > +		fmt = pispbe_find_fmt(V4L2_PIX_FMT_YUV420);
> > +	}
> > +
> > +	f->fmt.pix_mp.pixelformat = fmt->fourcc;
> > +	f->fmt.pix_mp.num_planes = fmt->num_planes;
> > +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> > +	f->fmt.pix_mp.width = max(min(f->fmt.pix_mp.width, 65536u),
> > +				  PISP_BACK_END_MIN_TILE_WIDTH);
> > +	f->fmt.pix_mp.height = max(min(f->fmt.pix_mp.height, 65536u),
> > +				   PISP_BACK_END_MIN_TILE_HEIGHT);
> > +
> > +	/*
> > +	 * Fill in the actual colour space when the requested one was
> > +	 * not supported. This also catches the case when the "default"
> > +	 * colour space was requested (as that's never in the mask).
> > +	 */
> > +	if (!(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
> > +	    fmt->colorspace_mask))
> > +		f->fmt.pix_mp.colorspace = fmt->colorspace_default;
> > +
> > +	/* In all cases, we only support the defaults for these: */
> > +	f->fmt.pix_mp.ycbcr_enc =
> > +		V4L2_MAP_YCBCR_ENC_DEFAULT(f->fmt.pix_mp.colorspace);
> > +	f->fmt.pix_mp.xfer_func =
> > +		V4L2_MAP_XFER_FUNC_DEFAULT(f->fmt.pix_mp.colorspace);
> > +
> > +	is_rgb = f->fmt.pix_mp.colorspace == V4L2_COLORSPACE_SRGB;
> > +	f->fmt.pix_mp.quantization =
> > +		V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb, f->fmt.pix_mp.colorspace,
> > +					      f->fmt.pix_mp.ycbcr_enc);
> > +
> > +	/* Set plane size and bytes/line for each plane. */
> > +	pispbe_set_plane_params(f, fmt);
> > +
> > +	for (unsigned int i = 0; i < f->fmt.pix_mp.num_planes; i++) {
> > +		dev_dbg(pispbe->dev,
> > +			"%s: [%s] calc plane %d, %ux%u, depth %u, bpl %u size %u\n",
> > +			__func__, NODE_NAME(node), i, f->fmt.pix_mp.width,
> > +			f->fmt.pix_mp.height, fmt->bit_depth,
> > +			f->fmt.pix_mp.plane_fmt[i].bytesperline,
> > +			f->fmt.pix_mp.plane_fmt[i].sizeimage);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int pispbe_node_try_fmt_vid_cap(struct file *file, void *priv,
> > +				       struct v4l2_format *f)
> > +{
> > +	struct pispbe_node *node = video_drvdata(file);
> > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > +	int ret;
> > +
> > +	if (!NODE_IS_CAPTURE(node) || NODE_IS_META(node)) {
> > +		dev_err(pispbe->dev,
> > +			"Cannot set capture fmt for output node %s\n",
> > +			NODE_NAME(node));
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = pispbe_try_format(f, node);
> > +	if (ret < 0)
>
> pispbe_try_format() appears to return 0 always. How about making that
> return void and just return 0 here? Elsewhere, too.
>

Right, will do!

> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int pispbe_node_try_fmt_vid_out(struct file *file, void *priv,
> > +				       struct v4l2_format *f)
> > +{
> > +	struct pispbe_node *node = video_drvdata(file);
> > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > +	int ret;
> > +
> > +	if (!NODE_IS_OUTPUT(node) || NODE_IS_META(node)) {
> > +		dev_err(pispbe->dev,
> > +			"Cannot set capture fmt for output node %s\n",
> > +			NODE_NAME(node));
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = pispbe_try_format(f, node);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int pispbe_node_try_fmt_meta_out(struct file *file, void *priv,
> > +					struct v4l2_format *f)
> > +{
> > +	struct pispbe_node *node = video_drvdata(file);
> > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > +
> > +	if (!NODE_IS_META(node) || NODE_IS_CAPTURE(node)) {
> > +		dev_err(pispbe->dev,
> > +			"Cannot set capture fmt for meta output node %s\n",
> > +			NODE_NAME(node));
> > +		return -EINVAL;
> > +	}
> > +
> > +	f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
> > +	f->fmt.meta.buffersize = sizeof(struct pisp_be_tiles_config);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pispbe_node_s_fmt_vid_cap(struct file *file, void *priv,
> > +				     struct v4l2_format *f)
> > +{
> > +	struct pispbe_node *node = video_drvdata(file);
> > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > +	int ret = pispbe_node_try_fmt_vid_cap(file, priv, f);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	node->format = *f;
> > +	node->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
> > +
> > +	dev_dbg(pispbe->dev, "Set capture format for node %s to %p4cc\n",
> > +		NODE_NAME(node), &f->fmt.pix_mp.pixelformat);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pispbe_node_s_fmt_vid_out(struct file *file, void *priv,
> > +				     struct v4l2_format *f)
> > +{
> > +	struct pispbe_node *node = video_drvdata(file);
> > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > +	int ret = pispbe_node_try_fmt_vid_out(file, priv, f);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	node->format = *f;
> > +	node->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
> > +
> > +	dev_dbg(pispbe->dev, "Set output format for node %s to %p4cc\n",
> > +		NODE_NAME(node), &f->fmt.pix_mp.pixelformat);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pispbe_node_s_fmt_meta_out(struct file *file, void *priv,
> > +				      struct v4l2_format *f)
> > +{
> > +	struct pispbe_node *node = video_drvdata(file);
> > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > +	int ret = pispbe_node_try_fmt_meta_out(file, priv, f);
>
> Please don't to this in variable delaration. Instead, declare variable here
> and perform the assignment separately. Same above.
>

Right!

> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	node->format = *f;
> > +	node->pisp_format = &meta_out_supported_formats[0];
> > +
> > +	dev_dbg(pispbe->dev, "Set output format for meta node %s to %p4cc\n",
> > +		NODE_NAME(node), &f->fmt.meta.dataformat);
> > +
> > +	return 0;
> > +}
>
> ...
>
> > diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> > new file mode 100644
> > index 000000000000..623ac3948426
> > --- /dev/null
> > +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> > @@ -0,0 +1,531 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > +/*
> > + * PiSP Back End configuration definitions.
> > + *
> > + * Copyright (C) 2021 - Raspberry Pi Ltd
> > + *
> > + */
> > +#ifndef _UAPI_PISP_BE_CONFIG_H_
> > +#define _UAPI_PISP_BE_CONFIG_H_
> > +
> > +#include <linux/types.h>
> > +
> > +#include "pisp_common.h"
> > +
> > +/* byte alignment for inputs */
> > +#define PISP_BACK_END_INPUT_ALIGN 4u
> > +/* alignment for compressed inputs */
> > +#define PISP_BACK_END_COMPRESSED_ALIGN 8u
> > +/* minimum required byte alignment for outputs */
> > +#define PISP_BACK_END_OUTPUT_MIN_ALIGN 16u
> > +/* preferred byte alignment for outputs */
> > +#define PISP_BACK_END_OUTPUT_MAX_ALIGN 64u
> > +
> > +/* minimum allowed tile width anywhere in the pipeline */
> > +#define PISP_BACK_END_MIN_TILE_WIDTH 16u
> > +/* minimum allowed tile width anywhere in the pipeline */
> > +#define PISP_BACK_END_MIN_TILE_HEIGHT 16u
> > +
> > +#define PISP_BACK_END_NUM_OUTPUTS 2
> > +#define PISP_BACK_END_HOG_OUTPUT 1
> > +
> > +#define PISP_BACK_END_NUM_TILES 64
> > +
> > +enum pisp_be_bayer_enable {
> > +	PISP_BE_BAYER_ENABLE_INPUT = 0x000001,
> > +	PISP_BE_BAYER_ENABLE_DECOMPRESS = 0x000002,
> > +	PISP_BE_BAYER_ENABLE_DPC = 0x000004,
> > +	PISP_BE_BAYER_ENABLE_GEQ = 0x000008,
> > +	PISP_BE_BAYER_ENABLE_TDN_INPUT = 0x000010,
> > +	PISP_BE_BAYER_ENABLE_TDN_DECOMPRESS = 0x000020,
> > +	PISP_BE_BAYER_ENABLE_TDN = 0x000040,
> > +	PISP_BE_BAYER_ENABLE_TDN_COMPRESS = 0x000080,
> > +	PISP_BE_BAYER_ENABLE_TDN_OUTPUT = 0x000100,
> > +	PISP_BE_BAYER_ENABLE_SDN = 0x000200,
> > +	PISP_BE_BAYER_ENABLE_BLC = 0x000400,
> > +	PISP_BE_BAYER_ENABLE_STITCH_INPUT = 0x000800,
> > +	PISP_BE_BAYER_ENABLE_STITCH_DECOMPRESS = 0x001000,
> > +	PISP_BE_BAYER_ENABLE_STITCH = 0x002000,
> > +	PISP_BE_BAYER_ENABLE_STITCH_COMPRESS = 0x004000,
> > +	PISP_BE_BAYER_ENABLE_STITCH_OUTPUT = 0x008000,
> > +	PISP_BE_BAYER_ENABLE_WBG = 0x010000,
> > +	PISP_BE_BAYER_ENABLE_CDN = 0x020000,
> > +	PISP_BE_BAYER_ENABLE_LSC = 0x040000,
> > +	PISP_BE_BAYER_ENABLE_TONEMAP = 0x080000,
> > +	PISP_BE_BAYER_ENABLE_CAC = 0x100000,
> > +	PISP_BE_BAYER_ENABLE_DEBIN = 0x200000,
> > +	PISP_BE_BAYER_ENABLE_DEMOSAIC = 0x400000,
> > +};
> > +
> > +enum pisp_be_rgb_enable {
> > +	PISP_BE_RGB_ENABLE_INPUT = 0x000001,
> > +	PISP_BE_RGB_ENABLE_CCM = 0x000002,
> > +	PISP_BE_RGB_ENABLE_SAT_CONTROL = 0x000004,
> > +	PISP_BE_RGB_ENABLE_YCBCR = 0x000008,
> > +	PISP_BE_RGB_ENABLE_FALSE_COLOUR = 0x000010,
> > +	PISP_BE_RGB_ENABLE_SHARPEN = 0x000020,
> > +	/* Preferred colours would occupy 0x000040 */
> > +	PISP_BE_RGB_ENABLE_YCBCR_INVERSE = 0x000080,
> > +	PISP_BE_RGB_ENABLE_GAMMA = 0x000100,
> > +	PISP_BE_RGB_ENABLE_CSC0 = 0x000200,
> > +	PISP_BE_RGB_ENABLE_CSC1 = 0x000400,
> > +	PISP_BE_RGB_ENABLE_DOWNSCALE0 = 0x001000,
> > +	PISP_BE_RGB_ENABLE_DOWNSCALE1 = 0x002000,
> > +	PISP_BE_RGB_ENABLE_RESAMPLE0 = 0x008000,
> > +	PISP_BE_RGB_ENABLE_RESAMPLE1 = 0x010000,
> > +	PISP_BE_RGB_ENABLE_OUTPUT0 = 0x040000,
> > +	PISP_BE_RGB_ENABLE_OUTPUT1 = 0x080000,
> > +	PISP_BE_RGB_ENABLE_HOG = 0x200000
> > +};
> > +
> > +#define PISP_BE_RGB_ENABLE_CSC(i) (PISP_BE_RGB_ENABLE_CSC0 << (i))
> > +#define PISP_BE_RGB_ENABLE_DOWNSCALE(i) (PISP_BE_RGB_ENABLE_DOWNSCALE0 << (i))
> > +#define PISP_BE_RGB_ENABLE_RESAMPLE(i) (PISP_BE_RGB_ENABLE_RESAMPLE0 << (i))
> > +#define PISP_BE_RGB_ENABLE_OUTPUT(i) (PISP_BE_RGB_ENABLE_OUTPUT0 << (i))
> > +
> > +/*
> > + * We use the enable flags to show when blocks are "dirty", but we need some
> > + * extra ones too.
> > + */
> > +enum pisp_be_dirty {
> > +	PISP_BE_DIRTY_GLOBAL = 0x0001,
> > +	PISP_BE_DIRTY_SH_FC_COMBINE = 0x0002,
> > +	PISP_BE_DIRTY_CROP = 0x0004
> > +};
> > +
> > +struct pisp_be_global_config {
> > +	__u32 bayer_enables;
> > +	__u32 rgb_enables;
> > +	__u8 bayer_order;
> > +	__u8 pad[3];
> > +} __attribute__((packed));
>
> I wonder what is the current recommendation on packing the structs on
> different ABIs. On some archs (e.g. ARM) this involves more inefficient
> access of data on these structs and it would seem like that there are no
> direct struct layout related implications from packing apart from the main
> struct embedding other structs.
>
> The V4L2 IOCTL arguments have used packing just to be sure there are no
> holes but I wonder if it makes sense here. I've argued for this, too, but
> drawbacks exist as well.
>
> Any thoughts?
>
> How about checking this with pahole?

I've run this through Hans' scripts as reported in the cover letter

pahole: ABI OK

But as Naush replied, this gets applied directly to the HW registers
layout, so packing is needed

>
> > +
> > +struct pisp_be_input_buffer_config {
> > +	/* low 32 bits followed by high 32 bits (for each of up to 3 planes) */
> > +	__u32 addr[3][2];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_dpc_config {
> > +	__u8 coeff_level;
> > +	__u8 coeff_range;
> > +	__u8 pad;
> > +#define PISP_BE_DPC_FLAG_FOLDBACK 1
> > +	__u8 flags;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_geq_config {
> > +	__u16 offset;
> > +#define PISP_BE_GEQ_SHARPER BIT(15)
> > +#define PISP_BE_GEQ_SLOPE ((1 << 10) - 1)
> > +	/* top bit is the "sharper" flag, slope value is bottom 10 bits */
> > +	__u16 slope_sharper;
> > +	__u16 min;
> > +	__u16 max;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_tdn_input_buffer_config {
> > +	/* low 32 bits followed by high 32 bits */
> > +	__u32 addr[2];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_tdn_config {
> > +	__u16 black_level;
> > +	__u16 ratio;
> > +	__u16 noise_constant;
> > +	__u16 noise_slope;
> > +	__u16 threshold;
> > +	__u8 reset;
> > +	__u8 pad;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_tdn_output_buffer_config {
> > +	/* low 32 bits followed by high 32 bits */
> > +	__u32 addr[2];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_sdn_config {
> > +	__u16 black_level;
> > +	__u8 leakage;
> > +	__u8 pad;
> > +	__u16 noise_constant;
> > +	__u16 noise_slope;
> > +	__u16 noise_constant2;
> > +	__u16 noise_slope2;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_stitch_input_buffer_config {
> > +	/* low 32 bits followed by high 32 bits */
> > +	__u32 addr[2];
> > +} __attribute__((packed));
> > +
> > +#define PISP_BE_STITCH_STREAMING_LONG 0x8000
> > +#define PISP_BE_STITCH_EXPOSURE_RATIO_MASK 0x7fff
> > +
> > +struct pisp_be_stitch_config {
> > +	__u16 threshold_lo;
> > +	__u8 threshold_diff_power;
> > +	__u8 pad;
> > +
> > +	/* top bit indicates whether streaming input is the long exposure */
> > +	__u16 exposure_ratio;
> > +
> > +	__u8 motion_threshold_256;
> > +	__u8 motion_threshold_recip;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_stitch_output_buffer_config {
> > +	/* low 32 bits followed by high 32 bits */
> > +	__u32 addr[2];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_cdn_config {
> > +	__u16 thresh;
> > +	__u8 iir_strength;
> > +	__u8 g_adjust;
> > +} __attribute__((packed));
> > +
> > +#define PISP_BE_LSC_LOG_GRID_SIZE 5
> > +#define PISP_BE_LSC_GRID_SIZE (1 << PISP_BE_LSC_LOG_GRID_SIZE)
> > +#define PISP_BE_LSC_STEP_PRECISION 18
> > +
> > +struct pisp_be_lsc_config {
> > +	/* (1<<18) / grid_cell_width */
> > +	__u16 grid_step_x;
> > +	/* (1<<18) / grid_cell_height */
> > +	__u16 grid_step_y;
> > +	/* RGB gains jointly encoded in 32 bits */
> > +	__u32 lut_packed[PISP_BE_LSC_GRID_SIZE + 1]
> > +			   [PISP_BE_LSC_GRID_SIZE + 1];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_lsc_extra {
> > +	__u16 offset_x;
> > +	__u16 offset_y;
> > +} __attribute__((packed));
> > +
> > +#define PISP_BE_CAC_LOG_GRID_SIZE 3
> > +#define PISP_BE_CAC_GRID_SIZE (1 << PISP_BE_CAC_LOG_GRID_SIZE)
> > +#define PISP_BE_CAC_STEP_PRECISION 20
> > +
> > +struct pisp_be_cac_config {
> > +	/* (1<<20) / grid_cell_width */
> > +	__u16 grid_step_x;
> > +	/* (1<<20) / grid_cell_height */
> > +	__u16 grid_step_y;
> > +	/* [gridy][gridx][rb][xy] */
> > +	__s8 lut[PISP_BE_CAC_GRID_SIZE + 1][PISP_BE_CAC_GRID_SIZE + 1][2][2];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_cac_extra {
> > +	__u16 offset_x;
> > +	__u16 offset_y;
> > +} __attribute__((packed));
> > +
> > +#define PISP_BE_DEBIN_NUM_COEFFS 4
> > +
> > +struct pisp_be_debin_config {
> > +	__s8 coeffs[PISP_BE_DEBIN_NUM_COEFFS];
> > +	__s8 h_enable;
> > +	__s8 v_enable;
> > +	__s8 pad[2];
> > +} __attribute__((packed));
> > +
> > +#define PISP_BE_TONEMAP_LUT_SIZE 64
> > +
> > +struct pisp_be_tonemap_config {
> > +	__u16 detail_constant;
> > +	__u16 detail_slope;
> > +	__u16 iir_strength;
> > +	__u16 strength;
> > +	__u32 lut[PISP_BE_TONEMAP_LUT_SIZE];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_demosaic_config {
> > +	__u8 sharper;
> > +	__u8 fc_mode;
> > +	__u8 pad[2];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_ccm_config {
> > +	__s16 coeffs[9];
> > +	__u8 pad[2];
> > +	__s32 offsets[3];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_sat_control_config {
> > +	__u8 shift_r;
> > +	__u8 shift_g;
> > +	__u8 shift_b;
> > +	__u8 pad;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_false_colour_config {
> > +	__u8 distance;
> > +	__u8 pad[3];
> > +} __attribute__((packed));
> > +
> > +#define PISP_BE_SHARPEN_SIZE 5
> > +#define PISP_BE_SHARPEN_FUNC_NUM_POINTS 9
> > +
> > +struct pisp_be_sharpen_config {
> > +	__s8 kernel0[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
> > +	__s8 pad0[3];
> > +	__s8 kernel1[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
> > +	__s8 pad1[3];
> > +	__s8 kernel2[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
> > +	__s8 pad2[3];
> > +	__s8 kernel3[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
> > +	__s8 pad3[3];
> > +	__s8 kernel4[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
> > +	__s8 pad4[3];
> > +	__u16 threshold_offset0;
> > +	__u16 threshold_slope0;
> > +	__u16 scale0;
> > +	__u16 pad5;
> > +	__u16 threshold_offset1;
> > +	__u16 threshold_slope1;
> > +	__u16 scale1;
> > +	__u16 pad6;
> > +	__u16 threshold_offset2;
> > +	__u16 threshold_slope2;
> > +	__u16 scale2;
> > +	__u16 pad7;
> > +	__u16 threshold_offset3;
> > +	__u16 threshold_slope3;
> > +	__u16 scale3;
> > +	__u16 pad8;
> > +	__u16 threshold_offset4;
> > +	__u16 threshold_slope4;
> > +	__u16 scale4;
> > +	__u16 pad9;
> > +	__u16 positive_strength;
> > +	__u16 positive_pre_limit;
> > +	__u16 positive_func[PISP_BE_SHARPEN_FUNC_NUM_POINTS];
> > +	__u16 positive_limit;
> > +	__u16 negative_strength;
> > +	__u16 negative_pre_limit;
> > +	__u16 negative_func[PISP_BE_SHARPEN_FUNC_NUM_POINTS];
> > +	__u16 negative_limit;
> > +	__u8 enables;
> > +	__u8 white;
> > +	__u8 black;
> > +	__u8 grey;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_sh_fc_combine_config {
> > +	__u8 y_factor;
> > +	__u8 c1_factor;
> > +	__u8 c2_factor;
> > +	__u8 pad;
> > +} __attribute__((packed));
> > +
> > +#define PISP_BE_GAMMA_LUT_SIZE 64
> > +
> > +struct pisp_be_gamma_config {
> > +	__u32 lut[PISP_BE_GAMMA_LUT_SIZE];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_crop_config {
> > +	__u16 offset_x, offset_y;
> > +	__u16 width, height;
> > +} __attribute__((packed));
> > +
> > +#define PISP_BE_RESAMPLE_FILTER_SIZE 96
> > +
> > +struct pisp_be_resample_config {
> > +	__u16 scale_factor_h, scale_factor_v;
> > +	__s16 coef[PISP_BE_RESAMPLE_FILTER_SIZE];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_resample_extra {
> > +	__u16 scaled_width;
> > +	__u16 scaled_height;
> > +	__s16 initial_phase_h[3];
> > +	__s16 initial_phase_v[3];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_downscale_config {
> > +	__u16 scale_factor_h;
> > +	__u16 scale_factor_v;
> > +	__u16 scale_recip_h;
> > +	__u16 scale_recip_v;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_downscale_extra {
> > +	__u16 scaled_width;
> > +	__u16 scaled_height;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_hog_config {
> > +	__u8 compute_signed;
> > +	__u8 channel_mix[3];
> > +	__u32 stride;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_axi_config {
> > +	__u8 r_qos; /* Read QoS */
> > +	__u8 r_cache_prot; /* Read { prot[2:0], cache[3:0] } */
> > +	__u8 w_qos; /* Write QoS */
> > +	__u8 w_cache_prot; /* Write { prot[2:0], cache[3:0] } */
> > +} __attribute__((packed));
> > +
> > +enum pisp_be_transform {
> > +	PISP_BE_TRANSFORM_NONE = 0x0,
> > +	PISP_BE_TRANSFORM_HFLIP = 0x1,
> > +	PISP_BE_TRANSFORM_VFLIP = 0x2,
> > +	PISP_BE_TRANSFORM_ROT180 =
> > +		(PISP_BE_TRANSFORM_HFLIP | PISP_BE_TRANSFORM_VFLIP)
> > +};
> > +
> > +struct pisp_be_output_format_config {
> > +	struct pisp_image_format_config image;
> > +	__u8 transform;
> > +	__u8 pad[3];
> > +	__u16 lo;
> > +	__u16 hi;
> > +	__u16 lo2;
> > +	__u16 hi2;
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_output_buffer_config {
> > +	/* low 32 bits followed by high 32 bits (for each of 3 planes) */
> > +	__u32 addr[3][2];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_hog_buffer_config {
> > +	/* low 32 bits followed by high 32 bits */
> > +	__u32 addr[2];
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_config {
> > +	/* I/O configuration: */
> > +	struct pisp_be_input_buffer_config input_buffer;
> > +	struct pisp_be_tdn_input_buffer_config tdn_input_buffer;
> > +	struct pisp_be_stitch_input_buffer_config stitch_input_buffer;
> > +	struct pisp_be_tdn_output_buffer_config tdn_output_buffer;
> > +	struct pisp_be_stitch_output_buffer_config stitch_output_buffer;
> > +	struct pisp_be_output_buffer_config
> > +				output_buffer[PISP_BACK_END_NUM_OUTPUTS];
> > +	struct pisp_be_hog_buffer_config hog_buffer;
> > +	/* Processing configuration: */
> > +	struct pisp_be_global_config global;
> > +	struct pisp_image_format_config input_format;
> > +	struct pisp_decompress_config decompress;
> > +	struct pisp_be_dpc_config dpc;
> > +	struct pisp_be_geq_config geq;
> > +	struct pisp_image_format_config tdn_input_format;
> > +	struct pisp_decompress_config tdn_decompress;
> > +	struct pisp_be_tdn_config tdn;
> > +	struct pisp_compress_config tdn_compress;
> > +	struct pisp_image_format_config tdn_output_format;
> > +	struct pisp_be_sdn_config sdn;
> > +	struct pisp_bla_config blc;
> > +	struct pisp_compress_config stitch_compress;
> > +	struct pisp_image_format_config stitch_output_format;
> > +	struct pisp_image_format_config stitch_input_format;
> > +	struct pisp_decompress_config stitch_decompress;
> > +	struct pisp_be_stitch_config stitch;
> > +	struct pisp_be_lsc_config lsc;
> > +	struct pisp_wbg_config wbg;
> > +	struct pisp_be_cdn_config cdn;
> > +	struct pisp_be_cac_config cac;
> > +	struct pisp_be_debin_config debin;
> > +	struct pisp_be_tonemap_config tonemap;
> > +	struct pisp_be_demosaic_config demosaic;
> > +	struct pisp_be_ccm_config ccm;
> > +	struct pisp_be_sat_control_config sat_control;
> > +	struct pisp_be_ccm_config ycbcr;
> > +	struct pisp_be_sharpen_config sharpen;
> > +	struct pisp_be_false_colour_config false_colour;
> > +	struct pisp_be_sh_fc_combine_config sh_fc_combine;
> > +	struct pisp_be_ccm_config ycbcr_inverse;
> > +	struct pisp_be_gamma_config gamma;
> > +	struct pisp_be_ccm_config csc[PISP_BACK_END_NUM_OUTPUTS];
> > +	struct pisp_be_downscale_config downscale[PISP_BACK_END_NUM_OUTPUTS];
> > +	struct pisp_be_resample_config resample[PISP_BACK_END_NUM_OUTPUTS];
> > +	struct pisp_be_output_format_config
> > +				output_format[PISP_BACK_END_NUM_OUTPUTS];
> > +	struct pisp_be_hog_config hog;
> > +	struct pisp_be_axi_config axi;
> > +	/* Non-register fields: */
> > +	struct pisp_be_lsc_extra lsc_extra;
> > +	struct pisp_be_cac_extra cac_extra;
> > +	struct pisp_be_downscale_extra
> > +				downscale_extra[PISP_BACK_END_NUM_OUTPUTS];
> > +	struct pisp_be_resample_extra resample_extra[PISP_BACK_END_NUM_OUTPUTS];
> > +	struct pisp_be_crop_config crop;
> > +	struct pisp_image_format_config hog_format;
> > +	__u32 dirty_flags_bayer; /* these use pisp_be_bayer_enable */
> > +	__u32 dirty_flags_rgb; /* use pisp_be_rgb_enable */
> > +	__u32 dirty_flags_extra; /* these use pisp_be_dirty_t */
> > +} __attribute__((packed));
> > +
> > +/*
> > + * We also need a tile structure to describe the size of the tiles going
> > + * through the pipeline.
> > + */
> > +
> > +enum pisp_tile_edge {
> > +	PISP_LEFT_EDGE = (1 << 0),
> > +	PISP_RIGHT_EDGE = (1 << 1),
> > +	PISP_TOP_EDGE = (1 << 2),
> > +	PISP_BOTTOM_EDGE = (1 << 3)
> > +};
> > +
> > +struct pisp_tile {
> > +	__u8 edge; // enum pisp_tile_edge
> > +	__u8 pad0[3];
> > +	// 4 bytes
>
> 	/* Single-line comment */
>

I'll fix

I'll send a new version soon! Thanks
  j

> > +	__u32 input_addr_offset;
> > +	__u32 input_addr_offset2;
> > +	__u16 input_offset_x;
> > +	__u16 input_offset_y;
> > +	__u16 input_width;
> > +	__u16 input_height;
> > +	// 20 bytes
> > +	__u32 tdn_input_addr_offset;
> > +	__u32 tdn_output_addr_offset;
> > +	__u32 stitch_input_addr_offset;
> > +	__u32 stitch_output_addr_offset;
> > +	// 36 bytes
> > +	__u32 lsc_grid_offset_x;
> > +	__u32 lsc_grid_offset_y;
> > +	// 44 bytes
> > +	__u32 cac_grid_offset_x;
> > +	__u32 cac_grid_offset_y;
> > +	// 52 bytes
> > +	__u16 crop_x_start[PISP_BACK_END_NUM_OUTPUTS];
> > +	__u16 crop_x_end[PISP_BACK_END_NUM_OUTPUTS];
> > +	__u16 crop_y_start[PISP_BACK_END_NUM_OUTPUTS];
> > +	__u16 crop_y_end[PISP_BACK_END_NUM_OUTPUTS];
> > +	// 68 bytes
> > +	/* Ordering is planes then branches */
> > +	__u16 downscale_phase_x[3 * PISP_BACK_END_NUM_OUTPUTS];
> > +	__u16 downscale_phase_y[3 * PISP_BACK_END_NUM_OUTPUTS];
> > +	// 92 bytes
> > +	__u16 resample_in_width[PISP_BACK_END_NUM_OUTPUTS];
> > +	__u16 resample_in_height[PISP_BACK_END_NUM_OUTPUTS];
> > +	// 100 bytes
> > +	/* Ordering is planes then branches */
> > +	__u16 resample_phase_x[3 * PISP_BACK_END_NUM_OUTPUTS];
> > +	__u16 resample_phase_y[3 * PISP_BACK_END_NUM_OUTPUTS];
> > +	// 124 bytes
> > +	__u16 output_offset_x[PISP_BACK_END_NUM_OUTPUTS];
> > +	__u16 output_offset_y[PISP_BACK_END_NUM_OUTPUTS];
> > +	__u16 output_width[PISP_BACK_END_NUM_OUTPUTS];
> > +	__u16 output_height[PISP_BACK_END_NUM_OUTPUTS];
> > +	// 140 bytes
> > +	__u32 output_addr_offset[PISP_BACK_END_NUM_OUTPUTS];
> > +	__u32 output_addr_offset2[PISP_BACK_END_NUM_OUTPUTS];
> > +	// 156 bytes
> > +	__u32 output_hog_addr_offset;
> > +	// 160 bytes
> > +} __attribute__((packed));
> > +
> > +struct pisp_be_tiles_config {
> > +	struct pisp_be_config config;
> > +	struct pisp_tile tiles[PISP_BACK_END_NUM_TILES];
> > +	int num_tiles;
> > +} __attribute__((packed));
> > +
> > +#endif /* _UAPI_PISP_BE_CONFIG_H_ */
> > diff --git a/include/uapi/linux/media/raspberrypi/pisp_common.h b/include/uapi/linux/media/raspberrypi/pisp_common.h
> > new file mode 100644
> > index 000000000000..b2522e29c976
> > --- /dev/null
> > +++ b/include/uapi/linux/media/raspberrypi/pisp_common.h
> > @@ -0,0 +1,199 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > +/*
> > + * RP1 PiSP common definitions.
> > + *
> > + * Copyright (C) 2021 - Raspberry Pi Ltd.
> > + *
> > + */
> > +#ifndef _UAPI_PISP_COMMON_H_
> > +#define _UAPI_PISP_COMMON_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct pisp_image_format_config {
> > +	/* size in pixels */
> > +	__u16 width;
> > +	__u16 height;
> > +	/* must match struct pisp_image_format below */
> > +	__u32 format;
> > +	__s32 stride;
> > +	/* some planar image formats will need a second stride */
> > +	__s32 stride2;
> > +} __attribute__((packed));
> > +
> > +enum pisp_bayer_order {
> > +	/*
> > +	 * Note how bayer_order&1 tells you if G is on the even pixels of the
> > +	 * checkerboard or not, and bayer_order&2 tells you if R is on the even
> > +	 * rows or is swapped with B. Note that if the top (of the 8) bits is
> > +	 * set, this denotes a monochrome or greyscale image, and the lower bits
> > +	 * should all be ignored.
> > +	 */
> > +	PISP_BAYER_ORDER_RGGB = 0,
> > +	PISP_BAYER_ORDER_GBRG = 1,
> > +	PISP_BAYER_ORDER_BGGR = 2,
> > +	PISP_BAYER_ORDER_GRBG = 3,
> > +	PISP_BAYER_ORDER_GREYSCALE = 128
> > +};
> > +
> > +enum pisp_image_format {
> > +	/*
> > +	 * Precise values are mostly tbd. Generally these will be portmanteau
> > +	 * values comprising bit fields and flags. This format must be shared
> > +	 * throughout the PiSP.
> > +	 */
> > +	PISP_IMAGE_FORMAT_BPS_8 = 0x00000000,
> > +	PISP_IMAGE_FORMAT_BPS_10 = 0x00000001,
> > +	PISP_IMAGE_FORMAT_BPS_12 = 0x00000002,
> > +	PISP_IMAGE_FORMAT_BPS_16 = 0x00000003,
> > +	PISP_IMAGE_FORMAT_BPS_MASK = 0x00000003,
> > +
> > +	PISP_IMAGE_FORMAT_PLANARITY_INTERLEAVED = 0x00000000,
> > +	PISP_IMAGE_FORMAT_PLANARITY_SEMI_PLANAR = 0x00000010,
> > +	PISP_IMAGE_FORMAT_PLANARITY_PLANAR = 0x00000020,
> > +	PISP_IMAGE_FORMAT_PLANARITY_MASK = 0x00000030,
> > +
> > +	PISP_IMAGE_FORMAT_SAMPLING_444 = 0x00000000,
> > +	PISP_IMAGE_FORMAT_SAMPLING_422 = 0x00000100,
> > +	PISP_IMAGE_FORMAT_SAMPLING_420 = 0x00000200,
> > +	PISP_IMAGE_FORMAT_SAMPLING_MASK = 0x00000300,
> > +
> > +	PISP_IMAGE_FORMAT_ORDER_NORMAL = 0x00000000,
> > +	PISP_IMAGE_FORMAT_ORDER_SWAPPED = 0x00001000,
> > +
> > +	PISP_IMAGE_FORMAT_SHIFT_0 = 0x00000000,
> > +	PISP_IMAGE_FORMAT_SHIFT_1 = 0x00010000,
> > +	PISP_IMAGE_FORMAT_SHIFT_2 = 0x00020000,
> > +	PISP_IMAGE_FORMAT_SHIFT_3 = 0x00030000,
> > +	PISP_IMAGE_FORMAT_SHIFT_4 = 0x00040000,
> > +	PISP_IMAGE_FORMAT_SHIFT_5 = 0x00050000,
> > +	PISP_IMAGE_FORMAT_SHIFT_6 = 0x00060000,
> > +	PISP_IMAGE_FORMAT_SHIFT_7 = 0x00070000,
> > +	PISP_IMAGE_FORMAT_SHIFT_8 = 0x00080000,
> > +	PISP_IMAGE_FORMAT_SHIFT_MASK = 0x000f0000,
> > +
> > +	PISP_IMAGE_FORMAT_UNCOMPRESSED = 0x00000000,
> > +	PISP_IMAGE_FORMAT_COMPRESSION_MODE_1 = 0x01000000,
> > +	PISP_IMAGE_FORMAT_COMPRESSION_MODE_2 = 0x02000000,
> > +	PISP_IMAGE_FORMAT_COMPRESSION_MODE_3 = 0x03000000,
> > +	PISP_IMAGE_FORMAT_COMPRESSION_MASK = 0x03000000,
> > +
> > +	PISP_IMAGE_FORMAT_HOG_SIGNED = 0x04000000,
> > +	PISP_IMAGE_FORMAT_HOG_UNSIGNED = 0x08000000,
> > +	PISP_IMAGE_FORMAT_INTEGRAL_IMAGE = 0x10000000,
> > +	PISP_IMAGE_FORMAT_WALLPAPER_ROLL = 0x20000000,
> > +	PISP_IMAGE_FORMAT_THREE_CHANNEL = 0x40000000,
> > +
> > +	/* Lastly a few specific instantiations of the above. */
> > +	PISP_IMAGE_FORMAT_SINGLE_16 = PISP_IMAGE_FORMAT_BPS_16,
> > +	PISP_IMAGE_FORMAT_THREE_16 = PISP_IMAGE_FORMAT_BPS_16 |
> > +				     PISP_IMAGE_FORMAT_THREE_CHANNEL
> > +};
> > +
> > +#define PISP_IMAGE_FORMAT_bps_8(fmt)                                           \
> > +	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_8)
> > +#define PISP_IMAGE_FORMAT_bps_10(fmt)                                          \
> > +	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_10)
> > +#define PISP_IMAGE_FORMAT_bps_12(fmt)                                          \
> > +	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_12)
> > +#define PISP_IMAGE_FORMAT_bps_16(fmt)                                          \
> > +	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_16)
> > +#define PISP_IMAGE_FORMAT_bps(fmt)                                             \
> > +	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) ?                                \
> > +	       8 + (2 << (((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) - 1)) : 8)
> > +#define PISP_IMAGE_FORMAT_shift(fmt)                                           \
> > +	(((fmt) & PISP_IMAGE_FORMAT_SHIFT_MASK) / PISP_IMAGE_FORMAT_SHIFT_1)
> > +#define PISP_IMAGE_FORMAT_three_channel(fmt)                                   \
> > +	((fmt) & PISP_IMAGE_FORMAT_THREE_CHANNEL)
> > +#define PISP_IMAGE_FORMAT_single_channel(fmt)                                  \
> > +	(!((fmt) & PISP_IMAGE_FORMAT_THREE_CHANNEL))
> > +#define PISP_IMAGE_FORMAT_compressed(fmt)                                      \
> > +	(((fmt) & PISP_IMAGE_FORMAT_COMPRESSION_MASK) !=                       \
> > +	 PISP_IMAGE_FORMAT_UNCOMPRESSED)
> > +#define PISP_IMAGE_FORMAT_sampling_444(fmt)                                    \
> > +	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
> > +	 PISP_IMAGE_FORMAT_SAMPLING_444)
> > +#define PISP_IMAGE_FORMAT_sampling_422(fmt)                                    \
> > +	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
> > +	 PISP_IMAGE_FORMAT_SAMPLING_422)
> > +#define PISP_IMAGE_FORMAT_sampling_420(fmt)                                    \
> > +	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
> > +	 PISP_IMAGE_FORMAT_SAMPLING_420)
> > +#define PISP_IMAGE_FORMAT_order_normal(fmt)                                    \
> > +	(!((fmt) & PISP_IMAGE_FORMAT_ORDER_SWAPPED))
> > +#define PISP_IMAGE_FORMAT_order_swapped(fmt)                                   \
> > +	((fmt) & PISP_IMAGE_FORMAT_ORDER_SWAPPED)
> > +#define PISP_IMAGE_FORMAT_interleaved(fmt)                                     \
> > +	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
> > +	 PISP_IMAGE_FORMAT_PLANARITY_INTERLEAVED)
> > +#define PISP_IMAGE_FORMAT_semiplanar(fmt)                                      \
> > +	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
> > +	 PISP_IMAGE_FORMAT_PLANARITY_SEMI_PLANAR)
> > +#define PISP_IMAGE_FORMAT_planar(fmt)                                          \
> > +	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
> > +	 PISP_IMAGE_FORMAT_PLANARITY_PLANAR)
> > +#define PISP_IMAGE_FORMAT_wallpaper(fmt)                                       \
> > +	((fmt) & PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
> > +#define PISP_IMAGE_FORMAT_HOG(fmt)                                             \
> > +	((fmt) &                                                               \
> > +	 (PISP_IMAGE_FORMAT_HOG_SIGNED | PISP_IMAGE_FORMAT_HOG_UNSIGNED))
> > +
> > +#define PISP_WALLPAPER_WIDTH 128 /* in bytes */
> > +
> > +struct pisp_bla_config {
> > +	__u16 black_level_r;
> > +	__u16 black_level_gr;
> > +	__u16 black_level_gb;
> > +	__u16 black_level_b;
> > +	__u16 output_black_level;
> > +	__u8 pad[2];
> > +} __attribute__((packed));
> > +
> > +struct pisp_wbg_config {
> > +	__u16 gain_r;
> > +	__u16 gain_g;
> > +	__u16 gain_b;
> > +	__u8 pad[2];
> > +} __attribute__((packed));
> > +
> > +struct pisp_compress_config {
> > +	/* value subtracted from incoming data */
> > +	__u16 offset;
> > +	__u8 pad;
> > +	/* 1 => Companding; 2 => Delta (recommended); 3 => Combined (for HDR) */
> > +	__u8 mode;
> > +} __attribute__((packed));
> > +
> > +struct pisp_decompress_config {
> > +	/* value added to reconstructed data */
> > +	__u16 offset;
> > +	__u8 pad;
> > +	/* 1 => Companding; 2 => Delta (recommended); 3 => Combined (for HDR) */
> > +	__u8 mode;
> > +} __attribute__((packed));
> > +
> > +enum pisp_axi_flags {
> > +	/*
> > +	 * round down bursts to end at a 32-byte boundary, to align following
> > +	 * bursts
> > +	 */
> > +	PISP_AXI_FLAG_ALIGN = 128,
> > +	/* for FE writer: force WSTRB high, to pad output to 16-byte boundary */
> > +	PISP_AXI_FLAG_PAD = 64,
> > +	/* for FE writer: Use Output FIFO level to trigger "panic" */
> > +	PISP_AXI_FLAG_PANIC = 32,
> > +};
> > +
> > +struct pisp_axi_config {
> > +	/*
> > +	 * burst length minus one, which must be in the range 0:15; OR'd with
> > +	 * flags
> > +	 */
> > +	__u8 maxlen_flags;
> > +	/* { prot[2:0], cache[3:0] } fields, echoed on AXI bus */
> > +	__u8 cache_prot;
> > +	/* QoS field(s) (4x4 bits for FE writer; 4 bits for other masters) */
> > +	__u16 qos;
> > +} __attribute__((packed));
> > +
> > +#endif /* _UAPI_PISP_COMMON_H_ */
>
> --
> Kind regards,
>
> Sakari Ailus

