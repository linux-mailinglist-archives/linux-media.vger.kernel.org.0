Return-Path: <linux-media+bounces-14571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B66A9254F3
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 09:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A06A1B229FB
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 07:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1C01386D7;
	Wed,  3 Jul 2024 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G7bJ/utP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A8944E
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719993372; cv=none; b=uz5TLmni6hyEmoiLd3EdWygawJu+rcNDGJRyBsb07g9msgOO1WeM3ICRIP+T0P0bqu/Jza6ApmO8/WiO6edvBJbGaOPXetEZ9HoioE1/L5/+ycB15UDMVi4lM32LLtXpTXok8HFLJbUsqk2gUud0X2XG77QDp86fRsWXRKZbGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719993372; c=relaxed/simple;
	bh=n64T02p+iK1QyOOAkJYY6rKMlwkVVONCsCM0ysD5lvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYKFmarovsRiRnEznKMlIxjT56YiAVNKHMga+Vm2s0h2hmJWi/bmgOuDEe2KVMbXqcv3X5/RDeknRto4WozjAZROd31wk1w8nFP5w3nUspLC/g78vIFRwJwCiyKA0olHhjYslckkV/0EQGn9DR6B8K1VfDnBPVUUcgP9gM2vn2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G7bJ/utP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1629A3E6;
	Wed,  3 Jul 2024 09:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719993340;
	bh=n64T02p+iK1QyOOAkJYY6rKMlwkVVONCsCM0ysD5lvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7bJ/utPH0hhflfwzJkkTgrrs3FPbgPsyZ9rqeMIT516yAEjaQ1usE8HFul1GDvMr
	 wTuAq/EnuYTqvFV7x6Ix7EqHxfSpK0AIz8NTUlJsvJTvz8LOpLIP4RZTue88HK9pD0
	 8smc0rsUE24eSpkmYYlYf6GAGYr2Ggc/1W4schYk=
Date: Wed, 3 Jul 2024 16:56:00 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 3/7] media: rkisp1: Add struct rkisp1_params_buffer
Message-ID: <ZoUEEBfmNV_KXS_-@pyrite.rasen.tech>
References: <20240701165222.205510-1-jacopo.mondi@ideasonboard.com>
 <20240701165222.205510-4-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701165222.205510-4-jacopo.mondi@ideasonboard.com>

On Mon, Jul 01, 2024 at 06:52:17PM +0200, Jacopo Mondi wrote:
> Create the 'struct rkisp1_params_buffer' type that wraps a
> vb2_v4l2_buffer to prepare to hold a copy of the parameters buffer that
> will be used to cache the user-provided configuration buffer in the
> following patches.
> 
> Replace usage of 'struct rkisp1_buffer' with 'struct
> rkisp1_params_buffer' in rkisp1-params.c to prepare for that.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  | 14 ++++++++++++-
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 21 ++++++++++---------
>  2 files changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 26573f6ae575..a615bbb0255e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -232,7 +232,7 @@ struct rkisp1_vdev_node {
>  
>  /*
>   * struct rkisp1_buffer - A container for the vb2 buffers used by the video devices:
> - *			  params, stats, mainpath, selfpath
> + *			  stats, mainpath, selfpath
>   *
>   * @vb:		vb2 buffer
>   * @queue:	entry of the buffer in the queue
> @@ -244,6 +244,18 @@ struct rkisp1_buffer {
>  	dma_addr_t buff_addr[VIDEO_MAX_PLANES];
>  };
>  
> +/*
> + * struct rkisp1_params_buffer - A container for the vb2 buffers used by the
> + *				 params video device
> + *
> + * @vb:		vb2 buffer
> + * @queue:	entry of the buffer in the queue
> + */
> +struct rkisp1_params_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head queue;
> +};
> +
>  /*
>   * struct rkisp1_dummy_buffer - A buffer to write the next frame to in case
>   *				there are no vb2 buffers available.
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 173d1ea41874..2844e55bc4f2 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1502,20 +1502,21 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  }
>  
>  static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
> -				     struct rkisp1_buffer **buf,
> +				     struct rkisp1_params_buffer **buf,
>  				     struct rkisp1_params_cfg **cfg)
>  {
>  	if (list_empty(&params->params))
>  		return false;
>  
> -	*buf = list_first_entry(&params->params, struct rkisp1_buffer, queue);
> +	*buf = list_first_entry(&params->params, struct rkisp1_params_buffer,
> +				queue);
>  	*cfg = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
>  
>  	return true;
>  }
>  
>  static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
> -					  struct rkisp1_buffer *buf,
> +					  struct rkisp1_params_buffer *buf,
>  					  unsigned int frame_sequence)
>  {
>  	list_del(&buf->queue);
> @@ -1528,7 +1529,7 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  {
>  	struct rkisp1_params *params = &rkisp1->params;
>  	struct rkisp1_params_cfg *new_params;
> -	struct rkisp1_buffer *cur_buf;
> +	struct rkisp1_params_buffer *cur_buf;
>  
>  	spin_lock(&params->config_lock);
>  
> @@ -1604,7 +1605,7 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>  {
>  	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
>  	struct rkisp1_params_cfg *new_params;
> -	struct rkisp1_buffer *cur_buf;
> +	struct rkisp1_params_buffer *cur_buf;
>  
>  	params->quantization = quantization;
>  	params->ycbcr_encoding = ycbcr_encoding;
> @@ -1650,7 +1651,7 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>  void rkisp1_params_post_configure(struct rkisp1_params *params)
>  {
>  	struct rkisp1_params_cfg *new_params;
> -	struct rkisp1_buffer *cur_buf;
> +	struct rkisp1_params_buffer *cur_buf;
>  
>  	spin_lock_irq(&params->config_lock);
>  
> @@ -1821,8 +1822,8 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
>  static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
>  {
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> -	struct rkisp1_buffer *params_buf =
> -		container_of(vbuf, struct rkisp1_buffer, vb);
> +	struct rkisp1_params_buffer *params_buf =
> +		container_of(vbuf, struct rkisp1_params_buffer, vb);
>  	struct vb2_queue *vq = vb->vb2_queue;
>  	struct rkisp1_params *params = vq->drv_priv;
>  
> @@ -1844,7 +1845,7 @@ static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
>  static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>  {
>  	struct rkisp1_params *params = vq->drv_priv;
> -	struct rkisp1_buffer *buf;
> +	struct rkisp1_params_buffer *buf;
>  	LIST_HEAD(tmp_list);
>  
>  	/*
> @@ -1890,7 +1891,7 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
>  	q->drv_priv = params;
>  	q->ops = &rkisp1_params_vb2_ops;
>  	q->mem_ops = &vb2_vmalloc_memops;
> -	q->buf_struct_size = sizeof(struct rkisp1_buffer);
> +	q->buf_struct_size = sizeof(struct rkisp1_params_buffer);
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	q->lock = &node->vlock;
>  
> -- 
> 2.45.2
> 

