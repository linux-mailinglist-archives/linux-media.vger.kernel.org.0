Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE94C3BF1A1
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 23:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhGGVym (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 17:54:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45354 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhGGVym (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 17:54:42 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA355466;
        Wed,  7 Jul 2021 23:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625694720;
        bh=OSAPN5cM+ghp47WMtV8+9rqlGAFzG+ZMGLoDO2gfpyw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wEm0jXB3V1H5KzyVKhye7wbJ3SzZDINTZG/Yk31MqVdmN5GqdOu6A/WbYuzUwyJXP
         SWNlj8pJstt/MeAs21l+GaarVo68m/FTvKY81tMh2nBFdd+tDge0dv99SoZ4CyVjqa
         WmSFWgS54gUveZXezfBWFfIpI+gsRcJHKpNY6foM=
Date:   Thu, 8 Jul 2021 00:51:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Raag Jadav <raagjadav@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 01/11] media: ov5640: Use runtime PM to control sensor
 power
Message-ID: <YOYh1Jnd++ifyQUT@pendragon.ideasonboard.com>
References: <20210624192200.22559-1-p.yadav@ti.com>
 <20210624192200.22559-2-p.yadav@ti.com>
 <20210707203718.GX3@paasikivi.fi.intel.com>
 <YOYWCRg0P65U41Fg@pendragon.ideasonboard.com>
 <20210707214415.GY3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210707214415.GY3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Jul 08, 2021 at 12:44:15AM +0300, Sakari Ailus wrote:
> On Thu, Jul 08, 2021 at 12:00:57AM +0300, Laurent Pinchart wrote:
> > On Wed, Jul 07, 2021 at 11:37:18PM +0300, Sakari Ailus wrote:
> > > On Fri, Jun 25, 2021 at 12:51:50AM +0530, Pratyush Yadav wrote:
> > > > Calling s_power subdev callback is discouraged. Instead, the subdevs
> > > > should use runtime PM to control its power. Use runtime PM callbacks to
> > > > control sensor power. The pm counter is incremented when the stream is
> > > > started and decremented when the stream is stopped.
> > > > 
> > > > Refactor s_stream() a bit to make this new control flow easier. Add a
> > > > helper to choose whether mipi or dvp set_stream needs to be called. The
> > > > logic flow is also changed to make it a bit clearer.
> > > > 
> > > > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > > > 
> > > > ---
> > > > 
> > > > Changes in v3:
> > > > - Clean up the logic in ov5640_s_stream() a bit.
> > > > - Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync().
> > > > - Rename the label error_pm to disable_pm.
> > > > 
> > > > Changes in v2:
> > > > - New in v2.
> > > > 
> > > >  drivers/media/i2c/Kconfig  |   2 +-
> > > >  drivers/media/i2c/ov5640.c | 127 +++++++++++++++++++++++--------------
> > > >  2 files changed, 79 insertions(+), 50 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > index 588f8eb95984..8f43a4d7bcc1 100644
> > > > --- a/drivers/media/i2c/Kconfig
> > > > +++ b/drivers/media/i2c/Kconfig
> > > > @@ -929,7 +929,7 @@ config VIDEO_OV2740
> > > >  
> > > >  config VIDEO_OV5640
> > > >  	tristate "OmniVision OV5640 sensor support"
> > > > -	depends on OF
> > > > +	depends on OF && PM
> > > 
> > > Could you add support for runtime PM without requiring CONFIG_PM?
> > > 
> > > Essentially you'll need to power on the device in probe and power it off in
> > > probe, and make sure the runtime PM nop variant functions return the value
> > > you'd expect.
> > 
> > I've gone through that in several sensor drivers, and it really
> > increases the complexity to get it right, to a point where I'm not
> > comfortable asking someone to do the same (not to mention the very, very
> 
> I don't think it's very complicated, really. Looking at examples of other
> drivers (e.g. imx334) doing exactly the same helps as you don't need to
> check for individual functions.
> 
> The complexity of the power management in this driver is mostly because of
> evolutionary development done over time, it's an old driver.

https://git.linuxtv.org/pinchartl/media.git/commit/?h=sensors/ar0330/driver&id=e72ca23c4c6b1ab6b06ac48280726e09d63cc818

Look at the changes to ar0330_probe(). As far as I understand, anything
less than that would be incorrect, and it's way too easy to get it
wrong.

> > high chance that it won't be done correctly). What's the practical
> > drawback in requiring CONFIG_PM ?
> 
> Good question. CONFIG_PM is something you can disable (for a reason I can't
> think of though). Why should a driver depend on it when it could perfectly
> work without it as well?

Because it requires additional complexity in the driver, times the
number of sensor drivers we have in the kernel. Not even mentioning test
coverage, I'm pretty sure very few people would test the sensor drivers
without CONFIG_PM.

> Although this might not amount to a practical drawback. :-)

-- 
Regards,

Laurent Pinchart
