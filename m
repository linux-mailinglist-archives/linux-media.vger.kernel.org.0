Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA47720F804
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 17:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389295AbgF3PNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 11:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389252AbgF3PNp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 11:13:45 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974E2C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 08:13:45 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a6so20582768wrm.4
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=orAP0OW+vZ4Ea7vBgKJPGIWJn9cS+H33u/7ocA1puAo=;
        b=CYbRzVP/naRi/OODuFuhUtFr4s71ZHXdzCBshaw691LvrGdMrntD+pb/WliaAkaQzW
         YIuFaSzD0kfH9qAMDTxiEo3xoed3vnS71XCij0+CoAyfZHfil4vQbB4EioETOkRlhRwq
         sUK4Ch6rqjU21i5FVzA+BhzkGxtbsOvUFwgMhLx5bp6nJoqQ70sR0abXk9k4vHM7t7Jn
         6ILFBcbssmK36nFJqVvUC4cNouheFHCD2i/69rDdbW4rIc2Rcx0Fk38mEht9ubpVn0h2
         +gC4UYyQUJ9AOKyVFN/74t8tpz3Klj2otVdVbu3GPnVr7c9qddkm9zpXwHj+Vojv1r+c
         KmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=orAP0OW+vZ4Ea7vBgKJPGIWJn9cS+H33u/7ocA1puAo=;
        b=t7fohbpx/pf2G5NPi7O9UYstV+xH2UacGlP2qsP0gS9Fujfz5bEbLfvq3HgZD2Yfs0
         Mo/Q+cSDEZEjSi5OpxNk0G1g2tXssHPKY2lB7juXZEai0TKfOZpf9yU6oqHxQYxiRgYD
         oZj39x2+jqS1xZcs+dJBEIdFYKPSdRfinheSRRcWMxkNgzjlo+ikawizQU1uitpzztgf
         dSAxTD+43WrFFhlO58D56TpDXoBmDSULm1abL00sNwbM8ZWBLKAGYfdJtM+RnhA9yTVl
         KWHAuSZo2onZNH4+fqwpoO5fTFWsbWnTQ18Rv5XBWoKUE+TSB/5K4xBQgUJM38zvuxNK
         9ubQ==
X-Gm-Message-State: AOAM532tM4f/dTZ3aW7Gk5EBjzXXPfCWGO/odhU97pM+xd90s1HQp17U
        exs8KvhbAf5hEp7tbKs/tm9Dy/XDdXWVhM4pMGT1PTzrG6PwIw==
X-Google-Smtp-Source: ABdhPJzE21IDIacoRJkRPsiIHM2cEcYp79YOnlTzRLnG39CQH1+snJaZ9yLQM60UJCYKbmOmmxFWFvoMXdm4MyuzABU=
X-Received: by 2002:adf:81c7:: with SMTP id 65mr21266143wra.47.1593530024240;
 Tue, 30 Jun 2020 08:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200623100815.10674-1-jacopo@jmondi.org> <20200623165550.45835-3-jacopo@jmondi.org>
 <3aab9b3d-0156-e83c-9a63-026ded395af6@collabora.com> <CAPY8ntBq6Lzo2qPNX6ke608SOQYVxsdjfXj2GTS6uZQMmi23JQ@mail.gmail.com>
In-Reply-To: <CAPY8ntBq6Lzo2qPNX6ke608SOQYVxsdjfXj2GTS6uZQMmi23JQ@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 30 Jun 2020 16:13:29 +0100
Message-ID: <CAPY8ntDwgwSD77ZiuhP46ikPTB4WkSZKJa1+uUg_gB6VLrHjCQ@mail.gmail.com>
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

