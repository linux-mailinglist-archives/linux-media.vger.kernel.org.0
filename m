Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB5FCB0CC
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 23:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730871AbfJCVGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 17:06:30 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35289 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730162AbfJCVGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 17:06:30 -0400
X-Originating-IP: 132.205.230.8
Received: from aptenodytes (unknown [132.205.230.8])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6C03320073;
        Thu,  3 Oct 2019 21:06:25 +0000 (UTC)
Date:   Thu, 3 Oct 2019 17:06:23 -0400
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] media: uapi: h264: Add
 num_ref_idx_active_override_flag
Message-ID: <20191003210623.GA3531@aptenodytes>
References: <20190905101533.525-1-p.zabel@pengutronix.de>
 <CAHD77H=q48Zx=dWMOMT527au8FzKZdQ9SrRr4sos8oNfCeCzQw@mail.gmail.com>
 <1567679973.3958.1.camel@pengutronix.de>
 <cb118783713af210b3ac8a87d00b62dc83cc9c08.camel@collabora.com>
 <CAAFQd5Dv3VhybM5qZHQCBgRQmpLrS1Pi1rmwRnt59q9mRUUTjw@mail.gmail.com>
 <1568014207.2956.1.camel@pengutronix.de>
 <CAAFQd5C9ca0JqTA3Ha+APP9VW9HY=Ve-n+L6FK54xxKAM-akdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <CAAFQd5C9ca0JqTA3Ha+APP9VW9HY=Ve-n+L6FK54xxKAM-akdQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 09 Sep 19, 18:40, Tomasz Figa wrote:
> On Mon, Sep 9, 2019 at 4:30 PM Philipp Zabel <p.zabel@pengutronix.de> wro=
te:
> >
> > On Mon, 2019-09-09 at 16:09 +0900, Tomasz Figa wrote:
> > > On Thu, Sep 5, 2019 at 11:17 PM Nicolas Dufresne
> > > <nicolas.dufresne@collabora.com> wrote:
> > > >
> > > > Le jeudi 05 septembre 2019 =C3=A0 12:39 +0200, Philipp Zabel a =C3=
=A9crit :
> > > > > On Thu, 2019-09-05 at 19:31 +0900, Tomasz Figa wrote:
> > > > > > On Thu, Sep 5, 2019 at 7:15 PM Philipp Zabel <p.zabel@pengutron=
ix.de> wrote:
> > > > > > > This flag tells the kernel whether the slice header contained=
 the
> > > > > > > num_ref_idx_l[01]_active_minus1 syntax elements, or whether t=
he
> > > > > > > num_ref_idx_l[01]_default_active_minus1 from PPS should be us=
ed
> > > > > > > instead.
> > > > > > >
> > > > > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > > > > ---
> > > > > > >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 +++
> > > > > > >  include/media/h264-ctrls.h                       | 1 +
> > > > > > >  2 files changed, 4 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst=
 b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > > > index bc5dd8e76567..451a5b0f2a35 100644
> > > > > > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > > > @@ -1860,6 +1860,9 @@ enum v4l2_mpeg_video_h264_hierarchical_=
coding_type -
> > > > > > >      * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
> > > > > > >        - 0x00000008
> > > > > > >        -
> > > > > > > +    * - ``V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE
> > > > > > > +      - 0x00000010
> > > > > > > +      - Corresponds to the num_ref_idx_active_override_flag =
syntax element.
> > > > > > >
> > > > > >
> > > > > > As far as I remember, the idea was for the userspace to always =
put the
> > > > > > right num_ref_idx in the slice_params and the drivers always us=
e that.
> > > > > > Was there any problem with that?
> > > > >
> > > > > I don't think so, at least for currently known hardware.
> > > > >
> > > > > In that case we should drop the unused
> > > > > num_ref_idx_l[01]_default_active_minus1 fields from struct
> > > > > v4l2_ctrl_h264_pps and document that userspace should fill
> > > > > the defaults into v4l2_ctrl_h264_slice_params themselves if
> > > > > num_ref_idx_active_override_flag wasn't set.
> > > >
> > > > It might have been added in a previous effort to allow reconstructi=
ng
> > > > the bitstream from the structures.
> > >
> > > Wouldn't one still be able to reconstruct a valid (but not exact)
> > > stream without that flag, given the assumption above?
> >
> > If the Hantro G1, as appears to be the case, parses the slice header and
> > decides itself whether to use the override from the slice or the default
> > that was written to a register, it needs the
> > num_ref_idx_l[01]_default_active_minus1 field to fill the register, but
> > doesn't need either the num_ref_idx_l[01]_active_minus1 override nor the
> > flag.
> >
> > A decoder that doesn't parse the slice header can always be told to use
> > the override (thus no need to have the flag in the uapi), if userspace
> > fills the default into the override fields as a fallback. Such a decoder
> > does need the num_ref_idx_l[01]_active_minus1 override, but doesn't need
> > the num_ref_idx_l[01]_default_active_minus1 field nor the flag.
> >
> > That is my current understanding of the intention behind this interface,
> > I hope this is accurate.
> > I've tried to make the docs reflect this in ("media: uapi: h264: clarify
> > num_ref_idx_l[01]_(default_)active fields") [1].
> >
> > [1] https://lore.kernel.org/linux-media/20190905114210.9232-1-p.zabel@p=
engutronix.de/T/#u
>=20
> Yes, makes sense for me.

Sorry for being late to the party and catching up with this just now.

It looks like the conclusion is that we need to keep both the PPS default
and slice-specific set of fields to cover both hardware that parses the sli=
ce
header and hardware that doesn't.

In H265, I had evicted the PPS default value and the flag in favor of only
providing a slice-specific value, but I should certainly revise this to have
the two sets of values and the flag. This should allow covering hardware th=
at
does slice header parsing itself.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2WYs8ACgkQ3cLmz3+f
v9Gl/wf7BWMxQZ7z/OzmE+jCE3j8IYS/TxYiS7vsO9On91b8bQclGDnK8l4Qergd
MhjxW800QwWt0parHsglkbnyERbJfSMFfJFYQddy/u+TjFG7N6Lj25nTl80HWbUb
UhbxO7aleIWIez4zQ1/2btc8Rzi4ibuY9tNY/LPtKo67pmOjq+8h2xJPwneE05f6
y65BC1mGUSztUkRA2gFnzeGuIzAdqtRDLFm/0NXveLAj4iRxP6AlvWEurxmVxvl3
ZPPDFCKQqLAzaPXsF3o/r5f6s+2f8aOcc4PZoiytLfAyEkfn/HFj4UFkOBZdHYkI
gJT5luyQlrCSZI3fgRPu1eWf5jLD/Q==
=RxAz
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
