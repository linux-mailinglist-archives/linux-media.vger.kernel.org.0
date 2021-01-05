Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742302EADBB
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 15:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbhAEOu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 09:50:27 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:52269 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbhAEOu1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 09:50:27 -0500
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id A24A110000A;
        Tue,  5 Jan 2021 14:49:41 +0000 (UTC)
Date:   Tue, 5 Jan 2021 15:49:41 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com,
        =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH v4 2/3] media: i2c: Add support for the OV8865 image
 sensor
Message-ID: <X/R8hUdfB8Tbd8mJ@aptenodytes>
References: <20201231142702.3095260-1-paul.kocialkowski@bootlin.com>
 <20201231142702.3095260-3-paul.kocialkowski@bootlin.com>
 <20210104120749.GK11878@paasikivi.fi.intel.com>
 <X/Qzp8/4gd/ANdXh@aptenodytes>
 <20210105144150.GS11878@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UmQFmlcrjB44pt9h"
Content-Disposition: inline
In-Reply-To: <20210105144150.GS11878@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--UmQFmlcrjB44pt9h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Tue 05 Jan 21, 16:41, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Tue, Jan 05, 2021 at 10:38:47AM +0100, Paul Kocialkowski wrote:
> > Hi Sakari,
> >=20
> > On Mon 04 Jan 21, 14:07, Sakari Ailus wrote:
> > > Hi Paul,
> > >=20
> > > On Thu, Dec 31, 2020 at 03:27:01PM +0100, Paul Kocialkowski wrote:
> > > > The OV8865 is a 8 Mpx CMOS image sensor producing 3264x2448 at 30 f=
ps.
> > > > Other modes (including some with sub-sampling) are available too.
> > > > It outputs 10-bit bayer CFA data through a MIPI CSI-2 interface with
> > > > up to 4 lanes supported.
> > >=20
> > > I've added the patches to a pull request to Mauro; there appear to st=
ill be
> > > some checkpatch.pl issues in both of the drivers.
> > >=20
> > > I don't mind the warnings on the assignment or the mutex though. Coul=
d you
> > > address these in additional patches, please?
> >=20
> > Sorry about that, I realized that I never run checkpatch with --strict
> > so I completely missed those.
> >=20
> > I'll fix the cosmetic issues in a following patch.
> >=20
> > Just to clarify one thing:
> > #define OV8865_PAD_PK_DRIVE_STRENGTH_2X		(1 << 5)
> > #define OV8865_BLC_CTRL1_COL_SHIFT_128		(1 << 4)
> >=20
> > these are not single-bit fields so even though it looks like they should
> > use BIT(), this would be incoherent with other possible values, such as:
> > #define OV8865_PAD_PK_DRIVE_STRENGTH_3X		(2 << 5)
> > #define OV8865_BLC_CTRL1_COL_SHIFT_64		(2 << 4)
>=20
> Agreed.
>=20
> You might not assign the top bit, but if you did, the left operand would
> have to be unsigned to guarantee the intended result (otherwise it's
> undefined).

Ah right, that's the issue with shifting signed constants up to the sign bi=
t.
I had a quick look and I think this driver's safe about it.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--UmQFmlcrjB44pt9h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/0fIUACgkQ3cLmz3+f
v9GA3Qf+PbkUakvgTadm3DLLo6iY8bQ1j+VKKrmJHJ1f2qEjuje+B5oSFkNFtBSS
Aq7A2ZvO9qa2c7UzJHN5ZVlsGhrRBs4q6dPXblJF/YFno6BcfY6JlJan9OB6G8pY
zYWuYcM6mL8SDP8V9pctbp77492sBRRmFezOw+W1/JTQUuIz/4wUPrJ62Z+IQjSb
u4oBIgGqtmSgowDC7NpRfXKhIPcSmcnGqsPcTxcQLMuHPFbKuL9vgRbDOUjBvyY/
qvtaRUp05zc/SU7GpqJ6E/dCW3Wm3Pyz+v/giDek3zZ/cc34GdABeAXOGbbn3W+R
1hLwnNIwbStljzlbDpVc6Pp9+JcWWQ==
=VFPQ
-----END PGP SIGNATURE-----

--UmQFmlcrjB44pt9h--
