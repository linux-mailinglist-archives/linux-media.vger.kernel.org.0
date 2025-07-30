Return-Path: <linux-media+bounces-38662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC64B162F2
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 16:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E2D0174318
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 14:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDEA2DA740;
	Wed, 30 Jul 2025 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxJtsYhF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AF086347;
	Wed, 30 Jul 2025 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753886179; cv=none; b=IzlBc4P8jP9hNcGxcxU6tjG63bhlthyr63JK8Aet+l8qkPeAfbP6t6nMRARv4kqerGul7kumj+Zgq4q5DwGP9IArTRSnNUyVF9eP9TLfF5TZRUQRU8VSM3dwZmIUMTZE9cEu+dS2EWxC1Cj5qXOR81P9qIk1EokejNEWAuYg4mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753886179; c=relaxed/simple;
	bh=lxHKgUkWac2v36o8e3U/pGI0AZva8sNFeeBWqCh7CxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRwIXYINtEJcJkMcN7gbv+5ePWi+vZYP9IGfCui7fMV1nSatU0wVpb3bYEJDmYtAI4JN1Ho21Cujk7Zxw3PEMPClDGewsbnxh7Z79Djw9++ffoUe6zdAQqwGOXhuzEeaY+O9VwrN5BIPMFM0M6SIwLU+aQyAq2sUanr06GbVSLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxJtsYhF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753886177; x=1785422177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lxHKgUkWac2v36o8e3U/pGI0AZva8sNFeeBWqCh7CxI=;
  b=WxJtsYhFUE2iNYqDn/tOIfNEIRArshhs46THlxYe16opZQAkf34st8nr
   yn6fComSM6ZGcTSx6+eK4XzTtPJbmAi+KxYAjwx1lGZOJPVg7whS+UzXi
   nzIzbZemNL3W9PVMAuCUxRHc6fXjJFWPmvO/n9VihuTTAuWa1jFGhI0kh
   njqXmFvNwjieJvLe+tQfhwTn/zHrp7pMFuatwmREYsfHsav6lRZaxcuYe
   tl4d5cbft13FLF1sva2+1fUzd4b1lm1OeUkiJyf+wUazLxUPbaJXIfRN5
   sTqyZWegt22meJYqpt4t0yyiNvSijf4J6mfUgoBrn7LpOAh40FsDWT6Ql
   w==;
X-CSE-ConnectionGUID: IjRKHNfNRGi4Wleoa4U+Tg==
X-CSE-MsgGUID: OH0SmeAjRmOe+zJET+GwpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55394565"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55394565"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 07:36:16 -0700
X-CSE-ConnectionGUID: OfhaFuY8TTaqQ+iBtG4J9w==
X-CSE-MsgGUID: ZhP/bfnFQ8Kz4Wlk2pAVPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162267682"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.47])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 07:36:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5D4DB11FA47;
	Wed, 30 Jul 2025 17:36:10 +0300 (EEST)
Date: Wed, 30 Jul 2025 14:36:10 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v11 18/19] media: platform: Add mali-c55 parameters video
 node
Message-ID: <aIot2pmuIIidZORo@kekkonen.localdomain>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-18-bc20e460e42a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-c55-v11-18-bc20e460e42a@ideasonboard.com>

Hi Daniel,

Thanks for the update.

