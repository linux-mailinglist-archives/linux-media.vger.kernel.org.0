Return-Path: <linux-media+bounces-21113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D5E9C17D4
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCD3D1F2411E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B51E1CBE89;
	Fri,  8 Nov 2024 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="s2k2taLt"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC71F5FA
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 08:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054244; cv=pass; b=gaw6quYeaUgGcvyTy7P721Hu2+45o8RfGD285aPUabVgIsYeVaHiMq6ls3hdbM9K7Z9md0aVXCU7M6EJGfhkcdCXrVCzmKTqOZyWrvqs6HQDpAR9yE4lQSJrZQHGHoX0Q+mdl/kn4k8qjoLM7QtgO+MvFO1Fa7u1Wr6NZUXrrDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054244; c=relaxed/simple;
	bh=ijPXC0KSslcz1xktOX3dGOQX3IsuwdtTAhptokvsfjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fW78st1yo0pj7fU7XB6Y2aa1PoQ6EmPtqNT0y6RicuazK63kKDs68YOXR3z7LQnqi0LcC3OPmUt3IxF7yVhLW8VVITze+q2Kra0d0j5ZWQNjt8QRbfwizy3YdyXI9r+afg8sRhNsTKumfF7amdemX6vbP64+6h5oZkz+GZSRsTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=s2k2taLt; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XlBmb3Cyvz49Q16;
	Fri,  8 Nov 2024 10:23:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1731054239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s3NrhfTR3YlFEwSQi/gw2IptGJYRLbCRu3rXqzmNvpg=;
	b=s2k2taLtJ4L2Fc3T/N3srDVsFWuyP/4vQt8ajqv0xaJcsoEMTPEB12NZZV6Xj7xyVYE3M+
	wDGCU47itE5iVJZc58EWk7/fx9uPgJRPVJX59XWwvAOqaXaJB/jFxo/MUhoH/+zZYnHdWR
	L0jG4fxoO397juM5IESTFKf188Q1mbQiQj220xUyF73V9H07AG7lQTevBC2GCW19rsrzSM
	xNFbymUoStIDWz3EaLOKqoIcQZquGuApdcHK2rnW8CEKlOPJ8Z0KYzLh0CovWIoHW2ccDa
	URDYkJrxgeI4B7pMKCXMundIig+S1XBswLXHs0JDRQ3OQjh8eb6+EeS71dYxng==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1731054239; a=rsa-sha256;
	cv=none;
	b=osFsjthZR2qKyhOv77vyVgQVUNRw4ctC3A9YoxNQ+n3aOA1dj//KexY8N6hGfk3s+Ohftl
	IvaTWiwtqSsGCcnEfsK/zfeCvo6QushsB2TaWXDQLjwFw9VCuPAvWIpzyQPmMlGPTpeb77
	rfsMjI5NF0pEyKyG3qcgQpsE4vGEX7eXjVceTJMSbvBTR9N8kW6Q/yXxiCswuzv5XswJz3
	EavTrat8DocHfLhKBzab/a3B/twKxMwOuKXbLCDlD1LOpq/DMfJWOF9S9UaztbyB894O61
	7i4txvqxLRlpUEQhpegI9u9xyuf6oGWm5qKhucE3aort10+IHErbAvxvuQsuCg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1731054239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s3NrhfTR3YlFEwSQi/gw2IptGJYRLbCRu3rXqzmNvpg=;
	b=O0GF2Hac5x6GT+VoFK1bB3Qg4MTrS6ZkeIlhD47n75+HKvTVZzAh6+a4K43uvTFNdizIqG
	Wly5tlzjigAjzPvqvF8w5RPFCwCbEwp33oqo0bVCaM9fibedNqVGYC2hJYoWds/GzQSoA7
	g0Q3Mje0gkO+RkGcXl51fzJrGGHtlk6MqdeRuFOSd3KzAH+NlElMIzPZQs1KuJAShQ+vll
	9Xee2fULdPOgbsS4+UWvz3xfeMTlN7TQJsPddH1CWPpatmL5qAP2Pa54lFD3m5XDEapFZD
	BLsFgvUrbNb3l+X71FVnxoBttgTsg+rSi0HkPO5VfBxCwOPfqyFStN1g/T/O8Q==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 49A69634C93;
	Fri,  8 Nov 2024 10:23:57 +0200 (EET)
