Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4380966BC27
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 11:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjAPKt1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 05:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjAPKtY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 05:49:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B187D1714B;
        Mon, 16 Jan 2023 02:49:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBE04802;
        Mon, 16 Jan 2023 11:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673866161;
        bh=QPKbaBg15FIAAfwmoECrnTKED2vhulpywKn1lrKXHwQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rsA5uz9qrZPSpxqp6TK4pQviMeiZZ0RpR5R1xNmbXmObdIByNf0plUQnAoTpzwGNj
         PSQE1Fh0fK1GjZ0oR+CAEnITmGOsbwrgs//zvN3ENei9t61JeVVqe5LDRgR0Lhi2q6
         4Gf4QXelvSnd430RTAICZbhE6AiPNRTrr/9NhjDY=
Date:   Mon, 16 Jan 2023 12:49:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
Subject: Re: [PATCH v3 5/6] ARM: dts: renesas: Use new media bus type macros
Message-ID: <Y8UrsSnhGd7GQEIJ@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
 <Y8LJkPLghb/8Y+iQ@pendragon.ideasonboard.com>
 <CAMuHMdXnssq_tGbg+vL7BuLK5sa4Lg1xx0106uMFthRfUoq7=Q@mail.gmail.com>
 <Y8UpDsTixfacduXl@pendragon.ideasonboard.com>
 <CAMuHMdVHnJ2Q1CCDUiTUPcESp2cExu6BynoscTGOiD6UA1u7_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVHnJ2Q1CCDUiTUPcESp2cExu6BynoscTGOiD6UA1u7_w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 16, 2023 at 11:44:13AM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 16, 2023 at 11:38 AM Laurent Pinchart wrote:
> > On Mon, Jan 16, 2023 at 11:24:10AM +0100, Geert Uytterhoeven wrote:
> > > On Sat, Jan 14, 2023 at 4:26 PM Laurent Pinchart wrote:
> > > > Geert, could you please take this in your tree for v6.3 ? The two
> > > > patches that the DT changes depend on have been merged in v6.2.
> > >
> > > Thank you, I had missed these.
> > >
> > > > On Thu, Jun 16, 2022 at 01:14:09AM +0300, Laurent Pinchart wrote:
> > > > > Now that a header exists with macros for the media interface bus-type
> > > > > values, replace hardcoding numerical constants with the corresponding
> > > > > macros in the DT sources.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > ---
> > > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
> > > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
> > > > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
> > > > >  3 files changed, 13 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > index 4e58c54cde17..33ac4bd1e63b 100644
> > > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > > > @@ -7,6 +7,9 @@
> > > > >   */
> > > > >
> > > > >  /dts-v1/;
> > > > > +
> > > > > +#include <dt-bindings/media/video-interfaces.h>
> > > > > +
> > > > >  #include "r8a7742-iwg21d-q7.dts"
> > > > >
> > > > >  / {
> > > > > @@ -242,7 +245,7 @@ port {
> > > > >               vin0ep: endpoint {
> > > > >                       remote-endpoint = <&cam0ep>;
> > > > >                       bus-width = <8>;
> > > > > -                     bus-type = <6>;
> > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > >               };
> > > > >       };
> > > > >  };
> > > > > @@ -273,7 +276,7 @@ port {
> > > > >               vin1ep: endpoint {
> > > > >                       remote-endpoint = <&cam1ep>;
> > > > >                       bus-width = <8>;
> > > > > -                     bus-type = <6>;
> > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > >               };
> > > > >       };
> > > > >  };
> > > > > @@ -305,7 +308,7 @@ vin2ep: endpoint {
> > > > >                       remote-endpoint = <&cam2ep>;
> > > > >                       bus-width = <8>;
> > > > >                       data-shift = <8>;
> > > > > -                     bus-type = <6>;
> > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > >               };
> > > > >       };
> > > > >  };
> > > > > @@ -335,7 +338,7 @@ port {
> > > > >               vin3ep: endpoint {
> > > > >                       remote-endpoint = <&cam3ep>;
> > > > >                       bus-width = <8>;
> > > > > -                     bus-type = <6>;
> > > > > +                     bus-type = <MEDIA_BUS_TYPE_BT656>;
> > > > >               };
> > > > >       };
> > > > >  };
> > > > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > index 40cef0b1d1e6..c73160df619d 100644
> > > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > > > @@ -7,6 +7,8 @@
> > > > >   * Copyright (C) 2020 Renesas Electronics Corp.
> > > > >   */
> > > > >
> > > > > +#include <dt-bindings/media/video-interfaces.h>
> > >
> > > This .dtsi file is only intended to be included by
> > > arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts, which already has
> > > the include.  Hence if you don't mind, I would like to drop this part
> > > while applying  and queuing in renesas-devel for v6.3.
> >
> > Isn't it better to include headers as needed to avoid depending on
> > indirect includes ?
> 
> In general, I agree.
> In this particular case, (the multiple inclusions of) the
> r8a7742-iwg21d-q7-dbcm-ov*-single.dtsi files are tied very intimately
> to r8a7742-iwg21d-q7-dbcm-ca.dts.

I'd still prefer keeping the #include here, but you're the maintainer
:-)

-- 
Regards,

Laurent Pinchart
