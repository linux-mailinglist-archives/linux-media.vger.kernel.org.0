Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748ED78545C
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 11:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235453AbjHWJgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 05:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235486AbjHWJfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 05:35:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03DCF44B1
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 02:25:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAD075A4;
        Wed, 23 Aug 2023 11:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692782658;
        bh=SrYhw3qFCzt9m/ewHGplb/TIzImNrFXhGacb7DoUgHU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LynTZTFKlDEfPEnTK2+c0/nltWMqQcRL0XAZdIRH1MDDrXHEPw++G4ytDy/GICjvQ
         qPaQTWxj7PZoOowTG79igP2evvP6gi4TwYpIvVSMCO+sl2eaFzc21pxSrcPCeQbqh1
         jIWpetEav/MDjHv5nOOFEu9jzW5yJgaQ0aiaFEP8=
Date:   Wed, 23 Aug 2023 12:25:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 06/18] media: i2c: imx219: Merge format and binning
 setting functions
Message-ID: <20230823092542.GH4143@pendragon.ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-7-laurent.pinchart@ideasonboard.com>
 <CAPY8ntBiV4uBmVEnwkZwSny+PP6F-0ZQfQ_ZJzmv8WzHHQpH7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBiV4uBmVEnwkZwSny+PP6F-0ZQfQ_ZJzmv8WzHHQpH7g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, Aug 22, 2023 at 05:29:44PM +0100, Dave Stevenson wrote:
> On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart wrote:
> >
> > The imx219_set_binning() function sets registers based on the bpp value,
> > which is computed in imx219_set_framefmt(). As both functions are called
> > from the same place consecutively, and set registers based on the
> > selected mode, merge them together to simplify the code.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 43 +++++++++-----------------------------
> >  1 file changed, 10 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 9490dcba42ab..3a0b082d9ee0 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -618,6 +618,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >  {
> >         const struct imx219_mode *mode = imx219->mode;
> >         unsigned int bpp;
> > +       u16 bin_mode;
> >         int ret = 0;
> >
> >         switch (format->code) {
> > @@ -648,6 +649,15 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >                   mode->crop.top - IMX219_PIXEL_ARRAY_TOP + mode->crop.height - 1,
> >                   &ret);
> >
> > +       if (!imx219->mode->binning)
> > +               bin_mode = IMX219_BINNING_NONE;
> > +       else if (bpp == 8)
> > +               bin_mode = IMX219_BINNING_2X2_ANALOG;
> > +       else
> > +               bin_mode = IMX219_BINNING_2X2;
> > +
> > +       cci_write(imx219->regmap, IMX219_REG_BINNING_MODE, bin_mode, &ret);
> 
> It feels a little weird using u16 for bin_mode because you happen to
> know that the underlying register is 16 bit, and then are relying on
> the compiler to extend it to u64 for cci_write. Is it better to use
> the native u64 for cci_write, or just use unsigned int?

I don't think it makes a major difference. I'll switch to u64 (and may
further rework this by splitting horizontal and vertical binning).

> Either way:
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> > +
> >         cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
> >                   format->width, &ret);
> >         cci_write(imx219->regmap, IMX219_REG_Y_OUTPUT_SIZE,
> > @@ -665,32 +675,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >         return ret;
> >  }
> >
> > -static int imx219_set_binning(struct imx219 *imx219,
> > -                             const struct v4l2_mbus_framefmt *format)
> > -{
> > -       if (!imx219->mode->binning)
> > -               return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
> > -                                IMX219_BINNING_NONE, NULL);
> > -
> > -       switch (format->code) {
> > -       case MEDIA_BUS_FMT_SRGGB8_1X8:
> > -       case MEDIA_BUS_FMT_SGRBG8_1X8:
> > -       case MEDIA_BUS_FMT_SGBRG8_1X8:
> > -       case MEDIA_BUS_FMT_SBGGR8_1X8:
> > -               return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
> > -                                IMX219_BINNING_2X2_ANALOG, NULL);
> > -
> > -       case MEDIA_BUS_FMT_SRGGB10_1X10:
> > -       case MEDIA_BUS_FMT_SGRBG10_1X10:
> > -       case MEDIA_BUS_FMT_SGBRG10_1X10:
> > -       case MEDIA_BUS_FMT_SBGGR10_1X10:
> > -               return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
> > -                                IMX219_BINNING_2X2, NULL);
> > -       }
> > -
> > -       return -EINVAL;
> > -}
> > -
> >  static int imx219_get_selection(struct v4l2_subdev *sd,
> >                                 struct v4l2_subdev_state *sd_state,
> >                                 struct v4l2_subdev_selection *sel)
> > @@ -764,13 +748,6 @@ static int imx219_start_streaming(struct imx219 *imx219,
> >                 goto err_rpm_put;
> >         }
> >
> > -       ret = imx219_set_binning(imx219, format);
> > -       if (ret) {
> > -               dev_err(&client->dev, "%s failed to set binning: %d\n",
> > -                       __func__, ret);
> > -               goto err_rpm_put;
> > -       }
> > -
> >         /* Apply customized values from user */
> >         ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
> >         if (ret)

-- 
Regards,

Laurent Pinchart
