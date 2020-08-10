Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7534240270
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 09:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgHJHZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 03:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgHJHZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 03:25:29 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E54C061756;
        Mon, 10 Aug 2020 00:25:29 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id q16so4659328ybk.6;
        Mon, 10 Aug 2020 00:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y9XMh30ufnUqk9AdZOEkF5RT2AG6qRJ/wAGRKNthdQs=;
        b=oCBRTKJ8e8v7sjNsv2dJ3eqL4nIJMZaDQV+Z0mvt525/tN235DcrjvbPeKQ3MIRMBr
         7hUHCy0BYJmDIPlGoNyPs0mXeR0PTXmDKpMrgdQW6LeviN5mvllgu7NU6pdgJp+DtQjc
         UlRObcyQi5wgN6dRwrfwqaNhtdmgjffkfGMf3YoyCEJ9/xrA/0RfYzfhl32UIGkpA9Z4
         vDuO11KHEHoLpkLZtSgGuQJYnDz1VRjFX8BfaStIwszLCFmLbMZBoqltplVOedvVpCer
         d3/SvSX7xGcfFHKjKaxpUlG40CxvorsZ70vo/S7OMDNtM3+IFyQwRyNE/sHonYEh5TB0
         ZBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y9XMh30ufnUqk9AdZOEkF5RT2AG6qRJ/wAGRKNthdQs=;
        b=L0BYBKvatFZC22RPyRVhWw1PXNz6OVetdbpEhbJItFa4XMt717Ouk4Dklo7/mK09Au
         nOAsrzP87TexHUXpQeQ2vKVCTtgnwH7TLfaTHbZTTrKjrg0CpGCufp2+xwXcxW496YLB
         9urgdBUw9Md5ap5tlHSbr93ttIeMFSNnEfJA3lnsSV2oFWIaGk25uxUVM0NyFzmK4ZNE
         1aWMf7RCdzGDNxV1eORoQnf96PGPXpDQCW9NhbWeyCxjwkFKtmkD0+DFecdpVkzB4QIx
         xr20sF1A7SulS1Oml7hjxbi58bvLKH7rxQtjdqAfTZWG5nJmkqyCaS8PNjbBky7Kpbqj
         8nyw==
X-Gm-Message-State: AOAM532go8Vs6htktiz3o0XrO4CocVryturOFVyRzIZmCXNkNHYfzwPK
        y8whW8QmLL+GsjRGaMtKumWPAwt8fE1sH/Mtbyg=
X-Google-Smtp-Source: ABdhPJxubfKAhbBYWXOu5Hl2BLVZlOAz0iAte5nh1SSxYgW/qeVjBucdzbTC0tkBi8v/vR2viV8lpUfrSmj3LrZea7k=
X-Received: by 2002:a25:c743:: with SMTP id w64mr35345933ybe.127.1597044328869;
 Mon, 10 Aug 2020 00:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596454753-13612-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200806144511.6ajoqyynowglnbpm@uno.localdomain>
In-Reply-To: <20200806144511.6ajoqyynowglnbpm@uno.localdomain>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 10 Aug 2020 08:25:02 +0100
Message-ID: <CA+V-a8utQjTb44wuAOS7+GVKMwvv+OpPTFZ5Ons9Tj=i0KCqzw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: i2c: ov772x: Add support for BT656 mode
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the review.

