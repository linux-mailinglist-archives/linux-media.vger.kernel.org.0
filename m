Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49EBF4D8DCA
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 21:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244919AbiCNUHK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 16:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244917AbiCNUHI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 16:07:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA57403FE
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 13:05:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3ABAD30B;
        Mon, 14 Mar 2022 21:05:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647288355;
        bh=ACRJFLl4LG2rcL59N94T+ZUejJdTAjLPDwvWIs6l+Rs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E2noCrlT+Pi6bbWzaNBu/IUlWtTenLQhlzJzRFYIXF1ukx0UFJN77Y+8SmWUfOdbA
         2CjMxYBfOFCgplqkNBU9saWbY5StPTLIpbxdH6KrkDbUKYTMNTUZz9hp4eHXk24xxG
         ANkL5EHcLiPZ8NT/Be3+A69r/jwCI13gxXo3kgpE=
Date:   Mon, 14 Mar 2022 22:05:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Jacopo Mondi <jmondi@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
Message-ID: <Yi+gEVB0FuOcY5qn@pendragon.ideasonboard.com>
References: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
 <Yis/WZFBC49uoRg6@paasikivi.fi.intel.com>
 <YitA0dI2mM4ACdaL@pendragon.ideasonboard.com>
 <YitLit9LC2zlOfdh@paasikivi.fi.intel.com>
 <YitMt7hVA2okuQ8x@pendragon.ideasonboard.com>
 <YitPaq2yYnrKsq4f@paasikivi.fi.intel.com>
 <Yi3rQGmeXQD70Tkh@pendragon.ideasonboard.com>
 <Yi3z2nR8j+ee4E4m@paasikivi.fi.intel.com>
 <Yi38zOHsh68FrrKK@pendragon.ideasonboard.com>
 <Yi+e/IK+eVpKit/F@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yi+e/IK+eVpKit/F@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Mar 14, 2022 at 10:01:00PM +0200, Sakari Ailus wrote:
> On Sun, Mar 13, 2022 at 04:16:44PM +0200, Laurent Pinchart wrote:
> > On Sun, Mar 13, 2022 at 03:38:34PM +0200, Sakari Ailus wrote:
> > > On Sun, Mar 13, 2022 at 03:01:52PM +0200, Laurent Pinchart wrote:
> > > > On Fri, Mar 11, 2022 at 03:32:26PM +0200, Sakari Ailus wrote:
> > > > > On Fri, Mar 11, 2022 at 03:20:55PM +0200, Laurent Pinchart wrote:
> > > > > > On Fri, Mar 11, 2022 at 03:15:54PM +0200, Sakari Ailus wrote:
> > > > > > > On Fri, Mar 11, 2022 at 02:30:09PM +0200, Laurent Pinchart wrote:
> > > > > > > > On Fri, Mar 11, 2022 at 02:23:53PM +0200, Sakari Ailus wrote:
> > > > > > > > > On Fri, Mar 11, 2022 at 08:12:59PM +0900, Paul Elder wrote:
> > > > > > > > > > Switch to using runtime PM for power management.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > > > > > > > 
> > > > > > > > > > ---
> > > > > > > > > > Changes in v2:
> > > > > > > > > > - replace manual tracking of power status with pm_runtime_get_if_in_use
> > > > > > > > > > - power on the sensor before reading the checking the chip id
> > > > > > > > > > - add dependency on PM to Kconfig
> > > > > > > > > > ---
> > > > > > > > > >  drivers/media/i2c/Kconfig  |   1 +
> > > > > > > > > >  drivers/media/i2c/ov5640.c | 112 ++++++++++++++++++++++---------------
> > > > > > > > > >  2 files changed, 67 insertions(+), 46 deletions(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > > > > > index e7194c1be4d2..97c3611d9304 100644
> > > > > > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > > > > > @@ -1025,6 +1025,7 @@ config VIDEO_OV5640
> > > > > > > > > >  	tristate "OmniVision OV5640 sensor support"
> > > > > > > > > >  	depends on OF
> > > > > > > > > >  	depends on GPIOLIB && VIDEO_V4L2 && I2C
> > > > > > > > > > +	depends on PM
> > > > > > > > > 
> > > > > > > > > I think this is not needed as the sensor is powered on explicitly in probe.
> > > > > > > > > 
> > > > > > > > > You should similarly power it off explicitly in remove, set the runtime PM
> > > > > > > > > status suspended and disable runtime PM. See e.g. imx319 driver for an
> > > > > > > > > example. It doesn't have resume callback but that doesn't really matter ---
> > > > > > > > > it's just ACPI-only.
> > > > > > > > 
> > > > > > > > Do we want to continue supporting !PM ? Does it have any real use case
> > > > > > > > when dealing with camera sensors ?
> > > > > > > 
> > > > > > > Probably not much.
> > > > > > > 
> > > > > > > The changes I proposed are not eve related on runtime PM. Hence the
> > > > > > > question here is whether there should be a dependency to CONFIG_PM or not,
> > > > > > > and as there's no technical reason to have it, it should be omitted.
> > > > > > 
> > > > > > But if there's no real use case for !PM, wouldn't we be better off
> > > > > > depending on PM and simplifying the probe functions instead ?
> > > > > 
> > > > > What would change in the probe function if runtime PM was required by the
> > > > > driver?
> > > > 
> > > > We wouldn't need the complicated dance of calling
> > > > 
> > > > 	ret = ov5640_set_power(sensor, true);
> > > > 	if (ret)
> > > > 		goto free_ctrls;
> > > > 
> > > > 	pm_runtime_set_active(dev);
> > > > 	pm_runtime_enable(dev);
> > > > 	pm_runtime_get(dev);
> > > 
> > > pm_runtime_get() is redundant here.
> > > 
> > > > but could write it as
> > > > 
> > > > 	pm_runtime_enable(dev);
> > > > 	pm_runtime_resume_and_get(dev);
> > > 
> > > You'll need put here, too.
> > 
> > Yes, after reading the version register (or doing any other harware
> > access). Actually the full code would be
> > 
> > 
> >  	pm_runtime_enable(dev);
> >  	pm_runtime_resume_and_get(dev);
> > 
> > 	/* Hardware access */
> > 
> > 	pm_runtime_set_autosuspend_delay(dev, 1000);
> > 	pm_runtime_use_autosuspend(dev);
> > 	pm_runtime_put_autosuspend(dev);
> > 
> > (plus error handling).
> > 
> > If the probe function doesn't need to access the hardware, then
> > the above becomes
> > 
> > 	pm_runtime_enable(dev);
> > 	pm_runtime_set_autosuspend_delay(dev, 1000);
> > 	pm_runtime_use_autosuspend(dev);
> > 
> > instead of having to power up the device just in case !PM.
> > 
> > > Also the latter only works on DT-based systems so it's not an option for
> > > most of the drivers.
> > 
> > How so, what's wrong with the above for ACPI-based system ?
> 
> I²C devices are already powered on for probe on ACPI based systems.

Not through RPM I suppose ?

-- 
Regards,

Laurent Pinchart
