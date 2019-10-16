Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5547D92AC
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 15:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389885AbfJPNh7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 09:37:59 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:49357 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbfJPNh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 09:37:59 -0400
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 03E64100004;
        Wed, 16 Oct 2019 13:37:56 +0000 (UTC)
Date:   Wed, 16 Oct 2019 15:37:56 +0200
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
Message-ID: <20191016133756.GB325584@aptenodytes>
References: <20190905114210.9232-1-p.zabel@pengutronix.de>
 <20191003211247.GC3927@aptenodytes>
 <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com>
 <20191005133920.GB19943@aptenodytes>
 <CAAFQd5AE8=bzQH+i4EoKYpB8RkprnWEAW0=8xS=fCa7Y4Hsfaw@mail.gmail.com>
 <20191005141228.GC19943@aptenodytes>
 <CAAFQd5BTff65TyMbLi+L8ejmC7CchRMt-iZ7mQnBuZn117ARvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline
In-Reply-To: <CAAFQd5BTff65TyMbLi+L8ejmC7CchRMt-iZ7mQnBuZn117ARvQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I thought I had answered here already, but looks I never sent the email.

On Sat 05 Oct 19, 23:21, Tomasz Figa wrote:
> On Sat, Oct 5, 2019 at 11:12 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > On Sat 05 Oct 19, 22:54, Tomasz Figa wrote:
> > > On Sat, Oct 5, 2019 at 10:39 PM Paul Kocialkowski
> > > <paul.kocialkowski@bootlin.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Sat 05 Oct 19, 17:22, Tomasz Figa wrote:
> > > > > On Fri, Oct 4, 2019 at 6:12 AM Paul Kocialkowski
> > > > > <paul.kocialkowski@bootlin.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Thu 05 Sep 19, 13:42, Philipp Zabel wrote:
> > > > > > > To explain why num_ref_idx_active_override_flag is not part o=
f the API,
> > > > > > > describe how the num_ref_idx_l[01]_active_minus1 fields and t=
he
> > > > > > > num_ref_idx_l[01]_default_active_minus1 fields are used, depe=
nding on
> > > > > > > whether the decoder parses slice headers itself or not.
> > > > > >
> > > > > > Is there any particular reason why this is preferable to exposi=
ng the flag?
> > > > > > It feels like having the flag around sticks closer to the bitst=
ream,
> > > > > > so it's more straightforward for everyone.
> > > > > >
> > > > > > In case there's only one set of fields exposed by the hardware =
(and it doesn't
> > > > > > do slice parsing itself), we could always check the flag in the=
 driver and use
> > > > > > either the default PPS values or the slice-specific values ther=
e.
> > > > > >
> > > > > > What do you think?
> > > > >
> > > > > IMHO it would only add further logic to the drivers, because they
> > > > > would need to have a conditional block that selects default or
> > > > > per-slice value based on the flag. The goal was to be able for the
> > > > > driver to just passively write num_ref_idx_l[01]_active_minus1 (o=
r the
> > > > > default one for slice-parsing hardware) to corresponding hardware
> > > > > registers.
> > > >
> > > > Well, the Allwinner block has both set of fields and a field for th=
e flag,
> > > > so in this case I find that it is cleaner to just copy the values a=
nd flag
> > > > rather than always setting the flag even when it's the default valu=
e used.
> > > >
> > > > More generally, the two sets + flag are closer to bitstream which f=
eels less
> > > > confusing than re-purposing these fields from the slice header to f=
it the
> > > > result of flag ? per-slice : per-picture.
> > > >
> > > > > We're talking about kernel drivers here and for security reasons =
any
> > > > > logic should be reduced to the strictly necessary minimum.
> > > >
> > > > I definitely agree that bitstream parsing in the kernel is to be av=
oided for
> > > > security reasons (among other things), but don't see the harm in co=
nsidering
> > > > the flags in-driver if needed. We do it for a number of other flags=
 already
