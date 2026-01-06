Return-Path: <linux-media+bounces-50054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C11CFA134
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 19:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A8433170922
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 17:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2369427FB1B;
	Tue,  6 Jan 2026 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T8qn/2I5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E652222AC;
	Tue,  6 Jan 2026 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720670; cv=none; b=BclnCP7vR2xgovtfO+4EXv2InZnpY0zJAv3EZyBIHufmccao+AMz4w/x4YbryjrfN+pZBRrn4HiVbwhYHMbCgbadvS6FtVw/tzegQvlUkXolyT/Ljc5XX3mnmzfirtCZhBs8BdKRF+5NYYe4wdFaoTEbgmoADyASIKFx/GVPyxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720670; c=relaxed/simple;
	bh=3v++UFst2p6Qu4SBsoWkKb20KSjnt+qXHGn4wr6KhNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nq4ZlYQcvJrXuD/fnsFmvrLH7mj/6UcFqMsF8IBKGw0FOopdfndqgApki8eEIi/8joWa3updtVwkgfLPkhE6+YVQSAflN2UNOunQ/GA4VVhSrv7nMv2qRN8h/Q2Tfx9+LWF41bOYwBVEXax1LjqQ5gJ+/TOfaK8hj/5JUdAokA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T8qn/2I5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9634A78E;
	Tue,  6 Jan 2026 18:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767720644;
	bh=3v++UFst2p6Qu4SBsoWkKb20KSjnt+qXHGn4wr6KhNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8qn/2I5xpucAahVTekK9Oqr/rqjZ2KA1ZhDl0x/YwS0M9aJqkd/2tFt1aiiq0yn/
	 3/xNzJasGwH7Dfh1bSXg69eeYE+MjnLuQMsQq9bUFMutBro4MWseRZ4x2p6E3DXrPy
	 seSwI/tmOgmJJbMQ3sQmU9FbkgImfarsIK8wuKvU=
Date: Tue, 6 Jan 2026 19:30:47 +0200
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
Message-ID: <20260106173047.GG26157@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-2-65af34d04fd8@ideasonboard.com>
 <f4e0b1f13ee54d88d1035828af548f5cf3a25c16.camel@ndufresne.ca>
 <20260106004206.GK10026@pendragon.ideasonboard.com>
 <2dbb2c41422cb4dbc8c3692646aeaf70c4d87df0.camel@ndufresne.ca>
 <176770977089.12184.13455944501335843394@localhost>
 <542f97c1b2dee066f9961b508958f7397faaaf8f.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <542f97c1b2dee066f9961b508958f7397faaaf8f.camel@ndufresne.ca>

