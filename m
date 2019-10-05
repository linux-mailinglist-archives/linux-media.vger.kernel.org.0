Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA05CCA46
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 16:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbfJEOMe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 10:12:34 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:58257 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbfJEOMe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 10:12:34 -0400
X-Originating-IP: 162.222.80.169
Received: from aptenodytes (unknown [162.222.80.169])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 270C920008;
        Sat,  5 Oct 2019 14:12:29 +0000 (UTC)
Date:   Sat, 5 Oct 2019 10:12:28 -0400
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
Message-ID: <20191005141228.GC19943@aptenodytes>
References: <20190905114210.9232-1-p.zabel@pengutronix.de>
 <20191003211247.GC3927@aptenodytes>
 <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com>
 <20191005133920.GB19943@aptenodytes>
 <CAAFQd5AE8=bzQH+i4EoKYpB8RkprnWEAW0=8xS=fCa7Y4Hsfaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <CAAFQd5AE8=bzQH+i4EoKYpB8RkprnWEAW0=8xS=fCa7Y4Hsfaw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 05 Oct 19, 22:54, Tomasz Figa wrote:
> On Sat, Oct 5, 2019 at 10:39 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > Hi,
> >
> > On Sat 05 Oct 19, 17:22, Tomasz Figa wrote:
> > > On Fri, Oct 4, 2019 at 6:12 AM Paul Kocialkowski
> > > <paul.kocialkowski@bootlin.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Thu 05 Sep 19, 13:42, Philipp Zabel wrote:
> > > > > To explain why num_ref_idx_active_override_flag is not part of th=
e API,
> > > > > describe how the num_ref_idx_l[01]_active_minus1 fields and the
> > > > > num_ref_idx_l[01]_default_active_minus1 fields are used, dependin=
g on
> > > > > whether the decoder parses slice headers itself or not.
> > > >
> > > > Is there any particular reason why this is preferable to exposing t=
he flag?
> > > > It feels like having the flag around sticks closer to the bitstream,
> > > > so it's more straightforward for everyone.
> > > >
> > > > In case there's only one set of fields exposed by the hardware (and=
 it doesn't
> > > > do slice parsing itself), we could always check the flag in the dri=
ver and use
> > > > either the default PPS values or the slice-specific values there.
> > > >
> > > > What do you think?
> > >
> > > IMHO it would only add further logic to the drivers, because they
> > > would need to have a conditional block that selects default or
> > > per-slice value based on the flag. The goal was to be able for the
> > > driver to just passively write num_ref_idx_l[01]_active_minus1 (or the
> > > default one for slice-parsing hardware) to corresponding hardware
> > > registers.
> >
> > Well, the Allwinner block has both set of fields and a field for the fl=
ag,
> > so in this case I find that it is cleaner to just copy the values and f=
lag
> > rather than always setting the flag even when it's the default value us=
ed.
> >
> > More generally, the two sets + flag are closer to bitstream which feels=
 less
> > confusing than re-purposing these fields from the slice header to fit t=
he
> > result of flag ? per-slice : per-picture.
> >
> > > We're talking about kernel drivers here and for security reasons any
> > > logic should be reduced to the strictly necessary minimum.
> >
> > I definitely agree that bitstream parsing in the kernel is to be avoide=
d for
> > security reasons (among other things), but don't see the harm in consid=
ering
> > the flags in-driver if needed. We do it for a number of other flags alr=
eady
> > (and strongly need to).
>=20
> If the fields are well documented, does it really matter? I'd suggest
> just keeping it as is, rather than overpolishing things and preventing
> the interface from stabilizing.

I just don't see the benefit of changing the purpose of a bitstream element.
Even with documentation, it adds some unnecessary confusion and I find this=
 to
be a complicated enough topic without it ;)

Especially for the case of hardware that does slice header parsing itself, =
it
feels particularly unsettling to have to take the default PPS values for the
fields from the slice header control rather than PPS.

The bottomline is that we have use cases for each of the two set of fields
independently, so I feel like this is reason enough to avoid mixing them
together.

We are still in the process of polishing the API anyway, so now feels like a
good time to change these things.

Cheers,

Paul

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2YpMwACgkQ3cLmz3+f
v9HHUwf/bs52mdum85Ib+1b9vvySr+KxdaS/rDB6GMP3hex93oJ8cHrhhY09hUOc
OSJp1CzLmhd/m67rBByqpdFWH+qq8mW5n7n5aaSojyQd/D6eTuGhpyZkWdPIvp6w
+KVD5lkLDTkbFC1p75snJbqr+adAEAqOk4c6H6sUPIHQssqRq0vT+cWXAiDvcLJZ
rI20xqTTlH4nEwvJXdSTk7f7+HZM+P3h3L5JcXlugTf/POpaG55ofRgUHqtDQq3u
p+PETmQJCf/l9otPCC5FYppeyKs/kawbokW5bf17lW/RE7Muxdfo8FWkgR+jmcuF
XZV+LYHzV3oV0BH5tiABt+KHTllRqA==
=G7DA
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
