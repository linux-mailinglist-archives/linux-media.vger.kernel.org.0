Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD5B5FFD64
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 07:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiJPFxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 01:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiJPFxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 01:53:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBC43DBD6
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 22:53:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B04C30A;
        Sun, 16 Oct 2022 07:53:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665899617;
        bh=nY3LtBgh9GaI/Ev9+Z++q30u+AolROGG77sl+7Jqa7A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tCkx3YjzGSP/YkGjnuCtDWMKZ8388ntLyVM24oSItx9jzo0/30xHlZjAK9N19D55s
         gjzOn/9U8KYnkVufQ1Uf+Zxk9kg4wSeGoVp5xKwU8WU4LN4eups7/gGfrAD7EFKJNy
         nWP72vQ18mIsSCORXNaEdwZn72Zm+m04iAq0k5Zk=
Date:   Sun, 16 Oct 2022 08:53:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 18/19] media: i2c: imx290: Add crop selection targets
 support
Message-ID: <Y0ucSuT9vYkwbynH@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <20220721083540.1525-19-laurent.pinchart@ideasonboard.com>
 <CAPY8ntD=rk+dfA8_gjJ7-Q07qL0Fgz5y_ug+jXJh=CH1U=bjjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntD=rk+dfA8_gjJ7-Q07qL0Fgz5y_ug+jXJh=CH1U=bjjQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Jul 21, 2022 at 04:39:08PM +0100, Dave Stevenson wrote:
