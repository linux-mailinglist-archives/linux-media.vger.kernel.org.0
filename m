Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E883C494B93
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 11:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359826AbiATKYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 05:24:13 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54815 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232937AbiATKYJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 05:24:09 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id BA5FFC0008;
        Thu, 20 Jan 2022 10:24:05 +0000 (UTC)
Date:   Thu, 20 Jan 2022 11:25:09 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 4/7] arm64: dts: renesas: condor: Enable MAX9286
Message-ID: <20220120102509.csdcauug6sipnk3m@uno.localdomain>
References: <20211216163439.139579-1-jacopo+renesas@jmondi.org>
 <20211216163439.139579-5-jacopo+renesas@jmondi.org>
 <CAMuHMdXyXwDiTpLACKdyoimtia3KS8A94qD-Ryi=r=6pj79D1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXyXwDiTpLACKdyoimtia3KS8A94qD-Ryi=r=6pj79D1A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert, Kieran,

On Thu, Jan 20, 2022 at 10:14:34AM +0100, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Thu, Dec 16, 2021 at 5:34 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Enable the MAX9286 GMSL deserializers on Condor-V3H board.
> >
> > Connected cameras should be defined in a device-tree overlay or included
> > after these definitions.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> > @@ -6,6 +6,8 @@
> >   * Copyright (C) 2018 Cogent Embedded, Inc.
> >   */
> >
> > +#include <dt-bindings/gpio/gpio.h>
>
> Already included below.
>
> > +
> >  /dts-v1/;
> >  #include "r8a77980.dtsi"
> >  #include <dt-bindings/gpio/gpio.h>
>
> I can fix that while applying, but I'm interested in hearing the answer
> to Kieran's question first.

I can confirm that without including "gmsl-cameras.dtsi" no media
graph is registered. This is expected as the VINs and GSML device
nodes are enabled in the .dtsi only

        #ifdef GMSL_0
        &vin0 {
                status = "okay";
        };

        &vin1 {
                status = "okay";
        };

        &vin2 {
                status = "okay";
        };

        &vin3 {
                status = "okay";
        };

        &gmsl0 {
                status = "okay";
               ...

I think that's the expected behavior, isn't it ?

Thanks
   j




>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
