Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F750231472
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 23:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbgG1VJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 17:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728728AbgG1VJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 17:09:39 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DDAC061794;
        Tue, 28 Jul 2020 14:09:38 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 4C02C295EE6
Message-ID: <6e2d535b9513bf9fbcf28c0941cb055422aa255e.camel@collabora.com>
Subject: Re: [PATCH 08/10] media: uapi: h264: Clean slice invariants syntax
 elements
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Tue, 28 Jul 2020 17:09:31 -0400
In-Reply-To: <20200728124405.ziuwaabp4fnv7lw2@gilmour.lan>
References: <20200715202233.185680-1-ezequiel@collabora.com>
         <20200715202233.185680-9-ezequiel@collabora.com>
         <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
         <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
         <20200728124405.ziuwaabp4fnv7lw2@gilmour.lan>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-E9fThMs1WfTQwtNDnh31"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-E9fThMs1WfTQwtNDnh31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 juillet 2020 =C3=A0 14:44 +0200, Maxime Ripard a =C3=A9crit :
> Hi,
>=20
> On Mon, Jul 27, 2020 at 11:39:12AM -0300, Ezequiel Garcia wrote:
> > On Sat, 2020-07-25 at 23:34 +0900, Alexandre Courbot wrote:
> > > On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.c=
om> wrote:
> > > > The H.264 specification requires in its "Slice header semantics"
> > > > section that the following values shall be the same in all slice he=
aders:
> > > >=20
> > > >   pic_parameter_set_id
> > > >   frame_num
> > > >   field_pic_flag
> > > >   bottom_field_flag
> > > >   idr_pic_id
> > > >   pic_order_cnt_lsb
> > > >   delta_pic_order_cnt_bottom
> > > >   delta_pic_order_cnt[ 0 ]
> > > >   delta_pic_order_cnt[ 1 ]
> > > >   sp_for_switch_flag
> > > >   slice_group_change_cycle
> > > >=20
> > > > and can therefore be moved to the per-frame decode parameters contr=
ol.
> > >=20
> > > I am really not a H.264 expert, so this question may not be relevant,
> >=20
> > All questions are welcome. I'm more than happy to discuss this patchset=
.
> >=20
> > > but are these values specified for every slice header in the
> > > bitstream, or are they specified only once per frame?
> > >=20
> > > I am asking this because it would certainly make user-space code
> > > simpler if we could remain as close to the bitstream as possible. If
> > > these values are specified once per slice, then factorizing them woul=
d
> > > leave user-space with the burden of deciding what to do if they chang=
e
> > > across slices.
> > >=20
> > > Note that this is a double-edged sword, because it is not necessarily
> > > better to leave the firmware in charge of deciding what to do in such
> > > a case. :) So hopefully these are only specified once per frame in th=
e
> > > bitstream, in which case your proposal makes complete sense.
> >=20
> > Frame-based hardwares accelerators such as Hantro and Rockchip VDEC
> > are doing the slice header parsing themselves. Therefore, the
> > driver is not really parsing these fields on each slice header.
> >=20
> > Currently, we are already using only the first slice in a frame,
> > as you can see from:
> >=20
> >         if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
> >                 reg |=3D G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
> >=20
> > Even if these fields are transported in the slice header,
> > I think it makes sense for us to split them into the decode params
> > (per-frame) control.
>=20
> I don't really get it though. The initial plan that was asked was to
> mimic as much as possible the bitstream and that's what we did.
>=20
> But that requirement seems to have changed now?

Indeed, that has changed and has been discussed multiple times already.
But in general what you need to realize is that the bitstream is made
of redundancy in order to be robust over data lost. Most importantly,
it is by design that you can loose a slice, but still the decode the
other slices.

Carrying this redundancy over the kernel API though didn't make much
sense. It only made the amount of data we have to pass (and copy) for
each frames bigger. The goal of this change is to reduce the amount of
data you actually need to pass, both for frame and slice decoding.

For frame decoding, all the invariants from the slice header (notice
the spec name here) have been moved from slice_params (not a spec term)
into the decode_params (also not a spec term). This way, the
slice_params are no longer needed to be passed at all to driver.

As for the slice decoding, assuming you care making use of the VB2
control caching, you can pass the decode_params on the first slice
only, and only pass the slice_params, which is now slimmer, for the
following slices.

Remember that Paul initially believed that V4L2 stateless decoder was a
stateless API, while in fact the HW is stateless, but V4L2 API are
statefull by nature.

p.s. it was also request to use raster scan scaling matrix, which isn't
the order found in the bitstream. That was also discussed, and the
reason is that other existing interfaces use raster order, so not using
that is error prone for both kernel and userspace coders. Cedrus has
been in raster scan order since the start, ignoring that rule already.

>=20
> Even if it did change though, if this is defined as a slice parameter in
> the spec, why would we want to move it to some other control entirely if
> we are to keep the slice parameters control?

You are confusing a term we invented, slice_params, with a specified
term slice header. The decode_params are as document information per
frame/picture, while slice_params is information needed per slice,
nothing more.

>=20
> Especially if the reason is to make the life easier on a couple of
> drivers, that's really not the point of a userspace API, and we can
> always add an helper if it really shows up as a pattern.

We have made userspace implementation of this, GStreamer for now, I can
only disagree with you. This does not make userspace much more complex
and on top of that, it allow reducing some overhead, as prior to that
we were computing reference lists for frame base decoder that already
compute this in HW. I also find that it make debugging easier, as when
we trace we don't endup looking at identical values over and over.

>=20
> > They are really specified to be the same across all slices,
> > so even I'd say if a bitstream violates this, it's likely
> > either a corrupted bitstream or an encoder bug.
>=20
> That doesn't look like something we should worry about though. Or at
> least, this is true for pretty much any other field in the bitstream and
> we won't change those.

Sorry, I'm not clear what you refer to, not worry about the fact they
are invariant or that the user may pass invalid data ? For the first,
we believe it matters, that was also motivated by some of Stanimir
research showing that controls are not as free as we'd like to think.
Again, all this have been discussed for quite some time now and the
participants have seen to reach an agreement on this direction.

>=20
> Maxime

--=-E9fThMs1WfTQwtNDnh31
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXyCUCwAKCRBxUwItrAao
HFGqAJkB2CPV4gLP0AauLmctK8/CPZcnNwCdEiXiq2kcUHt8Vo7mtvUmLmWKit4=
=v2Ht
-----END PGP SIGNATURE-----

--=-E9fThMs1WfTQwtNDnh31--

