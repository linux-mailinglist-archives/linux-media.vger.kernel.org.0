Return-Path: <linux-media+bounces-61524-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM+xJQDUBGr0PQIAu9opvQ
	(envelope-from <linux-media+bounces-61524-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:41:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9B53A240
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10DB7301C921
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC7E3ACF1D;
	Wed, 13 May 2026 19:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wXztKGVz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FA13A6EF8;
	Wed, 13 May 2026 19:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701225; cv=none; b=TLsUrxQUbIUfJv4Tk1e9urI6ojolcMBmdwJH4XPqSSr5SV5H9FsLgjl0xtljF9RxxxPlCVEXwq/i3ivgmkE9UVCQW8OfZHM+rRnQzT1VgNGQSDR1Pb9NlGjTNmJ2uJOxrbiGRf4mHqfjIMnWdpoy5+8ddMhrPhM33KFLKdTxbDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701225; c=relaxed/simple;
	bh=jlWHu1fXFM3qCsVs2Dtd/hqL0fuEiheEM0UFk2/CMU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbVgPlOP4SB38qia246nz0XEBT1k/B9x/d95rIUd9Lc53zW/ccjj18Df1QyXPhsJiOahrazWxRzvvk+rreefCuYIKprnbv4qgz21aAgS0ppDwsJsN79/tq3qmnQlQcM72wE9AuKj4lMKn9fYkafwda0/ToM/4rDSJVYF1bFdf8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wXztKGVz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ECC39A0;
	Wed, 13 May 2026 21:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778701211;
	bh=jlWHu1fXFM3qCsVs2Dtd/hqL0fuEiheEM0UFk2/CMU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wXztKGVz1CXEhaxpmnwbdlF8KW+G19KK17oDOgLFOwWmNCx2g/E+Of9LDXhXsBD4+
	 W/jz9XT90s69Gw9fLOGCOkt14m3mfpGTEfvT9keJIune0nbfFNvuLbKZ4gr+xP679G
	 byNe44q9m9LtsC8yuY1l4zS5Ru8lnY6wZbKXdUL0=
Date: Wed, 13 May 2026 22:40:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 05/11] media: renesas: vsp1: Use mutex guards
Message-ID: <20260513194018.GA291825@killaraus.ideasonboard.com>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260511235637.3468558-6-laurent.pinchart+renesas@ideasonboard.com>
 <20260513192054.GH332351@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513192054.GH332351@ragnatech.se>
X-Rspamd-Queue-Id: 4AE9B53A240
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,ideasonboard.com,bp.renesas.com,gmail.com,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-61524-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ragnatech.se:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 09:20:54PM +0200, Niklas Söderlund wrote:
> Hi Laurent,
> 
> These new constructs are so useful, nice to take the time to make use of 
> them in existing drivers.

Yes, I like them too. The scoped guards are sometimes more annoying as
they add one indentation level.

