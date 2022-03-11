Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6228E4D6725
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 18:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239763AbiCKRHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 12:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbiCKRHW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 12:07:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339A31D639F
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 09:06:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA141486;
        Fri, 11 Mar 2022 18:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647018376;
        bh=J4524NyD8nQMYefUkvWTZMhvPJGDU8k4X80us/zKE50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eBN/ehsTqDtz7SnYvOwPpF00bvyPBiNSsj5VqM1QIiQqkHXePJ7sy5mK+1GSzDTqs
         fqG2UkH+QZRQrqS+N96fSs/v07oFEm8zX0MY2kWxkkreStPVHKzMIrlEaPVcqYrDq2
         w9mhNcZMGWmQf7gdav+zMe7M/ARCJKjGJvGRLqLQ=
Date:   Fri, 11 Mar 2022 19:05:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 1/4] media: imx: imx-mipi-csis: Don't use .s_power()
Message-ID: <YiuBd+azwX6uCkZ9@pendragon.ideasonboard.com>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
 <20220311135535.30108-2-laurent.pinchart@ideasonboard.com>
 <20220311163443.f6yxh23gqm7x5r3p@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311163443.f6yxh23gqm7x5r3p@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Mar 11, 2022 at 05:34:43PM +0100, Jacopo Mondi wrote:
> On Fri, Mar 11, 2022 at 03:55:32PM +0200, Laurent Pinchart wrote:
> > The subdev .s_power() operation is deprecated. Drop it, requiring sensor
> > drivers to correctly use runtime PM instead of relying on .s_power().
> >
> > As this driver has just been moved out of staging, and necessary drivers
> > to implement a full camera pipeline are still in staging, no platform
> > depends yet on this API being called. There is thus no risk of
> > regression.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/imx/imx-mipi-csis.c | 11 ++---------
> >  1 file changed, 2 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> > index 7baedc854186..6e06d19c1334 100644
> > --- a/drivers/media/platform/imx/imx-mipi-csis.c
> > +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> > @@ -937,7 +937,7 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
> >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > -	int ret;
> > +	int ret = 0;
> >
> >  	if (enable) {
> >  		ret = mipi_csis_calculate_params(csis);
> > @@ -949,10 +949,6 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> >  		ret = pm_runtime_resume_and_get(csis->dev);
> >  		if (ret < 0)
> >  			return ret;
> > -
> > -		ret = v4l2_subdev_call(csis->src_sd, core, s_power, 1);
> > -		if (ret < 0 && ret != -ENOIOCTLCMD)
> > -			goto done;
> >  	}
> >
> >  	mutex_lock(&csis->lock);
> > @@ -973,9 +969,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> >  		csis->state |= ST_STREAMING;
> >  	} else {
> >  		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
> > -		ret = v4l2_subdev_call(csis->src_sd, core, s_power, 0);
> > -		if (ret == -ENOIOCTLCMD)
> > -			ret = 0;
> > +
> 
> I think mipi_csis_s_stream() could be simplified even more
> 
> Now it looks like
> 
>                 if (enable) {
>                         pm_resume_and_get();
>                         ...
>                 }
> 
>                 mutex_lock();
> 
>                 if (enable) {
> 
>                 } else {
> 
>                 }
> 
>         out:
>                 mutex_unlock()
>                 if (ret < 0 || !enable)
>                         pm_runtime_put()
> 
>                 return ret;
> 
> Would it look better as
> 
>                 if (!enable) {
>                         lock();
>                         ...
>                         pm_runtime_put();
>                         ...
>                         unlock();
>                         return;
>                 }
> 
>                 /* non critical section stuff */
>                 pm_resume_and_get();
> 
>                 lock();
> 
>                 /* critical section stuff */
>                 if (ret)
>                         goto out;
> 
>                 unlock();
> 
>                 return 0;
> 
>         out:
>                 pm_runtime_put();
>                 return ret;

Additional cleanup is likely possible, I haven't really looked at that.
I was happy anough with a first simplification :-)

> This patch is good though, so the rework if desired can be done on top
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> >  		mipi_csis_stop_stream(csis);
> >  		csis->state &= ~ST_STREAMING;
> >  		if (csis->debug.enable)
> > @@ -985,7 +979,6 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> >  unlock:
> >  	mutex_unlock(&csis->lock);
> >
> > -done:
> >  	if (!enable || ret < 0)
> >  		pm_runtime_put(csis->dev);
> >

-- 
Regards,

Laurent Pinchart