> > > > (and strongly need to).
> > >
> > > If the fields are well documented, does it really matter? I'd suggest
> > > just keeping it as is, rather than overpolishing things and preventing
> > > the interface from stabilizing.
> >
> > I just don't see the benefit of changing the purpose of a bitstream ele=
ment.
> > Even with documentation, it adds some unnecessary confusion and I find =
this to
> > be a complicated enough topic without it ;)
> >
> > Especially for the case of hardware that does slice header parsing itse=
lf, it
> > feels particularly unsettling to have to take the default PPS values fo=
r the
> > fields from the slice header control rather than PPS.
>=20
> num_ref_idx_l[01]_default_active_minus1 are members of v4l2_ctrl_h264_pps.

Sorry, I got confused here and lost sight of the fact that the two members
are already part of the structures. So my point here is to introduce the fl=
ag
and have drivers use it to select between the two values.

> > The bottomline is that we have use cases for each of the two set of fie=
lds
> > independently, so I feel like this is reason enough to avoid mixing them
> > together.
>=20
> What do you mean by mixing together? Hardware parsing the slices
> always uses num_ref_idx_l[01]_default_active_minus1 from the PPS.
> Hardware not parsing the slices always sets override to 1 and uses
> num_ref_idx_l[01]_active_minus1 from the slice header struct.

To summarize, what I don't understand is why it's worth re-purposing
the slice header's num_ref_idx_l[01]_active_minus1 to contain
num_ref_idx_l[01]_default_active_minus1 when the flag is not set in the ini=
tial
bitstream instead of exposing the flag.

There's hardware (like cedrus) which takes both fields and the flag directly
in-registers, so it's really not a simplification here. And even in cases w=
here
the hardware only takes one field, I believe that the downside of re-purpos=
ing
the field of the control is much greater than the benefit of the supposed
simplification.

I know this sounds quite futile, but I thought there was an implicit agreem=
ent
that controls must stick as close as possible to the bitstream. This is an
occurence where we are diverging for no particularly strong reason.

Expecting that userspace does this pre-processing of fields feels quite
counter-intuitive and confusing for people wishing to use the API, too.
One would certainly naively expect that the fields in the controls carry the
same meaning as in the bitstream when they have the same name.

> > We are still in the process of polishing the API anyway, so now feels l=
ike a
> > good time to change these things.
>=20
> Hmm, it seemed to me like things already calmed down and we were just
> polishing the documentation. I was convinced we were actually about to
> destage things. Are you aware of some other changes coming?

=46rom my perspective, we still lack a few things:
- Coverage testing of the current controls against a large number of bitstr=
eams;
- Making sure that the current controls cover all the bitstream features we=
 want
  to support in this API and take a decision about what we explicitly decide
  to exclude if needed;
- We need a stateless (i.e. not firmware-backed) encoder supported;
- Maybe having formal rules regarding how to adapt codec bitstream elements=
 to
  controls would also be nice.

So tl;dr, I don't think we're at a point where things are sufficiently
well-defined to consider destaging. So that's why I feel like we should tak=
e the
chance to keep polish things (especially small details like the one discuss=
ed
here, which will set a precedent for how to do things in the future).

What do you think?

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2nHTQACgkQ3cLmz3+f
v9GA9Af+MgnVzcD37muVCR+Z9BxsRo4TOI+sXpBaxA1+T+q/M4GVWgwGEGfOFPyi
Wm4ozDgo0RDh/2r2VA0+AS+3aTFjJJG8aK6KKVwxVuZAFTVuExtEU55jrha+HbvP
ZJYzFfAzxvEn8Dr3Q+sTu1FPEKcWWwdyj855s/il9L2ZvWhGdoblKnmlWOCFXy37
RdDE0dkJoeBRIDqa1m1zuZ5H6xOTZCH082XBPgjABVtyq1LWyFkGY11oDnreZ40e
OCsPe1WbqZMjg1lJV7GA64CaC+OXD4ZMOtYyjrJqiZzM0tKrX3+nhOohml3R0QPi
dU2rOy8fhRmDQrdv1awUdk+NpVYr8A==
=bRA9
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
