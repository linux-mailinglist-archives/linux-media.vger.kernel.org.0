Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DEB485AE5
	for <lists+linux-media@lfdr.de>; Wed,  5 Jan 2022 22:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244552AbiAEVmx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jan 2022 16:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235053AbiAEVmq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jan 2022 16:42:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BE4C061245;
        Wed,  5 Jan 2022 13:42:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAD891B1F;
        Wed,  5 Jan 2022 22:42:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641418964;
        bh=K4bZwQKWPupfeh3GqZZD7WGrSBN9fIFCs16yo5IIlJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OjFlMqH40HOm45oV4cfsohcwCwaTXNXUV6eraO9TanSR5DkwEG+RpzNII8QVXE17W
         LV9w1xjdoIf2dP/FxufWW64KaUoSv96LPmf8BqXwVfb6sRXf11WBt8CmK4Z7z78NOH
         Vc7YRA3+Crw9dpQ6KMPRE3xN3fZ06e+kCoAuuuIU=
Date:   Wed, 5 Jan 2022 23:42:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [RFC PATCH 2/8] media: i2c: ov6650: Drop implementation of
 .set_mbus_config()
Message-ID: <YdYQztLGsEAqL6l+@pendragon.ideasonboard.com>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220103162414.27723-3-laurent.pinchart+renesas@ideasonboard.com>
 <YdXdqJLKzDduVdex@valkosipuli.retiisi.eu>
 <YdX9ZaFJVSVrh41A@pendragon.ideasonboard.com>
 <CAGfqbt5ZyVAjCggqmQxp+2028Yaz+e=O6RqkfWH6LpDBm_MsSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGfqbt5ZyVAjCggqmQxp+2028Yaz+e=O6RqkfWH6LpDBm_MsSA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Wed, Jan 05, 2022 at 10:31:41PM +0100, Janusz Krzysztofik wrote:
> On Wednesday, 5 January 2022 21:19:49 CET Laurent Pinchart wrote:
> > On Wed, Jan 05, 2022 at 08:04:24PM +0200, Sakari Ailus wrote:
> > > On Mon, Jan 03, 2022 at 06:24:08PM +0200, Laurent Pinchart wrote:
> > > > The subdev .set_mbus_config() operation is deprecated. No code in the
> > > > kernel calls it, so drop its implementation from the ov6650 driver.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > ---
> > > >  drivers/media/i2c/ov6650.c | 37 -------------------------------------
> > > >  1 file changed, 37 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > > > index f67412150b16..455a627e35a0 100644
> > > > --- a/drivers/media/i2c/ov6650.c
> > > > +++ b/drivers/media/i2c/ov6650.c
> > > > @@ -944,42 +944,6 @@ static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
> > > >   return 0;
> > > >  }
> > > >
> > > > -/* Alter bus settings on camera side */
> > > > -static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> > > > -                           unsigned int pad,
> > > > -                           struct v4l2_mbus_config *cfg)
> > > > -{
> > > > - struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > > - int ret = 0;
> > > > -
> > > > - if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> > > > - else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
> > >
> > > I think this configuration should come from the endpoint which the driver
> > > currently does not parse. In fact, there are no even DT bindings for the
> > > device.
> >
> > There's also no OF match table. While this isn't strictly required, it
> > may indicate that the sensor hasn't been tested much on DT-based
> > systems.
> >
> > I agree that the configuration should come from the device tree, but I
> > can't test that, so I'm tempted to let someone else implement it if the
> > driver is actually still in use (I can also write a patch if someone can
> > test it).
> 
> This driver was used with omap1_camera, removed from the tree a few years
> ago by Hans, despite my attempts to refresh it.  I tried to keep ov6650
> updated but I gave up due to lack of response to my submissions.  That also
> blocked my attempts to rework and reintroduce omap1_camera.
> 
> I think I'm still able to update my local (v4l2, non-mc) version of
> omap1_camera to the extent required to test any changes to ov6650.
> However, the OMAP1 platform does not support DT, and will probably never
> do.  Then,  I think that it makes sense to spend my time on that only if
> you (media maintainers) are not going to depreciate non-DT support any
> soon.  Are you?

Thank you for the quick reply, and for the offer to test this. I
understand your frustration, and the impossibility (with reasonable
effort) to move OMAP1 to DT. This means that we would need to add
platform data support to the ov6650 driver, and specify the platform
data in the corresponding board file. On the ov6650 driver side I have
no issue with that, and while platform data is deprecated for new
platforms, it can be kept around for older ones as long as needed. I
however don't know if changes to board files in arch/arm/mach-omap1
would be accepted. I also don't see any mention of ov6650 there, leading
me to believe nobody can use this driver with the mainline kernel
without resurecting the omap1_camera driver. I'm thus wondering if this
would be a good use of your time, or if we should just merge this patch
as-is.

> > > I wonder what kind of environment it is used in --- assuming it works
> > > somewhere.
> > >
> > > > - if (ret)
> > > > -         return ret;
> > > > -
> > > > - if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> > > > -         ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
> > > > - else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> > > > -         ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
> > > > - if (ret)
> > > > -         return ret;
> > > > -
> > > > - if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
> > > > - else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
> > > > - if (ret)
> > > > -         return ret;
> > > > -
> > > > - /*
> > > > -  * Update the configuration to report what is actually applied to
> > > > -  * the hardware.
> > > > -  */
> > > > - return ov6650_get_mbus_config(sd, pad, cfg);
> > > > -}
> > > > -
> > > >  static const struct v4l2_subdev_video_ops ov6650_video_ops = {
> > > >   .s_stream       = ov6650_s_stream,
> > > >   .g_frame_interval = ov6650_g_frame_interval,
> > > > @@ -993,7 +957,6 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
> > > >   .get_fmt        = ov6650_get_fmt,
> > > >   .set_fmt        = ov6650_set_fmt,
> > > >   .get_mbus_config = ov6650_get_mbus_config,
> > > > - .set_mbus_config = ov6650_set_mbus_config,
> > > >  };
> > > >
> > > >  static const struct v4l2_subdev_ops ov6650_subdev_ops = {

-- 
Regards,

Laurent Pinchart
