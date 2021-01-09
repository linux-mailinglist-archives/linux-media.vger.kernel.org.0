Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645092EFC7A
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 01:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbhAIAxW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 19:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbhAIAxW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 19:53:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2A8C061573
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 16:52:41 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09C86DA;
        Sat,  9 Jan 2021 01:52:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610153560;
        bh=J8DyCpli5g6zv8HmZeR9ZDxglhVfs7e4eN3r65imI9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nen0U8kbtd3eFXA85YUWALmn7LZdtmYf9HRtnLSk2lL6xizCEWafyhqrI+klv8Wju
         pZ6TYFZ0XBl89tMBAJkyEwUex4K5+/t9TpQjc9WeTJnoACkUWy+pRd+J6Upz6C+OUg
         pk+GiUFAx0J9eey4e9r75cTqrC5pGtYiP3oWbOKM=
Date:   Sat, 9 Jan 2021 02:52:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 68/75] media: imx: imx7_mipi_csis: Calculate Ths_settle
 from source pixel rate
Message-ID: <X/j+SwEoR1PtWdNy@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-69-laurent.pinchart@ideasonboard.com>
 <20210106225924.GF850@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210106225924.GF850@valkosipuli.retiisi.org.uk>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Jan 07, 2021 at 12:59:24AM +0200, Sakari Ailus wrote:
> On Tue, Jan 05, 2021 at 05:28:45PM +0200, Laurent Pinchart wrote:
> > The Ths_settle timing parameter depends solely on the pixel rate of the
> > source. Calculate it at runtime instead of requiring it to be specified
> > in the device tree.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/staging/media/imx/imx7-mipi-csis.c | 65 ++++++++++++++++++----
> >  1 file changed, 53 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> > index 3c68ee8b2a59..c83450ac37fa 100644
> > --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> > +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/reset.h>
> >  #include <linux/spinlock.h>
> >  
> > +#include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-mc.h>
> > @@ -233,7 +234,11 @@ struct csi_state {
> >  	struct media_pad pads[CSIS_PADS_NUM];
> >  	struct v4l2_subdev mipi_sd;
> >  	struct v4l2_async_notifier notifier;
> > -	struct v4l2_subdev *src_sd;
> > +
> > +	struct {
> > +		struct v4l2_subdev *sd;
> > +		struct v4l2_ctrl *pixel_rate;
> > +	} src;
> >  
> >  	u8 index;
> >  	struct platform_device *pdev;
> > @@ -482,6 +487,31 @@ static void __mipi_csis_set_format(struct csi_state *state)
> >  	mipi_csis_write(state, MIPI_CSIS_ISPRESOL_CH0, val);
> >  }
> >  
> > +static int mipi_csis_calculate_params(struct csi_state *state)
> > +{
> > +	u64 pixel_rate;
> > +	u32 lane_rate;
> > +
> > +	/* Calculate the line rate from the pixel rate. */
> > +	pixel_rate = v4l2_ctrl_g_ctrl_int64(state->src.pixel_rate);
> 
> Could you instead use v4l2_get_link_freq()?
> 
> I guess we're also moving to the LINK_FREQ control to tell this.

I've developed this patch before we discussed moving to LINQ_FREQ :-)
I'll fix this in v2.

> > +	lane_rate = div_u64(pixel_rate, state->bus.num_data_lanes)
> > +		  * state->csis_fmt->width;
> > +	if (lane_rate < 80000000 || lane_rate > 1500000000) {
> > +		dev_dbg(state->dev, "Out-of-bound lane rate %u\n", lane_rate);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * The HSSETTLE counter value is document in a table, but can also
> > +	 * easily be calculated.
> > +	 */
> > +	state->hs_settle = (lane_rate - 5000000) / 45000000;
> 
> Much better, thank you!

-- 
Regards,

Laurent Pinchart
