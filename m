Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3323620A445
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 19:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406923AbgFYRrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 13:47:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39174 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405557AbgFYRrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 13:47:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 5A28E2A577F
Message-ID: <1d82609d56690b64d42bf240defb311ca4fa6460.camel@collabora.com>
Subject: Re: [RFC 2/7] fixup! media: uapi: h264: update reference lists
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu, 25 Jun 2020 13:47:35 -0400
In-Reply-To: <e477f42cd537c6e6e1f707492f6ad8ab6a510e3a.camel@collabora.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
         <20200623182809.1375-3-ezequiel@collabora.com>
         <27c646c790d6b00b29f4a61c58eb761ceb56179a.camel@collabora.com>
         <e477f42cd537c6e6e1f707492f6ad8ab6a510e3a.camel@collabora.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-bs57yxDa808qws5WWLRs"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-bs57yxDa808qws5WWLRs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 25 juin 2020 =C3=A0 14:42 -0300, Ezequiel Garcia a =C3=A9crit :
> (Adding Jernej, seems I haven't Cced him!)
>=20
> On Thu, 2020-06-25 at 10:53 -0400, Nicolas Dufresne wrote:
> > Le mardi 23 juin 2020 =C3=A0 15:28 -0300, Ezequiel Garcia a =C3=A9crit =
:
> > > Align v4l2_h264_reference to 32-bits, giving some room
> > > for future extensions.
> > >=20
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  .../userspace-api/media/v4l/ext-ctrls-codec.rst  |  3 +++
> > >  drivers/media/v4l2-core/v4l2-ctrls.c             | 16 ++++++++++++++=
++
> > >  include/media/h264-ctrls.h                       |  7 +++++--
> > >  3 files changed, 24 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rs=
t b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > index 6c36d298db20..7af12447a5b0 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > @@ -1943,6 +1943,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_t=
ype -
> > >      * - __u8
> > >        - ``index``
> > >        -
> > > +    * - __u32
> > > +      - ``reserved``
> > > +      - Applications and drivers must set this to zero.
> >=20
> > Is that really appropriate ? There was some effort to keep the controls
> > small. Also, as these are fixed size, they could be extended with
> > supplementary C arrays of the same size, set in separate control.
> >=20
>=20
> That's a very valid concern.
>=20
> Currently, each of these v4l2_h264_reference take 64 bytes
> (32 x 2 bytes). So it's 128 bytes of references.
>=20
> Having the reserved field means 256 bytes instead.
>=20
> Without the reserved field v4l2_ctrl_h264_slice_params is 936 bytes,
> the majority of the space taken by v4l2_h264_weight_factors.
> So, the reserved field accounts for a small increment there.
>=20
> Another option would be to split the v4l2_h264_reference lists
> to its own control.
>=20
> However, given the above, it would have more impact to consider
> splitting v4l2_h264_pred_weight_table. This table
> being used or not depends on the bitstream, so there might be
> some value here.
>=20
> What do you think?=20

This seems like a good idea, making the weight table it's own control,
so when the it's not specified in the syntax, we could skip.

>=20
> > Also, H264 HW is unlikely to evolve, and that covers what DXVA2 and
> > VAAPI covers already. So it is quite unlikely to ever have to be
> > extended.
> >=20
>=20
> That may be true indeed. Perhaps we can then agree that references
> only need an index and a flag.

I also see that MVC was never implemented in FFMPEG, I was quite
surprised. Only left eye playback is there, same in gstreamer-vaapi. It
leaves me thinking that all this complexity wasn't wanted. A lot of
stereo movie just make a larger, or higher image to fit the views.

>=20
> Thanks!
> Ezequiel
>=20
> > > =20
> > >  .. _h264_reference_flags:
> > > =20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l=
2-core/v4l2-ctrls.c
> > > index 3f3fbcd60cc6..6abd023f10c7 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > @@ -1721,6 +1721,8 @@ static void std_log(const struct v4l2_ctrl *ctr=
l)
> > > =20
> > >  #define zero_padding(s) \
> > >  	memset(&(s).padding, 0, sizeof((s).padding))
> > > +#define zero_reserved(s) \
> > > +	memset(&(s).reserved, 0, sizeof((s).reserved))
> > > =20
> > >  /*
> > >   * Compound controls validation requires setting unused fields/flags=
 to zero
> > > @@ -1731,6 +1733,7 @@ static int std_validate_compound(const struct v=
4l2_ctrl *ctrl, u32 idx,
> > >  {
> > >  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
> > >  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> > > +	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
> > >  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> > >  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> > >  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> > > @@ -1790,7 +1793,20 @@ static int std_validate_compound(const struct =
v4l2_ctrl *ctrl, u32 idx,
> > >  	case V4L2_CTRL_TYPE_H264_SPS:
> > >  	case V4L2_CTRL_TYPE_H264_PPS:
> > >  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> > > +		break;
> > >  	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
> > > +		p_h264_slice_params =3D p;
> > > +
> > > +		for (i =3D 0; i < V4L2_H264_REF_PIC_LIST_LEN; i++) {
> > > +			struct v4l2_h264_reference *ref0 =3D
> > > +				&p_h264_slice_params->ref_pic_list0[i];
> > > +			struct v4l2_h264_reference *ref1 =3D
> > > +				&p_h264_slice_params->ref_pic_list1[i];
> > > +
> > > +			zero_reserved(*ref0);
> > > +			zero_reserved(*ref1);
> > > +		}
> > > +		break;
> > >  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> > >  		break;
> > > =20
> > > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > > index 9b1cbc9bc38e..c6cbf178c1c9 100644
> > > --- a/include/media/h264-ctrls.h
> > > +++ b/include/media/h264-ctrls.h
> > > @@ -19,6 +19,8 @@
> > >   */
> > >  #define V4L2_H264_NUM_DPB_ENTRIES 16
> > > =20
> > > +#define V4L2_H264_REF_PIC_LIST_LEN 32
> > > +
> > >  /* Our pixel format isn't stable at the moment */
> > >  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H=
264 parsed slices */
> > > =20
> > > @@ -146,6 +148,7 @@ struct v4l2_h264_pred_weight_table {
> > >  struct v4l2_h264_reference {
> > >  	__u8 flags;
> > >  	__u8 index;
> > > +	__u16 reserved;
> > >  };
> > > =20
> > >  struct v4l2_ctrl_h264_slice_params {
> > > @@ -190,8 +193,8 @@ struct v4l2_ctrl_h264_slice_params {
> > >  	 * Entries on each list are indices into
> > >  	 * v4l2_ctrl_h264_decode_params.dpb[].
> > >  	 */
> > > -	struct v4l2_h264_reference ref_pic_list0[32];
> > > -	struct v4l2_h264_reference ref_pic_list1[32];
> > > +	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_PIC_LIST_LEN=
];
> > > +	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_PIC_LIST_LEN=
];
> > > =20
> > >  	__u32 flags;
> > >  };
>=20
>=20

--=-bs57yxDa808qws5WWLRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXvTjNwAKCRBxUwItrAao
HJMSAKCxHraBF4tvs8q0q0gySla7iT5NnwCfWx3ZPjbabs5Co8gBPDbTeC0HUVg=
=HLON
-----END PGP SIGNATURE-----

--=-bs57yxDa808qws5WWLRs--

