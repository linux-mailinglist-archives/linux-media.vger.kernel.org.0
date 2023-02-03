Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D62168925F
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 09:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbjBCIdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 03:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbjBCIdd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 03:33:33 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8366826599
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 00:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675413210; x=1706949210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tC3lyp4cHlj4MOEj0JEbPE67o36+nFYZnJl2CPTb/uY=;
  b=hoqkNzTW7j8h19DzFoWXY8sU9oOXe9IY+W3ApH4ltsZn+L8fBtdYUhcH
   YOmBADuMHIB8aVddOO8dNNtr72aDpSzYIUG38V+dYodMBJ9Jby+YtYKSY
   xukNmKNcGOBFRlHEg6cyaCKU9PCGcyUsXU1pXJQHNs0AP0HzopZB7SCbi
   oirCtKWKJNwXmSSMZk+qbQl84m97LSn9PcYDvZSTFHo4tjRtt9E99vTzC
   B5hz0gNG9B15Enu72GKDVBuy+0HerEh8euxPKnRSjggaPJIMoCtCGhIlo
   CzRD7aSDk/O3boW1ET6nuzCbZnbjALvkHG6P1fz7OKe2d8TLsKd7xxnNY
   w==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28847679"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2023 09:33:28 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 03 Feb 2023 09:33:28 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 03 Feb 2023 09:33:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675413208; x=1706949208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tC3lyp4cHlj4MOEj0JEbPE67o36+nFYZnJl2CPTb/uY=;
  b=goY6G8hN345pMRxkBYXAI8okSFfY3qDVQl6L3sw7iPydgZwUA/uciUOi
   XA1qLAx6R22S4/Lay09povL5WkDkzA520LfiKketsOLmPDqyB3zUUVNJ5
   mCPFZFAQTRCzTjX7MkVxyyjFW0dtHlaYjCj+rEXDMe5rqCyUR8XID0a1p
   xXQefF6b7fIb3f1AKJkYf9mNA3kO5BfD2WaY6RjMpHhXmz6FT5GRm0yYl
   V1Xv8fL5F3NrojHLWch12l6fo2AfheCm6WY1Kv+G3jpvtiGXTP9RwHGpf
   BB18h4G6YietwVrAYTvMhiNA5Bdo+emAEH82Xk7/mtSOFTSpam1yfD/T3
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28847678"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Feb 2023 09:33:28 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8FAD1280056;
        Fri,  3 Feb 2023 09:33:28 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 11/11] media: i2c: imx290: Add support for H & V Flips
Date:   Fri, 03 Feb 2023 09:33:28 +0100
Message-ID: <4876259.0VBMTVartN@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAPY8ntAVgwLiQme_=Cf8_KzMQGvx1XevLqMVzLxo-DxxKZB+Tw@mail.gmail.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com> <2548223.Lt9SDvczpP@steina-w> <CAPY8ntAVgwLiQme_=Cf8_KzMQGvx1XevLqMVzLxo-DxxKZB+Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, 3. Februar 2023, 08:57:37 CET schrieb Dave Stevenson:
> Hi Alexander
> 
> On Fri, 3 Feb 2023 at 07:35, Alexander Stein
> 
> <alexander.stein@ew.tq-group.com> wrote:
> > Hi Dave,
> > 
> > thanks for the patch.
> > 
> > Am Dienstag, 31. Januar 2023, 20:20:16 CET schrieb Dave Stevenson:
> > > The sensor supports H & V flips, so add the relevant hooks for
> > > V4L2_CID_HFLIP and V4L2_CID_VFLIP to configure them.
> > > 
> > > Note that the Bayer order is maintained as the readout area
> > > shifts by 1 pixel in the appropriate direction (note the
> > > comment about the top margin being 8 pixels whilst the bottom
> > > margin is 9). The V4L2_SEL_TGT_CROP region is therefore
> > > adjusted appropriately.
> > > 
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > > 
> > >  drivers/media/i2c/imx290.c | 37 ++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 34 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 7f6746f74040..d2b7534f2c51 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -227,6 +227,8 @@ struct imx290 {
> > > 
> > >       struct v4l2_ctrl *hblank;
> > >       struct v4l2_ctrl *vblank;
> > >       struct v4l2_ctrl *exposure;
> > > 
> > > +     struct v4l2_ctrl *hflip;
> > > +     struct v4l2_ctrl *vflip;
> > > 
> > >  };
> > >  
> > >  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> > > 
> > > @@ -801,6 +803,24 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > > 
> > >                                  NULL);
> > >               
> > >               break;
> > > 
> > > +     case V4L2_CID_HFLIP:
> > > +     case V4L2_CID_VFLIP:
> > > +     {
> > > +             u32 reg;
> > > +
> > > +             /* WINMODE is in bits [6:4], so need to read-modify-write
> > 
> > */
> > 
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
> > > +     }
> > 
> > Given the grab while streaming is on, it can't be changed while streaming.
> > But then again the pm_runtime check above will prevent setting the
> > registers while streaming is off.
> 
> But __v4l2_ctrl_handler_setup is called from imx290_start_streaming
> after pm_runtime_resume_and_get, and so will programme the hardware.

