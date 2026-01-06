Return-Path: <linux-media+bounces-50035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C964CF8D49
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 15:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 072D3304E169
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 14:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F3531354D;
	Tue,  6 Jan 2026 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AUV7zBoi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6008E313E07;
	Tue,  6 Jan 2026 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710164; cv=none; b=RtRizGLojq0c7SduiXQuaXcABUaWT+PrI+ucuUCHGtghx38k/RsSqS8luyxoOspvpLaSqq0JsSANKwrORvJWR9m41kn5ZfgyDI0dfAksiuQU9HwTycH3fyWSIQot5XahpMrlk5AdGhoZouZWWWyuCeokXxrGfPVSM/MV5oR8vYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710164; c=relaxed/simple;
	bh=STYwl8CAO0mJrOrdnnaw2qLoeo65r1gd5bnfbPtwWL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKSZN/TCnFN4AyDLduSvnETr0sA03GCprVX9J/f40GvyQbR72NFfTBQXgkVdGFr48V3CvRq8WA7HiT+gKvO6/MV9KgZytQQyPwg32QbRNk4vy+uEBgwSyyk9ANfS5V5xBM9YJg9LIEru0PREKEkP0JihcZKaG7SJxsSsyfujGSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AUV7zBoi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 04AD9129;
	Tue,  6 Jan 2026 15:35:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767710137;
	bh=STYwl8CAO0mJrOrdnnaw2qLoeo65r1gd5bnfbPtwWL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUV7zBoiVb0c8wIcGyrfzymIPaMimv6WcRryXQhSoUwZt5aR+hmWiBaYE9lPTXzGw
	 122BH5CJLJ6k3Q3oWrFkMG8v5Z935DHAmP6hVNkAoVnS5Oq9YnmPW2cM2rrsBZwOMU
	 auJsKN8JyGTinS78ANR4DkCi5DrRalof3kq4Njak=
Date: Tue, 6 Jan 2026 16:35:39 +0200
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
Message-ID: <20260106143539.GA26157@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-2-65af34d04fd8@ideasonboard.com>
 <f4e0b1f13ee54d88d1035828af548f5cf3a25c16.camel@ndufresne.ca>
 <20260106004206.GK10026@pendragon.ideasonboard.com>
 <2dbb2c41422cb4dbc8c3692646aeaf70c4d87df0.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2dbb2c41422cb4dbc8c3692646aeaf70c4d87df0.camel@ndufresne.ca>

Hi Nicolas,

On Tue, Jan 06, 2026 at 08:47:59AM -0500, Nicolas Dufresne wrote:
> Le mardi 06 janvier 2026 à 02:42 +0200, Laurent Pinchart a écrit :
> > On Mon, Jan 05, 2026 at 01:58:25PM -0500, Nicolas Dufresne wrote:
> > > Le lundi 05 janvier 2026 à 12:35 +0100, Stefan Klug a écrit :
> > > > Implement dynamic vertex map updates by handling the
> > > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streaming. This
> > > > allows to implement features like dynamic zoom, pan, rotate and dewarp.
> > > > 
> > > > To stay compatible with the old version, updates of
> > > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during streaming
> > > > when requests are not used. Print a corresponding warning once.
> > > > 
> > > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > > ---
> > > >  drivers/media/platform/nxp/dw100/dw100.c | 27 +++++++++++++++++++++------
> > > > 
> 
> [...]
> 
> > > >  	dev_dbg(&ctx->dw_dev->pdev->dev,
> > > >  		"%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n",
> > > > @@ -351,6 +355,7 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
> > > >  	switch (ctrl->id) {
> > > >  	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
> > > >  		ctx->user_map_is_set = true;
> > > > +		ctx->user_map_needs_update = true;
> > > 
> > > This will be called before the new mapping is applied by
> > > v4l2_ctrl_request_complete(), and then may be cleared too soon if you queue
> > > depth is high enough.
> > 
> > v4l2_ctrl_request_complete() does not apply a mapping, what am I missing
> > ?
> 
> Sorry for my confusion, after reading back, you are correct, this is called
> v4l2_ctrl_request_setup() inside the device_run() function. You can dismiss the
> bit about user_map_needs_update in my review (the paragraph below).

Thanks for the clarification.

> > > Instead, you should check in the request for the presence of
> > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP to optimize the updates. Yo may still
> > > set this to true if if there is no request, in the case you also wanted to
> > > change the original behaviour of only updating that vertex on streamon, but I
> > > don't see much point though.
> > > 
> > > >  		break;
> > > >  	}
> > > >  
> > > > @@ -405,6 +410,7 @@ static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
> > > >  	}
> > > >  
> > > >  	ctx->user_map_is_set = false;
> > > > +	ctx->user_map_needs_update = true;
> > > >  }
> > > >  
> > > >  static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops = {
> > > > @@ -1482,6 +1488,15 @@ static void dw100_device_run(void *priv)
> > > >  	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> > > >  				&ctx->hdl);
> > > >  
> > > > +	if (src_buf->vb2_buf.req_obj.req) {
> > > > +		dw100_update_mapping(ctx);
> > > > +	} else if (ctx->user_map_needs_update && !ctx->warned_dynamic_update) {
> > > > +		ctx->warned_dynamic_update = true;
> > > > +		dev_warn(&ctx->dw_dev->pdev->dev,
> > > > +			"V4L2 requests are required to update the vertex map dynamically"
> > > 
> > > Do you know about dev_warn_once() ? That being said, the driver is usable
> > > without requests and a static vertex (and must stay this way to not break the
> > > ABI). I don't think you should warn here at all.
> > 
> > Applications should move to using requests. We'll do so in libcamera
> > unconditionally. I don't expect many other direct users, so warning that
> > the mapping won't be applied when an application sets the corresponding
> > control during streaming without using requests seems fair to me. It
> > will help debugging issues.
> 
> It is also a miss-use of dev_warn which is meant to indicate a problem with the
> driver or the hardware. The V4L2 core uses dev_dbg() or customer log level for
> that in general. Also, don't re-implement _once() variants with
> warned_dynamic_update please.

Agreed about the _once() variant. That will move to printing the message
once per context to once globally, but I think it's fine given the
purpose of warning application developers of incorrect usage.

> Personally, I would just let the out-of request
> change the control on the next device_run(), even if that means its out of sync.

So you mean changing the current behaviour of applying the control at
next streamon to next .device_run() even if it means synchronization
between the control and the frame being processed can't be guaranteed ?
I don't think that's a good idea, synchronization is a key requirement.
We carried a local kernel patch that would do just that, and to make it
usable we had to ensure in libcamera that we never queued more than one
buffer at a time, to guarantee synchronous behaviour. I think
applications should use the request API for dynamic updates of the
dewarp map.

> > > > +		);
> > > > +	}
> > > > +
> > > >  	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> > > >  				   &ctx->hdl);
> > > >  

-- 
Regards,

Laurent Pinchart

