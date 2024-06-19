Return-Path: <linux-media+bounces-13746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E983390F3C0
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 18:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 671AF1F22E54
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 16:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF47914EC4D;
	Wed, 19 Jun 2024 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OT2fxP5t"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372C5612EB
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718813486; cv=none; b=ZnlH5aNRyQEobp4SlrmuWE4abCJx8xDdbhDkvZHtuEg3a13PWIyF9EdiOkDeQTqUO1N01ODSEpk5SLpXGdx7EP6vFtCJina7XYxkkqmcwlBUncU6VmMO6kr0JoPXaSekMdMhNxcGvdnD73zeTxGpsiVKIVJRi7A8dMYa4MgnD38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718813486; c=relaxed/simple;
	bh=gHANLnODU1GXzNAHFJ9zt54h4ZxttG8GCrpDTcX8QhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syyQUKdj1d/wSNUSHLFdnWT/8As3F+MDxW6e+Me5IIWOLC8un1Xx/rQUtsp8aAlOONzPsiJMHYS0ZIDg87OvhaFcWWW6hcG8Dv/GBEwrM97cTIX7i4Y1LyA4lukIciNckDM4YZrACoN3mLAuObpUlAnmgpxC2QPioyYkY8OhyvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OT2fxP5t; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99748541;
	Wed, 19 Jun 2024 18:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718813464;
	bh=gHANLnODU1GXzNAHFJ9zt54h4ZxttG8GCrpDTcX8QhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OT2fxP5twVaqsZm5jbwcb2khQHDkg+XhR23s+ucl5TY4BZSC/1zaXhJoR5bpXmKQd
	 g0rwXDwxRIlLpiqgKPzoDjDJFv+QSf6g0gZXXZ4674bGPiPENd0HmSNb3vdVR6PfKA
	 xD3rGUXZhlTBbhMKqSaavuVs24CWDrTNNZRLliI8=
Date: Wed, 19 Jun 2024 19:11:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
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
Message-ID: <20240619161101.GD3125@pendragon.ideasonboard.com>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-9-jacopo.mondi@ideasonboard.com>
 <2c7e4fb9-a23c-41f3-a5d1-fa8699e313be@ideasonboard.com>
 <20240612162048.GF15991@pendragon.ideasonboard.com>
 <bwwipysiavy6cszkshx6gjistawbsktsrqszz2izhy62aywh4c@3tgl2vwbyxur>
 <20240619154420.GA16295@pendragon.ideasonboard.com>
 <i4gg7fcbdc7p5rw35vu4qdowyw4rhwlqdxmc7umnbwb6tsdo37@wq6so7nww7cm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <i4gg7fcbdc7p5rw35vu4qdowyw4rhwlqdxmc7umnbwb6tsdo37@wq6so7nww7cm>

