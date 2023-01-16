Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED70766BBA5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 11:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjAPKY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 05:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjAPKYZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 05:24:25 -0500
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A5B18AAC;
        Mon, 16 Jan 2023 02:24:24 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id j9so19338681qvt.0;
        Mon, 16 Jan 2023 02:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYdsinSzk5zIWgJ0I9pYyCEIzflLz/cd6reL0ZUmYS0=;
        b=aphUmd7rA1ttcxJaS7k3Nsi5UXORpAhDPw5rblLPcXxlOqdf64PNbLrF5n38+wwMra
         gE+rSiy8rAwyN/0yeA7fSNVly/seZM4lpMP0OOHFIfb5drs+KomLVIXy/1RZ7T3X4miJ
         36B2alIANu9pa08zSDTljFcE+5To2ig1NQBai1CiiTLtDjJMgIY5Tc+anSjSkPH6ZU7m
         miKZX15WDfye+Ocxk0O0qgPlGnBzxnF4UseM1eORKc4P3n5pHIwAtt/h62H3lVp/ypfv
         zrDOZS7pso1RafIXugfdnrZcuuKh9E4EU60hRnaq9aEu0ETelgm/Bzsbnjt7JwHFuL3g
         yZSg==
X-Gm-Message-State: AFqh2kpMCzN6gVMcEiyC/h9BbWAyc3WloEC5xlE6n4G+8+BuHEgPe2tb
        Q6g7YopjfXpXRsfAi8n9PNtzmamC+cbIzw==
X-Google-Smtp-Source: AMrXdXuNbiQHhi34DVMknzaovkf2YkILkCPT3pV6qiWmHncImqbfbkgl3FEkunn4BzFXRFJvbUhefA==
X-Received: by 2002:a05:6214:4384:b0:534:97bb:af73 with SMTP id oh4-20020a056214438400b0053497bbaf73mr13990463qvb.4.1673864662996;
        Mon, 16 Jan 2023 02:24:22 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a0c4600b007054feab4aesm17817367qki.27.2023.01.16.02.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:24:22 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-4e9adf3673aso38221787b3.10;
        Mon, 16 Jan 2023 02:24:21 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr4742811ywb.47.1673864661520; Mon, 16
 Jan 2023 02:24:21 -0800 (PST)
MIME-Version: 1.0
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-6-laurent.pinchart@ideasonboard.com> <Y8LJkPLghb/8Y+iQ@pendragon.ideasonboard.com>
In-Reply-To: <Y8LJkPLghb/8Y+iQ@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 11:24:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnssq_tGbg+vL7BuLK5sa4Lg1xx0106uMFthRfUoq7=Q@mail.gmail.com>
Message-ID: <CAMuHMdXnssq_tGbg+vL7BuLK5sa4Lg1xx0106uMFthRfUoq7=Q@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

CC linux-renesas-soc

On Sat, Jan 14, 2023 at 4:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Geert, could you please take this in your tree for v6.3 ? The two
> patches that the DT changes depend on have been merged in v6.2.

Thank you, I had missed these.

> On Thu, Jun 16, 2022 at 01:14:09AM +0300, Laurent Pinchart wrote:
> > Now that a header exists with macros for the media interface bus-type
> > values, replace hardcoding numerical constants with the corresponding
> > macros in the DT sources.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > ---
> >  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
> >  .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
> >  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
> >  3 files changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > index 4e58c54cde17..33ac4bd1e63b 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > @@ -7,6 +7,9 @@
> >   */
> >
> >  /dts-v1/;
> > +
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> >  #include "r8a7742-iwg21d-q7.dts"
> >
> >  / {
> > @@ -242,7 +245,7 @@ port {
> >               vin0ep: endpoint {
> >                       remote-endpoint = <&cam0ep>;
> >                       bus-width = <8>;
> > -                     bus-type = <6>;
> > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> >               };
> >       };
> >  };
> > @@ -273,7 +276,7 @@ port {
> >               vin1ep: endpoint {
> >                       remote-endpoint = <&cam1ep>;
> >                       bus-width = <8>;
> > -                     bus-type = <6>;
> > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> >               };
> >       };
> >  };
> > @@ -305,7 +308,7 @@ vin2ep: endpoint {
> >                       remote-endpoint = <&cam2ep>;
> >                       bus-width = <8>;
> >                       data-shift = <8>;
> > -                     bus-type = <6>;
> > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> >               };
> >       };
> >  };
> > @@ -335,7 +338,7 @@ port {
> >               vin3ep: endpoint {
> >                       remote-endpoint = <&cam3ep>;
> >                       bus-width = <8>;
> > -                     bus-type = <6>;
> > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> >               };
> >       };
> >  };
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > index 40cef0b1d1e6..c73160df619d 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > @@ -7,6 +7,8 @@
> >   * Copyright (C) 2020 Renesas Electronics Corp.
> >   */
> >
> > +#include <dt-bindings/media/video-interfaces.h>

This .dtsi file is only intended to be included by
arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts, which already has
the include.  Hence if you don't mind, I would like to drop this part
while applying  and queuing in renesas-devel for v6.3.

> > +
> >  #define CAM_ENABLED  1
> >
> >  &CAM_PARENT_I2C {
> > @@ -26,7 +28,7 @@ port {
> >                       CAM_EP: endpoint {
> >                               bus-width = <8>;
> >                               data-shift = <2>;
> > -                             bus-type = <6>;
> > +                             bus-type = <MEDIA_BUS_TYPE_BT656>;
> >                               pclk-sample = <1>;
> >                               remote-endpoint = <&VIN_EP>;
> >                       };
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
> > index f5e77f024251..a7f5cfec64b8 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
> > @@ -7,6 +7,8 @@
> >   * Copyright (C) 2020 Renesas Electronics Corp.
> >   */
> >
> > +#include <dt-bindings/media/video-interfaces.h>

Likewise

> > +
> >  #define CAM_ENABLED  1
> >
> >  &CAM_PARENT_I2C {
> > @@ -21,7 +23,7 @@ ov7725@21 {
> >               port {
> >                       CAM_EP: endpoint {
> >                               bus-width = <8>;
> > -                             bus-type = <6>;
> > +                             bus-type = <MEDIA_BUS_TYPE_BT656>;
> >                               remote-endpoint = <&VIN_EP>;
> >                       };
> >               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
