Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E599424F0
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 14:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405298AbfFLMB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 08:01:26 -0400
Received: from sauhun.de ([88.99.104.3]:59056 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405198AbfFLMBZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 08:01:25 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id 32B0B2C54BC;
        Wed, 12 Jun 2019 14:01:23 +0200 (CEST)
Date:   Wed, 12 Jun 2019 14:01:22 +0200
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
Message-ID: <20190612120122.GA2805@kunai>
References: <20190612081929.GA1687@kunai>
 <fa93fecaa9d8e33f7d3b335872e9082893b775ae.1560338665.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <fa93fecaa9d8e33f7d3b335872e9082893b775ae.1560338665.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--J2SCkAp4GZ/dPZZf
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

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A6Y4ACgkQFA3kzBSg
Kba4Pg/+ONgJJSPFFjCsjZt5hyRLBQiQ9aFn+9zRmA2GDcSxjKb/NSZZInR+ggE9
OQaO6dux7uA1X+UBlyQUSoxw8MHJGQqB8x1Xhg2EoZ5vOd53F2CJeQiUprr5GIok
K7I5ETSMTgANqHqFZA2Ou65LFBE34RujYq7wv+2oAlviQiHx1wY0s5HmO9Rwya5R
80frSRmQZ3Q+vZmvUU3o+kRMxpq+DZK8McFBNw50p9K5QSGgAQkvjdjIdyoveK6n
tXZ5uaEQdiPgrkWiuTxmvwtA3KggWAaiKXQxBebIgD0iy2SaBfm1QfQI5oiQOcOF
2CXYVo/1Y1AtCLFYOzNbNINKuVNphGSlR2SBzZ7Oc4kovrVt95VbAEMtHSkzhuwY
FcxLMLH03T8vczUelYDUdv+atB4QoYBGs9WdliprT08DHNgBS+8ASRJM8cybGT9g
DN1yFWE8YfhGVasuhIZul8shmfVthZIOo/GlaY0XxgODCkbB0Oq18moO4sjAquOA
YnJg6IXDfzQUHAMSHuyquXb69I4QYeI+wibhw88/XNB1FpBVi6w0M3q8IxTj7gOY
ZaFqAolAjnlXhBORhTdzKrInM0v0iaw1XGjKiUwfEEwZCTo0Oy5uczjlIkm86qFc
3h7EtxA8SDpTzZ/4MfGmJRQkuGmclz/HtVN3bTMqsJs5zQM0gxs=
=TVqj
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
