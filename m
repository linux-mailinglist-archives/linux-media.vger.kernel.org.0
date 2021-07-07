Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13AA3BF180
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 23:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhGGVrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 17:47:02 -0400
Received: from mga03.intel.com ([134.134.136.65]:6552 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229717AbhGGVrC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Jul 2021 17:47:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209432758"
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; 
   d="scan'208";a="209432758"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 14:44:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; 
   d="scan'208";a="423721813"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 14:44:17 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 2D1D5204C0;
        Thu,  8 Jul 2021 00:44:15 +0300 (EEST)
Date:   Thu, 8 Jul 2021 00:44:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20210707214415.GY3@paasikivi.fi.intel.com>
References: <20210624192200.22559-1-p.yadav@ti.com>
 <20210624192200.22559-2-p.yadav@ti.com>
 <20210707203718.GX3@paasikivi.fi.intel.com>
 <YOYWCRg0P65U41Fg@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOYWCRg0P65U41Fg@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jul 08, 2021 at 12:00:57AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Wed, Jul 07, 2021 at 11:37:18PM +0300, Sakari Ailus wrote:
> > On Fri, Jun 25, 2021 at 12:51:50AM +0530, Pratyush Yadav wrote:
> > > Calling s_power subdev callback is discouraged. Instead, the subdevs
> > > should use runtime PM to control its power. Use runtime PM callbacks to
> > > control sensor power. The pm counter is incremented when the stream is
> > > started and decremented when the stream is stopped.
> > > 
> > > Refactor s_stream() a bit to make this new control flow easier. Add a
> > > helper to choose whether mipi or dvp set_stream needs to be called. The
> > > logic flow is also changed to make it a bit clearer.
> > > 
> > > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > > 
> > > ---
> > > 
> > > Changes in v3:
> > > - Clean up the logic in ov5640_s_stream() a bit.
> > > - Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync().
> > > - Rename the label error_pm to disable_pm.
> > > 
> > > Changes in v2:
> > > - New in v2.
> > > 
> > >  drivers/media/i2c/Kconfig  |   2 +-
> > >  drivers/media/i2c/ov5640.c | 127 +++++++++++++++++++++++--------------
> > >  2 files changed, 79 insertions(+), 50 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 588f8eb95984..8f43a4d7bcc1 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -929,7 +929,7 @@ config VIDEO_OV2740
> > >  
> > >  config VIDEO_OV5640
> > >  	tristate "OmniVision OV5640 sensor support"
> > > -	depends on OF
> > > +	depends on OF && PM
> > 
> > Could you add support for runtime PM without requiring CONFIG_PM?
> > 
> > Essentially you'll need to power on the device in probe and power it off in
> > probe, and make sure the runtime PM nop variant functions return the value
> > you'd expect.
> 
> I've gone through that in several sensor drivers, and it really
> increases the complexity to get it right, to a point where I'm not
> comfortable asking someone to do the same (not to mention the very, very

I don't think it's very complicated, really. Looking at examples of other
drivers (e.g. imx334) doing exactly the same helps as you don't need to
check for individual functions.

The complexity of the power management in this driver is mostly because of
evolutionary development done over time, it's an old driver.

> high chance that it won't be done correctly). What's the practical
> drawback in requiring CONFIG_PM ?

Good question. CONFIG_PM is something you can disable (for a reason I can't
think of though). Why should a driver depend on it when it could perfectly
work without it as well?

Although this might not amount to a practical drawback. :-)

-- 
Kind regards,

Sakari Ailus
