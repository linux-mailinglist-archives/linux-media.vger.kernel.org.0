Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6170523C783
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 10:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgHEIMQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 04:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbgHEIFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 04:05:43 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA56C06174A;
        Wed,  5 Aug 2020 01:05:42 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id a34so18332386ybj.9;
        Wed, 05 Aug 2020 01:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ohHs0aTHt4EN2lAERZatHD3N+Zhcsjq6lSkSQ86OZ7c=;
        b=W2FufXtzNO1DxkIBUAjkRISlynEEA8Flpx9efpdgqFVRD50Fo+SU9567tGy/1b8ofy
         EfDOHsbeLJb3QyN9+REBojrOasH0ogd+U2Ioq6cQYFv7A1kyYIf4CV2aR4FXa4CEzXW6
         ybbk8t/iEG6tIlvmzCxwKkPAUw2cb1eDvg6YdB/GDuRjBzKvfPgM3N2rK2uD7t2daMHh
         FsLvIxuUbJVtCD2m7DY0P2BLTdc2LwCXS8TGzcPxSR678DTw2rg3E6hDZpgOVfhTUmBG
         SE8DsoYHiuebMBRJYTTSD1L9mhKdq+hQS2AwPe8mN006Ow6TnwJ2EfIKdAZmcF4JcHaH
         8fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ohHs0aTHt4EN2lAERZatHD3N+Zhcsjq6lSkSQ86OZ7c=;
        b=fOTHv9qyPzdDY3npc+KsW1cNN9lQfpFYjcacxHdQcjjFo/Q7VmkHgE8u/dVCxD1Xiu
         xHV7sJag61LWERBLyNvE9XPdebxLJy5P1YlmOk9hkJbPX38R2PyYCyXoAN/cDCKkFVSN
         e9uP1WXVec5Zc0v/nrSHlJ32OBwMqxpvLOKKciFqdtXvlYZ+bA5uz6Uytpr7ltHbrZKA
         0mVXct69UwDIylXlJ9E6/qCK6H/tFVJ+ATiFcwQ2m0EiKA+u5APoTq+rNSIBMm86+2vW
         RP5s1qeT0yutDalEM3k3r89KHd6X/ICvSNWsCaI5ClDCJi8+pJcOQWsaA9fyDSXYC7lw
         QERA==
X-Gm-Message-State: AOAM532BPeCQIvjfxwp1/qMpXb8TUd78lWyW6QYbINJc5t2AmwxAqp+H
        T/KCUUDM8oQiAADSXM98r3bU5U+Jgoq8zO+NFK4=
X-Google-Smtp-Source: ABdhPJwaAiO/Es1VEZFBFhn7DvIyi6gk4N3vmj9czx2+RjxA1iF/Hx+bGVEFMkR82jjSBe1kh1+JIaQ+Ibc4oxITckY=
X-Received: by 2002:a25:9186:: with SMTP id w6mr2676030ybl.401.1596614742159;
 Wed, 05 Aug 2020 01:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596465107-14251-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200804081458.GC13316@paasikivi.fi.intel.com>
In-Reply-To: <20200804081458.GC13316@paasikivi.fi.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 5 Aug 2020 09:05:15 +0100
Message-ID: <CA+V-a8sP443vzj5niegZx=UMKKM1ZEy==6PfxYLYxuZAOqwUkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: i2c: ov5640: Document bus-type property
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

On Tue, Aug 4, 2020 at 9:15 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> Thanks for the update.
>
> On Mon, Aug 03, 2020 at 03:31:44PM +0100, Lad Prabhakar wrote:
> > Document the possible bus-type's supported by the OV5640 sensor driver.
> >
> > Also add the bus-type in example node.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ov5640.txt | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.txt b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> > index c97c2f2da12d..00131dbb147e 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> > @@ -36,9 +36,15 @@ Endpoint node required properties for parallel connection are:
> >  - data-shift: shall be set to <2> for 8 bits parallel bus
> >             (lines 9:2 are used) or <0> for 10 bits parallel bus
> >  - hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> > +             (Required for bus-type 5)
> >  - vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> > +             (Required for bus-type 5)
> >  - pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
> > -            signal.
> > +            signal. (Required for bus-type 5)
> > +- bus-type: data bus type. Possible values are:
> > +         4 - MIPI CSI-2 D-PHY
> > +         5 - Parallel
> > +         6 - Bt.656
>
> This is under required parallel properties. You could document value 4
> under CSI-2 related properties.
>
Agreed will do that.

Cheers,
Prabhakar

> >
> >  Examples:
> >
> > @@ -86,6 +92,7 @@ Examples:
> >                               hsync-active = <0>;
> >                               vsync-active = <0>;
> >                               pclk-sample = <1>;
> > +                             bus-type = <5>;
> >                       };
> >               };
> >       };
>
> --
> Regards,
>
> Sakari Ailus
