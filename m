Return-Path: <linux-media+bounces-36241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D5AED533
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C16AD3B7116
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE572253F2;
	Mon, 30 Jun 2025 07:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qn2aN+UA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD521CC54;
	Mon, 30 Jun 2025 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267199; cv=none; b=XLMCf607YrI5U/hL/BIdds3yDVhaJp4xx7LxMjWJiT3P59tc9hhHcBTDNxCF1ErTrWVkP0ITffXN98oXnqNfiPeMR26UAMvLQqPLVcHMIAYEOWWiibUWaOIHa80SN3JY0RNjI5dICMmQOAJET/j0UY8uy2eUX2+BdNCAAiJfbsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267199; c=relaxed/simple;
	bh=Ko7xK8JkSZxiIceCxKMQSLwzZHRwvy25pHDxQTV6zAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ob3ItP+RkOFzeB1HLcosfnl1RJAadKlX6fWdG1IGr3g3aLMYQDKnofjQnmbCmq89vN83VHZ9voViCqDlTarl6v8ODSBavTILWQK7Lqy8hU91cEzcLvDOCVdTAd+2YaE407prDqYO7wIwFSfXsCPLiGofbW1iq/UGMkxOOpcZ1aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qn2aN+UA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751267197; x=1782803197;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ko7xK8JkSZxiIceCxKMQSLwzZHRwvy25pHDxQTV6zAM=;
  b=Qn2aN+UAdZsP3s0u6gAW6edHBB7xKd4/f+xsTfIsBa2unLWFF9khoE6R
   D4+UbY1FIyR1DeUEWKXJNxINCiTDhneoUDHsPBS6ePYWY6WMJGah8nVBk
   GhdJJ4mjkBKy1doy4CNNGF473JHLgP7QO/tlYopDro2S5tMiD6zW3Xzwi
   2zi/aoLwKgYohb/1npko5p1F5wtfTVkJfRlEZG5vxfs0vg9WOsvjC3jZ/
   aRA3h055WRZihKafcBbX46xfoU3KozoRQOIRySF1D/u76TeIz5CYdsPe0
   lNShZnVJ4axmfl9EO/ahEYUP9hoHjrVX1IyplLwiNWiHU/ut7I2dleZSE
   Q==;
X-CSE-ConnectionGUID: THU+DxhcQ3a1YEas8phiSA==
X-CSE-MsgGUID: H21CRQQpS0evXVLOSE/zAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52600176"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52600176"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:37 -0700
X-CSE-ConnectionGUID: 61hZVFrQSJSBw5pTOHyl8A==
X-CSE-MsgGUID: BPzb6XoHTUKg5YPNrKLWgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="177046712"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:33 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id ABFFD44391;
	Mon, 30 Jun 2025 10:06:31 +0300 (EEST)
Message-ID: <cd60eec7-cb91-4c88-9a63-298ed6582379@linux.intel.com>
Date: Sun, 29 Jun 2025 14:27:39 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/17] media: platform: Add mali-c55 parameters video
 node
