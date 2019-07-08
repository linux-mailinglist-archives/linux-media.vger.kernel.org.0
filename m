Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDFEC61C61
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 11:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbfGHJZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 05:25:47 -0400
Received: from sauhun.de ([88.99.104.3]:39068 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727163AbfGHJZr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jul 2019 05:25:47 -0400
Received: from localhost (p54B33631.dip0.t-ipconnect.de [84.179.54.49])
        by pokefinder.org (Postfix) with ESMTPSA id EEA7D2C04C2;
        Mon,  8 Jul 2019 11:25:43 +0200 (CEST)
Date:   Mon, 8 Jul 2019 11:25:43 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ruslan Babayev <ruslan@babayev.com>,
        Andrew de Quincey <adq_dvb@lidskialf.net>,
        Michael Buesch <m@bues.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] media: tua6100: Remove some ugly defines
Message-ID: <20190708092543.GA1050@kunai>
References: <20190612081929.GA1687@kunai>
 <fa93fecaa9d8e33f7d3b335872e9082893b775ae.1560338665.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <fa93fecaa9d8e33f7d3b335872e9082893b775ae.1560338665.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2019 at 08:25:03AM -0300, Mauro Carvalho Chehab wrote:
> As reported by Stephen:
>=20
> > After merging the i2c tree, today's linux-next build (x86_64 allmodconf=
ig)
> > produced this warning:
> >
> > drivers/media/dvb-frontends/tua6100.c: In function 'tua6100_set_params':
> > drivers/media/dvb-frontends/tua6100.c:71: warning: "_P" redefined
> >  #define _P 32
> >
> > In file included from include/acpi/platform/aclinux.h:54,
> >                  from include/acpi/platform/acenv.h:152,
> >                  from include/acpi/acpi.h:22,
> >                  from include/linux/acpi.h:21,
> >                  from include/linux/i2c.h:17,
> >                  from drivers/media/dvb-frontends/tua6100.h:22,
> >                  from drivers/media/dvb-frontends/tua6100.c:24:
> > include/linux/ctype.h:14: note: this is the location of the previous de=
finition
> >  #define _P 0x10 /* punct */
> >
> > Exposed by commit
> >
> >   5213d7efc8ec ("i2c: acpi: export i2c_acpi_find_adapter_by_handle")
> >
> > Since that included <linux/acpi.h> from <linux/i2c.h>
> >
> > Originally introduced by commit
> >
> >   00be2e7c6415 ("V4L/DVB (4606): Add driver for TUA6100")
> >
> > The _P in <linux/ctype.h> has existed since before git.
>=20
> The addition of include <linux/ctype.h> at the I2C code caused a
> breakage at the tua6100 driver. The reason is that the code there
> used defines for 3 parameters used at the calculus for the
> divide ratio.
>=20
> In thesis, those are board-dependent, but, as there's just one
> driver using it (ttpci/budget-av), there was no need to make
> the code more generic. While it sounds unlikely that this old
> DVB-S frontend would ever be used on new projects, one might
> some day come with a variant using a different configuration. So,
> let's do the right thing and store those values at its private
> struct.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Mauro, what do we do here? The merge window is open and I can't send my
I2C pull request unless the above issue is fixed. I see two options:

1) This patch gets fast-tracked into the media-tree (or I can pick it
into my I2C tree if you are fine with that)

2) I pick the intermediate fix from David Miller in linux-next into my
tree, but I'd need your ack for this patch (can be given here):

https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit/d=
rivers/media/dvb-frontends/tua6100.c?id=3D621ccc6cc5f8d6730b740d31d48182278=
66c93c9

Kind regards,

   Wolfram


--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0jDBMACgkQFA3kzBSg
KbZgmA//Y4Uat5FuqUH5KCIdV4VqRuZxik4xLSUhCDPYBGcukT41EALv9HdMk2nG
g0ok9znCKmK6rU+tUu2BvpOOpL0T7i2uqylTL7YI2/+v2v1sKJUderDaC1Y0zu7B
Cx3K+DuxEPN9ShN84eiUL6snlQDu/lVC0n+bJ2kqk3RNF6BjmoHOweQPWBX6oSpE
MBzlb60ih4fOp5Sq22RglUxbK5KIdp+61aPSArz0DbxlIU9Z5joz4qnG1NABMibv
AIsLZgifiPtEdx9GHfuNEbrpqHZh3k2G5oGLTTbo3x6S3yd2ab1VrPJVKkB3giSf
J5aEcs114vCMz+EMi+VJuE91QfxtoYOt+De409qZLA7Xv+DBMnv3HEEFhngLZ0SO
THf1Z8PeFP48T6puzPZprwljjuEsSyNzuEzbJ0F0YctOR7AeRTU7bVFqlI3PQDKZ
mJwnRD7345/P8IzI0JwhYLPFFAW5OrbnhMVyKiw7dM3uJm0Qg45YLn91C/9lNc76
Y2WxbFxKLpfMOGpbHOd7/YQ5iIdCtczyKq37TJN/DcYIHCgFXlOEI4FiChyzw9zv
+Z5+uyZMjlKAmbAb+2ehOBzw4eBY3ZDYvETaGSzIvGjUKvuwfJYEtgb3t+buyh0U
4uaO6GWgUMEDwidEDvyuNkJls+OFrP5NI8wXbjwlL9zO0zKssKU=
=sUUN
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