On Mon, 29 Jun 2020 at 22:25, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Dafna
>
> On Mon, 29 Jun 2020 at 18:01, Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
> >
> >
> >
> > On 23.06.20 18:55, Jacopo Mondi wrote:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >
> > > Clients need to know the pixel rate in order to compute exposure
> > > and frame rate values. Advertise it.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >   drivers/media/i2c/ov5647.c | 40 +++++++++++++++++++++++++++++++-------
> > >   1 file changed, 33 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > > index 35865e56de5f9..218576a05e66b 100644
> > > --- a/drivers/media/i2c/ov5647.c
> > > +++ b/drivers/media/i2c/ov5647.c
> > > @@ -76,6 +76,7 @@ struct regval_list {
> > >   struct ov5647_mode {
> > >       struct v4l2_mbus_framefmt       format;
> > >       struct v4l2_rect                crop;
> > > +     u64                             pixel_rate;
> > >       struct regval_list              *reg_list;
> > >       unsigned int                    num_regs;
> > >   };
> > > @@ -97,6 +98,7 @@ struct ov5647 {
> > >       struct v4l2_ctrl_handler        ctrls;
> > >       struct ov5647_mode              *mode;
> > >       struct ov5647_mode              *current_mode;
> > > +     struct v4l2_ctrl                *pixel_rate;
> > >   };
> > >
> > >   static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> > > @@ -583,6 +585,7 @@ static struct ov5647_mode ov5647_sbggr8_modes[] = {
> > >                       .width          = 1280,
> > >                       .height         = 960,
> > >               },
> > > +             .pixel_rate     = 77291670,
> > >               .reg_list       = ov5647_640x480_sbggr8,
> > >               .num_regs       = ARRAY_SIZE(ov5647_640x480_sbggr8)
> > >       },
> > > @@ -604,6 +607,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
> > >                       .width          = 2592,
> > >                       .height         = 1944
> > >               },
> > > +             .pixel_rate     = 87500000,
> > >               .reg_list       = ov5647_2592x1944_sbggr10,
> > >               .num_regs       = ARRAY_SIZE(ov5647_2592x1944_sbggr10)
> > >       },
> > > @@ -622,6 +626,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
> > >                       .width          = 1928,
> > >                       .height         = 1080,
> > >               },
> > > +             .pixel_rate     = 81666700,
> > >               .reg_list       = ov5647_1080p30_sbggr10,
> > >               .num_regs       = ARRAY_SIZE(ov5647_1080p30_sbggr10)
> > >       },
> > > @@ -640,6 +645,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
> > >                       .width          = 2592,
> > >                       .height         = 1944,
> > >               },
> > > +             .pixel_rate     = 81666700,
> > >               .reg_list       = ov5647_2x2binned_sbggr10,
> > >               .num_regs       = ARRAY_SIZE(ov5647_2x2binned_sbggr10)
> > >       },
> > > @@ -658,6 +664,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
> > >                       .width          = 2560,
> > >                       .height         = 1920,
> > >               },
> > > +             .pixel_rate     = 55000000,
> > >               .reg_list       = ov5647_640x480_sbggr10,
> > >               .num_regs       = ARRAY_SIZE(ov5647_640x480_sbggr10)
> > >       },
> > > @@ -1094,6 +1101,10 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
> > >       /* Update the sensor mode and apply at it at streamon time. */
> > >       mutex_lock(&sensor->lock);
> > >       sensor->mode = mode;
> > > +
> > > +     __v4l2_ctrl_modify_range(sensor->pixel_rate, mode->pixel_rate,
> > > +                              mode->pixel_rate, 1, mode->pixel_rate);
> > > +
> > >       *fmt = mode->format;
> > >       mutex_unlock(&sensor->lock);
> > >
> > > @@ -1295,6 +1306,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
> > >               return  ov5647_s_analogue_gain(sd, ctrl->val);
> > >       case V4L2_CID_EXPOSURE:
> > >               return ov5647_s_exposure(sd, ctrl->val);
> > > +     case V4L2_CID_PIXEL_RATE:
> > > +             /* Read-only, but we adjust it based on mode. */
> >
> > Looking at other drivers, I see they don't handle read only controls
> > in s_ctrl cb. Also the docs (vidioc-queryctrl.rst) says that trying to set a read only control should
> > return EINVAL
>
> It was a while ago that I looked at this, but my memory says that
> without a handler here then the call to __v4l2_ctrl_modify_range to
> update the value failed. The ranges and default were changed, but the
> current value wasn't.
>
> Checking now, yes, without returning 0 here,  __v4l2_ctrl_modify_range
> returns -22 (-EINVAL) and v4l2-ctl --list-ctrls afterwards shows
> Image Processing Controls
>
>                      pixel_rate 0x009f0902 (int64)  : min=87500000
> max=87500000 step=1 default=87500000 value=81666700 flags=read-only
>
> A failure of the framework then and needs fixing there, or is it
> correct for the driver to have to implement a set hander if it needs
> to update the ranges?
> A quick grep implies that ov5647 is the first driver that needs to
> update V4L2_CID_PIXEL_RATE based on mode. I'll check in the morning if
> things like V4L2_CID_HBLANK behave the same - it may be a control type
> issue with 64 bit values.

