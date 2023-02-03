Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915DB68A116
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 19:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbjBCSBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 13:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbjBCSBR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 13:01:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D851E5F4
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 10:01:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (85-76-50-220-nat.elisa-mobile.fi [85.76.50.220])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69D30890;
        Fri,  3 Feb 2023 19:01:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675447273;
        bh=L3OzbFRuLnsZEPOc5RtjxkUx9jsSXwD5dOG0abEnfjA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aa14VPd2DOaxueBPfwted21kD7QdzY+aRpQqGWupCNL2xHJEtOVfKNkOYU9Njoe7f
         am3yI7FF0z+E6hCn9qFuXkPt4WubvpMotr5a3FRoEXKEOInk+42LsMsQ1GTrm54G/w
         noJuSy9zxiz+lmJHD9n78PymiBqsPBJEKr+Vn6Dw=
Date:   Fri, 3 Feb 2023 20:01:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 11/11] media: i2c: imx290: Add support for H & V Flips
Message-ID: <Y91L41eGeFdfbimv@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-12-dave.stevenson@raspberrypi.com>
 <Y9w02OHdYDniISTB@pendragon.ideasonboard.com>
 <CAPY8ntCLDZK-zhxzMVUDdD63MGx+Kwt6hVF8bfZVJ60nHiBWOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCLDZK-zhxzMVUDdD63MGx+Kwt6hVF8bfZVJ60nHiBWOg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Feb 03, 2023 at 10:21:28AM +0000, Dave Stevenson wrote:
> On Thu, 2 Feb 2023 at 22:10, Laurent Pinchart wrote:
> > On Tue, Jan 31, 2023 at 07:20:16PM +0000, Dave Stevenson wrote:
> > > The sensor supports H & V flips, so add the relevant hooks for
> > > V4L2_CID_HFLIP and V4L2_CID_VFLIP to configure them.
> > >
> > > Note that the Bayer order is maintained as the readout area
> > > shifts by 1 pixel in the appropriate direction (note the
> > > comment about the top margin being 8 pixels whilst the bottom
> > > margin is 9).
> >
> > That's why ! Now it makes sense to me.
> >
> > > The V4L2_SEL_TGT_CROP region is therefore
> > > adjusted appropriately.
> >
> > I'm not sure I like when sensors try to be clever... Out of curiosity,
> > do you know if this automatic shift of the crop rectangle can be
> > disabled ?
> 
> Not as far as I'm aware.
> Most of the OnSemi sensors I've looked at also preserve the Bayer
> order on flips, and the datasheets say they're doing the same thing of
> shifting by one pixel. I did query if it could be disabled, and they
> said no.
> 
> I have a suspicion that the situation here is actually worse, but
> haven't had a chance to test experimentally.
> The datasheet settings for all-pixel mode gives [X|Y]_OUT_SIZE as
> 1948x1097, but the driver sets them to 1920x1080 (1308x729 for the
> 1280x720 mode). Which pixels get dropped due to that reduction. My
> expectation is that it'll be the right side and bottom edge, not a
> centre crop as is currently assumed by the driver in get_selection. If
> you flip that, then it'll be the top and left edges that get cropped
> off.

I wonder if anybody would ever notice.

> If this is the case, then we'll have to switch to using window
> cropping mode to request the desired crop. Some people may be happy
> with this as it'll give them the information required to configure
> VGA@129fps and CIF@205fps modes as mentioned in the datasheet. For now
> I'm burying my head in the sand.

Thank you for the information. Is there any sand left to burry my head
as well ?

> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/imx290.c | 37 ++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 34 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 7f6746f74040..d2b7534f2c51 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -227,6 +227,8 @@ struct imx290 {
> > >       struct v4l2_ctrl *hblank;
> > >       struct v4l2_ctrl *vblank;
> > >       struct v4l2_ctrl *exposure;
> > > +     struct v4l2_ctrl *hflip;
> > > +     struct v4l2_ctrl *vflip;
> > >  };
> > >
> > >  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> > > @@ -801,6 +803,24 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > >                                  NULL);
> > >               break;
> > >
> > > +     case V4L2_CID_HFLIP:
> > > +     case V4L2_CID_VFLIP:
> > > +     {
> > > +             u32 reg;
> > > +
> > > +             /* WINMODE is in bits [6:4], so need to read-modify-write */
> >
> > You could also cache the value of the register in struct imx290 to avoid
> > the read.
> 
> We're already using regmap, so cache it there instead of locally?

Ah yes, it can be done in regmap.

> Or alternatively move it out of the mode register array and into the
> struct imx290_mode, then we can use imx290->current_mode->reg_ctrl_07
> here. There's no need to set it from imx290_start_streaming as that
> calls __v4l2_ctrl_handler_setup which will come through here. That
> seems cleanest to me.

Works for me too.

> > > +             ret = imx290_read(imx290, IMX290_CTRL_07, &reg);
> > > +             if (ret)
> > > +                     break;
> > > +             reg &= ~(IMX290_HREVERSE | IMX290_VREVERSE);
> > > +             if (imx290->hflip->val)
> > > +                     reg |= IMX290_HREVERSE;
> > > +             if (imx290->vflip->val)
> > > +                     reg |= IMX290_VREVERSE;
> > > +             ret = imx290_write(imx290, IMX290_CTRL_07, reg, NULL);
> > > +             break;
> >
> > As you always write those two controls together, they should be put in a
> > cluster to have a single call to imx290_set_ctrl() when both are set in
> > the same VIDIOC_S_EXT_CTRLS call.
> 
> Ah ctrl clusters - another can of worms :-)

With a bit of luck it will only be one extra function call at init time
and all will be fine :-)

> > > +     }
> > > +
> > >       default:
> > >               ret = -EINVAL;
> > >               break;
> > > @@ -853,7 +873,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > >       if (ret < 0)
> > >               return ret;
> > >
> > > -     v4l2_ctrl_handler_init(&imx290->ctrls, 9);
> > > +     v4l2_ctrl_handler_init(&imx290->ctrls, 11);
> > >
> > >       /*
> > >        * The sensor has an analog gain and a digital gain, both controlled
> > > @@ -909,6 +929,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > >       imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > >                                          V4L2_CID_VBLANK, 1, 1, 1, 1);
> > >
> > > +     imx290->hflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > +                                       V4L2_CID_HFLIP, 0, 1, 1, 0);
> > > +     imx290->vflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > +                                       V4L2_CID_VFLIP, 0, 1, 1, 0);
> > > +
> > >       v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
> > >                                       &props);
> > >
> > > @@ -1030,6 +1055,9 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
> > >               pm_runtime_put_autosuspend(imx290->dev);
> > >       }
> > >
> > > +     /* vflip and hflip cannot change during streaming */
> > > +     __v4l2_ctrl_grab(imx290->vflip, enable);
> > > +     __v4l2_ctrl_grab(imx290->hflip, enable);
> >
> > A blank line would be nice.
> >
> > >  unlock:
> > >       v4l2_subdev_unlock_state(state);
> > >       return ret;
> > > @@ -1115,6 +1143,7 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
> > >                               struct v4l2_subdev_state *sd_state,
> > >                               struct v4l2_subdev_selection *sel)
> > >  {
> > > +     struct imx290 *imx290 = to_imx290(sd);
> > >       struct v4l2_mbus_framefmt *format;
> > >
> > >       switch (sel->target) {
> > > @@ -1122,9 +1151,11 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
> > >               format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > >
> >
> > A comment to explain here why the crop rectangle is adjusted would be
> > nice.
> >
> > >               sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> > > -                        + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2;
> > > +                        + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2
> > > +                        + imx290->vflip->val;
> > >               sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
> > > -                         + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2;
> > > +                         + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2
> > > +                         + imx290->hflip->val;
> > >               sel->r.width = format->width;
> > >               sel->r.height = format->height;
> > >

-- 
Regards,

Laurent Pinchart
