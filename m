Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738E424A0B1
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 15:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgHSNyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 09:54:39 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:58809 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgHSNyh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 09:54:37 -0400
X-Originating-IP: 37.167.225.118
Received: from aptenodytes (unknown [37.167.225.118])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E69351BF207;
        Wed, 19 Aug 2020 13:54:31 +0000 (UTC)
Date:   Wed, 19 Aug 2020 15:54:30 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 08/14] media: uapi: h264: Drop SLICE_PARAMS 'size'
 field
Message-ID: <20200819135430.GA1566@aptenodytes>
References: <20200806151310.98624-1-ezequiel@collabora.com>
 <20200806151310.98624-9-ezequiel@collabora.com>
 <20200806155028.GB1621078@aptenodytes>
 <7e0ad157cabb656cbb4f24354146197e6a1d3f36.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <7e0ad157cabb656cbb4f24354146197e6a1d3f36.camel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 07 Aug 20, 11:44, Ezequiel Garcia wrote:
> On Thu, 2020-08-06 at 17:50 +0200, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > On Thu 06 Aug 20, 12:13, Ezequiel Garcia wrote:
> > > The SLICE_PARAMS control is intended for slice-based
> > > devices. In this mode, the OUTPUT buffer contains
> > > a single slice, and so the buffer's plane payload size
> > > can be used to query the slice size.
> >=20
> > If we later extend the API for supporting multiple slices with dynamic =
array
> > controls, I guess we'll need to know the size of each slice in each con=
trol
> > elements. So I'd rather keep that even if it's indeed redundant with
> > vb2_get_plane_payload in single-slice mode.
> >=20
>=20
> If we later extend the API, another control (possibly
> another decoding mode?) shall be introduced.
>=20
> This API covers single-slice-per-request as specified
> and documented in patch 9/14 "Clarify SLICE_BASED mode".
>=20
> This is along the lines of the proposal drafted by Nicolas,
> see my reply: https://lkml.org/lkml/2020/8/5/791.
>=20
> This applies to num_slices, slice size and slice start offset.
>=20
> There are multiple ways of doing this.

If feels a bit problematic to remove these fields without a clear plan yet
on how to support multiple slices in the future. These may need to be added
again later, except that it will be too late and new controls will need to =
be
introduced.

Also, could we consider adding more reserved fields to handle such future n=
eeds?

Cheers,

Paul

> Thanks!
> Ezequiel
>=20
> > What do you think?
> >=20
> > Paul
> >=20
> > > To reduce the API surface drop the size from the
> > > SLICE_PARAMS control.
> > >=20
> > > A follow-up change will remove other members in SLICE_PARAMS
> > > so we don't need to add padding fields here.
> > >=20
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 ---
> > >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c          | 7 +++----
> > >  include/media/h264-ctrls.h                                | 3 ---
> > >  3 files changed, 3 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rs=
t b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > index 427fc5727ec0..fff74b7bf32a 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > @@ -1760,9 +1760,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_t=
ype -
> > >      :stub-columns: 0
> > >      :widths:       1 1 2
> > > =20
> > > -    * - __u32
> > > -      - ``size``
> > > -      -
> > >      * - __u32
> > >        - ``start_byte_offset``
> > >          Offset (in bytes) from the beginning of the OUTPUT buffer to=
 the start
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drive=
rs/staging/media/sunxi/cedrus/cedrus_h264.c
> > > index a9ba78b15907..8b6f05aadbe8 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > @@ -324,17 +324,16 @@ static void cedrus_set_params(struct cedrus_ctx=
 *ctx,
> > >  	struct vb2_buffer *src_buf =3D &run->src->vb2_buf;
> > >  	struct cedrus_dev *dev =3D ctx->dev;
> > >  	dma_addr_t src_buf_addr;
> > > -	u32 len =3D slice->size * 8;
> > > +	size_t slice_bytes =3D vb2_get_plane_payload(src_buf, 0);
> > >  	unsigned int pic_width_in_mbs;
> > >  	bool mbaff_pic;
> > >  	u32 reg;
> > > =20
> > > -	cedrus_write(dev, VE_H264_VLD_LEN, len);
> > > +	cedrus_write(dev, VE_H264_VLD_LEN, slice_bytes * 8);
> > >  	cedrus_write(dev, VE_H264_VLD_OFFSET, 0);
> > > =20
> > >  	src_buf_addr =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > > -	cedrus_write(dev, VE_H264_VLD_END,
> > > -		     src_buf_addr + vb2_get_plane_payload(src_buf, 0));
> > > +	cedrus_write(dev, VE_H264_VLD_END, src_buf_addr + slice_bytes);
> > >  	cedrus_write(dev, VE_H264_VLD_ADDR,
> > >  		     VE_H264_VLD_ADDR_VAL(src_buf_addr) |
> > >  		     VE_H264_VLD_ADDR_FIRST | VE_H264_VLD_ADDR_VALID |
> > > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > > index 4f05ee265997..f74736fcfa00 100644
> > > --- a/include/media/h264-ctrls.h
> > > +++ b/include/media/h264-ctrls.h
> > > @@ -158,9 +158,6 @@ struct v4l2_h264_reference {
> > >  };
> > > =20
> > >  struct v4l2_ctrl_h264_slice_params {
> > > -	/* Size in bytes, including header */
> > > -	__u32 size;
> > > -
> > >  	/* Offset in bytes to the start of slice in the OUTPUT buffer. */
> > >  	__u32 start_byte_offset;
> > > =20
> > > --=20
> > > 2.27.0
> > >=20
>=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl89LxYACgkQ3cLmz3+f
v9GB7Af+O1VXFFUf17VH0ZXeDutPNZQWCi6axmysULlynDY5nLDwL9NyT6/L7AR5
/BobQWbWH6jIof9Dl4Nyx0vIIF21RYgzM2w8nlrevljVD2LE3WBkAgpOpy+EdE15
cZ0SiCHxDqppOTMyvNw1EcXtVjzsPWh4S1RBOK7HXgIfpKtS9CrMMPxdHYr5zzDi
PXKX5PFwRKgDUX+k5Hp8brZWOfevI++oKykt79IWR1m/3GU6nXapCLXH9XFT+7a5
OakiL5mv5Q6aYu/4vaNtvRj/HKMnyFFoRdGEWQfvtHmGGhAiLlrnjhkl1bAptvBs
/shTPMno3LLC/sgdI/DQSRyUJv7jZQ==
=xexO
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
