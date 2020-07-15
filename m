Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA02220A19
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 12:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731171AbgGOKgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 06:36:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:36943 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728781AbgGOKgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 06:36:11 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4A288C0011;
        Wed, 15 Jul 2020 10:36:05 +0000 (UTC)
Date:   Wed, 15 Jul 2020 12:39:39 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dongchun.zhu@mediatek.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        roman.kovalivskyi@globallogic.com,
        Luis de Oliveira <Luis.Oliveira@synopsys.com>
Subject: Re: [PATCH v2 3/3] media: MAINTAINERS: ov5647: Add myself as
 maintainer
Message-ID: <20200715103939.rh7hhpqp4xi73av6@uno.localdomain>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
 <20200714142856.58365-4-jacopo+renesas@jmondi.org>
 <CAMuHMdV64srQaDcAPwjA_QR6v_FOykgQpxgdT-srRk1r7NQiGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdV64srQaDcAPwjA_QR6v_FOykgQpxgdT-srRk1r7NQiGQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert

On Wed, Jul 15, 2020 at 12:26:49PM +0200, Geert Uytterhoeven wrote:
> CC Luis' last used address
>
> On Tue, Jul 14, 2020 at 4:25 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> >
> > Since the current maintainer email address bounces back, replace
> > the entry and make myself maintainer of the driver since I have the
> > sensor and platforms to test it.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1742fa1a88cd..e2128afd83b6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12607,7 +12607,7 @@ T:      git git://linuxtv.org/media_tree.git
> >  F:     drivers/media/i2c/ov5640.c
> >
> >  OMNIVISION OV5647 SENSOR DRIVER
> > -M:     Luis Oliveira <lolivei@synopsys.com>
> > +M:     Jacopo Mondi <jacopo@jmondi.org>
> >  L:     linux-media@vger.kernel.org
> >  S:     Maintained
> >  T:     git git://linuxtv.org/media_tree.git

Oh thanks!

I would be happy if Luis would like to keep maintaing the driver and
just update his address in that case. I however volounteer to help here,
so please keep my address here as well.

Thanks
  j

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
