Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785D2235135
	for <lists+linux-media@lfdr.de>; Sat,  1 Aug 2020 10:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgHAIqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Aug 2020 04:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgHAIqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Aug 2020 04:46:49 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9A7C06174A;
        Sat,  1 Aug 2020 01:46:48 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id e6so8680170oii.4;
        Sat, 01 Aug 2020 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LvnyGVeUjGWadk3ZVAQoTtKApflkP6KKdC8V+79XjCY=;
        b=kzByH5RMmkN5dX4SEqlgMoU7EF/8BAHSOtEYgk9ifU1g0sLAr/jKU4t4gHZ3j7CzA0
         bsECy82RqHDDp3MMESymvIwu5zB5xeT2Fiu/eLIz0zxZeT1dvO1kiRkm1l/tNOiEzTuZ
         iBnj1H9GSAm88xfej1E+D6zwrfQCWADN7Yhd22BXbrEx0QqCBW3krgOqo0uPZDDsHBbs
         tbpe/lKu6SUW9iczPSjO35JYQ9QVI4HR1hhAnBN8TitRbUwXfR3uWUMsQoiUPMLfagfQ
         7od5J4wyrniEd6q6tuwudT+o2kZEgyMvVVx4yfYOEPoQcz3/eucW4wfCtlSrOShMJ7Ib
         b3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LvnyGVeUjGWadk3ZVAQoTtKApflkP6KKdC8V+79XjCY=;
        b=VzDwP+65fTjvlYda4s6mdZJyKxtS3IN5U5I016hbkKHoi1j+mvSXCkOV3qmduAu/64
         iuUvNwXUZGNzX0nkerem0G30CMojT9WPdAQQtCLxOmFJTwsP5vy9bQSmsaZk+OG7HuVi
         fBaA7YlGpGfQJehPHW4p7dWDGUJ3d+d0a7N3bkposACyVo/90xo9IhF16F7MOAvInuTX
         MQd/POz3Un5/gxmguF/f6WMowCjxMmSf8gDHLY26AECHIvaIMPEbLsCj5MMOtZLATn4o
         JBJNRAkXyK+hd92h7AijiTkYZ4sd/ALrpPjjOEnEtevLb3Vix/TbCdJjxHuKFiIceP8S
         2Ydg==
X-Gm-Message-State: AOAM5313XUbL6xfdy/Ym6wB2Oogg0zuirgYxhN8HYgGJhg6DimC2UZ2t
        uD/g6NvNf/cHep1dDJiOCWHypwU53QEVP8li7FboQ60z
X-Google-Smtp-Source: ABdhPJzKpBZtVaWtDYhPgwHQGlWVLrMoha27btXi1GiLikwDXEV47A4q+KhahgHhqxG3hiBXzn3IUR7C0nwucJIq6b4=
X-Received: by 2002:aca:b7d5:: with SMTP id h204mr5872694oif.62.1596271608362;
 Sat, 01 Aug 2020 01:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <1596187487-31403-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596187487-31403-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200731152744.GI6218@pendragon.ideasonboard.com>
In-Reply-To: <20200731152744.GI6218@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 1 Aug 2020 09:46:22 +0100
Message-ID: <CA+V-a8tOMWKAmJU3sGJn6ieLN3FAQQvpVXwd0h0AFHVFGzZ+xg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: ov5640: Enable data pins on startup for
 DVP mode
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the review.

On Fri, Jul 31, 2020 at 4:27 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Jul 31, 2020 at 10:24:46AM +0100, Lad Prabhakar wrote:
<snip>
> > +                      * - 6:         VSYNC output enable
> > +                      * - 5:         HREF output enable
> > +                      * - 4:         PCLK output enable
> > +                      * - [3:0]:     D[9:6] output enable
> > +                      */
> > +                     ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
> > +                     if (ret)
> > +                             goto power_off;
> >
> > -             /* Give lanes some time to coax into LP11 state. */
> > -             usleep_range(500, 1000);
> > +                     /*
> > +                      * enable D[5:0] DVP data lines
> > +                      *
> > +                      * PAD OUTPUT ENABLE 02
> > +                      * - [7:2]:     D[5:0] output enable
> > +                      */
> > +                     ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
> > +                     if (ret)
> > +                             goto power_off;
> > +             }
>
> I'd split this to two separate functions, one for CSI-2, one for
> parallel, as this is getting difficult to read.
>
Sure I'll split this up in v2..

Cheers,
Prabhakar

> >
> >       } else {
> >               if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
>
> --
> Regards,
>
> Laurent Pinchart
