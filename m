Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 360634AD6F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 23:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbfFRViK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 17:38:10 -0400
Received: from sauhun.de ([88.99.104.3]:45320 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730176AbfFRViK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 17:38:10 -0400
Received: from localhost (p5486CE06.dip0.t-ipconnect.de [84.134.206.6])
        by pokefinder.org (Postfix) with ESMTPSA id 6249B2C047A;
        Tue, 18 Jun 2019 23:38:07 +0200 (CEST)
Date:   Tue, 18 Jun 2019 23:38:07 +0200
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
Message-ID: <20190618213807.GA8356@kunai>
References: <20190612081929.GA1687@kunai>
 <fa93fecaa9d8e33f7d3b335872e9082893b775ae.1560338665.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <fa93fecaa9d8e33f7d3b335872e9082893b775ae.1560338665.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--pf9I7BMVVzbSWLtt
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

I see there is a build-fix from davem now in linux-next. Shall I still
apply this patch to my i2c tree once Mauro applied it to his?


--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0JWboACgkQFA3kzBSg
Kbaa/w//dkLZr3BGmVtNIAhtFtIVjejosTZf8PSX+avUaQH4EJQqe8kEwVzWHN7P
o90IAkHqohbxmtgryeqROQQpzy8QIjKsr0zzqYIZlacU5z694Jev6AGhpw0dYx/j
3uYth51SjXmY/efoVQa+Z0tTCj5zNh8crkGQqitPgl0I0zzGBHDmfOh8pdJBYgYo
HCuVP0NdugdIBOWcbiDEtF0mik7k71Zh1J1ZGcJw/LC5WrZ2WNS2ILHFH1yKDjVe
1WLFb8yE/Ea313X+f1Hgh3BSVxUszkFSRyfZvMabvdZb2jzzkUlxzHd78ZoAvvEb
HjQ7oocJCy6XP312JllhG+TdLChu92HcNpaSbh4vxo15ilCQtcVPMXQIehvtgme0
Wn7MpuA3hjX1cltpjfsMYjl+LsAe1MlHPF5xFZusiA2N1OUIVhEcMTSvm5me44MB
/syQnj8oCnOEtoPE7JaMwKxO0kj/z2HJrv7WEJg9eqRdigFq89SsXYt8UM0oh+UN
pKPhHsdr5s2hY8Z2vw/p2K+um53tGCDwwswOJ1BC/I3LhOM9vg/dLDigA7bOpmmt
7HXf1cpBVJ/pDumoBq1sKfGIy4IqWNRw++/a7jjTMBogNSE14H7xAG17D9AowMkc
ncqhh0FIPFr9DPZzFdLSHwvXIrbR6UOr0yuimIG3ukxOyTiktUg=
=/ckW
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
