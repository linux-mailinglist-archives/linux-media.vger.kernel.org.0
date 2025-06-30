Return-Path: <linux-media+bounces-36301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2423AEDFE7
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E0187AD17D
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DA428C2D3;
	Mon, 30 Jun 2025 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lcr71NLr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300E524678A;
	Mon, 30 Jun 2025 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291991; cv=none; b=UYCYLVEj+1aaftyj2Ik2FoKuhhIMpIyB0wgvrIHB/vA7yB3WPw4qmyLmZcZOmOVJDXM5+o4ew96hJ81rgyssRLUt9OlVEjcwpgR5FpDlM4OejLAztWkNv16twfinMaKXiAeF/5lSE7m0rsAaL0dcpxTAaXgf+N4AYLT6TWzjk5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291991; c=relaxed/simple;
	bh=hCJCHHu+iByLRrighKMMIYLmajUeJJhs8Wjfk57Fqsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhLMShvISzdmmSQvYgkOawAsElEPN1FulPqDJzml2g1jFc84VEb8sShcR8cdmFykfxK6PLZkMGuKaRTwH0KiAx6Z0qdZXAC8Kr/p4kquraEkGvfoZ2MB+O15jLNfH+DjwmgV+lYUJ7LV0ATdM9YaK5faWU9p2iZ0yVUpKrp2fS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lcr71NLr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-95.net.vodafone.it [5.90.137.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3521928;
	Mon, 30 Jun 2025 15:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751291965;
	bh=hCJCHHu+iByLRrighKMMIYLmajUeJJhs8Wjfk57Fqsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcr71NLrf8I16qvTaygoVNr+aTyUHQFoImPCHlsQoQo6nMm4yIGteny4FAybfhtUw
	 EzGrdYiKBQvgB035YWZoWy2Egh9BC6hoZtr5vXIhVmAkWmfA9FiB/wVR29GQEGWHEX
	 nrozWsAq/5dPw54PqrV1S3vDN63s2YxIzW37dAgw=
Date: Mon, 30 Jun 2025 15:59:42 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, 
	robh+dt@kernel.org, mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v10 16/17] media: platform: Add mali-c55 parameters video
 node
Message-ID: <5zbhnrplppbnrapyvcz2pviavbwsmqy5reofmkas7ouil5o6mr@62xlfol4ld7d>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-16-54f3d4196990@ideasonboard.com>
 <cd60eec7-cb91-4c88-9a63-298ed6582379@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd60eec7-cb91-4c88-9a63-298ed6582379@linux.intel.com>

Hi Sakari, Dan

On Sun, Jun 29, 2025 at 02:27:39PM +0300, Sakari Ailus wrote:
> Hi Daniel,
>
> On 6/24/25 13:21, Daniel Scally wrote:
> > +static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
> > +{
> > +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> > +	struct mali_c55 *mali_c55 = params->mali_c55;
> > +	struct mali_c55_params_buffer *config;
> > +	struct list_head *queue;
> > +	size_t block_offset = 0;
> > +	size_t max_offset;
> > +
> > +	/*
> > +	 * Before accepting the buffer we should check that the data within it
> > +	 * is valid.
> > +	 */
> > +	config = vb2_plane_vaddr(vb, 0);
> > +
> > +	if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
> > +		dev_dbg(mali_c55->dev, "Invalid parameters buffer size %u\n",
> > +			config->total_size);
> > +		goto err_buffer_done;
> > +	}
> > +
> > +	/* Currently only v1 is supported */
> > +	if (config->version != MALI_C55_PARAM_BUFFER_V1) {
> > +		dev_dbg(mali_c55->dev, "Invalid parameters version\n");
> > +		goto err_buffer_done;
> > +	}
> > +
> > +	max_offset = config->total_size - sizeof(struct mali_c55_params_block_header);
> > +	while (block_offset < max_offset) {
> > +		const struct mali_c55_block_handler *block_handler;
> > +		union mali_c55_params_block block;
> > +
> > +		block = (union mali_c55_params_block)
> > +			 &config->data[block_offset];
> > +
> > +		if (block.header->type >= ARRAY_SIZE(mali_c55_block_handlers)) {
> > +			dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
> > +			goto err_buffer_done;
> > +		}
> > +
> > +		if (block_offset + block.header->size > config->total_size) {
> > +			dev_dbg(mali_c55->dev, "Parameters block too large\n");
> > +			goto err_buffer_done;
> > +		}
> > +
> > +		block_handler = &mali_c55_block_handlers[block.header->type];
> > +
> > +		/*
> > +		 * Userspace can optionally omit all but the header of a block
> > +		 * if it only intends to disable the block.
> > +		 */
> > +		if (block.header->size != block_handler->size &&
> > +		    block.header->size != sizeof(*block.header)) {
> > +			dev_dbg(mali_c55->dev, "Invalid parameters block size\n");
> > +			goto err_buffer_done;
> > +		}
> > +
> > +		block_offset += block.header->size;
>
> I recall discussing with Jacopo in the context of another ISP driver
> (Rockchip?) that this piece of non-trivial code should make it into the

I think it was in the context of the recent Amlogic C3 ISP review

and yes, c3_isp_params_vb2_buf_prepare() and
rkisp1_params_prepare_ext_params() are identical.

The here introduced mali_c55_params_buf_queue() is indeed very
similar (*). I guess it has been developed before the RkISP1
implementation (from which the Amlogic one was copied) was refined.

*) The Mali C55 implementation happens at .buf_queue time and not at
.buf_prepare time, not sure if it's intentional (and doesn't probably
make much difference anyway). It also copies the parameters buffer
-after- having validated the content, creating a tiny window between
validation and copy where userspace can modify the buffer, Very
unlikely but possible.

