Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5219871246
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 09:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732550AbfGWHEo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 03:04:44 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:39073 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfGWHEo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 03:04:44 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5C99A60007;
        Tue, 23 Jul 2019 07:04:41 +0000 (UTC)
Date:   Tue, 23 Jul 2019 09:04:40 +0200
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
Message-ID: <20190723070440.nfmhbrfykumxayjj@flea>
References: <20190607231100.5894-1-peron.clem@gmail.com>
 <20190607231100.5894-5-peron.clem@gmail.com>
 <20190610095243.7xwp4xhauds22qzw@flea>
 <CAJiuCcfyjGTBbsjZQYj2p3KD6O-WaXhFe5NZrnKQwJYACmatUw@mail.gmail.com>
 <20190715121244.2vrsw6qa4fgp72fn@gofer.mess.org>
 <20190723062557.hnbi6hgrg4ecawkn@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nvr4fk2rzmmuioc2"
Content-Disposition: inline
In-Reply-To: <20190723062557.hnbi6hgrg4ecawkn@gofer.mess.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--nvr4fk2rzmmuioc2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Tue, Jul 23, 2019 at 07:25:57AM +0100, Sean Young wrote:
> On Mon, Jul 15, 2019 at 01:12:45PM +0100, Sean Young wrote:
> > On Sun, Jul 14, 2019 at 04:32:22PM +0200, Cl=E9ment P=E9ron wrote:
> > > Hi Sean,
> > >
> > > You acked the whole v3 series but this patch has been introduced in v5
> > > could you ack this one too?
> >
> > Acked-by: Sean Young <sean@mess.org>
>
> So who's tree should this series go through? It seems mostly device tree.
> Alternatively I'm happy to try it get merged via the media tree.

Ideally the media bits should go through the media tree, the DT bits
will go through arm-soc

So you can apply the patches 1-4, 7 and 10, I'll apply the rest.

Does that work for you?

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nvr4fk2rzmmuioc2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTaxiAAKCRDj7w1vZxhR
xesNAQD8WCEMwvXtgYh+h+LCOvkCUrn06ytKH73piKWm8MCJTAEA6k/hf/kMW9uJ
9ayaEnz1ePXdNkfsVhxSLNJVpUKTHwI=
=ZogC
-----END PGP SIGNATURE-----

--nvr4fk2rzmmuioc2--
