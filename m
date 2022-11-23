Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB5A9635AF2
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 12:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237096AbiKWLEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 06:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237200AbiKWLD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 06:03:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E893A2610B
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 03:00:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFA1A88F;
        Wed, 23 Nov 2022 12:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669201227;
        bh=1ImU1eNT1DdzwouZq/mqlbZgJT8LeXtEajqhpgsh1S0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X2nJBiHtg/4gNGqF2IGnXeHxLioQbanmLxI0VypYEpQBRPM7/53nN+UExWZiKJdDL
         KSkkxAgJvlCLtCybl9I68hDaw9t8MzGeDtm0BcF6ZV6/KfqZ17h14boU07p+0AFDwa
         hDBv60LGqVH/8u3Dxfb5Gv0kGrzz8pe3acl3GnYw=
Date:   Wed, 23 Nov 2022 13:00:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 07/15] media: i2c: imx290: Factor out black level
 setting to a function
Message-ID: <Y339O5TYeO2jVRYP@pendragon.ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
 <20221122223250.21233-8-laurent.pinchart@ideasonboard.com>
 <CAPY8ntAqXK3efWB+J_KG==1yuewmon1abea8enk0CL8p9pkS9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAqXK3efWB+J_KG==1yuewmon1abea8enk0CL8p9pkS9A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Nov 23, 2022 at 10:08:19AM +0000, Dave Stevenson wrote:
> On Tue, 22 Nov 2022 at 22:34, Laurent Pinchart wrote:
> >
> > The black level programmed in the BLKLEVEL register depends on the
> > output format. The black level value computation is currently performed
> > in imx290_set_ctrl(), in addition to having different black level values
> > in the output-specific register value tables. Move it to a separate
> > function to simplify the imx290_set_ctrl() code.
> 
> Does this actually help?
> The sensor only supports 10 and 12 bpp readout, so making it generic
> for any bpp is rather redundant.
> If you are looking at having different on-sensor black level values
> kicking around, then tuning data goes out the window.

This may be needed for some use cases, but that's not what I'm after
here. By the way, could you explain why we can't just set it to 0 in the
sensor and avoid subtracting it in the ISP (at least for the data
pedestal value that is added on purpose in the sensor, there can also be
an additional black level due to other reasons) ? I'm sure there's a
reason :-)

> OK we do appear to have duplication between imx290_[10|12]bit_settings
> and imx290_set_ctrl, but I don't get the need to compute it.

The idea was to centralize black level setting in a single place, to
prepare for the removal of he imx290->bpp field. It's really in
imx290_set_ctrl() that it matters, I could keep the value in the
imx290_10bit_settings and imx290_12bit_settings arrays, but I thought I
could as well do it the same way everywhere.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 53 +++++++++++++++++++++-----------------
> >  1 file changed, 29 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 135ed55592a1..d9fc6c44b0f0 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -152,6 +152,9 @@
> >  #define IMX290_PIXEL_ARRAY_RECORDING_WIDTH             1920
> >  #define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT            1080
> >
> > +/* Equivalent value for 16bpp */
> > +#define IMX290_BLACK_LEVEL_DEFAULT                     3840
> > +
> >  #define IMX290_NUM_SUPPLIES                            3
> >
> >  struct imx290_regval {
> > @@ -315,7 +318,6 @@ static const struct imx290_regval imx290_10bit_settings[] = {
> >         { IMX290_ADBIT2, IMX290_ADBIT2_10BIT },
> >         { IMX290_ADBIT3, IMX290_ADBIT3_10BIT },
> >         { IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW10 },
> > -       { IMX290_BLKLEVEL, 60 },
> >  };
> >
> >  static const struct imx290_regval imx290_12bit_settings[] = {
> > @@ -325,7 +327,6 @@ static const struct imx290_regval imx290_12bit_settings[] = {
> >         { IMX290_ADBIT2, IMX290_ADBIT2_12BIT },
> >         { IMX290_ADBIT3, IMX290_ADBIT3_12BIT },
> >         { IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
> > -       { IMX290_BLKLEVEL, 240 },
> >  };
> >
> >  /* supported link frequencies */
> > @@ -516,35 +517,43 @@ static int imx290_set_data_lanes(struct imx290 *imx290)
> >         return ret;
> >  }
> >
> > +static int imx290_set_black_level(struct imx290 *imx290,
> > +                                 unsigned int black_level, int *err)
> > +{
> > +       return imx290_write(imx290, IMX290_BLKLEVEL,
> > +                           black_level >> (16 - imx290->bpp), err);
> > +}
> > +
> >  static int imx290_write_current_format(struct imx290 *imx290)
> >  {
> > +       const struct imx290_regval *regs;
> > +       unsigned int num_regs;
> > +       unsigned int bpp;
> >         int ret;
> >
> >         switch (imx290->current_format.code) {
> >         case MEDIA_BUS_FMT_SRGGB10_1X10:
> > -               ret = imx290_set_register_array(imx290, imx290_10bit_settings,
> > -                                               ARRAY_SIZE(
> > -                                                       imx290_10bit_settings));
> > -               if (ret < 0) {
> > -                       dev_err(imx290->dev, "Could not set format registers\n");
> > -                       return ret;
> > -               }
> > +               regs = imx290_10bit_settings;
> > +               num_regs = ARRAY_SIZE(imx290_10bit_settings);
> > +               bpp = 10;
> >                 break;
> >         case MEDIA_BUS_FMT_SRGGB12_1X12:
> > -               ret = imx290_set_register_array(imx290, imx290_12bit_settings,
> > -                                               ARRAY_SIZE(
> > -                                                       imx290_12bit_settings));
> > -               if (ret < 0) {
> > -                       dev_err(imx290->dev, "Could not set format registers\n");
> > -                       return ret;
> > -               }
> > +               regs = imx290_12bit_settings;
> > +               num_regs = ARRAY_SIZE(imx290_12bit_settings);
> > +               bpp = 12;
> >                 break;
> >         default:
> >                 dev_err(imx290->dev, "Unknown pixel format\n");
> >                 return -EINVAL;
> >         }
> >
> > -       return 0;
> > +       ret = imx290_set_register_array(imx290, regs, num_regs);
> > +       if (ret < 0) {
> > +               dev_err(imx290->dev, "Could not set format registers\n");
> > +               return ret;
> > +       }
> > +
> > +       return imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT, &ret);
> >  }
> >
> >  /* ----------------------------------------------------------------------------
> > @@ -573,7 +582,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> >
> >         case V4L2_CID_TEST_PATTERN:
> >                 if (ctrl->val) {
> > -                       imx290_write(imx290, IMX290_BLKLEVEL, 0, &ret);
> > +                       imx290_set_black_level(imx290, 0, &ret);
> >                         usleep_range(10000, 11000);
> >                         imx290_write(imx290, IMX290_PGCTRL,
> >                                      (u8)(IMX290_PGCTRL_REGEN |
> > @@ -582,12 +591,8 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 } else {
> >                         imx290_write(imx290, IMX290_PGCTRL, 0x00, &ret);
> >                         usleep_range(10000, 11000);
> > -                       if (imx290->bpp == 10)
> > -                               imx290_write(imx290, IMX290_BLKLEVEL, 0x3c,
> > -                                            &ret);
> > -                       else /* 12 bits per pixel */
> > -                               imx290_write(imx290, IMX290_BLKLEVEL, 0xf0,
> > -                                            &ret);
> > +                       imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT,
> > +                                              &ret);
> >                 }
> >                 break;
> >         default:

-- 
Regards,

Laurent Pinchart
