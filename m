Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6D32DEF1
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 15:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfE2NyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 09:54:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53170 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfE2NyS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 09:54:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id DCDC1260A4C
Message-ID: <4ef64e22f4035fccf09fbb7f0be04a9778b1230d.camel@collabora.com>
Subject: Re: [PATCH v6 03/16] media: v4l2-common: Support custom imagesize
 in fill_pixfmt()
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Date:   Wed, 29 May 2019 09:54:09 -0400
In-Reply-To: <20190529082809.0b9f3553@coco.lan>
References: <20190528170232.2091-1-ezequiel@collabora.com>
         <20190528170232.2091-4-ezequiel@collabora.com>
         <20190529082809.0b9f3553@coco.lan>
Organization: Collabora Ltd.
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-E3Gex8edDT193EfQlRr+"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-E3Gex8edDT193EfQlRr+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Le mercredi 29 mai 2019 =C3=A0 08:28 -0300, Mauro Carvalho Chehab a =C3=A9c=
rit :
> Em Tue, 28 May 2019 14:02:19 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
>=20
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >=20
> > Users can define custom sizeimage as long as they're big enough to
> > store the amount of pixels required for a specific width/height under a
> > specific format. Avoid overriding those fields in this case.
> >=20
> > We could possibly do the same for bytesperline, but it gets tricky when
> > dealing with !MPLANE definitions, so this case is omitted for now and
> > ->bytesperline is always overwritten with the value calculated in
> > fill_pixfmt().
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes from v5:
> > * Overwrite bytesperline with the value calculated in fill_pixfmt()
> >=20
> > Changes from v4:
> > * New patch
> >=20
> >  drivers/media/v4l2-core/v4l2-common.c | 58 ++++++++++++++++++++-------
> >  1 file changed, 43 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2=
-core/v4l2-common.c
> > index b2d1e55d9561..fd286f6e17d7 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -585,9 +585,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mpla=
ne *pixfmt,
> >  	pixfmt->num_planes =3D info->mem_planes;
> > =20
> >  	if (info->mem_planes =3D=3D 1) {
> > +		u32 sizeimage =3D 0;
> > +
> >  		plane =3D &pixfmt->plane_fmt[0];
> > -		plane->bytesperline =3D ALIGN(width, v4l2_format_block_width(info, 0=
)) * info->bpp[0];
> > -		plane->sizeimage =3D 0;
> > =20
> >  		for (i =3D 0; i < info->comp_planes; i++) {
> >  			unsigned int hdiv =3D (i =3D=3D 0) ? 1 : info->hdiv;
> > @@ -598,10 +598,21 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mp=
lane *pixfmt,
> >  			aligned_width =3D ALIGN(width, v4l2_format_block_width(info, i));
> >  			aligned_height =3D ALIGN(height, v4l2_format_block_height(info, i))=
;
> > =20
> > -			plane->sizeimage +=3D info->bpp[i] *
> > -				DIV_ROUND_UP(aligned_width, hdiv) *
> > -				DIV_ROUND_UP(aligned_height, vdiv);
> > +			sizeimage +=3D info->bpp[i] *
> > +				     DIV_ROUND_UP(aligned_width, hdiv) *
> > +				     DIV_ROUND_UP(aligned_height, vdiv);
> >  		}
> > +
> > +		/* Custom bytesperline value is not supported yet. */
> > +		plane->bytesperline =3D ALIGN(width,
> > +					    v4l2_format_block_width(info, 0)) *
> > +				      info->bpp[0];
> > +
> > +		/*
> > +		 * The user might have specified a custom sizeimage, only
> > +		 * override it if it's not big enough.
> > +		 */
> > +		plane->sizeimage =3D max(sizeimage, plane->sizeimage);
>=20
> No upper limit? That doesn't sound a good idea to me, specially since som=
e
> (broken) app might not be memset the format to zero before filling the io=
ctl
> structure.
>=20
> Perhaps we could do something like:
>=20
> 		sizeimage =3D min (sizeimage, 2 * plane->sizeimage)
>=20
> or something similar that would be reasonable.
>=20
> >  	} else {
> >  		for (i =3D 0; i < info->comp_planes; i++) {
> >  			unsigned int hdiv =3D (i =3D=3D 0) ? 1 : info->hdiv;
> > @@ -613,10 +624,19 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mp=
lane *pixfmt,
> >  			aligned_height =3D ALIGN(height, v4l2_format_block_height(info, i))=
;
> > =20
> >  			plane =3D &pixfmt->plane_fmt[i];
> > -			plane->bytesperline =3D
> > -				info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv);
> > -			plane->sizeimage =3D
> > -				plane->bytesperline * DIV_ROUND_UP(aligned_height, vdiv);
> > +
> > +			/* Custom bytesperline value is not supported yet. */
>=20
> Supporting custom bytesperline seems too risky of breaking apps.=20
> So, I would drop this comment.

We will really need this in the long run in many drivers in order to
allow import/export of DMABuf. Without such adaptive feature, we have a
software limitation that forces bouncing memory. I have already
discussed about adding this feature notably in vivid and uvcvideo on
IRC and in conference, which both have no restriction the memory
alignment, so should allow importing any kind of video layout.

We already have a partial userspace implementation for this in
GStreamer and upstream driver submission should come when the IP is
considered stable enough.

Why I think it won't break userspace is that the correct way to use
these read-only members of V4L2 struct is to set these to 0, which is
also documented.

Adding upper bound seems like a good idea though.

>=20
>=20
> > +			plane->bytesperline =3D info->bpp[i] *
> > +					      DIV_ROUND_UP(aligned_width, hdiv);
> > +
> > +			/*
> > +			 * The user might have specified a custom sizeimage,
> > +			 * only override it if it's not big enough.
> > +			 */
> > +			plane->sizeimage =3D max_t(u32,
> > +						 plane->bytesperline *
> > +						 DIV_ROUND_UP(aligned_height, vdiv),
> > +						 plane->sizeimage);
> >  		}
> >  	}
> >  	return 0;
> > @@ -627,6 +647,7 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt=
, u32 pixelformat,
> >  		     u32 width, u32 height)
> >  {
> >  	const struct v4l2_format_info *info;
> > +	u32 sizeimage =3D 0;
> >  	int i;
> > =20
> >  	info =3D v4l2_format_info(pixelformat);
> > @@ -640,8 +661,6 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt=
, u32 pixelformat,
> >  	pixfmt->width =3D width;
> >  	pixfmt->height =3D height;
> >  	pixfmt->pixelformat =3D pixelformat;
> > -	pixfmt->bytesperline =3D ALIGN(width, v4l2_format_block_width(info, 0=
)) * info->bpp[0];
> > -	pixfmt->sizeimage =3D 0;
> > =20
> >  	for (i =3D 0; i < info->comp_planes; i++) {
> >  		unsigned int hdiv =3D (i =3D=3D 0) ? 1 : info->hdiv;
> > @@ -651,11 +670,20 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixf=
mt, u32 pixelformat,
> > =20
> >  		aligned_width =3D ALIGN(width, v4l2_format_block_width(info, i));
> >  		aligned_height =3D ALIGN(height, v4l2_format_block_height(info, i));
> > -
> > -		pixfmt->sizeimage +=3D info->bpp[i] *
> > -			DIV_ROUND_UP(aligned_width, hdiv) *
> > -			DIV_ROUND_UP(aligned_height, vdiv);
> > +		sizeimage +=3D info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv) *
> > +			     DIV_ROUND_UP(aligned_height, vdiv);
> >  	}
> > +
> > +	/* Custom bytesperline value is not supported yet. */
> > +	pixfmt->bytesperline =3D ALIGN(width, v4l2_format_block_width(info, 0=
)) *
> > +			       info->bpp[0];
> > +
> > +	/*
> > +	 * The user might have specified its own sizeimage value, only overri=
de
> > +	 * it if it's not big enough.
> > +	 */
> > +	pixfmt->sizeimage =3D max(sizeimage, pixfmt->sizeimage);
> > +
>=20
> Same comment applies here: We need to sanitize it from too big sizeimages=
.
>=20
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
>=20
>=20
> Thanks,
> Mauro

--=-E3Gex8edDT193EfQlRr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXO6PAgAKCRBxUwItrAao
HGtVAJ0UVWNP/Lu2BV7o9LxtE4ppAOpZNgCgh5CfgIkF8yo5UMyINC3vVycN1CE=
=gfX9
-----END PGP SIGNATURE-----

--=-E3Gex8edDT193EfQlRr+--

