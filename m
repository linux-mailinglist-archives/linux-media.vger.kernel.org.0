Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD298306720
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 23:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237047AbhA0WRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 17:17:30 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37548 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbhA0WR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 17:17:26 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5FED01C0B92; Wed, 27 Jan 2021 23:16:29 +0100 (CET)
Date:   Wed, 27 Jan 2021 23:16:29 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 2/2 v9] leds: rt8515: Add Richtek RT8515 LED driver
Message-ID: <20210127221628.GC24799@amd>
References: <20210102231510.2068851-1-linus.walleij@linaro.org>
 <20210102231510.2068851-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline
In-Reply-To: <20210102231510.2068851-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!


> This adds a driver for the Richtek RT8515 dual channel
> torch/flash white LED driver.
>=20
> This LED driver is found in some mobile phones from
> Samsung such as the GT-S7710 and GT-I8190.
>=20
> A V4L interface is added.
>=20
> We do not have a proper datasheet for the RT8515 but
> it turns out that RT9387A has a public datasheet and
> is essentially the same chip. We designed the driver
> in accordance with this datasheet. The day someone
> needs to drive a RT9387A this driver can probably
> easily be augmented to handle that chip too.
>=20
> Sakari Ailus, Pavel Machek and Andy Shevchenko helped
> significantly in getting this driver right.

Thanks, applied... And sorry for the delay.

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAR5jwACgkQMOfwapXb+vK7tQCgjBTTX7ltWeMIzgiTlMBYeSMd
+NsAn19D36vUOKYf7mIjjzhuY/gFlci9
=FDqQ
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
