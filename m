Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90EF727E85B
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 14:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgI3MUH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 08:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3MUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 08:20:07 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B83C061755;
        Wed, 30 Sep 2020 05:20:07 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id x20so1107334ybs.8;
        Wed, 30 Sep 2020 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8OY3SIpBqhs9ShdUb/W0izWrW0fchBVg7nzJdv4eq1A=;
        b=iQxZnZUaCriMamuxwJyeFSRHA+SDnZKrPyar0weotpP7rJaMOJrG+YS8mQv8cVUiT/
         FXxtqoiX4Z2pToh3Xjwg0+OpOb4Z4vSKOjU2wQW5J7685ZVhdiU/RbASQv9NrG9leN5j
         v3vvlY+qjmubNkIayoOX9IKPSKftKNk3keEAtjWe9mL0QNp2hmjU7gGkuO8EWwDucNLK
         x8pSRvXo9aedhvroxrVgv2fzNj6Vqpplbmkw+PcijC/r5HXYKpP7A6b//uSDyYXS5o7I
         06+1C18yQTUKAcHGOL7rGwmFaToqeOukEAPysDB5AAbV9F/RmMPpX6esyJ+P/7LcT15Z
         kwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8OY3SIpBqhs9ShdUb/W0izWrW0fchBVg7nzJdv4eq1A=;
        b=ap35dzbyKfqRrB1en9PcY3SdQDcqT9iXRaAIOltGG/uCMaAxTvN1d5nzTxFvpMVlKs
         QhjNDy8QUumCa/LVGEE6ETPmBgS1wgeva+zIlkPAe50MiijKTBX0XtOVZZpr6/cD4y2i
         96WeckoT5qtMqZyuu1fZ1hB/S7FXwkPD0P6FAkQftV8avXMgJ8GCVAWobUEoqJrrvZu3
         N/k2N1ILEkDEWQZTP7J8ovUXHYh/dvkpWEclA9hbWGWAEzTk8hS6uRxOoeqbGx2hw3YF
         8f9xkMEzHEJ8fna8CZA0w6LKsYlL599L4nZXP60epOZP1Br1+pMbikcRqFTAIA21DlfE
         NIew==
X-Gm-Message-State: AOAM533uRkQRAIpIQGgbK6kVzLY37AzxJfp86fugPi59vJAOLaCj+Fbv
        /NqVc5OQSwwNfHBsYUnPC52KHqNfOiRfhT18Sj6IO8CfeUBqK+Dv
X-Google-Smtp-Source: ABdhPJxdagDPrgQuFVssAP+5cHQ8RgYlZRk4xuLfdA0tNOgUrr1u4oTxJcW98Uw0ZpK3xYXpXHaGzWY9/bAZavEBy40=
X-Received: by 2002:a25:e811:: with SMTP id k17mr2590001ybd.401.1601468406510;
 Wed, 30 Sep 2020 05:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200917174224.11430-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200917174224.11430-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200930114529.GM26842@paasikivi.fi.intel.com>
In-Reply-To: <20200930114529.GM26842@paasikivi.fi.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 30 Sep 2020 13:19:40 +0100
Message-ID: <CA+V-a8t5piG4a0C2BKgsZii6EB7te=GUeRCmfcPhdm+hAuV7Ng@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] media: i2c: ov772x: Parse endpoint properties
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Sakari,

Thank you for the review.

On Wed, Sep 30, 2020 at 12:45 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> On Thu, Sep 17, 2020 at 06:42:22PM +0100, Lad Prabhakar wrote:
> > Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
> > to determine the bus type and store it in the driver structure.
> >
> > Set bus_type to V4L2_MBUS_PARALLEL as it's the only supported one
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/ov772x.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> > index 2cc6a678069a..f61a3f09ad64 100644
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
> > @@ -1348,6 +1350,34 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
> >       .pad    = &ov772x_subdev_pad_ops,
> >  };
> >
> > +static int ov772x_parse_dt(struct i2c_client *client,
> > +                        struct ov772x_priv *priv)
> > +{
> > +     struct v4l2_fwnode_endpoint bus_cfg;
> > +     struct fwnode_handle *ep;
> > +     int ret;
> > +
> > +     ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > +                                         NULL);
> > +     if (!ep) {
> > +             dev_err(&client->dev, "Endpoint node not found\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
>
> Please zero the entire struct, i.e. do this assignment in the declaration.
>
Agreed, but instead at the declaration I would prefer here as below,
since patch 2/3 has a comment related to backward compatibility with
the bindings. Is this OK with you ?
    bus_cfg = (struct v4l2_fwnode_endpoint)
          { .bus_type = V4L2_MBUS_PARALLEL };

> You can also use v4l2_fwnode_endpoint_parse() if you're not using the link
> frequencies --- sensor drivers generally should but you could only add them
> as optional at this point (out of scope of this patch).
>
will stick with this for now :)

Cheers,
Prabhakar
