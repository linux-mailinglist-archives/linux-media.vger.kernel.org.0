Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D7666BC14
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 11:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjAPKpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 05:45:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbjAPKo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 05:44:56 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F86F1DBBB;
        Mon, 16 Jan 2023 02:44:27 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id x7so14164233qtv.13;
        Mon, 16 Jan 2023 02:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMEZtvQFEJvynFRYn/XTZlOzrmSM7ZI6rZSGm2BSCxc=;
        b=L9KZawnImWbIUNnHg+Rm2CmydlH0sonPCxq2s8U0QHF2yLntsghOT/2xiYKnozSJf+
         MKlK+WbUVxG7UTxI/JLVfmhkQMBLZ0lGl+vk1gH6g/3CzBLLpaEyiiZ6qLIWyeY94DIn
         WgVvVmEtK/+FHxuwsMczSRHWHN3mAob5IMMuJSViO3MkIV4qTuzF7IJUIEZKWb6/iOpa
         2m+8oI2Ky1yR80umrsI+s3koRLiDFFA1nuwjLDkZMLuX3iX5AWRc0MeprpvuGhim1fxr
         vhXV6v2PocnjSC/twDsa2e4SR9azRVwvNZgoGv0FsGAYFzbZYF8NgXGy8RMGBu/w4UGl
         Eq6Q==
X-Gm-Message-State: AFqh2kr28BNeLcvmuoQ8iOB8kZTrMrdTBvVZP0Y/Oku91Wri5SNChWoP
        CqWqRKCQOrbtcbIWB65na4xYyss8HTR+cg==
X-Google-Smtp-Source: AMrXdXvNO31u6+uetfHTnMDr90GrgWrweci6oMBESmyS7ivhwiyWX+LBPMGIGRuJ5UjCoCTmBLPvjQ==
X-Received: by 2002:ac8:7c8f:0:b0:3ab:67d3:8f59 with SMTP id y15-20020ac87c8f000000b003ab67d38f59mr109384731qtv.59.1673865865961;
        Mon, 16 Jan 2023 02:44:25 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id jr49-20020a05622a803100b003ad373d04b6sm11528563qtb.59.2023.01.16.02.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:44:25 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id e130so261009yba.7;
        Mon, 16 Jan 2023 02:44:25 -0800 (PST)
X-Received: by 2002:a25:46c6:0:b0:7b8:a0b8:f7ec with SMTP id
 t189-20020a2546c6000000b007b8a0b8f7ecmr4722674yba.36.1673865864824; Mon, 16
 Jan 2023 02:44:24 -0800 (PST)
MIME-Version: 1.0
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
 <Y8LJkPLghb/8Y+iQ@pendragon.ideasonboard.com> <CAMuHMdXnssq_tGbg+vL7BuLK5sa4Lg1xx0106uMFthRfUoq7=Q@mail.gmail.com>
 <Y8UpDsTixfacduXl@pendragon.ideasonboard.com>
In-Reply-To: <Y8UpDsTixfacduXl@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 11:44:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHnJ2Q1CCDUiTUPcESp2cExu6BynoscTGOiD6UA1u7_w@mail.gmail.com>
Message-ID: <CAMuHMdVHnJ2Q1CCDUiTUPcESp2cExu6BynoscTGOiD6UA1u7_w@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] ARM: dts: renesas: Use new media bus type macros
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Jan 16, 2023 at 11:38 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 16, 2023 at 11:24:10AM +0100, Geert Uytterhoeven wrote:
> > On Sat, Jan 14, 2023 at 4:26 PM Laurent Pinchart wrote:
> > > Geert, could you please take this in your tree for v6.3 ? The two
> > > patches that the DT changes depend on have been merged in v6.2.
> >
> > Thank you, I had missed these.
> >
> > > On Thu, Jun 16, 2022 at 01:14:09AM +0300, Laurent Pinchart wrote:
> > > > Now that a header exists with macros for the media interface bus-type
> > > > values, replace hardcoding numerical constants with the corresponding
> > > > macros in the DT sources.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > > ---
> > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
> > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
> > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
> > > >  3 files changed, 13 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > index 4e58c54cde17..33ac4bd1e63b 100644
> > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > @@ -7,6 +7,9 @@
> > > >   */
> > > >
> > > >  /dts-v1/;
> > > > +
> > > > +#include <dt-bindings/media/video-interfaces.h>
> > > > +
> > > >  #include "r8a7742-iwg21d-q7.dts"
> > > >
> > > >  / {
> > > > @@ -242,7 +245,7 @@ port {
> > > >               vin0ep: endpoint {
> > > >                       remote-endpoint = <&cam0ep>;
> > > >                       bus-width = <8>;
> > > > -                     bus-type = <6>;
> > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > >               };
> > > >       };
> > > >  };
> > > > @@ -273,7 +276,7 @@ port {
> > > >               vin1ep: endpoint {
> > > >                       remote-endpoint = <&cam1ep>;
> > > >                       bus-width = <8>;
> > > > -                     bus-type = <6>;
> > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > >               };
> > > >       };
> > > >  };
> > > > @@ -305,7 +308,7 @@ vin2ep: endpoint {
> > > >                       remote-endpoint = <&cam2ep>;
> > > >                       bus-width = <8>;
> > > >                       data-shift = <8>;
> > > > -                     bus-type = <6>;
> > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > >               };
> > > >       };
> > > >  };
> > > > @@ -335,7 +338,7 @@ port {
> > > >               vin3ep: endpoint {
> > > >                       remote-endpoint = <&cam3ep>;
> > > >                       bus-width = <8>;
> > > > -                     bus-type = <6>;
> > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > >               };
> > > >       };
> > > >  };
> > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > index 40cef0b1d1e6..c73160df619d 100644
> > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > @@ -7,6 +7,8 @@
> > > >   * Copyright (C) 2020 Renesas Electronics Corp.
> > > >   */
> > > >
> > > > +#include <dt-bindings/media/video-interfaces.h>
> >
> > This .dtsi file is only intended to be included by
> > arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts, which already has
> > the include.  Hence if you don't mind, I would like to drop this part
> > while applying  and queuing in renesas-devel for v6.3.
>
> Isn't it better to include headers as needed to avoid depending on
> indirect includes ?

In general, I agree.
In this particular case, (the multiple inclusions of) the
r8a7742-iwg21d-q7-dbcm-ov*-single.dtsi files are tied very intimately
to r8a7742-iwg21d-q7-dbcm-ca.dts.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
