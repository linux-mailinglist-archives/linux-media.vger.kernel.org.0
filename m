Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B038560106E
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 15:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbiJQNrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 09:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiJQNrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 09:47:11 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EDB752813
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 06:47:09 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id ot12so25101602ejb.1
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tvavbI9koYc6oOlu3SQDrm5uOfCkiHI+VBudEgzNVOk=;
        b=Jz225qG4Pui4C1mLLCi49me9aO3/GBGWPvKqbaGNcWRYCcT11wQVvf20B1Kywuzy1V
         f0FOQN2Jv5YAR0aR8L/2EsdW45Sey62WtABoX5yER7u5qD+P2Q84bU77I4RfIFJJrSGV
         /DXhmeDrJY6YAnA/wz0dvYO9iztyKdiIfq0K/lRs85mXlK3VgmVXWwU24v/MFJt6++lz
         2sfYHTRuKKNT4Gd9pyNvR+50MHImgZBjnNwCeyzhLvRqudA3Z3Lu+hycvO4y+6vwAnFO
         Ol/KzbrBz5dbrndBqTIc4mWx/5nQ5gPwOHFGwfJs4QN73grVwvpCgC7u7CfSFQFgsGrs
         jksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvavbI9koYc6oOlu3SQDrm5uOfCkiHI+VBudEgzNVOk=;
        b=lOSB878s3Y9smXvuRfu/KEplQ3okxeYeTAuWuavHME3yXBZkLd/fhvVsaWIQSqNOVe
         Blv3UKajXuwhEK7tX8Fj++aOAF1BZ4RuxNdHt4p5gLsohoLZwiwu8gLVBVKl1773FsP3
         h5yzAiNT3sXKDuI6kaA+kp+zWd0HK2slToC+Db6FHqUjWjfsEok3KKkw5TZ+hS4HC3s8
         LCvL9u+WXhj4VgqrxEBugtbb5UFq6dAlwN9Oqik/GOi3mYDfLpZpbJoLLYXPFgZ0SM3K
         5/qy24SSvDB8c56bU6FIe1MSVf8xQ8ptrW1ArJAiI3izyrWG+Kdjr05b4aRLjv9zpUVL
         zAkQ==
X-Gm-Message-State: ACrzQf3jKOansCEbcXVYMR951hC5O105p6tjc0vKaK2vkgFVlSUkteyC
        ZtN3Kr8Yzxl+C7CbDkbCvV8DjG9FAQzM5cPT8V6sag==
X-Google-Smtp-Source: AMsMyM6A7kpmWmyV6mY1smCuRLUuEB/tbqw8SBjV2kmEVAlxzraRE/YDveUohE+1gaXQ8IKMTmb686GSROy3uHNxLzw=
X-Received: by 2002:a17:907:97c1:b0:791:98b8:9ab8 with SMTP id
 js1-20020a17090797c100b0079198b89ab8mr728735ejc.425.1666014427658; Mon, 17
 Oct 2022 06:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <3399452.atdPhlSkOF@steina-w> <Ytk1wWOec2tkOB8M@pendragon.ideasonboard.com>
 <4167869.k3LOHGUjKi@steina-w> <CAPY8ntC-GF5QEVZ_VQqi+LJzt7==_t2u2W=VDfeYw-3mk4mnmg@mail.gmail.com>
 <Y0uga4eAv4v93xl8@pendragon.ideasonboard.com>
