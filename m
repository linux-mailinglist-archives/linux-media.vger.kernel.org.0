Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF4C281DB7
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 23:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgJBVei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 17:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJBVei (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 17:34:38 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD36C0613D0;
        Fri,  2 Oct 2020 14:34:38 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id v60so2146706ybi.10;
        Fri, 02 Oct 2020 14:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K7r5m3tkpGosvDOLsPsFAxv4/KP2aIslKzF4+30ISEA=;
        b=QTRbgb1CVaW6Bc+gFPjgxzLqSk9S0LCsg428otJCFxH3GsT0KBk1w48xu6cs8KsNga
         qkfAoGckwCHqQgw7ZLbzJX/y1m4IWvX9Xi6PLV2F392sm0Y8nqyavAQ58IMX01GLW5LL
         OHE5G3tLm/9G6WYJrqqgEIJESK4tZr23bx/wSsP7b1x4tiPTNmOMgnKgC4fg4c3+YF8M
         5M2h84Yl+SuFwNyWdOHdq1ZlyAn2LmsaSoqAqMO1tMcjFTgSZQV49+dV2PYZn/rQkMjL
         LyX6Jp45XHiDSlPlGzal/ROxekY5+PDUqOlxEt/jJ3ipWPf+gPQDWX9B18R8G8L7fS4Y
         Sekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K7r5m3tkpGosvDOLsPsFAxv4/KP2aIslKzF4+30ISEA=;
        b=XsL1MLjO51ri8tcv/iQM8NUffu88r8oavqGAdCN4qC8MwHm1VpeFF5EVX5a5PoMEy7
         cxbv1lGEahK535rAKe2ztoAJEfTFf4CuqTncZ/DKhxQPkQbmSSYpt2JpYqvJBaevYV2M
         y9mKvzVifbDGu3z73TzZtVUhaWE1fMYBn4U/mplHIfss+NCnzKEpSmwTWddCmfVqLL/q
         lLi9qN6oDeDrv/+x8kGOVRTC+jOxcpNqRZDHPNMwhw9iRoqTZmLCA2SX7Lzz23wBGZAv
         LcBj6iHZTJrMVUgKqA/tuNUuBP56VQZ4tal/0LnwczcAl4Q6E+sb3i13Nk07/FRl4/vr
         HFYA==
X-Gm-Message-State: AOAM530hl7zJoXOwDuNSuwbx/EvN7NoR06jzTc2b+LZy4DeAdGTCOSrD
        /HpziGGD9waN25GH5lq8Xuw3juT/JZoLH8kpl7M=
X-Google-Smtp-Source: ABdhPJxY2w05rKf8JxYi13IJTdM+neAhcheCc9/vDDZ9EYyNBuu2QSi+RfAroGe1tIiBdmGnzCi2QGx6CWVT3nN7S9s=
X-Received: by 2002:a25:cb45:: with SMTP id b66mr5324771ybg.25.1601674477440;
 Fri, 02 Oct 2020 14:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201002165656.16744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201002165656.16744-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201002211236.GW26842@paasikivi.fi.intel.com>
In-Reply-To: <20201002211236.GW26842@paasikivi.fi.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 2 Oct 2020 22:34:11 +0100
Message-ID: <CA+V-a8vmyDpt88uVd6FxDcTmXiLOV8-neRNk0OO9Pv7Cj5czww@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] media: i2c: ov772x: Parse endpoint properties
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the review.

On Fri, Oct 2, 2020 at 10:12 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> On Fri, Oct 02, 2020 at 05:56:54PM +0100, Lad Prabhakar wrote:
> > Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
> > to determine the bus type and store it in the driver structure.
> >
> > Set bus_type to V4L2_MBUS_PARALLEL as it's the only supported one
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/ov772x.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> > index 2cc6a678069a..b56f8d7609e6 100644
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
> > @@ -1348,6 +1350,33 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
> >       .pad    = &ov772x_subdev_pad_ops,
> >  };
> >
> > +static int ov772x_parse_dt(struct i2c_client *client,
> > +                        struct ov772x_priv *priv)
> > +{
> > +     struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = V4L2_MBUS_PARALLEL };
>
> This one gets over 80.
>
Argh I need to adjust my checkpatch script

> > +     struct fwnode_handle *ep;
> > +     int ret;
> > +
> > +     ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > +                                         NULL);
>
> And this needs no newline.
>
Agreed.

Cheers,
Prabhakar
