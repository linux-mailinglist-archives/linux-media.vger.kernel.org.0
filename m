Return-Path: <linux-media+bounces-14586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2660926111
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 15:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 351E1285EF5
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 13:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3B917838B;
	Wed,  3 Jul 2024 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mM/r4F1k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8AF143C50
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720011790; cv=none; b=SGknRVu9JVNYSJdtiYbOo85caPPamgF5bPy7hOTPGEgLirJdbaBMNR+m/esQ/pqePVmdif6Ol5DUaohH5JcQrmW5dUeTwZzKyImJ1owX8nytmrcCfsMhRr/e1pi/Gb8cE2rQ24Qs/hX4GVTOpcIOyTcDD842KMSgP795XOXQ/F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720011790; c=relaxed/simple;
	bh=6Iu/IhQVVhHoIW4m4zzmENQj3j9Qc6Wo2VKO1AOqfXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsgpdE2IiAKLMV/xBBxHxVMgyt4VWdxVwetZxsx+DP9HcEKEPlyqujnIOjPDvPlPrXViNiz/UJfiXWImz+l1u/bsk3NxILEhlXNav8q6J+XY6/28sfgeTguNgsanSNyjUPTflOlUQ4wjahytK8jEEMBhaLN+nc046mvk4zya8UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mM/r4F1k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F33EC3D6;
	Wed,  3 Jul 2024 15:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720011758;
	bh=6Iu/IhQVVhHoIW4m4zzmENQj3j9Qc6Wo2VKO1AOqfXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mM/r4F1k50P9yCMRP4YpcE2r/sFAa+LZTB1k7PeA2TpGbaNonvlIeHgacAKqezw4P
	 jvcFt9zbdEmYgKbIII+0lO7j/Iwjo+UzbFQLbldz/PxWTyqXNxKir+dnB54MQCknZU
	 0ZW5dFOEbXBpCya38vfsTptJ8nQDyFcUHqQtMZeo=
Date: Wed, 3 Jul 2024 16:02:44 +0300
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
Subject: Re: [PATCH v4 4/7] media: rkisp1: Copy the parameters buffer
Message-ID: <20240703130244.GH27927@pendragon.ideasonboard.com>
References: <20240703101951.77785-1-jacopo.mondi@ideasonboard.com>
 <20240703101951.77785-5-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240703101951.77785-5-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Wed, Jul 03, 2024 at 12:19:47PM +0200, Jacopo Mondi wrote:
> The ISP parameters buffers are queued by userspace to the params video
> device and appended by the driver to the list of available buffers for
> later consumption.
> 
> As the parameters buffer is mapped in the userspace process memory,
> applications have access to the buffer content after the buffer has

