Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 619564F79A
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 19:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfFVR4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jun 2019 13:56:25 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55399 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfFVR4Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jun 2019 13:56:24 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D9B4C80689; Sat, 22 Jun 2019 19:56:11 +0200 (CEST)
Date:   Sat, 22 Jun 2019 19:56:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: Remote "Mouse mode" buttons, Keycode choices, etc.
Message-ID: <20190622175621.GC30317@amd>
References: <e1c968df516b751769765e0b0947caea607e7b7f.camel@hadess.net>
 <20190616165818.GA23022@xo-6d-61-c0.localdomain>
 <212f7db1f2d0b88a749bf3378bfaf3185590b6db.camel@hadess.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline
In-Reply-To: <212f7db1f2d0b88a749bf3378bfaf3185590b6db.camel@hadess.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-06-21 13:39:39, Bastien Nocera wrote:
> On Sun, 2019-06-16 at 18:58 +0200, Pavel Machek wrote:
> > Hi!
> >=20
> > > I dug out a fair bunch of remote controls I got around 10 years
> > > ago[1],
> > > and started trying them all out.
> > >=20
> > > I bumped into a couple of problems:
> > >=20
> > > - the Snapstream Firefly remote ([2] using the rc-snapstream-
> > > firefly
> > > keymap and the ati_remote protocol) creates 2 input device nodes,
> > > one
> > > for the remote keys, one for the mouse mode. The mouse button on
> > > the
> > > remote just sends KEY_MODE, and doesn't change the mode, nothing is
> > > ever sent on the mouse device node
> > >=20
> > > - the Streamzap remote ([3]) uses KEY_NUMERIC_[0-9] keycodes, just
> > > like
> > > a small minority of other devices. Is there any reason for them not
> > > to
> > > use KEY_[0-9] instead? Or for all of them to use KEY_NUMERIC_*, for
> > > consistencies' sake. I can send patches for those.
> >=20
> > This may be a bit of fun; consistency is good but this will change
> > behaviour for people,
> > right?
> >=20
> > So.. be careful :-).
>=20
> I'm not really sure how one can be "careful" doing that.

You could do an config option and then pretend breakage is user
decision, for example.

Or better just change it and see what happens.

> You can check this patch to lirc from 2008 to see what it might end up
> looking like ;)
> https://people.redhat.com/bnocera/lirc-fix-remote-keycodes.patch
>=20
> It doesn't really answer my question about whether this discrepancy was
> intended though.

Probably not intended.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0Oa8UACgkQMOfwapXb+vL7gACeLeEfDwPLq9fy2+jHciMJCu0r
kxAAoK6oR1Pah2AuOfcEcdlF4pLXJbMm
=Dukm
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
