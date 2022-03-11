Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8292E4D6740
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 18:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349557AbiCKRKr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 12:10:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349007AbiCKRKq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 12:10:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A424BD9966
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 09:09:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E46EA475;
        Fri, 11 Mar 2022 18:09:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647018582;
        bh=QiB2V5KOLrCdAj2fMKhrE+HyDnvkfnuwYJ9P9Bjgz6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PWGgWp6BOGE3KJB2iDYhMzk3rMrfxvtgMLUcso0mbx1aR0S9oTlepXq60ikP7K/w+
         crB5cDCiMlAQIt8dhmYo3MI5HUjtgwkVC2k3/UIvby0YEXuJpW+huGk80tEE9doeti
         tOrnL/xpdSOW9hc9SkVdCu8tsBkLsqqHwJRBRGpc=
Date:   Fri, 11 Mar 2022 19:09:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 4/4] media: imx: imx-mipi-csis: Simplify runtime PM
 implementation
Message-ID: <YiuCRX9NA0Dp9kpD@pendragon.ideasonboard.com>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
 <20220311135535.30108-5-laurent.pinchart@ideasonboard.com>
 <20220311170045.k2dmhbwupfjqws22@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311170045.k2dmhbwupfjqws22@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Mar 11, 2022 at 06:00:45PM +0100, Jacopo Mondi wrote:
> On Fri, Mar 11, 2022 at 03:55:35PM +0200, Laurent Pinchart wrote:
> > The runtime PM resume handler is guaranteed to be called on a suspended
> > device, and the suspend handler on a resumed device. The implementation
> > can thus be simplified.
> >
> > While at it, rename the mipi_csis_device state field to powered, as the
> > now state contains a single flag only.
> 
> Can we instead rely on pm_runtime_get_if_in_use() instead of manual
> tracking the power state ?
> 
> After all, the powered flag is only used in:
> 
> static int mipi_csis_log_status(struct v4l2_subdev *sd)
> {
> 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> 
> 	mutex_lock(&csis->lock);
> 	mipi_csis_log_counters(csis, true);
> 	if (csis->debug.enable && csis->powered)
> 		mipi_csis_dump_regs(csis);
> 	mutex_unlock(&csis->lock);
> 
> 	return 0;
> }
> 
> which could be simplified as
> 
> static int mipi_csis_log_status(struct v4l2_subdev *sd)
> {
> 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> 
> 	mipi_csis_log_counters(csis, true);
> 
> 	if (!csis->debug.enable)
>                 return 0;
> 
> 	mutex_lock(&csis->lock);
> 
>         if (!pm_runtime_get_if_in_use())
>                 goto unlock;
> 
>         mipi_csis_dump_regs(csis);
> 
>         pm_runtime_put();
> 
> unlock:
> 	mutex_unlock(&csis->lock);
> 
> 	return 0;
> }

That's a good idea. Do you mind if I do so on a patch on top of this
one, to not mix two separate changes ?

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/imx/imx-mipi-csis.c | 38 ++++++++++------------
> >  1 file changed, 17 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> > index d656b8bfcc33..f6ff8d50843c 100644
> > --- a/drivers/media/platform/imx/imx-mipi-csis.c
> > +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> > @@ -248,10 +248,6 @@
> >  #define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
> >  #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
> >
> > -enum {
> > -	ST_POWERED	= 1,
> > -};
> > -
> >  struct mipi_csis_event {
> >  	bool debug;
> >  	u32 mask;
> > @@ -331,10 +327,10 @@ struct mipi_csis_device {
> >  	u32 hs_settle;
> >  	u32 clk_settle;
> >
> > -	struct mutex lock;	/* Protect csis_fmt, format_mbus and state */
> > +	struct mutex lock;	/* Protect csis_fmt, format_mbus and powered */
> >  	const struct csis_pix_format *csis_fmt;
> >  	struct v4l2_mbus_framefmt format_mbus[CSIS_PADS_NUM];
> > -	u32 state;
> > +	bool powered;
> >
> >  	spinlock_t slock;	/* Protect events */
> >  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> > @@ -1193,7 +1189,7 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
> >
> >  	mutex_lock(&csis->lock);
> >  	mipi_csis_log_counters(csis, true);
> > -	if (csis->debug.enable && (csis->state & ST_POWERED))
> > +	if (csis->debug.enable && csis->powered)
> >  		mipi_csis_dump_regs(csis);
> >  	mutex_unlock(&csis->lock);
> >
> > @@ -1354,13 +1350,14 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
> >  	int ret = 0;
> >
> >  	mutex_lock(&csis->lock);
> > -	if (csis->state & ST_POWERED) {
> > -		ret = mipi_csis_phy_disable(csis);
> > -		if (ret)
> > -			goto unlock;
> > -		mipi_csis_clk_disable(csis);
> > -		csis->state &= ~ST_POWERED;
> > -	}
> > +
> > +	ret = mipi_csis_phy_disable(csis);
> > +	if (ret)
> > +		goto unlock;
> > +
> > +	mipi_csis_clk_disable(csis);
> > +
> > +	csis->powered = false;
> >
> >  unlock:
> >  	mutex_unlock(&csis->lock);
> > @@ -1376,14 +1373,13 @@ static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
> >
> >  	mutex_lock(&csis->lock);
> >
> > -	if (!(csis->state & ST_POWERED)) {
> > -		ret = mipi_csis_phy_enable(csis);
> > -		if (ret)
> > -			goto unlock;
> > +	ret = mipi_csis_phy_enable(csis);
> > +	if (ret)
> > +		goto unlock;
> >
> > -		csis->state |= ST_POWERED;
> > -		mipi_csis_clk_enable(csis);
> > -	}
> > +	mipi_csis_clk_enable(csis);
> > +
> > +	csis->powered = true;
> >
> >  unlock:
> >  	mutex_unlock(&csis->lock);

-- 
Regards,

Laurent Pinchart
