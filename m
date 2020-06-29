Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4B020E474
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 00:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390660AbgF2VZb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 17:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390495AbgF2VZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 17:25:29 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BE3C061755
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 14:25:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id b6so18032474wrs.11
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 14:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BM50nnBHnVeRvMZAbBCWlBD03TO+/80b6hWhqJH/GZY=;
        b=P3b0Oc0JgkqZgKoOV67SdE4VfSsU2JGvGtH/XKD5HTmzB9gzjqrOWmyeONm5DhPz+Q
         /MLyuMMBR04vWUBk1L571QgJ8PXXpmfOK5YD5RRSoAYmeD+QszCfRI3X68J9MKw20cwQ
         H3I3TRPYcEKB/x1T8wBYhS0OPd1c9hDarsz2D+p3fXG+hcujQz6CjK5hnrS5xxghMQbw
         c1K/f4aYDDIg0wJmyUrrDtFTxfPppuCMsgqGiI20Pel6lJxRBfNUufFRayMpM0sKgTVN
         B18/4knFdP3Uodk/LF0/6WTVTQPQOYoR2vy8fOPSfOtH74w6at3r6Tg2qG87XngppomV
         iiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BM50nnBHnVeRvMZAbBCWlBD03TO+/80b6hWhqJH/GZY=;
        b=jECOzk/dCKjEpuOhTZy70SVjIVLTlHzCsMvlu5XSr9KZMJvJ17Jqj0X7zYdrfmpdXu
         5Cj/GpiTLaqKUc/GqMIXW6xBkKYRWiQb4Xq+MBVNTs4v/aTNEXymdwK6Z1KUS5cQn2dR
         QpJVkhCdDcIlwYiIL3pOrlfuDO4FdXttLh7MT3M7Szn6tUwohPoioR/PHk2Ga2GhHIBK
         0EsuGs7hyNA8/ypNXXXnLaMS0gkzrWzexKJCjD5VC5l/si5ULvN348D4kU2jfNgKpJB/
         oXDEzkYF8dAhudiWGv8fauwgNu6OZNE464sEjo3dcZsuYb8LOQuiSQbXo5ynbvaEkfJd
         jLZA==
X-Gm-Message-State: AOAM532KZUARZ5bF1adRMRAadlEC/bSjduMV565kMBqe7IePRpqp5y8c
        Pj0jL4Vzjqbi9h2F72jZo2yqoERA3pvgOzzFbMyP2Q==
X-Google-Smtp-Source: ABdhPJybfFNMi3YyvOvpv8ztq38Sb1e0ZKFiOiMy63eHPDD2Rpb5GtPT4Szks0WP96EU0G6C26wzBtE2IUjnDice7MI=
X-Received: by 2002:adf:fc90:: with SMTP id g16mr18655166wrr.42.1593465927946;
 Mon, 29 Jun 2020 14:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200623100815.10674-1-jacopo@jmondi.org> <20200623165550.45835-3-jacopo@jmondi.org>
 <3aab9b3d-0156-e83c-9a63-026ded395af6@collabora.com>
In-Reply-To: <3aab9b3d-0156-e83c-9a63-026ded395af6@collabora.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 29 Jun 2020 22:25:12 +0100
Message-ID: <CAPY8ntBq6Lzo2qPNX6ke608SOQYVxsdjfXj2GTS6uZQMmi23JQ@mail.gmail.com>
Subject: Re: [libcamera-devel] [PATCH 22/25] media: ov5647: Support V4L2_CID_PIXEL_RATE
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Naushir Patuck <naush@raspberrypi.com>,
        andrew_gabbasov@mentor.com, mrodin@de.adit-jv.com,
        Maxime Ripard <mripard@kernel.org>,
        libcamera-devel@lists.libcamera.org, sudipi@jp.adit-jv.com,
        hugues.fruchet@st.com, erosca@de.adit-jv.com, aford173@gmail.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna

