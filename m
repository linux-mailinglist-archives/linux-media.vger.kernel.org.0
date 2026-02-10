Return-Path: <linux-media+bounces-52537-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADmxFdRzi2nFUQAAu9opvQ
	(envelope-from <linux-media+bounces-52537-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 19:07:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6F211E393
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 19:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 509A2304B777
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3506138B7BC;
	Tue, 10 Feb 2026 18:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CnKW9SWq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C235A93D;
	Tue, 10 Feb 2026 18:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770746827; cv=none; b=GekZ34F3BCaS/4HG6zgss/X4yzS4km9W0opOR4dgKqGNGmpS8FhYO8X0iGpIx/O2jaO6Q+oNbW5ZkkurJcQfEVYsgAJf41Kyut4OxwC37gv6ZsElcieYkxRJGGfjsJdyBxEH63yiuLzfOVxKGo6EpppUIvCC2r0Xh+wiiD2Hu+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770746827; c=relaxed/simple;
	bh=dtsN9PTOK1E9miKkCEHZkkplliQqePs7czW8/h3LNZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBS38xoXueJ1P8jpX/wQ7vorSyslUoyEnshR1lbg1VeKztrDhHk0QTiVmRyi5ECUSyiPqrXBDG0IQNr3GUWnef1wZqT7PUEKLjX+ZZOjohZb2Sq8AJQp8wTHRNb8L5Z2pmk/U5jjo+uqDKYYeE+8ew+ZIPxYUMq4/ejWlPZN/fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CnKW9SWq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D4D1E838;
	Tue, 10 Feb 2026 19:06:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770746778;
	bh=dtsN9PTOK1E9miKkCEHZkkplliQqePs7czW8/h3LNZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CnKW9SWqqAh9o17onADC/cHusa/Ryxi3aUPeCEodiEwdMKSgY1suZoBkvaXMax3p6
	 2dCvxYHdxwetakUwPPlEKWYFtPuw2/GNz/+c6KN7OnoSGwXIJSGxwCzl4aEkx1qDxw
	 AdQM34ygT0NFm6pkN6NGmYKH3vaBLYkxCEzksRGA=
Date: Tue, 10 Feb 2026 20:07:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v3 2/4] media: dw100: Implement dynamic vertex map update
Message-ID: <20260210180703.GC2502896@killaraus.ideasonboard.com>
References: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-0-2eb5685eaf09@ideasonboard.com>
 <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-2-2eb5685eaf09@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-2-2eb5685eaf09@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52537-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: CD6F211E393
X-Rspamd-Action: no action

Hi Stefan,

Thank you for the patch.

On Thu, Jan 29, 2026 at 12:43:11PM +0100, Stefan Klug wrote:
> Implement dynamic vertex map updates by handling the
> V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streaming. This
> allows to implement features like dynamic zoom, pan, rotate and dewarp.
> 
> To stay compatible with the old version, updates of
> V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during streaming
> when requests are not used. Print a corresponding warning once.
> 
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> 
> ---
> 
> Changes in v2:
> - Replaced the manual warn once by dev_warn_once(). This changes the
>   frequency from once per context to once per boot which was agreed to
>   be enough.
> - Renamed user_map_needs_update to user_map_is_dirty as it is more
>   expressive and fits to user_map_is_set
> - Fixed indentation issue found by Media CI
> ---
>  drivers/media/platform/nxp/dw100/dw100.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index 1cb895da9912371a2b23ca62412c572d9cb75c00..d2b1c62b52db47ea1d2242caaf334fff30c6f366 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -98,6 +98,7 @@ struct dw100_ctx {
>  	unsigned int			map_width;
>  	unsigned int			map_height;
>  	bool				user_map_is_set;
> +	bool				user_map_is_dirty;
>  
>  	/* Source and destination queue data */
>  	struct dw100_q_data		q_data[2];
> @@ -293,11 +294,15 @@ static u32 dw100_map_format_coordinates(u16 xq, u16 yq)
>  	return (u32)((yq << 16) | xq);
>  }
>  
> -static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
> +static void dw100_update_mapping(struct dw100_ctx *ctx)
>  {
>  	struct v4l2_ctrl *ctrl = ctx->ctrls[DW100_CTRL_DEWARPING_MAP];
>  
> -	return ctrl->p_cur.p_u32;
> +	if (!ctx->user_map_is_dirty)
> +		return;
> +
> +	memcpy(ctx->map, ctrl->p_cur.p_u32, ctx->map_size);
> +	ctx->user_map_is_dirty = false;
>  }
>  
>  /*
> @@ -306,8 +311,6 @@ static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
>   */
>  static int dw100_create_mapping(struct dw100_ctx *ctx)
>  {
> -	u32 *user_map;
> -
>  	if (ctx->map)
>  		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
>  				  ctx->map, ctx->map_dma);
> @@ -318,8 +321,8 @@ static int dw100_create_mapping(struct dw100_ctx *ctx)
>  	if (!ctx->map)
>  		return -ENOMEM;
>  
> -	user_map = dw100_get_user_map(ctx);
> -	memcpy(ctx->map, user_map, ctx->map_size);
> +	ctx->user_map_is_dirty = true;
> +	dw100_update_mapping(ctx);
>  
>  	dev_dbg(&ctx->dw_dev->pdev->dev,
>  		"%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n",
> @@ -351,6 +354,7 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
>  	switch (ctrl->id) {
>  	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
>  		ctx->user_map_is_set = true;
> +		ctx->user_map_is_dirty = true;
>  		break;
>  	}
>  
> @@ -405,6 +409,7 @@ static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
>  	}
>  
>  	ctx->user_map_is_set = false;
> +	ctx->user_map_is_dirty = true;
>  }
>  
>  static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops = {
> @@ -1478,6 +1483,13 @@ static void dw100_device_run(void *priv)
>  	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
>  				&ctx->hdl);
>  
> +	if (src_buf->vb2_buf.req_obj.req)
> +		dw100_update_mapping(ctx);
> +	else if (ctx->user_map_is_dirty)
> +		dev_warn_once(&ctx->dw_dev->pdev->dev,
> +			      "V4L2 requests are required to update the vertex map dynamically"

Missing \n

> +		);

The closing parenthesis goes at the end of the previous line.

With those small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
>  				   &ctx->hdl);
>  

-- 
Regards,

Laurent Pinchart