Content-Language: en-US
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-16-54f3d4196990@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20250624-c55-v10-16-54f3d4196990@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 6/24/25 13:21, Daniel Scally wrote:
> +static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> +	struct mali_c55 *mali_c55 = params->mali_c55;
> +	struct mali_c55_params_buffer *config;
> +	struct list_head *queue;
> +	size_t block_offset = 0;
> +	size_t max_offset;
> +
> +	/*
> +	 * Before accepting the buffer we should check that the data within it
> +	 * is valid.
> +	 */
> +	config = vb2_plane_vaddr(vb, 0);
> +
> +	if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
> +		dev_dbg(mali_c55->dev, "Invalid parameters buffer size %u\n",
> +			config->total_size);
> +		goto err_buffer_done;
> +	}
> +
> +	/* Currently only v1 is supported */
> +	if (config->version != MALI_C55_PARAM_BUFFER_V1) {
> +		dev_dbg(mali_c55->dev, "Invalid parameters version\n");
> +		goto err_buffer_done;
> +	}
> +
> +	max_offset = config->total_size - sizeof(struct mali_c55_params_block_header);
> +	while (block_offset < max_offset) {
> +		const struct mali_c55_block_handler *block_handler;
> +		union mali_c55_params_block block;
> +
> +		block = (union mali_c55_params_block)
> +			 &config->data[block_offset];
> +
> +		if (block.header->type >= ARRAY_SIZE(mali_c55_block_handlers)) {
> +			dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
> +			goto err_buffer_done;
> +		}
> +
> +		if (block_offset + block.header->size > config->total_size) {
> +			dev_dbg(mali_c55->dev, "Parameters block too large\n");
> +			goto err_buffer_done;
> +		}
> +
> +		block_handler = &mali_c55_block_handlers[block.header->type];
> +
> +		/*
> +		 * Userspace can optionally omit all but the header of a block
> +		 * if it only intends to disable the block.
> +		 */
> +		if (block.header->size != block_handler->size &&
> +		    block.header->size != sizeof(*block.header)) {
> +			dev_dbg(mali_c55->dev, "Invalid parameters block size\n");
> +			goto err_buffer_done;
> +		}
> +
> +		block_offset += block.header->size;

I recall discussing with Jacopo in the context of another ISP driver 
(Rockchip?) that this piece of non-trivial code should make it into the 
framework side before a next driver using it has been added. What's the 
status of that? Same for other related bits.

> +	}
> +
> +	vb2_set_plane_payload(vb, 0, sizeof(struct mali_c55_params_buffer));
> +
> +	/*
> +	 * Copy the parameters buffer provided by userspace to the internal
> +	 * scratch buffer. This protects against the chance of userspace making
> +	 * changed to the buffer content whilst the driver processes it.
> +	 */
> +	memcpy(buf->config, config, sizeof(*config));
> +
> +	queue = mali_c55->inline_mode ? &params->buffers.queue :
> +					&params->buffers.pending;
> +
> +	spin_lock(&params->buffers.lock);
> +	list_add_tail(&buf->queue, queue);
> +	spin_unlock(&params->buffers.lock);
> +
> +	media_jobs_try_queue_job(mali_c55->sched, MEDIA_JOB_TYPE_PIPELINE_PULSE);
> +
> +	return;
> +
> +err_buffer_done:
> +	vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
> +}

...

