Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86869D561F
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2019 14:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729068AbfJMMK3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 08:10:29 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41952 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbfJMMK3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 08:10:29 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id AA7C780262; Sun, 13 Oct 2019 14:10:11 +0200 (CEST)
Date:   Sun, 13 Oct 2019 14:10:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/6] ad5820: Multiple fixes
Message-ID: <20191013121020.GM5653@amd>
References: <20191007132856.27948-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="iUV/lbBrmPtUT9dM"
Content-Disposition: inline
In-Reply-To: <20191007132856.27948-1-ribalda@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--iUV/lbBrmPtUT9dM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-10-07 15:28:50, Ricardo Ribalda Delgado wrote:
> -Support for enable-pin, of-autoload, enable-gpios and ad5821 and ad5823
>=20
> For some reason these patchset was lost in translation for a year ;)
>=20
>=20
> v8: I screwed up sending v7, I sent it from a dirty directory
> and clicked on send-all without checking what was under v7*. Sorry :(
> This made patchwork very unhappy. I send v8 to make patchwork happy and
> hopefuly also the maintainer. Sorry again

Ok, this is a LED, but I assume it needs to go in using media
tree. Good luck! :-).

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--iUV/lbBrmPtUT9dM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jFCwACgkQMOfwapXb+vKumwCeLBeJP9ErxUe2GUYsar2FhSYt
fq8AoMH87mnqnjYtBSgq9pJMjtITnYEC
=PuDS
-----END PGP SIGNATURE-----

--iUV/lbBrmPtUT9dM--
