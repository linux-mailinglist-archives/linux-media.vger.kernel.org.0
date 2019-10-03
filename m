Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6B00CB12B
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 23:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732268AbfJCVcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 17:32:24 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40873 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728763AbfJCVcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 17:32:24 -0400
X-Originating-IP: 132.205.230.8
Received: from aptenodytes (unknown [132.205.230.8])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3AAE260004;
        Thu,  3 Oct 2019 21:32:20 +0000 (UTC)
Date:   Thu, 3 Oct 2019 17:32:18 -0400
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: cedrus: Fix H264 default reference index
 count
Message-ID: <20191003213218.GE3927@aptenodytes>
References: <20191002193553.1633467-1-jernej.skrabec@siol.net>
 <3413755.LxPTGpI9pz@jernej-laptop>
 <20191003205857.GA3927@aptenodytes>
 <1700094.IKIOnZr010@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PGNNI9BzQDUtgA2J"
Content-Disposition: inline
In-Reply-To: <1700094.IKIOnZr010@jernej-laptop>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--PGNNI9BzQDUtgA2J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 03 Oct 19, 23:19, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 03. oktober 2019 ob 22:58:57 CEST je Paul Kocialkowski=
=20
> napisal(a):
> > Hi,
> >=20
> > On Thu 03 Oct 19, 22:44, Jernej =C5=A0krabec wrote:
> > > Dne =C4=8Detrtek, 03. oktober 2019 ob 22:28:46 CEST je Paul Kocialkow=
ski
> > >=20
> > > napisal(a):
> > > > Hi,
> > > >=20
> > > > On Thu 03 Oct 19, 07:16, Jernej =C5=A0krabec wrote:
> > > > > Dne =C4=8Detrtek, 03. oktober 2019 ob 00:06:50 CEST je Paul Kocia=
lkowski
> > > > >=20
> > > > > napisal(a):
> > > > > > Hi,
> > > > > >=20
> > > > > > On Wed 02 Oct 19, 21:35, Jernej Skrabec wrote:
> > > > > > > Reference index count in VE_H264_PPS should come from PPS con=
trol.
> > > > > > > However, this is not really important, because reference index
> > > > > > > count
> > > > > > > is
> > > > > > > in our case always overridden by that from slice header.
> > > > > >=20
> > > > > > Thanks for the fixup!
> > > > > >=20
> > > > > > Our libva userspace and v4l2-request testing tool currently don=
't
> > > > > > provide
> > > > > > this, but I have a pending merge request adding it for the hant=
ro so
> > > > > > it's
> > > > > > good to go.
> > > > >=20
> > > > > Actually, I think this is just cosmetic and it would work even if=
 it
> > > > > would
> > > > > be always 0. We always override this number in SHS2 register with
> > > > > VE_H264_SHS2_NUM_REF_IDX_ACTIVE_OVRD flag and recently there was a
> > > > > patch
> > > > > merged to clarify that value in slice parameters should be the one
> > > > > that's
> > > > > set on default value if override flag is not set in bitstream:
> > > > > https://git.linuxtv.org/media_tree.git/commit/?
> > > > > id=3D187ef7c5c78153acdce8c8714e5918b1018c710b
> > > > >=20
> > > > > Well, we could always compare default and value in slice paramete=
rs,
> > > > > but I
> > > > > really don't see the benefit of doing that extra work.
> > > >=20
> > > > Thanks for the detailed explanation! So I just realized that for HE=
VC, I
> > > > didn't even include the default value in PPS and only went for the
> > > > per-slice value. The HEVC hardware block apparently only needs the
> > > > fields
> > > > once at slice level, and by looking at the spec, only one of the tw=
o set
> > > > of
> > > > fields will be used.
> > > >=20
> > > > So perhaps we could do the same for H.264 and only have the set of
> > > > fields
> > > > once in the slice params, so that both codecs are consistent. Users=
pace
> > > > can
> > > > just check the flag to know whether it should put the PPS default or
> > > > slice-specific value in the slice-specific control.
> > > >=20
> > > > What do you think?
> > >=20
> > > I think that there would be less confusion if only value in slice par=
ams
> > > would exists. But since Philipp rather made clarification in
> > > documentation, maybe he sees benefit having both values?
> >=20
> > Actually I just caught up with the discussion from thread:
> > media: uapi: h264: Add num_ref_idx_active_override_flag
> >=20
> > which explains that we need to pass the default fields for hardware that
> > parses the slice header itself and we need the non-default fields and f=
lag
> > for other cases.
> >=20
> > To cover the case of hardware that does slice header parsing, I guess it
> > would also work to use the slice-specific values in place of the pps
> > default values in the hardware register for that. But it feels quite
> > confusing and a lot less straightforward than having all the fields and=
 the
