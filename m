Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6AB62EA7C3
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 10:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbhAEJjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 04:39:32 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:40175 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbhAEJjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 04:39:32 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 25FB81BF217;
        Tue,  5 Jan 2021 09:38:47 +0000 (UTC)
Date:   Tue, 5 Jan 2021 10:38:47 +0100
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
Message-ID: <X/Qzp8/4gd/ANdXh@aptenodytes>
References: <20201231142702.3095260-1-paul.kocialkowski@bootlin.com>
 <20201231142702.3095260-3-paul.kocialkowski@bootlin.com>
 <20210104120749.GK11878@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6HcILEK8wBt0wF+8"
Content-Disposition: inline
In-Reply-To: <20210104120749.GK11878@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6HcILEK8wBt0wF+8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon 04 Jan 21, 14:07, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Thu, Dec 31, 2020 at 03:27:01PM +0100, Paul Kocialkowski wrote:
> > The OV8865 is a 8 Mpx CMOS image sensor producing 3264x2448 at 30 fps.
> > Other modes (including some with sub-sampling) are available too.
> > It outputs 10-bit bayer CFA data through a MIPI CSI-2 interface with
> > up to 4 lanes supported.
>=20
> I've added the patches to a pull request to Mauro; there appear to still =
be
> some checkpatch.pl issues in both of the drivers.
>=20
> I don't mind the warnings on the assignment or the mutex though. Could you
> address these in additional patches, please?

Sorry about that, I realized that I never run checkpatch with --strict
so I completely missed those.

I'll fix the cosmetic issues in a following patch.

Just to clarify one thing:
#define OV8865_PAD_PK_DRIVE_STRENGTH_2X		(1 << 5)
#define OV8865_BLC_CTRL1_COL_SHIFT_128		(1 << 4)

these are not single-bit fields so even though it looks like they should
use BIT(), this would be incoherent with other possible values, such as:
#define OV8865_PAD_PK_DRIVE_STRENGTH_3X		(2 << 5)
#define OV8865_BLC_CTRL1_COL_SHIFT_64		(2 << 4)

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--6HcILEK8wBt0wF+8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/0M6cACgkQ3cLmz3+f
v9EUdQf8Da/wu2n8zvA1u+eNPTj7TvXm0mjCv4a+wrw36gN8Nvs+Diw7+/oqyRtB
AqVH2MKZ6fEOScFyQZcmyW7rnNfGw3NyTAOu84gyb1pEx8CSR/HqkgWT3X9supyI
GI6+t15MJ2IaIKn7v2MPbF17N+QodqcvqULzswPDWf1KEgNYUCFL5STdLwQLDIzS
nIxkbbyNt3aYQAnOPi6jdan4LaeFNb8jQD2PD01CbcohdINFPxAHMWA5DMt4wFlp
6BJMlTuDCZOdylnpmSZmWuEbszHvjwNuFREHD967hC6AILvZfLx+shgIvlUIs02K
DyoCaTT4g37U16GC4rmB3ydBBqjB9A==
=vlVD
-----END PGP SIGNATURE-----

--6HcILEK8wBt0wF+8--
