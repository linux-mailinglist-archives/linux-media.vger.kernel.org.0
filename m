Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2754D8DA7
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 21:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244816AbiCNUCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 16:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236350AbiCNUCU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 16:02:20 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4218610FC5
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 13:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647288068; x=1678824068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PrU19NRSzKE0l7xUIiLswjnkt9AwKvxcDu3XUCq6yTo=;
  b=V+ZGL1DzvsvUvTCsCZZyI/bRJA/DqJUtSarZhFc9mCgwPBwqLw3kZ1uw
   o/Grgzg6+NFVSEhwUYNr3lree33asav6W3XL9d+qrrDfz0QkeZw5wCKGn
   gkdYcBRN3w100LzTPnC+efU0IxZffHANS4PrEBig2UI4vthYCoG3ubIGA
   IwRN94uHwiQgkTOL+1aHDLBLiyZuCvUY21XOAmN1/dc438p1ZRrIdn25N
   kkOZ8r/SN+0dAoyh1KLRNORoEA5gMHgwnUCmHmiBeLnnhRVRFaFQVtCjd
   Yh/DKYF0hIImLqgV/pqX/2CPwGUYGXUBjpIffkx95dO0anPy4Y0DskHik
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236081115"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="236081115"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 13:01:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="643987860"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 13:01:03 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id E8641205BD;
        Mon, 14 Mar 2022 22:01:00 +0200 (EET)
Date:   Mon, 14 Mar 2022 22:01:00 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <Yi+e/IK+eVpKit/F@paasikivi.fi.intel.com>
References: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
 <Yis/WZFBC49uoRg6@paasikivi.fi.intel.com>
 <YitA0dI2mM4ACdaL@pendragon.ideasonboard.com>
 <YitLit9LC2zlOfdh@paasikivi.fi.intel.com>
 <YitMt7hVA2okuQ8x@pendragon.ideasonboard.com>
 <YitPaq2yYnrKsq4f@paasikivi.fi.intel.com>
 <Yi3rQGmeXQD70Tkh@pendragon.ideasonboard.com>
 <Yi3z2nR8j+ee4E4m@paasikivi.fi.intel.com>
 <Yi38zOHsh68FrrKK@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yi38zOHsh68FrrKK@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Mar 13, 2022 at 04:16:44PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Sun, Mar 13, 2022 at 03:38:34PM +0200, Sakari Ailus wrote:
> > On Sun, Mar 13, 2022 at 03:01:52PM +0200, Laurent Pinchart wrote:
> > > On Fri, Mar 11, 2022 at 03:32:26PM +0200, Sakari Ailus wrote:
> > > > On Fri, Mar 11, 2022 at 03:20:55PM +0200, Laurent Pinchart wrote:
> > > > > On Fri, Mar 11, 2022 at 03:15:54PM +0200, Sakari Ailus wrote:
> > > > > > On Fri, Mar 11, 2022 at 02:30:09PM +0200, Laurent Pinchart wrote:
> > > > > > > On Fri, Mar 11, 2022 at 02:23:53PM +0200, Sakari Ailus wrote:
> > > > > > > > On Fri, Mar 11, 2022 at 08:12:59PM +0900, Paul Elder wrote:
> > > > > > > > > Switch to using runtime PM for power management.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > > > > > > 
> > > > > > > > > ---
> > > > > > > > > Changes in v2:
> > > > > > > > > - replace manual tracking of power status with pm_runtime_get_if_in_use
> > > > > > > > > - power on the sensor before reading the checking the chip id
> > > > > > > > > - add dependency on PM to Kconfig
> > > > > > > > > ---
> > > > > > > > >  drivers/media/i2c/Kconfig  |   1 +
> > > > > > > > >  drivers/media/i2c/ov5640.c | 112 ++++++++++++++++++++++---------------
> > > > > > > > >  2 files changed, 67 insertions(+), 46 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > > > > index e7194c1be4d2..97c3611d9304 100644
> > > > > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > > > > @@ -1025,6 +1025,7 @@ config VIDEO_OV5640
> > > > > > > > >  	tristate "OmniVision OV5640 sensor support"
> > > > > > > > >  	depends on OF
> > > > > > > > >  	depends on GPIOLIB && VIDEO_V4L2 && I2C
> > > > > > > > > +	depends on PM
> > > > > > > > 
> > > > > > > > I think this is not needed as the sensor is powered on explicitly in probe.
> > > > > > > > 
> > > > > > > > You should similarly power it off explicitly in remove, set the runtime PM
> > > > > > > > status suspended and disable runtime PM. See e.g. imx319 driver for an
> > > > > > > > example. It doesn't have resume callback but that doesn't really matter ---
> > > > > > > > it's just ACPI-only.
> > > > > > > 
> > > > > > > Do we want to continue supporting !PM ? Does it have any real use case
> > > > > > > when dealing with camera sensors ?
> > > > > > 
> > > > > > Probably not much.
> > > > > > 
> > > > > > The changes I proposed are not eve related on runtime PM. Hence the
> > > > > > question here is whether there should be a dependency to CONFIG_PM or not,
> > > > > > and as there's no technical reason to have it, it should be omitted.
> > > > > 
> > > > > But if there's no real use case for !PM, wouldn't we be better off
> > > > > depending on PM and simplifying the probe functions instead ?
> > > > 
> > > > What would change in the probe function if runtime PM was required by the
> > > > driver?
> > > 
> > > We wouldn't need the complicated dance of calling
> > > 
> > > 	ret = ov5640_set_power(sensor, true);
> > > 	if (ret)
> > > 		goto free_ctrls;
> > > 
> > > 	pm_runtime_set_active(dev);
> > > 	pm_runtime_enable(dev);
> > > 	pm_runtime_get(dev);
> > 
> > pm_runtime_get() is redundant here.
> > 
> > > 
> > > but could write it as
> > > 
> > > 	pm_runtime_enable(dev);
> > > 	pm_runtime_resume_and_get(dev);
> > 
> > You'll need put here, too.
> 
> Yes, after reading the version register (or doing any other harware
> access). Actually the full code would be
> 
> 
>  	pm_runtime_enable(dev);
>  	pm_runtime_resume_and_get(dev);
> 
> 	/* Hardware access */
> 
> 	pm_runtime_set_autosuspend_delay(dev, 1000);
> 	pm_runtime_use_autosuspend(dev);
> 	pm_runtime_put_autosuspend(dev);
> 
> (plus error handling).
> 
> If the probe function doesn't need to access the hardware, then
> the above becomes
> 
> 	pm_runtime_enable(dev);
> 	pm_runtime_set_autosuspend_delay(dev, 1000);
> 	pm_runtime_use_autosuspend(dev);
> 
> instead of having to power up the device just in case !PM.
> 
> > Also the latter only works on DT-based systems so it's not an option for
> > most of the drivers.
> 
> How so, what's wrong with the above for ACPI-based system ?

I²C devices are already powered on for probe on ACPI based systems.

-- 
Regards,

Sakari Ailus
