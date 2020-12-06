Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7F52D0803
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgLFXZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgLFXZP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:25:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC52C0613D0
        for <linux-media@vger.kernel.org>; Sun,  6 Dec 2020 15:24:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA7DC8D;
        Mon,  7 Dec 2020 00:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607297073;
        bh=HUm68KbmBxUSrr2JAnlGlvVeuWuXunUusdGKebFh9fs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SOZUYtanJTuywdEj4TnqpyPUap1IDFm1vXmTIP7DWu5gJN18/2vwl3w0IP69JOVui
         NDz/EzitLLaOt5GMm0Vy2FzXcNBPUz5s6I4sXkwdCB1QSU31iX2tg70alc+5HRX7xC
         7bRs/h2FvWWVuKnQXWRFIJAinxxMAOeQ3uu+Bel8=
Date:   Mon, 7 Dec 2020 01:24:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v2 108/108] media: ti-vpe: cal: Implement media
 controller centric API
Message-ID: <X81oLy7T2K1UmltD@pendragon.ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
 <20200706183709.12238-109-laurent.pinchart@ideasonboard.com>
 <5266cec4-33ba-ba91-d55e-ff22a9b3e013@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5266cec4-33ba-ba91-d55e-ff22a9b3e013@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Nov 03, 2020 at 12:02:41PM +0100, Hans Verkuil wrote:
> Hi Laurent,
> 
> This was still on my TODO list to review. Of the other patch only my comment
> for 100/108 needs to be addressed in a v3.
> 
> I have just one comment for this patch:
> 
> On 06/07/2020 20:37, Laurent Pinchart wrote:
> 
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index 293cbac905b3..2ce2b6404c92 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -43,6 +43,10 @@ unsigned int cal_debug;
> >  module_param_named(debug, cal_debug, uint, 0644);
> >  MODULE_PARM_DESC(debug, "activates debug info");
> >  
> > +bool cal_mc_api;
> > +module_param_named(mc_api, cal_mc_api, bool, 0444);
> > +MODULE_PARM_DESC(mc_api, "activates the MC API");
> 
> I think it would be very useful if a Kconfig option is added that selects
> the default of cal_mc_api. If you know that you want the MC API, then you
> can select the option and that will be the default.

I expect this to spread to more drivers (the R-Car VIN driver already
supports two different APIs based on the SoC generation, which is an
entirely artificial split), either upstream, or in downstream kernels
(the Raspberry Pi unicam driver, for instance, may move to the MC API
for upstream, and retain video-node-centric behaviour controlled by an
option downstream). We should thus think about how we want to handle
this globally.

Personally, I think new drivers for embedded SoCs should use the MC API
only. By embedded, I mean here any system where the sensor needs to be
controlled directly by a subdev driver. The rationale is that we'll see
an increasing number of sensors exposing multiple subdevs, which would
require complex logic in the kernel if they were to be controlled
through video nodes only. Such logic would also need to implement
heuristics that will not be a good match for all use cases. This can
only work with a proper solution to support MC-based drivers in
userspace, and fortunately we're getting there :-)

Even if we mandate an MC-centric approach for new drivers, we will need
to deal with backward compatibility for both drivers that are currently
in-tree and need to move to the MC API (we have a known number of such
drivers, which shouldn't grow if we don't accept new ones), and for
drivers that are currently available through vendor kernels and don't
implement the MC API. The latter category is technically not our
problem, but ensuring that vendors will be able to preserve backward
compatibility with the existing user base will help getting drivers
mainlined, so it benefits us too. The solution for downstream kernel
should be the same as for existing upstream drivers (unless someone has
a good reason that would require a different solution).

So, if we consider that this problem will become more widespread, how do
we deal with it ? Do we need to select the API globally at the subsystem
level, per driver, or per device instance ? Should it be a compile-time
option only, a runtime option only, or a runtime option with a
compile-time default ? Controlling the option at runtime would be best I
believe, as that provides additional flexibility without much complexity
increase. Per-device compile-time selection (both for the option and for
its default value) would be difficult, I'd prefer ruling that out.

The only compile-time option would thus be either a subsystem-wide
default, or a per-driver default. The former seems of limited use to me.
What are the use cases for the latter, what default value would we pick
for the Kconfig option, and how do we expect distributions to select an
option ? I'm trying to figure out here whether that kernel option would
really be useful, or would just make the kernel configuration more
complex without a real use case.

> It is probably best if you rebase this series, fix 100/108 and (hopefully)
> this patch and post it as a v3. I'll take it.

Working on it now. If that's OK with you, I'll leave the Kconfig change
out for this patch for now, it can easily be done on top after we
finalize the discussion and won't cause any regression.

> > +
> >  /* ------------------------------------------------------------------
> >   *	Format Handling
> >   * ------------------------------------------------------------------
> > @@ -660,13 +664,17 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
> >  {
> >  	struct cal_dev *cal = container_of(notifier, struct cal_dev, notifier);
> >  	unsigned int i;
> > +	int ret = 0;
> >  
> >  	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> >  		if (cal->ctx[i])
> >  			cal_ctx_v4l2_register(cal->ctx[i]);
> >  	}
> >  
> > -	return 0;
> > +	if (cal_mc_api)
> > +		ret = v4l2_device_register_subdev_nodes(&cal->v4l2_dev);
> > +
> > +	return ret;
> >  }
> >  
> >  static const struct v4l2_async_notifier_operations cal_async_notifier_ops = {
> > diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> > index 2d935691bf75..f5609216b7c6 100644
> > --- a/drivers/media/platform/ti-vpe/cal.h
> > +++ b/drivers/media/platform/ti-vpe/cal.h
> > @@ -160,6 +160,7 @@ struct cal_camerarx {
> >  	struct device_node	*sensor_ep_node;
> >  	struct device_node	*sensor_node;
> >  	struct v4l2_subdev	*sensor;
> > +	struct media_pipeline	pipe;
> >  
> >  	struct v4l2_subdev	subdev;
> >  	struct media_pad	pads[2];
> > @@ -224,6 +225,7 @@ struct cal_ctx {
> >  
> >  extern unsigned int cal_debug;
> >  extern int cal_video_nr;
> > +extern bool cal_mc_api;
> >  
> >  #define cal_dbg(level, cal, fmt, arg...)				\
> >  	do {								\

-- 
Regards,

Laurent Pinchart