On Mon, Jul 14, 2025 at 04:06:44PM +0100, Daniel Scally wrote:
> +static int
> +mali_c55_params_validate_buffer(struct device *dev,
> +				const struct v4l2_params_buffer *buffer)
> +{
> +	/* Only v1 is supported at the moment. */
> +	if (buffer->version != MALI_C55_PARAM_BUFFER_V1) {
> +		dev_dbg(dev, "Unsupported extensible format version: %u\n",
> +			buffer->version);
> +		return -EINVAL;
> +	}

Is there anything else to validate here?

I guess nothing is done with the information other than the value is being
checked above, but if it had an effect on something, one would need to copy
the information to memory not accessible to the user.

> +
> +	return 0;
> +}
> +
> +static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> +	struct mali_c55 *mali_c55 = params->mali_c55;
> +	struct v4l2_params_buffer *config;
> +	int ret;
> +
> +	ret = v4l2_params_buffer_validate(
> +		mali_c55->dev, vb,
> +		v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> +		mali_c55_params_validate_buffer);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Copy the parameters buffer provided by userspace to the internal
> +	 * scratch buffer. This protects against the chance of userspace making
> +	 * changed to the buffer content whilst the driver processes it.
> +	 */
> +	config = vb2_plane_vaddr(vb, 0);
> +	memcpy(buf->config, config, v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> +
> +	return v4l2_params_blocks_validate(mali_c55->dev, buf->config,
> +					   mali_c55_block_handlers,
> +					   ARRAY_SIZE(mali_c55_block_handlers),
> +					   NULL);
> +}
> +
> +static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> +
> +	spin_lock(&params->buffers.lock);
> +	list_add_tail(&buf->queue, &params->buffers.queue);
> +	spin_unlock(&params->buffers.lock);
> +}
> +
> +static void mali_c55_params_return_buffers(struct mali_c55_params *params,
> +					   enum vb2_buffer_state state)
> +{
> +	struct mali_c55_params_buf *buf, *tmp;
> +
> +	guard(spinlock)(&params->buffers.lock);
> +
> +	list_for_each_entry_safe(buf, tmp, &params->buffers.queue, queue) {
> +		list_del(&buf->queue);
> +		vb2_buffer_done(&buf->vb.vb2_buf, state);
> +	}
> +}
> +
> +static int mali_c55_params_start_streaming(struct vb2_queue *q,
> +					   unsigned int count)
> +{
> +	struct mali_c55_params *params = vb2_get_drv_priv(q);
> +	struct mali_c55 *mali_c55 = params->mali_c55;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(mali_c55->dev);
> +	if (ret)
> +		goto err_return_buffers;
> +
> +	ret = video_device_pipeline_alloc_start(&params->vdev);
> +	if (ret)
> +		goto err_pm_put;
> +
> +	ret = video_device_pipeline_started(&params->vdev);
> +	if (ret < 0)
> +		goto err_stop_pipeline;
> +
> +	return 0;
> +
> +err_stop_pipeline:
> +	video_device_pipeline_stop(&params->vdev);
> +err_pm_put:
> +	pm_runtime_put(mali_c55->dev);
> +err_return_buffers:
> +	mali_c55_params_return_buffers(params, VB2_BUF_STATE_QUEUED);
> +
> +	return ret;
> +}
> +
> +static void mali_c55_params_stop_streaming(struct vb2_queue *q)
> +{
> +	struct mali_c55_params *params = vb2_get_drv_priv(q);
> +	struct media_pipeline *pipe;
> +
> +	pipe = video_device_pipeline(&params->vdev);
> +	if (mali_c55_pipeline_ready(pipe))
> +		media_pipeline_stopped(pipe);
> +
> +	video_device_pipeline_stop(&params->vdev);
> +	mali_c55_params_return_buffers(params, VB2_BUF_STATE_ERROR);
> +}
> +
> +static const struct vb2_ops mali_c55_params_vb2_ops = {
> +	.queue_setup = mali_c55_params_queue_setup,
> +	.buf_init = mali_c55_params_buf_init,
> +	.buf_cleanup = mali_c55_params_buf_cleanup,
> +	.buf_queue = mali_c55_params_buf_queue,
> +	.buf_prepare = mali_c55_params_buf_prepare,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.start_streaming = mali_c55_params_start_streaming,
> +	.stop_streaming = mali_c55_params_stop_streaming,
> +};
> +
> +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
> +{
> +	struct mali_c55_params *params = &mali_c55->params;
> +	struct v4l2_params_buffer *config;
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
> +
> +	if (!buf)
> +		return;
> +
> +	buf->vb.sequence = mali_c55->isp.frame_sequence;
> +	config = buf->config;
> +
> +	max_offset = config->data_size - sizeof(struct v4l2_params_block_header);
> +
> +	/*
> +	 * Walk the list of parameter blocks and process them. No validation is
> +	 * done here, as the contents of the config buffer are already checked
> +	 * when the buffer is queued.
> +	 */
> +	while (block_offset < max_offset) {
> +		const struct v4l2_params_handler *block_handler;
> +		union mali_c55_params_block block;
> +
> +		block.data = &config->data[block_offset];
> +
> +		/* We checked the array index already in .buf_queue() */

Not a lot seems to be done there in terms of validation.

Even if that had been done, you can't trust the buffer contents as it
remains mapped to the userspace.

> +		block_handler = &mali_c55_block_handlers[block.header->type];
> +		block_handler->handler(mali_c55, block.header);
> +
> +		block_offset += block.header->size;
> +	}
> +
> +	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +}

-- 
Kind regards,

Sakari Ailus

