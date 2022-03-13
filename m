Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E29C4D7585
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 14:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbiCMNjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 09:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233990AbiCMNjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 09:39:48 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF2D44778
        for <linux-media@vger.kernel.org>; Sun, 13 Mar 2022 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647178720; x=1678714720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UimqCOKQA3y4rO2iugWi4ljs5E+vn36PzBvtoaDBOFU=;
  b=jkCAQntlNgovoF89CVH8E/E9GNI89oqh3WH9yiFUajuF5fYCDeYtOerS
   bJJzft7eC3IxislbFbV1T/J6o7fnTO8O3AhVEgPXFzChiCXQ+JU/zdiG6
   W1ZyjBnWzAuS+9l/XGqPq5AKVK/JSePk01G5lHVlhawIB4BHgQyZ+c3hk
   BmT6NcqYKTJuIBmt8g9ufEPm1zCRqp3lkxM/egjAg3lIWdrBCT/IeysXP
   M7sBVUIAPGjVKmy/02OpBVsqaOt9WhI0hpfRqZp/vdq7gkybien49DSd9
   1sI9KYL3Dy9/2o4Zm/siLyYAsNocHy5TokwZw91dY50JQNG64w2UPTnfM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10284"; a="256055630"
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; 
   d="scan'208";a="256055630"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2022 06:38:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; 
   d="scan'208";a="597607767"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2022 06:38:36 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 89A032036B;
        Sun, 13 Mar 2022 15:38:34 +0200 (EET)
Date:   Sun, 13 Mar 2022 15:38:34 +0200
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
Message-ID: <Yi3z2nR8j+ee4E4m@paasikivi.fi.intel.com>
References: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
 <Yis/WZFBC49uoRg6@paasikivi.fi.intel.com>
 <YitA0dI2mM4ACdaL@pendragon.ideasonboard.com>
 <YitLit9LC2zlOfdh@paasikivi.fi.intel.com>
 <YitMt7hVA2okuQ8x@pendragon.ideasonboard.com>
 <YitPaq2yYnrKsq4f@paasikivi.fi.intel.com>
 <Yi3rQGmeXQD70Tkh@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yi3rQGmeXQD70Tkh@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Mar 13, 2022 at 03:01:52PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Mar 11, 2022 at 03:32:26PM +0200, Sakari Ailus wrote:
> > On Fri, Mar 11, 2022 at 03:20:55PM +0200, Laurent Pinchart wrote:
> > > On Fri, Mar 11, 2022 at 03:15:54PM +0200, Sakari Ailus wrote:
> > > > On Fri, Mar 11, 2022 at 02:30:09PM +0200, Laurent Pinchart wrote:
> > > > > On Fri, Mar 11, 2022 at 02:23:53PM +0200, Sakari Ailus wrote:
> > > > > > On Fri, Mar 11, 2022 at 08:12:59PM +0900, Paul Elder wrote:
> > > > > > > Switch to using runtime PM for power management.
> > > > > > > 
> > > > > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > > > > 
> > > > > > > ---
> > > > > > > Changes in v2:
> > > > > > > - replace manual tracking of power status with pm_runtime_get_if_in_use
> > > > > > > - power on the sensor before reading the checking the chip id
> > > > > > > - add dependency on PM to Kconfig
> > > > > > > ---
> > > > > > >  drivers/media/i2c/Kconfig  |   1 +
> > > > > > >  drivers/media/i2c/ov5640.c | 112 ++++++++++++++++++++++---------------
> > > > > > >  2 files changed, 67 insertions(+), 46 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > > index e7194c1be4d2..97c3611d9304 100644
> > > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > > @@ -1025,6 +1025,7 @@ config VIDEO_OV5640
> > > > > > >  	tristate "OmniVision OV5640 sensor support"
> > > > > > >  	depends on OF
> > > > > > >  	depends on GPIOLIB && VIDEO_V4L2 && I2C
> > > > > > > +	depends on PM
> > > > > > 
> > > > > > I think this is not needed as the sensor is powered on explicitly in probe.
> > > > > > 
> > > > > > You should similarly power it off explicitly in remove, set the runtime PM
> > > > > > status suspended and disable runtime PM. See e.g. imx319 driver for an
> > > > > > example. It doesn't have resume callback but that doesn't really matter ---
> > > > > > it's just ACPI-only.
> > > > > 
> > > > > Do we want to continue supporting !PM ? Does it have any real use case
> > > > > when dealing with camera sensors ?
> > > > 
> > > > Probably not much.
> > > > 
> > > > The changes I proposed are not eve related on runtime PM. Hence the
> > > > question here is whether there should be a dependency to CONFIG_PM or not,
> > > > and as there's no technical reason to have it, it should be omitted.
> > > 
> > > But if there's no real use case for !PM, wouldn't we be better off
> > > depending on PM and simplifying the probe functions instead ?
> > 
> > What would change in the probe function if runtime PM was required by the
> > driver?
> 
> We wouldn't need the complicated dance of calling
> 
> 	ret = ov5640_set_power(sensor, true);
> 	if (ret)
> 		goto free_ctrls;
> 
> 	pm_runtime_set_active(dev);
> 	pm_runtime_enable(dev);
> 	pm_runtime_get(dev);

pm_runtime_get() is redundant here.

> 
> but could write it as
> 
> 	pm_runtime_enable(dev);
> 	pm_runtime_resume_and_get(dev);

You'll need put here, too.

Also the latter only works on DT-based systems so it's not an option for
most of the drivers.

-- 
Regards,

Sakari Ailus