> On 2026-05-12 02:56:29 +0300, Laurent Pinchart wrote:
> > Replace manual mutex locking and unlocking with guards. This simplifies
> > error paths and reduces the amount of code. Limit the changes to
> > locations where the guard covers until the end of the function to ease
> > review. Scoped guards will be introduced separately.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_brx.c    | 26 ++++-------
> >  .../media/platform/renesas/vsp1/vsp1_drm.c    |  7 +--
> >  .../media/platform/renesas/vsp1/vsp1_entity.c | 19 +++-----
> >  .../media/platform/renesas/vsp1/vsp1_histo.c  | 35 +++++----------
> >  .../media/platform/renesas/vsp1/vsp1_hsit.c   | 15 +++----
> >  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 44 ++++++-------------
> >  .../media/platform/renesas/vsp1/vsp1_sru.c    | 13 ++----
> >  .../media/platform/renesas/vsp1/vsp1_uds.c    | 13 ++----
> >  .../media/platform/renesas/vsp1/vsp1_uif.c    | 29 ++++--------
> >  .../media/platform/renesas/vsp1/vsp1_video.c  | 20 ++++-----
> >  .../media/platform/renesas/vsp1/vsp1_wpf.c    | 17 +++----
> >  11 files changed, 77 insertions(+), 161 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > index 9d93cb8b8e82..bd2672341386 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > @@ -130,15 +130,12 @@ static int brx_set_format(struct v4l2_subdev *subdev,
> >  	struct vsp1_brx *brx = to_brx(subdev);
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> > -	int ret = 0;
> >  
> > -	mutex_lock(&brx->entity.lock);
> > +	guard(mutex)(&brx->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&brx->entity, sd_state, fmt->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	brx_try_format(brx, state, fmt->pad, &fmt->format);
> >  
> > @@ -166,9 +163,7 @@ static int brx_set_format(struct v4l2_subdev *subdev,
> >  		}
> >  	}
> >  
> > -done:
> > -	mutex_unlock(&brx->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int brx_get_selection(struct v4l2_subdev *subdev,
> > @@ -213,7 +208,6 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_rect *compose;
> > -	int ret = 0;
> >  
> >  	if (sel->pad == brx->entity.source_pad)
> >  		return -EINVAL;
> > @@ -221,13 +215,11 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
> >  	if (sel->target != V4L2_SEL_TGT_COMPOSE)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&brx->entity.lock);
> > +	guard(mutex)(&brx->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&brx->entity, sd_state, sel->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	/*
> >  	 * The compose rectangle top left corner must be inside the output
> > @@ -248,9 +240,7 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
> >  	compose = v4l2_subdev_state_get_compose(state, sel->pad);
> >  	*compose = sel->r;
> >  
> > -done:
> > -	mutex_unlock(&brx->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static const struct v4l2_subdev_pad_ops brx_pad_ops = {
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > index 1f431874064d..1439cf7bfb59 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > @@ -920,7 +920,7 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
> >  
> >  	drm_pipe->crc = cfg->crc;
> >  
> > -	mutex_lock(&vsp1->drm->lock);
> > +	guard(mutex)(&vsp1->drm->lock);
> >  
> >  	if (cfg->writeback.pixelformat) {
> >  		const struct vsp1_du_writeback_config *wb_cfg = &cfg->writeback;
> > @@ -929,7 +929,7 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
> >  						       wb_cfg->pixelformat,
> >  						       wb_cfg->pitch);
> >  		if (WARN_ON(ret < 0))
> > -			goto done;
> > +			return;
> >  
> >  		pipe->output->mem.addr[0] = wb_cfg->mem[0];
> >  		pipe->output->mem.addr[1] = wb_cfg->mem[1];
> > @@ -942,9 +942,6 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
> >  	vsp1_pipeline_dump(pipe, "atomic update");
> >  
> >  	vsp1_du_pipeline_configure(pipe);
> > -
> > -done:
> > -	mutex_unlock(&vsp1->drm->lock);
> >  }
> >  EXPORT_SYMBOL_GPL(vsp1_du_atomic_flush);
> >  
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > index 839b75b62ceb..3820ba53b45f 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > @@ -172,9 +172,9 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
> >  	if (!state)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&entity->lock);
> > +	guard(mutex)(&entity->lock);
> > +
> >  	fmt->format = *v4l2_subdev_state_get_format(state, fmt->pad);
> > -	mutex_unlock(&entity->lock);
> >  
> >  	return 0;
> >  }
> > @@ -308,22 +308,19 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
> >  	struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_rect *selection;
> >  	unsigned int i;
> > -	int ret = 0;
> >  
> > -	mutex_lock(&entity->lock);
> > +	guard(mutex)(&entity->lock);
> >  
> >  	state = vsp1_entity_get_state(entity, sd_state, fmt->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	format = v4l2_subdev_state_get_format(state, fmt->pad);
> >  
> >  	if (fmt->pad == entity->source_pad) {
> >  		/* The output format can't be modified. */
> >  		fmt->format = *format;
> > -		goto done;
> > +		return 0;
> >  	}
> >  
> >  	/*
> > @@ -369,9 +366,7 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
> >  	selection->width = format->width;
> >  	selection->height = format->height;
> >  
> > -done:
> > -	mutex_unlock(&entity->lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> > index 3f87a2c9df0e..72f6ef2fdc4f 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> > @@ -196,18 +196,15 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_rect *crop;
> > -	int ret = 0;
> >  
> >  	if (sel->pad != HISTO_PAD_SINK)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&histo->entity.lock);
> > +	guard(mutex)(&histo->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&histo->entity, sd_state, sel->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	switch (sel->target) {
> >  	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > @@ -237,13 +234,10 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
> >  		break;
> >  
> >  	default:
> > -		ret = -EINVAL;
> > -		break;
> > +		return -EINVAL;
> >  	}
> >  
> > -done:
> > -	mutex_unlock(&histo->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int histo_set_crop(struct v4l2_subdev *subdev,
> > @@ -321,29 +315,22 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
> >  {
> >  	struct vsp1_histogram *histo = subdev_to_histo(subdev);
> >  	struct v4l2_subdev_state *state;
> > -	int ret;
> >  
> >  	if (sel->pad != HISTO_PAD_SINK)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&histo->entity.lock);
> > +	guard(mutex)(&histo->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&histo->entity, sd_state, sel->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	if (sel->target == V4L2_SEL_TGT_CROP)
> > -		ret = histo_set_crop(subdev, state, sel);
> > +		return histo_set_crop(subdev, state, sel);
> >  	else if (sel->target == V4L2_SEL_TGT_COMPOSE)
> > -		ret = histo_set_compose(subdev, state, sel);
> > +		return histo_set_compose(subdev, state, sel);
> >  	else
> > -		ret = -EINVAL;
> > -
> > -done:
> > -	mutex_unlock(&histo->entity.lock);
> > -	return ret;
> > +		return -EINVAL;
> >  }
> >  
> >  static int histo_set_format(struct v4l2_subdev *subdev,
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> > index 830e124beb7b..df069c228243 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> > @@ -115,15 +115,12 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
> >  	struct vsp1_hsit *hsit = to_hsit(subdev);
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> > -	int ret = 0;
> >  
> > -	mutex_lock(&hsit->entity.lock);
> > +	guard(mutex)(&hsit->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&hsit->entity, sd_state, fmt->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	format = v4l2_subdev_state_get_format(state, fmt->pad);
> >  
> > @@ -133,7 +130,7 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
> >  		 * modified.
> >  		 */
> >  		fmt->format = *format;
> > -		goto done;
> > +		return 0;
> >  	}
> >  
> >  	format->code = hsit->inverse ? MEDIA_BUS_FMT_AHSV8888_1X32
> > @@ -161,9 +158,7 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
> >  
> >  	vsp1_entity_adjust_color_space(format);
> >  
> > -done:
> > -	mutex_unlock(&hsit->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static const struct v4l2_subdev_pad_ops hsit_pad_ops = {
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > index c72518b29f84..ced01870acd6 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > @@ -116,15 +116,12 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
> >  	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> > -	int ret = 0;
> >  
> > -	mutex_lock(&rwpf->entity.lock);
> > +	guard(mutex)(&rwpf->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&rwpf->entity, sd_state, fmt->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	/* Default to YUV if the requested format is not supported. */
> >  	if (fmt->format.code != MEDIA_BUS_FMT_ARGB8888_1X32 &&
> > @@ -174,7 +171,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
> >  		fmt->format = *format;
> >  		fmt->format.flags = flags;
> >  
> > -		goto done;
> > +		return 0;
> >  	}
> >  
> >  	format->code = fmt->format.code;
> > @@ -213,9 +210,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
> >  		format->height = fmt->format.width;
> >  	}
> >  
> > -done:
> > -	mutex_unlock(&rwpf->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
> > @@ -225,7 +220,6 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
> >  	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> > -	int ret = 0;
> >  
> >  	/*
> >  	 * Cropping is only supported on the RPF and is implemented on the sink
> > @@ -234,13 +228,11 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
> >  	if (rwpf->entity.type == VSP1_ENTITY_WPF || sel->pad != RWPF_PAD_SINK)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&rwpf->entity.lock);
> > +	guard(mutex)(&rwpf->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&rwpf->entity, sd_state, sel->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	switch (sel->target) {
> >  	case V4L2_SEL_TGT_CROP:
> > @@ -256,13 +248,10 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
> >  		break;
> >  
> >  	default:
> > -		ret = -EINVAL;
> > -		break;
> > +		return -EINVAL;
> >  	}
> >  
> > -done:
> > -	mutex_unlock(&rwpf->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> > @@ -275,7 +264,6 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_rect *crop;
> > -	int ret = 0;
> >  
> >  	/*
> >  	 * Cropping is only supported on the RPF and is implemented on the sink
> > @@ -287,13 +275,11 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> >  	if (sel->target != V4L2_SEL_TGT_CROP)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&rwpf->entity.lock);
> > +	guard(mutex)(&rwpf->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&rwpf->entity, sd_state, sel->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	/* Make sure the crop rectangle is entirely contained in the image. */
> >  	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
> > @@ -342,9 +328,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> >  	format->width = crop->width;
> >  	format->height = crop->height;
> >  
> > -done:
> > -	mutex_unlock(&rwpf->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > index 94149da0c900..3fd9fde5c724 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > @@ -216,15 +216,12 @@ static int sru_set_format(struct v4l2_subdev *subdev,
> >  	struct vsp1_sru *sru = to_sru(subdev);
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> > -	int ret = 0;
> >  
> > -	mutex_lock(&sru->entity.lock);
> > +	guard(mutex)(&sru->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&sru->entity, sd_state, fmt->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	sru_try_format(sru, state, fmt->pad, &fmt->format);
> >  
> > @@ -239,9 +236,7 @@ static int sru_set_format(struct v4l2_subdev *subdev,
> >  		sru_try_format(sru, state, SRU_PAD_SOURCE, format);
> >  	}
> >  
> > -done:
> > -	mutex_unlock(&sru->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static const struct v4l2_subdev_pad_ops sru_pad_ops = {
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > index dd4722315c56..9f7bb112929e 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > @@ -199,15 +199,12 @@ static int uds_set_format(struct v4l2_subdev *subdev,
> >  	struct vsp1_uds *uds = to_uds(subdev);
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> > -	int ret = 0;
> >  
> > -	mutex_lock(&uds->entity.lock);
> > +	guard(mutex)(&uds->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&uds->entity, sd_state, fmt->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	uds_try_format(uds, state, fmt->pad, &fmt->format);
> >  
> > @@ -222,9 +219,7 @@ static int uds_set_format(struct v4l2_subdev *subdev,
> >  		uds_try_format(uds, state, UDS_PAD_SOURCE, format);
> >  	}
> >  
> > -done:
> > -	mutex_unlock(&uds->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  /* -----------------------------------------------------------------------------
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> > index 3aefe5c9d421..52dbfe58a70d 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> > @@ -60,18 +60,15 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
> >  	struct vsp1_uif *uif = to_uif(subdev);
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> > -	int ret = 0;
> >  
> >  	if (sel->pad != UIF_PAD_SINK)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&uif->entity.lock);
> > +	guard(mutex)(&uif->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&uif->entity, sd_state, sel->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	switch (sel->target) {
> >  	case V4L2_SEL_TGT_CROP_BOUNDS:
> > @@ -88,13 +85,10 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
> >  		break;
> >  
> >  	default:
> > -		ret = -EINVAL;
> > -		break;
> > +		return -EINVAL;
> >  	}
> >  
> > -done:
> > -	mutex_unlock(&uif->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int uif_set_selection(struct v4l2_subdev *subdev,
> > @@ -105,19 +99,16 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_rect *selection;
> > -	int ret = 0;
> >  
> >  	if (sel->pad != UIF_PAD_SINK ||
> >  	    sel->target != V4L2_SEL_TGT_CROP)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&uif->entity.lock);
> > +	guard(mutex)(&uif->entity.lock);
> >  
> >  	state = vsp1_entity_get_state(&uif->entity, sd_state, sel->which);
> > -	if (!state) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +	if (!state)
> > +		return -EINVAL;
> >  
> >  	/* The crop rectangle must be inside the input frame. */
> >  	format = v4l2_subdev_state_get_format(state, UIF_PAD_SINK);
> > @@ -133,9 +124,7 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
> >  	selection = v4l2_subdev_state_get_crop(state, sel->pad);
> >  	*selection = sel->r;
> >  
> > -done:
> > -	mutex_unlock(&uif->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  /* -----------------------------------------------------------------------------
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > index a8db94bdb670..4cf2cc370416 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > @@ -590,9 +590,9 @@ static void vsp1_video_pipeline_put(struct vsp1_pipeline *pipe)
> >  {
> >  	struct media_device *mdev = &pipe->output->entity.vsp1->media_dev;
> >  
> > -	mutex_lock(&mdev->graph_mutex);
> > +	guard(mutex)(&mdev->graph_mutex);
> > +
> >  	kref_put(&pipe->kref, vsp1_video_pipeline_release);
> > -	mutex_unlock(&mdev->graph_mutex);
> >  }
> >  
> >  /* -----------------------------------------------------------------------------
> > @@ -933,9 +933,9 @@ vsp1_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
> >  	if (format->type != video->queue.type)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&video->lock);
> > +	guard(mutex)(&video->lock);
> > +
> >  	format->fmt.pix_mp = video->rwpf->format;
> > -	mutex_unlock(&video->lock);
> >  
> >  	return 0;
> >  }
> > @@ -967,19 +967,15 @@ vsp1_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	mutex_lock(&video->lock);
> > +	guard(mutex)(&video->lock);
> >  
> > -	if (vb2_is_busy(&video->queue)) {
> > -		ret = -EBUSY;
> > -		goto done;
> > -	}
> > +	if (vb2_is_busy(&video->queue))
> > +		return -EBUSY;
> >  
> >  	video->rwpf->format = format->fmt.pix_mp;
> >  	video->rwpf->fmtinfo = info;
> >  
> > -done:
> > -	mutex_unlock(&video->lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > index cd6c5592221b..e7ed3c8e9e90 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > @@ -47,7 +47,6 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
> >  	struct v4l2_mbus_framefmt *sink_format;
> >  	struct v4l2_mbus_framefmt *source_format;
> >  	bool rotate;
> > -	int ret = 0;
> >  
> >  	/*
> >  	 * Only consider the 0°/180° from/to 90°/270° modifications, the rest
> > @@ -58,19 +57,17 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
> >  		return 0;
> >  
> >  	/* Changing rotation isn't allowed when buffers are allocated. */
> > -	mutex_lock(&video->lock);
> > +	guard(mutex)(&video->lock);
> >  
> > -	if (vb2_is_busy(&video->queue)) {
> > -		ret = -EBUSY;
> > -		goto done;
> > -	}
> > +	if (vb2_is_busy(&video->queue))
> > +		return -EBUSY;
> >  
> >  	sink_format = v4l2_subdev_state_get_format(wpf->entity.state,
> >  						   RWPF_PAD_SINK);
> >  	source_format = v4l2_subdev_state_get_format(wpf->entity.state,
> >  						     RWPF_PAD_SOURCE);
> >  
> > -	mutex_lock(&wpf->entity.lock);
> > +	guard(mutex)(&wpf->entity.lock);
> >  
> >  	if (rotate) {
> >  		source_format->width = sink_format->height;
> > @@ -82,11 +79,7 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
> >  
> >  	wpf->flip.rotate = rotate;
> >  
> > -	mutex_unlock(&wpf->entity.lock);
> > -
> > -done:
> > -	mutex_unlock(&video->lock);
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int vsp1_wpf_s_ctrl(struct v4l2_ctrl *ctrl)

-- 
Regards,

Laurent Pinchart

