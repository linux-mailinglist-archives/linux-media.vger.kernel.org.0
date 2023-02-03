Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD1B6895B2
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 11:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbjBCKWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 05:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbjBCKWL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 05:22:11 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE669EE1D
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 02:21:48 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id e9so4870634vsj.3
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 02:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l6huWjUE3NDovZXOleLEs81k5GTDVATg2ily9v3AQr8=;
        b=V/ZrJO7MbMl8hS28vdyd+KtrOqQWLjcliFviBuzxvvjdg9eqCw4Rm+iu3mTnBSXaJ7
         C6/v2OifP1Nhdduy152jmxFVkCVEawApMB4xaGYddYqkxARvTKaZN5UAFuhy82r1B5Mx
         jE4smaMT7ohRaTyM6js7CXoLeviYky5d5MLrpcRw68KJ1YhmPRCBglJIppojWj6qNGFk
         fJ4h6l2hYiZ+T9hpZby6OMf4p5u6Xi1LcoOh1PftI4FyMzpttOU5rfuFbJU3pAFGsn+w
         uSIS0m7ACgROl0HQosiemeXCQb7YBpTEy8vz2QpTus8485A96w3XDkk5qxCIFUCVABWi
         Fbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6huWjUE3NDovZXOleLEs81k5GTDVATg2ily9v3AQr8=;
        b=Q1W8XB8HBQ144hLsUZKOfnrpEXSJ2HcrdHF7T7a0AThntQphSAuCRri3yvFhP3VSTa
         jpyiz/8kFt7dlCqeKfZ82h/lifFEGv7dYYv2D9lN4MnUXhHu3bLmQyWHVHCeCnQS+DbQ
         vG6PIJ4/oJz59Ov53xJMCd4+QWvge3/+mIciAn6ua65WX6WPqivDv4iYcFMZMSK8+r4U
         xflSuFIvmHRQVnEENQzZmwGKdcui0JzTExBSVbWrKRXOTnOODStgMTX511HqbqdIzS5P
         2qhOqC9RZUlYbraxZzYauTKJf59z3GeqlPIvHE7US/ifRG02pYeJIvl2GIWw7up3wZpf
         coIw==
X-Gm-Message-State: AO0yUKXqg/Rh2Rnr+/x13TMrR/Ub00Q+LlbfQbqF8cgsFlkIkoWQSM0K
        eRoq2uc5G7LD9s+xFUv/ZswINP3bEYzbdz6Rh4yfqUMKTE8TE+0i
X-Google-Smtp-Source: AK7set9RWVCYqrI0jmoKa03/7pXDKFr9YMSM8Pdfc/03ALy96JsJdZgCtP7RiHIRnDgCBcRJsjkF9Z2kIgTQHdGJpJw=
X-Received: by 2002:a05:6102:3005:b0:3eb:2024:bda9 with SMTP id
 s5-20020a056102300500b003eb2024bda9mr1633126vsa.45.1675419706257; Fri, 03 Feb
 2023 02:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-12-dave.stevenson@raspberrypi.com> <Y9w02OHdYDniISTB@pendragon.ideasonboard.com>
In-Reply-To: <Y9w02OHdYDniISTB@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 3 Feb 2023 10:21:28 +0000
Message-ID: <CAPY8ntCLDZK-zhxzMVUDdD63MGx+Kwt6hVF8bfZVJ60nHiBWOg@mail.gmail.com>
Subject: Re: [PATCH 11/11] media: i2c: imx290: Add support for H & V Flips
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, 2 Feb 2023 at 22:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you for the patch.
>
> On Tue, Jan 31, 2023 at 07:20:16PM +0000, Dave Stevenson wrote:
> > The sensor supports H & V flips, so add the relevant hooks for
> > V4L2_CID_HFLIP and V4L2_CID_VFLIP to configure them.
> >
> > Note that the Bayer order is maintained as the readout area
> > shifts by 1 pixel in the appropriate direction (note the
> > comment about the top margin being 8 pixels whilst the bottom
> > margin is 9).
>
> That's why ! Now it makes sense to me.
>
> > The V4L2_SEL_TGT_CROP region is therefore
> > adjusted appropriately.
>
> I'm not sure I like when sensors try to be clever... Out of curiosity,
> do you know if this automatic shift of the crop rectangle can be
> disabled ?

Not as far as I'm aware.
Most of the OnSemi sensors I've looked at also preserve the Bayer
order on flips, and the datasheets say they're doing the same thing of
shifting by one pixel. I did query if it could be disabled, and they
said no.

