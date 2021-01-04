Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C82A2E9678
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 14:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbhADN5x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 08:57:53 -0500
Received: from mga06.intel.com ([134.134.136.31]:42214 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbhADN5x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Jan 2021 08:57:53 -0500
IronPort-SDR: ajTwUpv9vdDukyjkbw7QYVjJCYPZ6AjJp2bk8B8GqGKIsgH6KcWU3OIWZjmUjDx2VOcOgNOnuY
 XSN6eWXjg2nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9853"; a="238504381"
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="238504381"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 05:56:06 -0800
IronPort-SDR: 2Vbt0yhUumUuuxHYcnaUFIXxXKYUTubjc2t3IONfE5l9Op3sI71pHqEty7ZDY4aWzCPELH1EMl
 UxtERwrEo5Vg==
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="565109341"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 05:56:05 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A4CBA206FD; Mon,  4 Jan 2021 15:55:33 +0200 (EET)
Date:   Mon, 4 Jan 2021 15:55:33 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH 2/2] media: i2c: Add OV1063x sensor driver
Message-ID: <20210104135533.GM11878@paasikivi.fi.intel.com>
References: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
 <20210104053945.12409-3-laurent.pinchart@ideasonboard.com>
 <20210104124700.GL11878@paasikivi.fi.intel.com>
 <X/MSgbOQ3ATJH5At@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/MSgbOQ3ATJH5At@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 04, 2021 at 03:05:05PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, Jan 04, 2021 at 02:47:00PM +0200, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Mon, Jan 04, 2021 at 07:39:45AM +0200, Laurent Pinchart wrote:
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 878f66ef2719..84a97989775e 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -1050,6 +1050,18 @@ config VIDEO_OV9650
> > >  	  This is a V4L2 sensor driver for the Omnivision
> > >  	  OV9650 and OV9652 camera sensors.
> > >  
> > > +config VIDEO_OV10633
> > > +	tristate "OmniVision OV10633/OV10635 sensor support"
> > > +	depends on I2C && VIDEO_V4L2
> > > +	depends on GPIOLIB && OF
> > > +	select MEDIA_CONTROLLER
> > > +	select REGMAP_I2C
> > 
> > Should this be SCCB instead?
> > 
> > Likewise for the driver.
> 
> The OV1063x has 16-bit register addresses, and, unless I'm mistaken,
> regmap_sccb assumes register addresses to be 8-bit long.

It seems so. I wonder what's the meaning of SCCB in this case. A number of
drivers (three) require REGMAP_SCCB instead of REGMAP_I2C. Could it just be
someone needed those drivers on controllers with just SMBUS functionality?

I guess this is fine then.

-- 
Sakari Ailus
