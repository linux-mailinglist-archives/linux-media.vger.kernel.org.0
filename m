Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F0D2A66F1
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 15:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730292AbgKDO7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 09:59:30 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:47499 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgKDO7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 09:59:30 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E03EFC000C;
        Wed,  4 Nov 2020 14:59:23 +0000 (UTC)
Date:   Wed, 4 Nov 2020 15:59:24 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Naushir Patuck <naush@raspberrypi.com>, erosca@de.adit-jv.com
Subject: Re: [PATCH v2 20/30] media: ov5647: Program mode only if it has
 changed
Message-ID: <20201104145924.zjbkbxv6g4ehtk5t@uno.localdomain>
References: <20201104103622.595908-1-jacopo@jmondi.org>
 <20201104103622.595908-21-jacopo@jmondi.org>
 <CAPY8ntBEzMwXqQhAaa6QbNx0Dg_BvAcSO3J8BXw57-vjgPqxmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBEzMwXqQhAaa6QbNx0Dg_BvAcSO3J8BXw57-vjgPqxmg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Nov 04, 2020 at 12:20:26PM +0000, Dave Stevenson wrote:
> Hi Jacopo
>
> On Wed, 4 Nov 2020 at 10:37, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Store in the driver structure a pointer to the currently applied mode
> > and program a new one at s_stream(1) time only if it has changed.
>
> This patch is redundant as you've moved the power calls into s_stream,
> and you can't change mode whilst streaming.

You're probably right, but I don't think the reason it's because you
cannot s_ftm() while streaming, at least, not in the current
implementation because ov5647_set_pad_fmt() doesn't actually perform
any 'if (sensor->streaming) return -EBUSY;' and the core doesn't
protect you against this (as far I can tell there's no 'streaming
state' the core is aware of) Although the driver should probably reject
s_fmt() during streaming and that's something I should add in v3?

Anyway, you're right on this: the sensor gets powered on at every
s_stream() now, so whatever mode is requested, it has to be programmed
regardless.

Thanks!
   j

>
> It made sense when s_power was independent, as s_power(1), set_mode,
> set_mode, set_mode, s_power(0) was valid and could result in the same
> register set being written multiple times for no gain.
>
>   Dave
>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5647.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index 21983af55c23f..6e500fb548c74 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -96,6 +96,7 @@ struct ov5647 {
> >         bool                            clock_ncont;
> >         struct v4l2_ctrl_handler        ctrls;
> >         const struct ov5647_mode        *mode;
> > +       const struct ov5647_mode        *current_mode;
> >  };
> >
> >  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> > @@ -755,6 +756,9 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
> >         u8 resetval, rdval;
> >         int ret;
> >
> > +       if (sensor->mode == sensor->current_mode)
> > +               return 0;
> > +
> >         ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
> >         if (ret < 0)
> >                 return ret;
> > @@ -781,6 +785,8 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
> >                         return ret;
> >         }
> >
> > +       sensor->current_mode = sensor->mode;
> > +
> >         return 0;
> >  }
> >
> > @@ -819,6 +825,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
> >
> >  static int ov5647_stream_off(struct v4l2_subdev *sd)
> >  {
> > +       struct ov5647 *sensor = to_sensor(sd);
> >         int ret;
> >
> >         ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_CLOCK_LANE_GATE |
> > @@ -830,7 +837,13 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
> >         if (ret < 0)
> >                 return ret;
> >
> > -       return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> > +       ret = ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       sensor->current_mode = NULL;
> > +
> > +       return 0;
> >  }
> >
> >  static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
> > --
> > 2.29.1
> >
