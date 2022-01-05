Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB684485ABC
	for <lists+linux-media@lfdr.de>; Wed,  5 Jan 2022 22:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244492AbiAEVdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jan 2022 16:33:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244500AbiAEVc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jan 2022 16:32:29 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC59C061201;
        Wed,  5 Jan 2022 13:31:53 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id e19so824505uaa.11;
        Wed, 05 Jan 2022 13:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5vuftKyazmUU0jtnK1OiGsSA4rLTp3J+fS1G6Y6W5Lk=;
        b=o7ECV/bYqe7dKI3JlDysfZDcuAY++pu5V0VcswCi4p9WKuVlsEaRZ7JsiAUee96z6e
         AT+JL/Ov+XMoRtTmAE2nsCHPyAXT1tk/Ne5tyO4koV0UKearK0fchzLIA6hTAhmRDXKN
         aOv1H+evMjvhGbVFpHhfpwc60WTx2iusGBNuVlCixOkmH96yMKc+Z9GGScVJEEEH3Mq4
         aLoswNXk1UjECdbUDOo5k2tKYHKGc97tzeWBsjZjb9yYXG6TQw4KaUT3QyVyeq7qoQR8
         paWbbl+eoAVZ4gL6JCkIM3L/Sq2fw1GHWU5h4pYfLOEeC3hxyZKOf3PQ+D2lXf5JINg7
         GQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5vuftKyazmUU0jtnK1OiGsSA4rLTp3J+fS1G6Y6W5Lk=;
        b=RROCXMwEcVI6W8rGrPX+weLNV466ULCoBFbgx+sebqB9qtFa3RfX6GFndOoJpPpbRT
         RxL6LUh6ynBSIsYOfTlAYCbVcwJpj/nB/ZywYNg/YKM164hI1jTeIp61ehi0AePBPAnM
         7Cw8t/XLb1j3Wtm+uxxcbt648RN4eKtJ0+cOLBxbZAiAWJCHT6bH1GeZccVjYw+24TLX
         KGQm4DjnKnXObem5IKeXXpgLen6rZZG0pZg3CINPvO7Ocx7VVXL/n7MmjRrqJTagqgNy
         RArWqSd/PlqByGV8MTqMQNI8gHqFbvE3X+29/K6rTSJv8QHxNpkdUeVxv0oEOmDXxqIF
         n31A==
X-Gm-Message-State: AOAM532FrAo+UDHYW8IKlF/ysmND0gl2uU6xJMhyLWnTJM5fuK4Od8Hm
        bqrC/u1Qs58vup3vyzUBG0QfHAIu1mtrxaXnN0g=
X-Google-Smtp-Source: ABdhPJxcMFsfYmtBQNSJgLdL4KM/8ryN0iPdnrwz0OQ4giwWNjHXzvjeJQnPVyFIKZ7CST84p3rA9EC9QIQK6h9HSA4=
X-Received: by 2002:a67:e10d:: with SMTP id d13mr19013206vsl.5.1641418312923;
 Wed, 05 Jan 2022 13:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220103162414.27723-3-laurent.pinchart+renesas@ideasonboard.com>
 <YdXdqJLKzDduVdex@valkosipuli.retiisi.eu> <YdX9ZaFJVSVrh41A@pendragon.ideasonboard.com>
In-Reply-To: <YdX9ZaFJVSVrh41A@pendragon.ideasonboard.com>
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date:   Wed, 5 Jan 2022 22:31:41 +0100
Message-ID: <CAGfqbt5ZyVAjCggqmQxp+2028Yaz+e=O6RqkfWH6LpDBm_MsSA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/8] media: i2c: ov6650: Drop implementation of .set_mbus_config()
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wednesday, 5 January 2022 21:19:49 CET Laurent Pinchart wrote:
> Hi Sakari,
>
> On Wed, Jan 05, 2022 at 08:04:24PM +0200, Sakari Ailus wrote:
> > On Mon, Jan 03, 2022 at 06:24:08PM +0200, Laurent Pinchart wrote:
> > > The subdev .set_mbus_config() operation is deprecated. No code in the
> > > kernel calls it, so drop its implementation from the ov6650 driver.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/ov6650.c | 37 -------------------------------------
> > >  1 file changed, 37 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > > index f67412150b16..455a627e35a0 100644
> > > --- a/drivers/media/i2c/ov6650.c
> > > +++ b/drivers/media/i2c/ov6650.c
> > > @@ -944,42 +944,6 @@ static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
> > >   return 0;
> > >  }
> > >
> > > -/* Alter bus settings on camera side */
> > > -static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> > > -                           unsigned int pad,
> > > -                           struct v4l2_mbus_config *cfg)
> > > -{
> > > - struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > - int ret = 0;
> > > -
> > > - if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > -         ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> > > - else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> > > -         ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
> >
> > I think this configuration should come from the endpoint which the driver
> > currently does not parse. In fact, there are no even DT bindings for the
> > device.
>
> There's also no OF match table. While this isn't strictly required, it
> may indicate that the sensor hasn't been tested much on DT-based
> systems.
>
> I agree that the configuration should come from the device tree, but I
> can't test that, so I'm tempted to let someone else implement it if the
> driver is actually still in use (I can also write a patch if someone can
> test it).

This driver was used with omap1_camera, removed from the tree a few years
ago by Hans, despite my attempts to refresh it.  I tried to keep ov6650
updated but I gave up due to lack of response to my submissions.  That also
blocked my attempts to rework and reintroduce omap1_camera.

I think I'm still able to update my local (v4l2, non-mc) version of
omap1_camera to the extent required to test any changes to ov6650.
However, the OMAP1 platform does not support DT, and will probably never
do.  Then,  I think that it makes sense to spend my time on that only if
you (media maintainers) are not going to depreciate non-DT support any
soon.  Are you?

Thanks,
Janusz


>
> > I wonder what kind of environment it is used in --- assuming it works
> > somewhere.
> >
> > > - if (ret)
> > > -         return ret;
> > > -
> > > - if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> > > -         ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
> > > - else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> > > -         ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
> > > - if (ret)
> > > -         return ret;
> > > -
> > > - if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> > > -         ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
> > > - else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > > -         ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
> > > - if (ret)
> > > -         return ret;
> > > -
> > > - /*
> > > -  * Update the configuration to report what is actually applied to
> > > -  * the hardware.
> > > -  */
> > > - return ov6650_get_mbus_config(sd, pad, cfg);
> > > -}
> > > -
> > >  static const struct v4l2_subdev_video_ops ov6650_video_ops = {
> > >   .s_stream       = ov6650_s_stream,
> > >   .g_frame_interval = ov6650_g_frame_interval,
> > > @@ -993,7 +957,6 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
> > >   .get_fmt        = ov6650_get_fmt,
> > >   .set_fmt        = ov6650_set_fmt,
> > >   .get_mbus_config = ov6650_get_mbus_config,
> > > - .set_mbus_config = ov6650_set_mbus_config,
> > >  };
> > >
> > >  static const struct v4l2_subdev_ops ov6650_subdev_ops = {
>
>
