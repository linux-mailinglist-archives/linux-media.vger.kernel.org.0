Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49FB7E04B5
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 15:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389226AbfJVNRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 09:17:55 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53109 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387489AbfJVNRz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 09:17:55 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E4C1920019;
        Tue, 22 Oct 2019 13:17:51 +0000 (UTC)
Date:   Tue, 22 Oct 2019 15:17:51 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 3/3] media: cedrus: Add HEVC/H.265 decoding support
Message-ID: <20191022131751.GE2651@aptenodytes>
References: <20190927143411.141526-1-paul.kocialkowski@bootlin.com>
 <20190927143411.141526-4-paul.kocialkowski@bootlin.com>
 <20191017095751.5a229051@coco.lan>
 <20191022124012.GD2651@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Content-Disposition: inline
In-Reply-To: <20191022124012.GD2651@aptenodytes>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again,

On Tue 22 Oct 19, 14:40, Paul Kocialkowski wrote:
> Hi Mauro and thanks for the review,
>=20
> On Thu 17 Oct 19, 09:57, Mauro Carvalho Chehab wrote:
> > Em Fri, 27 Sep 2019 16:34:11 +0200
> > Paul Kocialkowski <paul.kocialkowski@bootlin.com> escreveu:
> >=20
> > > This introduces support for HEVC/H.265 to the Cedrus VPU driver, with
> > > both uni-directional and bi-directional prediction modes supported.
> > >=20
> > > Field-coded (interlaced) pictures, custom quantization matrices and
> > > 10-bit output are not supported at this point.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> >=20
> > ...
> >=20
> > > +		unsigned int ctb_size_luma =3D
> > > +			1 << log2_max_luma_coding_block_size;
> >=20
> > Shifts like this is a little scary. "1" constant is signed. So, if
> > log2_max_luma_coding_block_size is 31, the above logic has undefined
> > behavior. Different archs and C compilers may handle it on different
> > ways.
>=20
> I wasn't aware that it was the case, thanks for bringing this to light!
> I'll make it 1UL then.
>=20
> > > +#define VE_DEC_H265_LOW_ADDR_PRIMARY_CHROMA(a) \
> > > +	(((a) << 24) & GENMASK(31, 24))
> >=20
> > Same applies here and on other similar macros. You need to enforce
> > (a) to be unsigned, as otherwise the behavior is undefined.
> >=20
> > Btw, this is a recurrent pattern on this file. I would define a
> > macro, e. g. something like:
> >=20
> > 	#define MASK_BITS_AND_SHIFT(v, high, low) \
> > 		((UL(v) << low) & GENMASK(high, low))
> >=20
> > And use it for all similar patterns here.
>=20
> Sounds good! I find that the reverse wording (SHIFT_AND_MASK_BITS) would =
be
> a bit more explicit since the shift happens prior to the mask.

Apparently the UL(v) macro just appends UL to v in preprocessor, so it won't
work with anything else than direct integers.

I'll replace it with a (unsigned long) cast, that seems to do the job.

Cheers,

Paul

> Also we probably need to have parenthesis around "low", right?
>=20
> > The best would be to include such macro at linux/bits.h, although some
> > upstream discussion is required.
> >=20
> > So, for now, let's add it at this header file, but work upstream
> > to have it merged there.
>=20
> Understood, I'll include it in that header for now and send a separate pa=
tch
> for inclusion in linux/bits.h (apparently the preprocessor doesn't care a=
bout
> redefinitions so we can just remove the cedrus fashion once the common on=
e is
> in).
>=20
> What do you think?
>=20
> Cheers,
>=20
> Paul



--=20
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2vAX8ACgkQ3cLmz3+f
v9ETIwgAoQrWpxchaAG6DmiijZJfUkjHe2aPTZmNqmRokQJJbqr2V+i0yMM97x0n
5R9a/EvXyH+upMG6rFlIkp9bk5pHALcUdo8SNKenHuQLzpFFdPTfKdAsSmYvaCn6
si2GMwjdcM7hFl26OvPyEidF34yqkqHbGo5WSS87777Cu+TY9TeWdFMrAPiCOJkc
xMDmwWO2w9CdIrJZ6z8FHaAeMQuYS0gsxZdcM/j3ok93tE8NuPU95qdS/mN1a5WJ
06gDjQAFV8E52yNtys6D7JWAAuU3Heq6IJaDx0Ql/jDcLmSmITgvVMicFXJE6K4X
uKLrQkHxHYijHGY3FrP+q8i7SsThrg==
=i+cM
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
