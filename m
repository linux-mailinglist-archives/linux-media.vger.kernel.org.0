Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A35378D86A
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 20:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbjH3Sa0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 14:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242574AbjH3JFC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 05:05:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72566CCB
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 02:04:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8D814E6;
        Wed, 30 Aug 2023 11:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693386215;
        bh=d5WOyqJyL2AkT7IfYlqucY9V54//ZubQUyMylnruSTg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nImZFyk81RolnbttykEc1qEeEUS2itIHGzAqSKbrf9nvIB8qn37tRpn7q3yLPU8pg
         VHUVjUuv01EDZe2iDMQs2pyK0PCBWKh76p8JVmPbfcjfYN/vsmOGSIHEC5tEP14xcU
         feLdlnRjwLgzh1Gzh0SvyCZ+RgVJVphD+/ATPFkI=
Date:   Wed, 30 Aug 2023 12:05:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 2/2] media: i2c: imx219: Fix crop rectangle setting
 when changing format
Message-ID: <20230830090507.GM6477@pendragon.ideasonboard.com>
References: <20230814193435.24158-1-laurent.pinchart@ideasonboard.com>
 <20230814193435.24158-3-laurent.pinchart@ideasonboard.com>
 <ujpugw52leros2siag4wtvxhwkmnsazwdiofvpvtugjrvc5zvv@v4u26p6a7dnj>
 <20230828191506.GA17083@pendragon.ideasonboard.com>
 <6wdfupwaev2pchwuyh27kn4rj26rtrs6xqhiefu5tn24qymali@t2mjl5bdaa5v>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6wdfupwaev2pchwuyh27kn4rj26rtrs6xqhiefu5tn24qymali@t2mjl5bdaa5v>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Aug 29, 2023 at 08:31:27AM +0200, Jacopo Mondi wrote:
> On Mon, Aug 28, 2023 at 10:15:06PM +0300, Laurent Pinchart wrote:
> > On Mon, Aug 28, 2023 at 02:19:54PM +0200, Jacopo Mondi wrote:
> > > On Mon, Aug 14, 2023 at 10:34:35PM +0300, Laurent Pinchart wrote:
> > > > When moving the imx219 driver to the subdev active state, commit
> > > > e8a5b1df000e ("media: i2c: imx219: Use subdev active state") used the
> > > > pad crop rectangle stored in the subdev state to report the crop
> > > > rectangle of the active mode. That crop rectangle was however not set in
> > > > the state when setting the format, which resulted in reporting an
> > > > incorrect crop rectangle to userspace. Fix it.
> > > >
> > > > Fixes: e8a5b1df000e ("media: i2c: imx219: Use subdev active state")
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >  drivers/media/i2c/imx219.c | 11 ++++++-----
> > > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > index 6f88e002c8d8..ec53abe2e84e 100644
> > > > --- a/drivers/media/i2c/imx219.c
> > > > +++ b/drivers/media/i2c/imx219.c
> > > > @@ -750,6 +750,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > > >  	const struct imx219_mode *mode;
> > > >  	int exposure_max, exposure_def, hblank;
> > > >  	struct v4l2_mbus_framefmt *format;
> > > > +	struct v4l2_rect *crop;
> > > >
> > > >  	mode = v4l2_find_nearest_size(supported_modes,
> > > >  				      ARRAY_SIZE(supported_modes),
> > > > @@ -757,10 +758,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > > >  				      fmt->format.width, fmt->format.height);
> > > >
> > > >  	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> > > > -	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > >
> > > > -	if (imx219->mode == mode && format->code == fmt->format.code)
> > > > -		return 0;
> > >
> > > Has this check been lost ?
> >
> > It has. Is it an issue ?
> 
> well, the check ensure we exit earlier if the sensor configuration
> doesn't change.. as the newly introduced crop rectangle comes from the
> mode as well, I'm missing why it should now be dropped...

This is a minor optimization, and most drivers don't have similar code.
I would like to eventually improve consistency between camera sensor
drivers, so I thought I would drop the check here.

You're right that it should at least be mentioned in the commit message,
and likely split to a separate patch.

> > > > +	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > > +	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > > > +
> > > > +	*format = fmt->format;
> > > > +	*crop = mode->crop;
> > > >
> > > >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > >  		imx219->mode = mode;
> > > > @@ -788,8 +791,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > > >  					 hblank);
> > > >  	}
> > > >
> > > > -	*format = fmt->format;
> > > > -
> > > >  	return 0;
> > > >  }
> > > >

-- 
Regards,

Laurent Pinchart
