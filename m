Return-Path: <linux-media+bounces-7001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5175887A7B4
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 13:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCFA11F242D6
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 12:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103FC6AD6;
	Wed, 13 Mar 2024 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vRnUlQ/i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4BD15D1
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710333677; cv=none; b=UMh/sqBsLw8kOuHEMygTV8VxI6u+otEnFOz52zEXhD9EVFtbTpIv1xjLNTQ2DsOVVEwhmpCtCD9oPnVxdL0WqX70rGdrZcl2w/EeLDpOMPzyWrBVt85sGlBddVGbMlf1hkIwiR2GguKY8NdV31P+O4p372VFGxON2eJKM+7aAus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710333677; c=relaxed/simple;
	bh=O/Wv5HTMdlrjCaNwm1n48t+K41wHaiwjKGLfCkW7rhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urs1CQSvdv8Es9PeSN2cRTbev6yEHTJjD3PASqV089N8nnQsTHOZx2d4M33ubUi7MlBud/ws1SuyjoT+Kh8rHe2MVceXp5nM41YfmV47snBmIovTma1jCszk0IOr7NmcNWQC/TGk5ts167fqUAoEjtyZPdfAuEqDvj4D0NfZvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vRnUlQ/i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27025899;
	Wed, 13 Mar 2024 13:40:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710333650;
	bh=O/Wv5HTMdlrjCaNwm1n48t+K41wHaiwjKGLfCkW7rhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vRnUlQ/i/IUAJltIhGV0EHGct627nk1wtenq3oXa1EXdPe2SY4EirSCnAYKkpIiyc
	 16SudZLvXE5rDbGNv4HEN9wRyD01S2qzoVXDYf1v6D4jzMzE3N5natmYFtGOfGPttY
	 JnsdO7YG2070Dz9p8JleTyIa9+zj2lpljgjq9GhM=
Date: Wed, 13 Mar 2024 13:41:09 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, David Plowman <david.plowman@raspberrypi.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 8/9] media: raspberrypi: Add support for PiSP BE
Message-ID: <smqydagmfw3e7fspnzorgmh2qiwairuonazuwh7vdntimhxikg@gzttbrv7q4mq>
References: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com>
 <20240308085028.44388-9-jacopo.mondi@ideasonboard.com>
 <Ze7UsGgZ6W42fmgT@valkosipuli.retiisi.eu>
 <lsnv73m36ajckpgaurn7zbt2ybmdgiuyv3nbykzjo5n5vb63mh@yvwoh2bwgieg>
 <ZfGc1WkXkzQPERIZ@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZfGc1WkXkzQPERIZ@valkosipuli.retiisi.eu>

Hi Sakari

On Wed, Mar 13, 2024 at 12:32:21PM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Mar 13, 2024 at 11:57:45AM +0100, Jacopo Mondi wrote:
> > On Mon, Mar 11, 2024 at 09:53:52AM +0000, Sakari Ailus wrote:
> > > > +	config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
> > > > +	job->config = &node_group->config[config_index];
> > > > +	job->tiles = node_group->config_dma_addr
> > > > +		   + config_index * sizeof(struct pisp_be_tiles_config)
> > > > +		   + offsetof(struct pisp_be_tiles_config, tiles);
> > >
> > > The operators should be on the previous lines.
> > >
> >
> > May I ask why ?
>
> I recall this used to be documented in CodingStyle when it was a text file
> but I couldn't find it anymore.
>
> It's very uncommon to do that, line break should take place after the
> binary operators.
>
> Feel free to ask e.g. Laurent for an opinion. :-)
>

No need, I've done as you suggested in v5