On Mon, 29 Jun 2020 at 18:01, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> On 23.06.20 18:55, Jacopo Mondi wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > Clients need to know the pixel rate in order to compute exposure
> > and frame rate values. Advertise it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >   drivers/media/i2c/ov5647.c | 40 +++++++++++++++++++++++++++++++-------
> >   1 file changed, 33 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index 35865e56de5f9..218576a05e66b 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -76,6 +76,7 @@ struct regval_list {
> >   struct ov5647_mode {
> >       struct v4l2_mbus_framefmt       format;
> >       struct v4l2_rect                crop;
> > +     u64                             pixel_rate;
> >       struct regval_list              *reg_list;
> >       unsigned int                    num_regs;
> >   };
> > @@ -97,6 +98,7 @@ struct ov5647 {
> >       struct v4l2_ctrl_handler        ctrls;
> >       struct ov5647_mode              *mode;
> >       struct ov5647_mode              *current_mode;
> > +     struct v4l2_ctrl                *pixel_rate;
> >   };
> >
> >   static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> > @@ -583,6 +585,7 @@ static struct ov5647_mode ov5647_sbggr8_modes[] = {
> >                       .width          = 1280,
> >                       .height         = 960,
> >               },
> > +             .pixel_rate     = 77291670,
> >               .reg_list       = ov5647_640x480_sbggr8,
> >               .num_regs       = ARRAY_SIZE(ov5647_640x480_sbggr8)
> >       },
> > @@ -604,6 +607,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
> >                       .width          = 2592,
> >                       .height         = 1944
> >               },
> > +             .pixel_rate     = 87500000,
> >               .reg_list       = ov5647_2592x1944_sbggr10,
> >               .num_regs       = ARRAY_SIZE(ov5647_2592x1944_sbggr10)
> >       },
> > @@ -622,6 +626,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
> >                       .width          = 1928,
> >                       .height         = 1080,
> >               },
> > +             .pixel_rate     = 81666700,
> >               .reg_list       = ov5647_1080p30_sbggr10,
> >               .num_regs       = ARRAY_SIZE(ov5647_1080p30_sbggr10)
> >       },
> > @@ -640,6 +645,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
> >                       .width          = 2592,
> >                       .height         = 1944,
> >               },
> > +             .pixel_rate     = 81666700,
> >               .reg_list       = ov5647_2x2binned_sbggr10,
> >               .num_regs       = ARRAY_SIZE(ov5647_2x2binned_sbggr10)
> >       },
> > @@ -658,6 +664,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
> >                       .width          = 2560,
> >                       .height         = 1920,
> >               },
> > +             .pixel_rate     = 55000000,
> >               .reg_list       = ov5647_640x480_sbggr10,
> >               .num_regs       = ARRAY_SIZE(ov5647_640x480_sbggr10)
> >       },
> > @@ -1094,6 +1101,10 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
> >       /* Update the sensor mode and apply at it at streamon time. */
> >       mutex_lock(&sensor->lock);
> >       sensor->mode = mode;
> > +
> > +     __v4l2_ctrl_modify_range(sensor->pixel_rate, mode->pixel_rate,
> > +                              mode->pixel_rate, 1, mode->pixel_rate);
> > +
> >       *fmt = mode->format;
> >       mutex_unlock(&sensor->lock);
> >
> > @@ -1295,6 +1306,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
> >               return  ov5647_s_analogue_gain(sd, ctrl->val);
> >       case V4L2_CID_EXPOSURE:
> >               return ov5647_s_exposure(sd, ctrl->val);
> > +     case V4L2_CID_PIXEL_RATE:
> > +             /* Read-only, but we adjust it based on mode. */
>
> Looking at other drivers, I see they don't handle read only controls
> in s_ctrl cb. Also the docs (vidioc-queryctrl.rst) says that trying to set a read only control should
> return EINVAL

It was a while ago that I looked at this, but my memory says that
without a handler here then the call to __v4l2_ctrl_modify_range to
update the value failed. The ranges and default were changed, but the
current value wasn't.

Checking now, yes, without returning 0 here,  __v4l2_ctrl_modify_range
returns -22 (-EINVAL) and v4l2-ctl --list-ctrls afterwards shows
Image Processing Controls

                     pixel_rate 0x009f0902 (int64)  : min=87500000
max=87500000 step=1 default=87500000 value=81666700 flags=read-only

A failure of the framework then and needs fixing there, or is it
correct for the driver to have to implement a set hander if it needs
to update the ranges?
A quick grep implies that ov5647 is the first driver that needs to
update V4L2_CID_PIXEL_RATE based on mode. I'll check in the morning if
things like V4L2_CID_HBLANK behave the same - it may be a control type
issue with 64 bit values.


Interesting that the docs say EINVAL as at least one path in the
framework appears to return -EACCES [1]
Checking it:
pi@raspberrypi:~ $ v4l2-ctl --set-ctrl pixel_rate=42
VIDIOC_S_EXT_CTRLS: failed: Permission denied
Error setting controls: Permission denied
which would imply -EACCES

I am testing on a 5.4 kernel rather than media_tree.git, but there
don't appear to be any significant differences in this area between
the two.

Cheers.
  Dave

[1] https://git.linuxtv.org/media_tree.git/tree/drivers/media/v4l2-core/v4l2-ctrls.c#n4224

> Thanks,
> Dafna
>
> > +             return 0;
> >       default:
> >               dev_info(&client->dev,
> >                        "Control (id:0x%x, val:0x%x) not supported\n",
> > @@ -1313,7 +1327,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
> >   {
> >       struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
> >
> > -     v4l2_ctrl_handler_init(&sensor->ctrls, 5);
> > +     v4l2_ctrl_handler_init(&sensor->ctrls, 6);
> >
> >       v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> >                         V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> > @@ -1333,17 +1347,29 @@ static int ov5647_init_controls(struct ov5647 *sensor)
> >       v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> >                         V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
> >
> > -     if (sensor->ctrls.error) {
> > -             dev_err(&client->dev, "%s Controls initialization failed (%d)\n",
> > -                     __func__, sensor->ctrls.error);
> > -             v4l2_ctrl_handler_free(&sensor->ctrls);
> > +     /* By default, PIXEL_RATE is read only, but it does change per mode */
> > +     sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> > +                                            V4L2_CID_PIXEL_RATE,
> > +                                            sensor->mode->pixel_rate,
> > +                                            sensor->mode->pixel_rate, 1,
> > +                                            sensor->mode->pixel_rate);
> > +     if (!sensor->pixel_rate)
> > +             goto handler_free;
> > +     sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > -             return sensor->ctrls.error;
> > -     }
> > +     if (sensor->ctrls.error)
> > +             goto handler_free;
> >
> >       sensor->sd.ctrl_handler = &sensor->ctrls;
> >
> >       return 0;
> > +
> > +handler_free:
> > +     dev_err(&client->dev, "%s Controls initialization failed (%d)\n",
> > +             __func__, sensor->ctrls.error);
> > +     v4l2_ctrl_handler_free(&sensor->ctrls);
> > +
> > +     return sensor->ctrls.error;
> >   }
> >
> >   static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
> >
> _______________________________________________
> libcamera-devel mailing list
> libcamera-devel@lists.libcamera.org
> https://lists.libcamera.org/listinfo/libcamera-devel
