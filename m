Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC6F26AC5B
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 20:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbgIOSnn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 14:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbgIORfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 13:35:42 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245E4C06178C;
        Tue, 15 Sep 2020 10:35:41 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id x8so3268717ybm.3;
        Tue, 15 Sep 2020 10:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e4l4Gu0YubhtqyPTz0YqYdvl2UWuebWDaX1GoYBvuVY=;
        b=s3991qMFgKnJiHGMLkgRXGTVIosBIKMjKgP2cApUduRofJ2fLM80m236qLv4aII3Qg
         nt3r80JgJFw/Cfmz5k0yoOezjdFlRp8NFi+wga93eDohqg6N96jAC/ioY13TDGSZL8Lu
         gBuIEdXLF47KgKzhd8RxiWmSEPP3NfmPFVpmrYZDG4G7FJFwkVSOcUlw6EDpWCrBItPP
         Iwr9O7oST/QnIovk7OsO93BYtGQyDKDgbirPFoP7kZ8nC1fgoXp0VE6MB1O0R5aOJLOc
         HrildwovvGW+5ewT5crQ0gOnZTL0RhEFCnTzJRqgZtvue9pF1HkT23XvOsAMOdri18s9
         tvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e4l4Gu0YubhtqyPTz0YqYdvl2UWuebWDaX1GoYBvuVY=;
        b=U0jLyLwx4gp/+eaJI8BWSDNLKpmVhrAycvJldiSLOzrYbSxBpo4adGAOb2fZoL5JU8
         cRiDABJ56azYPUVac/4keR6XtAIQ8wIIMuPe5V+Rrtdo/pGzyk6a6YBCNjwlK/k45fTr
         iUa3PagrcbsQtOVp4wJaPdY2TTFSXwUlF+xHNcEsN8qMpAbZx1Vf/G7s0tC60qaNpIzE
         fC6fNHt4RTgrfhOp3XsGucifxe7FyY6fNh5R+iDKWe0NKeDX7JHT/GZYF4knRqcZ1lQH
         2PFWh20L3b/iCTMmgW1m2Rzx1ydTx2HJJOampzpm0j+I1zGTe/Q6jqkEjcXmuaCGo4o9
         TA5Q==
X-Gm-Message-State: AOAM53114kq/si6ZjzZK89LPjUe6vBx3XhdKpj8F8cFrr1o9WN9kdvII
        7ON8cnrnKaVo6z4cvY+parhymx0yTt4rXAZuXaw=
X-Google-Smtp-Source: ABdhPJw6tpYaholT5KV37O0sqp4OEp1G/6u0Q0dc8JfRBlBz9hnumE7BZjDkKrSySZWR+nxT2MMvT9pMN17IM/pobok=
X-Received: by 2002:a25:6f89:: with SMTP id k131mr18040987ybc.214.1600191340100;
 Tue, 15 Sep 2020 10:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200915155544.826-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <TYBPR01MB5309602C74A7AA57B6FB6AF886200@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5309602C74A7AA57B6FB6AF886200@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 15 Sep 2020 18:35:13 +0100
Message-ID: <CA+V-a8s5xZnMexZzrGwb-Y9uyJPWSLcUHE_7KAOE_q4j5XWGVw@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-fwnode: Return -EINVAL for invalid bus-type
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

Thank you for the review.

On Tue, Sep 15, 2020 at 5:01 PM Biju Das <biju.das.jz@bp.renesas.com> wrote=
:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > Subject: [PATCH] media: v4l2-fwnode: Return -EINVAL for invalid bus-typ=
e
> >
> > With the current implementation if invalid bus-type is passed via DT
> > v4l2_fwnode_endpoint_parse() defaulted the mus-type to
>
> Typo mus-type??
>
> > V4L2_MBUS_PARALLEL instead of returning error.
> >
> > This Patch adds V4L2_MBUS_INVALID entry to v4l2_mbus_type enum and
>
> This patch ??
>
Argh my bad, will fix that and post a v2.

Cheers,
Prabhakar

> > when invalid bus-type is detected in v4l2_fwnode_endpoint_parse() it
> > returns -EINVAL to the caller.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 6 +++++-
> >  include/media/v4l2-mediabus.h         | 2 ++
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2=
-
> > core/v4l2-fwnode.c
> > index a4c3c77c1894..a6f3549eadd3 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -93,7 +93,7 @@ v4l2_fwnode_bus_type_to_mbus(enum
> > v4l2_fwnode_bus_type type)
> >  const struct v4l2_fwnode_bus_conv *conv =3D
> >  get_v4l2_fwnode_bus_conv_by_fwnode_bus(type);
> >
> > -return conv ? conv->mbus_type : V4L2_MBUS_UNKNOWN;
> > +return conv ? conv->mbus_type : V4L2_MBUS_INVALID;
> >  }
> >
> >  static const char *
> > @@ -436,6 +436,10 @@ static int __v4l2_fwnode_endpoint_parse(struct
> > fwnode_handle *fwnode,
> >   v4l2_fwnode_mbus_type_to_string(vep->bus_type),
> >   vep->bus_type);
> >  mbus_type =3D v4l2_fwnode_bus_type_to_mbus(bus_type);
> > +if (mbus_type =3D=3D V4L2_MBUS_INVALID) {
> > +pr_debug("unsupported bus type %u\n", bus_type);
> > +return -EINVAL;
> > +}
> >
> >  if (vep->bus_type !=3D V4L2_MBUS_UNKNOWN) {
> >  if (mbus_type !=3D V4L2_MBUS_UNKNOWN && diff --git
> > a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h index
> > 45f88f0248c4..b4f630783cb7 100644
> > --- a/include/media/v4l2-mediabus.h
> > +++ b/include/media/v4l2-mediabus.h
> > @@ -78,6 +78,7 @@
> >   * @V4L2_MBUS_CCP2:CCP2 (Compact Camera Port 2)
> >   * @V4L2_MBUS_CSI2_DPHY: MIPI CSI-2 serial interface, with D-PHY
> >   * @V4L2_MBUS_CSI2_CPHY: MIPI CSI-2 serial interface, with C-PHY
> > + * @V4L2_MBUS_INVALID:invalid bus type (keep it last for sanity)
> >   */
> >  enum v4l2_mbus_type {
> >  V4L2_MBUS_UNKNOWN,
> > @@ -87,6 +88,7 @@ enum v4l2_mbus_type {
> >  V4L2_MBUS_CCP2,
> >  V4L2_MBUS_CSI2_DPHY,
> >  V4L2_MBUS_CSI2_CPHY,
> > +V4L2_MBUS_INVALID,
> >  };
> >
> >  /**
> > --
> > 2.17.1
>
>
>
> Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jau=
ch, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10=
, 40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseld=
orf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./=
WEEE reg. no.: DE 14978647