> > override flag exposed.
>=20
> I wasn't aware of that patch and related discussion. Ok, so it make sense=
 to=20
> have both values. However, does it make sense to use default values in Ce=
drus?

Well, since the hardware exposes fields for both and the flag for H264, let=
's do
the straightforward thing and just pass the values through, even though we =
can
easily predict which will get used in the end.

For HEVC, we'll just have to check for the flag and put the right set of va=
lues
in the slice-specific register.

> > So I think I should fix HEVC support accordingly, just in case the same
> > situation arises for HEVC.
>=20
> Seems reasonable. Does that mean there will be another revision of HEVC=
=20
> patches?  If so, I think slice_segment_addr should also be included in sl=
ice=20
> params, so multi-slice frames can be supported at later time.

I would be in favor of fixing this as a follow-up patch instead, so that we
don't delay getting the series in. As you said, more work will be needed an=
yway
for multi-slice support, so I don't see the point of holding the series for=
 this
particular improvment.

Cheers,

Paul

> Best regards,
> Jernej=20
>=20
> >=20
> > Cheers,
> >=20
> > Paul
> >=20
> > > Best regards,
> > > Jernej
> > >=20
> > > > Cheers,
> > > >=20
> > > > Paul
> > > >=20
> > > > > Best regards,
> > > > > Jernej
> > > > >=20
> > > > > > Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > >=20
> > > > > > Cheers,
> > > > > >=20
> > > > > > Paul
> > > > > >=20
> > > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > > ---
> > > > > > >=20
> > > > > > >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++------
> > > > > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > > > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c index
> > > > > > > bd848146eada..4a0e69855c7f 100644
> > > > > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > > > @@ -364,12 +364,8 @@ static void cedrus_set_params(struct
> > > > > > > cedrus_ctx
> > > > > > > *ctx,
> > > > > > >=20
> > > > > > >  	// picture parameters
> > > > > > >  	reg =3D 0;
> > > > > > >=20
> > > > > > > -	/*
> > > > > > > -	 * FIXME: the kernel headers are allowing the default value=
 to
> > > > > > > -	 * be passed, but the libva doesn't give us that.
> > > > > > > -	 */
> > > > > > > -	reg |=3D (slice->num_ref_idx_l0_active_minus1 & 0x1f) << 10;
> > > > > > > -	reg |=3D (slice->num_ref_idx_l1_active_minus1 & 0x1f) << 5;
> > > > > > > +	reg |=3D (pps->num_ref_idx_l0_default_active_minus1 & 0x1f)=
 << 10;
> > > > > > > +	reg |=3D (pps->num_ref_idx_l1_default_active_minus1 & 0x1f)=
 << 5;
> > > > > > >=20
> > > > > > >  	reg |=3D (pps->weighted_bipred_idc & 0x3) << 2;
> > > > > > >  	if (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE)
> > > > > > >  =09
> > > > > > >  		reg |=3D VE_H264_PPS_ENTROPY_CODING_MODE;
>=20
>=20
>=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--PGNNI9BzQDUtgA2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2WaOIACgkQ3cLmz3+f
v9EA+wf/ekHmBtBvJhAORdriiY5xvorCVVe+x97wAdmtuicrv64I/52a//PGeOiX
DB3hlBjSls/SdNhoIFYMTbBay5hGl8ZFxsdHgyFfZ5QztP14XWJJMzTwIXDbCFCc
kWpU8tJopeAyrcW/o81oWyXaI+1DcyF/2mXjv7gjSZ4cbe1w+5jnE36/rsG7wr+L
V0zlBxjFfDnRLIpLH3NqNCJXHyrcsL6wc9coGPdBd5olAzXk0Y9cCW7zoJ+V8aFi
agpE8vHT4/FPinNdKGQ1vtfHiJ6pR8cHQ+skBoEmjvESCbOaIHGKiHmVnOW5AINR
Z7R/MDMbE3GjMMiYfltNPKDgU+aOgA==
=Uw7X
-----END PGP SIGNATURE-----

--PGNNI9BzQDUtgA2J--