On Tue, Jan 06, 2026 at 10:27:31AM -0500, Nicolas Dufresne wrote:
> Le mardi 06 janvier 2026 à 15:29 +0100, Stefan Klug a écrit :
> > Quoting Nicolas Dufresne (2026-01-06 14:47:59)
> > > Le mardi 06 janvier 2026 à 02:42 +0200, Laurent Pinchart a écrit :
> > > > On Mon, Jan 05, 2026 at 01:58:25PM -0500, Nicolas Dufresne wrote:
> > > > > Le lundi 05 janvier 2026 à 12:35 +0100, Stefan Klug a écrit :
> > > > > > Implement dynamic vertex map updates by handling the
> > > > > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streaming. This
> > > > > > allows to implement features like dynamic zoom, pan, rotate and dewarp.
> > > > > > 
> > > > > > To stay compatible with the old version, updates of
> > > > > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during streaming
> > > > > > when requests are not used. Print a corresponding warning once.
> > > > > > 
> > > > > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > > > > ---
> > > > > >  drivers/media/platform/nxp/dw100/dw100.c | 27 +++++++++++++++++++++------
> > > > > > 
> > > 
> > > [...]
> > > 
> > > > > >   dev_dbg(&ctx->dw_dev->pdev->dev,
> > > > > >           "%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n",
> > > > > > @@ -351,6 +355,7 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
> > > > > >   switch (ctrl->id) {
> > > > > >   case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
> > > > > >           ctx->user_map_is_set = true;
> > > > > > +         ctx->user_map_needs_update = true;
> > > > > 
> > > > > This will be called before the new mapping is applied by
> > > > > v4l2_ctrl_request_complete(), and then may be cleared too soon if you queue
> > > > > depth is high enough.
> > > > 
> > > > v4l2_ctrl_request_complete() does not apply a mapping, what am I missing
> > > > ?
> > > 
> > > Sorry for my confusion, after reading back, you are correct, this is called
> > > v4l2_ctrl_request_setup() inside the device_run() function. You can dismiss the
> > > bit about user_map_needs_update in my review (the paragraph below).
> > 
> > That means nothing has to change here, right?
> 
> Correct.
> 
> > > > > Instead, you should check in the request for the presence of
> > > > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP to optimize the updates. Yo may still
> > > > > set this to true if if there is no request, in the case you also wanted to
> > > > > change the original behaviour of only updating that vertex on streamon, but I
> > > > > don't see much point though.
> > > > > 
> > > > > >           break;
> > > > > >   }
> > > > > >  
> > > > > > @@ -405,6 +410,7 @@ static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
> > > > > >   }
> > > > > >  
> > > > > >   ctx->user_map_is_set = false;
> > > > > > + ctx->user_map_needs_update = true;
> > > > > >  }
> > > > > >  
> > > > > >  static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops = {
> > > > > > @@ -1482,6 +1488,15 @@ static void dw100_device_run(void *priv)
> > > > > >   v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> > > > > >                           &ctx->hdl);
> > > > > >  
> > > > > > + if (src_buf->vb2_buf.req_obj.req) {
> > > > > > +         dw100_update_mapping(ctx);
> > > > > > + } else if (ctx->user_map_needs_update && !ctx->warned_dynamic_update) {
> > > > > > +         ctx->warned_dynamic_update = true;
> > > > > > +         dev_warn(&ctx->dw_dev->pdev->dev,
> > > > > > +                 "V4L2 requests are required to update the vertex map dynamically"
> > > > > 
> > > > > Do you know about dev_warn_once() ? That being said, the driver is usable
> > > > > without requests and a static vertex (and must stay this way to not break the
> > > > > ABI). I don't think you should warn here at all.
> > 
> > My idea was that I'd like to see the warning once per context and not
> > once per boot. Afaik I can't use dev_warn_once() for that.
> 
> I didn't catch this detail (commit comment welcome), fair enough if that's the
> direction we are heading. Again, I don't understand why we don't just apply that
> on next device_run in "legacy" mode.

Because to be really useful, dynamic mode requires synchronization with
buffers. Sure, it's possible to implement a non-synchronized legacy mode
and let userspace handle synchronization, but that's suboptimal as it
will require never queuing more than one buffer to the kernel at a time.
I don't think we should implement APIs that let userspace do things in
the wrong way when it's possible and simple enough to do them right.
That would add code to the kernel that would increase the driver
complexity with no real upside.

> > > > Applications should move to using requests. We'll do so in libcamera
> > > > unconditionally. I don't expect many other direct users, so warning that
> > > > the mapping won't be applied when an application sets the corresponding
> > > > control during streaming without using requests seems fair to me. It
> > > > will help debugging issues.
> > > 
> > > It is also a miss-use of dev_warn which is meant to indicate a problem with the
> > > driver or the hardware. The V4L2 core uses dev_dbg() or customer log level for
> > > that in general. Also, don't re-implement _once() variants with
> > > warned_dynamic_update please. Personally, I would just let the out-of request
> > > change the control on the next device_run(), even if that means its out of sync.
> > 
> > But then you end up with potentially difficult to debug issues, because
> > users would not know that they should use requests. Not warning (or
> > dev_dbg) has the same effect from my point of view, because users just
> > see a device not working as expected. Is a customer log level the
> > solution?
> 
> Custom level are hard to discover for sure, but the rules around dev_warn()
> aren't mine. We can perhaps makes an argument that the driver is broken, but why
> don't we fix it to match the V4L2 spec is still unknown, specially that its an
> easy fix match the V4L2 spec (even if in practice, this is not quite usable).
> Normally everything else we add above the V4L2 spec, specially stuff using
> request get a domain specific spec. With that in hand, we could create better
> rules, but otherwise I don't have much foundation to make a good call here.
> 
> > > > > > +         );
> > > > > > + }
> > > > > > +
> > > > > >   v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> > > > > >                              &ctx->hdl);

-- 
Regards,

Laurent Pinchart

