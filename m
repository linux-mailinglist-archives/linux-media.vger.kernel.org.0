Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5940AD0FB6
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 15:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731232AbfJINMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 09:12:39 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:34429 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731049AbfJINMj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 09:12:39 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B38171BF20F;
        Wed,  9 Oct 2019 13:12:34 +0000 (UTC)
Date:   Wed, 9 Oct 2019 15:14:20 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/10] media: renesas-ceu: Use of_device_get_match_data()
Message-ID: <20191009131420.g4wdxa5t2ljiab2l@uno.localdomain>
References: <20191004214334.149976-1-swboyd@chromium.org>
 <20191004214334.149976-3-swboyd@chromium.org>
 <20191009095440.6e834ecf@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yyqmrurhzcbwilu3"
Content-Disposition: inline
In-Reply-To: <20191009095440.6e834ecf@coco.lan>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--yyqmrurhzcbwilu3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Sorry,
   totally missed it

On Wed, Oct 09, 2019 at 09:54:40AM -0300, Mauro Carvalho Chehab wrote:
> Em Fri,  4 Oct 2019 14:43:26 -0700
> Stephen Boyd <swboyd@chromium.org> escreveu:
>
> > This driver can use the replacement API instead of calling
> > of_match_device() and then dereferencing the pointer that is returned.
> > This nicely avoids referencing the match table when it is undefined with
> > configurations where CONFIG_OF=n.
> >
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Jacopo Mondi <jacopo@jmondi.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: <linux-media@vger.kernel.org>
> > Cc: <linux-renesas-soc@vger.kernel.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > Please ack or pick for immediate merge so the last patch can be merged.
>
> Feel free to merge it via your tree:
>
> Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
>

The CEU driver does probably not need this as the dereferencing of the
pointer returned by of_match_device() is guarded by
IS_ENABLED(CONFIG_OF), but surely this does not hurt and it's nicer to
read.

With Mauro's ack mine is probably not needed, but:
Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j
>
> >
> >  drivers/media/platform/renesas-ceu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> > index 197b3991330d..60518bbc2cd5 100644
> > --- a/drivers/media/platform/renesas-ceu.c
> > +++ b/drivers/media/platform/renesas-ceu.c
> > @@ -1679,7 +1679,7 @@ static int ceu_probe(struct platform_device *pdev)
> >  	v4l2_async_notifier_init(&ceudev->notifier);
> >
> >  	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
> > -		ceu_data = of_match_device(ceu_of_match, dev)->data;
> > +		ceu_data = of_device_get_match_data(dev);
> >  		num_subdevs = ceu_parse_dt(ceudev);
> >  	} else if (dev->platform_data) {
> >  		/* Assume SH4 if booting with platform data. */
>
>
>
> Thanks,
> Mauro

--yyqmrurhzcbwilu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2d3SwACgkQcjQGjxah
VjygUhAAhXBeSvuYWzjdo23jPGMvoLueN77MU0RKZYyiVTxGeOygwNSJIqYYQCoD
4J/QfP05RmeX++f0mAwX0Pcizyki7nwWBkT6+6EfLYQKWgariDZlbeI6dThQxK+Z
ErdTfceYG/9XPPlfKbdVbJuzg9boZ6FBc1+KQ96ceP05FeFwX/LrF7ythI/KOfkL
OBDu1vCgrDUCX1EdUWyHRyXvrMKK1CJ4EVpYJzWBuElUtTjMNAkYg8jGb65uYzWn
ko3nDjSWA22pUMXULfJ2UbL+U9zH0OMRwErNF2Vxnd5+xk8ikxLopBEg2iNJhKVT
BMQs0DGbsZgt9A1hEWGG1z8Ucvai9FKdW158CVPcHdey+JUlcR/Rc8IBvtoYMwrW
cr/Aeyws3qQXty3R0+XeVD3ROhOyAm1IN3yqBMdaBpy3uOiBXY3EF23ytEcA0tYz
STOg445+0m7Zwj2rt35abAp0KVfBcz3KMoxYKjQwTVWM1LAiV58nangbBWYspm/x
L5PspcBXjfhMIr4HclYh5KsXqt2ELmFKt7Yzn0zcQ7hwyt7EhiCpl56viQLUttka
jIx3+LbPEC+oo1GZAfVR2oBdvLuYxvT2eH6RWP4G4sWjfaAPviL9W7c+4B+DQpc5
DBk9GLxIlYI+Oip/M/dwhFj9lFiP+AovjRjGq5l9HshDrPbBDlU=
=1szO
-----END PGP SIGNATURE-----

--yyqmrurhzcbwilu3--
