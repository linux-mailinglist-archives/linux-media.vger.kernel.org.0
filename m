Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 074AD4D6234
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 14:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348821AbiCKNRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 08:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235260AbiCKNRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 08:17:03 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9151A1C2F62
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 05:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647004560; x=1678540560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xmbjKHhVpCoRv8bC7xqCAOTHrAHRkDyQ91GqOnsIwQw=;
  b=Lxm8EEn9TtdLsvXg/NCKAjIgEYDx9Fz5ChZMBZJCauheW7pV60lrkBCg
   ojnQYzJ7l19W/jfedN9yN3URbcS0LUEq63iIUGpHq5G0w5NWXDvdTh7y6
   sFbJJauf/wZT753jnGe3ItGOt68TjJ+UEy6D7o/HGSyIlB5G/gjZZwLVj
   JO31xvSFL+QS9W674jZZqBQ/RSlpsrwnD1UFQYshJBZbKkj6C7QRBil02
   YYbXQu5BD5X6vlrjwBUSm9pcdAVhoWEWb2wLZoA0eim1dW6WabeQgCCZi
   elF5q65GluDGpTL4HotlV/MzdLDdm9jU8AMHwyQgwtPzKONeKh9HVYzgY
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318792048"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="318792048"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:16:00 -0800
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="644929515"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:15:56 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 30BEA2036B;
        Fri, 11 Mar 2022 15:15:54 +0200 (EET)
Date:   Fri, 11 Mar 2022 15:15:54 +0200
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
Message-ID: <YitLit9LC2zlOfdh@paasikivi.fi.intel.com>
References: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
 <Yis/WZFBC49uoRg6@paasikivi.fi.intel.com>
 <YitA0dI2mM4ACdaL@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YitA0dI2mM4ACdaL@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Mar 11, 2022 at 02:30:09PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Mar 11, 2022 at 02:23:53PM +0200, Sakari Ailus wrote:
> > On Fri, Mar 11, 2022 at 08:12:59PM +0900, Paul Elder wrote:
> > > Switch to using runtime PM for power management.
> > > 
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > 
> > > ---
> > > Changes in v2:
> > > - replace manual tracking of power status with pm_runtime_get_if_in_use
> > > - power on the sensor before reading the checking the chip id
> > > - add dependency on PM to Kconfig
> > > ---
> > >  drivers/media/i2c/Kconfig  |   1 +
> > >  drivers/media/i2c/ov5640.c | 112 ++++++++++++++++++++++---------------
> > >  2 files changed, 67 insertions(+), 46 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index e7194c1be4d2..97c3611d9304 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -1025,6 +1025,7 @@ config VIDEO_OV5640
> > >  	tristate "OmniVision OV5640 sensor support"
> > >  	depends on OF
> > >  	depends on GPIOLIB && VIDEO_V4L2 && I2C
> > > +	depends on PM
> > 
> > I think this is not needed as the sensor is powered on explicitly in probe.
> > 
> > You should similarly power it off explicitly in remove, set the runtime PM
> > status suspended and disable runtime PM. See e.g. imx319 driver for an
> > example. It doesn't have resume callback but that doesn't really matter ---
> > it's just ACPI-only.
> 
> Do we want to continue supporting !PM ? Does it have any real use case
> when dealing with camera sensors ?

Probably not much.

The changes I proposed are not eve related on runtime PM. Hence the
question here is whether there should be a dependency to CONFIG_PM or not,
and as there's no technical reason to have it, it should be omitted.

-- 
Kind regards,

Sakari Ailus
