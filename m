Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA99E03FE
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 14:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731354AbfJVMkR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 08:40:17 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:59879 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfJVMkR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 08:40:17 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1D666E0005;
        Tue, 22 Oct 2019 12:40:13 +0000 (UTC)
Date:   Tue, 22 Oct 2019 14:40:12 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 3/3] media: cedrus: Add HEVC/H.265 decoding support
Message-ID: <20191022124012.GD2651@aptenodytes>
References: <20190927143411.141526-1-paul.kocialkowski@bootlin.com>
 <20190927143411.141526-4-paul.kocialkowski@bootlin.com>
 <20191017095751.5a229051@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline
In-Reply-To: <20191017095751.5a229051@coco.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro and thanks for the review,

On Thu 17 Oct 19, 09:57, Mauro Carvalho Chehab wrote:
> Em Fri, 27 Sep 2019 16:34:11 +0200
> Paul Kocialkowski <paul.kocialkowski@bootlin.com> escreveu:
>=20
> > This introduces support for HEVC/H.265 to the Cedrus VPU driver, with
> > both uni-directional and bi-directional prediction modes supported.
> >=20
> > Field-coded (interlaced) pictures, custom quantization matrices and
> > 10-bit output are not supported at this point.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
>=20
> ...
>=20
> > +		unsigned int ctb_size_luma =3D
> > +			1 << log2_max_luma_coding_block_size;
>=20
> Shifts like this is a little scary. "1" constant is signed. So, if
> log2_max_luma_coding_block_size is 31, the above logic has undefined
> behavior. Different archs and C compilers may handle it on different
> ways.

I wasn't aware that it was the case, thanks for bringing this to light!
I'll make it 1UL then.

> > +#define VE_DEC_H265_LOW_ADDR_PRIMARY_CHROMA(a) \
> > +	(((a) << 24) & GENMASK(31, 24))
>=20
> Same applies here and on other similar macros. You need to enforce
> (a) to be unsigned, as otherwise the behavior is undefined.
>=20
> Btw, this is a recurrent pattern on this file. I would define a
> macro, e. g. something like:
>=20
> 	#define MASK_BITS_AND_SHIFT(v, high, low) \
> 		((UL(v) << low) & GENMASK(high, low))
>=20
> And use it for all similar patterns here.

Sounds good! I find that the reverse wording (SHIFT_AND_MASK_BITS) would be
a bit more explicit since the shift happens prior to the mask.

Also we probably need to have parenthesis around "low", right?

> The best would be to include such macro at linux/bits.h, although some
> upstream discussion is required.
>=20
> So, for now, let's add it at this header file, but work upstream
> to have it merged there.

Understood, I'll include it in that header for now and send a separate patch
for inclusion in linux/bits.h (apparently the preprocessor doesn't care abo=
ut
redefinitions so we can just remove the cedrus fashion once the common one =
is
in).

What do you think?

Cheers,

Paul

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2u+KwACgkQ3cLmz3+f
v9Gz+wf/Zm7r1AZpv5lPzfcsaQXWOZk4HXntSACtkvGv3E/mgOtN8S/SrT59MQ6V
MPfJ2aBH5JhDiv6NIW1vFwhvx8gJ8P8Dshl2I8I/qzAzoqLGjBQe3Hod/tpq0ZFe
tqiIhujaADacV9qCeOl4aBWfcVDdIznZZ8RilXQT/Bl98912LWpEmy8rMmNEVxGe
JM+mnw7gDZfuRHDmAR/IXAMYcN1mF9m8t49liAvEWSesEUKTPuTkejZAffiUAY4o
FAvYoNMOrX9+l1j+tRgdDSO9Kg8XuF6rh0ATqaiOnu2sg+AcDPBXozHa8KuJX9dl
8tN1aQb0gn+lwL9XRnCNEvjHzYFveA==
=ev27
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