> >
> > > > +
> > > > +	/* remember: srcimages, captures then metadata */
> > > > +	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++) {
> > > > +		unsigned int bayer_en =
> > > > +			job->config->config.global.bayer_enables;
> > > > +		unsigned int rgb_en =
> > > > +			job->config->config.global.rgb_enables;
> > > > +		bool ignore_buffers = false;
> > > > +
> > > > +		/* Config node is handled outside the loop above. */
> > > > +		if (i == CONFIG_NODE)
> > > > +			continue;
> > > > +
> > > > +		buf[i] = NULL;
> > > > +		if (!(node_group->streaming_map & BIT(i)))
> > > > +			continue;
> > > > +
> > > > +		if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
> > > > +		     i == OUTPUT0_NODE) ||
> > > > +		    (!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT1) &&
> > > > +		     i == OUTPUT1_NODE) ||
> > > > +		    (!(bayer_en & PISP_BE_BAYER_ENABLE_TDN_INPUT) &&
> > > > +		     i == TDN_INPUT_NODE) ||
> > > > +		    (!(bayer_en & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) &&
> > > > +		     i == TDN_OUTPUT_NODE) ||
> > > > +		    (!(bayer_en & PISP_BE_BAYER_ENABLE_STITCH_INPUT) &&
> > > > +		     i == STITCH_INPUT_NODE) ||
> > > > +		    (!(bayer_en & PISP_BE_BAYER_ENABLE_STITCH_OUTPUT) &&
> > > > +		     i == STITCH_OUTPUT_NODE)) {
> > > > +			/*
> > > > +			 * Ignore Output0/Output1/Tdn/Stitch buffer check if the
> > > > +			 * global enables aren't set for these blocks. If a
> > > > +			 * buffer has been provided, we dequeue it back to the
> > > > +			 * user with the other in-use buffers.
> > > > +			 */
> > > > +			ignore_buffers = true;
> > > > +		}
> > > > +
> > > > +		node = &node_group->node[i];
> > > > +
> > > > +		/* Pull a buffer from each V4L2 queue to form the queued job */
> > > > +		spin_lock_irqsave(&node->ready_lock, flags);
> > > > +		buf[i] = list_first_entry_or_null(&node->ready_queue,
> > > > +						  struct pispbe_buffer,
> > > > +						  ready_list);
> > > > +		if (buf[i]) {
> > > > +			list_del(&buf[i]->ready_list);
> > > > +			pispbe->queued_job.buf[i] = buf[i];
> > > > +		}
> > > > +		spin_unlock_irqrestore(&node->ready_lock, flags);
> > > > +
> > > > +		if (!buf[i] && !ignore_buffers)
> > > > +			goto err_return_buffers;
> > > > +	}
> > > > +
> > > > +	pispbe->queued_job.node_group = node_group;
> > > > +
> > > > +	/* Convert buffers to DMA addresses for the hardware */
> > > > +	pispbe_xlate_addrs(job->hw_dma_addrs, job->hw_enables,
> > > > +			   job->config, buf, node_group);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_return_buffers:
> > > > +	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++) {
> > > > +		struct pispbe_node *n =  &node_group->node[i];
> > > > +
> > > > +		if (!buf[i])
> > > > +			continue;
> > > > +
> > > > +		/* Return the buffer to the ready_list queue */
> > > > +		spin_lock_irqsave(&n->ready_lock, flags);
> > > > +		list_add(&buf[i]->ready_list, &n->ready_queue);
> > > > +		spin_unlock_irqrestore(&n->ready_lock, flags);
> > > > +	}
> > > > +
> > > > +	memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
> > > > +
> > > > +	return -ENODEV;
> > > > +}
> > >
> > > ...
> > >
> > > > +static int pisp_be_validate_config(struct pispbe_node_group *node_group,
> > > > +				   struct pisp_be_tiles_config *config)
> > > > +{
> > > > +	u32 bayer_enables = config->config.global.bayer_enables;
> > > > +	u32 rgb_enables = config->config.global.rgb_enables;
> > > > +	struct device *dev = node_group->pispbe->dev;
> > > > +	struct v4l2_format *fmt;
> > > > +	unsigned int bpl, size;
> > > > +
> > > > +	if (!(bayer_enables & PISP_BE_BAYER_ENABLE_INPUT) ==
> > > > +	    !(rgb_enables & PISP_BE_RGB_ENABLE_INPUT)) {
> > > > +		dev_err(dev, "%s: Not one input enabled\n", __func__);
> > > > +		return -EIO;
> > > > +	}
> > > > +
> > > > +	/* Ensure output config strides and buffer sizes match the V4L2 formats. */
> > > > +	fmt = &node_group->node[TDN_OUTPUT_NODE].format;
> > > > +	if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {
> > > > +		bpl = config->config.tdn_output_format.stride;
> > > > +		size = bpl * config->config.tdn_output_format.height;
> > > > +		if (fmt->fmt.pix_mp.plane_fmt[0].bytesperline < bpl) {
> > > > +			dev_err(dev, "%s: bpl mismatch on tdn_output\n",
> > > > +				__func__);
> > >
> > > Aren't you validating user-provided configuration here? Then use dev_dbg(),
> > > as a regular user isn't supposed to trigger log-filling by simply throwing
> > > invalid configuration to the kernel.
> > >
> > > Same below (and above, too).
> > >
> >
> > Ack, will make it dev_dbg
> >
> > > > +			return -EINVAL;
> > > > +		}
> > > > +		if (fmt->fmt.pix_mp.plane_fmt[0].sizeimage < size) {
> > > > +			dev_err(dev, "%s: size mismatch on tdn_output\n",
> > > > +				__func__);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	fmt = &node_group->node[STITCH_OUTPUT_NODE].format;
> > > > +	if (bayer_enables & PISP_BE_BAYER_ENABLE_STITCH_OUTPUT) {
> > > > +		bpl = config->config.stitch_output_format.stride;
> > > > +		size = bpl * config->config.stitch_output_format.height;
> > > > +		if (fmt->fmt.pix_mp.plane_fmt[0].bytesperline < bpl) {
> > > > +			dev_err(dev, "%s: bpl mismatch on stitch_output\n",
> > > > +				__func__);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +		if (fmt->fmt.pix_mp.plane_fmt[0].sizeimage < size) {
> > > > +			dev_err(dev, "%s: size mismatch on stitch_output\n",
> > > > +				__func__);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	for (unsigned int j = 0; j < PISP_BACK_END_NUM_OUTPUTS; j++) {
> > > > +		if (!(rgb_enables & PISP_BE_RGB_ENABLE_OUTPUT(j)))
> > > > +			continue;
> > > > +		if (config->config.output_format[j].image.format &
> > > > +		    PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
> > > > +			continue; /* TODO: Size checks for wallpaper formats */
> > > > +
> > > > +		fmt = &node_group->node[OUTPUT0_NODE + j].format;
> > > > +		for (unsigned int i = 0; i < fmt->fmt.pix_mp.num_planes; i++) {
> > > > +			bpl = !i ? config->config.output_format[j].image.stride
> > > > +			    : config->config.output_format[j].image.stride2;
> > > > +			size = bpl * config->config.output_format[j].image.height;
> > > > +
> > > > +			if (config->config.output_format[j].image.format &
> > > > +						PISP_IMAGE_FORMAT_SAMPLING_420)
> > > > +				size >>= 1;
> > > > +			if (fmt->fmt.pix_mp.plane_fmt[i].bytesperline < bpl) {
> > > > +				dev_err(dev, "%s: bpl mismatch on output %d\n",
> > > > +					__func__, j);
> > > > +				return -EINVAL;
> > > > +			}
> > > > +			if (fmt->fmt.pix_mp.plane_fmt[i].sizeimage < size) {
> > > > +				dev_err(dev, "%s: size mismatch on output\n",
> > > > +					__func__);
> > > > +				return -EINVAL;
> > > > +			}
> > > > +		}
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int pispbe_node_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
> > > > +				   unsigned int *nplanes, unsigned int sizes[],
> > > > +				   struct device *alloc_devs[])
> > > > +{
> > > > +	struct pispbe_node *node = vb2_get_drv_priv(q);
> > > > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > > > +
> > > > +	*nplanes = 1;
> > > > +	if (NODE_IS_MPLANE(node)) {
> > > > +		*nplanes = node->format.fmt.pix_mp.num_planes;
> > > > +		for (unsigned int i = 0; i < *nplanes; i++) {
> > > > +			unsigned int size =
> > > > +				node->format.fmt.pix_mp.plane_fmt[i].sizeimage;
> > >
> > > A newline would be nice here.
> > >
> >
> > Ack
> >
> > > > +			if (sizes[i] && sizes[i] < size) {
> > > > +				dev_err(pispbe->dev, "%s: size %u < %u\n",
> > > > +					__func__, sizes[i], size);
> > > > +				return -EINVAL;
> > > > +			}
> > > > +			sizes[i] = size;
> > > > +		}
> > > > +	} else if (NODE_IS_META(node)) {
> > > > +		sizes[0] = node->format.fmt.meta.buffersize;
> > > > +		/*
> > > > +		 * Limit the config node buffer count to the number of internal
> > > > +		 * buffers allocated.
> > > > +		 */
> > > > +		if (node->id == CONFIG_NODE)
> > > > +			*nbuffers = min_t(unsigned int, *nbuffers,
> > > > +					  PISP_BE_NUM_CONFIG_BUFFERS);
> > > > +	}
> > > > +
> > > > +	dev_dbg(pispbe->dev,
> > > > +		"Image (or metadata) size %u, nbuffers %u for node %s\n",
> > > > +		sizes[0], *nbuffers, NODE_NAME(node));
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
> > > > +{
> > > > +	struct pispbe_node *node = vb2_get_drv_priv(vb->vb2_queue);
> > > > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > > > +	unsigned long size = 0;
> > > > +	unsigned int num_planes = NODE_IS_MPLANE(node)
> > > > +				? node->format.fmt.pix_mp.num_planes : 1;
> > > > +
> > > > +	for (unsigned int i = 0; i < num_planes; i++) {
> > > > +		size = NODE_IS_MPLANE(node)
> > > > +			? node->format.fmt.pix_mp.plane_fmt[i].sizeimage
> > > > +			: node->format.fmt.meta.buffersize;
> > > > +
> > > > +		if (vb2_plane_size(vb, i) < size) {
> > > > +			dev_err(pispbe->dev,
> > > > +				"data will not fit into plane %d (%lu < %lu)\n",
> > > > +				i, vb2_plane_size(vb, i), size);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +
> > > > +		vb2_set_plane_payload(vb, i, size);
> > > > +	}
> > > > +
> > > > +	if (node->id == CONFIG_NODE) {
> > > > +		void *dst = &node->node_group->config[vb->index];
> > > > +		void *src = vb2_plane_vaddr(vb, 0);
> > > > +
> > > > +		memcpy(dst, src, sizeof(struct pisp_be_tiles_config));
> > >
> > > Here, too.
> > >
> >
> > Ack
> >
> > > > +		return pisp_be_validate_config(node->node_group, dst);
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > >
> > > ...
> > >
> > > > +static int pispbe_node_g_fmt_meta_out(struct file *file, void *priv,
> > > > +				      struct v4l2_format *f)
> > > > +{
> > > > +	struct pispbe_node *node = video_drvdata(file);
> > > > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > > > +
> > > > +	if (!NODE_IS_META(node) || NODE_IS_CAPTURE(node)) {
> > > > +		dev_err(pispbe->dev,
> > > > +			"Cannot get capture fmt for meta output node %s\n",
> > > > +			NODE_NAME(node));
> > > > +		return -EINVAL;
> > > > +	}
> > > > +	*f = node->format;
> > > > +	dev_dbg(pispbe->dev, "Get output format for meta node %s\n",
> > > > +		NODE_NAME(node));
> > >
> > > Ditto.
> > >
> > > > +	return 0;
> > > > +}
> > >
> > > ...
> > >
> > > > +static int pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
> > > > +{
> > > > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > > > +	u32 pixfmt = f->fmt.pix_mp.pixelformat;
> > > > +	const struct pisp_be_format *fmt;
> > > > +	bool is_rgb;
> > > > +
> > > > +	dev_dbg(pispbe->dev,
> > > > +		"%s: [%s] req %ux%u %p4cc, planes %d\n",
> > > > +		__func__, NODE_NAME(node), f->fmt.pix_mp.width,
> > > > +		f->fmt.pix_mp.height, &pixfmt,
> > > > +		f->fmt.pix_mp.num_planes);
> > > > +
> > > > +	fmt = pispbe_find_fmt(pixfmt);
> > > > +	if (!fmt) {
> > > > +		dev_dbg(pispbe->dev,
> > > > +			"%s: [%s] Format not found, defaulting to YUV420\n",
> > > > +			__func__, NODE_NAME(node));
> > > > +		fmt = pispbe_find_fmt(V4L2_PIX_FMT_YUV420);
> > > > +	}
> > > > +
> > > > +	f->fmt.pix_mp.pixelformat = fmt->fourcc;
> > > > +	f->fmt.pix_mp.num_planes = fmt->num_planes;
> > > > +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> > > > +	f->fmt.pix_mp.width = max(min(f->fmt.pix_mp.width, 65536u),
> > > > +				  PISP_BACK_END_MIN_TILE_WIDTH);
> > > > +	f->fmt.pix_mp.height = max(min(f->fmt.pix_mp.height, 65536u),
> > > > +				   PISP_BACK_END_MIN_TILE_HEIGHT);
> > > > +
> > > > +	/*
> > > > +	 * Fill in the actual colour space when the requested one was
> > > > +	 * not supported. This also catches the case when the "default"
> > > > +	 * colour space was requested (as that's never in the mask).
> > > > +	 */
> > > > +	if (!(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
> > > > +	    fmt->colorspace_mask))
> > > > +		f->fmt.pix_mp.colorspace = fmt->colorspace_default;
> > > > +
> > > > +	/* In all cases, we only support the defaults for these: */
> > > > +	f->fmt.pix_mp.ycbcr_enc =
> > > > +		V4L2_MAP_YCBCR_ENC_DEFAULT(f->fmt.pix_mp.colorspace);
> > > > +	f->fmt.pix_mp.xfer_func =
> > > > +		V4L2_MAP_XFER_FUNC_DEFAULT(f->fmt.pix_mp.colorspace);
> > > > +
> > > > +	is_rgb = f->fmt.pix_mp.colorspace == V4L2_COLORSPACE_SRGB;
> > > > +	f->fmt.pix_mp.quantization =
> > > > +		V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb, f->fmt.pix_mp.colorspace,
> > > > +					      f->fmt.pix_mp.ycbcr_enc);
> > > > +
> > > > +	/* Set plane size and bytes/line for each plane. */
> > > > +	pispbe_set_plane_params(f, fmt);
> > > > +
> > > > +	for (unsigned int i = 0; i < f->fmt.pix_mp.num_planes; i++) {
> > > > +		dev_dbg(pispbe->dev,
> > > > +			"%s: [%s] calc plane %d, %ux%u, depth %u, bpl %u size %u\n",
> > > > +			__func__, NODE_NAME(node), i, f->fmt.pix_mp.width,
> > > > +			f->fmt.pix_mp.height, fmt->bit_depth,
> > > > +			f->fmt.pix_mp.plane_fmt[i].bytesperline,
> > > > +			f->fmt.pix_mp.plane_fmt[i].sizeimage);
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int pispbe_node_try_fmt_vid_cap(struct file *file, void *priv,
> > > > +				       struct v4l2_format *f)
> > > > +{
> > > > +	struct pispbe_node *node = video_drvdata(file);
> > > > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > > > +	int ret;
> > > > +
> > > > +	if (!NODE_IS_CAPTURE(node) || NODE_IS_META(node)) {
> > > > +		dev_err(pispbe->dev,
> > > > +			"Cannot set capture fmt for output node %s\n",
> > > > +			NODE_NAME(node));
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	ret = pispbe_try_format(f, node);
> > > > +	if (ret < 0)
> > >
> > > pispbe_try_format() appears to return 0 always. How about making that
> > > return void and just return 0 here? Elsewhere, too.
> > >
> >
> > Right, will do!
> >
> > > > +		return ret;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int pispbe_node_try_fmt_vid_out(struct file *file, void *priv,
> > > > +				       struct v4l2_format *f)
> > > > +{
> > > > +	struct pispbe_node *node = video_drvdata(file);
> > > > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > > > +	int ret;
> > > > +
> > > > +	if (!NODE_IS_OUTPUT(node) || NODE_IS_META(node)) {
> > > > +		dev_err(pispbe->dev,
> > > > +			"Cannot set capture fmt for output node %s\n",
> > > > +			NODE_NAME(node));
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	ret = pispbe_try_format(f, node);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int pispbe_node_try_fmt_meta_out(struct file *file, void *priv,
> > > > +					struct v4l2_format *f)
> > > > +{
> > > > +	struct pispbe_node *node = video_drvdata(file);
> > > > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > > > +
> > > > +	if (!NODE_IS_META(node) || NODE_IS_CAPTURE(node)) {
> > > > +		dev_err(pispbe->dev,
> > > > +			"Cannot set capture fmt for meta output node %s\n",
> > > > +			NODE_NAME(node));
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
> > > > +	f->fmt.meta.buffersize = sizeof(struct pisp_be_tiles_config);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int pispbe_node_s_fmt_vid_cap(struct file *file, void *priv,
> > > > +				     struct v4l2_format *f)
> > > > +{
> > > > +	struct pispbe_node *node = video_drvdata(file);
> > > > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > > > +	int ret = pispbe_node_try_fmt_vid_cap(file, priv, f);
> > > > +
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	node->format = *f;
> > > > +	node->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
> > > > +
> > > > +	dev_dbg(pispbe->dev, "Set capture format for node %s to %p4cc\n",
> > > > +		NODE_NAME(node), &f->fmt.pix_mp.pixelformat);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int pispbe_node_s_fmt_vid_out(struct file *file, void *priv,
> > > > +				     struct v4l2_format *f)
> > > > +{
> > > > +	struct pispbe_node *node = video_drvdata(file);
> > > > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > > > +	int ret = pispbe_node_try_fmt_vid_out(file, priv, f);
> > > > +
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	node->format = *f;
> > > > +	node->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
> > > > +
> > > > +	dev_dbg(pispbe->dev, "Set output format for node %s to %p4cc\n",
> > > > +		NODE_NAME(node), &f->fmt.pix_mp.pixelformat);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int pispbe_node_s_fmt_meta_out(struct file *file, void *priv,
> > > > +				      struct v4l2_format *f)
> > > > +{
> > > > +	struct pispbe_node *node = video_drvdata(file);
> > > > +	struct pispbe_dev *pispbe = node->node_group->pispbe;
> > > > +	int ret = pispbe_node_try_fmt_meta_out(file, priv, f);
> > >
> > > Please don't to this in variable delaration. Instead, declare variable here
> > > and perform the assignment separately. Same above.
> > >
> >
> > Right!
> >
> > > > +
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	node->format = *f;
> > > > +	node->pisp_format = &meta_out_supported_formats[0];
> > > > +
> > > > +	dev_dbg(pispbe->dev, "Set output format for meta node %s to %p4cc\n",
> > > > +		NODE_NAME(node), &f->fmt.meta.dataformat);
> > > > +
> > > > +	return 0;
> > > > +}
> > >
> > > ...
> > >
> > > > diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> > > > new file mode 100644
> > > > index 000000000000..623ac3948426
> > > > --- /dev/null
> > > > +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> > > > @@ -0,0 +1,531 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > > > +/*
> > > > + * PiSP Back End configuration definitions.
> > > > + *
> > > > + * Copyright (C) 2021 - Raspberry Pi Ltd
> > > > + *
> > > > + */
> > > > +#ifndef _UAPI_PISP_BE_CONFIG_H_
> > > > +#define _UAPI_PISP_BE_CONFIG_H_
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +#include "pisp_common.h"
> > > > +
> > > > +/* byte alignment for inputs */
> > > > +#define PISP_BACK_END_INPUT_ALIGN 4u
> > > > +/* alignment for compressed inputs */
> > > > +#define PISP_BACK_END_COMPRESSED_ALIGN 8u
> > > > +/* minimum required byte alignment for outputs */
> > > > +#define PISP_BACK_END_OUTPUT_MIN_ALIGN 16u
> > > > +/* preferred byte alignment for outputs */
> > > > +#define PISP_BACK_END_OUTPUT_MAX_ALIGN 64u
> > > > +
> > > > +/* minimum allowed tile width anywhere in the pipeline */
> > > > +#define PISP_BACK_END_MIN_TILE_WIDTH 16u
> > > > +/* minimum allowed tile width anywhere in the pipeline */
> > > > +#define PISP_BACK_END_MIN_TILE_HEIGHT 16u
> > > > +
> > > > +#define PISP_BACK_END_NUM_OUTPUTS 2
> > > > +#define PISP_BACK_END_HOG_OUTPUT 1
> > > > +
> > > > +#define PISP_BACK_END_NUM_TILES 64
> > > > +
> > > > +enum pisp_be_bayer_enable {
> > > > +	PISP_BE_BAYER_ENABLE_INPUT = 0x000001,
> > > > +	PISP_BE_BAYER_ENABLE_DECOMPRESS = 0x000002,
> > > > +	PISP_BE_BAYER_ENABLE_DPC = 0x000004,
> > > > +	PISP_BE_BAYER_ENABLE_GEQ = 0x000008,
> > > > +	PISP_BE_BAYER_ENABLE_TDN_INPUT = 0x000010,
> > > > +	PISP_BE_BAYER_ENABLE_TDN_DECOMPRESS = 0x000020,
> > > > +	PISP_BE_BAYER_ENABLE_TDN = 0x000040,
> > > > +	PISP_BE_BAYER_ENABLE_TDN_COMPRESS = 0x000080,
> > > > +	PISP_BE_BAYER_ENABLE_TDN_OUTPUT = 0x000100,
> > > > +	PISP_BE_BAYER_ENABLE_SDN = 0x000200,
> > > > +	PISP_BE_BAYER_ENABLE_BLC = 0x000400,
> > > > +	PISP_BE_BAYER_ENABLE_STITCH_INPUT = 0x000800,
> > > > +	PISP_BE_BAYER_ENABLE_STITCH_DECOMPRESS = 0x001000,
> > > > +	PISP_BE_BAYER_ENABLE_STITCH = 0x002000,
> > > > +	PISP_BE_BAYER_ENABLE_STITCH_COMPRESS = 0x004000,
> > > > +	PISP_BE_BAYER_ENABLE_STITCH_OUTPUT = 0x008000,
> > > > +	PISP_BE_BAYER_ENABLE_WBG = 0x010000,
> > > > +	PISP_BE_BAYER_ENABLE_CDN = 0x020000,
> > > > +	PISP_BE_BAYER_ENABLE_LSC = 0x040000,
> > > > +	PISP_BE_BAYER_ENABLE_TONEMAP = 0x080000,
> > > > +	PISP_BE_BAYER_ENABLE_CAC = 0x100000,
> > > > +	PISP_BE_BAYER_ENABLE_DEBIN = 0x200000,
> > > > +	PISP_BE_BAYER_ENABLE_DEMOSAIC = 0x400000,
> > > > +};
> > > > +
> > > > +enum pisp_be_rgb_enable {
> > > > +	PISP_BE_RGB_ENABLE_INPUT = 0x000001,
> > > > +	PISP_BE_RGB_ENABLE_CCM = 0x000002,
> > > > +	PISP_BE_RGB_ENABLE_SAT_CONTROL = 0x000004,
> > > > +	PISP_BE_RGB_ENABLE_YCBCR = 0x000008,
> > > > +	PISP_BE_RGB_ENABLE_FALSE_COLOUR = 0x000010,
> > > > +	PISP_BE_RGB_ENABLE_SHARPEN = 0x000020,
> > > > +	/* Preferred colours would occupy 0x000040 */
> > > > +	PISP_BE_RGB_ENABLE_YCBCR_INVERSE = 0x000080,
> > > > +	PISP_BE_RGB_ENABLE_GAMMA = 0x000100,
> > > > +	PISP_BE_RGB_ENABLE_CSC0 = 0x000200,
> > > > +	PISP_BE_RGB_ENABLE_CSC1 = 0x000400,
> > > > +	PISP_BE_RGB_ENABLE_DOWNSCALE0 = 0x001000,
> > > > +	PISP_BE_RGB_ENABLE_DOWNSCALE1 = 0x002000,
> > > > +	PISP_BE_RGB_ENABLE_RESAMPLE0 = 0x008000,
> > > > +	PISP_BE_RGB_ENABLE_RESAMPLE1 = 0x010000,
> > > > +	PISP_BE_RGB_ENABLE_OUTPUT0 = 0x040000,
> > > > +	PISP_BE_RGB_ENABLE_OUTPUT1 = 0x080000,
> > > > +	PISP_BE_RGB_ENABLE_HOG = 0x200000
> > > > +};
> > > > +
> > > > +#define PISP_BE_RGB_ENABLE_CSC(i) (PISP_BE_RGB_ENABLE_CSC0 << (i))
> > > > +#define PISP_BE_RGB_ENABLE_DOWNSCALE(i) (PISP_BE_RGB_ENABLE_DOWNSCALE0 << (i))
> > > > +#define PISP_BE_RGB_ENABLE_RESAMPLE(i) (PISP_BE_RGB_ENABLE_RESAMPLE0 << (i))
> > > > +#define PISP_BE_RGB_ENABLE_OUTPUT(i) (PISP_BE_RGB_ENABLE_OUTPUT0 << (i))
> > > > +
> > > > +/*
> > > > + * We use the enable flags to show when blocks are "dirty", but we need some
> > > > + * extra ones too.
> > > > + */
> > > > +enum pisp_be_dirty {
> > > > +	PISP_BE_DIRTY_GLOBAL = 0x0001,
> > > > +	PISP_BE_DIRTY_SH_FC_COMBINE = 0x0002,
> > > > +	PISP_BE_DIRTY_CROP = 0x0004
> > > > +};
> > > > +
> > > > +struct pisp_be_global_config {
> > > > +	__u32 bayer_enables;
> > > > +	__u32 rgb_enables;
> > > > +	__u8 bayer_order;
> > > > +	__u8 pad[3];
> > > > +} __attribute__((packed));
> > >
> > > I wonder what is the current recommendation on packing the structs on
> > > different ABIs. On some archs (e.g. ARM) this involves more inefficient
> > > access of data on these structs and it would seem like that there are no
> > > direct struct layout related implications from packing apart from the main
> > > struct embedding other structs.
> > >
> > > The V4L2 IOCTL arguments have used packing just to be sure there are no
> > > holes but I wonder if it makes sense here. I've argued for this, too, but
> > > drawbacks exist as well.
> > >
> > > Any thoughts?
> > >
> > > How about checking this with pahole?
> >
> > I've run this through Hans' scripts as reported in the cover letter
> >
> > pahole: ABI OK
> >
> > But as Naush replied, this gets applied directly to the HW registers
> > layout, so packing is needed
>
> Not really for that reason, no, but this is up to you.
>

For my education, why isn't the fact that this struct gets applied
directly to HW a good reason to use packing ?

> --
> Regards,
>
> Sakari Ailus

