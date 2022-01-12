Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BC548C2E0
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 12:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352765AbiALLJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 06:09:50 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:52449 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352761AbiALLJu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 06:09:50 -0500
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4737F1BF20E;
        Wed, 12 Jan 2022 11:09:46 +0000 (UTC)
Date:   Wed, 12 Jan 2022 12:09:46 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] ov5648: Don't pack controls struct
Message-ID: <Yd62+tGrH+ep7bAS@aptenodytes>
References: <20220110224831.266749-1-sakari.ailus@linux.intel.com>
 <Yd0/nL7iQityle6P@aptenodytes>
 <Yd1sOmFjJfsFHrT2@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1lgNl+3VW9xJMD8t"
Content-Disposition: inline
In-Reply-To: <Yd1sOmFjJfsFHrT2@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--1lgNl+3VW9xJMD8t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Tue 11 Jan 22, 13:38, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Tue, Jan 11, 2022 at 09:28:12AM +0100, Paul Kocialkowski wrote:
> > Hi Sakari,
> >=20
> > On Tue 11 Jan 22, 00:48, Sakari Ailus wrote:
> > > Don't pack the driver specific struct containing control pointers. Th=
is
> > > lead to potential alignment issues when working with the pointers.
> >=20
> > Thanks for looking into the report and making this fix.
> >=20
> > Honestly I was a bit puzzled because I explicitly added the __packed
> > to avoid possible holes in the structures that could be problematic
> > when using v4l2_ctrl_auto_cluster and I think the problem still stands.
> >=20
> > I feel like solving both issues at once would require having the contro=
ls
> > that belong in the same cluster declared as an array and not individual
> > members of the struct.
> >=20
> > What do you think?
>=20
> No architecture used in Linux requires adding padding between two pointers
> to my knowledge --- generally the alignment is at most the size of the
> data: otherwise arrays would not work either. Therefore packing isn't
> required.

I was under the impression that padding may happen in structures generally
speaking. Are you saying that because it's pointers, there will most likely
be no padding required?

Also there's a struct v4l2_ctrl_handler at the end of the struct
(not a pointer), maybe that can somehow play a role too and introduce paddi=
ng?

My feeling was that there's no strong guarantee here, so packing the struct
would be the safe thing to do. I also don't see how unaligned access can oc=
cur
in the packed struct in that case (pointers should always offset to somethi=
ng
properly aligned, shouldn't they?).

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--1lgNl+3VW9xJMD8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmHetvoACgkQ3cLmz3+f
v9GwJgf/Vdbd2Nuq+rTXKb8XczWpgTRsSr6VJYifWmuUxdgpvvNH6TjlVD61t8O9
e2lr/Q+Mjv3wCWS3FFtjLxK5UxcVpzkvyxM94G8KJGo52qjDvRoagr3gg6d6oKHg
I216eqtuQrVTnSlYyGI8b1IL4/CJiiJZetwJbZ2eiER+eG8p0Nl2/VfKvgSoJqWh
v819JLoAsG5aYMvhMX/fhcffF+lQ0d/c6wWQir1GdSm9ZY55F+CMXH06KJ1ws8P6
qQCNd2W97C8MSZZi6eklWKdSqwGw7Km3cR8oRqv6cqqFwbdhsEczpiIgjAqf2/BZ
xHLZ0a5fKlaSrWHqb9un/M4eZPO+ZA==
=xs80
-----END PGP SIGNATURE-----

--1lgNl+3VW9xJMD8t--
