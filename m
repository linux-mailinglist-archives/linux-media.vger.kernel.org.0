Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB84CCAE2
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 17:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfJEPm7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 11:42:59 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:48363 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfJEPm7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 11:42:59 -0400
X-Originating-IP: 37.164.210.105
Received: from aptenodytes (unknown [37.164.210.105])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7BFA224000B;
        Sat,  5 Oct 2019 15:42:54 +0000 (UTC)
Date:   Sat, 5 Oct 2019 11:42:52 -0400
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
Message-ID: <20191005154252.GD19943@aptenodytes>
References: <20190905114210.9232-1-p.zabel@pengutronix.de>
 <20191003211247.GC3927@aptenodytes>
 <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com>
 <20191005133920.GB19943@aptenodytes>
 <CAAFQd5AE8=bzQH+i4EoKYpB8RkprnWEAW0=8xS=fCa7Y4Hsfaw@mail.gmail.com>
 <20191005141228.GC19943@aptenodytes>
 <CAAFQd5BTff65TyMbLi+L8ejmC7CchRMt-iZ7mQnBuZn117ARvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline
In-Reply-To: <CAAFQd5BTff65TyMbLi+L8ejmC7CchRMt-iZ7mQnBuZn117ARvQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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

Oh right, they are currently still here at the moment. So I'm just advocati=
ng
for adding the flag then. I was under the impression that only the set from=
 the
slice header was still around. Thanks!

> >
> > The bottomline is that we have use cases for each of the two set of fie=
lds
> > independently, so I feel like this is reason enough to avoid mixing them
> > together.
>=20
> What do you mean by mixing together? Hardware parsing the slices
> always uses num_ref_idx_l[01]_default_active_minus1 from the PPS.
> Hardware not parsing the slices always sets override to 1 and uses
> num_ref_idx_l[01]_active_minus1 from the slice header struct.

Well, just specifying that the per-slice set takes values from the PPS set =
if
the flag is not there in the original bitstream is mixing up both fields.

What I mean is that the per-slice value is not specified to take the PPS va=
lue
as a fallback in bitstream syntax: that's why there are two distinct sets of
elements. Adding the flag avoids mixing them up and sticks closer to bitstr=
eam.

> > We are still in the process of polishing the API anyway, so now feels l=
ike a
> > good time to change these things.
>=20
> Hmm, it seemed to me like things already calmed down and we were just
> polishing the documentation. I was convinced we were actually about to
> destage things. Are you aware of some other changes coming?

I believe the next step is to go through some bitstream coverage testing be=
fore
we can have a clearer idea of whether the current controls are ready to be
stabilized or not.

I also feel like I haven't looking into existing and possible H.264 features
enough to have a clear idea of whether we're missing something or not.

I'm also under the impression that there wasn't strong feedback about the
control fields either so I feel like it would be best to be careful here.

What do you think?

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2YufsACgkQ3cLmz3+f
v9Hw/wf/bO3X5j1kDhnaxPRazX6qvMIxwRlL42cTz/7ST0LPuyNZBlGReZSmAMfb
dhste7kLSKMPKjRHg//SGRmlORS3eFVs296uP14dyggjakxaIO1+xq1SpW6FSDhq
Q53Oej7p/KJvAAOP8nRlyPRLtys04A5VxJscH7F1+/DGC+4qYrpcjrP2ly/6bKcC
j7KrXhU0JvmPVHt56CjW74x8No/qmGZIc1v2zMZWPrrT3151RD4fwIsNZskXxZkI
NFQyw68kpZnAFYQGRImFobbTll0xNP7g1MHz4v4sxn9lp6hY8gtW6a94VwIHQKBa
sYP+DNSsvBhOFF2hxvpRqa/TLZFzjw==
=/MLF
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
