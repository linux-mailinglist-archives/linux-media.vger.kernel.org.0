Return-Path: <linux-media+bounces-38673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46788B16845
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 23:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F0403BFA30
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 21:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B16221546;
	Wed, 30 Jul 2025 21:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D++FgL/7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C4F21A433;
	Wed, 30 Jul 2025 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753910561; cv=none; b=j25t13OXedbrRlAiiogp0+EnMxOb+LbxGf49Bu56hdEQdB5ohgo/kMWwfMpM3P3cS46ubqfdy7pLwZmM08C4DlSIB3ftt9Jm2cqx9SR4SNhXKQzqMo7sm03xgPEBAnjJt0vCrqVtDc1htDj1qQOAdcwS2CwnvoJ6MemyuKf3zBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753910561; c=relaxed/simple;
	bh=5sMf4Lo8mFFoam81Ms38b19tARdJKE66DvP2/RGQEHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fq4PfztP4n8UfpkuxEFk5CN/BBf6vbNpk+DR7sxX9AxHl/XNmHWcm1X19LkWs4R+UMfOUup3EcBRKtLplgG6XhwumNZ6Mfl4Lhwj/21Ez2tXc1fqh9iTKKKvL6+yRcqNf0GhozT2pNWiPsVNRRHKv0Z8/o1BRNNY4+blBpZ/jps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D++FgL/7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753910559; x=1785446559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5sMf4Lo8mFFoam81Ms38b19tARdJKE66DvP2/RGQEHo=;
  b=D++FgL/7Miyo9nJQ0+IeKVOuihv8WT7/VQl4jGfGnjl1FG8fp8J6epVU
   H+QHIyIA0LcGhytUNF2lpEzfqbhRY8GUZClBqAKpWRd3PxE54sH9goxVO
   ojTs2wO6Jj4c7QDvSSb9lbbX8DN8IDXLusvwzrkplNPNGXqxaVU5u4xPo
   3GD4MCz8wM5TEh+FYRkAWIlkGdTJjeDfA0AvQkNu6kohqyQiSCz3caOJt
   Yp+Ul0qpgCMHDN6J4ARZQbTfM+lW70WKuBFqc4dn9/rXAkPepMImFA4X9
   gt8mHJ4g1Li2rQIRrHJdEC1Md33ZBCmlN1sG9DuWAY5Ctg+VMTnF+AXHx
   Q==;
X-CSE-ConnectionGUID: OiTRlXsSS6yRCwiZTCL9IA==
X-CSE-MsgGUID: MJ0JymafRbW9wgysl0s09g==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56156621"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56156621"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 14:22:39 -0700
X-CSE-ConnectionGUID: YcaH1nJ9QGWY2SSMHcC6EQ==
X-CSE-MsgGUID: eGvSTNbzQQqzHkTvZOEp0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="168377951"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 14:22:35 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EBD5611F97D;
	Thu, 31 Jul 2025 00:22:32 +0300 (EEST)
Date: Wed, 30 Jul 2025 21:22:32 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v11 18/19] media: platform: Add mali-c55 parameters video
 node
Message-ID: <aIqNGObJlU-YCgPC@kekkonen.localdomain>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-18-bc20e460e42a@ideasonboard.com>
 <aIot2pmuIIidZORo@kekkonen.localdomain>
 <7b6dbaab-ec40-4b84-8e8f-b53062568838@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b6dbaab-ec40-4b84-8e8f-b53062568838@ideasonboard.com>

Hi Dan,