> +static bool mali_c55_params_job_ready(void *data)
> +{
> +	struct mali_c55_params *params = data;
> +
> +	if (IS_ERR_OR_NULL(media_pad_remote_pad_unique(&params->pad)))
> +		return true;
> +
> +	guard(spinlock)(&params->buffers.lock);
> +
> +	if (list_empty(&params->buffers.pending))
> +		return false;

	return !list_empty(...);

> +
> +	return true;
> +}
> +
> +static void mali_c55_params_job_queue(void *data)
> +{
> +	struct mali_c55_params *params = data;
> +	struct mali_c55_params_buf *buf;
> +
> +	if (IS_ERR_OR_NULL(media_pad_remote_pad_unique(&params->pad)))
> +		return;
> +
> +	guard(spinlock)(&params->buffers.lock);
> +	buf = list_first_entry(&params->buffers.pending,
> +			       struct mali_c55_params_buf, queue);
> +	list_move_tail(&buf->queue, &params->buffers.queue);
> +}
> +
> +static void mali_c55_params_job_abort(void *data)
> +{
> +	struct mali_c55_params *params = data;
> +	struct mali_c55_params_buf *buf;
> +
> +	guard(spinlock)(&params->buffers.lock);
> +	buf = list_last_entry(&params->buffers.queue,
> +			      struct mali_c55_params_buf, queue);
> +
> +	if (buf)
> +		list_move(&buf->queue, &params->buffers.pending);
> +}
> +
> +static void mali_c55_params_run_step(void *data)
> +{
> +	struct mali_c55_params *params = data;
> +	struct mali_c55 *mali_c55 = params->mali_c55;
> +
> +	mali_c55_params_write_config(mali_c55);
> +}
> +
> +static int mali_c55_params_job_add_steps(struct media_job *job, void *data)
> +{
> +	return media_jobs_add_job_step(job, mali_c55_params_run_step, data,
> +				       MEDIA_JOBS_FL_STEP_FROM_FRONT, 0);
> +}
> +
> +static struct media_job_contributor_ops mali_c55_params_media_job_ops = {

const

> +	.add_steps	= mali_c55_params_job_add_steps,
> +	.ready		= mali_c55_params_job_ready,
> +	.queue		= mali_c55_params_job_queue,
> +	.abort		= mali_c55_params_job_abort
> +};
> +
> +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
> +{
> +	struct mali_c55_params *params = &mali_c55->params;
> +	struct mali_c55_params_buffer *config;
> +	struct mali_c55_params_buf *buf;
> +	size_t block_offset = 0;
> +	size_t max_offset;
> +
> +	spin_lock(&params->buffers.lock);
> +
> +	buf = list_first_entry_or_null(&params->buffers.queue,
> +				       struct mali_c55_params_buf, queue);
> +	if (buf)
> +		list_del(&buf->queue);
> +	spin_unlock(&params->buffers.lock);

scoped_guard here?

> +
> +	if (!buf)
> +		return;
> +
> +	buf->vb.sequence = mali_c55->isp.frame_sequence;
> +	config = buf->config;
> +
> +	max_offset = config->total_size - sizeof(struct mali_c55_params_block_header);
> +
> +	/*
> +	 * Walk the list of parameter blocks and process them. No validation is
> +	 * done here, as the contents of the config buffer are already checked
> +	 * when the buffer is queued.
> +	 */
> +	while (block_offset < max_offset) {
> +		const struct mali_c55_block_handler *block_handler;
> +		union mali_c55_params_block block;
> +
> +		block = (union mali_c55_params_block)
> +			 &config->data[block_offset];
> +
> +		/* We checked the array index already in .buf_queue() */
> +		block_handler = &mali_c55_block_handlers[block.header->type];
> +		block_handler->handler(mali_c55, block);
> +
> +		block_offset += block.header->size;
> +	}
> +
> +	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +}
> +
> +void mali_c55_unregister_params(struct mali_c55 *mali_c55)
> +{
> +	struct mali_c55_params *params = &mali_c55->params;
> +
> +	if (!video_is_registered(&params->vdev))
> +		return;
> +
> +	vb2_video_unregister_device(&params->vdev);
> +	media_entity_cleanup(&params->vdev.entity);
> +	mutex_destroy(&params->lock);
> +}
> +
> +int mali_c55_register_params(struct mali_c55 *mali_c55)
> +{
> +	struct mali_c55_params *params = &mali_c55->params;
> +	struct video_device *vdev = &params->vdev;
> +	struct vb2_queue *vb2q = &params->queue;
> +	int ret;
> +
> +	mutex_init(&params->lock);
> +	INIT_LIST_HEAD(&params->buffers.queue);
> +	INIT_LIST_HEAD(&params->buffers.pending);
> +	spin_lock_init(&params->buffers.lock);
> +
> +	params->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&params->vdev.entity, 1, &params->pad);
> +	if (ret)
> +		goto err_destroy_mutex;
> +
> +	vb2q->type = V4L2_BUF_TYPE_META_OUTPUT;
> +	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	vb2q->drv_priv = params;
> +	vb2q->mem_ops = &vb2_dma_contig_memops;
> +	vb2q->ops = &mali_c55_params_vb2_ops;
> +	vb2q->buf_struct_size = sizeof(struct mali_c55_params_buf);
> +	vb2q->min_queued_buffers = 1;
> +	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	vb2q->lock = &params->lock;
> +	vb2q->dev = mali_c55->dev;
> +
> +	ret = vb2_queue_init(vb2q);
> +	if (ret) {
> +		dev_err(mali_c55->dev, "params vb2 queue init failed\n");
> +		goto err_cleanup_entity;
> +	}
> +
> +	strscpy(params->vdev.name, "mali-c55 3a params",
> +		sizeof(params->vdev.name));
> +	vdev->release = video_device_release_empty;
> +	vdev->fops = &mali_c55_params_v4l2_fops;
> +	vdev->ioctl_ops = &mali_c55_params_v4l2_ioctl_ops;
> +	vdev->lock = &params->lock;
> +	vdev->v4l2_dev = &mali_c55->v4l2_dev;
> +	vdev->queue = &params->queue;
> +	vdev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING |
> +			    V4L2_CAP_IO_MC;
> +	vdev->vfl_dir = VFL_DIR_TX;
> +	video_set_drvdata(vdev, params);
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		dev_err(mali_c55->dev,
> +			"failed to register params video device\n");
> +		goto err_release_vb2q;
> +	}
> +
> +	ret = media_jobs_register_job_contributor(mali_c55->sched,
> +						  &mali_c55_params_media_job_ops,
> +						  params,
> +						  MEDIA_JOB_TYPE_PIPELINE_PULSE);
> +	if (ret) {
> +		dev_err(mali_c55->dev, "Failed to add media job setup func\n");
> +		goto err_unregister_video_device;
> +	}
> +
> +	params->mali_c55 = mali_c55;
> +
> +	return 0;
> +
> +err_unregister_video_device:
> +	video_unregister_device(vdev);
> +err_release_vb2q:
> +	vb2_queue_release(vb2q);
> +err_cleanup_entity:
> +	media_entity_cleanup(&params->vdev.entity);
> +err_destroy_mutex:
> +	mutex_destroy(&params->lock);
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> index 58dd6ce556a096ede4d3a21e472fdb9ed1cf5de3..7bcb23d798ed2c3bdd90c15cf2e2084890449b6f 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> @@ -159,6 +159,23 @@ enum mali_c55_interrupts {
>   #define MALI_C55_BAYER_ORDER_GBRG			2
>   #define MALI_C55_BAYER_ORDER_BGGR			3
>   
> +#define MALI_C55_REG_METERING_CONFIG			0x18ed0
> +#define MALI_C55_5BIN_HIST_DISABLE_MASK			BIT(0)
> +#define MALI_C55_5BIN_HIST_SWITCH_MASK			GENMASK(2, 1)
> +#define MALI_C55_5BIN_HIST_SWITCH(x)			((x) << 1)
> +#define MALI_C55_AF_DISABLE_MASK			BIT(4)
> +#define MALI_C55_AF_SWITCH_MASK				BIT(5)
> +#define MALI_C55_AWB_DISABLE_MASK			BIT(8)
> +#define MALI_C55_AWB_SWITCH_MASK			BIT(9)
> +#define MALI_C55_AWB_SWITCH(x)				((x) << 9)
> +#define MALI_C55_AEXP_HIST_DISABLE_MASK			BIT(12)
> +#define MALI_C55_AEXP_HIST_DISABLE			(0x01 << 12)
> +#define MALI_C55_AEXP_HIST_SWITCH_MASK			GENMASK(14, 13)
> +#define MALI_C55_AEXP_HIST_SWITCH(x)			((x) << 13)
> +#define MALI_C55_AEXP_IHIST_DISABLE_MASK		BIT(16)
> +#define MALI_C55_AEXP_IHIST_DISABLE			(0x01 << 12)
> +#define MALI_C55_AEXP_SRC_MASK				BIT(24)
> +
>   #define MALI_C55_REG_TPG_CH0				0x18ed8
>   #define MALI_C55_TEST_PATTERN_ON_OFF			BIT(0)
>   #define MALI_C55_TEST_PATTERN_RGB_MASK			BIT(1)
> @@ -179,6 +196,11 @@ enum mali_c55_interrupts {
>   #define MALI_C55_REG_CONFIG_SPACES_OFFSET		0x0ab6c
>   #define MALI_C55_CONFIG_SPACE_SIZE			0x1231c
>   
> +#define MALI_C55_REG_DIGITAL_GAIN			0x1926c
> +#define MALI_C55_DIGITAL_GAIN_MASK			GENMASK(12, 0)
> +#define MALI_C55_REG_DIGITAL_GAIN_OFFSET		0x19270
> +#define MALI_C55_DIGITAL_GAIN_OFFSET_MASK		GENMASK(19, 0)
> +
>   #define MALI_C55_REG_SINTER_CONFIG			0x19348
>   #define MALI_C55_SINTER_VIEW_FILTER_MASK		GENMASK(1, 0)
>   #define MALI_C55_SINTER_SCALE_MODE_MASK			GENMASK(3, 2)
> @@ -192,6 +214,59 @@ enum mali_c55_interrupts {
>   #define MALI_C55_TEMPER_DMA_WRITE_ON			BIT(0)
>   #define MALI_C55_TEMPER_DMA_READ_ON			BIT(1)
>   
> +/* Black Level Correction Configuration */
> +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_00		0x1abcc
> +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_01		0x1abd0
> +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_10		0x1abd4
> +#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_11		0x1abd8
> +#define MALI_C55_SENSOR_OFF_PRE_SHA_MASK		0xfffff
> +
> +/* Lens Mesh Shading Configuration */
> +#define MALI_C55_REG_MESH_SHADING_TABLES		0x13074
> +#define MALI_C55_REG_MESH_SHADING_CONFIG		0x1abfc
> +#define MALI_C55_MESH_SHADING_ENABLE_MASK		BIT(0)
> +#define MALI_C55_MESH_SHADING_MESH_SHOW_MASK		BIT(1)
> +#define MALI_C55_MESH_SHADING_MESH_SHOW(x)		((x) << 1)
> +#define MALI_C55_MESH_SHADING_SCALE_MASK		GENMASK(4, 2)
> +#define MALI_C55_MESH_SHADING_SCALE(x)			((x) << 2)
> +#define MALI_C55_MESH_SHADING_PAGE_R_MASK		GENMASK(9, 8)
> +#define MALI_C55_MESH_SHADING_PAGE_R(x)			((x) << 8)
> +#define MALI_C55_MESH_SHADING_PAGE_G_MASK		GENMASK(11, 10)
> +#define MALI_C55_MESH_SHADING_PAGE_G(x)			((x) << 10)
> +#define MALI_C55_MESH_SHADING_PAGE_B_MASK		GENMASK(13, 12)
> +#define MALI_C55_MESH_SHADING_PAGE_B(x)			((x) << 12)
> +#define MALI_C55_MESH_SHADING_MESH_WIDTH_MASK		GENMASK(21, 16)
> +#define MALI_C55_MESH_SHADING_MESH_WIDTH(x)		((x) << 16)
> +#define MALI_C55_MESH_SHADING_MESH_HEIGHT_MASK		GENMASK(29, 24)
> +#define MALI_C55_MESH_SHADING_MESH_HEIGHT(x)		((x) << 24)
> +
> +#define MALI_C55_REG_MESH_SHADING_ALPHA_BANK		0x1ac04
> +#define MALI_C55_MESH_SHADING_ALPHA_BANK_R_MASK		GENMASK(2, 0)
> +#define MALI_C55_MESH_SHADING_ALPHA_BANK_G_MASK		GENMASK(5, 3)
> +#define MALI_C55_MESH_SHADING_ALPHA_BANK_G(x)		((x) << 3)
> +#define MALI_C55_MESH_SHADING_ALPHA_BANK_B_MASK		GENMASK(8, 6)
> +#define MALI_C55_MESH_SHADING_ALPHA_BANK_B(x)		((x) << 6)
> +#define MALI_C55_REG_MESH_SHADING_ALPHA			0x1ac08
> +#define MALI_C55_MESH_SHADING_ALPHA_R_MASK		GENMASK(7, 0)
> +#define MALI_C55_MESH_SHADING_ALPHA_G_MASK		GENMASK(15, 8)
> +#define MALI_C55_MESH_SHADING_ALPHA_G(x)		((x) << 8)
> +#define MALI_C55_MESH_SHADING_ALPHA_B_MASK		GENMASK(23, 16)
> +#define MALI_C55_MESH_SHADING_ALPHA_B(x)		((x) << 16)
> +#define MALI_C55_REG_MESH_SHADING_MESH_STRENGTH		0x1ac0c
> +#define MALI_c55_MESH_STRENGTH_MASK			GENMASK(15, 0)
> +
> +/* AWB Gains Configuration */
> +#define MALI_C55_REG_AWB_GAINS1				0x1ac10
> +#define MALI_C55_AWB_GAIN00_MASK			GENMASK(11, 0)
> +#define MALI_C55_AWB_GAIN01_MASK			GENMASK(27, 16)
> +#define MALI_C55_AWB_GAIN01(x)				((x) << 16)
> +#define MALI_C55_REG_AWB_GAINS2				0x1ac14
> +#define MALI_C55_AWB_GAIN10_MASK			GENMASK(11, 0)
> +#define MALI_C55_AWB_GAIN11_MASK			GENMASK(27, 16)
> +#define MALI_C55_AWB_GAIN11(x)				((x) << 16)
> +#define MALI_C55_REG_AWB_GAINS1_AEXP			0x1ac18
> +#define MALI_C55_REG_AWB_GAINS2_AEXP			0x1ac1c
> +
>   /* Colour Correction Matrix Configuration */
>   #define MALI_C55_REG_CCM_ENABLE				0x1b07c
>   #define MALI_C55_CCM_ENABLE_MASK			BIT(0)
> @@ -214,6 +289,59 @@ enum mali_c55_interrupts {
>   #define MALI_C55_REG_CCM_ANTIFOG_OFFSET_B		0x1b0c8
>   #define MALI_C55_CCM_ANTIFOG_OFFSET_MASK		GENMASK(11, 0)
>   
> +/* AWB Statistics Configuration */
> +#define MALI_C55_REG_AWB_STATS_MODE			0x1b29c
> +#define MALI_C55_AWB_STATS_MODE_MASK			BIT(0)
> +#define MALI_C55_REG_AWB_WHITE_LEVEL			0x1b2a0
> +#define MALI_C55_AWB_WHITE_LEVEL_MASK			GENMASK(9, 0)
> +#define MALI_C55_REG_AWB_BLACK_LEVEL			0x1b2a4
> +#define MALI_C55_AWB_BLACK_LEVEL_MASK			GENMASK(9, 0)
> +#define MALI_C55_REG_AWB_CR_MAX				0x1b2a8
> +#define MALI_C55_AWB_CR_MAX_MASK			GENMASK(11, 0)
> +#define MALI_C55_REG_AWB_CR_MIN				0x1b2ac
> +#define MALI_C55_AWB_CR_MIN_MASK			GENMASK(11, 0)
> +#define MALI_C55_REG_AWB_CB_MAX				0x1b2b0
> +#define MALI_C55_AWB_CB_MAX_MASK			GENMASK(11, 0)
> +#define MALI_C55_REG_AWB_CB_MIN				0x1b2b4
> +#define MALI_C55_AWB_CB_MIN_MASK			GENMASK(11, 0)
> +#define MALI_C55_REG_AWB_NODES_USED			0x1b2c4
> +#define MALI_C55_AWB_NODES_USED_HORIZ_MASK		GENMASK(7, 0)
> +#define MALI_C55_AWB_NODES_USED_VERT_MASK		GENMASK(15, 8)
> +#define MALI_C55_AWB_NODES_USED_VERT(x)			((x) << 8)
> +#define MALI_C55_REG_AWB_CR_HIGH			0x1b2c8
> +#define MALI_C55_AWB_CR_HIGH_MASK			GENMASK(11, 0)
> +#define MALI_C55_REG_AWB_CR_LOW				0x1b2cc
> +#define MALI_C55_AWB_CR_LOW_MASK			GENMASK(11, 0)
> +#define MALI_C55_REG_AWB_CB_HIGH			0x1b2d0
> +#define MALI_C55_AWB_CB_HIGH_MASK			GENMASK(11, 0)
> +#define MALI_C55_REG_AWB_CB_LOW				0x1b2d4
> +#define MALI_C55_AWB_CB_LOW_MASK			GENMASK(11, 0)
> +
> +/* AEXP Metering Histogram Configuration */
> +#define MALI_C55_REG_AEXP_HIST_BASE			0x1b730
> +#define MALI_C55_REG_AEXP_IHIST_BASE			0x1bbac
> +#define MALI_C55_AEXP_HIST_SKIP_OFFSET			0
> +#define MALI_C55_AEXP_HIST_SKIP_X_MASK			GENMASK(2, 0)
> +#define MALI_C55_AEXP_HIST_SKIP_X(x)			((x) << 0)
> +#define MALI_C55_AEXP_HIST_OFFSET_X_MASK		BIT(3)
> +#define MALI_C55_AEXP_HIST_OFFSET_X(x)			((x) << 3)
> +#define MALI_C55_AEXP_HIST_SKIP_Y_MASK			GENMASK(6, 4)
> +#define MALI_C55_AEXP_HIST_SKIP_Y(x)			((x) << 4)
> +#define MALI_C55_AEXP_HIST_OFFSET_Y_MASK		BIT(7)
> +#define MALI_C55_AEXP_HIST_OFFSET_Y(x)			((x) << 7)
> +#define MALI_C55_AEXP_HIST_SCALE_OFFSET			4
> +#define MALI_C55_AEXP_HIST_SCALE_BOTTOM_MASK		GENMASK(3, 0)
> +#define MALI_C55_AEXP_HIST_SCALE_TOP_MASK		GENMASK(7, 4)
> +#define MALI_C55_AEXP_HIST_SCALE_TOP(x)			((x) << 4)
> +#define MALI_C55_AEXP_HIST_PLANE_MODE_OFFSET		16
> +#define MALI_C55_AEXP_HIST_PLANE_MODE_MASK		GENMASK(2, 0)
> +#define MALI_C55_AEXP_HIST_NODES_USED_OFFSET		52
> +#define MALI_C55_AEXP_HIST_NODES_USED_HORIZ_MASK	GENMASK(7, 0)
> +#define MALI_C55_AEXP_HIST_NODES_USED_VERT_MASK		GENMASK(15, 8)
> +#define MALI_C55_AEXP_HIST_NODES_USED_VERT(x)		((x) << 8)
> +#define MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET		56
> +#define MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK		0x0f0f0f0f
> +
>   /*
>    * The Mali-C55 ISP has up to two output pipes; known as full resolution and
>    * down scaled. The register space for these is laid out identically, but offset
> 

-- 
Regards,

Sakari Ailus