s/content/contents/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> been queued.
> 
> To prevent userspace from modifying the contents of the parameters buffer
> after it has been queued to the video device, add to 'struct
> rkisp1_params_buffer' a scratch buffer where to copy the parameters.
> 
> Allocate the scratch buffer in the vb2 buf_init() operation and copy the
> buffer content in the buf_prepare() operation. Free the scratch
> buffer in the newly introduced buf_cleanup() operation handler.
> 
> Modify the ISP configuration function to access the ISP configuration
> from the cached copy of the parameters buffer instead of using the
> userspace-mapped one.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  8 ++
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 81 ++++++++++++-------
>  2 files changed, 60 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index a615bbb0255e..8d520c5c71c3 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -250,12 +250,20 @@ struct rkisp1_buffer {
>   *
>   * @vb:		vb2 buffer
>   * @queue:	entry of the buffer in the queue
> + * @cfg:	scratch buffer used for caching the ISP configuration parameters
>   */
>  struct rkisp1_params_buffer {
>  	struct vb2_v4l2_buffer vb;
>  	struct list_head queue;
> +	struct rkisp1_params_cfg *cfg;
>  };
>  
> +static inline struct rkisp1_params_buffer *
> +to_rkisp1_params_buffer(struct vb2_v4l2_buffer *vbuf)
> +{
> +	return container_of(vbuf, struct rkisp1_params_buffer, vb);
> +}
> +
>  /*
>   * struct rkisp1_dummy_buffer - A buffer to write the next frame to in case
>   *				there are no vb2 buffers available.
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 2844e55bc4f2..2d49038f8983 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -5,6 +5,8 @@
>   * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
>   */
>  
> +#include <linux/string.h>
> +
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-ioctl.h>
> @@ -1501,20 +1503,6 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  	}
>  }
>  
> -static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
> -				     struct rkisp1_params_buffer **buf,
> -				     struct rkisp1_params_cfg **cfg)
> -{
> -	if (list_empty(&params->params))
> -		return false;
> -
> -	*buf = list_first_entry(&params->params, struct rkisp1_params_buffer,
> -				queue);
> -	*cfg = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
> -
> -	return true;
> -}
> -
>  static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
>  					  struct rkisp1_params_buffer *buf,
>  					  unsigned int frame_sequence)
> @@ -1528,17 +1516,18 @@ static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
>  void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  {
>  	struct rkisp1_params *params = &rkisp1->params;
> -	struct rkisp1_params_cfg *new_params;
>  	struct rkisp1_params_buffer *cur_buf;
>  
>  	spin_lock(&params->config_lock);
>  
> -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> +	cur_buf = list_first_entry_or_null(&params->params,
> +					   struct rkisp1_params_buffer, queue);
> +	if (!cur_buf)
>  		goto unlock;
>  
> -	rkisp1_isp_isr_other_config(params, new_params);
> -	rkisp1_isp_isr_lsc_config(params, new_params);
> -	rkisp1_isp_isr_meas_config(params, new_params);
> +	rkisp1_isp_isr_other_config(params, cur_buf->cfg);
> +	rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
> +	rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
>  
>  	/* update shadow register immediately */
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1604,7 +1593,6 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>  				 enum v4l2_ycbcr_encoding ycbcr_encoding)
>  {
>  	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
> -	struct rkisp1_params_cfg *new_params;
>  	struct rkisp1_params_buffer *cur_buf;
>  
>  	params->quantization = quantization;
> @@ -1634,11 +1622,13 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>  
>  	/* apply the first buffer if there is one already */
>  
> -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> +	cur_buf = list_first_entry_or_null(&params->params,
> +					   struct rkisp1_params_buffer, queue);
> +	if (!cur_buf)
>  		goto unlock;
>  
> -	rkisp1_isp_isr_other_config(params, new_params);
> -	rkisp1_isp_isr_meas_config(params, new_params);
> +	rkisp1_isp_isr_other_config(params, cur_buf->cfg);
> +	rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
>  
>  	/* update shadow register immediately */
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1650,7 +1640,6 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
>  
>  void rkisp1_params_post_configure(struct rkisp1_params *params)
>  {
> -	struct rkisp1_params_cfg *new_params;
>  	struct rkisp1_params_buffer *cur_buf;
>  
>  	spin_lock_irq(&params->config_lock);
> @@ -1663,11 +1652,12 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
>  	 * ordering doesn't affect other ISP versions negatively, do so
>  	 * unconditionally.
>  	 */
> -
> -	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
> +	cur_buf = list_first_entry_or_null(&params->params,
> +					   struct rkisp1_params_buffer, queue);
> +	if (!cur_buf)
>  		goto unlock;
>  
> -	rkisp1_isp_isr_lsc_config(params, new_params);
> +	rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
>  
>  	/* update shadow register immediately */
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
> @@ -1819,11 +1809,31 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
>  	return 0;
>  }
>  
> +static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
> +
> +	params_buf->cfg = kvmalloc(sizeof(*params_buf->cfg), GFP_KERNEL);
> +	if (!params_buf->cfg)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static void rkisp1_params_vb2_buf_cleanup(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
> +
> +	kvfree(params_buf->cfg);
> +	params_buf->cfg = NULL;
> +}
> +
>  static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
>  {
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> -	struct rkisp1_params_buffer *params_buf =
> -		container_of(vbuf, struct rkisp1_params_buffer, vb);
> +	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
>  	struct vb2_queue *vq = vb->vb2_queue;
>  	struct rkisp1_params *params = vq->drv_priv;
>  
> @@ -1834,11 +1844,22 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
>  
>  static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
>  {
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
> +	struct rkisp1_params_cfg *cfg =
> +		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
> +
>  	if (vb2_plane_size(vb, 0) < sizeof(struct rkisp1_params_cfg))
>  		return -EINVAL;
>  
>  	vb2_set_plane_payload(vb, 0, sizeof(struct rkisp1_params_cfg));
>  
> +	/*
> +	 * Copy the parameters buffer to the internal scratch buffer to avoid
> +	 * userspace modifying the buffer content while the driver processes it.
> +	 */
> +	memcpy(params_buf->cfg, cfg, sizeof(*cfg));
> +
>  	return 0;
>  }
>  
> @@ -1863,6 +1884,8 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>  
>  static const struct vb2_ops rkisp1_params_vb2_ops = {
>  	.queue_setup = rkisp1_params_vb2_queue_setup,
> +	.buf_init = rkisp1_params_vb2_buf_init,
> +	.buf_cleanup = rkisp1_params_vb2_buf_cleanup,
>  	.wait_prepare = vb2_ops_wait_prepare,
>  	.wait_finish = vb2_ops_wait_finish,
>  	.buf_queue = rkisp1_params_vb2_buf_queue,

-- 
Regards,

Laurent Pinchart

