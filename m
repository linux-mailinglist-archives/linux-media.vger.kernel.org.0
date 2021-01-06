Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A552EC09B
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 16:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbhAFPnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 10:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbhAFPnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 10:43:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59EAC06134C
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 07:42:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C513B878;
        Wed,  6 Jan 2021 16:42:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609947753;
        bh=df+E8C/wQR/U0NSByioqXcNmSl65PcntV59zD8xRp4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g6Ve6NhPVqwS59mTlCWpXaL8+m/uYuz/8fLOpVnrO5WCcBvmrSZiC5gX4ohxRp6xD
         l0r7gf38MT7F3Ip/rjbuRhEBR1qZZN7oebEA99t+a2RgyvqFCWJmogFU4KF62koiY9
         ymGnTltuQH/pYlVmnzSeaJDyEELgkAo7HElE2nuc=
Date:   Wed, 6 Jan 2021 17:42:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 04/75] media: imx: Move IMX_IPUV3_CORE dependency to
 VIDEO_IMX_CSI
Message-ID: <X/XaXJSe6BQP0QW6@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-5-laurent.pinchart@ideasonboard.com>
 <a8378fe99945194924655fd9d84a99500712ab32.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8378fe99945194924655fd9d84a99500712ab32.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Wed, Jan 06, 2021 at 03:24:58PM +0100, Philipp Zabel wrote:
> On Tue, 2021-01-05 at 17:27 +0200, Laurent Pinchart wrote:
> > The i.MX7 camera drivers, selected by VIDEO_IMX7_CSI, don't depend on
> > IMX_IPUV3_CORE. Move the dependency from the common VIDEO_IMX_MEDIA
> > symbol to VIDEO_IMX_CSI.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/staging/media/imx/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> > index ce270627a7c4..0f1277a58d3c 100644
> > --- a/drivers/staging/media/imx/Kconfig
> > +++ b/drivers/staging/media/imx/Kconfig
> > @@ -4,7 +4,7 @@ config VIDEO_IMX_MEDIA
> >  	depends on ARCH_MXC || COMPILE_TEST
> >  	depends on HAS_DMA
> >  	depends on VIDEO_DEV
> > -	depends on VIDEO_V4L2 && IMX_IPUV3_CORE
> > +	depends on VIDEO_V4L2
> >  	select MEDIA_CONTROLLER
> >  	select V4L2_FWNODE
> >  	select V4L2_MEM2MEM_DEV
> > @@ -19,6 +19,7 @@ menu "i.MX5/6/7 Media Sub devices"
> >  
> >  config VIDEO_IMX_CSI
> >  	tristate "i.MX5/6 Camera Sensor Interface driver"
> > +	depends on IMX_IPUV3_CORE
> >  	default y
> >  	help
> >  	  A video4linux camera sensor interface driver for i.MX5/6.
> 
> This patch drops the IMX_IPUV3_CORE dependency from VIDEO_IMX_MEDIA,
> which still tries to build imx6-media.ko (and will fail if
> IMX_IPUV3_CORE is disabled) until the following patch.
> 
> Would it make sense to squash this with the following patch for better
> bisectability?

Yes it does, I'll do so in v2.

-- 
Regards,

Laurent Pinchart