On Wed, Jul 30, 2025 at 10:11:22PM +0100, Dan Scally wrote:
> Hi Sakari, thanks for the comments
> 
> On 30/07/2025 15:36, Sakari Ailus wrote:
> > Hi Daniel,
> > 
> > Thanks for the update.
> > 
> > On Mon, Jul 14, 2025 at 04:06:44PM +0100, Daniel Scally wrote:
> > > +static int
> > > +mali_c55_params_validate_buffer(struct device *dev,
> > > +				const struct v4l2_params_buffer *buffer)
> > > +{
> > > +	/* Only v1 is supported at the moment. */
> > > +	if (buffer->version != MALI_C55_PARAM_BUFFER_V1) {
> > > +		dev_dbg(dev, "Unsupported extensible format version: %u\n",
> > > +			buffer->version);
> > > +		return -EINVAL;
> > > +	}
> > Is there anything else to validate here?
> 
> 
> Not at this stage; the rest of the validation is done by Jacopo's new
> framework
> 
> > 
> > I guess nothing is done with the information other than the value is being
> > checked above, but if it had an effect on something, one would need to copy
> > the information to memory not accessible to the user.
> 
> 
> Thats done later in .buf_prepare()

Ah, thanks; I missed that earlier.

> 
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
> > > +{
> > > +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
> > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> > > +	struct mali_c55 *mali_c55 = params->mali_c55;
> > > +	struct v4l2_params_buffer *config;
> > > +	int ret;
> > > +
> > > +	ret = v4l2_params_buffer_validate(
> > > +		mali_c55->dev, vb,
> > > +		v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> > > +		mali_c55_params_validate_buffer);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Copy the parameters buffer provided by userspace to the internal
> > > +	 * scratch buffer. This protects against the chance of userspace making
> > > +	 * changed to the buffer content whilst the driver processes it.
> > > +	 */
> > > +	config = vb2_plane_vaddr(vb, 0);
> > > +	memcpy(buf->config, config, v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> > > +
> > > +	return v4l2_params_blocks_validate(mali_c55->dev, buf->config,
> > > +					   mali_c55_block_handlers,
> > > +					   ARRAY_SIZE(mali_c55_block_handlers),
> > > +					   NULL);
> > > +}
> > > +
> > > +static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
> > > +{
> > > +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
> > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> > > +
> > > +	spin_lock(&params->buffers.lock);
> > > +	list_add_tail(&buf->queue, &params->buffers.queue);
> > > +	spin_unlock(&params->buffers.lock);
> > > +}
> > > +
> > > +static void mali_c55_params_return_buffers(struct mali_c55_params *params,
> > > +					   enum vb2_buffer_state state)
> > > +{
> > > +	struct mali_c55_params_buf *buf, *tmp;
> > > +
> > > +	guard(spinlock)(&params->buffers.lock);
> > > +
> > > +	list_for_each_entry_safe(buf, tmp, &params->buffers.queue, queue) {
> > > +		list_del(&buf->queue);
> > > +		vb2_buffer_done(&buf->vb.vb2_buf, state);
> > > +	}
> > > +}
> > > +
> > > +static int mali_c55_params_start_streaming(struct vb2_queue *q,
> > > +					   unsigned int count)
> > > +{
> > > +	struct mali_c55_params *params = vb2_get_drv_priv(q);
> > > +	struct mali_c55 *mali_c55 = params->mali_c55;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(mali_c55->dev);
> > > +	if (ret)
> > > +		goto err_return_buffers;
> > > +
> > > +	ret = video_device_pipeline_alloc_start(&params->vdev);
> > > +	if (ret)
> > > +		goto err_pm_put;
> > > +
> > > +	ret = video_device_pipeline_started(&params->vdev);
> > > +	if (ret < 0)
> > > +		goto err_stop_pipeline;
> > > +
> > > +	return 0;
> > > +
> > > +err_stop_pipeline:
> > > +	video_device_pipeline_stop(&params->vdev);
> > > +err_pm_put:
> > > +	pm_runtime_put(mali_c55->dev);
> > > +err_return_buffers:
> > > +	mali_c55_params_return_buffers(params, VB2_BUF_STATE_QUEUED);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void mali_c55_params_stop_streaming(struct vb2_queue *q)
> > > +{
> > > +	struct mali_c55_params *params = vb2_get_drv_priv(q);
> > > +	struct media_pipeline *pipe;
> > > +
> > > +	pipe = video_device_pipeline(&params->vdev);
> > > +	if (mali_c55_pipeline_ready(pipe))
> > > +		media_pipeline_stopped(pipe);
> > > +
> > > +	video_device_pipeline_stop(&params->vdev);
> > > +	mali_c55_params_return_buffers(params, VB2_BUF_STATE_ERROR);
> > > +}
> > > +
> > > +static const struct vb2_ops mali_c55_params_vb2_ops = {
> > > +	.queue_setup = mali_c55_params_queue_setup,
> > > +	.buf_init = mali_c55_params_buf_init,
> > > +	.buf_cleanup = mali_c55_params_buf_cleanup,
> > > +	.buf_queue = mali_c55_params_buf_queue,
> > > +	.buf_prepare = mali_c55_params_buf_prepare,
> > > +	.wait_prepare = vb2_ops_wait_prepare,
> > > +	.wait_finish = vb2_ops_wait_finish,
> > > +	.start_streaming = mali_c55_params_start_streaming,
> > > +	.stop_streaming = mali_c55_params_stop_streaming,
> > > +};
> > > +
> > > +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
> > > +{
> > > +	struct mali_c55_params *params = &mali_c55->params;
> > > +	struct v4l2_params_buffer *config;
> > > +	struct mali_c55_params_buf *buf;
> > > +	size_t block_offset = 0;
> > > +	size_t max_offset;
> > > +
> > > +	spin_lock(&params->buffers.lock);
> > > +
> > > +	buf = list_first_entry_or_null(&params->buffers.queue,
> > > +				       struct mali_c55_params_buf, queue);
> > > +	if (buf)
> > > +		list_del(&buf->queue);
> > > +	spin_unlock(&params->buffers.lock);
> > > +
> > > +	if (!buf)
> > > +		return;
> > > +
> > > +	buf->vb.sequence = mali_c55->isp.frame_sequence;
> > > +	config = buf->config;
> > > +
> > > +	max_offset = config->data_size - sizeof(struct v4l2_params_block_header);
> > > +
> > > +	/*
> > > +	 * Walk the list of parameter blocks and process them. No validation is
> > > +	 * done here, as the contents of the config buffer are already checked
> > > +	 * when the buffer is queued.
> > > +	 */
> > > +	while (block_offset < max_offset) {
> > > +		const struct v4l2_params_handler *block_handler;
> > > +		union mali_c55_params_block block;
> > > +
> > > +		block.data = &config->data[block_offset];
> > > +
> > > +		/* We checked the array index already in .buf_queue() */
> > Not a lot seems to be done there in terms of validation.
> > 
> > Even if that had been done, you can't trust the buffer contents as it
> > remains mapped to the userspace.
> 
> Ah; a hangover of an earlier iteration before using the new v4l2-params
> helpers; the validation is done by those functions in .buf_prepare() now and
> the userspace buffer is memcopied to a scratch buffer.

Ack, I'll take a look at Jacopo's set and get back to this. It looks nice
overall.

-- 
Kind regards,

Sakari Ailus