On Wed, Jun 19, 2024 at 05:55:12PM +0200, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Wed, Jun 19, 2024 at 06:44:20PM GMT, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > On Wed, Jun 19, 2024 at 04:22:00PM +0200, Jacopo Mondi wrote:
> > > On Wed, Jun 12, 2024 at 07:20:48PM GMT, Laurent Pinchart wrote:
> > > > On Wed, Jun 12, 2024 at 03:28:05PM +0100, Daniel Scally wrote:
> > > > > Hi Jacopo. As mentioned in the last patch, I think that this could be
> > > > > squashed into 5/8, but a couple of comments below
> > > >
> > > > I think it should be moved earlier, yes, probably even before the
> > > > introduction of extended parameters.
> > >
> > > I'm not sure I agree here
> > >
> > > Squashing would create a patch that does too many things. Moving it
> > > before the introduction of the extensible format would not make much
> > > sense, as there would be nothing to validate/copy for the fixed
> > > format.
> >
> > I think the copy should be done for the fixed format too. See below.
> >
> > > I'll keep the ordering I have here if not a big deal.
> > >
> > > > > On 05/06/2024 17:54, Jacopo Mondi wrote:
> > > > > > With the introduction of the extensible parameters format support in the
> > > > > > rkisp1-param.c module, the RkISP1 driver now configures the ISP blocks
> > > > > > by parsing the content of a data buffer of variable size provided by
> > > > > > userspace through the V4L2 meta-output interface using the MMAP memory
> > > > > > handling mode.
> > > > > >
> > > > > > As the parameters buffer is mapped in the userspace process memory,
> > > > > > applications have access to the buffer content while the driver
> > > > > > parses it.
> > > > > >
> > > > > > To prevent potential issues during the parameters buffer parsing and
> > > > > > processing in the driver, implement three vb2_ops to
> > > > > >
> > > > > > 1) allocate a scratch buffer in the driver private buffer structure
> > > > > > 2) validate the buffer content at VIDIOC_QBUF time
> > > > > > 3) copy the content of the user provided configuration parameters
> > > > > >     in the driver-private scratch buffer
> > > > > >
> > > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > > ---
> > > > > >   .../platform/rockchip/rkisp1/rkisp1-params.c  | 154 ++++++++++++++----
> > > > > >   1 file changed, 124 insertions(+), 30 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > > > index 4adaf084ce6e..003239e14511 100644
> > > > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > > > @@ -5,6 +5,8 @@
> > > > > >    * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
> > > > > >    */
> > > > > >
> > > > > > +#include <linux/string.h>
> > > > > > +
> > > > > >   #include <media/v4l2-common.h>
> > > > > >   #include <media/v4l2-event.h>
> > > > > >   #include <media/v4l2-ioctl.h>
> > > > > > @@ -1943,17 +1945,14 @@ static const struct rkisp1_ext_params_handler {
> > > > > >   };
> > > > > >
> > > > > >   static int __rkisp1_ext_params_config(struct rkisp1_params *params,
> > > > > > -				      struct rkisp1_ext_params_cfg *cfg,
> > > > > > +				      struct rkisp1_params_buffer *buffer,
> > > > > >   				      u32 block_group_mask)
> > > > > >   {
> > > > > > +	struct rkisp1_ext_params_cfg *cfg = buffer->cfg;
> > > >
> > > > Maybe do this in the callers to avoid changing the prototype of this
> > > > function and the other functions below.
> > > >
> > > > > >   	size_t block_offset = 0;
> > > > > >
> > > > > > -	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
> > > > > > -		dev_dbg(params->rkisp1->dev,
> > > > > > -			"Invalid parameters buffer size %llu\n",
> > > > > > -			cfg->total_size);
> > > > > > -		return -EINVAL;
> > > > > > -	}
> > > > > > +	if (WARN_ON(!cfg))
> > > > > > +		return -ENOMEM;
> > > > > >
> > > > > >   	/* Walk the list of parameter blocks and process them. */
> > > > > >   	while (block_offset < cfg->total_size) {
> > > > > > @@ -1965,25 +1964,13 @@ static int __rkisp1_ext_params_config(struct rkisp1_params *params,
> > > > > >   		block_offset += block->size;
> > > > > >
> > > > > >   		/*
> > > > > > -		 * Validate the block id and make sure the block group is in
> > > > > > -		 * the list of groups to configure.
> > > > > > +		 * Make sure the block group is in  the list of groups to
> > > > > > +		 * configure.
> > > > > >   		 */
> > > > > > -		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
> > > > > > -			dev_dbg(params->rkisp1->dev,
> > > > > > -				"Invalid parameters block type\n");
> > > > > > -			return -EINVAL;
> > > > > > -		}
> > > > > > -
> > > > > >   		block_handler = &rkisp1_ext_params_handlers[block->type];
> > > > > >   		if (!(block_handler->group & block_group_mask))
> > > > > >   			continue;
> > > > > >
> > > > > > -		if (block->size != block_handler->size) {
> > > > > > -			dev_dbg(params->rkisp1->dev,
> > > > > > -				"Invalid parameters block size\n");
> > > > > > -			return -EINVAL;
> > > > > > -		}
> > > > > > -
> > > > > >   		block_handler->handler(params, block);
> > > > > >   	}
> > > > > >
> > > > > > @@ -1991,9 +1978,9 @@ static int __rkisp1_ext_params_config(struct rkisp1_params *params,
> > > > > >   }
> > > > > >
> > > > > >   static int rkisp1_ext_params_config(struct rkisp1_params *params,
> > > > > > -				    struct rkisp1_ext_params_cfg *cfg)
> > > > > > +				    struct rkisp1_params_buffer *buffer)
> > > > > >   {
> > > > > > -	return __rkisp1_ext_params_config(params, cfg,
> > > > > > +	return __rkisp1_ext_params_config(params, buffer,
> > > > > >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
> > > > > >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC |
> > > > > >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
> > > > > > @@ -2001,17 +1988,17 @@ static int rkisp1_ext_params_config(struct rkisp1_params *params,
> > > > > >
> > > > > >   static int
> > > > > >   rkisp1_ext_params_other_meas_config(struct rkisp1_params *params,
> > > > > > -				    struct rkisp1_ext_params_cfg *cfg)
> > > > > > +				    struct rkisp1_params_buffer *buffer)
> > > > > >   {
> > > > > > -	return __rkisp1_ext_params_config(params, cfg,
> > > > > > +	return __rkisp1_ext_params_config(params, buffer,
> > > > > >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
> > > > > >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
> > > > > >   }
> > > > > >
> > > > > >   static int rkisp1_ext_params_lsc_config(struct rkisp1_params *params,
> > > > > > -					struct rkisp1_ext_params_cfg *cfg)
> > > > > > +					struct rkisp1_params_buffer *buffer)
> > > > > >   {
> > > > > > -	return __rkisp1_ext_params_config(params, cfg,
> > > > > > +	return __rkisp1_ext_params_config(params, buffer,
> > > > > >   					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
> > > > > >   }
> > > > > >
> > > > > > @@ -2057,7 +2044,7 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
> > > > > >   		rkisp1_isp_isr_lsc_config(params, cfg);
> > > > > >   		rkisp1_isp_isr_meas_config(params, cfg);
> > > > > >   	} else {
> > > > > > -		ret = rkisp1_ext_params_config(params, cfg);
> > > > > > +		ret = rkisp1_ext_params_config(params, buf);
> > > > > >   	}
> > > > > >
> > > > > >   	if (ret)
> > > > > > @@ -2168,7 +2155,7 @@ int rkisp1_params_pre_configure(struct rkisp1_params *params,
> > > > > >   		rkisp1_isp_isr_other_config(params, cfg);
> > > > > >   		rkisp1_isp_isr_meas_config(params, cfg);
> > > > > >   	} else {
> > > > > > -		ret = rkisp1_ext_params_other_meas_config(params, cfg);
> > > > > > +		ret = rkisp1_ext_params_other_meas_config(params, buf);
> > > > > >   	}
> > > > > >
> > > > > >   	if (ret) {
> > > > > > @@ -2215,7 +2202,7 @@ int rkisp1_params_post_configure(struct rkisp1_params *params)
> > > > > >   	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
> > > > > >   		rkisp1_isp_isr_lsc_config(params, cfg);
> > > > > >   	else
> > > > > > -		ret = rkisp1_ext_params_lsc_config(params, cfg);
> > > > > > +		ret = rkisp1_ext_params_lsc_config(params, buf);
> > > > > >
> > > > > >   	if (ret)
> > > > > >   		goto complete_and_unlock;
> > > > > > @@ -2407,6 +2394,110 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
> > > > > >   	return 0;
> > > > > >   }
> > > > > >
> > > > > > +static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
> > > > > > +{
> > > > > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > > > > +	struct rkisp1_params_buffer *params_buf =
> > > > > > +		container_of(vbuf, struct rkisp1_params_buffer, vb);
> > > >
> > > > A to_rkisp1_params_buffer() inline function in the previous patch would
> > > > be nice.
> > > >
> > > > > > +	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
> > > > > > +	size_t buf_size = params->metafmt.buffersize;
> > > > > > +
> > > > > > +	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
> > > > > > +		params_buf->cfg = NULL;
> > > > > > +		return 0;
> > > > > > +	}
> > > >
> > > > The problem is not restricted to the extensible format, how about doing
> > > > the same for the legacy format ?
> > >
> > > Copying the buffer in ? Not sure I agree. The extensible format allows
> > > userspace to change the memory layout of the buffer, if this happens
> > > while the driver parses it, we'll ooops. With the fixed format the
> > > memory layout is fixed, if userspace changes the content of the buffer
> > > (ie the configuration parameters) after qbuf, well, it's their
> > > problem.
> >
> > Can you guarantee that the driver will never ever crash or corrupt
> > memory if that happens ? Especially if you take into account the fact
> 
> All of the mainline driver work in this way today. But ok if most
> people think it's worth it, I'll do so and re-order the patches.

Unless the memcpy really hinders performances, I think we should ensure
safety first and foremest.

> > that the compiler and CPU can reorder accesses, as well as split and
> > merge accesses (i.e. reading the same memory location multiple times
> > when it's accessed once only in the code), that seems hard to do.
> >
> > > Copying (and validation) is costly and if it serves to avoid
> > > an ooops it's more than justified. In the other case I'm not sure.
> >
> > How expensive is the copy ?
> 
> For sure it doubles the allocated memory as we've one backing memory
> buffer for each buffer requested by userspace.

True, but parameter buffers are quite small. I haven't checked but I
would expect everything to hold in one page.

-- 
Regards,

Laurent Pinchart

