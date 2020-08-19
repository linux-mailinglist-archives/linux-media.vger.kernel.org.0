Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D521249D3F
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 14:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgHSMDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 08:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbgHSL7R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 07:59:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CFEC061757
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 04:59:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF77E563;
        Wed, 19 Aug 2020 13:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597838350;
        bh=GDgWps4TSaY1MA/z0c8N9frlzdesVl3wlbgKJt5wlMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=maj6xsxTfMF8JMd9JBUtp2/SIq63EfbDeUOSwoQ2myX1B56Pc6x1kpG4AMwgs1Vnr
         kGn/7hcbfeyDFkdHm0iVldX6bZUzxVN986KmQ5vm6HK6U17V6iWOkKnxhPcPT8Anzy
         3Z2poTnD9h8mVRVe+1Sy9vkhHfFQf7fhNkxB2ym4=
Date:   Wed, 19 Aug 2020 14:58:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: Depend on GPIOLIB
Message-ID: <20200819115853.GD6049@pendragon.ideasonboard.com>
References: <20200819002252.16361-1-laurent.pinchart@ideasonboard.com>
 <12f93522-5ca3-7da8-c819-e1f29429e0b6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12f93522-5ca3-7da8-c819-e1f29429e0b6@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Aug 19, 2020 at 09:45:32AM +0100, Kieran Bingham wrote:
> On 19/08/2020 01:22, Laurent Pinchart wrote:
> > The max9286 driver depends on the GPIO library, list the dependency in
> > Kconfig.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Sakari has already posted a fix for this on the 3rd August at:
> 
> [PATCH 1/1] max9286: Depend on OF_GPIO
> 
> https://lore.kernel.org/linux-media/20200803090935.23619-1-sakari.ailus@linux.intel.com/

Is that on its way upstream ? I've submitted this patch in response to a
0day bot report, the more we wait with fixes, the more likely effort
will be duplicated :-S

> However he chose to depend upon OF_GPIO.
> 
> I think in this instance, his patch is more correct as this particular
> issue is regarding the setting of the of_node on the GPIO component,
> which is guarded by CONFIG_OF_GPIO in the headers, thus I believe we can
> have GPIOLIB && !OF_GPIO, which would still leave compile breakage with
> your patch.

You can't have GPIOLIB && !OF_GPIO though, as the driver also depends on
OF, and OF_GPIO will be automatically selected when GPIOLIB and OF are
set. I'm fine with Sakari's patch though.

> > ---
> >  drivers/media/i2c/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 48ae60a2c603..70ba6ca1b912 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -466,6 +466,7 @@ config VIDEO_VPX3220
> >  
> >  config VIDEO_MAX9286
> >  	tristate "Maxim MAX9286 GMSL deserializer support"
> > +	depends on GPIOLIB
> >  	depends on I2C && I2C_MUX
> >  	depends on OF
> >  	select V4L2_FWNODE
> > 
> 

-- 
Regards,

Laurent Pinchart