That's right. I just noticed libcamera (libcamersrc in a gst-pipeline 
actrually) resets flipping to default when starting... so this behaviour is 
understandable, although somewhat unexpected.

> Writing the flips from the set_ctrl even if they have been grabbed due
> to changing the Bayer order is the normal approach with many other
> drivers. See imx319, imx219, imx335, imx415, and probably others.

What I meant is that it's not possible to change flipping from userspace while 
being grabbed.

> > > +
> > > 
> > >       default:
> > >               ret = -EINVAL;
> > >               break;
> > > 
> > > @@ -853,7 +873,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > > 
> > >       if (ret < 0)
> > >       
> > >               return ret;
> > > 
> > > -     v4l2_ctrl_handler_init(&imx290->ctrls, 9);
> > > +     v4l2_ctrl_handler_init(&imx290->ctrls, 11);
> > > 
> > >       /*
> > >       
> > >        * The sensor has an analog gain and a digital gain, both
> > >        controlled
> > > 
> > > @@ -909,6 +929,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > > 
> > >       imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls,
> > >       &imx290_ctrl_ops,
> > >       
> > >                                          V4L2_CID_VBLANK, 1, 1, 1,
> > 
> > 1);
> > 
> > > +     imx290->hflip = v4l2_ctrl_new_std(&imx290->ctrls,
> > > &imx290_ctrl_ops,
> > > +                                       V4L2_CID_HFLIP, 0, 1, 1,
> > 
> > 0);
> > 
> > > +     imx290->vflip = v4l2_ctrl_new_std(&imx290->ctrls,
> > > &imx290_ctrl_ops,
> > > +                                       V4L2_CID_VFLIP, 0, 1, 1,
> > 
> > 0);
> > 
> > > +
> > > 
> > >       v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
> > >       
> > >                                       &props);
> > > 
> > > @@ -1030,6 +1055,9 @@ static int imx290_set_stream(struct v4l2_subdev
> > > *sd,
> > > int enable) pm_runtime_put_autosuspend(imx290->dev);
> > > 
> > >       }
> > > 
> > > +     /* vflip and hflip cannot change during streaming */
> > > +     __v4l2_ctrl_grab(imx290->vflip, enable);
> > > +     __v4l2_ctrl_grab(imx290->hflip, enable);
> > 
> > Why is this grab necessary? While trying to remove these lines, I can flip
> > the image while streaming.
> 
> IMX290 Datasheet section "Normal and inverted operation":
> "One invalid frame is generated when reading immediately after the
> readout direction is changed in order to switch the normal operation
> and inversion of frames."
> 
> There is no synchronisation between CSI2 receiver and the subdev, so
> no way to signal that corrupt frame.
> Is it permitted for sources to knowingly deliver corrupt frames? My
> understanding is not.

I see. I was not aware of this, maybe due to this there should be a comment 
why changing flips during stream should not be done. Current comment is 
totally misleading.

Best regards
Alexande

>   Dave
> 
> > Best regards,
> > Alexander
> > 
> > >  unlock:
> > >       v4l2_subdev_unlock_state(state);
> > >       return ret;
> > > 
> > > @@ -1115,6 +1143,7 @@ static int imx290_get_selection(struct v4l2_subdev
> > > *sd, struct v4l2_subdev_state *sd_state,
> > > 
> > >                               struct v4l2_subdev_selection *sel)
> > >  
> > >  {
> > > 
> > > +     struct imx290 *imx290 = to_imx290(sd);
> > > 
> > >       struct v4l2_mbus_framefmt *format;
> > >       
> > >       switch (sel->target) {
> > > 
> > > @@ -1122,9 +1151,11 @@ static int imx290_get_selection(struct
> > > v4l2_subdev
> > > *sd, format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > 
> > >               sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> > > 
> > > -                        + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT -
> > 
> > format->height) / 2;
> > 
> > > +                        + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT -
> > 
> > format->height) / 2
> > 
> > > +                        + imx290->vflip->val;
> > > 
> > >               sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
> > > 
> > > -                         + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH -
> > 
> > format->width) / 2;
> > 
> > > +                         + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH -
> > 
> > format->width) / 2
> > 
> > > +                         + imx290->hflip->val;
> > > 
> > >               sel->r.width = format->width;
> > >               sel->r.height = format->height;




