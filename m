Return-Path: <linux-media+bounces-52539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOOKBKF1i2nZUQAAu9opvQ
	(envelope-from <linux-media+bounces-52539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 19:14:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A188B11E459
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 19:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9184F304B810
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FF438B7C6;
	Tue, 10 Feb 2026 18:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="blUr1uj3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8938A728;
	Tue, 10 Feb 2026 18:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770747281; cv=none; b=Dax2RJP+v49EmH9jhJQweY57Rx3HNKwEO6xht+Qmgw+qjrUsrElOg6ltXxqy9uZcukOvygJu5297qro9x1AO2ZnLjL3iCEymMvsKMuRa/jagdKCp2uIijznQZpAd1usCQ7/oqTfgkJVQhOiB8utyd+yvvXLo0P6eBbYjbAKoEmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770747281; c=relaxed/simple;
	bh=+5OuKNJEyDSDi742StxrHwwijmjVrOkSLbaOMV0muqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oO5dL73tM6gKLgcsMi/hnHCbZ7xuintLC4J/uEiDEKdzsKhXSJcqW4xDySXcYadAaHLPdL8eJ4sN/fcMhu/0ZpE0QFUDglI7eRb7Sbmq+Fxp+fgU6dfo2eS15OzSJTqHaC7df0xP5IehnfYDXsQREp4sCEBJmKXS4go4CuAUrv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=blUr1uj3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8E7BC838;
	Tue, 10 Feb 2026 19:13:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770747231;
	bh=+5OuKNJEyDSDi742StxrHwwijmjVrOkSLbaOMV0muqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blUr1uj3x/Bj7lqY4nBUTcs83DYqv/8V7sJ3cDaWhbEqoCuT6SJihiOYlxe75+i5c
	 ZTAN516KUrg4aSVnTYExrGPm1736Xn/noHpqOl3fJJ7sOys129Y+OmvTNv52wMCJGS
	 Mob4qtfadjkqt7bmjTW7zEK5f3YeTF6trQLqIYEA=
Date: Tue, 10 Feb 2026 20:14:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v3 4/4] media: dw100: Merge dw100_device_run and
 dw100_start
Message-ID: <20260210181436.GE2502896@killaraus.ideasonboard.com>
References: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-0-2eb5685eaf09@ideasonboard.com>
 <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-4-2eb5685eaf09@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-4-2eb5685eaf09@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52539-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: A188B11E459
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 12:43:13PM +0100, Stefan Klug wrote:
> The dw100_start() function is only called from dw100_device_run(). As
> both functions are not too big, move the code directly into
> dw100_device_run() and drop dw100_start() to improve readability.
> 
> This patch contains no functional changes.
> 
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v3:
> - Added this patch as proposed in the review of v1
> ---
>  drivers/media/platform/nxp/dw100/dw100.c | 61 ++++++++++++++------------------
>  1 file changed, 27 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index 46e3a7b74fb777aa479110a52229f36b8632db44..c7c4249f5769467fb2b1f3c87f5685c4463a0a9d 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -1442,25 +1442,42 @@ static irqreturn_t dw100_irq_thread_fn(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
> -			struct vb2_v4l2_buffer *out_vb)
> +static void dw100_device_run(void *priv)
>  {
> +	struct dw100_ctx *ctx = priv;
>  	struct dw100_device *dw_dev = ctx->dw_dev;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  
> -	out_vb->sequence =
> -		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)->sequence++;
> -	in_vb->sequence =
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> +				&ctx->hdl);
> +
> +	if (src_buf->vb2_buf.req_obj.req)
> +		dw100_update_mapping(ctx);
> +	else if (ctx->user_map_is_dirty)
> +		dev_warn_once(&dw_dev->pdev->dev,
> +			      "V4L2 requests are required to update the vertex map dynamically"
> +		);
> +
> +	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> +				   &ctx->hdl);
> +
> +	src_buf->sequence =
>  		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)->sequence++;
> +	dst_buf->sequence =
> +		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)->sequence++;
>  
> -	dev_dbg(&ctx->dw_dev->pdev->dev,
> +	dev_dbg(&dw_dev->pdev->dev,
>  		"Starting queues %p->%p, sequence %u->%u\n",
>  		v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>  				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE),
>  		v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>  				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE),
> -		in_vb->sequence, out_vb->sequence);
> +		src_buf->sequence, dst_buf->sequence);
>  
> -	v4l2_m2m_buf_copy_metadata(in_vb, out_vb);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>  
>  	/* Now, let's deal with hardware ... */
>  	dw100_hw_master_bus_disable(dw_dev);
> @@ -1469,10 +1486,10 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>  	dw100_hw_set_src_crop(dw_dev, &ctx->q_data[DW100_QUEUE_SRC],
>  			      &ctx->q_data[DW100_QUEUE_DST]);
>  	dw100_hw_set_source(dw_dev, &ctx->q_data[DW100_QUEUE_SRC],
> -			    &in_vb->vb2_buf);
> +			    &src_buf->vb2_buf);
>  	dw100_hw_set_destination(dw_dev, &ctx->q_data[DW100_QUEUE_DST],
>  				 ctx->q_data[DW100_QUEUE_SRC].fmt,
> -				 &out_vb->vb2_buf);
> +				 &dst_buf->vb2_buf);
>  	dw100_hw_set_mapping(dw_dev, ctx->map_dma,
>  			     ctx->map_width, ctx->map_height);
>  	dw100_hw_enable_irq(dw_dev);
> @@ -1482,30 +1499,6 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>  	dw100_hw_master_bus_enable(dw_dev);
>  }
>  
> -static void dw100_device_run(void *priv)
> -{
> -	struct dw100_ctx *ctx = priv;
> -	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> -
> -	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> -	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> -
> -	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> -				&ctx->hdl);
> -
> -	if (src_buf->vb2_buf.req_obj.req)
> -		dw100_update_mapping(ctx);
> -	else if (ctx->user_map_is_dirty)
> -		dev_warn_once(&ctx->dw_dev->pdev->dev,
> -			      "V4L2 requests are required to update the vertex map dynamically"
> -		);
> -
> -	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> -				   &ctx->hdl);
> -
> -	dw100_start(ctx, src_buf, dst_buf);
> -}
> -
>  static const struct v4l2_m2m_ops dw100_m2m_ops = {
>  	.device_run	= dw100_device_run,
>  };

-- 
Regards,

Laurent Pinchart

