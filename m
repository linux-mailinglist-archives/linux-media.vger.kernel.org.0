Return-Path: <linux-media+bounces-14584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C0926101
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 14:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B40CB21EBE
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 12:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BC2178CEA;
	Wed,  3 Jul 2024 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X3d5LlR+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863EB16DEAC
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 12:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720011583; cv=none; b=SLtN/5M9D7FmPY7FzhV5qveGxn66E9/wxaMv1gU0ayMjKcxbrU8X1HOrzRztUkZz0rbErxUsLBV9d6hsn8pQmVS204t14yg+u8UlnpV9BpdXsWuULfQbdfe+X16hL8JKcmap5Ng1v3mNVY2oJ+hrul3/31YoydA/9x4N5RxWuKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720011583; c=relaxed/simple;
	bh=MTzwLBHQc5Qhtp+FLWhTt7pyrtOh1kVXlkRGhMergFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o30FGzjXSrA4OjyQqhZvZyLI1Ke+C6TfzLYdTP0KMy63xx2m/CtQUddMIZQNXpgwu1+vhVpveAJxWnPxwrw4Pr0yZkQronR2/vv3gVnxn4YqgawYpCyZUjCSai4Ynl7J+IavkPYWrzjGUniWSsqtjjnadOrDBZB82sSxby7fr7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X3d5LlR+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16DA54CA;
	Wed,  3 Jul 2024 14:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720011550;
	bh=MTzwLBHQc5Qhtp+FLWhTt7pyrtOh1kVXlkRGhMergFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3d5LlR+8mm/OE8C0w9lJpMLtB5R2l0kmi4Fw7tJDmuljCF3DrZCyakIxF6415omJ
	 qQx30L49RvgqigDW99LClBUsPgKhydzwoScTMRUR7JY9gPDy74IfQ+CC2qqk+g9vLM
	 pi31+Mo+VKQAq/Hx3NeVjP2msl690AS31L0eTlRE=
Date: Wed, 3 Jul 2024 15:59:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 4/7] media: rkisp1: Copy the parameters buffer
Message-ID: <20240703125916.GI8704@pendragon.ideasonboard.com>
References: <20240621145406.119088-1-jacopo.mondi@ideasonboard.com>
 <20240621145406.119088-5-jacopo.mondi@ideasonboard.com>
 <20240629133149.GE30900@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240629133149.GE30900@pendragon.ideasonboard.com>