> On Thu, 21 Jul 2022 at 09:36, Laurent Pinchart wrote:
> > Implement read-only access to crop selection rectangles to expose the
> > analogue crop rectangle. The public (leaked) IMX290 documentation is not
> > very clear on how cropping is implemented and configured exactly, so
> > the margins may not be entirely accurate.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 94 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index baf9941c5fbe..0cb11ec1cf0f 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -105,6 +105,53 @@
> >
> >  #define IMX290_VMAX_DEFAULT                            1125
> >
> > +
> > +/*
> > + * The IMX290 pixel array is organized as follows:
> > + *
> > + *     +------------------------------------+
> > + *     |           Optical Black            |     }  Vertical effective optical black (10)
> > + * +---+------------------------------------+---+
> > + * |   |                                    |   | }  Effective top margin (8)
> > + * |   |   +----------------------------+   |   | \
> > + * |   |   |                            |   |   |  |
> > + * |   |   |                            |   |   |  |
> > + * |   |   |                            |   |   |  |
> > + * |   |   |    Recording Pixel Area    |   |   |  | Recommended height (1080)
> > + * |   |   |                            |   |   |  |
> > + * |   |   |                            |   |   |  |
> > + * |   |   |                            |   |   |  |
> > + * |   |   +----------------------------+   |   | /
> > + * |   |                                    |   | }  Effective bottom margin (8)
> 
> I have an official datasheet from Sony. "Effective margin for colour
> processing" at the bottom is stated to be 9 lines, not 8. That also
> makes the numbers then tally of total height being 8 + 1080 + 9 =
> 1097.

Will fix in v2. The value in the text and macro is correct, only the
diagram has an issue.

> Otherwise I agree with the numbers you quote here.
> 
> My datasheet does go into how window mode is configured, however
> window mode is not being used.
> The register sets present in the driver set the output image size to
> 1920x1080 or 1280x720 of the overall 1945x1097 pixels. They differ
> slightly from the definitions given in the datasheet for the Full HD
> 1080p and HD720p modes which read out 1945x1097 and 1297x725 pixels
> respectively (assuming I've read it correctly). Exactly how those
> extra pixels are cropped off isn't defined, but I'd suspect it was the
> top left portion of the full image.
> 
> If you want 100% defined cropping for each mode then that should be
> achievable using window mode.

I'd like that, but one thing at a time :-) I may experiment if I can
find free time.

> > + * +---+------------------------------------+---+
> > + *  <-> <-> <--------------------------> <-> <->
> > + *                                            \----  Ignored right margin (4)
> > + *                                        \--------  Effective right margin (9)
> > + *                       \-------------------------  Recommended width (1920)
> > + *       \-----------------------------------------  Effective left margin (8)
> > + *   \---------------------------------------------  Ignored left margin (4)
> > + *
> > + * The optical black lines are output over CSI-2 with a separate data type.
> > + *
> > + * The pixel array is meant to have 1920x1080 usable pixels after image
> > + * processing in an ISP. It has 8 (9) extra active pixels usable for color
> > + * processing in the ISP on the top and left (bottom and right) sides of the
> > + * image. In addition, 4 additional pixels are present on the left and right
> > + * sides of the image, documented as "ignored area".
> > + *
> > + * As far as is understood, all pixels of the pixel array (ignored area, color
> > + * processing margins and recording area) can be output by the sensor.
> > + */
> > +
> > +#define IMX290_PIXEL_ARRAY_WIDTH                       1945
> > +#define IMX290_PIXEL_ARRAY_HEIGHT                      1097
> > +#define IMX920_PIXEL_ARRAY_MARGIN_LEFT                 12
> > +#define IMX920_PIXEL_ARRAY_MARGIN_RIGHT                        13
> > +#define IMX920_PIXEL_ARRAY_MARGIN_TOP                  8
> > +#define IMX920_PIXEL_ARRAY_MARGIN_BOTTOM               9
> > +#define IMX290_PIXEL_ARRAY_RECORDING_WIDTH             1920
> > +#define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT            1080
> > +
> >  static const char * const imx290_supply_name[] = {
> >         "vdda",
> >         "vddd",
> > @@ -671,6 +718,52 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> >         return 0;
> >  }
> >
> > +static int imx290_get_selection(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_selection *sel)
> > +{
> > +       struct imx290 *imx290 = to_imx290(sd);
> > +       struct v4l2_mbus_framefmt *format;
> > +
> > +       switch (sel->target) {
> > +       case V4L2_SEL_TGT_CROP: {
> > +               format = imx290_get_pad_format(imx290, sd_state, sel->which);
> > +
> > +               mutex_lock(&imx290->lock);
> > +
> > +               sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> > +                          + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2;
> > +               sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
> > +                           + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2;
> > +               sel->r.width = format->width;
> > +               sel->r.height = format->height;
> > +
> > +               mutex_unlock(&imx290->lock);
> > +               return 0;
> > +       }
> > +
> > +       case V4L2_SEL_TGT_NATIVE_SIZE:
> > +       case V4L2_SEL_TGT_CROP_BOUNDS:
> > +               sel->r.top = 0;
> > +               sel->r.left = 0;
> > +               sel->r.width = IMX290_PIXEL_ARRAY_WIDTH;
> > +               sel->r.height = IMX290_PIXEL_ARRAY_HEIGHT;
> > +
> > +               return 0;
> > +
> > +       case V4L2_SEL_TGT_CROP_DEFAULT:
> > +               sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP;
> > +               sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT;
> > +               sel->r.width = IMX290_PIXEL_ARRAY_RECORDING_WIDTH;
> > +               sel->r.height = IMX290_PIXEL_ARRAY_RECORDING_HEIGHT;
> > +
> > +               return 0;
> > +
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +}
> > +
> >  static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
> >                                   struct v4l2_subdev_state *sd_state)
> >  {
> > @@ -887,6 +980,7 @@ static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
> >         .enum_frame_size = imx290_enum_frame_size,
> >         .get_fmt = imx290_get_fmt,
> >         .set_fmt = imx290_set_fmt,
> > +       .get_selection = imx290_get_selection,
> >  };
> >
> >  static const struct v4l2_subdev_ops imx290_subdev_ops = {

-- 
Regards,

Laurent Pinchart
