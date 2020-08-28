Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31E6255C44
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 16:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgH1OVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 10:21:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41366 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgH1OVW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 10:21:22 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id F3AA629AEA9
Message-ID: <acb8d609f1afff6b24210426baaf4fe52dc6f4ee.camel@collabora.com>
Subject: Re: [PATCH v2 08/14] media: uapi: h264: Drop SLICE_PARAMS 'size'
 field
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Date:   Fri, 28 Aug 2020 10:21:15 -0400
In-Reply-To: <bac2020eabb375a6c9dbc689c0c5a3f6eae16e1e.camel@collabora.com>
References: <20200806151310.98624-1-ezequiel@collabora.com>
         <20200806151310.98624-9-ezequiel@collabora.com>
         <20200806155028.GB1621078@aptenodytes>
         <7e0ad157cabb656cbb4f24354146197e6a1d3f36.camel@collabora.com>
         <20200819135430.GA1566@aptenodytes>
         <bac2020eabb375a6c9dbc689c0c5a3f6eae16e1e.camel@collabora.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-485015CwXDZx+PUjo0EI"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-485015CwXDZx+PUjo0EI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 20 ao=C3=BBt 2020 =C3=A0 04:32 -0300, Ezequiel Garcia a =C3=A9crit=
 :
> Hi Paul,
>=20
> On Wed, 2020-08-19 at 15:54 +0200, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > On Fri 07 Aug 20, 11:44, Ezequiel Garcia wrote:
> > > On Thu, 2020-08-06 at 17:50 +0200, Paul Kocialkowski wrote:
> > > > Hi,
> > > >=20
> > > > On Thu 06 Aug 20, 12:13, Ezequiel Garcia wrote:
> > > > > The SLICE_PARAMS control is intended for slice-based
> > > > > devices. In this mode, the OUTPUT buffer contains
> > > > > a single slice, and so the buffer's plane payload size
> > > > > can be used to query the slice size.
> > > >=20
> > > > If we later extend the API for supporting multiple slices with dyna=
mic array
> > > > controls, I guess we'll need to know the size of each slice in each=
 control
> > > > elements. So I'd rather keep that even if it's indeed redundant wit=
h
> > > > vb2_get_plane_payload in single-slice mode.
> > > >=20
> > >=20
> > > If we later extend the API, another control (possibly
> > > another decoding mode?) shall be introduced.
> > >=20
> > > This API covers single-slice-per-request as specified
> > > and documented in patch 9/14 "Clarify SLICE_BASED mode".
> > >=20
> > > This is along the lines of the proposal drafted by Nicolas,
> > > see my reply: https://lkml.org/lkml/2020/8/5/791.
> > >=20
> > > This applies to num_slices, slice size and slice start offset.
> > >=20
> > > There are multiple ways of doing this.
> >=20
> > If feels a bit problematic to remove these fields without a clear plan =
yet
> > on how to support multiple slices in the future. These may need to be a=
dded
> > again later, except that it will be too late and new controls will need=
 to be
> > introduced.
> >=20
>=20
> As Nicolas and I have repeatedly mentioned we do have a plan :)
>=20
> Nothing prevents us from implementing this now, but since it seems
> we don't have any need since the 1-slice-per-buffer is working well,
> there is no motivation for it.
>=20
> As you well mention, it does require new controls. This is
> totally expected since new decoding semantics will need new controls.
>=20
> Here's my version of the plan:
>=20
> enum v4l2_mpeg_video_h264_decode_mode {
>         V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
>         V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_ARRAY_BASED,
>         V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
> };
>=20
> #define V4L2_CID_MPEG_VIDEO_H264_SLICE_ARRAY    (V4L2_CID_MPEG_BASE+1008)
>=20
> struct v4l2_ctrl_h264_slice_array {
>         __u16 num_slices;
>=20
>         struct v4l2_ctrl_h264_slice slices[16];
> }

Well, ideally the new dynamic array control format can hold this
information for us, avoiding the 16 slice limit again, but that is
inded the plan.

