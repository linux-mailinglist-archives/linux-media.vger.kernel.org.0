Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7106F18F46A
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 13:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbgCWMWT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 08:22:19 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34790 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbgCWMWT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 08:22:19 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 952D71C0313; Mon, 23 Mar 2020 13:22:17 +0100 (CET)
Date:   Mon, 23 Mar 2020 13:22:17 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     sean@mess.org, hverkuil-cisco@xs4all.nl,
        mchehab+samsung@kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] Minimal libv4l2 support for complex cameras
Message-ID: <20200323122216.GA18697@duo.ucw.cz>
References: <20200323114727.GA31063@amd>
 <20200323115753.GC12103@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20200323115753.GC12103@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Thank you for the patch.
>=20
> On Mon, Mar 23, 2020 at 12:47:27PM +0100, Pavel Machek wrote:
> > Hi!
> >=20
> > We now have easy-to-install support for complex camera in form of
> > Maemo Leste on N900.... Unfortunately we don't have anything in
> > userspace that can be used to work with the camera.
> >=20
> > This attempts to be minimal solution to get libv4l2 to work.
>=20
> libv4l2 is mostly deprecated. How about contributing an OMAP3 ISP
> pipeline handler to libcamera instead ? :-)

Why should it be instead?

I need something for kernel testing, and there is ton of apps using
it. Let me do this. libcamera might be future, but...

> > It enables passing camera pipeline description to libv4l2, so that
> > controls are mapped to appopriate devices, and libv4l2 can be used
> > with complex camera.
> >=20
> > It is useful for testing kernel parts of N900 subsystem, and it will
> > serve as a basis for autofocus work and autogain improvements.
> >=20
> > Signed-off-by: Pavel Machek <pavel@ucw.cz>

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXnip+AAKCRAw5/Bqldv6
8t9RAJ9gp4UhWHe9s+ZzUmIv9uoSME0gywCeNqjZCMTBS4h7xEWSYy8OZ7LU+mw=
=QgEs
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
