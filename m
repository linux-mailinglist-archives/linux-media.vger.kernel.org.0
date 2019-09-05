Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B318AA59C
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 16:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732487AbfIEORy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 10:17:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37506 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfIEORx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 10:17:53 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id CA45328DC0F
Message-ID: <cb118783713af210b3ac8a87d00b62dc83cc9c08.camel@collabora.com>
Subject: Re: [PATCH 1/2] media: uapi: h264: Add
 num_ref_idx_active_override_flag
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Date:   Thu, 05 Sep 2019 10:17:48 -0400
In-Reply-To: <1567679973.3958.1.camel@pengutronix.de>
References: <20190905101533.525-1-p.zabel@pengutronix.de>
         <CAHD77H=q48Zx=dWMOMT527au8FzKZdQ9SrRr4sos8oNfCeCzQw@mail.gmail.com>
         <1567679973.3958.1.camel@pengutronix.de>
Organization: Collabora Ltd.
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-7Xp+djquZaKrFdQPURBI"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-7Xp+djquZaKrFdQPURBI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 05 septembre 2019 =C3=A0 12:39 +0200, Philipp Zabel a =C3=A9crit :
> On Thu, 2019-09-05 at 19:31 +0900, Tomasz Figa wrote:
> > On Thu, Sep 5, 2019 at 7:15 PM Philipp Zabel <p.zabel@pengutronix.de> w=
rote:
> > > This flag tells the kernel whether the slice header contained the
> > > num_ref_idx_l[01]_active_minus1 syntax elements, or whether the
> > > num_ref_idx_l[01]_default_active_minus1 from PPS should be used
> > > instead.
> > >=20
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 +++
> > >  include/media/h264-ctrls.h                       | 1 +
> > >  2 files changed, 4 insertions(+)
> > >=20
> > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Docum=
entation/media/uapi/v4l/ext-ctrls-codec.rst
> > > index bc5dd8e76567..451a5b0f2a35 100644
> > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > @@ -1860,6 +1860,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_t=
ype -
> > >      * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
> > >        - 0x00000008
> > >        -
> > > +    * - ``V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE
> > > +      - 0x00000010
> > > +      - Corresponds to the num_ref_idx_active_override_flag syntax e=
lement.
> > >=20
> >=20
> > As far as I remember, the idea was for the userspace to always put the
> > right num_ref_idx in the slice_params and the drivers always use that.
> > Was there any problem with that?
>=20
> I don't think so, at least for currently known hardware.
>=20
> In that case we should drop the unused
> num_ref_idx_l[01]_default_active_minus1 fields from struct
> v4l2_ctrl_h264_pps and document that userspace should fill
> the defaults into v4l2_ctrl_h264_slice_params themselves if
> num_ref_idx_active_override_flag wasn't set.

It might have been added in a previous effort to allow reconstructing
the bitstream from the structures.

>=20
> regards
> Philipp

--=-7Xp+djquZaKrFdQPURBI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXXEZDAAKCRBxUwItrAao
HKvPAJ411GfhOiTwyBuYY8wkstYseV8pwACgkg7q+ktTacePhTuBlqa5mo8b+hc=
=KD4i
-----END PGP SIGNATURE-----

--=-7Xp+djquZaKrFdQPURBI--

