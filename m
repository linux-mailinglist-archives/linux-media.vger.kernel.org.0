Return-Path: <linux-media+bounces-13066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 443649058A2
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 18:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7B7F1F228B5
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 16:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB4A181BAD;
	Wed, 12 Jun 2024 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KjjxG+Fb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73617181BA8
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718209273; cv=none; b=HfNZjh4VhBfpC7MSitEoUusKaFXFqnJl+l0Hjv+aPni+Y3xTYb2jjEtjtweZoe80TZ2Uen8Tlx4Ic7XLOVyEHPuCtlSKvOIu2eYeQe2vWLEkTe660SaAkHdz/g+imj+0GSdqbf5od+Bh97EDUkK31rhU8L7l/8E8js4myLqOB0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718209273; c=relaxed/simple;
	bh=E++Ttm7rP8MAvlF3eG6XLQak9eELE+RMeD4FClePYVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYJP9VK9Zzx7+xwINBn7pMbpf0+WG8/cB+sly/vexWOm5KP4cA4gyhHwxcD9d2DBqJ4UU8ORNhrIDWctiTbTJTi6fQyFvqEN+FWt8rF9vWThVSdRLv0G1DUxUDla3niJREireIWuX0DIYieOPqKlqLLGPfUKkbQhGRKdf6HzIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KjjxG+Fb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DF7F4AB;
	Wed, 12 Jun 2024 18:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718209255;
	bh=E++Ttm7rP8MAvlF3eG6XLQak9eELE+RMeD4FClePYVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjjxG+FbzxCUrnrrI8RSSRLXWccl5DuFEjblH9Ad8y/1whoesFaW9TQAejoBVvFJM
	 JSu+78TTUe6nVyvCYC8AGWzLKAT4uhF3kUAAMq2lu9JtTqgcjFbo4TMv0IwZhFYKaV
	 SAH07v52+30vOhenfLVpptXcq6f7nW+k678mi5o4=
Date: Wed, 12 Jun 2024 19:20:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 8/8] media: rkisp1: Copy and validate parameters buffer
Message-ID: <20240612162048.GF15991@pendragon.ideasonboard.com>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-9-jacopo.mondi@ideasonboard.com>
 <2c7e4fb9-a23c-41f3-a5d1-fa8699e313be@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c7e4fb9-a23c-41f3-a5d1-fa8699e313be@ideasonboard.com>

On Wed, Jun 12, 2024 at 03:28:05PM +0100, Daniel Scally wrote:
> Hi Jacopo. As mentioned in the last patch, I think that this could be
> squashed into 5/8, but a couple of comments below

I think it should be moved earlier, yes, probably even before the
introduction of extended parameters.

