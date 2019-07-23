Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B53E9714AF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 11:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfGWJJ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 05:09:56 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:43648 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbfGWJJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 05:09:55 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id E266980419; Tue, 23 Jul 2019 11:09:41 +0200 (CEST)
Date:   Tue, 23 Jul 2019 11:09:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Subject: Re: [RFC] Removal of drivers/staging/media/bcm2048
Message-ID: <20190723090952.GB30669@amd>
References: <e78d190f-5185-f37a-c212-b88af2198f55@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline
In-Reply-To: <e78d190f-5185-f37a-c212-b88af2198f55@xs4all.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-07-23 10:51:52, Hans Verkuil wrote:
> This staging driver is now almost 6 years old, but hasn't seen any real
> development for a long time.
>=20
> I think it is time to remove it, unless someone plans to do work on this
> in the near future.
>=20
> If anyone wants to work on this, please let us know.

So... unfortunately this one depends on bluetooth driver, which is
quite complex. Unfortunately, that one was removed from staging while
it was being worked upon, and seen little progress since that.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl02zuAACgkQMOfwapXb+vJ9MACfS0YCrA0iI5XV/rpKO3IOvLow
NCAAn3lA/JKJ9MqBOUzu/v3FFJJ55GqW
=epdg
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