Date: Fri, 8 Nov 2024 08:23:57 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCHv3] media: vicodec: add V4L2_CID_MIN_BUFFERS_FOR_* controls
Message-ID: <Zy3KnT696hCBy6UM@valkosipuli.retiisi.eu>
References: <3c0362e5-aa47-4545-a81e-e696b0e01440@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c0362e5-aa47-4545-a81e-e696b0e01440@xs4all.nl>

Hi Hans,

On Tue, Nov 05, 2024 at 08:50:39AM +0100, Hans Verkuil wrote:
> Stateful codecs must support the V4L2_CID_MIN_BUFFERS_FOR_OUTPUT
> and V4L2_CID_MIN_BUFFERS_FOR_CAPTURE controls. The vicodec driver
> was missing support for these controls. Add them.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---
> Change since v2: set min_reqbufs_allocation to the same value
> as used for V4L2_CID_MIN_BUFFERS_FOR_OUTPUT/CAPTURE.
> Change since v1: V4L2_CID_MIN_BUFFERS_FOR_OUTPUT was already
> supported, so that patch led to duplicated controls. That's now
> fixed.
> ---
>  .../media/test-drivers/vicodec/vicodec-core.c | 22 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
> index 00c84a06f343..556ec2a3d411 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -43,6 +43,8 @@ MODULE_PARM_DESC(debug, " activates debug info");
>  #define MIN_WIDTH		640U
>  #define MAX_HEIGHT		2160U
>  #define MIN_HEIGHT		360U
> +/* Recommended number of buffers for the stateful codecs */
> +#define VICODEC_REC_BUFS	2
> 
>  #define dprintk(dev, fmt, arg...) \
>  	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: " fmt, __func__, ## arg)
> @@ -1705,12 +1707,14 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>  	src_vq->ops = &vicodec_qops;
>  	src_vq->mem_ops = &vb2_vmalloc_memops;
>  	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> -	if (ctx->is_enc)
> +	if (ctx->is_enc) {
>  		src_vq->lock = &ctx->dev->stateful_enc.mutex;
> -	else if (ctx->is_stateless)
> +		src_vq->min_reqbufs_allocation = VICODEC_REC_BUFS;

Doesn't this change affect also stateless codecs?

> +	} else if (ctx->is_stateless) {
>  		src_vq->lock = &ctx->dev->stateless_dec.mutex;
> -	else
> +	} else {
>  		src_vq->lock = &ctx->dev->stateful_dec.mutex;
> +	}
>  	src_vq->supports_requests = ctx->is_stateless;
>  	src_vq->requires_requests = ctx->is_stateless;
>  	ret = vb2_queue_init(src_vq);
> @@ -1728,6 +1732,8 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>  	dst_vq->mem_ops = &vb2_vmalloc_memops;
>  	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	dst_vq->lock = src_vq->lock;
> +	if (!ctx->is_stateless && !ctx->is_enc)
> +		dst_vq->min_reqbufs_allocation = VICODEC_REC_BUFS;
> 
>  	return vb2_queue_init(dst_vq);
>  }
> @@ -1852,9 +1858,13 @@ static int vicodec_open(struct file *file)
>  			  1, 31, 1, 20);
>  	v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops, V4L2_CID_FWHT_P_FRAME_QP,
>  			  1, 31, 1, 20);
> -	if (ctx->is_enc)
> -		v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops,
> -				  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 1, 1, 1);
> +	if (!ctx->is_stateless)
> +		v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops, ctx->is_enc ?
> +				  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT :
> +				  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
> +				  VICODEC_REC_BUFS, VICODEC_REC_BUFS, 1,
> +				  VICODEC_REC_BUFS);
> +
>  	if (ctx->is_stateless)

This could be replaced by an else branch.

>  		v4l2_ctrl_new_custom(hdl, &vicodec_ctrl_stateless_state, NULL);
>  	if (hdl->error) {

-- 
Kind regards,

Sakari Ailus

