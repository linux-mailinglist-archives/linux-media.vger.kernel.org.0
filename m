Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E36B7E05BC
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 16:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732056AbfJVOBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 10:01:34 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:34455 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388057AbfJVOBe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 10:01:34 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9477FE000A;
        Tue, 22 Oct 2019 14:01:29 +0000 (UTC)
Date:   Tue, 22 Oct 2019 16:01:29 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 3/3] media: cedrus: Add HEVC/H.265 decoding support
Message-ID: <20191022140129.GA1926725@aptenodytes>
References: <20190927143411.141526-1-paul.kocialkowski@bootlin.com>
 <20190927143411.141526-4-paul.kocialkowski@bootlin.com>
 <20191017095751.5a229051@coco.lan>
 <20191022124012.GD2651@aptenodytes>
 <20191022131751.GE2651@aptenodytes>
 <62ddccd3-38c0-89c5-7f0c-35f24494c3f9@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <62ddccd3-38c0-89c5-7f0c-35f24494c3f9@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 22 Oct 19, 15:37, Hans Verkuil wrote:
> On 10/22/19 3:17 PM, Paul Kocialkowski wrote:
> > Hi again,
> >=20
> > On Tue 22 Oct 19, 14:40, Paul Kocialkowski wrote:
> >> Hi Mauro and thanks for the review,
> >>
> >> On Thu 17 Oct 19, 09:57, Mauro Carvalho Chehab wrote:
> >>> Em Fri, 27 Sep 2019 16:34:11 +0200
> >>> Paul Kocialkowski <paul.kocialkowski@bootlin.com> escreveu:
> >>>
> >>>> This introduces support for HEVC/H.265 to the Cedrus VPU driver, with
> >>>> both uni-directional and bi-directional prediction modes supported.
> >>>>
> >>>> Field-coded (interlaced) pictures, custom quantization matrices and
> >>>> 10-bit output are not supported at this point.
> >>>>
> >>>> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> >>>> ---
> >>>
> >>> ...
> >>>
> >>>> +		unsigned int ctb_size_luma =3D
> >>>> +			1 << log2_max_luma_coding_block_size;
> >>>
> >>> Shifts like this is a little scary. "1" constant is signed. So, if
> >>> log2_max_luma_coding_block_size is 31, the above logic has undefined
> >>> behavior. Different archs and C compilers may handle it on different
> >>> ways.
> >>
> >> I wasn't aware that it was the case, thanks for bringing this to light!
> >> I'll make it 1UL then.
> >>
> >>>> +#define VE_DEC_H265_LOW_ADDR_PRIMARY_CHROMA(a) \
> >>>> +	(((a) << 24) & GENMASK(31, 24))
> >>>
> >>> Same applies here and on other similar macros. You need to enforce
> >>> (a) to be unsigned, as otherwise the behavior is undefined.
> >>>
> >>> Btw, this is a recurrent pattern on this file. I would define a
> >>> macro, e. g. something like:
> >>>
> >>> 	#define MASK_BITS_AND_SHIFT(v, high, low) \
> >>> 		((UL(v) << low) & GENMASK(high, low))
> >>>
> >>> And use it for all similar patterns here.
> >>
> >> Sounds good! I find that the reverse wording (SHIFT_AND_MASK_BITS) wou=
ld be
> >> a bit more explicit since the shift happens prior to the mask.
> >=20
> > Apparently the UL(v) macro just appends UL to v in preprocessor, so it =
won't
> > work with anything else than direct integers.
> >=20
> > I'll replace it with a (unsigned long) cast, that seems to do the job.
>=20
> Shouldn't that be a (u32) cast? Since this is used with 32 bit registers?

This would work for cedrus, but I think that what Mauro had in mind was to
migrate this macro to linux/bits.h, where everthing else (including GENMASK)
is apparently defined in terms of unsigned long and not types with explicit
numbers of bits. So I find it more consistent to go with unsigned long.

In our case, 64-bit platforms that use cedrus would calculate the macro on
64 bits and use it in 32-bit variables. Since we're never masking beyond the
lower 32 bits, I don't see how things could go wrong and the situation looks
fairly similar to the use of GENMASK in similar conditions.

Does that sound right to you or am I missing something here?

Cheers,

Paul

> Regards,
>=20
> 	Hans
>=20
> >=20
> > Cheers,
> >=20
> > Paul
> >=20
> >> Also we probably need to have parenthesis around "low", right?
> >>
> >>> The best would be to include such macro at linux/bits.h, although some
> >>> upstream discussion is required.
> >>>
> >>> So, for now, let's add it at this header file, but work upstream
> >>> to have it merged there.
> >>
> >> Understood, I'll include it in that header for now and send a separate=
 patch
> >> for inclusion in linux/bits.h (apparently the preprocessor doesn't car=
e about
> >> redefinitions so we can just remove the cedrus fashion once the common=
 one is
> >> in).
> >>
> >> What do you think?
> >>
> >> Cheers,
> >>
> >> Paul
> >=20
> >=20
> >=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2vC7kACgkQ3cLmz3+f
v9FNWQf/VOFy2NcFFmeA6TWZfvyrkmu5obas+AFQpmgHiPdhg/5hxka22rig87Es
ZGJbCBBCOTKnxdGVp4TX+gNTWdHNuwcc3m61U50w6uNFaPnSHjraKEvt6A44rwoq
DyQA5JeBbyLpjKT6ceVhSl719jqnsNr3wel0zNo1rBLvyFRxZgvysWff3x3xAQQU
3+InsoB/T1C8tj1dMlS2okywVpeN8MfKcTX8Yfw3kubeULYM6gzoZ377Px6DMYmP
SpNlTYcYQIoIKni/pB8ji+BfisYqdcLBkVq37Y6vcTLWZmiF9bTfXylaTefEISaq
3Mss27y4ElhNhARIXlfxsz8Vn1Hrgw==
=VMbB
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