>=20
> struct v4l2_ctrl_h264_slice {
>         __u32 size;
>         __u32 start_byte_offset;
>         struct v4l2_ctrl_h264_slice_params params;
> }
>=20
> Now, the _specific_ way this will be done is not under
> discussion at the moment.
>=20
> > Also, could we consider adding more reserved fields to handle such futu=
re needs?
> >=20
>=20
> I have considered that (on each control), but I fail
> to see the reason for it. The same may be said of all controls,
> yet I don't think we bloat each one just in case.=20
>=20
> Thanks,
> Ezequiel
>=20
> > Cheers,
> >=20
> > Paul
> >=20
> > > Thanks!
> > > Ezequiel
> > >=20
> > > > What do you think?
> > > >=20
> > > > Paul
> > > >=20
> > > > > To reduce the API surface drop the size from the
> > > > > SLICE_PARAMS control.
> > > > >=20
> > > > > A follow-up change will remove other members in SLICE_PARAMS
> > > > > so we don't need to add padding fields here.
> > > > >=20
> > > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > ---
> > > > >  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 --=
-
> > > > >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c          | 7 ++=
+----
> > > > >  include/media/h264-ctrls.h                                | 3 --=
-
> > > > >  3 files changed, 3 insertions(+), 10 deletions(-)
> > > > >=20
> > > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-code=
c.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > > index 427fc5727ec0..fff74b7bf32a 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > > @@ -1760,9 +1760,6 @@ enum v4l2_mpeg_video_h264_hierarchical_codi=
ng_type -
> > > > >      :stub-columns: 0
> > > > >      :widths:       1 1 2
> > > > > =20
> > > > > -    * - __u32
> > > > > -      - ``size``
> > > > > -      -
> > > > >      * - __u32
> > > > >        - ``start_byte_offset``
> > > > >          Offset (in bytes) from the beginning of the OUTPUT buffe=
r to the start
> > > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/d=
rivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > index a9ba78b15907..8b6f05aadbe8 100644
> > > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > @@ -324,17 +324,16 @@ static void cedrus_set_params(struct cedrus=
_ctx *ctx,
> > > > >  	struct vb2_buffer *src_buf =3D &run->src->vb2_buf;
> > > > >  	struct cedrus_dev *dev =3D ctx->dev;
> > > > >  	dma_addr_t src_buf_addr;
> > > > > -	u32 len =3D slice->size * 8;
> > > > > +	size_t slice_bytes =3D vb2_get_plane_payload(src_buf, 0);
> > > > >  	unsigned int pic_width_in_mbs;
> > > > >  	bool mbaff_pic;
> > > > >  	u32 reg;
> > > > > =20
> > > > > -	cedrus_write(dev, VE_H264_VLD_LEN, len);
> > > > > +	cedrus_write(dev, VE_H264_VLD_LEN, slice_bytes * 8);
> > > > >  	cedrus_write(dev, VE_H264_VLD_OFFSET, 0);
> > > > > =20
> > > > >  	src_buf_addr =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > > > > -	cedrus_write(dev, VE_H264_VLD_END,
> > > > > -		     src_buf_addr + vb2_get_plane_payload(src_buf, 0));
> > > > > +	cedrus_write(dev, VE_H264_VLD_END, src_buf_addr + slice_bytes);
> > > > >  	cedrus_write(dev, VE_H264_VLD_ADDR,
> > > > >  		     VE_H264_VLD_ADDR_VAL(src_buf_addr) |
> > > > >  		     VE_H264_VLD_ADDR_FIRST | VE_H264_VLD_ADDR_VALID |
> > > > > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrl=
s.h
> > > > > index 4f05ee265997..f74736fcfa00 100644
> > > > > --- a/include/media/h264-ctrls.h
> > > > > +++ b/include/media/h264-ctrls.h
> > > > > @@ -158,9 +158,6 @@ struct v4l2_h264_reference {
> > > > >  };
> > > > > =20
> > > > >  struct v4l2_ctrl_h264_slice_params {
> > > > > -	/* Size in bytes, including header */
> > > > > -	__u32 size;
> > > > > -
> > > > >  	/* Offset in bytes to the start of slice in the OUTPUT buffer. =
*/
> > > > >  	__u32 start_byte_offset;
> > > > > =20
> > > > > --=20
> > > > > 2.27.0
> > > > >=20
>=20
>=20

--=-485015CwXDZx+PUjo0EI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCX0kS2wAKCRBxUwItrAao
HA+PAJ40zmDEHTQHb5bgzxTtD4phCzBFBwCfff3ISQE0jFzkKpzRMfQsoyD3b70=
=JV5A
-----END PGP SIGNATURE-----

--=-485015CwXDZx+PUjo0EI--

