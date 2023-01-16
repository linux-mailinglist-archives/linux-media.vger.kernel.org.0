Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC2F66BCCF
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 12:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjAPLYP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 06:24:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjAPLYN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 06:24:13 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386CE1DB99;
        Mon, 16 Jan 2023 03:24:12 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id a25so17169593qto.10;
        Mon, 16 Jan 2023 03:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CC4suAhGO9ZHb6FRYObqt22bnmss3lWiFC78zfUA2eM=;
        b=mTOWoxz7ofZIOyrzMCaoJ/HqTKY7yAtpCE1TBBaSG2EtAxdCpJfSHs1ATwFU17i/td
         wLaO8kEAjynVJoSgt6ksTYM/YSCaEcjUQV2kCTdXh88CoSxB/3q0eyfTFHYiziB36UsS
         uHCl8bR2Q37TbCANGzsxmB6DNtsmZexfO+Ef+LzD9o7Wlj+l+JFR4YmDw9x67E15x5Y3
         GcqcNtsn6DwkHdcburUpUP5i0GJnGPAw/oe/a/kaodFXb5qPLFhv1GuJ+MiEaHcte0dg
         37ql1pAM2X7prkxDGBojjhscPLbXs4I4boYrbvsrMoQpuKMXhvoLUVUNnLmZ+4FVUsK/
         I7dA==
X-Gm-Message-State: AFqh2kofp8xWVefulEV9LKX2M9kcjP5u301HQNu+SDSM9aVpH3wY9cwW
        ZpeeS1HbgdJlPI20lh43jLlAiBAxmVxcrA==
X-Google-Smtp-Source: AMrXdXvdKCW1wbPSwJTc7wusNhZ1ifzOTrnmMSqaWrNlKe61nAkhdk1ACCEtU65usp7hZHjwcY7XkA==
X-Received: by 2002:ac8:5401:0:b0:39c:da20:616 with SMTP id b1-20020ac85401000000b0039cda200616mr30272908qtq.32.1673868251120;
        Mon, 16 Jan 2023 03:24:11 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id he34-20020a05622a602200b00399fe4aac3esm9854772qtb.50.2023.01.16.03.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:24:10 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-4a2f8ad29d5so375866657b3.8;
        Mon, 16 Jan 2023 03:24:09 -0800 (PST)
X-Received: by 2002:a81:578e:0:b0:4d9:3858:392 with SMTP id
 l136-20020a81578e000000b004d938580392mr1318541ywb.502.1673868249495; Mon, 16
 Jan 2023 03:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
 <Y8LJkPLghb/8Y+iQ@pendragon.ideasonboard.com> <CAMuHMdXnssq_tGbg+vL7BuLK5sa4Lg1xx0106uMFthRfUoq7=Q@mail.gmail.com>
 <Y8UpDsTixfacduXl@pendragon.ideasonboard.com> <CAMuHMdVHnJ2Q1CCDUiTUPcESp2cExu6BynoscTGOiD6UA1u7_w@mail.gmail.com>
 <Y8UrsSnhGd7GQEIJ@pendragon.ideasonboard.com>
In-Reply-To: <Y8UrsSnhGd7GQEIJ@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 12:23:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYDS7+tRB-Brva4AjuKD6Z6eyoe3fB3wQCeK3p1GpHKw@mail.gmail.com>
Message-ID: <CAMuHMdUYDS7+tRB-Brva4AjuKD6Z6eyoe3fB3wQCeK3p1GpHKw@mail.gmail.com>
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

On Mon, Jan 16, 2023 at 11:49 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 16, 2023 at 11:44:13AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 16, 2023 at 11:38 AM Laurent Pinchart wrote:
> > > On Mon, Jan 16, 2023 at 11:24:10AM +0100, Geert Uytterhoeven wrote:
> > > > On Sat, Jan 14, 2023 at 4:26 PM Laurent Pinchart wrote:
> > > > > Geert, could you please take this in your tree for v6.3 ? The two
> > > > > patches that the DT changes depend on have been merged in v6.2.
> > > >
> > > > Thank you, I had missed these.
> > > >
> > > > > On Thu, Jun 16, 2022 at 01:14:09AM +0300, Laurent Pinchart wrote:
> > > > > > Now that a header exists with macros for the media interface bus-type
> > > > > > values, replace hardcoding numerical constants with the corresponding
> > > > > > macros in the DT sources.
> > > > > >
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > > > ---
> > > > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
> > > > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
> > > > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
> > > > > >  3 files changed, 13 insertions(+), 6 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > > index 4e58c54cde17..33ac4bd1e63b 100644
> > > > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > > @@ -7,6 +7,9 @@
> > > > > >   */
> > > > > >
> > > > > >  /dts-v1/;
> > > > > > +
> > > > > > +#include <dt-bindings/media/video-interfaces.h>
> > > > > > +
> > > > > >  #include "r8a7742-iwg21d-q7.dts"
> > > > > >
> > > > > >  / {
> > > > > > @@ -242,7 +245,7 @@ port {
> > > > > >               vin0ep: endpoint {
> > > > > >                       remote-endpoint = <&cam0ep>;
> > > > > >                       bus-width = <8>;
> > > > > > -                     bus-type = <6>;
> > > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > > >               };
> > > > > >       };
> > > > > >  };
> > > > > > @@ -273,7 +276,7 @@ port {
> > > > > >               vin1ep: endpoint {
> > > > > >                       remote-endpoint = <&cam1ep>;
> > > > > >                       bus-width = <8>;
> > > > > > -                     bus-type = <6>;
> > > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > > >               };
> > > > > >       };
> > > > > >  };
> > > > > > @@ -305,7 +308,7 @@ vin2ep: endpoint {
> > > > > >                       remote-endpoint = <&cam2ep>;
> > > > > >                       bus-width = <8>;
> > > > > >                       data-shift = <8>;
> > > > > > -                     bus-type = <6>;
> > > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > > >               };
> > > > > >       };
> > > > > >  };
> > > > > > @@ -335,7 +338,7 @@ port {
> > > > > >               vin3ep: endpoint {
> > > > > >                       remote-endpoint = <&cam3ep>;
> > > > > >                       bus-width = <8>;
> > > > > > -                     bus-type = <6>;
> > > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > > >               };
> > > > > >       };
> > > > > >  };
> > > > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > > index 40cef0b1d1e6..c73160df619d 100644
> > > > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > > @@ -7,6 +7,8 @@
> > > > > >   * Copyright (C) 2020 Renesas Electronics Corp.
> > > > > >   */
> > > > > >
> > > > > > +#include <dt-bindings/media/video-interfaces.h>
> > > >
> > > > This .dtsi file is only intended to be included by
> > > > arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts, which already has
> > > > the include.  Hence if you don't mind, I would like to drop this part
> > > > while applying  and queuing in renesas-devel for v6.3.
> > >
> > > Isn't it better to include headers as needed to avoid depending on
> > > indirect includes ?
> >
> > In general, I agree.
> > In this particular case, (the multiple inclusions of) the
> > r8a7742-iwg21d-q7-dbcm-ov*-single.dtsi files are tied very intimately
> > to r8a7742-iwg21d-q7-dbcm-ca.dts.
>
> I'd still prefer keeping the #include here, but you're the maintainer
> :-)

OK, will keep them.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
