Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05E82E9590
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 14:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbhADNGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 08:06:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55468 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbhADNGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 08:06:00 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 603A32E0;
        Mon,  4 Jan 2021 14:05:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609765518;
        bh=LeUgmzK02rGP594z5IuZe3KBuMlXz5W/G2fbXG8ZY0A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ozvbUQw7em6gEZPtfNPtc8NPE+Jic8tslaHQH2rcB/tHlLWxcMl5tdPOD7y3o1dYM
         RqFejtElnIZZgWfDxgDrJwSmfT+EEorjofiM7ilms9r+r1TBB+Y77fKAtDlI4LyrhQ
         CqdE1h91uCQrSRRj9/5q4w6BEC0mnbp40L3tKlPk=
Date:   Mon, 4 Jan 2021 15:05:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH 2/2] media: i2c: Add OV1063x sensor driver
Message-ID: <X/MSgbOQ3ATJH5At@pendragon.ideasonboard.com>
References: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
 <20210104053945.12409-3-laurent.pinchart@ideasonboard.com>
 <20210104124700.GL11878@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210104124700.GL11878@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Jan 04, 2021 at 02:47:00PM +0200, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Mon, Jan 04, 2021 at 07:39:45AM +0200, Laurent Pinchart wrote:
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 878f66ef2719..84a97989775e 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -1050,6 +1050,18 @@ config VIDEO_OV9650
> >  	  This is a V4L2 sensor driver for the Omnivision
> >  	  OV9650 and OV9652 camera sensors.
> >  
> > +config VIDEO_OV10633
> > +	tristate "OmniVision OV10633/OV10635 sensor support"
> > +	depends on I2C && VIDEO_V4L2
> > +	depends on GPIOLIB && OF
> > +	select MEDIA_CONTROLLER
> > +	select REGMAP_I2C
> 
> Should this be SCCB instead?
> 
> Likewise for the driver.

The OV1063x has 16-bit register addresses, and, unless I'm mistaken,
regmap_sccb assumes register addresses to be 8-bit long.

-- 
Regards,

Laurent Pinchart
