Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158AD45D7C6
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 10:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343711AbhKYKAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 05:00:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53092 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235766AbhKYJ6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 04:58:44 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCB77881;
        Thu, 25 Nov 2021 10:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637834132;
        bh=lKoWU2JH4HLLdfGlOIfP1PnKbrCcP8F5e1IgrEH2LC0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=H3Iu7guLmm+z6da+Rq0jxT38bDO54zEy+qBLnngYuOPsFDCnMsMnmvP+rUtTFL154
         jtxUiAyDoZ++/xfMDPQF70rQ7ga4G8eCJ+Sk2SUBZ+Sf5vmg9T+uIsO+y/VDXET2iQ
         rsSoR0Zz8xjpZVh4QHbOwp46KDJ5WB1gUb9zqjSw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YZ9MPu1WIJk0MtLr@oden.dyn.berto.se>
References: <20211123155443.3705143-1-niklas.soderlund+renesas@ragnatech.se> <163779391741.3153335.8189408341245810954@Monstersaurus> <YZ9MPu1WIJk0MtLr@oden.dyn.berto.se>
Subject: Re: [PATCH] rcar-vin: Add check for completed capture before completing buffer
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To:     Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Date:   Thu, 25 Nov 2021 09:55:30 +0000
Message-ID: <163783413027.3059017.998619924817672283@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2021-11-25 08:41:34)
> Hi Kieran,
>=20
> Thanks for your feedback.
>=20
> On 2021-11-24 22:45:17 +0000, Kieran Bingham wrote:
> > Quoting Niklas S=C3=B6derlund (2021-11-23 15:54:43)
> > > Before reading which slot was captured to by examining the module sta=
tus
> > > (VnMS) register, make sure something was captured at all by examining
> > > the interrupt status register (VnINTS).
> > >=20
> > > Failing this a buffer maybe completed before it was captured too.
> > >=20
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-dma.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/med=
ia/platform/rcar-vin/rcar-dma.c
> > > index 25ead9333d0046e7..87ccbdc3d11a0f2d 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > @@ -111,6 +111,9 @@
> > >  #define VNIE_FIE               (1 << 4)
> > >  #define VNIE_EFE               (1 << 1)
> > > =20
> > > +/* Video n Interrupt Status Register bits */
> > > +#define VNINTS_FIS             (1 << 4)
> > > +
> > >  /* Video n Data Mode Register bits */
> > >  #define VNDMR_A8BIT(n)         (((n) & 0xff) << 24)
> > >  #define VNDMR_A8BIT_MASK       (0xff << 24)
> > > @@ -1005,6 +1008,10 @@ static irqreturn_t rvin_irq(int irq, void *dat=
a)
> > >         rvin_ack_interrupt(vin);
> > >         handled =3D 1;
> > > =20
> > > +       /* Nothing to do if nothing was captured. */
> > > +       if (!(int_status & VNINTS_FIS))
> >=20
> > Does this deserve a warning or debug print? It sounds like it may be
> > somewhat spurious or unexpected if it occurs?
>=20
> I don't think so. One can enable more interrupts then the ones we do=20
> today, for example during debugging capture issues. This check just make =

> sure we don't try to process a capture if the interrupt is not related=20
> to capture ;-)

Ok, I see. So it shouldn't occur in current code which doesn't enable
other interrupts though.

I think it adds value/protection so is helpful, so

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


If I were doing this though, I'd move the capture specific handling to
it's own function and guard it explicitly for each possible handler:

	if (int_status & VNINTS_FIS)
		rvin_handle_fis(vin);
=09
	if (int_status & VNINTS_FOS)
		rvin_handle_fifo_overflow(vin);
=09
	if (int_status & VNINTS_EFS)
		rvin_handle_frame_end(vin);

Then each interrupt handler is distinct, and does not get processed
when it's interrupt isn't raised.

>=20
> >=20
> > --
> > Kieran
> >=20
> >=20
> > > +               goto done;
> > > +
> > >         /* Nothing to do if capture status is 'STOPPED' */
> > >         if (vin->state =3D=3D STOPPED) {
> > >                 vin_dbg(vin, "IRQ while state stopped\n");
> > > --=20
> > > 2.34.0
> > >
>=20
> --=20
> Kind Regards,
> Niklas S=C3=B6derlund
