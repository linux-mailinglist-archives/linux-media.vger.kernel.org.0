Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE27C2FCE98
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 12:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729344AbhATKpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:45:46 -0500
Received: from mga18.intel.com ([134.134.136.126]:50461 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733261AbhATKi7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 05:38:59 -0500
IronPort-SDR: IdyA32rCVCDh9U+fbyV2ii6Wqnpm/WC4sTSEejRzrh21NZx+z810gy7M81xtDrnugtI/wMevqV
 wVT0248MbKhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="166745658"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="166745658"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 02:36:53 -0800
IronPort-SDR: ea0/FmMHB3StJdYQIaQoBimu5XQcLNU9YeInwP5wV7gJbK85SSO9l65dJ9TsYzobrMoP3u+5R/
 4i7vUyRJzxBA==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="347507163"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 02:36:50 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CBE6F20503; Wed, 20 Jan 2021 12:36:48 +0200 (EET)
Date:   Wed, 20 Jan 2021 12:36:48 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: i2c/Kconfig: Select FWNODE for OV772x sensor
Message-ID: <20210120103648.GI11878@paasikivi.fi.intel.com>
References: <20210120090148.30598-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a1c42817-e2e4-b96a-c494-742808443f6b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1c42817-e2e4-b96a-c494-742808443f6b@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 20, 2021 at 10:17:14AM +0000, Kieran Bingham wrote:
> Hi Lad,
> 
> On 20/01/2021 09:01, Lad Prabhakar wrote:
> > Fix OV772x build breakage by selecting V4L2_FWNODE config:
> > 
> > ia64-linux-ld: drivers/media/i2c/ov772x.o: in function `ov772x_probe':
> > ov772x.c:(.text+0x1ee2): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
> > ia64-linux-ld: ov772x.c:(.text+0x1f12): undefined reference to `v4l2_fwnode_endpoint_free'
> > ia64-linux-ld: ov772x.c:(.text+0x2212): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
> > 
> > Fixes: 8a10b4e3601e ("media: i2c: ov772x: Parse endpoint properties")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> I see this driver uses subdev API too.
> 
> Should the driver also select VIDEO_V4L2_SUBDEV_API?

Yes, it should. Another patch? This one fixes a compilation problem.

> 
> Or is that covered sufficiently already on any platforms that would use
> the driver?
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > ---
> >  drivers/media/i2c/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index eddb10220953..bb1b5a340431 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -1013,6 +1013,7 @@ config VIDEO_OV772X
> >  	tristate "OmniVision OV772x sensor support"
> >  	depends on I2C && VIDEO_V4L2
> >  	select REGMAP_SCCB
> > +	select V4L2_FWNODE
> >  	help
> >  	  This is a Video4Linux2 sensor driver for the OmniVision
> >  	  OV772x camera.
> > 
> 

-- 
Sakari Ailus
