Return-Path: <linux-media+bounces-18194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DAD9768DC
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 14:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 749CF282F70
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 12:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179511A2657;
	Thu, 12 Sep 2024 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BguL3c3R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64E1A2567;
	Thu, 12 Sep 2024 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143299; cv=none; b=lLyAyh5pN45D5lwdfs8D/scK6W5VXD03M97NEuBwm5VlyWs3TB6pUE4wcrEO6fJoHgnk0vVVIogkTxGsqrADt7zZoSfWmEoA2rK+xFzaM4uE7Qgbt6GYuT0x7cyPh40nz5MJFqa1gz5eDA51Arq8xSDiEVJQ+kX0GWieIF0Q064=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143299; c=relaxed/simple;
	bh=bFOFsSQEk5ZqaizgNm0YjuWjwI52R6tKqjo5RfDa6hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNsM/ryRgQ9F0zmMAZraRmcbfrXHh6FAcYLyhhn2W6BMHb7K4NpgO44/jton9oz1tPL4d1XB+4u2ZtcmDeevh76soVGAZAolVVjcsPHUGHztx186Ktn3mZL44O+dPFkdaIXfa7YmSngUAg+meKrANIGJlDttoBW2ZnvQasjBuyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BguL3c3R; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726143298; x=1757679298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bFOFsSQEk5ZqaizgNm0YjuWjwI52R6tKqjo5RfDa6hY=;
  b=BguL3c3RFMhW7sroGQsBXymT8BstdwVQy76HDdA8/Ngg5a+/FwOQIdfz
   Q2TJvi9lp5z0wUyfCPOGFPEi1lAPbEjeFrXwwxr47toHLaWuFbqCmIISc
   62Nh7WCZrecVYoYUmB264wZGCayh42xqsZBZwCdweRwpvnRqkp8YTC1wv
   QEnevEKT53ky40OwmJ3KXWPQktBLeTbqE99IXuwO4+hGF/D6BJHlI5Wjq
   1fHA6iQUfifWsDAIsYYEwgtJ9IhT3dDNpyTNDWltB4ie5pZr+oFrI+MDf
   lK3ftBVyhtgT+ffJFKoNBau3UFTatP6ASw2uAr1fhX4QJoq9j6p2aOThv
   g==;
X-CSE-ConnectionGUID: EC5BsLK2STKAhcgqkSXXmQ==
X-CSE-MsgGUID: CL9/OsPPTEOrrqk0EIm2nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36129045"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="36129045"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:14:57 -0700
X-CSE-ConnectionGUID: 7G5nBN0xSly0OHoXcdqvsQ==
X-CSE-MsgGUID: VeKXwzuNR/2lB0rY2t0G2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="72477476"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:14:56 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AA16A11F7DC;
	Thu, 12 Sep 2024 15:14:52 +0300 (EEST)
Date: Thu, 12 Sep 2024 12:14:52 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, linuxfancy@googlegroups.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: max96714: add HAS_EVENTS subdev flag
Message-ID: <ZuLbPMluhB4NL7ty@kekkonen.localdomain>
References: <20240910134428.795273-1-tomm.merciai@gmail.com>
 <20240910134428.795273-2-tomm.merciai@gmail.com>
 <20240912104409.GA25276@pendragon.ideasonboard.com>
 <ZuLMUaxn/oTw5dco@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20240912120510.GB25276@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912120510.GB25276@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Sep 12, 2024 at 03:05:10PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 12, 2024 at 01:11:13PM +0200, Tommaso Merciai wrote:
> > Hi Laurent,
> > 
> > On Thu, Sep 12, 2024 at 01:44:09PM +0300, Laurent Pinchart wrote:
> > > Hi Tommaso,
> > > 
> > > On Tue, Sep 10, 2024 at 03:44:27PM +0200, Tommaso Merciai wrote:
> > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > userspace has to be able to subscribe to control events so that it is
> > > > notified when the control changes value. Add missing HAS_EVENTS flag.
> > > 
> > > How is this supposed to work, given that the driver doesn't implement
> > > .subscribe_event() ?
> > 
> > You are completely right, sorry.
> > I think in both cases I'm missing:
> > 
> > diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> > index 94b1bc000e48..2257b6b807ea 100644
> > --- a/drivers/media/i2c/max96714.c
> > +++ b/drivers/media/i2c/max96714.c
> > @@ -17,6 +17,7 @@
> > 
> >  #include <media/v4l2-cci.h>
> >  #include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-subdev.h>
> > 
> > @@ -488,6 +489,8 @@ static int max96714_log_status(struct v4l2_subdev *sd)
> > 
> >  static const struct v4l2_subdev_core_ops max96714_subdev_core_ops = {
> >         .log_status = max96714_log_status,
> > +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> >  };
> > 
> >  static const struct v4l2_subdev_video_ops max96714_video_ops = {
> > 
> > Like you suggest. Or I'm wrong?
> 
> That looks better :-)
> 
> Out of curiosity, what's your use case for control events ?

I'm not sure if there's a use case, however control event should be
supported when a driver supports controls.

-- 
Regards,

Sakari Ailus

