Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACBFD4D6774
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 18:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350720AbiCKRUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 12:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344692AbiCKRUw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 12:20:52 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F89B17FD32
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 09:19:48 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 558F1240003;
        Fri, 11 Mar 2022 17:19:45 +0000 (UTC)
Date:   Fri, 11 Mar 2022 18:19:43 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 2/4] media: imx: imx-mipi-csis: Drop unneeded system PM
 implementation
Message-ID: <20220311171943.hkkeahqjm2sbeb6u@uno.localdomain>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
 <20220311135535.30108-3-laurent.pinchart@ideasonboard.com>
 <20220311165325.dihy6if4vu4tdaty@uno.localdomain>
 <YiuB3xWmZjR6cWsS@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YiuB3xWmZjR6cWsS@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi LAurent

On Fri, Mar 11, 2022 at 07:07:43PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Fri, Mar 11, 2022 at 05:53:25PM +0100, Jacopo Mondi wrote:
> > Hi Laurent,
> >
> >    the commit title makes me think runtime_pm has been dropped
> >
> > I would
> >
> > media: imx: imx-mipi-csis: Drop manual PM tracking
>
> I wrote "system PM" specifically to avoid implying runtime PM was
> dropped, but it seems it's not enough ? :-) I can change the subject,
> but I find "manual PM tracking" not very descriptive of what the patch
> does.

Fine with what you have then, if the meaning was the same :)

>
> > On Fri, Mar 11, 2022 at 03:55:33PM +0200, Laurent Pinchart wrote:
> > > There's no need to implement system suspend/resume manually, as video
> > > pipelines are supposed to be suspended in a controlled and ordered
> > > manner by the data sink driver at system suspend time (and similarly at
> > > resume time). Drop the system suspend/resume handlers.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/imx/imx-mipi-csis.c | 48 +++-------------------
> > >  1 file changed, 5 insertions(+), 43 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> > > index 6e06d19c1334..3bdfe05a6c54 100644
> > > --- a/drivers/media/platform/imx/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> > > @@ -250,8 +250,6 @@
> > >
> > >  enum {
> > >  	ST_POWERED	= 1,
> > > -	ST_STREAMING	= 2,
> > > -	ST_SUSPENDED	= 4,
> > >  };
> >
> > I see csis->state be dropped in the next patches so
> > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> >
> > >  struct mipi_csis_event {
> > > @@ -954,24 +952,17 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > >  	mutex_lock(&csis->lock);
> > >
> > >  	if (enable) {
> > > -		if (csis->state & ST_SUSPENDED) {
> > > -			ret = -EBUSY;
> > > -			goto unlock;
> > > -		}
> > > -
> > >  		mipi_csis_start_stream(csis);
> > >  		ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
> > >  		if (ret < 0)
> > >  			goto unlock;
> > >
> > >  		mipi_csis_log_counters(csis, true);
> > > -
> > > -		csis->state |= ST_STREAMING;
> > >  	} else {
> > >  		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
> > >
> > >  		mipi_csis_stop_stream(csis);
> > > -		csis->state &= ~ST_STREAMING;
> > > +
> > >  		if (csis->debug.enable)
> > >  			mipi_csis_log_counters(csis, true);
> > >  	}
> > > @@ -1356,7 +1347,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> > >   * Suspend/resume
> > >   */
> > >
> > > -static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
> > > +static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
> > >  {
> > >  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > @@ -1370,8 +1361,6 @@ static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
> > >  			goto unlock;
> > >  		mipi_csis_clk_disable(csis);
> > >  		csis->state &= ~ST_POWERED;
> > > -		if (!runtime)
> > > -			csis->state |= ST_SUSPENDED;
> > >  	}
> > >
> > >  unlock:
> > > @@ -1380,15 +1369,13 @@ static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
> > >  	return ret ? -EAGAIN : 0;
> > >  }
> > >
> > > -static int mipi_csis_pm_resume(struct device *dev, bool runtime)
> > > +static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
> > >  {
> > >  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > >  	int ret = 0;
> > >
> > >  	mutex_lock(&csis->lock);
> > > -	if (!runtime && !(csis->state & ST_SUSPENDED))
> > > -		goto unlock;
> > >
> > >  	if (!(csis->state & ST_POWERED)) {
> > >  		ret = mipi_csis_phy_enable(csis);
> > > @@ -1398,10 +1385,6 @@ static int mipi_csis_pm_resume(struct device *dev, bool runtime)
> > >  		csis->state |= ST_POWERED;
> > >  		mipi_csis_clk_enable(csis);
> > >  	}
> > > -	if (csis->state & ST_STREAMING)
> > > -		mipi_csis_start_stream(csis);
> > > -
> > > -	csis->state &= ~ST_SUSPENDED;
> > >
> > >  unlock:
> > >  	mutex_unlock(&csis->lock);
> > > @@ -1409,30 +1392,9 @@ static int mipi_csis_pm_resume(struct device *dev, bool runtime)
> > >  	return ret ? -EAGAIN : 0;
> > >  }
> > >
> > > -static int __maybe_unused mipi_csis_suspend(struct device *dev)
> > > -{
> > > -	return mipi_csis_pm_suspend(dev, false);
> > > -}
> > > -
> > > -static int __maybe_unused mipi_csis_resume(struct device *dev)
> > > -{
> > > -	return mipi_csis_pm_resume(dev, false);
> > > -}
> > > -
> > > -static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
> > > -{
> > > -	return mipi_csis_pm_suspend(dev, true);
> > > -}
> > > -
> > > -static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
> > > -{
> > > -	return mipi_csis_pm_resume(dev, true);
> > > -}
> > > -
> > >  static const struct dev_pm_ops mipi_csis_pm_ops = {
> > >  	SET_RUNTIME_PM_OPS(mipi_csis_runtime_suspend, mipi_csis_runtime_resume,
> > >  			   NULL)
> > > -	SET_SYSTEM_SLEEP_PM_OPS(mipi_csis_suspend, mipi_csis_resume)
> > >  };
> > >
> > >  /* -----------------------------------------------------------------------------
> > > @@ -1557,7 +1519,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
> > >  	/* Enable runtime PM. */
> > >  	pm_runtime_enable(dev);
> > >  	if (!pm_runtime_enabled(dev)) {
> > > -		ret = mipi_csis_pm_resume(dev, true);
> > > +		ret = mipi_csis_runtime_resume(dev);
> > >  		if (ret < 0)
> > >  			goto unregister_all;
> > >  	}
> > > @@ -1592,7 +1554,7 @@ static int mipi_csis_remove(struct platform_device *pdev)
> > >  	v4l2_async_unregister_subdev(&csis->sd);
> > >
> > >  	pm_runtime_disable(&pdev->dev);
> > > -	mipi_csis_pm_suspend(&pdev->dev, true);
> > > +	mipi_csis_runtime_suspend(&pdev->dev);
> > >  	mipi_csis_clk_disable(csis);
> > >  	media_entity_cleanup(&csis->sd.entity);
> > >  	mutex_destroy(&csis->lock);
>
> --
> Regards,
>
> Laurent Pinchart
