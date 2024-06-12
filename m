Return-Path: <linux-media+bounces-13039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E0F905432
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7519CB226D9
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 13:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5955617E444;
	Wed, 12 Jun 2024 13:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kP/a0LJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB3D17D889
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200350; cv=none; b=af8BHAv2UZqlt9M7hSeqJb3fanHt1ZN3WV7ZMvy4uQGxvkoTtf8VGmzGF6Yx+xAl7oarWp+1v83eP/b6f1w1KpOAxevernV5iGe/mBBE5571RMO0tkU3ed3STJlnUdmYwkNO8USEhexWYmNBhDIpIe8xYptUbgZy76LrqaFKgyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200350; c=relaxed/simple;
	bh=JX7pdp0UGS/6Vn4Bzn/ZXFgi8Q17kr/cVWoEWh1drh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2qJfGcbqApGxmARVE50ZrG+mgOfVcQFJfnzTLFrNBKJsQnEvjV32Ou/o/L3DF42mNfeY0YBQ1ErtT/CMFZ5jdE6zxLWGWMqwKGZWo2yspENaYqdKQsL+iBLVHTNyWZmc7240gtcRXud4miH967aENL98IvlLWRPwV/URBkaX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kP/a0LJ9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 745964D0;
	Wed, 12 Jun 2024 15:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718200333;
	bh=JX7pdp0UGS/6Vn4Bzn/ZXFgi8Q17kr/cVWoEWh1drh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kP/a0LJ9MDrOexLcRvkH4br1+v4+ukANbKAo8NoWTZo2AyjqTkJQgpzOB62EepbVz
	 gUdRmiNWY4bqzNeuHcm37X4VfQiZHyWh+rMbwYHe8YupH6ffbvbCwPEpqbKYJ9MPrs
	 nkq+cQFOO84+g5iNXKpuVsxzD7EGlbIcqkT1gl9M=
Message-ID: <c301c4f5-429d-4c06-98d8-b1c11e463d65@ideasonboard.com>
Date: Wed, 12 Jun 2024 14:52:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: rkisp1: Add struct rkisp1_params_buffer
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-8-jacopo.mondi@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240605165434.432230-8-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 05/06/2024 17:54, Jacopo Mondi wrote:
> Create the 'struct rkisp1_params_buffer' type that wraps a
> vb2_v4l2_buffer and contain a pointer to an optional copy of
> the parameters buffer that will be used to copy the user-provided
> configuration buffer in the following patches.
>
> Replace usage of 'struct rkisp1_buffer' with 'struct
> rkisp1_params_buffer' in rkisp1-params.c to prepare for that.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


The contents look fine (one teeny tiny thing below), though I think I'd personally push this before 
5/8 and squash 8/8 into 5/8 - up to you.


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   .../platform/rockchip/rkisp1/rkisp1-common.h  | 16 +++++++++++++-
>   .../platform/rockchip/rkisp1/rkisp1-params.c  | 21 ++++++++++---------
>   2 files changed, 26 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index f9df5ed96c98..3118f1974246 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -232,7 +232,7 @@ struct rkisp1_vdev_node {
>   
>   /*
>    * struct rkisp1_buffer - A container for the vb2 buffers used by the video devices:
> - *			  params, stats, mainpath, selfpath
> + *			  stats, mainpath, selfpath
>    *
>    * @vb:		vb2 buffer
>    * @queue:	entry of the buffer in the queue
> @@ -244,6 +244,20 @@ struct rkisp1_buffer {
>   	dma_addr_t buff_addr[VIDEO_MAX_PLANES];
>   };
>   
> +/*
> + * struct rkisp1_params_buffer - A container for the vb2 buffers used by the
> + *				 params video device
> + *
> + * @vb:		vb2 buffer
> + * @queue:	entry of the buffer in the queue
> + * cfg:		scratch buffer used for the extensible parameters format
s/cfg/@cfg
> + */
> +struct rkisp1_params_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head queue;
> +	struct rkisp1_ext_params_cfg *cfg;
> +};
> +
>   /*
>    * struct rkisp1_dummy_buffer - A buffer to write the next frame to in case
>    *				there are no vb2 buffers available.
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index c081fd490b2b..4adaf084ce6e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -2016,20 +2016,21 @@ static int rkisp1_ext_params_lsc_config(struct rkisp1_params *params,
>   }
>   
>   static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
> -				     struct rkisp1_buffer **buf,
> +				     struct rkisp1_params_buffer **buf,
>   				     void **cfg)
>   {
>   	if (list_empty(&params->params))
>   		return false;
>   
> -	*buf = list_first_entry(&params->params, struct rkisp1_buffer, queue);
> +	*buf = list_first_entry(&params->params, struct rkisp1_params_buffer,
> +				queue);
>   	*cfg = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
>   
>   	return true;
>   }
>   
>   static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
> -					  struct rkisp1_buffer *buf,
> +					  struct rkisp1_params_buffer *buf,
>   					  unsigned int frame_sequence,
>   					  enum vb2_buffer_state state)
>   {
> @@ -2042,7 +2043,7 @@ static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
>   void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>   {
>   	struct rkisp1_params *params = &rkisp1->params;
> -	struct rkisp1_buffer *buf;
> +	struct rkisp1_params_buffer *buf;
>   	int ret = 0;
>   	void *cfg;
>   
> @@ -2129,7 +2130,7 @@ int rkisp1_params_pre_configure(struct rkisp1_params *params,
>   				enum v4l2_ycbcr_encoding ycbcr_encoding)
>   {
>   	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
> -	struct rkisp1_buffer *buf;
> +	struct rkisp1_params_buffer *buf;
>   	int ret = 0;
>   	void *cfg;
>   
> @@ -2193,7 +2194,7 @@ int rkisp1_params_pre_configure(struct rkisp1_params *params,
>   
>   int rkisp1_params_post_configure(struct rkisp1_params *params)
>   {
> -	struct rkisp1_buffer *buf;
> +	struct rkisp1_params_buffer *buf;
>   	int ret = 0;
>   	void *cfg;
>   
> @@ -2409,8 +2410,8 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
>   static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
>   {
>   	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> -	struct rkisp1_buffer *params_buf =
> -		container_of(vbuf, struct rkisp1_buffer, vb);
> +	struct rkisp1_params_buffer *params_buf =
> +		container_of(vbuf, struct rkisp1_params_buffer, vb);
>   	struct vb2_queue *vq = vb->vb2_queue;
>   	struct rkisp1_params *params = vq->drv_priv;
>   
> @@ -2436,7 +2437,7 @@ static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
>   static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>   {
>   	struct rkisp1_params *params = vq->drv_priv;
> -	struct rkisp1_buffer *buf;
> +	struct rkisp1_params_buffer *buf;
>   	LIST_HEAD(tmp_list);
>   
>   	/*
> @@ -2482,7 +2483,7 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
>   	q->drv_priv = params;
>   	q->ops = &rkisp1_params_vb2_ops;
>   	q->mem_ops = &vb2_vmalloc_memops;
> -	q->buf_struct_size = sizeof(struct rkisp1_buffer);
> +	q->buf_struct_size = sizeof(struct rkisp1_params_buffer);
>   	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>   	q->lock = &node->vlock;
>   

