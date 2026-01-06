Return-Path: <linux-media+bounces-49955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE1ACF618A
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 01:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A57D73055739
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 00:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B031D88D7;
	Tue,  6 Jan 2026 00:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AFVTsMpU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687BF405F7;
	Tue,  6 Jan 2026 00:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767660149; cv=none; b=l5AabsqCocahhZ+Q3He+bBXyBNU+XD3aeNRAnQv35OPjArC9ddCHhNaeauam+dJJPljnpxXpblqeUd1vjccuO2nNbLmG1ozCezF1wPBJKFo8ItIKC8rrTxK8IZvJu7kWuuRphOUOn4wrT+R0aX3Z2vHIo/kVrJL1TdgfeR0H+5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767660149; c=relaxed/simple;
	bh=njFHNNpR4vIL8elGWx5dSKPW9Zlow0wY8rDV/m3iEeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaq7NRKnYIAgNUL1JNt9l5q9vHwFb1TKcTA8xP9/m4sROFQrrdi5Um1Yfqk2vsM3KciMYR6widSwN955UwEo0aONquXRagij28WV7uQ4aJ6SiGzHBzdzOmNanFxckGPyxplSFxv469fRvaEtHJ5An3h2lcamWE/knQcKq+0WaY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AFVTsMpU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 163E76DF;
	Tue,  6 Jan 2026 01:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767660125;
	bh=njFHNNpR4vIL8elGWx5dSKPW9Zlow0wY8rDV/m3iEeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFVTsMpUJzrf3THWIspUfJKDQoss9IsAiC8Pe7i9QhoFzNYIaPGePTtrRPejMUMnC
	 vIWqq9sX3rzLPZ1kpjDHRX4m8ajvuFTSKnjXJXsxphJil9FcT/VdVVM3MPxyPTGaH5
	 9utWTThSrQzbXzgXPLnwbvrJOBepvzTaBlSkisVg=
Date: Tue, 6 Jan 2026 02:42:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 2/4] media: dw100: Implement dynamic vertex map update
Message-ID: <20260106004206.GK10026@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-2-65af34d04fd8@ideasonboard.com>
 <f4e0b1f13ee54d88d1035828af548f5cf3a25c16.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4e0b1f13ee54d88d1035828af548f5cf3a25c16.camel@ndufresne.ca>

On Mon, Jan 05, 2026 at 01:58:25PM -0500, Nicolas Dufresne wrote:
> Le lundi 05 janvier 2026 à 12:35 +0100, Stefan Klug a écrit :
> > Implement dynamic vertex map updates by handling the
> > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streaming. This
> > allows to implement features like dynamic zoom, pan, rotate and dewarp.
> > 
> > To stay compatible with the old version, updates of
> > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during streaming
> > when requests are not used. Print a corresponding warning once.
> > 
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/dw100/dw100.c | 27 +++++++++++++++++++++------
> >  1 file changed, 21 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> > index 7f14b82c15a071605c124dbb868f8003856c4fc0..8a421059a1c9b55f514a29d3c2c5a6ffb76e0a64 100644
> > --- a/drivers/media/platform/nxp/dw100/dw100.c
> > +++ b/drivers/media/platform/nxp/dw100/dw100.c
> > @@ -98,6 +98,8 @@ struct dw100_ctx {
> >  	unsigned int			map_width;
> >  	unsigned int			map_height;
> >  	bool				user_map_is_set;
> > +	bool				user_map_needs_update;
> > +	bool				warned_dynamic_update;
> >  
> >  	/* Source and destination queue data */
> >  	struct dw100_q_data		q_data[2];
> > @@ -293,11 +295,15 @@ static u32 dw100_map_format_coordinates(u16 xq, u16 yq)
> >  	return (u32)((yq << 16) | xq);
> >  }
> >  
> > -static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
> > +static void dw100_update_mapping(struct dw100_ctx *ctx)
> >  {
> >  	struct v4l2_ctrl *ctrl = ctx->ctrls[DW100_CTRL_DEWARPING_MAP];
> >  
> > -	return ctrl->p_cur.p_u32;
> > +	if (!ctx->user_map_needs_update)
> > +		return;
> > +
> > +	memcpy(ctx->map, ctrl->p_cur.p_u32, ctx->map_size);
> > +	ctx->user_map_needs_update = false;
> >  }
> >  
> >  /*
> > @@ -306,8 +312,6 @@ static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
> >   */
> >  static int dw100_create_mapping(struct dw100_ctx *ctx)
> >  {
> > -	u32 *user_map;
> > -
> >  	if (ctx->map)
> >  		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
> >  				  ctx->map, ctx->map_dma);
> > @@ -318,8 +322,8 @@ static int dw100_create_mapping(struct dw100_ctx *ctx)
> >  	if (!ctx->map)
> >  		return -ENOMEM;
> >  
> > -	user_map = dw100_get_user_map(ctx);
> > -	memcpy(ctx->map, user_map, ctx->map_size);
> > +	ctx->user_map_needs_update = true;
> > +	dw100_update_mapping(ctx);
> >  
> >  	dev_dbg(&ctx->dw_dev->pdev->dev,
> >  		"%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n",
> > @@ -351,6 +355,7 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
> >  	switch (ctrl->id) {
> >  	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
> >  		ctx->user_map_is_set = true;
> > +		ctx->user_map_needs_update = true;
> 
> This will be called before the new mapping is applied by
> v4l2_ctrl_request_complete(), and then may be cleared too soon if you queue
> depth is high enough.

v4l2_ctrl_request_complete() does not apply a mapping, what am I missing
?

> Instead, you should check in the request for the presence of
> V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP to optimize the updates. Yo may still
> set this to true if if there is no request, in the case you also wanted to
> change the original behaviour of only updating that vertex on streamon, but I
> don't see much point though.
> 
> >  		break;
> >  	}
> >  
> > @@ -405,6 +410,7 @@ static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
> >  	}
> >  
> >  	ctx->user_map_is_set = false;
> > +	ctx->user_map_needs_update = true;
> >  }
> >  
> >  static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops = {
> > @@ -1482,6 +1488,15 @@ static void dw100_device_run(void *priv)
> >  	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> >  				&ctx->hdl);
> >  
> > +	if (src_buf->vb2_buf.req_obj.req) {
> > +		dw100_update_mapping(ctx);
> > +	} else if (ctx->user_map_needs_update && !ctx->warned_dynamic_update) {
> > +		ctx->warned_dynamic_update = true;
> > +		dev_warn(&ctx->dw_dev->pdev->dev,
> > +			"V4L2 requests are required to update the vertex map dynamically"
> 
> Do you know about dev_warn_once() ? That being said, the driver is usable
> without requests and a static vertex (and must stay this way to not break the
> ABI). I don't think you should warn here at all.

Applications should move to using requests. We'll do so in libcamera
unconditionally. I don't expect many other direct users, so warning that
the mapping won't be applied when an application sets the corresponding
control during streaming without using requests seems fair to me. It
will help debugging issues.

> > +		);
> > +	}
> > +
> >  	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> >  				   &ctx->hdl);
> >  

-- 
Regards,

Laurent Pinchart

