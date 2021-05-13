Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38B537FB5F
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 18:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235088AbhEMQUm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 12:20:42 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34042 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhEMQUk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 12:20:40 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3438A1C0B80; Thu, 13 May 2021 18:19:30 +0200 (CEST)
Date:   Thu, 13 May 2021 18:19:29 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        phone-devel@vger.kernel.org, martijn@brixit.nl,
        linux-media@vger.kernel.org, martin.kepplinger@puri.sm,
        dorota.czaplejewicz@puri.sm
Subject: Re: Recording videos on phones and camera on Librem 5 devboard
Message-ID: <20210513161929.GD19588@duo.ucw.cz>
References: <20210512214702.GB27652@duo.ucw.cz>
 <YJz0cn4OrXNhRDoO@bogon.m.sigxcpu.org>
 <694c6d07525eb5f6d5a19a0c94b4f1f280b03973.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline
In-Reply-To: <694c6d07525eb5f6d5a19a0c94b4f1f280b03973.camel@ndufresne.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Who is the right person to talk about Librem 5 cameras? Is there
> > > mailing list I should use?
> >=20
> > I think most of the coordination is mostly happening via the gitlab iss=
ues in
> >=20
> > https://source.puri.sm/Librem5/linux-next
> >=20
> > Maybe Martin and Dorota who are working on the camera drivers (put in c=
c:)
> > have a more suggestions.
> >=20
> > >=20
> > > AFAICS from bugzillas, it is still not compeletely working. I see
> > > megapixels packaged in the repository, but without required config
> > > files. Are there work-in-progress configurations somewhere? Would it
> > > be useful if I tried to get it to work on the devboard?
> >=20
> > Megapixels work is mostly happening here atm:
> >=20
> > https://source.puri.sm/dorota.czaplejewicz/megapixels
>=20
> While this is interesting work, I would also keep an eye on libcamera, wh=
ich I
> believe is a better place for HW specific media controller and request ha=
ndling.
> Shouldn't be very hard to port this GTK3 library on top of libcamera.
>=20
> https://libcamera.org/

Hmm, famous last words :-).

I view megapixels as hand-optimized camera application tailored to
phones and taking photos (and it is good at that).

OTOH Unicsy camera (https://gitlab.com/tui/tui/-/tree/master/cam ) is
simple python wrapper over GTK+ and gstreamer aimed at videos. (It can
do photos, too; slowly. Hand-coded app would probably have better
performance).

Eventually it would be nice to have media controller support in
libcamera, gstreamer and probably some other framework I forgot about.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYJ1RkQAKCRAw5/Bqldv6
8pToAKCKOaqmJ3d0VDMoNEDnE+LSWMw6LQCgnjGGYGP4pYrZwsWbBoMkw7suGX4=
=ACfX
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
