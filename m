Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B544729E4
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 10:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfGXIZD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 04:25:03 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:45177 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfGXIZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 04:25:02 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BAE12E0009;
        Wed, 24 Jul 2019 08:24:59 +0000 (UTC)
Date:   Wed, 24 Jul 2019 10:24:59 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Sean Young <sean@mess.org>
Cc:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 04/13] media: rc: sunxi: Add RXSTA bits definition
Message-ID: <20190724082459.xsstansjxtyvu4st@flea>
References: <20190607231100.5894-1-peron.clem@gmail.com>
 <20190607231100.5894-5-peron.clem@gmail.com>
 <20190610095243.7xwp4xhauds22qzw@flea>
 <CAJiuCcfyjGTBbsjZQYj2p3KD6O-WaXhFe5NZrnKQwJYACmatUw@mail.gmail.com>
 <20190715121244.2vrsw6qa4fgp72fn@gofer.mess.org>
 <20190723062557.hnbi6hgrg4ecawkn@gofer.mess.org>
 <20190723070440.nfmhbrfykumxayjj@flea>
 <20190724053937.4ic5n35xtw2chjdy@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="og4sfmz7wdyyword"
Content-Disposition: inline
In-Reply-To: <20190724053937.4ic5n35xtw2chjdy@gofer.mess.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--og4sfmz7wdyyword
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 06:39:37AM +0100, Sean Young wrote:
> On Tue, Jul 23, 2019 at 09:04:40AM +0200, Maxime Ripard wrote:
> > Hi Sean,
> >
> > On Tue, Jul 23, 2019 at 07:25:57AM +0100, Sean Young wrote:
> > > On Mon, Jul 15, 2019 at 01:12:45PM +0100, Sean Young wrote:
> > > > On Sun, Jul 14, 2019 at 04:32:22PM +0200, Cl=E9ment P=E9ron wrote:
> > > > > Hi Sean,
> > > > >
> > > > > You acked the whole v3 series but this patch has been introduced =
in v5
> > > > > could you ack this one too?
> > > >
> > > > Acked-by: Sean Young <sean@mess.org>
> > >
> > > So who's tree should this series go through? It seems mostly device t=
ree.
> > > Alternatively I'm happy to try it get merged via the media tree.
> >
> > Ideally the media bits should go through the media tree, the DT bits
> > will go through arm-soc
> >
> > So you can apply the patches 1-4, 7 and 10, I'll apply the rest.
> >
> > Does that work for you?
>
> Works for me, I'll add them to my next pull request to Mauro.

Applied 5, 6, 8, 9 and 11 to 13.

Thanks!
Maxmie

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--og4sfmz7wdyyword
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTgV2wAKCRDj7w1vZxhR
xfJ7AP9T3lo+mjFXDqZN0Pz/4RMW3K3sSelGWolPV45h0MFvHAD/alxUyiaQdf/T
yqmAR4Jmj9ViaeByiHDySDrorxlVhw0=
=wgpG
-----END PGP SIGNATURE-----

--og4sfmz7wdyyword--
