Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A42D18F58C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 14:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgCWNT0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 09:19:26 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41930 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbgCWNTZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 09:19:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DE5051C0321; Mon, 23 Mar 2020 14:19:23 +0100 (CET)
Date:   Mon, 23 Mar 2020 14:19:23 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     sean@mess.org, hverkuil-cisco@xs4all.nl,
        mchehab+samsung@kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] Minimal libv4l2 support for complex cameras
Message-ID: <20200323131922.GA719@duo.ucw.cz>
References: <20200323114727.GA31063@amd>
 <20200323115753.GC12103@pendragon.ideasonboard.com>
 <20200323122216.GA18697@duo.ucw.cz>
 <20200323122442.GD12103@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20200323122442.GD12103@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Mon, Mar 23, 2020 at 01:22:17PM +0100, Pavel Machek wrote:
> > > On Mon, Mar 23, 2020 at 12:47:27PM +0100, Pavel Machek wrote:
> > >> Hi!
> > >>=20
> > >> We now have easy-to-install support for complex camera in form of
> > >> Maemo Leste on N900.... Unfortunately we don't have anything in
> > >> userspace that can be used to work with the camera.
> > >>=20
> > >> This attempts to be minimal solution to get libv4l2 to work.
> > >=20
> > > libv4l2 is mostly deprecated. How about contributing an OMAP3 ISP
> > > pipeline handler to libcamera instead ? :-)
> >=20
> > Why should it be instead?
> >=20
> > I need something for kernel testing, and there is ton of apps using
> > it. Let me do this. libcamera might be future, but...
>=20
> Sure, if it's useful for you, I won't prevent you from developing any
> code you want :-) But there's very little chance of getting it merged,
> and it would be useful to more people to have a support for that
> platform in libcamera. It's really your decision, and I'm not blaming
> you.

When you have libcamera ready, you'll still need some hardware and
kernel to work with it. Do you have something more suitable than
N9/N900? Droid 4 has separate CPU to run the camera, Librem 5 camera
does not have autofocus (and I believe nor has PinePhone).

My patch is not complex, and libv4l2 is full of similar hardware
support code. What would be reason not to merge it?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXni3WgAKCRAw5/Bqldv6
8tJ+AJwKCdSeTfp7OkIfo15LTGeVlxq2dACeI8bZ4e5gTXKuFaA2+BepyPvUT5Y=
=OtqU
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
