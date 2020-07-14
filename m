Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C5A21F6A7
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 18:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgGNQEY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 12:04:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50460 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgGNQEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 12:04:24 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id A7DE32A0612
Message-ID: <7cbd2b84a4a5778a3ad04a83fad775f7e244f6bc.camel@collabora.com>
Subject: Re: [RFC 07/12] media: uapi: h264: Add DPB entry field reference
 flags
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Tue, 14 Jul 2020 12:04:15 -0400
In-Reply-To: <c10bb0992a8bfb751edf66bdb7752da842877281.camel@collabora.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <20190901124531.23645-1-jonas@kwiboo.se>
         <HE1PR06MB4011559BF2447047C66285D2ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <233509924f72d69824920d9312373eced68674c0.camel@collabora.com>
         <20200710101333.05077f18@collabora.com>
         <6232d8475e169ee53b5864959af21d14bf0fc620.camel@collabora.com>
         <20200710140502.627b2b54@collabora.com>
         <05b6cff6ba230c0ab6a562e17926d8503e2dfadd.camel@collabora.com>
         <9a897ef99048077233685b121b03bd750e4d4a83.camel@collabora.com>
         <cf4a5d3f-934f-de59-b5df-97b23e30cb1b@kwiboo.se>
         <c10bb0992a8bfb751edf66bdb7752da842877281.camel@collabora.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-iMsKzjE/bLjeheFW6F8H"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-iMsKzjE/bLjeheFW6F8H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 12 juillet 2020 =C3=A0 19:59 -0300, Ezequiel Garcia a =C3=A9cri=
