Return-Path: <linux-media+bounces-14062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE17914FAE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 16:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05DF11F22EA0
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A2C142659;
	Mon, 24 Jun 2024 14:13:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE26513A894
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719238411; cv=none; b=T7pOlJ31kmiW3Te5htTFtx6nMZj6hyBv23bO3tW2bcx01FAw0SFVTW8UxmlpgjD1zc48zfK/6gFf10PyEiPRh+eltUoKA53hb4hPYfHgEBxu/gMCpH3Vj9Xh4LOQgJtEx+9uV0R9zVug4ZfKCMQJdRhQgp4HdtUqtRuc+v5soOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719238411; c=relaxed/simple;
	bh=8L8XeZYDIavh55b2NLJVgVpbRqxTDW1RVBlC3732W/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9rMbdid5uQT+C1eR3zdr3RBdenBVwkx29B7vzf2pdl4xYW4nkx/qNd4kVOmUNQwZOlH6FCpEryyaDu9JtwQ6o5IcJyihm7vB85fzvmDumnllbV2urGnug/5S4t4xjZMsnbKbf/1SFqCSRUrBFxPktn8/rUjgvJxjK6bkrdIYJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39A2C2BBFC;
	Mon, 24 Jun 2024 14:13:27 +0000 (UTC)
Message-ID: <1d946407-935c-44b1-8a24-50346d942bd3@xs4all.nl>
Date: Mon, 24 Jun 2024 16:13:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] media: raspberrypi: Add support for PiSP BE
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: David Plowman <david.plowman@raspberrypi.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
 <20240531080707.34568-8-jacopo.mondi@ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240531080707.34568-8-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2024 10:07, Jacopo Mondi wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> Add support for the Raspberry Pi PiSP Back End.
> 
> The driver has been upported from the Raspberry Pi kernel at revision
> f74893f8a0c2 ("drivers: media: pisp_be: Update seqeuence numbers of the
> buffers").
> 
> The ISP documentation is available at:
> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> 
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  MAINTAINERS                                   |    1 +
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/raspberrypi/Kconfig    |    5 +
>  drivers/media/platform/raspberrypi/Makefile   |    3 +
>  .../platform/raspberrypi/pisp_be/Kconfig      |   12 +
>  .../platform/raspberrypi/pisp_be/Makefile     |    6 +
>  .../platform/raspberrypi/pisp_be/pisp_be.c    | 1809 +++++++++++++++++
>  .../raspberrypi/pisp_be/pisp_be_formats.h     |  519 +++++
>  9 files changed, 2357 insertions(+)
>  create mode 100644 drivers/media/platform/raspberrypi/Kconfig
>  create mode 100644 drivers/media/platform/raspberrypi/Makefile
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Kconfig
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Makefile
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
> 

<snip>

> +static int pispbe_node_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
> +				   unsigned int *nplanes, unsigned int sizes[],
> +				   struct device *alloc_devs[])
> +{
> +	struct pispbe_node *node = vb2_get_drv_priv(q);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +

This is wrong for VIDIOC_CREATE_BUFS:

the standard check is:

        if (*nplanes)
                return sizes[0] < size ? -EINVAL : 0;

(where 'size' is the actual minimum size of the plane).

But here 'sizes[0]' is updated to 'size', and that makes it impossible
to let userspace specify a larger buffer.

Now, v4l2-compliance should have failed on this code, but I am beginning
to suspect that there is a bug in v4l2-compliance. It's not the first time
I'm reviewing a driver that makes this mistake, but v4l2-compliance passes.

I'll dig into that on Wednesday.

In the meantime this code needs to be updated.

> +	*nplanes = 1;
> +	if (NODE_IS_MPLANE(node)) {
> +		*nplanes = node->format.fmt.pix_mp.num_planes;
> +		for (unsigned int i = 0; i < *nplanes; i++) {
> +			unsigned int size =
> +				node->format.fmt.pix_mp.plane_fmt[i].sizeimage;
> +
> +			if (sizes[i] && sizes[i] < size) {
> +				dev_dbg(pispbe->dev, "%s: size %u < %u\n",
> +					__func__, sizes[i], size);
> +				return -EINVAL;
> +			}
> +			sizes[i] = size;
> +		}
> +	} else if (NODE_IS_META(node)) {
> +		sizes[0] = node->format.fmt.meta.buffersize;
> +		/*
> +		 * Limit the config node buffer count to the number of internal
> +		 * buffers allocated.
> +		 */
> +		if (node->id == CONFIG_NODE)
> +			*nbuffers = min_t(unsigned int, *nbuffers,
> +					  PISP_BE_NUM_CONFIG_BUFFERS);
> +	}
> +
> +	dev_dbg(pispbe->dev,
> +		"Image (or metadata) size %u, nbuffers %u for node %s\n",
> +		sizes[0], *nbuffers, NODE_NAME(node));
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
> +{
> +	struct pispbe_node *node = vb2_get_drv_priv(vb->vb2_queue);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +	unsigned int num_planes = NODE_IS_MPLANE(node) ?
> +				  node->format.fmt.pix_mp.num_planes : 1;
> +
> +	for (unsigned int i = 0; i < num_planes; i++) {
> +		unsigned long size = NODE_IS_MPLANE(node) ?
> +				node->format.fmt.pix_mp.plane_fmt[i].sizeimage :
> +				node->format.fmt.meta.buffersize;
> +
> +		if (vb2_plane_size(vb, i) < size) {
> +			dev_dbg(pispbe->dev,
> +				"data will not fit into plane %d (%lu < %lu)\n",
> +				i, vb2_plane_size(vb, i), size);
> +			return -EINVAL;
> +		}
> +
> +		vb2_set_plane_payload(vb, i, size);
> +	}
> +
> +	if (node->id == CONFIG_NODE) {
> +		void *dst = &node->pispbe->config[vb->index];
> +		void *src = vb2_plane_vaddr(vb, 0);
> +
> +		memcpy(dst, src, sizeof(struct pisp_be_tiles_config));
> +
> +		return pisp_be_validate_config(pispbe, dst);
> +	}
> +
> +	return 0;
> +}
> +
> +static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
> +{
> +	struct vb2_v4l2_buffer *vbuf =
> +		container_of(buf, struct vb2_v4l2_buffer, vb2_buf);
> +	struct pispbe_buffer *buffer =
> +		container_of(vbuf, struct pispbe_buffer, vb);
> +	struct pispbe_node *node = vb2_get_drv_priv(buf->vb2_queue);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +	unsigned long flags;
> +
> +	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
> +	spin_lock_irqsave(&node->ready_lock, flags);
> +	list_add_tail(&buffer->ready_list, &node->ready_queue);
> +	spin_unlock_irqrestore(&node->ready_lock, flags);
> +
> +	/*
> +	 * Every time we add a buffer, check if there's now some work for the hw
> +	 * to do.
> +	 */
> +	pispbe_schedule(pispbe, false);
> +}
> +
> +static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct pispbe_node *node = vb2_get_drv_priv(q);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +	unsigned long flags;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(pispbe->dev);
> +	if (ret < 0)
> +		return ret;

start_streaming must return all queued buffers to state VB2_BUF_STATE_QUEUED on error.

> +
> +	spin_lock_irqsave(&pispbe->hw_lock, flags);
> +	node->pispbe->streaming_map |=  BIT(node->id);
> +	node->pispbe->sequence = 0;
> +	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> +
> +	dev_dbg(pispbe->dev, "%s: for node %s (count %u)\n",
> +		__func__, NODE_NAME(node), count);
> +	dev_dbg(pispbe->dev, "Nodes streaming now 0x%x\n",
> +		node->pispbe->streaming_map);
> +
> +	/* Maybe we're ready to run. */
> +	pispbe_schedule(pispbe, false);
> +
> +	return 0;
> +}
> +
> +static void pispbe_node_stop_streaming(struct vb2_queue *q)
> +{
> +	struct pispbe_node *node = vb2_get_drv_priv(q);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +	struct pispbe_buffer *buf;
> +	unsigned long flags;
> +
> +	/*
> +	 * Now this is a bit awkward. In a simple M2M device we could just wait
> +	 * for all queued jobs to complete, but here there's a risk that a
> +	 * partial set of buffers was queued and cannot be run. For now, just
> +	 * cancel all buffers stuck in the "ready queue", then wait for any
> +	 * running job.
> +	 *
> +	 * This may return buffers out of order.
> +	 */
> +	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
> +	spin_lock_irqsave(&pispbe->hw_lock, flags);
> +	do {
> +		unsigned long flags1;
> +
> +		spin_lock_irqsave(&node->ready_lock, flags1);
> +		buf = list_first_entry_or_null(&node->ready_queue,
> +					       struct pispbe_buffer,
> +					       ready_list);
> +		if (buf) {
> +			list_del(&buf->ready_list);
> +			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +		}
> +		spin_unlock_irqrestore(&node->ready_lock, flags1);
> +	} while (buf);
> +	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> +
> +	vb2_wait_for_all_buffers(&node->queue);
> +
> +	spin_lock_irqsave(&pispbe->hw_lock, flags);
> +	pispbe->streaming_map &= ~BIT(node->id);
> +	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> +
> +	pm_runtime_mark_last_busy(pispbe->dev);
> +	pm_runtime_put_autosuspend(pispbe->dev);
> +
> +	dev_dbg(pispbe->dev, "Nodes streaming now 0x%x\n",
> +		pispbe->streaming_map);
> +}
> +
> +static const struct vb2_ops pispbe_node_queue_ops = {
> +	.queue_setup = pispbe_node_queue_setup,
> +	.buf_prepare = pispbe_node_buffer_prepare,
> +	.buf_queue = pispbe_node_buffer_queue,
> +	.start_streaming = pispbe_node_start_streaming,
> +	.stop_streaming = pispbe_node_stop_streaming,
> +};
> +
> +static const struct v4l2_file_operations pispbe_fops = {
> +	.owner          = THIS_MODULE,
> +	.open           = v4l2_fh_open,
> +	.release        = vb2_fop_release,
> +	.poll           = vb2_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap           = vb2_fop_mmap
> +};
> +
> +static int pispbe_node_querycap(struct file *file, void *priv,
> +				struct v4l2_capability *cap)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +
> +	strscpy(cap->driver, PISPBE_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, PISPBE_NAME, sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +		 dev_name(pispbe->dev));

