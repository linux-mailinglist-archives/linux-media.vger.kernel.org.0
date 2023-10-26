Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A917D8004
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 11:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbjJZJvl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 05:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233186AbjJZJvk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 05:51:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1C118F
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 02:51:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E9A075B;
        Thu, 26 Oct 2023 11:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698313883;
        bh=LwNKLKwuxJTo8lmtInWm5+ExNP2WQkQyBzRzKYq7y84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IMLFTqTiEuPCoRJ5V7ZuVHT3zAnJx9O9pUIg+MZz9tguTrxY1wBV0HXg26NJeCegx
         i1rj4pUTCRe598taFh3GDnHaPQA1NPitm6JZGd1ix84W7r9v4e+vdSpvaJpnykNJPE
         4igr8WohKyPLg00tJKGEQacJA20K0fXEZufOBhBY=
Date:   Thu, 26 Oct 2023 12:51:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 3/9] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <20231026095142.GB1512@pendragon.ideasonboard.com>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-4-sakari.ailus@linux.intel.com>
 <58295947-a749-4752-80c6-00c353017dce@xs4all.nl>
 <ZToiYNcD1D9cOHPG@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZToiYNcD1D9cOHPG@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 26, 2023 at 08:25:04AM +0000, Sakari Ailus wrote:
> On Thu, Oct 26, 2023 at 09:26:40AM +0200, Hans Verkuil wrote:
> > On 26/10/2023 09:03, Sakari Ailus wrote:
> > > Rename the sub-devices state information access functions, removing
> > > "_stream" from them. This makes them shorter and so more convenient to
> > > use. No other sets of functions will be needed to access this information.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/ds90ub913.c                 |  3 +--
> > >  drivers/media/i2c/ds90ub953.c                 |  3 +--
> > >  drivers/media/i2c/ds90ub960.c                 | 12 ++++-----
> > >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 10 +++----
> > >  drivers/media/v4l2-core/v4l2-subdev.c         | 27 +++++++++----------
> > >  include/media/v4l2-subdev.h                   | 19 +++++++------
> > >  6 files changed, 34 insertions(+), 40 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> > > index 8e9ebed09f64..8bb6be956780 100644
> > > --- a/drivers/media/i2c/ds90ub913.c
> > > +++ b/drivers/media/i2c/ds90ub913.c
> > > @@ -424,8 +424,7 @@ static int ub913_set_fmt(struct v4l2_subdev *sd,
> > >  	}
> > >  
> > >  	/* Set sink format */
> > > -	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> > > -						  format->stream);
> > > +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> > >  	if (!fmt)
> > >  		return -EINVAL;
> > 
> > If we want shorter names, how about replacing _get_ with _g_? And of course
> > _set_ with _s_. I would prefer that, but it's up to you.
> 
> These functions doesn't actually "get" something, but return a pointer to
> the data. There's thus no corresponding set. I think I'll keep it as-is for
> now but I think "_get" could as well be removed here.
> 
> > 
> > Since we are changing function names here, I wonder if this isn't a good
> > opportunity to straighten out some more confusing names.
> > 
> > I noticed that in v4l2-subdev.h "fmt" typically refers to v4l2_subdev_format,
> > while "format" tends to refer to v4l2_mbus_framefmt.
> > 
> > I find this really confusing, especially if you do not use these functions
> > regularly.
> > 
> > My personal preference would be to use "format" for things relating to
> > v4l2_subdev_format and "ffmt" for v4l2_mbus_framefmt. Or possibly just "fmt"
> > if people don't like "ffmt". It would signal the type of format a lot better.
> 
> I'll use ffmt for the name of the function.

I would avoid this, it will make things even more confusing by adding
yet another naming scheme. If we want to clean things up (and I think we
should), then it should be done on top, and span the entire subsystem.

> > Anyway, I'm just throwing this out here since I think it is confusing.

-- 
Regards,

Laurent Pinchart
