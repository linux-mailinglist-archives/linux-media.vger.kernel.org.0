Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72069689161
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 08:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbjBCH63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 02:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbjBCH54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 02:57:56 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C06953C2
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 23:57:55 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id e9so4549117vsj.3
        for <linux-media@vger.kernel.org>; Thu, 02 Feb 2023 23:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yo8g6YKlf21dV3x09I+T2QOif2AcZ4YX3J7YHoQHk0M=;
        b=erVcw2KDBFumwcNs60OyqsBHWYPE2Jd+s/cuXH2EeL1ePH0I/Qt+0Kua5Hw3ncqJGu
         DSArg5hY33/NRohliJY9c6CUNGdHrA5B7+KvKax8mawj3MI8/DAeE47H+F4Uysp/HplJ
         tcH2kIforz2BHFT9WuXiOWtpyEf7SC4mYQEuPOeT/IuKqcqXogfF4wzLA6kvsjIByPyM
         QR6XyYPHQlj8oe5ZJMVQsvBGD+ye0Zcr2kDktUSOtB1t3jQN7vwcSHwZ5rDbsiouh4sT
         PXYhzB2fVKFThIyS6xvPxAPJJMTHxuLVuRrvxD1Grn3RrOEmzb4V6HzSBIg2CvuOe8T3
         WsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yo8g6YKlf21dV3x09I+T2QOif2AcZ4YX3J7YHoQHk0M=;
        b=l5oHl/DK3qCV2BYR+7otmpqbopQj02Os1L2V4tsmYF06BtPhMlBhHWLXHks5S+CmIw
         3lncQTqbzmkHoQxz/Zx2Ryef/hvUwQ3rQ4N+87Qc2Dr+iXRlNel8aPiX0oswOvqCQ747
         FWvsIMSBA/URKU9j6F2gW/qN02eljHiO/D6bmRy8Aq+ag+8pomBuT+lF4eiXP4UZAPe/
         3/Tm8mIEcwTcyXTeQBFPzzkvwXM3InIUItbOh7gfjOV8lDjRRIzgjx9KwYcJtmuWTdeH
         gysAqnHKKKkXjfvHvz0bmJ4F8kA9dDYWAkaw/pfpS/pfoG66wWoL8K7qe8fZeCjJTz6h
         yFtg==
X-Gm-Message-State: AO0yUKXSLSUQt0f304Z/p2JXQk/wqTuHRzbZBTyUbJ7mbImV5jrtljqx
        ojshawjT8T9xIE1h5fGMEfBUgXzUiXsWQGESTVZ16Nm1fMM64I4m
X-Google-Smtp-Source: AK7set+PtMsi0vyDjzTRklUOyz7rml61vGFXel7ApO1jqgjfpIHirw1vTuJNRbHVKuND+O27j2OJ5U2ZUlnhyQOfmHM=
X-Received: by 2002:a05:6102:3005:b0:3eb:2024:bda9 with SMTP id
 s5-20020a056102300500b003eb2024bda9mr1571202vsa.45.1675411074070; Thu, 02 Feb
 2023 23:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-12-dave.stevenson@raspberrypi.com> <2548223.Lt9SDvczpP@steina-w>
In-Reply-To: <2548223.Lt9SDvczpP@steina-w>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 3 Feb 2023 07:57:37 +0000
Message-ID: <CAPY8ntAVgwLiQme_=Cf8_KzMQGvx1XevLqMVzLxo-DxxKZB+Tw@mail.gmail.com>
Subject: Re: [PATCH 11/11] media: i2c: imx290: Add support for H & V Flips
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Hi Alexander

On Fri, 3 Feb 2023 at 07:35, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dave,
>
> thanks for the patch.
>
> Am Dienstag, 31. Januar 2023, 20:20:16 CET schrieb Dave Stevenson:
> > The sensor supports H & V flips, so add the relevant hooks for
> > V4L2_CID_HFLIP and V4L2_CID_VFLIP to configure them.
> >
> > Note that the Bayer order is maintained as the readout area
> > shifts by 1 pixel in the appropriate direction (note the
> > comment about the top margin being 8 pixels whilst the bottom
> > margin is 9). The V4L2_SEL_TGT_CROP region is therefore
> > adjusted appropriately.
> >
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
> > +             /* WINMODE is in bits [6:4], so need to read-modify-write
> */
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
> > +     }
>
> Given the grab while streaming is on, it can't be changed while streaming. But
> then again the pm_runtime check above will prevent setting the registers while
> streaming is off.

But __v4l2_ctrl_handler_setup is called from imx290_start_streaming
after pm_runtime_resume_and_get, and so will programme the hardware.

Writing the flips from the set_ctrl even if they have been grabbed due
to changing the Bayer order is the normal approach with many other
drivers. See imx319, imx219, imx335, imx415, and probably others.

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
> >                                          V4L2_CID_VBLANK, 1, 1, 1,
> 1);
> >
> > +     imx290->hflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > +                                       V4L2_CID_HFLIP, 0, 1, 1,
> 0);
> > +     imx290->vflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > +                                       V4L2_CID_VFLIP, 0, 1, 1,
> 0);
> > +
> >       v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
> >                                       &props);
> >
> > @@ -1030,6 +1055,9 @@ static int imx290_set_stream(struct v4l2_subdev *sd,
> > int enable) pm_runtime_put_autosuspend(imx290->dev);
> >       }
> >
> > +     /* vflip and hflip cannot change during streaming */
> > +     __v4l2_ctrl_grab(imx290->vflip, enable);
> > +     __v4l2_ctrl_grab(imx290->hflip, enable);
>
> Why is this grab necessary? While trying to remove these lines, I can flip the
> image while streaming.

IMX290 Datasheet section "Normal and inverted operation":
"One invalid frame is generated when reading immediately after the
readout direction is changed in order to switch the normal operation
and inversion of frames."

There is no synchronisation between CSI2 receiver and the subdev, so
no way to signal that corrupt frame.
Is it permitted for sources to knowingly deliver corrupt frames? My
understanding is not.

  Dave

> Best regards,
> Alexander
>
> >  unlock:
> >       v4l2_subdev_unlock_state(state);
> >       return ret;
> > @@ -1115,6 +1143,7 @@ static int imx290_get_selection(struct v4l2_subdev
> > *sd, struct v4l2_subdev_state *sd_state,
> >                               struct v4l2_subdev_selection *sel)
> >  {
> > +     struct imx290 *imx290 = to_imx290(sd);
> >       struct v4l2_mbus_framefmt *format;
> >
> >       switch (sel->target) {
> > @@ -1122,9 +1151,11 @@ static int imx290_get_selection(struct v4l2_subdev
> > *sd, format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> >
> >               sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> > -                        + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT -
> format->height) / 2;
> > +                        + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT -
> format->height) / 2
> > +                        + imx290->vflip->val;
> >               sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
> > -                         + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH -
> format->width) / 2;
> > +                         + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH -
> format->width) / 2
> > +                         + imx290->hflip->val;
> >               sel->r.width = format->width;
> >               sel->r.height = format->height;
>
>
>
>