This should be prefilled for you by the core.

> +
> +	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +			    V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +			    V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS |
> +			    V4L2_CAP_META_OUTPUT;
> +	cap->device_caps = node->vfd.device_caps;

device_caps and capabilities should also be set for you.

> +
> +	dev_dbg(pispbe->dev, "Caps for node %s: %x and %x (dev %x)\n",
> +		NODE_NAME(node), cap->capabilities, cap->device_caps,
> +		node->vfd.device_caps);
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_g_fmt_vid_cap(struct file *file, void *priv,
> +				     struct v4l2_format *f)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +
> +	if (!NODE_IS_CAPTURE(node) || NODE_IS_META(node)) {
> +		dev_dbg(pispbe->dev,
> +			"Cannot get capture fmt for output node %s\n",
> +			NODE_NAME(node));
> +		return -EINVAL;
> +	}
> +
> +	*f = node->format;
> +	dev_dbg(pispbe->dev, "Get capture format for node %s\n",
> +		NODE_NAME(node));
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_g_fmt_vid_out(struct file *file, void *priv,
> +				     struct v4l2_format *f)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +
> +	if (NODE_IS_CAPTURE(node) || NODE_IS_META(node)) {
> +		dev_dbg(pispbe->dev,
> +			"Cannot get capture fmt for output node %s\n",
> +			 NODE_NAME(node));
> +		return -EINVAL;
> +	}
> +
> +	*f = node->format;
> +	dev_dbg(pispbe->dev, "Get output format for node %s\n",
> +		NODE_NAME(node));
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_g_fmt_meta_out(struct file *file, void *priv,
> +				      struct v4l2_format *f)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +
> +	if (!NODE_IS_META(node) || NODE_IS_CAPTURE(node)) {
> +		dev_dbg(pispbe->dev,
> +			"Cannot get capture fmt for meta output node %s\n",
> +			NODE_NAME(node));
> +		return -EINVAL;
> +	}
> +
> +	*f = node->format;
> +	dev_dbg(pispbe->dev, "Get output format for meta node %s\n",
> +		NODE_NAME(node));
> +
> +	return 0;
> +}
> +
> +static const struct pisp_be_format *pispbe_find_fmt(unsigned int fourcc)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(supported_formats); i++) {
> +		if (supported_formats[i].fourcc == fourcc)
> +			return &supported_formats[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static void pispbe_set_plane_params(struct v4l2_format *f,
> +				    const struct pisp_be_format *fmt)
> +{
> +	unsigned int nplanes = f->fmt.pix_mp.num_planes;
> +	unsigned int total_plane_factor = 0;
> +
> +	for (unsigned int i = 0; i < PISPBE_MAX_PLANES; i++)
> +		total_plane_factor += fmt->plane_factor[i];
> +
> +	for (unsigned int i = 0; i < nplanes; i++) {
> +		struct v4l2_plane_pix_format *p = &f->fmt.pix_mp.plane_fmt[i];
> +		unsigned int bpl, plane_size;
> +
> +		bpl = (f->fmt.pix_mp.width * fmt->bit_depth) >> 3;
> +		bpl = ALIGN(max(p->bytesperline, bpl), fmt->align);
> +
> +		plane_size = bpl * f->fmt.pix_mp.height *
> +		      (nplanes > 1 ? fmt->plane_factor[i] : total_plane_factor);
> +		/*
> +		 * The shift is to divide out the plane_factor fixed point
> +		 * scaling of 8.
> +		 */
> +		plane_size = max(p->sizeimage, plane_size >> 3);
> +
> +		p->bytesperline = bpl;
> +		p->sizeimage = plane_size;
> +	}
> +}
> +
> +static void pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
> +{
> +	struct pispbe_dev *pispbe = node->pispbe;
> +	u32 pixfmt = f->fmt.pix_mp.pixelformat;
> +	const struct pisp_be_format *fmt;
> +	bool is_rgb;
> +
> +	dev_dbg(pispbe->dev,
> +		"%s: [%s] req %ux%u %p4cc, planes %d\n",
> +		__func__, NODE_NAME(node), f->fmt.pix_mp.width,
> +		f->fmt.pix_mp.height, &pixfmt,
> +		f->fmt.pix_mp.num_planes);
> +
> +	fmt = pispbe_find_fmt(pixfmt);
> +	if (!fmt) {
> +		dev_dbg(pispbe->dev,
> +			"%s: [%s] Format not found, defaulting to YUV420\n",
> +			__func__, NODE_NAME(node));
> +		fmt = pispbe_find_fmt(V4L2_PIX_FMT_YUV420);
> +	}
> +
> +	f->fmt.pix_mp.pixelformat = fmt->fourcc;
> +	f->fmt.pix_mp.num_planes = fmt->num_planes;
> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +	f->fmt.pix_mp.width = max(min(f->fmt.pix_mp.width, 65536u),
> +				  PISP_BACK_END_MIN_TILE_WIDTH);
> +	f->fmt.pix_mp.height = max(min(f->fmt.pix_mp.height, 65536u),
> +				   PISP_BACK_END_MIN_TILE_HEIGHT);
> +
> +	/*
> +	 * Fill in the actual colour space when the requested one was
> +	 * not supported. This also catches the case when the "default"
> +	 * colour space was requested (as that's never in the mask).
> +	 */
> +	if (!(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
> +	    fmt->colorspace_mask))
> +		f->fmt.pix_mp.colorspace = fmt->colorspace_default;
> +
> +	/* In all cases, we only support the defaults for these: */
> +	f->fmt.pix_mp.ycbcr_enc =
> +		V4L2_MAP_YCBCR_ENC_DEFAULT(f->fmt.pix_mp.colorspace);
> +	f->fmt.pix_mp.xfer_func =
> +		V4L2_MAP_XFER_FUNC_DEFAULT(f->fmt.pix_mp.colorspace);
> +
> +	is_rgb = f->fmt.pix_mp.colorspace == V4L2_COLORSPACE_SRGB;
> +	f->fmt.pix_mp.quantization =
> +		V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb, f->fmt.pix_mp.colorspace,
> +					      f->fmt.pix_mp.ycbcr_enc);
> +
> +	/* Set plane size and bytes/line for each plane. */
> +	pispbe_set_plane_params(f, fmt);
> +
> +	for (unsigned int i = 0; i < f->fmt.pix_mp.num_planes; i++) {
> +		dev_dbg(pispbe->dev,
> +			"%s: [%s] calc plane %d, %ux%u, depth %u, bpl %u size %u\n",
> +			__func__, NODE_NAME(node), i, f->fmt.pix_mp.width,
> +			f->fmt.pix_mp.height, fmt->bit_depth,
> +			f->fmt.pix_mp.plane_fmt[i].bytesperline,
> +			f->fmt.pix_mp.plane_fmt[i].sizeimage);
> +	}
> +}
> +
> +static int pispbe_node_try_fmt_vid_cap(struct file *file, void *priv,
> +				       struct v4l2_format *f)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +
> +	if (!NODE_IS_CAPTURE(node) || NODE_IS_META(node)) {
> +		dev_dbg(pispbe->dev,
> +			"Cannot set capture fmt for output node %s\n",
> +			NODE_NAME(node));
> +		return -EINVAL;
> +	}
> +
> +	pispbe_try_format(f, node);
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_try_fmt_vid_out(struct file *file, void *priv,
> +				       struct v4l2_format *f)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +
> +	if (!NODE_IS_OUTPUT(node) || NODE_IS_META(node)) {
> +		dev_dbg(pispbe->dev,
> +			"Cannot set capture fmt for output node %s\n",
> +			NODE_NAME(node));
> +		return -EINVAL;
> +	}
> +
> +	pispbe_try_format(f, node);
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_try_fmt_meta_out(struct file *file, void *priv,
> +					struct v4l2_format *f)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +
> +	if (!NODE_IS_META(node) || NODE_IS_CAPTURE(node)) {
> +		dev_dbg(pispbe->dev,
> +			"Cannot set capture fmt for meta output node %s\n",
> +			NODE_NAME(node));
> +		return -EINVAL;
> +	}
> +
> +	f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
> +	f->fmt.meta.buffersize = sizeof(struct pisp_be_tiles_config);
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_s_fmt_vid_cap(struct file *file, void *priv,
> +				     struct v4l2_format *f)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +	int ret;
> +
> +	ret = pispbe_node_try_fmt_vid_cap(file, priv, f);
> +	if (ret < 0)
> +		return ret;

This is missing a busy check:

        if (vb2_is_busy(vb2_queue))
                return -EBUSY;

Same for the other s_fmt functions.

> +
> +	node->format = *f;
> +	node->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
> +
> +	dev_dbg(pispbe->dev, "Set capture format for node %s to %p4cc\n",
> +		NODE_NAME(node), &f->fmt.pix_mp.pixelformat);
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_s_fmt_vid_out(struct file *file, void *priv,
> +				     struct v4l2_format *f)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +	int ret;
> +
> +	ret = pispbe_node_try_fmt_vid_out(file, priv, f);
> +	if (ret < 0)
> +		return ret;
> +
> +	node->format = *f;
> +	node->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
> +
> +	dev_dbg(pispbe->dev, "Set output format for node %s to %p4cc\n",
> +		NODE_NAME(node), &f->fmt.pix_mp.pixelformat);
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_s_fmt_meta_out(struct file *file, void *priv,
> +				      struct v4l2_format *f)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +	int ret;
> +
> +	ret = pispbe_node_try_fmt_meta_out(file, priv, f);
> +	if (ret < 0)
> +		return ret;
> +
> +	node->format = *f;
> +	node->pisp_format = &meta_out_supported_formats[0];
> +
> +	dev_dbg(pispbe->dev, "Set output format for meta node %s to %p4cc\n",
> +		NODE_NAME(node), &f->fmt.meta.dataformat);
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_enum_fmt(struct file *file, void  *priv,
> +				struct v4l2_fmtdesc *f)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +
> +	if (f->type != node->queue.type)
> +		return -EINVAL;
> +
> +	if (NODE_IS_META(node)) {
> +		if (f->index)
> +			return -EINVAL;
> +
> +		f->pixelformat = V4L2_META_FMT_RPI_BE_CFG;
> +		f->flags = 0;
> +		return 0;
> +	}
> +
> +	if (f->index >= ARRAY_SIZE(supported_formats))
> +		return -EINVAL;
> +
> +	f->pixelformat = supported_formats[f->index].fourcc;
> +	f->flags = 0;
> +
> +	return 0;
> +}
> +
> +static int pispbe_enum_framesizes(struct file *file, void *priv,
> +				  struct v4l2_frmsizeenum *fsize)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +
> +	if (NODE_IS_META(node) || fsize->index)
> +		return -EINVAL;
> +
> +	if (!pispbe_find_fmt(fsize->pixel_format)) {
> +		dev_dbg(pispbe->dev, "Invalid pixel code: %x\n",
> +			fsize->pixel_format);
> +		return -EINVAL;
> +	}
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width = 32;
> +	fsize->stepwise.max_width = 65535;
> +	fsize->stepwise.step_width = 2;
> +
> +	fsize->stepwise.min_height = 32;
> +	fsize->stepwise.max_height = 65535;
> +	fsize->stepwise.step_height = 2;
> +
> +	return 0;
> +}
> +
> +static int pispbe_node_streamon(struct file *file, void *priv,
> +				enum v4l2_buf_type type)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +	struct pispbe_dev *pispbe = node->pispbe;
> +
> +	dev_dbg(pispbe->dev, "Stream on for node %s\n", NODE_NAME(node));
> +
> +	INIT_LIST_HEAD(&node->ready_queue);

