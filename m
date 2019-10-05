Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 027E9CCA23
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 15:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfJENjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 09:39:24 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:43449 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfJENjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 09:39:24 -0400
X-Originating-IP: 162.222.80.169
Received: from aptenodytes (unknown [162.222.80.169])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6BD88C0004;
        Sat,  5 Oct 2019 13:39:21 +0000 (UTC)
Date:   Sat, 5 Oct 2019 09:39:20 -0400
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH] media: uapi: h264: clarify
 num_ref_idx_l[01]_(default_)active fields
Message-ID: <20191005133920.GB19943@aptenodytes>
References: <20190905114210.9232-1-p.zabel@pengutronix.de>
 <20191003211247.GC3927@aptenodytes>
 <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat 05 Oct 19, 17:22, Tomasz Figa wrote:
> On Fri, Oct 4, 2019 at 6:12 AM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > Hi,
> >
> > On Thu 05 Sep 19, 13:42, Philipp Zabel wrote:
> > > To explain why num_ref_idx_active_override_flag is not part of the AP=
I,
> > > describe how the num_ref_idx_l[01]_active_minus1 fields and the
> > > num_ref_idx_l[01]_default_active_minus1 fields are used, depending on
> > > whether the decoder parses slice headers itself or not.
> >
> > Is there any particular reason why this is preferable to exposing the f=
lag?
> > It feels like having the flag around sticks closer to the bitstream,
> > so it's more straightforward for everyone.
> >
> > In case there's only one set of fields exposed by the hardware (and it =
doesn't
> > do slice parsing itself), we could always check the flag in the driver =
and use
> > either the default PPS values or the slice-specific values there.
> >
> > What do you think?
>=20
> IMHO it would only add further logic to the drivers, because they
> would need to have a conditional block that selects default or
> per-slice value based on the flag. The goal was to be able for the
> driver to just passively write num_ref_idx_l[01]_active_minus1 (or the
> default one for slice-parsing hardware) to corresponding hardware
> registers.

Well, the Allwinner block has both set of fields and a field for the flag,
so in this case I find that it is cleaner to just copy the values and flag
rather than always setting the flag even when it's the default value used.

More generally, the two sets + flag are closer to bitstream which feels less
confusing than re-purposing these fields from the slice header to fit the
result of flag ? per-slice : per-picture.

> We're talking about kernel drivers here and for security reasons any
> logic should be reduced to the strictly necessary minimum.

I definitely agree that bitstream parsing in the kernel is to be avoided for
security reasons (among other things), but don't see the harm in considering
the flags in-driver if needed. We do it for a number of other flags already
(and strongly need to).

Cheers,

Paul

> >
> > Cheers,
> >
> > Paul
> >
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Docum=
entation/media/uapi/v4l/ext-ctrls-codec.rst
> > > index bc5dd8e76567..b9834625a939 100644
> > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > @@ -1630,10 +1630,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding=
_type -
> > >        -
> > >      * - __u8
> > >        - ``num_ref_idx_l0_default_active_minus1``
> > > -      -
> > > +      - This field is only used by decoders that parse slices themse=
lves.
> > >      * - __u8
> > >        - ``num_ref_idx_l1_default_active_minus1``
> > > -      -
> > > +      - This field is only used by decoders that parse slices themse=
lves.
> > >      * - __u8
> > >        - ``weighted_bipred_idc``
> > >        -
> > > @@ -1820,10 +1820,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding=
_type -
> > >        -
> > >      * - __u8
> > >        - ``num_ref_idx_l0_active_minus1``
> > > -      -
> > > +      - This field is used by decoders that do not parse slices them=
selves.
> > > +        If num_ref_idx_active_override_flag is not set, this field m=
ust be
> > > +        set to the value of num_ref_idx_l0_default_active_minus1.
> > >      * - __u8
> > >        - ``num_ref_idx_l1_active_minus1``
> > > -      -
> > > +      - This field is used by decoders that do not parse slices them=
selves.
> > > +        If num_ref_idx_active_override_flag is not set, this field m=
ust be
> > > +        set to the value of num_ref_idx_l1_default_active_minus1.
> > >      * - __u32
> > >        - ``slice_group_change_cycle``
> > >        -
> > > --
> > > 2.20.1
> > >
> >
> > --
> > Paul Kocialkowski, Bootlin
> > Embedded Linux and kernel engineering
> > https://bootlin.com

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2YnQcACgkQ3cLmz3+f
v9HAPgf/dNMWZL3YJucs/jOWJwfPJMkJu/gKJKtpI7JmRJsPHH4VpT0PKCjC1S07
kgnxgd+kmKtPs6PQNYbAb5IAOQpXQ8U/jdzQl+V/rYm9tMYrxzBqu825xoT9WjaR
tEX+249PjkIAD01MpfYY9CsXIP0dbr4rZgQ3akdU6/Rs2SF8V5y4ZLIKsU4XXocq
XC9unuDjYA+RaCXWGzdPOJXeflSxXQCmoeUauJtYL5h6/ywOIl2qNSpEXaQPux7E
BHG4iFzWDnY6sScFTuQB+HLLHPz3V6NpARONcl2F1GZNhIwOJ5VJdXnhjy7cwqzJ
pT8tb51yWopMG5Auw3n5s3qU2czLNw==
=6q+E
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