On Sat, Jun 29, 2024 at 04:31:49PM +0300, Laurent Pinchart wrote:
> On Fri, Jun 21, 2024 at 04:54:02PM +0200, Jacopo Mondi wrote:
> > The ISP parameters buffers are queued by userspace to the params video
> > device and appended by the driver to the list of available ones for
> 
> s/ones/buffers/
> 
> > later consumption.
> > 
> > As the parameters buffer is mapped in the userspace process memory,
> > applications have access to the buffer content after the buffer has
> 
> s/content/contents/
> 
> > been queued.
> > 
> > To prevent userspace from modifying the content of the parameters buffer
> 
> s/content/contents/
> 
> > after it has been queued to the video device, add to 'struct
> > rkisp1_params_buffer' a scratch buffer where to copy the parameters.
> > 
> > Allocate the scratch buffer in the vb2 buf_init() operation and copy the
> > buffer content in the buf_prepare() operation. Release the scratch
> 
> s/Release/Free/
> 
> > buffer in the newly introduced buf_cleanup() operation handler.
> > 
> > Modify the ISP configuration function to access the ISP configuration
> > from the cached copy of the parameters buffer instead of using the
> > userspace-mapped one.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +
> >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 76 ++++++++++++++-----
> >  2 files changed, 57 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index a615bbb0255e..cdc7cc64ebd5 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -250,10 +250,12 @@ struct rkisp1_buffer {
> >   *
> >   * @vb:		vb2 buffer
> >   * @queue:	entry of the buffer in the queue
> > + * @cfg:	scratch buffer used for caching the ISP configuration parameters
> >   */
> >  struct rkisp1_params_buffer {
> >  	struct vb2_v4l2_buffer vb;
> >  	struct list_head queue;
> > +	struct rkisp1_params_cfg *cfg;
> >  };
> 
> You can add
> 
> static inline struct rkisp1_params_buffer *
> to_rkisp1_params_buffer(struct vb2_v4l2_buffer *vbuf)
> {
> 	return container_of(vbuf, struct rkisp1_params_buffer, vb);
> }
> 
> and use it below.
> 
> >  
> >  /*
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 2844e55bc4f2..c081b41d6212 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -5,6 +5,8 @@
> >   * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
> >   */
> >  
> > +#include <linux/string.h>
> > +
> >  #include <media/v4l2-common.h>
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-ioctl.h>
> > @@ -1501,18 +1503,14 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
> >  	}
> >  }
> >  
> > -static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
> > -				     struct rkisp1_params_buffer **buf,
> > -				     struct rkisp1_params_cfg **cfg)
> > +static struct rkisp1_params_buffer *
> > +rkisp1_params_get_buffer(struct rkisp1_params *params)
> >  {
> >  	if (list_empty(&params->params))
> > -		return false;
> > +		return NULL;
> >  
> > -	*buf = list_first_entry(&params->params, struct rkisp1_params_buffer,
> > +	return list_first_entry(&params->params, struct rkisp1_params_buffer,
> >  				queue);
> > -	*cfg = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
> > -
> > -	return true;
> 
> There's a nice helper you can use:
> 
> 	return list_first_entry_or_null(&params->params,
> 					struct rkisp1_params_buffer, queue);
> 
> You could possibly even use that directly below and drop this function.
> Up to you.
> 
> >  }
> >  
> >  static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
> > @@ -1528,17 +1526,17 @@ static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
> >  void rkisp1_params_isr(struct rkisp1_device *rkisp1)
> >  {
> >  	struct rkisp1_params *params = &rkisp1->params;
> > -	struct rkisp1_params_cfg *new_params;
> >  	struct rkisp1_params_buffer *cur_buf;
> >  
> >  	spin_lock(&params->config_lock);
> >  
> > -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> > +	cur_buf = rkisp1_params_get_buffer(params);
> > +	if (!cur_buf)
> >  		goto unlock;
> >  
> > -	rkisp1_isp_isr_other_config(params, new_params);
> > -	rkisp1_isp_isr_lsc_config(params, new_params);
> > -	rkisp1_isp_isr_meas_config(params, new_params);
> > +	rkisp1_isp_isr_other_config(params, cur_buf->cfg);
> > +	rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
> > +	rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
> >  
> >  	/* update shadow register immediately */
> >  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > @@ -1604,7 +1602,6 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
> >  				 enum v4l2_ycbcr_encoding ycbcr_encoding)
> >  {
> >  	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
> > -	struct rkisp1_params_cfg *new_params;
> >  	struct rkisp1_params_buffer *cur_buf;
> >  
> >  	params->quantization = quantization;
> > @@ -1634,11 +1631,12 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
> >  
> >  	/* apply the first buffer if there is one already */
> >  
> > -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> > +	cur_buf = rkisp1_params_get_buffer(params);
> > +	if (!cur_buf)
> >  		goto unlock;
> >  
> > -	rkisp1_isp_isr_other_config(params, new_params);
> > -	rkisp1_isp_isr_meas_config(params, new_params);
> > +	rkisp1_isp_isr_other_config(params, cur_buf->cfg);
> > +	rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
> >  
> >  	/* update shadow register immediately */
> >  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > @@ -1650,7 +1648,6 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
> >  
> >  void rkisp1_params_post_configure(struct rkisp1_params *params)
> >  {
> > -	struct rkisp1_params_cfg *new_params;
> >  	struct rkisp1_params_buffer *cur_buf;
> >  
> >  	spin_lock_irq(&params->config_lock);
> > @@ -1663,11 +1660,11 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
> >  	 * ordering doesn't affect other ISP versions negatively, do so
> >  	 * unconditionally.
> >  	 */
> > -
> > -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> > +	cur_buf = rkisp1_params_get_buffer(params);
> > +	if (!cur_buf)
> >  		goto unlock;
> >  
> > -	rkisp1_isp_isr_lsc_config(params, new_params);
> > +	rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
> >  
> >  	/* update shadow register immediately */
> >  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> > @@ -1819,6 +1816,29 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
> >  	return 0;
> >  }
> >  
> > +static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +	struct rkisp1_params_buffer *params_buf =
> > +		container_of(vbuf, struct rkisp1_params_buffer, vb);
> > +
> > +	params_buf->cfg = kvmalloc(sizeof(*params_buf->cfg), GFP_KERNEL);
> > +	if (!params_buf->cfg)
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
> > +	params_buf->cfg = NULL;
> > +}
> > +
> >  static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
> >  {
> >  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > @@ -1834,11 +1854,23 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
> >  
> >  static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
> >  {
> > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +	struct rkisp1_params_buffer *params_buf =
> > +		container_of(vbuf, struct rkisp1_params_buffer, vb);
> > +	struct rkisp1_params_cfg *cfg =
> > +		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
> > +
> >  	if (vb2_plane_size(vb, 0) < sizeof(struct rkisp1_params_cfg))
> >  		return -EINVAL;
> >  
> >  	vb2_set_plane_payload(vb, 0, sizeof(struct rkisp1_params_cfg));
> >  
> > +	/*
> > +	 * Copy the parameters buffer to the internal scratch buffer to avoid
> > +	 * userspace modifying the buffer content while the driver processes it.
> > +	 */
> > +	memcpy(params_buf->cfg, cfg, sizeof(*cfg));
> 
> You need a copy_from_user() (and include uaccess.h).

If anyone read this thread in the future: I was wrong here, cfg is a
kernel-mapped address, so a plain memcpy() is all that is required.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1863,6 +1895,8 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
> >  
> >  static const struct vb2_ops rkisp1_params_vb2_ops = {
> >  	.queue_setup = rkisp1_params_vb2_queue_setup,
> > +	.buf_init = rkisp1_params_vb2_buf_init,
> > +	.buf_cleanup = rkisp1_params_vb2_buf_cleanup,
> >  	.wait_prepare = vb2_ops_wait_prepare,
> >  	.wait_finish = vb2_ops_wait_finish,
> >  	.buf_queue = rkisp1_params_vb2_buf_queue,

-- 
Regards,

Laurent Pinchart

