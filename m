Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80E35FFD6E
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiJPGLW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiJPGLT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:11:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A733ED6B
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:11:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7374630A;
        Sun, 16 Oct 2022 08:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900675;
        bh=958uoNOBay0N+pNA6JcV89PTtPiHXMEMNEATgxl6X5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HUD1SeOpQ+8Nv7UnM79wp/Fj6pGI7zyz9DBZZbhclaWEzq1V6fmjGUbgV9G0S7Y2x
         tSxem+VPuv6mUrM9G9z0OmOMYrhuQ8O2ZXeq7EPQTJNIdQdFaENAgWPY6OfhtklpPJ
         n0ZQknZHgodtUIvxF9h5Fu/tJxqPRU/k+yk3gNow=
Date:   Sun, 16 Oct 2022 09:10:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Re: [PATCH 14/19] media: i2c: imx290: Implement HBLANK and
 VBLANK controls
Message-ID: <Y0uga4eAv4v93xl8@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <3399452.atdPhlSkOF@steina-w>
 <Ytk1wWOec2tkOB8M@pendragon.ideasonboard.com>
 <4167869.k3LOHGUjKi@steina-w>
 <CAPY8ntC-GF5QEVZ_VQqi+LJzt7==_t2u2W=VDfeYw-3mk4mnmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntC-GF5QEVZ_VQqi+LJzt7==_t2u2W=VDfeYw-3mk4mnmg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, Jul 21, 2022 at 05:37:23PM +0100, Dave Stevenson wrote:
> On Thu, 21 Jul 2022 at 12:32, Alexander Stein wrote:
> > Am Donnerstag, 21. Juli 2022, 13:17:21 CEST schrieb Laurent Pinchart:
> > > On Thu, Jul 21, 2022 at 12:05:46PM +0200, Alexander Stein wrote:
> > > > Am Donnerstag, 21. Juli 2022, 10:35:35 CEST schrieb Laurent Pinchart:
> > > > > Add support for the V4L2_CID_HBLANK and V4L2_CID_VBLANK controls to the
> > > > > imx290 driver. Make the controls read-only to start with, to report the
> > > > > values to userspace for timing calculation.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > >
> > > > >  drivers/media/i2c/imx290.c | 39 +++++++++++++++++++++++++++++++++++++-
> > > > >  1 file changed, 38 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > > index 4408dd3e191f..7190399f4111 100644
> > > > > --- a/drivers/media/i2c/imx290.c
> > > > > +++ b/drivers/media/i2c/imx290.c
> > > > > @@ -146,6 +146,8 @@ struct imx290 {
> > > > >   struct v4l2_ctrl_handler ctrls;
> > > > >   struct v4l2_ctrl *link_freq;
> > > > >   struct v4l2_ctrl *pixel_rate;
> > > > > + struct v4l2_ctrl *hblank;
> > > > > + struct v4l2_ctrl *vblank;
> > > > >   struct mutex lock;
> > > > >  };
> > > > >
> > > > > @@ -642,6 +644,20 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > > > >           if (imx290->pixel_rate)
> > > > >                   __v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> > > > >                                            imx290_calc_pixel_rate(imx290));
> > > > > +
> > > > > +         if (imx290->hblank) {
> > > > > +                 unsigned int hblank = mode->hmax - mode->width;
> > > > > +
> > > > > +                 __v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank,
> > > > > +                                          1, hblank);
> > > > > +         }
> > > > > +
> > > > > +         if (imx290->vblank) {
> > > > > +                 unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> > > > > +
> > > > > +                 __v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank,
> > > > > +                                          1, vblank);
> > > > > +         }
> > > > >   }
> > > > >
> > > > >   *format = fmt->format;
> > > > > @@ -880,9 +896,10 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
> > > > > 
> > > > >  static int imx290_ctrl_init(struct imx290 *imx290)
> > > > >  {
> > > > > + unsigned int blank;
> > > > >   int ret;
> > > > >
> > > > > - v4l2_ctrl_handler_init(&imx290->ctrls, 5);
> > > > > + v4l2_ctrl_handler_init(&imx290->ctrls, 7);
> > > > >   imx290->ctrls.lock = &imx290->lock;
> > > > >
> > > > >   v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > > > @@ -910,6 +927,26 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > > > >                                ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> > > > >                                0, 0, imx290_test_pattern_menu);
> > > > >
> > > > > + /*
> > > > > +  * Horizontal blanking is controlled through the HMAX register, which
> > > > > +  * contains a line length in INCK clock units. The INCK frequency is
> > > > > +  * fixed to 74.25 MHz. The HMAX value is currently fixed to 1100,
> > > > > +  * convert it to a number of pixels based on the nominal pixel rate.
> > > > > +  */
> > > >
> > > > Currently the driver only supports 37.125 MHz, please refer to
> > > > imx290_probe.
> > > 
> > > Indeed. Re-reading the comment, I suspect something is wrong, as hmax is
> > > not converted to pixels here (and is also not fixed to 1100).

I'll drop the comment in v2.

> > > The only
> > > datasheet I found that is publicly accessed doesn't explain very clearly
> > > how the HMAX value should be computed. Based on your experience with IMX
> > > sensors, would you be able to shed some light on this ?
> 
> It is pretty much a standard HTS setting based on a pixel rate that is
> fixed at 148.5MPix/s.

I'm following you for HTS, but not for the fixed pixel rate. Could you
elaborate ?

> Likewise VMAX is equivalent to a traditional VTS.

Yes, that one is easy.

> I've been through the same path in
> https://github.com/raspberrypi/linux/commits/rpi-5.15.y/drivers/media/i2c/imx290.c
> 
> > Can you share the link to this datasheet you found?

https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a72f59b226308b9669e45/sony_imx290lqr-c_datasheet.pdf

> > Sorry, my experience is more like try and error. I don't fully understand this
> > as well, but apparently this depends on frame rate select (FRSEL).
> 
> FRSEL is the one difference between IMX327 and IMX290 (and presumably
> IMX462 too). IMX290 adds "0" as a valid value for 120/100fps mode.
> However there is no need to change FRSEL for standard frame rate
> control - you can set it at 0x01 and get a full range of frame rates
> through VMAX and HMAX. If you wished to extend that range for slower
> rates, you could conditionally set it to 0x2 to double the frame time.
> 
> > > > > + blank = imx290->current_mode->hmax - imx290->current_mode->width;
> > > > > + imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > > > +                                    V4L2_CID_HBLANK, blank, blank, 1,
> > > > > +                                    blank);
> > > > > + if (imx290->hblank)
> > > > > +         imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > +
> > > > > + blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
> > > > > + imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > > > +                                    V4L2_CID_VBLANK, blank, blank, 1,
> > > > > +                                    blank);
> > > > > + if (imx290->vblank)
> > > > > +         imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > +
> > > > >
> > > > >   imx290->sd.ctrl_handler = &imx290->ctrls;
> > > > >
> > > > >   if (imx290->ctrls.error) {

-- 
Regards,

Laurent Pinchart