I have a suspicion that the situation here is actually worse, but
haven't had a chance to test experimentally.
The datasheet settings for all-pixel mode gives [X|Y]_OUT_SIZE as
1948x1097, but the driver sets them to 1920x1080 (1308x729 for the
1280x720 mode). Which pixels get dropped due to that reduction. My
expectation is that it'll be the right side and bottom edge, not a
centre crop as is currently assumed by the driver in get_selection. If
you flip that, then it'll be the top and left edges that get cropped
off.
If this is the case, then we'll have to switch to using window
cropping mode to request the desired crop. Some people may be happy
with this as it'll give them the information required to configure
VGA@129fps and CIF@205fps modes as mentioned in the datasheet. For now
I'm burying my head in the sand.

> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx290.c | 37 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 34 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 7f6746f74040..d2b7534f2c51 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -227,6 +227,8 @@ struct imx290 {
> >       struct v4l2_ctrl *hblank;
> >       struct v4l2_ctrl *vblank;
> >       struct v4l2_ctrl *exposure;
> > +     struct v4l2_ctrl *hflip;
> > +     struct v4l2_ctrl *vflip;
> >  };
> >
> >  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> > @@ -801,6 +803,24 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> >                                  NULL);
> >               break;
> >
> > +     case V4L2_CID_HFLIP:
> > +     case V4L2_CID_VFLIP:
> > +     {
> > +             u32 reg;
> > +
> > +             /* WINMODE is in bits [6:4], so need to read-modify-write */
>
> You could also cache the value of the register in struct imx290 to avoid
> the read.

We're already using regmap, so cache it there instead of locally?

Or alternatively move it out of the mode register array and into the
struct imx290_mode, then we can use imx290->current_mode->reg_ctrl_07
here. There's no need to set it from imx290_start_streaming as that
calls __v4l2_ctrl_handler_setup which will come through here. That
seems cleanest to me.

> > +             ret = imx290_read(imx290, IMX290_CTRL_07, &reg);
> > +             if (ret)
> > +                     break;
> > +             reg &= ~(IMX290_HREVERSE | IMX290_VREVERSE);
> > +             if (imx290->hflip->val)
> > +                     reg |= IMX290_HREVERSE;
> > +             if (imx290->vflip->val)
> > +                     reg |= IMX290_VREVERSE;
> > +             ret = imx290_write(imx290, IMX290_CTRL_07, reg, NULL);
> > +             break;
>
> As you always write those two controls together, they should be put in a
> cluster to have a single call to imx290_set_ctrl() when both are set in
> the same VIDIOC_S_EXT_CTRLS call.

Ah ctrl clusters - another can of worms :-)

 Dave

> > +     }
> > +
> >       default:
> >               ret = -EINVAL;
> >               break;
> > @@ -853,7 +873,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> >       if (ret < 0)
> >               return ret;
> >
> > -     v4l2_ctrl_handler_init(&imx290->ctrls, 9);
> > +     v4l2_ctrl_handler_init(&imx290->ctrls, 11);
> >
> >       /*
> >        * The sensor has an analog gain and a digital gain, both controlled
> > @@ -909,6 +929,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> >       imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> >                                          V4L2_CID_VBLANK, 1, 1, 1, 1);
> >
> > +     imx290->hflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > +                                       V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +     imx290->vflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > +                                       V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> >       v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
> >                                       &props);
> >
> > @@ -1030,6 +1055,9 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
> >               pm_runtime_put_autosuspend(imx290->dev);
> >       }
> >
> > +     /* vflip and hflip cannot change during streaming */
> > +     __v4l2_ctrl_grab(imx290->vflip, enable);
> > +     __v4l2_ctrl_grab(imx290->hflip, enable);
>
> A blank line would be nice.
>
> >  unlock:
> >       v4l2_subdev_unlock_state(state);
> >       return ret;
> > @@ -1115,6 +1143,7 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
> >                               struct v4l2_subdev_state *sd_state,
> >                               struct v4l2_subdev_selection *sel)
> >  {
> > +     struct imx290 *imx290 = to_imx290(sd);
> >       struct v4l2_mbus_framefmt *format;
> >
> >       switch (sel->target) {
> > @@ -1122,9 +1151,11 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
> >               format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> >
>
> A comment to explain here why the crop rectangle is adjusted would be
> nice.
>
> >               sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> > -                        + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2;
> > +                        + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2
> > +                        + imx290->vflip->val;
> >               sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
> > -                         + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2;
> > +                         + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2
> > +                         + imx290->hflip->val;
> >               sel->r.width = format->width;
> >               sel->r.height = format->height;
> >
>
> --
> Regards,
>
> Laurent Pinchart
