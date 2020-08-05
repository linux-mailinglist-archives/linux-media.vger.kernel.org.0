Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70EE923C7D6
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 10:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgHEIcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 04:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgHEIcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 04:32:51 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF67C06174A;
        Wed,  5 Aug 2020 01:32:51 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id q16so21193929ybk.6;
        Wed, 05 Aug 2020 01:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QMUv2ojLbgkbNjy8R8PZ7qLfqmfzFtBoqOYdedJ2bnc=;
        b=aqR4DbID7bj/Ery02pr0Zf1tqbYdGDFS8QdtlRqESrS0bfzPQwuaFomo0JlB199P7A
         f0b0Gk8kKsv4uyOmA45UfAOzMHUD4iZEk/KZSjZ6dWlB1Fuz+cImvVsSBYiQj0lrNhEs
         Z2j46vIST2amb3nh1Au2pDcdsp+XTcqkLo7+JGKhrpA5+tWhMcgW4JnOMEpmtlaxhBRj
         hbtlv8k9iV6fMcIsfxzeO3VNg4LpBCUSFqawcC/azblq9r+t8MYMnNzSEl21d52XE8hb
         kMst3jFoocBfbJXd4uyb9qa7t9qUB8cHL3yoGyfb/r5egn8zixHhK0iOpknUSVcZENXJ
         1PRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QMUv2ojLbgkbNjy8R8PZ7qLfqmfzFtBoqOYdedJ2bnc=;
        b=Q1XHLJLvfH+bl5GVuBqUo80KHnX6Z6pYVpyd1X5vaOusotGHaOzx59QBkp1zDQeZTB
         enWWeELzjwqSyDDQmjdGjxldtFb6NVnXAW9POJB3t8V9D/9n+2tnbJWvEQo3XBkjnEpI
         smm1j0QlyK7cPzoEQdm0EHgMAA7AnLoV4iUDjtvm9IQhi1vFedbIHn3T2+Pa2/neZ+ja
         6A2qeo7z6IWiWcAoSbfm2YCs6dJTlDYWxzR30vx396EuGhRY1L29o2VWaJHc7gAySQ8K
         wszmvsE3xM+J5Evd8FFgQEvKRu0ZrsLLKTyY6bH8+ys8I7SfXaHL/kErqg71CUQDkC3b
         Grcw==
X-Gm-Message-State: AOAM5310+GdIbgV19FSr/uYbRC2XvVT3dhepdbApYuuCe3UOvHeLEwao
        8bMOYVkPrplplTVSFVxxB3udn8Y+ftUlppsIHdU=
X-Google-Smtp-Source: ABdhPJwCxyo6Mgcjt5sLnCUPzfgXDk/Kc5vQQlt5qmzrN5MSfk1K996vJuD0IfhXu1dXRkSk7c+J/+d30wt1+CIDrXI=
X-Received: by 2002:a25:3355:: with SMTP id z82mr3233231ybz.445.1596616370390;
 Wed, 05 Aug 2020 01:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596465107-14251-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200804081801.GD13316@paasikivi.fi.intel.com>
In-Reply-To: <20200804081801.GD13316@paasikivi.fi.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 5 Aug 2020 09:32:24 +0100
Message-ID: <CA+V-a8vk2=TJ3y2o56jZ-8gGXQy_aRu_TeraU0iCyisFdweEPg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: i2c: ov5640: Fallback to parallel mode
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Hi Sakari,

Thank you for the review.

On Tue, Aug 4, 2020 at 9:18 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> On Mon, Aug 03, 2020 at 03:31:47PM +0100, Lad Prabhakar wrote:
> > Fallback to parallel mode if bus_type doesn't match the supported
> > interfaces by the driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 08c67250042f..4e88b0540740 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -3074,6 +3074,12 @@ static int ov5640_probe(struct i2c_client *client)
> >               return ret;
> >       }
> >
> > +     /* fallback to parallel mode */
> > +     if (sensor->ep.bus_type != V4L2_MBUS_PARALLEL &&
> > +         sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY &&
> > +         sensor->ep.bus_type != V4L2_MBUS_BT656)
> > +             sensor->ep.bus_type = V4L2_MBUS_PARALLEL;
>
> You basically need the type from the v4l2_fwnode_endpoint_parse(), and if
> you don't have any of the above bus types, probe should fail. The old
> bindings were documented in a way that either parallel or CSI-2 bus will be
> used, and there were no defaults. So all should be well.
>
The bus_type is coming from v4l2_fwnode_endpoint_parse(), I'll add the
check to fail if type doesn't match the supported interfaces and drop
the above check.

Cheers,
Prabhakar

> --
> Sakari Ailus