In-Reply-To: <Y0uga4eAv4v93xl8@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 17 Oct 2022 14:46:52 +0100
Message-ID: <CAPY8ntAh7s1110Yt0Pg5BjaVJWmGUeRbRbmBYjuMM=Bb2Rbf-Q@mail.gmail.com>
Subject: Re: Re: [PATCH 14/19] media: i2c: imx290: Implement HBLANK and VBLANK controls
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Sun, 16 Oct 2022 at 07:11, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Thu, Jul 21, 2022 at 05:37:23PM +0100, Dave Stevenson wrote:
> > On Thu, 21 Jul 2022 at 12:32, Alexander Stein wrote:
> > > Am Donnerstag, 21. Juli 2022, 13:17:21 CEST schrieb Laurent Pinchart:
> > > > On Thu, Jul 21, 2022 at 12:05:46PM +0200, Alexander Stein wrote:
> > > > > Am Donnerstag, 21. Juli 2022, 10:35:35 CEST schrieb Laurent Pinchart:
> > > > > > Add support for the V4L2_CID_HBLANK and V4L2_CID_VBLANK controls to the
> > > > > > imx290 driver. Make the controls read-only to start with, to report the
> > > > > > values to userspace for timing calculation.
> > > > > >
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > ---
> > > > > >
> > > > > >  drivers/media/i2c/imx290.c | 39 +++++++++++++++++++++++++++++++++++++-
> > > > > >  1 file changed, 38 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > > > index 4408dd3e191f..7190399f4111 100644
> > > > > > --- a/drivers/media/i2c/imx290.c
> > > > > > +++ b/drivers/media/i2c/imx290.c
> > > > > > @@ -146,6 +146,8 @@ struct imx290 {
> > > > > >   struct v4l2_ctrl_handler ctrls;
> > > > > >   struct v4l2_ctrl *link_freq;
> > > > > >   struct v4l2_ctrl *pixel_rate;
> > > > > > + struct v4l2_ctrl *hblank;
> > > > > > + struct v4l2_ctrl *vblank;
> > > > > >   struct mutex lock;
> > > > > >  };
> > > > > >
> > > > > > @@ -642,6 +644,20 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > > > > >           if (imx290->pixel_rate)
> > > > > >                   __v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> > > > > >                                            imx290_calc_pixel_rate(imx290));
> > > > > > +
> > > > > > +         if (imx290->hblank) {
> > > > > > +                 unsigned int hblank = mode->hmax - mode->width;
> > > > > > +
> > > > > > +                 __v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank,
> > > > > > +                                          1, hblank);
> > > > > > +         }
> > > > > > +
> > > > > > +         if (imx290->vblank) {
> > > > > > +                 unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> > > > > > +
> > > > > > +                 __v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank,
> > > > > > +                                          1, vblank);
> > > > > > +         }
> > > > > >   }
> > > > > >
> > > > > >   *format = fmt->format;
> > > > > > @@ -880,9 +896,10 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
> > > > > >
> > > > > >  static int imx290_ctrl_init(struct imx290 *imx290)
> > > > > >  {
> > > > > > + unsigned int blank;
> > > > > >   int ret;
> > > > > >
> > > > > > - v4l2_ctrl_handler_init(&imx290->ctrls, 5);
> > > > > > + v4l2_ctrl_handler_init(&imx290->ctrls, 7);
> > > > > >   imx290->ctrls.lock = &imx290->lock;
> > > > > >
> > > > > >   v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > > > > @@ -910,6 +927,26 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > > > > >                                ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> > > > > >                                0, 0, imx290_test_pattern_menu);
> > > > > >
> > > > > > + /*
> > > > > > +  * Horizontal blanking is controlled through the HMAX register, which
> > > > > > +  * contains a line length in INCK clock units. The INCK frequency is
> > > > > > +  * fixed to 74.25 MHz. The HMAX value is currently fixed to 1100,
> > > > > > +  * convert it to a number of pixels based on the nominal pixel rate.
> > > > > > +  */
> > > > >
> > > > > Currently the driver only supports 37.125 MHz, please refer to
> > > > > imx290_probe.
> > > >
> > > > Indeed. Re-reading the comment, I suspect something is wrong, as hmax is
> > > > not converted to pixels here (and is also not fixed to 1100).
>
> I'll drop the comment in v2.
>
> > > > The only
> > > > datasheet I found that is publicly accessed doesn't explain very clearly
> > > > how the HMAX value should be computed. Based on your experience with IMX
> > > > sensors, would you be able to shed some light on this ?
> >
> > It is pretty much a standard HTS setting based on a pixel rate that is
> > fixed at 148.5MPix/s.
>
> I'm following you for HTS, but not for the fixed pixel rate. Could you
> elaborate ?

If you work through the numbers you'll find the pixel rate for the
720p mode in the current driver is wrong.

As documented in the datasheet (page 50), the link rate is dropped
from 445.5Mbit/s for 1080p60 in 4 lane mode to 297Mbit/s for 720p60.
The behaviour of the LINK_FREQ control is therefore correct (I've
checked it on an oscilloscope too).

If you look at the HMAX and VMAX numbers for the 720p mode on page 71,
VMAX is 0x2ee (750 decimal), and HMAX is 0x0ce4 (3300 decimal) for
60fps. The driver uses these numbers too in advertising VBLANK and
HBLANK. All good so far.

750 * 3300 * 60(fps) = 148500000, which is the same pixel rate as for
1080p, and not related to the link frequency selected by the mode.
The sensor array can run faster than the CSI block, and
imx290_calc_pixel_rate() is totally bogus.

PIXEL_RATE != LINK_FREQ.

> > Likewise VMAX is equivalent to a traditional VTS.
>
> Yes, that one is easy.
>
> > I've been through the same path in
> > https://github.com/raspberrypi/linux/commits/rpi-5.15.y/drivers/media/i2c/imx290.c
> >
> > > Can you share the link to this datasheet you found?
>
> https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a72f59b226308b9669e45/sony_imx290lqr-c_datasheet.pdf

Thanks - it's helpful to be able to quote a public source rather than
risk upsetting vendors by quoting their confidential datasheets.

  Dave

> > > Sorry, my experience is more like try and error. I don't fully understand this
> > > as well, but apparently this depends on frame rate select (FRSEL).
> >
> > FRSEL is the one difference between IMX327 and IMX290 (and presumably
> > IMX462 too). IMX290 adds "0" as a valid value for 120/100fps mode.
> > However there is no need to change FRSEL for standard frame rate
> > control - you can set it at 0x01 and get a full range of frame rates
> > through VMAX and HMAX. If you wished to extend that range for slower
> > rates, you could conditionally set it to 0x2 to double the frame time.
> >
> > > > > > + blank = imx290->current_mode->hmax - imx290->current_mode->width;
> > > > > > + imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > > > > +                                    V4L2_CID_HBLANK, blank, blank, 1,
> > > > > > +                                    blank);
> > > > > > + if (imx290->hblank)
> > > > > > +         imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > > +
> > > > > > + blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
> > > > > > + imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > > > > +                                    V4L2_CID_VBLANK, blank, blank, 1,
> > > > > > +                                    blank);
> > > > > > + if (imx290->vblank)
> > > > > > +         imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > > +
> > > > > >
> > > > > >   imx290->sd.ctrl_handler = &imx290->ctrls;
> > > > > >
> > > > > >   if (imx290->ctrls.error) {
>
> --
> Regards,
>
> Laurent Pinchart
