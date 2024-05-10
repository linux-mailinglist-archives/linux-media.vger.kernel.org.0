Return-Path: <linux-media+bounces-11274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ABF8C1A49
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 02:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2295B21699
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB6CD27D;
	Fri, 10 May 2024 00:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eb1R7Weg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0FA139D
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 00:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715299744; cv=none; b=QHrY6kdxqiPpRKvpW3pwCLHtoUWcZL95ibxb7H2Bu/0ZVMs2Oyasfs4kcG9hBMp1ONvXZk5FgAKY3pTP9BuEu1DFSapX2KOVtw7nHyw4Wg18rOQTn1pATozIxWP9NI3KymNI0+tbKnvfJUfEOOjKfVvfgLuNtuIFTnQqLYDSHq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715299744; c=relaxed/simple;
	bh=9WevUWM+NDfeYQ9b1SAu1LdCw6V9VJA/u4EnakhAK08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaYKCf4lFmuyyGuJA8F+ayKJO5odrbw7b/qjrUKT3JZX3UtbmfOpzjtzMrlRt7LnDsp/CIM3c9WqKBL4ySjxgQQ1ttJE+muqB8/TuEtNiHZhJWjGZnQ9WggVKVSJtpBYNuw3RaVe6Ib4U4UJRgnCQ6Wge+5PsEVoDaGWD2+fYMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eb1R7Weg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7151397;
	Fri, 10 May 2024 02:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715299737;
	bh=9WevUWM+NDfeYQ9b1SAu1LdCw6V9VJA/u4EnakhAK08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eb1R7WegdYWLoVu5bbUIPBmmHLUm0KKbL0H2V9M3Vsuy78UUjkk+L7mmMWxHihUMW
	 FOiC3kWlrfZaLhTYMEgek54vUTvmCU3j5j1KyjgtjGWaVE84SE9bQbiYxyg+xCS2RC
	 iG+d+IGD0jOZqL85e55ydYz87dP0hbb77cUDBgu8=
Date: Fri, 10 May 2024 03:08:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH for v6.10] media: v4l2-ctrls: drop unnecessary locking
 that caused potential deadlock
Message-ID: <20240510000851.GB30247@pendragon.ideasonboard.com>
References: <25daeee8-f7ef-4595-b2e9-7e4d80ce3f1d@xs4all.nl>
 <20240510000223.GA30247@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240510000223.GA30247@pendragon.ideasonboard.com>

Another comment. The subject line states v6.10, but this is a v6.9
regression. How about reverting the offending commit for v6.9, and
working on a better implementation for v6.11 ?

On Fri, May 10, 2024 at 03:02:25AM +0300, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Wed, May 08, 2024 at 11:11:01AM +0200, Hans Verkuil wrote:
> > When logging the control values through VIDIOC_LOG_STATUS you could
> > get into a potential deadlock situation in the vivid driver:
> > 
> > [Wed May  8 10:02:06 2024]  Possible unsafe locking scenario:
> > 
> > [Wed May  8 10:02:06 2024]        CPU0                    CPU1
> > [Wed May  8 10:02:06 2024]        ----                    ----
> > [Wed May  8 10:02:06 2024]   lock(vivid_ctrls:1620:(hdl_vid_cap)->_lock);
> > [Wed May  8 10:02:06 2024]                                lock(vivid_ctrls:1608:(hdl_user_vid)->_lock);
> > [Wed May  8 10:02:06 2024]                                lock(vivid_ctrls:1620:(hdl_vid_cap)->_lock);
> > [Wed May  8 10:02:06 2024]   lock(vivid_ctrls:1608:(hdl_user_vid)->_lock);
> 
> This looks scary. How was this triggered, can you provide the full
> lockdep report ? I'm worried there could be other scenarios where the
> locks could be taken in different orders.
> 
> > That's because both the main control handler was locked and the
> > inner control handler containing the control that you want to log.
> > 
> > In this particular case there is no need to lock the inner control
> > handler since it is guaranteed that that handler won't delete controls
> > unexpectedly.
> 
> All the v4l2_ctrl_type_ops operations currently rely on the control
> handler being locked when they're called. I don't like the idea of
> lifting that requirement without an audit of the implementations. We
> should then clearly document that the log operation can be called
> without the lock held.
> 
> > 
> > Fixes: 9801b5b28c692 ("media: v4l2-ctrls: show all owned controls in log_status")
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index c59dd691f79f6..4e6748bd419cf 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -2518,11 +2518,7 @@ static void log_ctrl(const struct v4l2_ctrl_handler *hdl,
> 
> You can also drop the hdl argument to this function, which was
> introduced by the commit referenced by Fixes:.
> 
> > 
> >  	pr_info("%s%s%s: ", prefix, colon, ctrl->name);
> > 
> > -	if (ctrl->handler != hdl)
> > -		v4l2_ctrl_lock(ctrl);
> >  	ctrl->type_ops->log(ctrl);
> > -	if (ctrl->handler != hdl)
> > -		v4l2_ctrl_unlock(ctrl);
> > 
> >  	if (ctrl->flags & (V4L2_CTRL_FLAG_INACTIVE |
> >  			   V4L2_CTRL_FLAG_GRABBED |

-- 
Regards,

Laurent Pinchart

