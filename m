Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59122A62B6
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgKDK41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:56:27 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:50757 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgKDK41 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:56:27 -0500
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id EB48C100004;
        Wed,  4 Nov 2020 10:56:19 +0000 (UTC)
Date:   Wed, 4 Nov 2020 11:56:19 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com,
        =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH 04/14] media: sun6i-csi: Fix the image storage bpp for
 10/12-bit Bayer formats
Message-ID: <20201104105619.GG285779@aptenodytes>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-5-paul.kocialkowski@bootlin.com>
 <60fc4f85-e08f-fec6-5687-005add5cbeed@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c7hkjup166d4FzgN"
Content-Disposition: inline
In-Reply-To: <60fc4f85-e08f-fec6-5687-005add5cbeed@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--c7hkjup166d4FzgN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Helen,

On Fri 30 Oct 20, 19:45, Helen Koike wrote:
> Hi Paul,
>=20
> On 10/23/20 2:45 PM, Paul Kocialkowski wrote:
> > Both 10 and 12-bit Bayer formats are stored aligned as 16-bit values
> > in memory, not unaligned 10 or 12 bits.
> >=20
> > Since the current code for retreiving the bpp is used only to
> > calculate the memory storage size of the picture (which is what
> > pixel formats describe, unlike media bus formats), fix it there.
> >=20
> > Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
> > Co-developed-by: K=C3=A9vin L'h=C3=B4pital <kevin.lhopital@bootlin.com>
> > Signed-off-by: K=C3=A9vin L'h=C3=B4pital <kevin.lhopital@bootlin.com>
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../platform/sunxi/sun6i-csi/sun6i_csi.h      | 20 +++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drive=
rs/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> > index c626821aaedb..7f2be70ae641 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> > @@ -86,7 +86,7 @@ void sun6i_csi_update_buf_addr(struct sun6i_csi *csi,=
 dma_addr_t addr);
> >   */
> >  void sun6i_csi_set_stream(struct sun6i_csi *csi, bool enable);
> > =20
> > -/* get bpp form v4l2 pixformat */
> > +/* get memory storage bpp from v4l2 pixformat */
> >  static inline int sun6i_csi_get_bpp(unsigned int pixformat)
> >  {
> >  	switch (pixformat) {
> > @@ -96,15 +96,6 @@ static inline int sun6i_csi_get_bpp(unsigned int pix=
format)
> >  	case V4L2_PIX_FMT_SRGGB8:
> >  	case V4L2_PIX_FMT_JPEG:
> >  		return 8;
> > -	case V4L2_PIX_FMT_SBGGR10:
> > -	case V4L2_PIX_FMT_SGBRG10:
> > -	case V4L2_PIX_FMT_SGRBG10:
> > -	case V4L2_PIX_FMT_SRGGB10:
> > -		return 10;
> > -	case V4L2_PIX_FMT_SBGGR12:
> > -	case V4L2_PIX_FMT_SGBRG12:
> > -	case V4L2_PIX_FMT_SGRBG12:
> > -	case V4L2_PIX_FMT_SRGGB12:
> >  	case V4L2_PIX_FMT_HM12:
> >  	case V4L2_PIX_FMT_NV12:
> >  	case V4L2_PIX_FMT_NV21:
> > @@ -121,6 +112,15 @@ static inline int sun6i_csi_get_bpp(unsigned int p=
ixformat)
> >  	case V4L2_PIX_FMT_RGB565:
> >  	case V4L2_PIX_FMT_RGB565X:
> >  		return 16;
> > +	case V4L2_PIX_FMT_SBGGR10:
> > +	case V4L2_PIX_FMT_SGBRG10:
> > +	case V4L2_PIX_FMT_SGRBG10:
> > +	case V4L2_PIX_FMT_SRGGB10:
> > +	case V4L2_PIX_FMT_SBGGR12:
> > +	case V4L2_PIX_FMT_SGBRG12:
> > +	case V4L2_PIX_FMT_SGRBG12:
> > +	case V4L2_PIX_FMT_SRGGB12:
> > +		return 16;
> >  	case V4L2_PIX_FMT_RGB24:
> >  	case V4L2_PIX_FMT_BGR24:
> >  		return 24;
> >=20
>=20
> Instead of updating this table, how about using v4l2_format_info() instea=
d?

Yes that would be a very good thing to do indeed!

Thanks,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--c7hkjup166d4FzgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+iiNMACgkQ3cLmz3+f
v9HFXAf+N1l+y0ROoaUymhgezNhzMtVA6+rT/3K27Nviyx+yotMuLRVQx9kOrRIu
NyOl92AbK3YHZoeBs3MG7x9K83Hg8jecHQfyWqXew7gsI5tzSwpkeUWJ4p3+BK3y
Nr5TAxlDgeGKsys/03OBVp2MPBQEuh3CG+vx+g6VV0/j/xu7sRpt1HvK+loqHDnr
pzTVenulCZlv5wpaO++e9qBlAJWT/dZ30dP89kjzmHg1ojS4gOwPK3n6urzvYYOL
HyRYUKHCTMrAqiA3Oc8NshO3drPft1zmByfbbbcwi1tSFJGwHX4le2ai6uJzME6M
mkdcnTQlloff4Y+k5HOQZpsbJtWchw==
=kPUg
-----END PGP SIGNATURE-----

--c7hkjup166d4FzgN--
