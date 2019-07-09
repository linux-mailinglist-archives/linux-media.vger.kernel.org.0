Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1D1463BDD
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 21:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfGIT0Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 15:26:24 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:33020 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfGIT0Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 15:26:24 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id B1E71717F7C; Tue,  9 Jul 2019 21:26:21 +0200 (CEST)
Date:   Tue, 9 Jul 2019 21:26:19 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] si2157: get chip id during probing
Message-ID: <20190709192619.GA20980@taurus.defre.kleine-koenig.org>
References: <20190707205846.22964-1-uwe@kleine-koenig.org>
 <3ff87deb-9125-4696-8aa0-141ea7d773b9@kleine-koenig.org>
 <545607da-accf-06c5-f5ae-43d28781f554@kleine-koenig.org>
 <20190709200329.7a47f453@kemnade.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <20190709200329.7a47f453@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andreas,

On Tue, Jul 09, 2019 at 08:03:29PM +0200, Andreas Kemnade wrote:
> On Mon, 8 Jul 2019 10:43:08 +0200
> Uwe Kleine-K=F6nig <uwe@kleine-koenig.org> wrote:
> > On 7/7/19 11:01 PM, Uwe Kleine-K=F6nig wrote:
> > > Hello,
> > >=20
> > > On 7/7/19 10:58 PM, Uwe Kleine-K=F6nig wrote: =20
> > >> From: Andreas Kemnade <andreas@kemnade.info>
> > >>
> > >> If the si2157 is behind a e.g. si2168, the si2157 will
> > >> at least in some situations not be readable after the si268
> > >> got the command 0101. It still accepts commands but the answer
> > >> is just ffffff. So read the chip id before that so the
> > >> information is not lost.
> > >>
> > >> The following line in kernel output is a symptome
> > >> of that problem:
> > >> si2157 7-0063: unknown chip version Si21255-\xffffffff\xffffffff\xff=
ffffff
> > >>
> > >> Signed-off-by: Andreas Kemnade <andreas@kemnade.info> =20
> >=20
> > I wonder if you (or anyone else here reading this mail) has access to
> > the datasheets of the involved chips? (i.e. si2168, si2157)
> > I'd like to try understanding and eventually fix the addressed problem
> > here properly.

BTW, I tried to contact Silabs support asking for the datasheets. But
because this doesn't promise to generate a certain amount of selled
chips I won't get an NDA and so also won't get the datasheets. :-|

> I remember some rumors that there is a resistor on the board which needs =
to be
> changed, maybe some i2c pullup to properly fix it. Windows driver by chan=
ce
> does it in a order which works with the current setup, so engineers
> did not notice. I have not checked it myself.
> So the theory is that we do here some workaround for a hw problem.

Do you have some more details about these rumors?

You wrote in the commit log that the si2157 would still be writable but
not readable. Given how i2c works I wonder how this can be because both
directions use the same data line. Did you verify with a scope that the
revision query command makes it on the bus? Is the reply visible, or do
you see the 0xff bytes there, too?

Given that the transfer works before the si2168 chip is booted (this is
what the 0x01-0x01 command is about AFAIK), this doesn't sound like a
hardware issue to me.

There are still a few things I could check:

 - are there some (write only) i2c transfers later that (seem to) work?
 - is it really the 0x01 0x01 that makes reading the revision fail?

Not sure when I come around because this is my free time project and
there are more urgent things to do for me now. But if you have thoughts
about the matter, don't hesitate to tell me.

Best regards
Uwe

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl0k6lgACgkQwfwUeK3K
7AkroggAhl5vcUPcUW3DpACZ3dqJqwUephINV7hNsKNTwsSUM7Ow2qmOiY3tNDeC
GQ4dLFTAL6IxOEnXhZtmOdxlDPwln49n5H8FIxA/SBCRe08CHuf49BYauoK0DDUk
t/5g/kOuCTD/OX0ri3lZ90VgUvUmRGJBn2xijJLndhNKFnP5hEO1MhmRKO8sbOk0
iyc6FsuLaa7bblyJyFrKx5/mxzEFll0uafGrvtfDqVGvygJGD8v7Jq+pGIkxrR9o
Vrw6RGsLnGqI8N2/JPfYaTJ2ShPVbuQDsGlArwer1Vw67V+ADt1nRDe77ds+S/ip
Y5ZWeS/EHKNFWR35auRRSgf5yf8EfQ==
=S4fm
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