> On 05/06/2024 17:54, Jacopo Mondi wrote:
> > With the introduction of the extensible parameters format support in the
> > rkisp1-param.c module, the RkISP1 driver now configures the ISP blocks
> > by parsing the content of a data buffer of variable size provided by
> > userspace through the V4L2 meta-output interface using the MMAP memory
> > handling mode.
> >
> > As the parameters buffer is mapped in the userspace process memory,
> > applications have access to the buffer content while the driver
> > parses it.
> >
> > To prevent potential issues during the parameters buffer parsing and
> > processing in the driver, implement three vb2_ops to
> >
> > 1) allocate a scratch buffer in the driver private buffer structure
> > 2) validate the buffer content at VIDIOC_QBUF time
> > 3) copy the content of the user provided configuration parameters
> >     in the driver-private scratch buffer
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >   .../platform/rockchip/rkisp1/rkisp1-params.c  | 154 ++++++++++++++----
> >   1 file changed, 124 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 4adaf084ce6e..003239e14511 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -5,6 +5,8 @@
> >    * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
> >    */
> >   
> > +#include <linux/string.h>
> > +
> >   #include <media/v4l2-common.h>
> >   #include <media/v4l2-event.h>
> >   #include <media/v4l2-ioctl.h>
> > @@ -1943,17 +1945,14 @@ static const struct rkisp1_ext_params_handler {
> >   };
> >   
> >   static int __rkisp1_ext_params_config(struct rkisp1_params *params,
> > -				      struct rkisp1_ext_params_cfg *cfg,
> > +				      struct rkisp1_params_buffer *buffer,
> >   				      u32 block_group_mask)
> >   {
> > +	struct rkisp1_ext_params_cfg *cfg = buffer->cfg;

Maybe do this in the callers to avoid changing the prototype of this
function and the other functions below.

> >   	size_t block_offset = 0;
> >   
> > -	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
> > -		dev_dbg(params->rkisp1->dev,
> > -			"Invalid parameters buffer size %llu\n",
> > -			cfg->total_size);
> > -		return -EINVAL;
> > -	}
> > +	if (WARN_ON(!cfg))
> > +		return -ENOMEM;
> >   
> >   	/* Walk the list of parameter blocks and process them. */
> >   	while (block_offset < cfg->total_size) {
> > @@ -1965,25 +1964,13 @@ static int __rkisp1_ext_params_config(struct rkisp1_params *params,
> >   		block_offset += block->size;
> >   
> >   		/*
> > -		 * Validate the block id and make sure the block group is in
> > -		 * the list of groups to configure.
> > +		 * Make sure the block group is in  the list of groups to
> > +		 * configure.
> >   		 */
> > -		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
> > -			dev_dbg(params->rkisp1->dev,
> > -				"Invalid parameters block type\n");
> > -			return -EINVAL;
> > -		}
> > -
> >   		block_handler = &rkisp1_ext_params_handlers[block->type];
> >   		if (!(block_handler->group & block_group_mask))
> >   			continue;
> >   
> > -		if (block->size != block_handler->size) {
> > -			dev_dbg(params->rkisp1->dev,
> > -				"Invalid parameters block size\n");
> > -			return -EINVAL;
> > -		}
> > -
> >   		block_handler->handler(params, block);
> >   	}
> >   
> > @@ -1991,9 +1978,9 @@ static int __rkisp1_ext_params_config(struct rkisp1_params *params,
> >   }
> >   
> >   static int rkisp1_ext_params_config(struct rkisp1_params *params,
> > -				    struct rkisp1_ext_params_cfg *cfg)
> > +				    struct rkisp1_params_buffer *buffer)
> >   {
> > -	return __rkisp1_ext_params_config(params, cfg,
> > +	return __rkisp1_ext_params_config(params, buffer,
> >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
> >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC |
> >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
> > @@ -2001,17 +1988,17 @@ static int rkisp1_ext_params_config(struct rkisp1_params *params,
> >   
> >   static int
> >   rkisp1_ext_params_other_meas_config(struct rkisp1_params *params,
> > -				    struct rkisp1_ext_params_cfg *cfg)
> > +				    struct rkisp1_params_buffer *buffer)
> >   {
> > -	return __rkisp1_ext_params_config(params, cfg,
> > +	return __rkisp1_ext_params_config(params, buffer,
> >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
> >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
> >   }
> >   
> >   static int rkisp1_ext_params_lsc_config(struct rkisp1_params *params,
> > -					struct rkisp1_ext_params_cfg *cfg)
> > +					struct rkisp1_params_buffer *buffer)
> >   {
> > -	return __rkisp1_ext_params_config(params, cfg,
> > +	return __rkisp1_ext_params_config(params, buffer,
> >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
> >   }
> >   
> > @@ -2057,7 +2044,7 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
> >   		rkisp1_isp_isr_lsc_config(params, cfg);
> >   		rkisp1_isp_isr_meas_config(params, cfg);
> >   	} else {
> > -		ret = rkisp1_ext_params_config(params, cfg);
> > +		ret = rkisp1_ext_params_config(params, buf);
> >   	}
> >   
> >   	if (ret)
> > @@ -2168,7 +2155,7 @@ int rkisp1_params_pre_configure(struct rkisp1_params *params,
> >   		rkisp1_isp_isr_other_config(params, cfg);
> >   		rkisp1_isp_isr_meas_config(params, cfg);
> >   	} else {
> > -		ret = rkisp1_ext_params_other_meas_config(params, cfg);
> > +		ret = rkisp1_ext_params_other_meas_config(params, buf);
> >   	}
> >   
> >   	if (ret) {
> > @@ -2215,7 +2202,7 @@ int rkisp1_params_post_configure(struct rkisp1_params *params)
> >   	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
> >   		rkisp1_isp_isr_lsc_config(params, cfg);
> >   	else
> > -		ret = rkisp1_ext_params_lsc_config(params, cfg);
> > +		ret = rkisp1_ext_params_lsc_config(params, buf);
> >   
> >   	if (ret)
> >   		goto complete_and_unlock;
> > @@ -2407,6 +2394,110 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
> >   	return 0;
> >   }
> >   
> > +static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +	struct rkisp1_params_buffer *params_buf =
> > +		container_of(vbuf, struct rkisp1_params_buffer, vb);

A to_rkisp1_params_buffer() inline function in the previous patch would
be nice.

> > +	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
> > +	size_t buf_size = params->metafmt.buffersize;
> > +
> > +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
> > +		params_buf->cfg = NULL;
> > +		return 0;
> > +	}

The problem is not restricted to the extensible format, how about doing
the same for the legacy format ?

> > +
> > +	params_buf->cfg = kvmalloc(buf_size, GFP_KERNEL);
> > +	if (IS_ERR_OR_NULL(params_buf->cfg))

Can kvmalloc() return an error pointer ?

> > +		return -ENOMEM;
> > +
> > +	return 0;
> > +}
> > +
> > +static void rkisp1_params_vb2_buf_cleanup(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +	struct rkisp1_params_buffer *params_buf =
> > +		container_of(vbuf, struct rkisp1_params_buffer, vb);
> > +
> > +	kvfree(params_buf->cfg);

	params_buf->cfg = NULL;

to be safe.

> > +}
> > +
> > +static int rkisp1_params_validate_ext_params(struct rkisp1_params *params,
> > +					     struct rkisp1_ext_params_cfg *cfg)
> > +{
> > +	size_t block_offset = 0;
> > +
> > +	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
> > +		dev_dbg(params->rkisp1->dev,
> > +			"Invalid parameters buffer size %llu\n",
> > +			cfg->total_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Walk the list of parameter blocks and validate them. */
> > +	while (block_offset < cfg->total_size) {
> > +		const struct rkisp1_ext_params_handler *hdlr;
> > +		struct rkisp1_ext_params_block_header *block;
> > +
> > +		block = (struct rkisp1_ext_params_block_header *)
> > +			&cfg->data[block_offset];
> > +		block_offset += block->size;

Move this line to the end of the loop to avoid block_offset ever
pointing beyond the end of the buffer.

> > +
> > +		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
> > +			dev_dbg(params->rkisp1->dev,
> > +				"Invalid parameters block type\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		hdlr = &rkisp1_ext_params_handlers[block->type];
> > +		if (hdlr->group != RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS &&
> > +		    hdlr->group != RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC &&
> > +		    hdlr->group != RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS) {
> > +			dev_dbg(params->rkisp1->dev,
> > +				"Invalid parameters block group\n");
> > +			return -EINVAL;
> > +		}
>
> I think this check can probably be dropped; those values are from the
> kernel driver rather than userspace inputs.
>
> > +
> > +		if (block->size != hdlr->size) {
> > +			dev_dbg(params->rkisp1->dev,
> > +				"Invalid parameters block size\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkisp1_params_vb2_buf_out_validate(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +	struct rkisp1_params_buffer *params_buf =
> > +		container_of(vbuf, struct rkisp1_params_buffer, vb);
> > +	struct vb2_queue *vq = vb->vb2_queue;
> > +	struct rkisp1_params *params = vq->drv_priv;
> > +	struct rkisp1_ext_params_cfg *cfg =
> > +		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
> > +	int ret;
> > +
> > +	/* Fixed parameters format doesn't require validation. */
> > +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
> > +		return 0;

You need to add a check to rkisp1_params_s_fmt_meta_out() to reject
format changes once the queue is busy, or you'll have bad surprises.

> > +
> > +	ret = rkisp1_params_validate_ext_params(params, cfg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * If the parameters buffer is valid, copy it to the internal scratch
> > +	 * buffer to avoid userspace modifying the buffer content while
> > +	 * the driver processes it.
> > +	 */

You need to swap the validation and memcpy(), otherwise userspace could
modify it after you have validated the contents and before the copy.

> > +	memcpy(params_buf->cfg, cfg, sizeof(*cfg));
>
> I think that this part is something that we probably ought to handle
> in vb2 core if we can, since the problem it's fixing isn't specific to
> the extensible parameters format or even the rkisp1 itself (unless I'm
> missing something). That doesn't have to block this set though, we can
> change this over to a vb2-core implementation when that's done.

I like the idea. I think we can experiment with it in rkisp1, and then
move it to vb2 when adding a second implementation (likely C55 ?).

> > +
> > +	return 0;
> > +}
> > +
> >   static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
> >   {
> >   	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > @@ -2455,6 +2546,9 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
> >   
> >   static const struct vb2_ops rkisp1_params_vb2_ops = {
> >   	.queue_setup = rkisp1_params_vb2_queue_setup,
> > +	.buf_init = rkisp1_params_vb2_buf_init,
> > +	.buf_cleanup = rkisp1_params_vb2_buf_cleanup,
> > +	.buf_out_validate = rkisp1_params_vb2_buf_out_validate,
> >   	.wait_prepare = vb2_ops_wait_prepare,
> >   	.wait_finish = vb2_ops_wait_finish,
> >   	.buf_queue = rkisp1_params_vb2_buf_queue,

-- 
Regards,

Laurent Pinchart

