Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2060D36508
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 22:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfFEUAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 16:00:32 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:38191 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfFEUAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 16:00:31 -0400
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EA63FC0006;
        Wed,  5 Jun 2019 20:00:21 +0000 (UTC)
Date:   Wed, 5 Jun 2019 22:00:20 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH v4 04/13] media: rc: sunxi: Add RXSTA bits definition
Message-ID: <20190605200020.tmyom3lg3inu6vvf@flea>
References: <20190604162959.29199-1-peron.clem@gmail.com>
 <20190604162959.29199-5-peron.clem@gmail.com>
 <20190605095141.psrq6mhk63zto77s@flea>
 <CAJiuCceZa=WEiF8_LK+jDdiXOn1i8+z8Smr6YKCpo9_XftgueQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJiuCceZa=WEiF8_LK+jDdiXOn1i8+z8Smr6YKCpo9_XftgueQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 05, 2019 at 02:44:06PM +0200, Clément Péron wrote:
> Hi Maxime,
>
> On Wed, 5 Jun 2019 at 11:51, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Tue, Jun 04, 2019 at 06:29:50PM +0200, Clément Péron wrote:
> > > We are using RXINT bits definition when looking at RXSTA register.
> > >
> > > These bits are equal but it's not really proper.
> > >
> > > Introduce the RXSTA bits and use them to have coherency.
> > >
> > > Signed-off-by: Clément Péron <peron.clem@gmail.com>
> > > ---
> > >  drivers/media/rc/sunxi-cir.c | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> > > index 0504ebfc831f..572bd2257d35 100644
> > > --- a/drivers/media/rc/sunxi-cir.c
> > > +++ b/drivers/media/rc/sunxi-cir.c
> > > @@ -48,11 +48,11 @@
> > >
> > >  /* Rx Interrupt Enable */
> > >  #define SUNXI_IR_RXINT_REG    0x2C
> > > -/* Rx FIFO Overflow */
> > > +/* Rx FIFO Overflow Interrupt Enable */
> > >  #define REG_RXINT_ROI_EN             BIT(0)
> > > -/* Rx Packet End */
> > > +/* Rx Packet End Interrupt Enable */
> > >  #define REG_RXINT_RPEI_EN            BIT(1)
> > > -/* Rx FIFO Data Available */
> > > +/* Rx FIFO Data Available Interrupt Enable */
> > >  #define REG_RXINT_RAI_EN             BIT(4)
> > >
> > >  /* Rx FIFO available byte level */
> > > @@ -60,6 +60,12 @@
> > >
> > >  /* Rx Interrupt Status */
> > >  #define SUNXI_IR_RXSTA_REG    0x30
> > > +/* Rx FIFO Overflow */
> > > +#define REG_RXSTA_ROI                        BIT(0)
> > > +/* Rx Packet End */
> > > +#define REG_RXSTA_RPE                        BIT(1)
> > > +/* Rx FIFO Data Available */
> > > +#define REG_RXSTA_RA                 BIT(4)
> >
> > I'm fine with it on principle, but if the consistency needs to be
> > maintained then we could just reuse the above defines
>
> There is no comment why we can reuse them, they can also be some wrong
> case for example the RXINT_DRQ_EN bit is not present in RXSTA and same
> for STAT bit present in RXSTA and not present in RXINT.
>
> I have discover and read this code a month ago and this logic is
> really not obvious nor explain.
>
> Maybe this hack could be done when we will introduce a quirks, but for
> the moment I really think that it's more proper and readable to
> introduce them properly.

I don't think we understood each other :)

I was talking about having something like

#define REG_RXSTA_ROI  REG_RXINT_ROI_EN

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