t :
> On Sat, 2020-07-11 at 10:21 +0000, Jonas Karlman wrote:
> > On 2020-07-10 23:49, Nicolas Dufresne wrote:
> > > Le vendredi 10 juillet 2020 =C3=A0 09:25 -0300, Ezequiel Garcia a =C3=
=A9crit :
> > > > +Nicolas
> > > >=20
> > > > On Fri, 2020-07-10 at 14:05 +0200, Boris Brezillon wrote:
> > > > > On Fri, 10 Jul 2020 08:50:28 -0300
> > > > > Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > > >=20
> > > > > > On Fri, 2020-07-10 at 10:13 +0200, Boris Brezillon wrote:
> > > > > > > On Fri, 10 Jul 2020 01:21:07 -0300
> > > > > > > Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > > > > >  =20
> > > > > > > > Hello Jonas,
> > > > > > > >=20
> > > > > > > > In the context of the uAPI cleanup,
> > > > > > > > I'm revisiting this patch.
> > > > > > > >=20
> > > > > > > > On Sun, 2019-09-01 at 12:45 +0000, Jonas Karlman wrote: =
=20
> > > > > > > > > Add DPB entry flags to help indicate when a reference fra=
me is a
> > > > > > > > > field picture
> > > > > > > > > and how the DPB entry is referenced, top or bottom field =
or full
> > > > > > > > > frame.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > > > > > > > > ---
> > > > > > > > >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++=
++++++++++
> > > > > > > > >  include/media/h264-ctrls.h                       |  4 ++=
++
> > > > > > > > >  2 files changed, 16 insertions(+)
> > > > > > > > >=20
> > > > > > > > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec=
.rst
> > > > > > > > > b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > > > > > index bc5dd8e76567..eb6c32668ad7 100644
> > > > > > > > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > > > > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > > > > > @@ -2022,6 +2022,18 @@ enum
> > > > > > > > > v4l2_mpeg_video_h264_hierarchical_coding_type -
> > > > > > > > >      * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
> > > > > > > > >        - 0x00000004
> > > > > > > > >        - The DPB entry is a long term reference frame
> > > > > > > > > +    * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE``
> > > > > > > > > +      - 0x00000008
> > > > > > > > > +      - The DPB entry is a field picture
> > > > > > > > > +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_TOP``
> > > > > > > > > +      - 0x00000010
> > > > > > > > > +      - The DPB entry is a top field reference
> > > > > > > > > +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM``
> > > > > > > > > +      - 0x00000020
> > > > > > > > > +      - The DPB entry is a bottom field reference
> > > > > > > > > +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME``
> > > > > > > > > +      - 0x00000030
> > > > > > > > > +      - The DPB entry is a reference frame
> > > > > > > > > =20
> > > > > > > > >  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
> > > > > > > > >      Specifies the decoding mode to use. Currently expose=
s slice-
> > > > > > > > > based and
> > > > > > > > > diff --git a/include/media/h264-ctrls.h b/include/media/h=
264-ctrls.h
> > > > > > > > > index e877bf1d537c..76020ebd1e6c 100644
> > > > > > > > > --- a/include/media/h264-ctrls.h
> > > > > > > > > +++ b/include/media/h264-ctrls.h
> > > > > > > > > @@ -185,6 +185,10 @@ struct v4l2_ctrl_h264_slice_params {
> > > > > > > > >  #define V4L2_H264_DPB_ENTRY_FLAG_VALID		0x01
> > > > > > > > >  #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
> > > > > > > > >  #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
> > > > > > > > > +#define V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE	0x08
> > > > > > > > > +#define V4L2_H264_DPB_ENTRY_FLAG_REF_TOP	0x10
> > > > > > > > > +#define V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM	0x20
> > > > > > > > > +#define V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME	0x30
> > > > > > > > >     =20
> > > > > > > >=20
> > > > > > > > I've been going thru the H264 spec and I'm unsure,
> > > > > > > > are all these flags semantically needed?
> > > > > > > >=20
> > > > > > > > For instance, if one of REF_BOTTOM or REF_TOP (or both)
> > > > > > > > are set, doesn't that indicate it's a field picture?
> > > > > > > >=20
> > > > > > > > Or conversely, if neither REF_BOTTOM or REF_TOP are set,
> > > > > > > > then it's a frame picture? =20
> > > > > > >=20
> > > > > > > I think that's what I was trying to do here [1]
> > > > > > >=20
> > > > > > > [1]https://patchwork.kernel.org/patch/11392095/ =20
> > > > > >=20
> > > > > > Right. Aren't we missing a DPB_ENTRY_FLAG_TOP_FIELD?
> > > > > >=20
> > > > > > If I understand correctly, the DPB can contain:
> > > > > >=20
> > > > > > * frames (FLAG_FIELD not set)
> > > > > > * a field pair, with a single field (FLAG_FIELD and either TOP =
or BOTTOM).
> > > > > > * a field pair, with boths fields (FLAG_FIELD and both TOP or B=
OTTOM).
> > > > >=20
> > > > > Well, my understand is that, if the buffer contains both a TOP an=
d
> > > > > BOTTOM field, it actually becomes a full frame, so you actually h=
ave
> > > > > those cases:
> > > > >=20
> > > > > * FLAG_FIELD not set: this a frame (note that a TOP/BOTTOM field
> > > > >   decoded buffer can become of frame if it's complemented with th=
e
> > > > >   missing field later during the decoding)
> > > > > * FLAG_FIELD set + BOTTOM_FIELD not set: this is a TOP field
> > > > > * FLAG_FIELD set + BOTTOM_FIELD set: this is a BOTTOM field
> > > > > * FLAG_FIELD not set + BOTTOM_FIELD set: invalid combination
> > >=20
> > > Let's admit, while this work, it's odd. Can we just move to that inst=
ewad ?
> > >=20
> > >   FLAG_TOP_FIELD
> > >   FLAG_BOTTOM_FIELD
> > >   FLAG_FRAME =3D (FLAG_TOP_FIELD | FLAG_BOTTOM_FIELD)
> > >=20
> > > So it can be used as a flag, but also is a proper enum and there is n=
o longer an
> > > invalid combination.
> > >  =20
> > > > > but I might be wrong.
> >=20
> > There seems to be some misunderstanding here, the top/bottom flagging s=
hould
> > not be used to describe if the picture is a field, field pair or frame,=
 it
> > should be used to flag if a frame or the top and/or bottom field (in ca=
se of
> > a field pair) is "used for short-term reference".
> >=20
>=20
> I'm not sure why "used for short-term reference" instead
> of "used for reference".
>=20
> > FLAG_TOP_REF
> > FLAG_BOTTOM_REF
> > FLAG_FRAME_REF =3D (FLAG_TOP_REF | FLAG_BOTTOM_REF)
> >=20
> > Would be a more appropriate naming.
> >=20
> > The FIELD_PIC flag would then be used to describe if the picture is a
> > reference frame or a complementary reference field pair.
> >=20
> > As described in hantro h264 driver [1] the MV buffer is split in two
> > for field encoded frames, and I guess the rkvdec block does something
> > similar and therefore the HW blocks probably needs to know if the refer=
ence
> > picture is a reference frame or a complementary reference field pair.
> > It should be possible to keep such state in driver but since such infor=
mation
> > was easily available in ffmpeg and the driver being "stateless" using a=
 flag
> > seamed like a good choice at the time.
> >=20
> > Please note that I have not done any test without the "field pic" flagg=
ing
> > but both mpp and the imx/hantro reference code are configuring this bit=
.
> >=20
> > [1] https://git.linuxtv.org/media_tree.git/tree/drivers/staging/media/h=
antro/hantro_g1_h264_dec.c#n265
> >=20
>=20
> How about this:
>=20
> #define V4L2_H264_DPB_ENTRY_FLAG_VALID          0x01
> #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE         0x02
> #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM      0x04
> #define V4L2_H264_DPB_ENTRY_FLAG_FIELD          0x08
>=20
> enum v4l2_h264_dpb_reference {
>         V4L2_H264_DPB_TOP_REF =3D 0x1,
>         V4L2_H264_DPB_BOTTOM_REF =3D 0x2,
>         V4L2_H264_DPB_FRAME_REF =3D 0x3,
> };
>=20
> With the following semantics (which should be
> specified in the documentation):
>=20
> * VALID: non-empty DPB entry.
> * ACTIVE: picture is marked as "used for reference" (short-term or long-t=
erm).
> * LONG_TERM: picture is marked as "used for long-term".
> * FIELD: picture is a single field, or a complementary field pair.=20
>=20
> The v4l2_h264_dpb_reference enum would flag which
> of the fields as used for reference.
>=20
> This enum seems less ambiguous and easier to use for both
> drivers and applications.
>=20
> I am not exactly sure why a driver would ever need to
> configure an "unused for reference" decoded picture
> (i.e. VALID=3D1, ACTIVE=3D0), but I guess it's just clearer
> to include this in the interface.

Indeed, that might have leaked from what we do in userspace, were we
need to track this. I haven't seen anything that would do concealment
or anything anyway.

I don't have definitive opinion on the above, but I think it's getting
in the right direction.

>=20
> Thanks,
> Ezequiel
>=20
> > Regards,
> > Jonas
> >=20
> > > > Yes, perhaps that's correct. I was trying to think strictly
> > > > in terms of the H264 semantics, to define a clean interface.
> > > >=20
> > > > From the mpp code, looks like the above is enough for rkvdec
> > > > (although I haven't done any tests).
> > > >=20
> > > > Ezequiel
> > > >=20
> > > >=20
> > > >=20
>=20
>=20

--=-iMsKzjE/bLjeheFW6F8H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXw3XfwAKCRBxUwItrAao
HJidAJ9lrmTKK/CZFUV93wVO+wQFDfrf8gCgrevFj/rP2A5sB3zeA8cFLMq1Xu0=
=lk1j
-----END PGP SIGNATURE-----

--=-iMsKzjE/bLjeheFW6F8H--

