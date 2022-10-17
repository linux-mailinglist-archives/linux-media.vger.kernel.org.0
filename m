Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235F76008D7
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiJQIiM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiJQIiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:38:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1A15FB6
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:38:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B5FBCCF;
        Mon, 17 Oct 2022 10:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665995888;
        bh=n7WpIOHSvDVVaAlzCH207N7FIuOtrpRCi1sld5sdMiQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nRK6zJXyZZr/1GEJpTmlD91e/3hX+qVgv4bbJsqkHl80zQ4aigIhEj+2Uh53prvKe
         qITyc1BjL0wTsr5YzAnV5GOrJT8vkBLEQjF1LwJpjLUIW486c3HuLHLYAsGU7V4Yst
         9cmbC/x+IrTovydFNuhQIr8hLQNy5fpMbexopLYw=
Date:   Mon, 17 Oct 2022 11:37:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 18/20] media: i2c: imx290: Factor out format retrieval
 to separate function
Message-ID: <Y00UWMmPTnmEuaI3@pendragon.ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
 <20221016061523.30127-19-laurent.pinchart@ideasonboard.com>
 <5869053.lOV4Wx5bFT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5869053.lOV4Wx5bFT@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Mon, Oct 17, 2022 at 07:55:28AM +0200, Alexander Stein wrote:
> Am Sonntag, 16. Oktober 2022, 08:15:21 CEST schrieb Laurent Pinchart:
> > The driver duplicates the same pattern to access the try or active
> > format in multiple locations. Factor it out to a separate function.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Avoid returning NULL from imx290_get_pad_format()
> > ---
> >  drivers/media/i2c/imx290.c | 24 ++++++++++++++----------
> >  1 file changed, 14 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 0b34d60f8ce2..b0ff0e8ed45a 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -519,6 +519,16 @@ static const struct v4l2_ctrl_ops imx290_ctrl_ops = {
> >  	.s_ctrl = imx290_set_ctrl,
> >  };
> > 
> > +static struct v4l2_mbus_framefmt *
> > +imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state *state,
> > +		      u32 which)
> > +{
> > +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > +		return &imx290->current_format;
> > +	else
> > +		return v4l2_subdev_get_try_format(&imx290->sd, state, 0);
> > +}
> > +
> 
> v4l2_subdev_get_try_format can return NULL, which would be dereferenced later 
> on. But this happens only if state is NULL itself, which will raise a WARN_ON 
> anyway. So i guess this is fine.

I'll add a patch on top of the series to convert the driver to the V4L2
active state, that should simplify all this.

> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> >  static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
> >  				 struct v4l2_subdev_state *sd_state,
> >  				 struct v4l2_subdev_mbus_code_enum *code)
> > @@ -562,12 +572,7 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
> > 
> >  	mutex_lock(&imx290->lock);
> > 
> > -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > -		framefmt = v4l2_subdev_get_try_format(&imx290->sd, sd_state,
> > -						      fmt->pad);
> > -	else
> > -		framefmt = &imx290->current_format;
> > -
> > +	framefmt = imx290_get_pad_format(imx290, sd_state, fmt->which);
> >  	fmt->format = *framefmt;
> > 
> >  	mutex_unlock(&imx290->lock);
> > @@ -627,10 +632,9 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> >  	fmt->format.code = imx290_formats[i].code;
> >  	fmt->format.field = V4L2_FIELD_NONE;
> > 
> > -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> > -		format = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> > -	} else {
> > -		format = &imx290->current_format;
> > +	format = imx290_get_pad_format(imx290, sd_state, fmt->which);
> > +
> > +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> >  		imx290->current_mode = mode;
> >  		imx290->bpp = imx290_formats[i].bpp;

-- 
Regards,

Laurent Pinchart
