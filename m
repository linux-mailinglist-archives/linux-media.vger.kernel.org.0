Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073BF2694CB
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 20:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgINS04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 14:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgINS0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 14:26:47 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE064C06178A;
        Mon, 14 Sep 2020 11:26:46 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id p81so560669ybc.12;
        Mon, 14 Sep 2020 11:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=orsG+I+8/k9sx4wSScsBpY6FXaWOiunslMG52trpArQ=;
        b=PsMLBBfsKcpnPHJNGDfWdPwaIPbSmT+6lwaJphJURdI124bvLiEYBfhbGovIVXhfnQ
         E0zfi357NZVQWAPDChaKEunbAkTXBeasXdE5miKI69BltTA7nj6wGoTEiNGQs82YJ4no
         BUd+E2CdOzzph6GQnuV1Q5oLnwPA9ZKSlr7X77BhSdxHpK9eKt0AeVKwd3qOjK5Et2f+
         HN3j+AxREIx00+XCdLgvUncxrdGCHWjdPqDHz2nCnRRUZcIl0TnxtQiBRR118+uM7GJz
         InYFEKZDJzTxQnhOLj2DZOyEb/syj6PjJcvGVWJ7vpA7YLapaYpOd6munu5vcuoSN5+k
         ehkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=orsG+I+8/k9sx4wSScsBpY6FXaWOiunslMG52trpArQ=;
        b=Xc15CZrypad56yOFx04QXETOVSE7UKk1qy6aVYxB/mLVzDFv2R/0G9t65WHem86jXm
         88wakfdfA+TpXI4R4zhr1JMV1cnr+yz5hGehu5Rc8yinY1/RYn7bAMPYe/bLi2ylLNSw
         yZGtRPTj9iQHwWVAl2PSCUJJ9n0eTvlfzzVryGtCnQLD4WnlMmzlW+Dt7IvHWXWlLF+Z
         YmxkWtURyWK/7/OtASejW8U9Mu70K5LqsTZy+EMKnnnWVAFss1x5YJvzNp+rdmQq+vT9
         1zBY9aJBA61/3Rm6MyYKw6FD5F1/IyjkYv6BV1Lf6QxhcB5xismn8fvuFQwxpiYzPbUG
         vW2g==
X-Gm-Message-State: AOAM532H7rX5PE128qvZcZP/wtlmalypKBNPjMDczCn/WWUERxZ4iL6c
        z0Z/PqZd+aokpIqO9xaXR0esXzzpe6BjhemTQHHTk6tl2ELrBg==
X-Google-Smtp-Source: ABdhPJyKionoFzIjpDwMOuti0uX2GCz6L8GG13ZsyOqaOWwcu3pgXx9gXkJ5n92H3ltSPoY8hFh9owXdfQZ42A8ihaA=
X-Received: by 2002:a25:aba1:: with SMTP id v30mr3965574ybi.518.1600108005948;
 Mon, 14 Sep 2020 11:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200913184247.618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200913184247.618-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200914065415.GK26842@paasikivi.fi.intel.com>
In-Reply-To: <20200914065415.GK26842@paasikivi.fi.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 14 Sep 2020 19:26:19 +0100
Message-ID: <CA+V-a8vmJo00vBqFWEnJWKagXm0ievGXW=kwG+w_oNWSmP1vcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: i2c: ov772x: Parse endpoint properties
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

THank you for the review.

On Mon, Sep 14, 2020 at 7:54 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patchset.
>
> On Sun, Sep 13, 2020 at 07:42:45PM +0100, Lad Prabhakar wrote:
> > Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
> > to determine bus-type and store it locally in priv data.
> >
> > Also for backward compatibility with the existing DT where bus-type
> > isnt specified fallback to V4L2_MBUS_PARALLEL.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/ov772x.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> > index 2cc6a678069a..551082aa7026 100644
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
> > +     enum v4l2_mbus_type               bus_type;
> >  };
> >
> >  /*
> > @@ -1354,6 +1356,8 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
> >
> >  static int ov772x_probe(struct i2c_client *client)
> >  {
> > +     struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> > +     struct fwnode_handle    *ep;
> >       struct ov772x_priv      *priv;
> >       int                     ret;
> >       static const struct regmap_config ov772x_regmap_config = {
> > @@ -1415,6 +1419,26 @@ static int ov772x_probe(struct i2c_client *client)
> >               goto error_clk_put;
> >       }
> >
> > +     ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > +                                         NULL);
> > +     if (!ep) {
> > +             dev_err(&client->dev, "endpoint node not found\n");
> > +             ret = -EINVAL;
> > +             goto error_clk_put;
> > +     }
> > +
> > +     bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
> > +     ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +     priv->bus_type = bus_cfg.bus_type;
> > +     v4l2_fwnode_endpoint_free(&bus_cfg);
> > +     if (ret) {
> > +             /* For backward compatibility with the existing DT where
> > +              * bus-type isnt specified fallback to V4L2_MBUS_PARALLEL
>
> "isn't", "fall back", and a period, please.
>
Will fix that.

> > +              */
> > +             priv->bus_type = V4L2_MBUS_PARALLEL;
> > +             dev_notice(&client->dev, "Falling back to V4L2_MBUS_PARALLEL mode\n");
>
> I'd just use dev_dbg().
>
OK will switch to dev_dbg()

Cheers,
Prabhakar
