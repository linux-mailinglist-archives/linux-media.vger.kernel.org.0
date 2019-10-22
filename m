Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0A4E006A
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 11:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731409AbfJVJKH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 05:10:07 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:38983 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731346AbfJVJKH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 05:10:07 -0400
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0BF77240016;
        Tue, 22 Oct 2019 09:10:02 +0000 (UTC)
Date:   Tue, 22 Oct 2019 11:10:02 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: cedrus: Fix decoding for some H264 videos
Message-ID: <20191022091002.GC2651@aptenodytes>
References: <20191002193553.1633467-1-jernej.skrabec@siol.net>
 <20191002193553.1633467-2-jernej.skrabec@siol.net>
 <20191002215442.GA24151@aptenodytes>
 <1916783.jTTlJIDQL9@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline
In-Reply-To: <1916783.jTTlJIDQL9@jernej-laptop>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 15 Oct 19, 19:16, Jernej =C5=A0krabec wrote:
> Please understand that I was working on this on and off for almost half a=
 year=20
> and checked many times all register values. At one point I tried libvdpau-
> sunxi which has no problem with sample video.  Still, all relevant regist=
er=20
> values were the same. In a desperate attempt, I tried with HW header pars=
ing=20
> which magically solved the issue. After that, I reused values provided in=
=20
> controls and then finally I made minimal solution as suggested in this pa=
tch.=20

Okay thanks for the details.

I think I've delayed this for far too long already so I think we should get=
 it
in without further delay.

The patch apparently no longer applies on top of media/master, but feel free
to send out a rebased series with:

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Let's leave out 2/3 though, I think I will submit a series adding the flag
as indication for the per-slice value in the uAPI and use it in cedrus.

Cheers,

Paul

> >=20
> > I could try and have a look if you have an available sample for testing=
 the
> > erroneous case!
>=20
> Of course: http://jernej.libreelec.tv/videos/h264/test.mkv
>=20
> >=20
> > Another minor thing: do you have some idea of whether the udelay call a=
dds
> > significant delay in the process?
>=20
> I didn't notice any issue with it. Do you have any better idea? I just di=
dn't=20
> want to make empty loop and udelay is the shortest delay that is provided=
 by=20
