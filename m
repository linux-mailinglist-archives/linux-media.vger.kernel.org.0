Return-Path: <linux-media+bounces-18195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBD89768FA
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 14:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C9231C2373B
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 12:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D082E1A264F;
	Thu, 12 Sep 2024 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z5vEJsoI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8AF1A0BD3;
	Thu, 12 Sep 2024 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143534; cv=none; b=PWdSTrZcduVoDqEBAU2YdbEPXCiW4kx3PedK+PChjbmbGcAMYsL3ptZzxpXJ4e9N2aCqCg1sGML4Yk6fcJq3f2mUJP/zPPtNXQoQn5c0L7/uSe7Bwevy/bfXSvRQ/dOK/7P2cyoNAOoW0WJMMkYw5A3TKp++E2okxJWrHSqWwEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143534; c=relaxed/simple;
	bh=HSmMdjWZwH6agyr4AYXxiM7TnFY6iEgDh//t6A9LYiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjxfT7ayN1/lBQP1pDJzXhj7zuARuWe5bFz2a4DIv33ZV+NkZLT8WE2L3Zmq0i2qNhT4cQr9uetAL34Opksc/mb3XaDUT+GXbuXY4AUaCvLfRznk3+UJihXToFoGJIqhRtCq4dwiLojaaZYpukxV2RRqFiDCGt8VnkTuDSGqbds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z5vEJsoI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A86C5B3;
	Thu, 12 Sep 2024 14:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726143452;
	bh=HSmMdjWZwH6agyr4AYXxiM7TnFY6iEgDh//t6A9LYiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5vEJsoIVZMy4Veu9xeHcIWEl2qfqsFLgIPVryQ24/pCtK8j5h+htl054xCLtH7z1
	 VscBw9NeUO7T/kljTIfH53IoEg7ofB7AdiT6cwwBngk6gwdP/95wyljt2FtVQaOvlq
	 Pw0HDAUrYi75sEq6SrncvAhogb5vQsEmD3Dc6TTs=
Date: Thu, 12 Sep 2024 15:18:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, linuxfancy@googlegroups.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: max96714: add HAS_EVENTS subdev flag
Message-ID: <20240912121816.GC25276@pendragon.ideasonboard.com>
References: <20240910134428.795273-1-tomm.merciai@gmail.com>
 <20240910134428.795273-2-tomm.merciai@gmail.com>
 <20240912104409.GA25276@pendragon.ideasonboard.com>
 <ZuLMUaxn/oTw5dco@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20240912120510.GB25276@pendragon.ideasonboard.com>
 <ZuLbPMluhB4NL7ty@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZuLbPMluhB4NL7ty@kekkonen.localdomain>

On Thu, Sep 12, 2024 at 12:14:52PM +0000, Sakari Ailus wrote:
> On Thu, Sep 12, 2024 at 03:05:10PM +0300, Laurent Pinchart wrote:
> > On Thu, Sep 12, 2024 at 01:11:13PM +0200, Tommaso Merciai wrote:
> > > On Thu, Sep 12, 2024 at 01:44:09PM +0300, Laurent Pinchart wrote:
> > > > On Tue, Sep 10, 2024 at 03:44:27PM +0200, Tommaso Merciai wrote:
> > > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > > userspace has to be able to subscribe to control events so that it is
> > > > > notified when the control changes value. Add missing HAS_EVENTS flag.
> > > > 
> > > > How is this supposed to work, given that the driver doesn't implement
> > > > .subscribe_event() ?
> > > 
> > > You are completely right, sorry.
> > > I think in both cases I'm missing:
> > > 
> > > diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> > > index 94b1bc000e48..2257b6b807ea 100644
> > > --- a/drivers/media/i2c/max96714.c
> > > +++ b/drivers/media/i2c/max96714.c
> > > @@ -17,6 +17,7 @@
> > > 
> > >  #include <media/v4l2-cci.h>
> > >  #include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-event.h>
> > >  #include <media/v4l2-fwnode.h>
> > >  #include <media/v4l2-subdev.h>
> > > 
> > > @@ -488,6 +489,8 @@ static int max96714_log_status(struct v4l2_subdev *sd)
> > > 
> > >  static const struct v4l2_subdev_core_ops max96714_subdev_core_ops = {
> > >         .log_status = max96714_log_status,
> > > +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > >  };
> > > 
> > >  static const struct v4l2_subdev_video_ops max96714_video_ops = {
> > > 
> > > Like you suggest. Or I'm wrong?
> > 
> > That looks better :-)
> > 
> > Out of curiosity, what's your use case for control events ?
> 
> I'm not sure if there's a use case, however control event should be
> supported when a driver supports controls.

Not disputing that. That's why I asked "out of curiosity".

-- 
Regards,

Laurent Pinchart

