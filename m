Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B15178B360
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 16:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjH1Ome (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 10:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjH1OmG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 10:42:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4C3A1
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 07:42:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05B6C4E6;
        Mon, 28 Aug 2023 16:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693233641;
        bh=AFkP5U3/ej3uyiotNKc5ce1MHN6dvrbLGidOdS1CLG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DNcxFHM0bnlUSQoXeKANVqn0XQOXW3ebx79D1zjQve258UIGlSQ8VdfP1KUVoqfWa
         N7lzasnu2BQ7s1+bPQIj4jZmCBXUe42nXIjv95g/sD8zZNKfVk7zrWCA0wBHh8zhy9
         cSnjbOIpttcFvXHJvhdUitCKVdSw6aPSqKc7p29U=
Date:   Mon, 28 Aug 2023 17:42:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 08/18] media: i2c: imx219: Use active crop rectangle
 to configure registers
Message-ID: <20230828144211.GP14596@pendragon.ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-9-laurent.pinchart@ideasonboard.com>
 <7xmbzatak3bjrp7rjj2kkrxejrhuzftz257g26ag4grgmo2pkx@bebssa7r22jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7xmbzatak3bjrp7rjj2kkrxejrhuzftz257g26ag4grgmo2pkx@bebssa7r22jp>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 28, 2023 at 03:38:17PM +0200, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Tue, Aug 22, 2023 at 01:29:51AM +0300, Laurent Pinchart wrote:
> > Configure the crop-related registers from the values stored in the
> > active crop rectangle instead of the mode structure. This removes usage
> > of the mode from the imx219_set_framefmt(). No functional change is
> > intended.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 16776a3ae84d..1205986ce47e 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -615,9 +615,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >  }
> >
> >  static int imx219_set_framefmt(struct imx219 *imx219,
> > -			       const struct v4l2_mbus_framefmt *format)
> > +			       const struct v4l2_mbus_framefmt *format,
> > +			       const struct v4l2_rect *crop)
> >  {
> > -	const struct imx219_mode *mode = imx219->mode;
> >  	unsigned int bpp;
> >  	u16 bin_mode;
> >  	int ret = 0;
> > @@ -640,15 +640,13 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >  	}
> >
> >  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> > -		  mode->crop.left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> > +		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> >  	cci_write(imx219->regmap, IMX219_REG_X_ADD_END_A,
> > -		  mode->crop.left - IMX219_PIXEL_ARRAY_LEFT + mode->crop.width - 1,
> > -		  &ret);
> > +		  crop->left - IMX219_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
> >  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_STA_A,
> > -		  mode->crop.top - IMX219_PIXEL_ARRAY_TOP, &ret);
> > +		  crop->top - IMX219_PIXEL_ARRAY_TOP, &ret);
> >  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> > -		  mode->crop.top - IMX219_PIXEL_ARRAY_TOP + mode->crop.height - 1,
> > -		  &ret);
> > +		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> >
> >  	if (!imx219->mode->binning)
> >  		bin_mode = IMX219_BINNING_NONE;
> > @@ -719,6 +717,7 @@ static int imx219_start_streaming(struct imx219 *imx219,
> >  {
> >  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >  	const struct v4l2_mbus_framefmt *format;
> > +	const struct v4l2_rect *crop;
> >  	int ret;
> >
> >  	ret = pm_runtime_resume_and_get(&client->dev);
> > @@ -742,7 +741,8 @@ static int imx219_start_streaming(struct imx219 *imx219,
> >
> >  	/* Apply format and crop settings. */
> >  	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
> > -	ret = imx219_set_framefmt(imx219, format);
> > +	crop = v4l2_subdev_get_pad_crop(&imx219->sd, state, 0);
> > +	ret = imx219_set_framefmt(imx219, format, crop);
> 
> Nit:
> If I'm not mistaken (I've not been able to apply the series yet)
> 'format' and 'crop' are now only used to be passed to
> imx219_set_framefmt(). You could pass the state to
> imx219_set_framefmt().

I'll do that.

> Apart from that
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> 
> >  	if (ret) {
> >  		dev_err(&client->dev, "%s failed to set frame format: %d\n",
> >  			__func__, ret);

-- 
Regards,

Laurent Pinchart