> the kernel API.
>=20
> Best regards,
> Jernej
>=20
> >=20
> > Cheers and thanks for the patch!
> >=20
> > Paul
> >=20
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > >=20
> > >  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 30 +++++++++++++++++=
--
> > >  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  3 ++
> > >  2 files changed, 30 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c index
> > > d6a782703c9b..bd848146eada 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > @@ -6,6 +6,7 @@
> > >=20
> > >   * Copyright (c) 2018 Bootlin
> > >   */
> > >=20
> > > +#include <linux/delay.h>
> > >=20
> > >  #include <linux/types.h>
> > > =20
> > >  #include <media/videobuf2-dma-contig.h>
> > >=20
> > > @@ -289,6 +290,28 @@ static void cedrus_write_pred_weight_table(struct
> > > cedrus_ctx *ctx,>=20
> > >  	}
> > > =20
> > >  }
> > >=20
> > > +/*
> > > + * It turns out that using VE_H264_VLD_OFFSET to skip bits is not
> > > reliable. In + * rare cases frame is not decoded correctly. However,
> > > setting offset to 0 and + * skipping appropriate amount of bits with
> > > flush bits trigger always works. + */
> > > +static void cedrus_skip_bits(struct cedrus_dev *dev, int num)
> > > +{
> > > +	int count =3D 0;
> > > +
> > > +	while (count < num) {
> > > +		int tmp =3D min(num - count, 32);
> > >=20
> > > +
> > > +		cedrus_write(dev, VE_H264_TRIGGER_TYPE,
> > > +			     VE_H264_TRIGGER_TYPE_FLUSH_BITS |
> > > +			     VE_H264_TRIGGER_TYPE_N_BITS(tmp));
> > > +		while (cedrus_read(dev, VE_H264_STATUS) &=20
> VE_H264_STATUS_VLD_BUSY)
> > > +			udelay(1);
> > > +
> > > +		count +=3D tmp;
> > > +	}
> > > +}
> > > +
> > >=20
> > >  static void cedrus_set_params(struct cedrus_ctx *ctx,
> > > =20
> > >  			      struct cedrus_run *run)
> > > =20
> > >  {
> > >=20
> > > @@ -299,12 +322,11 @@ static void cedrus_set_params(struct cedrus_ctx
> > > *ctx,
> > >=20
> > >  	struct vb2_buffer *src_buf =3D &run->src->vb2_buf;
> > >  	struct cedrus_dev *dev =3D ctx->dev;
> > >  	dma_addr_t src_buf_addr;
> > >=20
> > > -	u32 offset =3D slice->header_bit_size;
> > > -	u32 len =3D (slice->size * 8) - offset;
> > > +	u32 len =3D slice->size * 8;
> > >=20
> > >  	u32 reg;
> > >  =09
> > >  	cedrus_write(dev, VE_H264_VLD_LEN, len);
> > >=20
> > > -	cedrus_write(dev, VE_H264_VLD_OFFSET, offset);
> > > +	cedrus_write(dev, VE_H264_VLD_OFFSET, 0);
> > >=20
> > >  	src_buf_addr =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > >  	cedrus_write(dev, VE_H264_VLD_END,
> > >=20
> > > @@ -323,6 +345,8 @@ static void cedrus_set_params(struct cedrus_ctx *=
ctx,
> > >=20
> > >  	cedrus_write(dev, VE_H264_TRIGGER_TYPE,
> > >  =09
> > >  		     VE_H264_TRIGGER_TYPE_INIT_SWDEC);
> > >=20
> > > +	cedrus_skip_bits(dev, slice->header_bit_size);
> > > +
> > >=20
> > >  	if (((pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED) &&
> > >  =09
> > >  	     (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_P ||
> > >  	    =20
> > >  	      slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_SP)) ||
> > >=20
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h index
> > > 3329f9aaf975..b52926a54025 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > > @@ -538,13 +538,16 @@
> > >=20
> > >  					=20
> VE_H264_CTRL_SLICE_DECODE_INT)
> > > =20
> > >  #define VE_H264_TRIGGER_TYPE		0x224
> > >=20
> > > +#define VE_H264_TRIGGER_TYPE_N_BITS(x)		(((x) & 0x3f) << 8)
> > >=20
> > >  #define VE_H264_TRIGGER_TYPE_AVC_SLICE_DECODE	(8 << 0)
> > >  #define VE_H264_TRIGGER_TYPE_INIT_SWDEC		(7 << 0)
> > >=20
> > > +#define VE_H264_TRIGGER_TYPE_FLUSH_BITS		(3 << 0)
> > >=20
> > >  #define VE_H264_STATUS			0x228
> > >  #define VE_H264_STATUS_VLD_DATA_REQ_INT	=09
> VE_H264_CTRL_VLD_DATA_REQ_INT
> > >  #define VE_H264_STATUS_DECODE_ERR_INT	=09
> VE_H264_CTRL_DECODE_ERR_INT
> > >  #define VE_H264_STATUS_SLICE_DECODE_INT	=09
> VE_H264_CTRL_SLICE_DECODE_INT
> > >=20
> > > +#define VE_H264_STATUS_VLD_BUSY			BIT(8)
> > >=20
> > >  #define VE_H264_STATUS_INT_MASK		=09
> VE_H264_CTRL_INT_MASK
>=20
>=20
>=20
>=20

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2ux2oACgkQ3cLmz3+f
v9GxNggAoUPhMks1m1yhI9h7qrbOWuYWwl/SbtO4mnSw6R/3aI6fsdBfNqwnS9lI
kFIGM1gxkSOjPbgQ0b2U/h1EXCF1OwymUilB9PBVDB1UpaXsKFqDsYpWFVSX8XAC
BfLuPBNd0SHD+/eS8GMgjAsNbdoTk/cArdrPI6minSnan13GEzaQ43do9VU8rZL+
Ti24S9Jx8Nr/Y+8Xsk42FyDBElBQdb0MO11QRqIsJ43TJJ9GeWG528T9bWzmCZyV
Egh6MMu2T4FPWeQ7iTB4DctCGZR1RhxuvF9V45WHFBDmaExEx4Rq24ixXX4X/2pv
wfmqLhGApSVGcd3OMEmwpwj//gVE/g==
=PWnD
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