On Thu, Aug 6, 2020 at 3:41 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> On Mon, Aug 03, 2020 at 12:39:12PM +0100, Lad Prabhakar wrote:
> > Add support to read the bus-type and enable BT656 mode if needed.
> >
> > The driver defaults to parallel mode if bus-type is not specified in DT.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/media/i2c/ov772x.c | 40 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> > index 2cc6a678069a..2de9248e3689 100644
> > --- a/drivers/media/i2c/ov772x.c
> > +++ b/drivers/media/i2c/ov772x.c
> > @@ -31,6 +31,7 @@
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-image-sizes.h>
> >  #include <media/v4l2-subdev.h>
> >
> > @@ -434,6 +435,7 @@ struct ov772x_priv {
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >       struct media_pad pad;
> >  #endif
> > +     struct v4l2_fwnode_endpoint ep;
> >  };
> >
> >  /*
> > @@ -574,6 +576,7 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >       struct i2c_client *client = v4l2_get_subdevdata(sd);
> >       struct ov772x_priv *priv = to_ov772x(sd);
> > +     unsigned int val;
> >       int ret = 0;
> >
> >       mutex_lock(&priv->lock);
> > @@ -581,6 +584,22 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
> >       if (priv->streaming == enable)
> >               goto done;
> >
> > +     if (priv->ep.bus_type == V4L2_MBUS_BT656 && enable) {
> > +             ret = regmap_read(priv->regmap, COM7, &val);
> > +             if (ret)
> > +                     goto done;
> > +             val |= ITU656_ON_OFF;
> > +             ret = regmap_write(priv->regmap, COM7, val);
> > +     } else if (priv->ep.bus_type == V4L2_MBUS_BT656 && !enable) {
>
> is the !enable intentional ? (sorry I don't have access to the sensor
> manual). If not, see below:
>
> > +             ret = regmap_read(priv->regmap, COM7, &val);
> > +             if (ret)
> > +                     goto done;
> > +             val &= ~ITU656_ON_OFF;
> > +             ret = regmap_write(priv->regmap, COM7, val);
> > +     }
> > +     if (ret)
> > +             goto done;
>
> Could you write this as:
>
Agreed will do.

> static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
> {
>         struct i2c_client *client = v4l2_get_subdevdata(sd);
>         struct ov772x_priv *priv = to_ov772x(sd);
>         int ret = 0;
>
>         mutex_lock(&priv->lock);
>
>         if (priv->streaming == enable)
>                 goto done;
>
>         if (enable) {
>                 ret = regmap_read(priv->regmap, COM7, &val);
>                 if (ret)
>                         goto done;
>
>                 if (priv->ep.bus_type == V4L2_MBUS_BT656)
>                         val |= ITU656_ON_OFF;
>                 else /* if you accept my suggestion to consider othe
>                         bus types as errors */
>                         val &= ~ITU656_ON_OFF;
>
>                 ret = regmap_write(priv->regmap, COM7, val);
>                 if (ret)
>                         goto done;
>
>                 dev_dbg(&client->dev, "format %d, win %s\n",
>                         priv->cfmt->code, priv->win->name);
>         }
>
>         ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
>                                  enable ? 0 : SOFT_SLEEP_MODE);
>         if (ret)
>                 goto done;
>         priv->streaming = enable;
>
> done:
>         mutex_unlock(&priv->lock);
>
>         return ret;
> }
>
>
> >       ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
> >                                enable ? 0 : SOFT_SLEEP_MODE);
> >       if (ret)
> > @@ -1354,6 +1373,7 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
> >
> >  static int ov772x_probe(struct i2c_client *client)
> >  {
> > +     struct fwnode_handle *endpoint;
> >       struct ov772x_priv      *priv;
> >       int                     ret;
> >       static const struct regmap_config ov772x_regmap_config = {
> > @@ -1415,6 +1435,26 @@ static int ov772x_probe(struct i2c_client *client)
> >               goto error_clk_put;
> >       }
> >
> > +     endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > +                                               NULL);
> > +     if (!endpoint) {
> > +             dev_err(&client->dev, "endpoint node not found\n");
> > +             ret = -EINVAL;
> > +             goto error_clk_put;
> > +     }
> > +
> > +     ret = v4l2_fwnode_endpoint_parse(endpoint, &priv->ep);
> > +     fwnode_handle_put(endpoint);
> > +     if (ret) {
> > +             dev_err(&client->dev, "Could not parse endpoint\n");
> > +             goto error_clk_put;
> > +     }
> > +
> > +     /* fallback to parallel mode */
> > +     if (priv->ep.bus_type != V4L2_MBUS_PARALLEL &&
> > +         priv->ep.bus_type != V4L2_MBUS_BT656)
> > +             priv->ep.bus_type = V4L2_MBUS_PARALLEL;
>
> shouldn't this be an error ? It's either the bus type has not been
> specified on DT (which is fine, otherwise old DTB without that
> properties will fail) and the bus identification routine implemented
> in v4l2_fwnode_endpoint_parse() detected a bus type which is not
> supported, hence the DT properties are wrong, and this should be an
> error. If you plan to expand the parsing routine to support, say
> bus-width and pclk polarity please break this out to a new function.
>
Agreed.

Cheers,
Prabhakar

> Thanks
>    j
>
> > +
> >       ret = ov772x_video_probe(priv);
> >       if (ret < 0)
> >               goto error_gpio_put;
> > --
> > 2.17.1
> >