Dubious: there is almost never a need to override streamon.

I would expect this to be initialized wherever pispbe_node is initialized.
And after streamoff (or really stop_streaming) ready_queue should be empty.

A possible reason for this is that if start_streaming returns an error,
then the current code doesn't drain ready_queue. But if that is done correctly,
then this INIT_LIST_HEAD should not be needed here.

> +
> +	return vb2_streamon(&node->queue, type);
> +}
> +
> +static int pispbe_node_streamoff(struct file *file, void *priv,
> +				 enum v4l2_buf_type type)
> +{
> +	struct pispbe_node *node = video_drvdata(file);
> +
> +	return vb2_streamoff(&node->queue, type);
> +}
> +
> +static const struct v4l2_ioctl_ops pispbe_node_ioctl_ops = {
> +	.vidioc_querycap = pispbe_node_querycap,
> +	.vidioc_g_fmt_vid_cap_mplane = pispbe_node_g_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_out_mplane = pispbe_node_g_fmt_vid_out,
> +	.vidioc_g_fmt_meta_out = pispbe_node_g_fmt_meta_out,
> +	.vidioc_try_fmt_vid_cap_mplane = pispbe_node_try_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_out_mplane = pispbe_node_try_fmt_vid_out,
> +	.vidioc_try_fmt_meta_out = pispbe_node_try_fmt_meta_out,
> +	.vidioc_s_fmt_vid_cap_mplane = pispbe_node_s_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_out_mplane = pispbe_node_s_fmt_vid_out,
> +	.vidioc_s_fmt_meta_out = pispbe_node_s_fmt_meta_out,
> +	.vidioc_enum_fmt_vid_cap = pispbe_node_enum_fmt,
> +	.vidioc_enum_fmt_vid_out = pispbe_node_enum_fmt,
> +	.vidioc_enum_fmt_meta_out = pispbe_node_enum_fmt,
> +	.vidioc_enum_framesizes = pispbe_enum_framesizes,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_streamon = pispbe_node_streamon,
> +	.vidioc_streamoff = pispbe_node_streamoff,

Can't this be vb2_ioctl_streamoff? And after fixing the streamon/start_streaming
issue, you can do the same for vb2_ioctl_streamon.

> +};
> +
> +static const struct video_device pispbe_videodev = {
> +	.name = PISPBE_NAME,
> +	.vfl_dir = VFL_DIR_M2M, /* gets overwritten */
> +	.fops = &pispbe_fops,
> +	.ioctl_ops = &pispbe_node_ioctl_ops,
> +	.minor = -1,
> +	.release = video_device_release_empty,
> +};
> +
> +static void pispbe_node_def_fmt(struct pispbe_node *node)
> +{
> +	if (NODE_IS_META(node) && NODE_IS_OUTPUT(node)) {
> +		/* Config node */
> +		struct v4l2_format *f = &node->format;
> +
> +		f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
> +		f->fmt.meta.buffersize = sizeof(struct pisp_be_tiles_config);
> +		f->type = node->buf_type;
> +	} else {
> +		struct v4l2_format f = {
> +			.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420,
> +			.fmt.pix_mp.width = 1920,
> +			.fmt.pix_mp.height = 1080,
> +			.type = node->buf_type,
> +		};
> +		pispbe_try_format(&f, node);
> +		node->format = f;
> +	}
> +
> +	node->pisp_format = pispbe_find_fmt(node->format.fmt.pix_mp.pixelformat);
> +}
> +
> +/*
> + * Initialise a struct pispbe_node and register it as /dev/video<N>
> + * to represent one of the PiSP Back End's input or output streams.
> + */
> +static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
> +{
> +	bool output = NODE_DESC_IS_OUTPUT(&node_desc[id]);
> +	struct pispbe_node *node = &pispbe->node[id];
> +	struct media_entity *entity = &node->vfd.entity;
> +	struct video_device *vdev = &node->vfd;
> +	struct vb2_queue *q = &node->queue;
> +	int ret;
> +
> +	node->id = id;
> +	node->pispbe = pispbe;
> +	node->buf_type = node_desc[id].buf_type;
> +
> +	mutex_init(&node->node_lock);
> +	mutex_init(&node->queue_lock);
> +	INIT_LIST_HEAD(&node->ready_queue);
> +	spin_lock_init(&node->ready_lock);
> +
> +	node->format.type = node->buf_type;
> +	pispbe_node_def_fmt(node);
> +
> +	q->type = node->buf_type;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->drv_priv = node;
> +	q->ops = &pispbe_node_queue_ops;
> +	q->buf_struct_size = sizeof(struct pispbe_buffer);
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->dev = pispbe->dev;
> +	/* get V4L2 to handle node->queue locking */
> +	q->lock = &node->queue_lock;
> +
> +	ret = vb2_queue_init(q);
> +	if (ret < 0) {
> +		dev_err(pispbe->dev, "vb2_queue_init failed\n");
> +		goto err_mutex_destroy;
> +	}
> +
> +	*vdev = pispbe_videodev; /* default initialization */
> +	strscpy(vdev->name, node_desc[id].ent_name, sizeof(vdev->name));
> +	vdev->v4l2_dev = &pispbe->v4l2_dev;
> +	vdev->vfl_dir = output ? VFL_DIR_TX : VFL_DIR_RX;
> +	/* get V4L2 to serialise our ioctls */
> +	vdev->lock = &node->node_lock;
> +	vdev->queue = &node->queue;
> +	vdev->device_caps = V4L2_CAP_STREAMING | node_desc[id].caps;
> +
> +	node->pad.flags = output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
> +	ret = media_entity_pads_init(entity, 1, &node->pad);
> +	if (ret) {
> +		dev_err(pispbe->dev,
> +			"Failed to register media pads for %s device node\n",
> +			NODE_NAME(node));
> +		goto err_unregister_queue;
> +	}
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		dev_err(pispbe->dev,
> +			"Failed to register video %s device node\n",
> +			NODE_NAME(node));
> +		goto err_unregister_queue;
> +	}
> +	video_set_drvdata(vdev, node);
> +
> +	if (output)
> +		ret = media_create_pad_link(entity, 0, &pispbe->sd.entity,
> +					    id, MEDIA_LNK_FL_IMMUTABLE |
> +					    MEDIA_LNK_FL_ENABLED);
> +	else
> +		ret = media_create_pad_link(&pispbe->sd.entity, id, entity,
> +					    0, MEDIA_LNK_FL_IMMUTABLE |
> +					    MEDIA_LNK_FL_ENABLED);
> +	if (ret)
> +		goto err_unregister_video_dev;
> +
> +	dev_dbg(pispbe->dev, "%s device node registered as /dev/video%d\n",
> +		NODE_NAME(node), node->vfd.num);
> +
> +	return 0;
> +
> +err_unregister_video_dev:
> +	video_unregister_device(&node->vfd);
> +err_unregister_queue:
> +	vb2_queue_release(&node->queue);
> +err_mutex_destroy:
> +	mutex_destroy(&node->node_lock);
> +	mutex_destroy(&node->queue_lock);
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_pad_ops pispbe_pad_ops = {
> +	.link_validate = v4l2_subdev_link_validate_default,
> +};
> +
> +static const struct v4l2_subdev_ops pispbe_sd_ops = {
> +	.pad = &pispbe_pad_ops,
> +};
> +
> +static int pispbe_init_subdev(struct pispbe_dev *pispbe)
> +{
> +	struct v4l2_subdev *sd = &pispbe->sd;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &pispbe_sd_ops);
> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +	sd->owner = THIS_MODULE;
> +	sd->dev = pispbe->dev;
> +	strscpy(sd->name, PISPBE_NAME, sizeof(sd->name));
> +
> +	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++)
> +		pispbe->pad[i].flags =
> +			NODE_DESC_IS_OUTPUT(&node_desc[i]) ?
> +			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&sd->entity, PISPBE_NUM_NODES,
> +				     pispbe->pad);
> +	if (ret)
> +		goto error;
> +
> +	ret = v4l2_device_register_subdev(&pispbe->v4l2_dev, sd);
> +	if (ret)
> +		goto error;
> +
> +	return 0;
> +
> +error:
> +	media_entity_cleanup(&sd->entity);
> +	return ret;
> +}
> +
> +static int pispbe_init_devices(struct pispbe_dev *pispbe)
> +{
> +	struct v4l2_device *v4l2_dev;
> +	struct media_device *mdev;
> +	unsigned int num_regist;
> +	int ret;
> +
> +	/* Register v4l2_device and media_device */
> +	mdev = &pispbe->mdev;
> +	mdev->hw_revision = pispbe->hw_version;
> +	mdev->dev = pispbe->dev;
> +	strscpy(mdev->model, PISPBE_NAME, sizeof(mdev->model));
> +	media_device_init(mdev);
> +
> +	v4l2_dev = &pispbe->v4l2_dev;
> +	v4l2_dev->mdev = &pispbe->mdev;
> +	strscpy(v4l2_dev->name, PISPBE_NAME, sizeof(v4l2_dev->name));
> +
> +	ret = v4l2_device_register(pispbe->dev, v4l2_dev);
> +	if (ret)
> +		goto err_media_dev_cleanup;
> +
> +	/* Register the PISPBE subdevice. */
> +	ret = pispbe_init_subdev(pispbe);
> +	if (ret)
> +		goto err_unregister_v4l2;
> +
> +	/* Create device video nodes */
> +	for (num_regist = 0; num_regist < PISPBE_NUM_NODES; num_regist++) {
> +		ret = pispbe_init_node(pispbe, num_regist);
> +		if (ret)
> +			goto err_unregister_nodes;
> +	}
> +
> +	ret = media_device_register(mdev);
> +	if (ret)
> +		goto err_unregister_nodes;
> +
> +	pispbe->config =
> +		dma_alloc_coherent(pispbe->dev,
> +				   sizeof(struct pisp_be_tiles_config) *
> +					PISP_BE_NUM_CONFIG_BUFFERS,
> +				   &pispbe->config_dma_addr, GFP_KERNEL);
> +	if (!pispbe->config) {
> +		dev_err(pispbe->dev, "Unable to allocate cached config buffers.\n");
> +		ret = -ENOMEM;
> +		goto err_unregister_mdev;
> +	}
> +
> +	return 0;
> +
> +err_unregister_mdev:
> +	media_device_unregister(mdev);
> +err_unregister_nodes:
> +	while (num_regist-- > 0) {
> +		video_unregister_device(&pispbe->node[num_regist].vfd);
> +		vb2_queue_release(&pispbe->node[num_regist].queue);
> +	}
> +	v4l2_device_unregister_subdev(&pispbe->sd);
> +	media_entity_cleanup(&pispbe->sd.entity);
> +err_unregister_v4l2:
> +	v4l2_device_unregister(v4l2_dev);
> +err_media_dev_cleanup:
> +	media_device_cleanup(mdev);
> +	return ret;
> +}
> +
> +static void pispbe_destroy_devices(struct pispbe_dev *pispbe)
> +{
> +	if (pispbe->config) {
> +		dma_free_coherent(pispbe->dev,
> +				  sizeof(struct pisp_be_tiles_config) *
> +					PISP_BE_NUM_CONFIG_BUFFERS,
> +				  pispbe->config,
> +				  pispbe->config_dma_addr);
> +	}
> +
> +	dev_dbg(pispbe->dev, "Unregister from media controller\n");
> +
> +	v4l2_device_unregister_subdev(&pispbe->sd);
> +	media_entity_cleanup(&pispbe->sd.entity);
> +	media_device_unregister(&pispbe->mdev);
> +
> +	for (int i = PISPBE_NUM_NODES - 1; i >= 0; i--) {
> +		video_unregister_device(&pispbe->node[i].vfd);
> +		vb2_queue_release(&pispbe->node[i].queue);
> +		mutex_destroy(&pispbe->node[i].node_lock);
> +		mutex_destroy(&pispbe->node[i].queue_lock);
> +	}
> +
> +	media_device_cleanup(&pispbe->mdev);
> +	v4l2_device_unregister(&pispbe->v4l2_dev);
> +}
> +
> +static int pispbe_runtime_suspend(struct device *dev)
> +{
> +	struct pispbe_dev *pispbe = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(pispbe->clk);
> +
> +	return 0;
> +}
> +
> +static int pispbe_runtime_resume(struct device *dev)
> +{
> +	struct pispbe_dev *pispbe = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(pispbe->clk);
> +	if (ret) {
> +		dev_err(dev, "Unable to enable clock\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "%s: Enabled clock, rate=%lu\n",
> +		__func__, clk_get_rate(pispbe->clk));
> +
> +	return 0;
> +}
> +
> +static int pispbe_hw_init(struct pispbe_dev *pispbe)
> +{
> +	u32 u;
> +
> +	/* Check the HW is present and has a known version */
> +	u = pispbe_rd(pispbe, PISP_BE_VERSION_REG);
> +	dev_dbg(pispbe->dev, "pispbe_probe: HW version:  0x%08x", u);
> +	pispbe->hw_version = u;
> +	if ((u & ~PISP_BE_VERSION_MINOR_BITS) != PISP_BE_VERSION_2712)
> +		return -ENODEV;
> +
> +	/* Clear leftover interrupts */
> +	pispbe_wr(pispbe, PISP_BE_INTERRUPT_STATUS_REG, 0xFFFFFFFFu);
> +	u = pispbe_rd(pispbe, PISP_BE_BATCH_STATUS_REG);
> +	dev_dbg(pispbe->dev, "pispbe_probe: BatchStatus: 0x%08x", u);
> +
> +	pispbe->done = (uint8_t)u;
> +	pispbe->started = (uint8_t)(u >> 8);
> +	u = pispbe_rd(pispbe, PISP_BE_STATUS_REG);
> +	dev_dbg(pispbe->dev, "pispbe_probe: Status:      0x%08x", u);
> +
> +	if (u != 0 || pispbe->done != pispbe->started) {
> +		dev_err(pispbe->dev, "pispbe_probe: HW is stuck or busy\n");
> +		return -EBUSY;
> +	}
> +
> +	/*
> +	 * AXI QOS=0, CACHE=4'b0010, PROT=3'b011
> +	 * Also set "chicken bits" 22:20 which enable sub-64-byte bursts
> +	 * and AXI AWID/BID variability (on versions which support this).
> +	 */
> +	pispbe_wr(pispbe, PISP_BE_AXI_REG, 0x32703200u);
> +
> +	/* Enable both interrupt flags */
> +	pispbe_wr(pispbe, PISP_BE_INTERRUPT_EN_REG, 0x00000003u);
> +
> +	return 0;
> +}
> +
> +/* Probe the ISP-BE hardware block, as a single platform device. */
> +static int pispbe_probe(struct platform_device *pdev)
> +{
> +	struct pispbe_dev *pispbe;
> +	int ret;
> +
> +	pispbe = devm_kzalloc(&pdev->dev, sizeof(*pispbe), GFP_KERNEL);
> +	if (!pispbe)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&pdev->dev, pispbe);
> +	pispbe->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, pispbe);
> +
> +	pispbe->be_reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pispbe->be_reg_base)) {
> +		dev_err(&pdev->dev, "Failed to get ISP-BE registers address\n");
> +		return PTR_ERR(pispbe->be_reg_base);
> +	}
> +
> +	pispbe->irq = platform_get_irq(pdev, 0);
> +	if (pispbe->irq <= 0) {
> +		dev_err(&pdev->dev, "No IRQ resource\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, pispbe->irq, pispbe_isr, 0,
> +			       PISPBE_NAME, pispbe);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Unable to request interrupt\n");
> +		return ret;
> +	}
> +
> +	ret = dma_set_mask_and_coherent(pispbe->dev, DMA_BIT_MASK(36));
> +	if (ret)
> +		return ret;
> +
> +	pispbe->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(pispbe->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(pispbe->clk),
> +				     "Failed to get clock");
> +
> +	/* Hardware initialisation */
> +	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
> +	pm_runtime_use_autosuspend(pispbe->dev);
> +	pm_runtime_enable(pispbe->dev);
> +
> +	ret = pispbe_runtime_resume(pispbe->dev);
> +	if (ret)
> +		goto pm_runtime_disable_err;
> +
> +	pispbe->hw_busy = false;
> +	spin_lock_init(&pispbe->hw_lock);
> +	ret = pispbe_hw_init(pispbe);
> +	if (ret)
> +		goto pm_runtime_suspend_err;
> +
> +	ret = pispbe_init_devices(pispbe);
> +	if (ret)
> +		goto disable_devs_err;
> +
> +	pm_runtime_mark_last_busy(pispbe->dev);
> +	pm_runtime_put_autosuspend(pispbe->dev);
> +
> +	return 0;
> +
> +disable_devs_err:
> +	pispbe_destroy_devices(pispbe);
> +pm_runtime_suspend_err:
> +	pispbe_runtime_suspend(pispbe->dev);
> +pm_runtime_disable_err:
> +	pm_runtime_dont_use_autosuspend(pispbe->dev);
> +	pm_runtime_disable(pispbe->dev);
> +
> +	return ret;
> +}
> +
> +static int pispbe_remove(struct platform_device *pdev)
> +{
> +	struct pispbe_dev *pispbe = platform_get_drvdata(pdev);
> +
> +	pispbe_destroy_devices(pispbe);
> +
> +	pispbe_runtime_suspend(pispbe->dev);
> +	pm_runtime_dont_use_autosuspend(pispbe->dev);
> +	pm_runtime_disable(pispbe->dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops pispbe_pm_ops = {
> +	SET_RUNTIME_PM_OPS(pispbe_runtime_suspend, pispbe_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id pispbe_of_match[] = {
> +	{
> +		.compatible = "raspberrypi,pispbe",
> +	},
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, pispbe_of_match);
> +
> +static struct platform_driver pispbe_pdrv = {
> +	.probe		= pispbe_probe,
> +	.remove		= pispbe_remove,
> +	.driver		= {
> +		.name	= PISPBE_NAME,
> +		.of_match_table = pispbe_of_match,
> +		.pm = &pispbe_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(pispbe_pdrv);
> +
> +MODULE_DESCRIPTION("PiSP Back End driver");
> +MODULE_AUTHOR("David Plowman <david.plowman@raspberrypi.com>");
> +MODULE_AUTHOR("Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h b/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
> new file mode 100644
> index 000000000000..b5cb7b8c7531
> --- /dev/null
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
> @@ -0,0 +1,519 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * PiSP Back End driver image format definitions.
> + *
> + * Copyright (c) 2021-2024 Raspberry Pi Ltd
> + */
> +
> +#ifndef _PISP_BE_FORMATS_
> +#define _PISP_BE_FORMATS_
> +
> +#include <linux/bits.h>
> +#include <linux/videodev2.h>
> +
> +#define PISPBE_MAX_PLANES	3
> +#define P3(x)			((x) * 8)
> +
> +struct pisp_be_format {
> +	unsigned int fourcc;
> +	unsigned int align;
> +	unsigned int bit_depth;
> +	/* 0P3 factor for plane sizing */
> +	unsigned int plane_factor[PISPBE_MAX_PLANES];
> +	unsigned int num_planes;
> +	unsigned int colorspace_mask;
> +	enum v4l2_colorspace colorspace_default;
> +};
> +
> +#define V4L2_COLORSPACE_MASK(colorspace) BIT(colorspace)
> +
> +#define V4L2_COLORSPACE_MASK_JPEG	\
> +	V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_JPEG)
> +#define V4L2_COLORSPACE_MASK_SMPTE170M	\
> +	V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_SMPTE170M)
> +#define V4L2_COLORSPACE_MASK_REC709	\
> +	V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_REC709)
> +#define V4L2_COLORSPACE_MASK_SRGB	\
> +	V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_SRGB)
> +#define V4L2_COLORSPACE_MASK_RAW	\
> +	V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_RAW)
> +
> +/*
> + * All three colour spaces SRGB, SMPTE170M and REC709 are fundamentally sRGB
> + * underneath (as near as makes no difference to us), just with different YCbCr
> + * encodings. Therefore the ISP can generate sRGB on its main output and any of
> + * the others on its low resolution output. Applications should, when using both
> + * outputs, program the colour spaces on them to be the same, matching whatever
> + * is requested for the low resolution output, even if the main output is
> + * producing an RGB format. In turn this requires us to allow all these colour
> + * spaces for every YUV/RGB output format.
> + */
> +#define V4L2_COLORSPACE_MASK_ALL_SRGB (V4L2_COLORSPACE_MASK_JPEG	| \
> +				       V4L2_COLORSPACE_MASK_SRGB	| \
> +				       V4L2_COLORSPACE_MASK_SMPTE170M	| \
> +				       V4L2_COLORSPACE_MASK_REC709)
> +
> +static const struct pisp_be_format supported_formats[] = {
> +	/* Single plane YUV formats */
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_YUV420,
> +		/* 128 alignment to ensure U/V planes are 64 byte aligned. */
> +		.align		    = 128,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(0.25), P3(0.25) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_YVU420,
> +		/* 128 alignment to ensure U/V planes are 64 byte aligned. */
> +		.align		    = 128,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(0.25), P3(0.25) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_NV12,
> +		.align		    = 32,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(0.5) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_NV21,
> +		.align		    = 32,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(0.5) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_YUYV,
> +		.align		    = 64,
> +		.bit_depth	    = 16,
> +		.plane_factor	    = { P3(1) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_UYVY,
> +		.align		    = 64,
> +		.bit_depth	    = 16,
> +		.plane_factor	    = { P3(1) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_YVYU,
> +		.align		    = 64,
> +		.bit_depth	    = 16,
> +		.plane_factor	    = { P3(1) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_VYUY,
> +		.align		    = 64,
> +		.bit_depth	    = 16,
> +		.plane_factor	    = { P3(1) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	/* Multiplane YUV formats */
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_YUV420M,
> +		.align		    = 64,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(0.25), P3(0.25) },
> +		.num_planes	    = 3,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_NV12M,
> +		.align		    = 32,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(0.5) },
> +		.num_planes	    = 2,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_NV21M,
> +		.align		    = 32,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(0.5) },
> +		.num_planes	    = 2,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_YVU420M,
> +		.align		    = 64,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(0.25), P3(0.25) },
> +		.num_planes	    = 3,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_YUV422M,
> +		.align		    = 64,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(0.5), P3(0.5) },
> +		.num_planes	    = 3,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_YVU422M,
> +		.align		    = 64,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(0.5), P3(0.5) },
> +		.num_planes	    = 3,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_YUV444M,
> +		.align		    = 64,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(1), P3(1) },
> +		.num_planes	    = 3,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_YVU444M,
> +		.align		    = 64,
> +		.bit_depth	    = 8,
> +		.plane_factor	    = { P3(1), P3(1), P3(1) },
> +		.num_planes	    = 3,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
> +	},
> +	/* RGB formats */
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_RGB24,
> +		.align		    = 32,
> +		.bit_depth	    = 24,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SRGB,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_BGR24,
> +		.align		    = 32,
> +		.bit_depth	    = 24,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SRGB,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_XBGR32,
> +		.align		    = 64,
> +		.bit_depth	    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SRGB,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_RGBX32,
> +		.align		    = 64,
> +		.bit_depth	    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SRGB,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_RGB48,
> +		.align		    = 64,
> +		.bit_depth	    = 48,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SRGB,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_BGR48,
> +		.align		    = 64,
> +		.bit_depth	    = 48,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
> +		.colorspace_default = V4L2_COLORSPACE_SRGB,
> +	},
> +	/* Bayer formats - 8-bit */
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SRGGB8,
> +		.bit_depth	    = 8,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SBGGR8,
> +		.bit_depth	    = 8,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SGRBG8,
> +		.bit_depth	    = 8,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SGBRG8,
> +		.bit_depth	    = 8,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	/* Bayer formats - 16-bit */
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SRGGB16,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SBGGR16,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SGRBG16,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SGBRG16,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		/* Bayer formats unpacked to 16bpp */
> +		/* 10 bit */
> +		.fourcc		    = V4L2_PIX_FMT_SRGGB10,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SBGGR10,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SGRBG10,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SGBRG10,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		/* 12 bit */
> +		.fourcc		    = V4L2_PIX_FMT_SRGGB12,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SBGGR12,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SGRBG12,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SGBRG12,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		/* 14 bit */
> +		.fourcc		    = V4L2_PIX_FMT_SRGGB14,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SBGGR14,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SGRBG14,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_SGBRG14,
> +		.bit_depth	    = 16,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	/* Bayer formats - 16-bit PiSP Compressed */
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_PISP_COMP1_BGGR,
> +		.bit_depth	    = 8,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_PISP_COMP1_RGGB,
> +		.bit_depth	    = 8,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_PISP_COMP1_GRBG,
> +		.bit_depth	    = 8,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		    = V4L2_PIX_FMT_PISP_COMP1_GBRG,
> +		.bit_depth	    = 8,
> +		.align		    = 32,
> +		.plane_factor	    = { P3(1.0) },
> +		.num_planes	    = 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	/* Greyscale Formats */
> +	{
> +		.fourcc		= V4L2_PIX_FMT_GREY,
> +		.bit_depth	= 8,
> +		.align		= 32,
> +		.num_planes	= 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		= V4L2_PIX_FMT_Y16,
> +		.bit_depth	= 16,
> +		.align		= 32,
> +		.plane_factor	= { P3(1.0) },
> +		.num_planes	= 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +	{
> +		.fourcc		= V4L2_PIX_FMT_PISP_COMP1_MONO,
> +		.bit_depth	= 8,
> +		.align		= 32,
> +		.plane_factor	= { P3(1.0) },
> +		.num_planes	= 1,
> +		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
> +		.colorspace_default = V4L2_COLORSPACE_RAW,
> +	},
> +};
> +
> +static const struct pisp_be_format meta_out_supported_formats[] = {
> +	/* Configuration buffer format. */
> +	{
> +		.fourcc		    = V4L2_META_FMT_RPI_BE_CFG,
> +	},
> +};
> +
> +#endif /* _PISP_BE_FORMATS_ */

Regards,

	Hans