Just following this up, it's not a 64 bit control thing, it's any read
only control won't update the current value if you
use__v4l2_ctrl_modify_range. That's why the patch adding
V4L2_CID_HBLANK has to do the same thing.
I've just tried it on imx219 and it works fine.....

The answer is down to "modern" sensor drivers using pm_runtime having a line
    if (pm_runtime_get_if_in_use(&client->dev) == 0)
        return 0;
in their s_ctrl function. So whenever the sensor isn't streaming,
which has to be the case for setting modes, gets a 0 return value from
the s_ctrl call even though the control is invalid.
That does seem to be a failure within the ctrl core then. Effectively
other drivers do have this handling in, but via a different route.

Hans or Sakari may have ideas on how they would like to see the core
v4l2-ctrls code fixing to cover this. try_or_set_cluster is called
from too many places for me to know whether it is safe to just skip
the s_ctrl call for read only controls.

  Dave

> Interesting that the docs say EINVAL as at least one path in the
> framework appears to return -EACCES [1]
> Checking it:
> pi@raspberrypi:~ $ v4l2-ctl --set-ctrl pixel_rate=42
> VIDIOC_S_EXT_CTRLS: failed: Permission denied
> Error setting controls: Permission denied
> which would imply -EACCES
>
> I am testing on a 5.4 kernel rather than media_tree.git, but there
> don't appear to be any significant differences in this area between
> the two.
>
> Cheers.
>   Dave
>
> [1] https://git.linuxtv.org/media_tree.git/tree/drivers/media/v4l2-core/v4l2-ctrls.c#n4224
>
> > Thanks,
> > Dafna
> >
> > > +             return 0;
> > >       default:
> > >               dev_info(&client->dev,
> > >                        "Control (id:0x%x, val:0x%x) not supported\n",
> > > @@ -1313,7 +1327,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
> > >   {
> > >       struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
> > >
> > > -     v4l2_ctrl_handler_init(&sensor->ctrls, 5);
> > > +     v4l2_ctrl_handler_init(&sensor->ctrls, 6);
> > >
> > >       v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> > >                         V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> > > @@ -1333,17 +1347,29 @@ static int ov5647_init_controls(struct ov5647 *sensor)
> > >       v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> > >                         V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
> > >
> > > -     if (sensor->ctrls.error) {
> > > -             dev_err(&client->dev, "%s Controls initialization failed (%d)\n",
> > > -                     __func__, sensor->ctrls.error);
> > > -             v4l2_ctrl_handler_free(&sensor->ctrls);
> > > +     /* By default, PIXEL_RATE is read only, but it does change per mode */
> > > +     sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> > > +                                            V4L2_CID_PIXEL_RATE,
> > > +                                            sensor->mode->pixel_rate,
> > > +                                            sensor->mode->pixel_rate, 1,
> > > +                                            sensor->mode->pixel_rate);
> > > +     if (!sensor->pixel_rate)
> > > +             goto handler_free;
> > > +     sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > >
> > > -             return sensor->ctrls.error;
> > > -     }
> > > +     if (sensor->ctrls.error)
> > > +             goto handler_free;
> > >
> > >       sensor->sd.ctrl_handler = &sensor->ctrls;
> > >
> > >       return 0;
> > > +
> > > +handler_free:
> > > +     dev_err(&client->dev, "%s Controls initialization failed (%d)\n",
> > > +             __func__, sensor->ctrls.error);
> > > +     v4l2_ctrl_handler_free(&sensor->ctrls);
> > > +
> > > +     return sensor->ctrls.error;
> > >   }
> > >
> > >   static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
> > >
> > _______________________________________________
> > libcamera-devel mailing list
> > libcamera-devel@lists.libcamera.org
> > https://lists.libcamera.org/listinfo/libcamera-devel