Understanding if the rkisp1/c3 routines can be copied in the mali c55
implementation would make sure that yes, we should defintely move the
validation to the core.


> framework side before a next driver using it has been added. What's the
> status of that? Same for other related bits.
>

Yes, three users (if confirmed that mali can use the same validation
code as the other two) are enough as indication we should move this to
the framework. Problem is how to better design this.

My first thought would be to provide a .buf_prepare helper specific
for extensible parameters that drivers can use. It would however need
to receive some configuration parameters the validation code would
need to know about: the version flags, the enable/disable flags, the
expected sizes etc

Looking at other parts of the code that could be facotrized out,
indeed the rkisp1_ext_params_config() and c3_isp_params_cfg_blocks()
functions are very similar. The RkISP1 is a bit more complex
(supports 'group' and 'features') and the handlers function
signatures are slightly different. With some type punning and macro
magic I'm sure we could factorize t out as well, but I would indeed
start with validation...

Time for a drivers/media/v4l2-core/v4l2_extensible_params.c ?

> > +	}
> > +
> > +	vb2_set_plane_payload(vb, 0, sizeof(struct mali_c55_params_buffer));
> > +
> > +	/*
> > +	 * Copy the parameters buffer provided by userspace to the internal
> > +	 * scratch buffer. This protects against the chance of userspace making
> > +	 * changed to the buffer content whilst the driver processes it.
> > +	 */
> > +	memcpy(buf->config, config, sizeof(*config));
> > +
> > +	queue = mali_c55->inline_mode ? &params->buffers.queue :
> > +					&params->buffers.pending;
> > +
> > +	spin_lock(&params->buffers.lock);
> > +	list_add_tail(&buf->queue, queue);
> > +	spin_unlock(&params->buffers.lock);
> > +
> > +	media_jobs_try_queue_job(mali_c55->sched, MEDIA_JOB_TYPE_PIPELINE_PULSE);
> > +
> > +	return;
> > +
> > +err_buffer_done:
> > +	vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
> > +}
>
> ...
>
> > +static bool mali_c55_params_job_ready(void *data)
> > +{
> > +	struct mali_c55_params *params = data;
> > +
> > +	if (IS_ERR_OR_NULL(media_pad_remote_pad_unique(&params->pad)))
> > +		return true;
> > +
> > +	guard(spinlock)(&params->buffers.lock);
> > +
> > +	if (list_empty(&params->buffers.pending))
> > +		return false;
>
> 	return !list_empty(...);
>
> > +
> > +	return true;
> > +}
> > +
> > +static void mali_c55_params_job_queue(void *data)
> > +{
> > +	struct mali_c55_params *params = data;
> > +	struct mali_c55_params_buf *buf;
> > +
> > +	if (IS_ERR_OR_NULL(media_pad_remote_pad_unique(&params->pad)))
> > +		return;
> > +
> > +	guard(spinlock)(&params->buffers.lock);
> > +	buf = list_first_entry(&params->buffers.pending,
> > +			       struct mali_c55_params_buf, queue);
> > +	list_move_tail(&buf->queue, &params->buffers.queue);
> > +}
> > +
> > +static void mali_c55_params_job_abort(void *data)
> > +{
> > +	struct mali_c55_params *params = data;
> > +	struct mali_c55_params_buf *buf;
> > +
> > +	guard(spinlock)(&params->buffers.lock);
> > +	buf = list_last_entry(&params->buffers.queue,
> > +			      struct mali_c55_params_buf, queue);
> > +
> > +	if (buf)
> > +		list_move(&buf->queue, &params->buffers.pending);
> > +}
> > +
> > +static void mali_c55_params_run_step(void *data)
> > +{
> > +	struct mali_c55_params *params = data;
> > +	struct mali_c55 *mali_c55 = params->mali_c55;
> > +
> > +	mali_c55_params_write_config(mali_c55);
> > +}
> > +
> > +static int mali_c55_params_job_add_steps(struct media_job *job, void *data)
> > +{
> > +	return media_jobs_add_job_step(job, mali_c55_params_run_step, data,
> > +				       MEDIA_JOBS_FL_STEP_FROM_FRONT, 0);
> > +}
> > +
> > +static struct media_job_contributor_ops mali_c55_params_media_job_ops = {
>
> const
>
> > +	.add_steps	= mali_c55_params_job_add_steps,
> > +	.ready		= mali_c55_params_job_ready,
> > +	.queue		= mali_c55_params_job_queue,
> > +	.abort		= mali_c55_params_job_abort
> > +};
> > +
> > +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
> > +{
> > +	struct mali_c55_params *params = &mali_c55->params;
> > +	struct mali_c55_params_buffer *config;
> > +	struct mali_c55_params_buf *buf;
> > +	size_t block_offset = 0;
> > +	size_t max_offset;
> > +
> > +	spin_lock(&params->buffers.lock);
> > +
> > +	buf = list_first_entry_or_null(&params->buffers.queue,
> > +				       struct mali_c55_params_buf, queue);
> > +	if (buf)
> > +		list_del(&buf->queue);
> > +	spin_unlock(&params->buffers.lock);
>
> scoped_guard here?
>
> > +
> > +	if (!buf)
> > +		return;
> > +
> > +	buf->vb.sequence = mali_c55->isp.frame_sequence;
> > +	config = buf->config;
> > +
> > +	max_offset = config->total_size - sizeof(struct mali_c55_params_block_header);
> > +
> > +	/*
> > +	 * Walk the list of parameter blocks and process them. No validation is
> > +	 * done here, as the contents of the config buffer are already checked
> > +	 * when the buffer is queued.
> > +	 */
> > +	while (block_offset < max_offset) {
> > +		const struct mali_c55_block_handler *block_handler;
> > +		union mali_c55_params_block block;
> > +
> > +		block = (union mali_c55_params_block)
> > +			 &config->data[block_offset];
> > +
> > +		/* We checked the array index already in .buf_queue() */
> > +		block_handler = &mali_c55_block_handlers[block.header->type];
> > +		block_handler->handler(mali_c55, block);
> > +
> > +		block_offset += block.header->size;
> > +	}
> > +
> > +	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> > +}
> > +
> > +void mali_c55_unregister_params(struct mali_c55 *mali_c55)
> > +{
> > +	struct mali_c55_params *params = &mali_c55->params;
> > +
> > +	if (!video_is_registered(&params->vdev))
> > +		return;
> > +
> > +	vb2_video_unregister_device(&params->vdev);
> > +	media_entity_cleanup(&params->vdev.entity);
> > +	mutex_destroy(&params->lock);
> > +}
> > +
> > +int mali_c55_register_params(struct mali_c55 *mali_c55)
> > +{
> > +	struct mali_c55_params *params = &mali_c55->params;
> > +	struct video_device *vdev = &params->vdev;
> > +	struct vb2_queue *vb2q = &params->queue;
> > +	int ret;
> > +
> > +	mutex_init(&params->lock);
> > +	INIT_LIST_HEAD(&params->buffers.queue);
> > +	INIT_LIST_HEAD(&params->buffers.pending);
> > +	spin_lock_init(&params->buffers.lock);
> > +
> > +	params->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&params->vdev.entity, 1, &params->pad);
> > +	if (ret)
> > +		goto err_destroy_mutex;
> > +
> > +	vb2q->type = V4L2_BUF_TYPE_META_OUTPUT;
> > +	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
> > +	vb2q->drv_priv = params;
> > +	vb2q->mem_ops = &vb2_dma_contig_memops;
> > +	vb2q->ops = &mali_c55_params_vb2_ops;
> > +	vb2q->buf_struct_size = sizeof(struct mali_c55_params_buf);
> > +	vb2q->min_queued_buffers = 1;
> > +	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > +	vb2q->lock = &params->lock;
> > +	vb2q->dev = mali_c55->dev;
> > +
> > +	ret = vb2_queue_init(vb2q);
> > +	if (ret) {
> > +		dev_err(mali_c55->dev, "params vb2 queue init failed\n");
> > +		goto err_cleanup_entity;
> > +	}
> > +
> > +	strscpy(params->vdev.name, "mali-c55 3a params",
> > +		sizeof(params->vdev.name));
> > +	vdev->release = video_device_release_empty;
> > +	vdev->fops = &mali_c55_params_v4l2_fops;
> > +	vdev->ioctl_ops = &mali_c55_params_v4l2_ioctl_ops;
> > +	vdev->lock = &params->lock;
> > +	vdev->v4l2_dev = &mali_c55->v4l2_dev;
> > +	vdev->queue = &params->queue;
> > +	vdev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING |
> > +			    V4L2_CAP_IO_MC;
> > +	vdev->vfl_dir = VFL_DIR_TX;
> > +	video_set_drvdata(vdev, params);
> > +
> > +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> > +	if (ret) {
> > +		dev_err(mali_c55->dev,
> > +			"failed to register params video device\n");
> > +		goto err_release_vb2q;
> > +	}
> > +
> > +	ret = media_jobs_register_job_contributor(mali_c55->sched,
> > +						  &mali_c55_params_media_job_ops,
> > +						  params,
> > +						  MEDIA_JOB_TYPE_PIPELINE_PULSE);
> > +	if (ret) {
> > +		dev_err(mali_c55->dev, "Failed to add media job setup func\n");
> > +		goto err_unregister_video_device;
> > +	}
> > +
> > +	params->mali_c55 = mali_c55;
> > +
> > +	return 0;
> > +
> > +err_unregister_video_device:
> > +	video_unregister_device(vdev);
> > +err_release_vb2q:
> > +	vb2_queue_release(vb2q);
> > +err_cleanup_entity:
> > +	media_entity_cleanup(&params->vdev.entity);
> > +err_destroy_mutex:
> > +	mutex_destroy(&params->lock);
> > +
> > +	return ret;
> > +}
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > index 58dd6ce556a096ede4d3a21e472fdb9ed1cf5de3..7bcb23d798ed2c3bdd90c15cf2e2084890449b6f 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > @@ -159,6 +159,23 @@ enum mali_c55_interrupts {
> >   #define MALI_C55_BAYER_ORDER_GBRG			2
> >   #define MALI_C55_BAYER_ORDER_BGGR			3
> > +#define MALI_C55_REG_METERING_CONFIG			0x18ed0
> > +#define MALI_C55_5BIN_HIST_DISABLE_MASK			BIT(0)
> > +#define MALI_C55_5BIN_HIST_SWITCH_MASK			GENMASK(2, 1)
> > +#define MALI_C55_5BIN_HIST_SWITCH(x)			((x) << 1)
> > +#define MALI_C55_AF_DISABLE_MASK			BIT(4)
> > +#define MALI_C55_AF_SWITCH_MASK				BIT(5)
> > +#define MALI_C55_AWB_DISABLE_MASK			BIT(8)
> > +#define MALI_C55_AWB_SWITCH_MASK			BIT(9)
> > +#define MALI_C55_AWB_SWITCH(x)				((x) << 9)
> > +#define MALI_C55_AEXP_HIST_DISABLE_MASK			BIT(12)
> > +#define MALI_C55_AEXP_HIST_DISABLE			(0x01 << 12)
> > +#define MALI_C55_AEXP_HIST_SWITCH_MASK			GENMASK(14, 13)
> > +#define MALI_C55_AEXP_HIST_SWITCH(x)			((x) << 13)
> > +#define MALI_C55_AEXP_IHIST_DISABLE_MASK		BIT(16)
> > +#define MALI_C55_AEXP_IHIST_DISABLE			(0x01 << 12)
> > +#define MALI_C55_AEXP_SRC_MASK				BIT(24)
> > +
> >   #define MALI_C55_REG_TPG_CH0				0x18ed8
> >   #define MALI_C55_TEST_PATTERN_ON_OFF			BIT(0)
> >   #define MALI_C55_TEST_PATTERN_RGB_MASK			BIT(1)
> > @@ -179,6 +196,11 @@ enum mali_c55_interrupts {
> >   #define MALI_C55_REG_CONFIG_SPACES_OFFSET		0x0ab6c
> >   #define MALI_C55_CONFIG_SPACE_SIZE			0x1231c
> > +#define MALI_C55_REG_DIGITAL_GAIN			0x1926c
> > +#define MALI_C55_DIGITAL_GAIN_MASK			GENMASK(12, 0)
> > +#define MALI_C55_REG_DIGITAL_GAIN_OFFSET		0x19270
> > +#define MALI_C55_DIGITAL_GAIN_OFFSET_MASK		GENMASK(19, 0)
> > +
> >   #define MALI_C55_REG_SINTER_CONFIG			0x19348
> >   #define MALI_C55_SINTER_VIEW_FILTER_MASK		GENMASK(1, 0)
> >   #define MALI_C55_SINTER_SCALE_MODE_MASK			GENMASK(3, 2)
> > @@ -192,6 +214,59 @@ enum mali_c55_interrupts {
> >   #define MALI_C55_TEMPER_DMA_WRITE_ON			BIT(0)
> >   #define MALI_C55_TEMPER_DMA_READ_ON			BIT(1)
> > +/* Black Level Correction Configuration */
> > +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_00		0x1abcc
> > +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_01		0x1abd0
> > +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_10		0x1abd4
> > +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_11		0x1abd8
> > +#define MALI_C55_SENSOR_OFF_PRE_SHA_MASK		0xfffff
> > +
> > +/* Lens Mesh Shading Configuration */
> > +#define MALI_C55_REG_MESH_SHADING_TABLES		0x13074
> > +#define MALI_C55_REG_MESH_SHADING_CONFIG		0x1abfc
> > +#define MALI_C55_MESH_SHADING_ENABLE_MASK		BIT(0)
> > +#define MALI_C55_MESH_SHADING_MESH_SHOW_MASK		BIT(1)
> > +#define MALI_C55_MESH_SHADING_MESH_SHOW(x)		((x) << 1)
> > +#define MALI_C55_MESH_SHADING_SCALE_MASK		GENMASK(4, 2)
> > +#define MALI_C55_MESH_SHADING_SCALE(x)			((x) << 2)
> > +#define MALI_C55_MESH_SHADING_PAGE_R_MASK		GENMASK(9, 8)
> > +#define MALI_C55_MESH_SHADING_PAGE_R(x)			((x) << 8)
> > +#define MALI_C55_MESH_SHADING_PAGE_G_MASK		GENMASK(11, 10)
> > +#define MALI_C55_MESH_SHADING_PAGE_G(x)			((x) << 10)
> > +#define MALI_C55_MESH_SHADING_PAGE_B_MASK		GENMASK(13, 12)
> > +#define MALI_C55_MESH_SHADING_PAGE_B(x)			((x) << 12)
> > +#define MALI_C55_MESH_SHADING_MESH_WIDTH_MASK		GENMASK(21, 16)
> > +#define MALI_C55_MESH_SHADING_MESH_WIDTH(x)		((x) << 16)
> > +#define MALI_C55_MESH_SHADING_MESH_HEIGHT_MASK		GENMASK(29, 24)
> > +#define MALI_C55_MESH_SHADING_MESH_HEIGHT(x)		((x) << 24)
> > +
> > +#define MALI_C55_REG_MESH_SHADING_ALPHA_BANK		0x1ac04
> > +#define MALI_C55_MESH_SHADING_ALPHA_BANK_R_MASK		GENMASK(2, 0)
> > +#define MALI_C55_MESH_SHADING_ALPHA_BANK_G_MASK		GENMASK(5, 3)
> > +#define MALI_C55_MESH_SHADING_ALPHA_BANK_G(x)		((x) << 3)
> > +#define MALI_C55_MESH_SHADING_ALPHA_BANK_B_MASK		GENMASK(8, 6)
> > +#define MALI_C55_MESH_SHADING_ALPHA_BANK_B(x)		((x) << 6)
> > +#define MALI_C55_REG_MESH_SHADING_ALPHA			0x1ac08
> > +#define MALI_C55_MESH_SHADING_ALPHA_R_MASK		GENMASK(7, 0)
> > +#define MALI_C55_MESH_SHADING_ALPHA_G_MASK		GENMASK(15, 8)
> > +#define MALI_C55_MESH_SHADING_ALPHA_G(x)		((x) << 8)
> > +#define MALI_C55_MESH_SHADING_ALPHA_B_MASK		GENMASK(23, 16)
> > +#define MALI_C55_MESH_SHADING_ALPHA_B(x)		((x) << 16)
> > +#define MALI_C55_REG_MESH_SHADING_MESH_STRENGTH		0x1ac0c
> > +#define MALI_c55_MESH_STRENGTH_MASK			GENMASK(15, 0)
> > +
> > +/* AWB Gains Configuration */
> > +#define MALI_C55_REG_AWB_GAINS1				0x1ac10
> > +#define MALI_C55_AWB_GAIN00_MASK			GENMASK(11, 0)
> > +#define MALI_C55_AWB_GAIN01_MASK			GENMASK(27, 16)
> > +#define MALI_C55_AWB_GAIN01(x)				((x) << 16)
> > +#define MALI_C55_REG_AWB_GAINS2				0x1ac14
> > +#define MALI_C55_AWB_GAIN10_MASK			GENMASK(11, 0)
> > +#define MALI_C55_AWB_GAIN11_MASK			GENMASK(27, 16)
> > +#define MALI_C55_AWB_GAIN11(x)				((x) << 16)
> > +#define MALI_C55_REG_AWB_GAINS1_AEXP			0x1ac18
> > +#define MALI_C55_REG_AWB_GAINS2_AEXP			0x1ac1c
> > +
> >   /* Colour Correction Matrix Configuration */
> >   #define MALI_C55_REG_CCM_ENABLE				0x1b07c
> >   #define MALI_C55_CCM_ENABLE_MASK			BIT(0)
> > @@ -214,6 +289,59 @@ enum mali_c55_interrupts {
> >   #define MALI_C55_REG_CCM_ANTIFOG_OFFSET_B		0x1b0c8
> >   #define MALI_C55_CCM_ANTIFOG_OFFSET_MASK		GENMASK(11, 0)
> > +/* AWB Statistics Configuration */
> > +#define MALI_C55_REG_AWB_STATS_MODE			0x1b29c
> > +#define MALI_C55_AWB_STATS_MODE_MASK			BIT(0)
> > +#define MALI_C55_REG_AWB_WHITE_LEVEL			0x1b2a0
> > +#define MALI_C55_AWB_WHITE_LEVEL_MASK			GENMASK(9, 0)
> > +#define MALI_C55_REG_AWB_BLACK_LEVEL			0x1b2a4
> > +#define MALI_C55_AWB_BLACK_LEVEL_MASK			GENMASK(9, 0)
> > +#define MALI_C55_REG_AWB_CR_MAX				0x1b2a8
> > +#define MALI_C55_AWB_CR_MAX_MASK			GENMASK(11, 0)
> > +#define MALI_C55_REG_AWB_CR_MIN				0x1b2ac
> > +#define MALI_C55_AWB_CR_MIN_MASK			GENMASK(11, 0)
> > +#define MALI_C55_REG_AWB_CB_MAX				0x1b2b0
> > +#define MALI_C55_AWB_CB_MAX_MASK			GENMASK(11, 0)
> > +#define MALI_C55_REG_AWB_CB_MIN				0x1b2b4
> > +#define MALI_C55_AWB_CB_MIN_MASK			GENMASK(11, 0)
> > +#define MALI_C55_REG_AWB_NODES_USED			0x1b2c4
> > +#define MALI_C55_AWB_NODES_USED_HORIZ_MASK		GENMASK(7, 0)
> > +#define MALI_C55_AWB_NODES_USED_VERT_MASK		GENMASK(15, 8)
> > +#define MALI_C55_AWB_NODES_USED_VERT(x)			((x) << 8)
> > +#define MALI_C55_REG_AWB_CR_HIGH			0x1b2c8
> > +#define MALI_C55_AWB_CR_HIGH_MASK			GENMASK(11, 0)
> > +#define MALI_C55_REG_AWB_CR_LOW				0x1b2cc
> > +#define MALI_C55_AWB_CR_LOW_MASK			GENMASK(11, 0)
> > +#define MALI_C55_REG_AWB_CB_HIGH			0x1b2d0
> > +#define MALI_C55_AWB_CB_HIGH_MASK			GENMASK(11, 0)
> > +#define MALI_C55_REG_AWB_CB_LOW				0x1b2d4
> > +#define MALI_C55_AWB_CB_LOW_MASK			GENMASK(11, 0)
> > +
> > +/* AEXP Metering Histogram Configuration */
> > +#define MALI_C55_REG_AEXP_HIST_BASE			0x1b730
> > +#define MALI_C55_REG_AEXP_IHIST_BASE			0x1bbac
> > +#define MALI_C55_AEXP_HIST_SKIP_OFFSET			0
> > +#define MALI_C55_AEXP_HIST_SKIP_X_MASK			GENMASK(2, 0)
> > +#define MALI_C55_AEXP_HIST_SKIP_X(x)			((x) << 0)
> > +#define MALI_C55_AEXP_HIST_OFFSET_X_MASK		BIT(3)
> > +#define MALI_C55_AEXP_HIST_OFFSET_X(x)			((x) << 3)
> > +#define MALI_C55_AEXP_HIST_SKIP_Y_MASK			GENMASK(6, 4)
> > +#define MALI_C55_AEXP_HIST_SKIP_Y(x)			((x) << 4)
> > +#define MALI_C55_AEXP_HIST_OFFSET_Y_MASK		BIT(7)
> > +#define MALI_C55_AEXP_HIST_OFFSET_Y(x)			((x) << 7)
> > +#define MALI_C55_AEXP_HIST_SCALE_OFFSET			4
> > +#define MALI_C55_AEXP_HIST_SCALE_BOTTOM_MASK		GENMASK(3, 0)
> > +#define MALI_C55_AEXP_HIST_SCALE_TOP_MASK		GENMASK(7, 4)
> > +#define MALI_C55_AEXP_HIST_SCALE_TOP(x)			((x) << 4)
> > +#define MALI_C55_AEXP_HIST_PLANE_MODE_OFFSET		16
> > +#define MALI_C55_AEXP_HIST_PLANE_MODE_MASK		GENMASK(2, 0)
> > +#define MALI_C55_AEXP_HIST_NODES_USED_OFFSET		52
> > +#define MALI_C55_AEXP_HIST_NODES_USED_HORIZ_MASK	GENMASK(7, 0)
> > +#define MALI_C55_AEXP_HIST_NODES_USED_VERT_MASK		GENMASK(15, 8)
> > +#define MALI_C55_AEXP_HIST_NODES_USED_VERT(x)		((x) << 8)
> > +#define MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET		56
> > +#define MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK		0x0f0f0f0f
> > +
> >   /*
> >    * The Mali-C55 ISP has up to two output pipes; known as full resolution and
> >    * down scaled. The register space for these is laid out identically, but offset
> >
>
> --
> Regards,
>
> Sakari Ailus

