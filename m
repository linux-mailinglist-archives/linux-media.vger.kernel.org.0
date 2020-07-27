Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C0822F94C
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 21:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgG0Tn4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 15:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgG0Tn4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 15:43:56 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAD0C061794;
        Mon, 27 Jul 2020 12:43:55 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 937F3283C24
Message-ID: <dc7f9f199788581a4b37fc7e34466f7bd2173efb.camel@collabora.com>
Subject: Re: [PATCH 08/10] media: uapi: h264: Clean slice invariants syntax
 elements
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Mon, 27 Jul 2020 15:43:48 -0400
In-Reply-To: <CAAFQd5AeMcqk1MpWNeh1Vgt2rBOxjFj8Ar7=LLo80e8QKhYn3g@mail.gmail.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
         <20200715202233.185680-9-ezequiel@collabora.com>
         <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
         <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
         <CAAFQd5DVfroAXRw+OT=EktDtVzRjPZYxnUS8daWQ5=3LLwn=SA@mail.gmail.com>
         <e49635b95db0e295a85f1be9a3909f7f29495e3a.camel@collabora.com>
         <CAAFQd5AeMcqk1MpWNeh1Vgt2rBOxjFj8Ar7=LLo80e8QKhYn3g@mail.gmail.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-I2CSNZITBQto0ikavh36"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-I2CSNZITBQto0ikavh36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 27 juillet 2020 =C3=A0 20:10 +0200, Tomasz Figa a =C3=A9crit :
> On Mon, Jul 27, 2020 at 6:18 PM Ezequiel Garcia <ezequiel@collabora.com> =
wrote:
> > On Mon, 2020-07-27 at 16:52 +0200, Tomasz Figa wrote:
> > > On Mon, Jul 27, 2020 at 4:39 PM Ezequiel Garcia <ezequiel@collabora.c=
om> wrote:
> > > > Hi Alexandre,
> > > >=20
> > > > Thanks a lot for the review.
> > > >=20
> > > > On Sat, 2020-07-25 at 23:34 +0900, Alexandre Courbot wrote:
> > > > > On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabo=
ra.com> wrote:
> > > > > > The H.264 specification requires in its "Slice header semantics=
"
> > > > > > section that the following values shall be the same in all slic=
e headers:
> > > > > >=20
> > > > > >   pic_parameter_set_id
> > > > > >   frame_num
> > > > > >   field_pic_flag
> > > > > >   bottom_field_flag
> > > > > >   idr_pic_id
> > > > > >   pic_order_cnt_lsb
> > > > > >   delta_pic_order_cnt_bottom
> > > > > >   delta_pic_order_cnt[ 0 ]
> > > > > >   delta_pic_order_cnt[ 1 ]
> > > > > >   sp_for_switch_flag
> > > > > >   slice_group_change_cycle
> > > > > >=20
> > > > > > and can therefore be moved to the per-frame decode parameters c=
ontrol.
> > > > >=20
> > > > > I am really not a H.264 expert, so this question may not be relev=
ant,
> > > >=20
> > > > All questions are welcome. I'm more than happy to discuss this patc=
hset.
> > > >=20
> > > > > but are these values specified for every slice header in the
> > > > > bitstream, or are they specified only once per frame?
> > > > >=20
> > > > > I am asking this because it would certainly make user-space code
> > > > > simpler if we could remain as close to the bitstream as possible.=
 If
> > > > > these values are specified once per slice, then factorizing them =
would
> > > > > leave user-space with the burden of deciding what to do if they c=
hange
> > > > > across slices.
> > > > >=20
> > > > > Note that this is a double-edged sword, because it is not necessa=
rily
> > > > > better to leave the firmware in charge of deciding what to do in =
such
> > > > > a case. :) So hopefully these are only specified once per frame i=
n the
> > > > > bitstream, in which case your proposal makes complete sense.
> > > >=20
> > > > Frame-based hardwares accelerators such as Hantro and Rockchip VDEC
> > > > are doing the slice header parsing themselves. Therefore, the
> > > > driver is not really parsing these fields on each slice header.
> > > >=20
> > > > Currently, we are already using only the first slice in a frame,
> > > > as you can see from:
> > > >=20
> > > >         if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
> > > >                 reg |=3D G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
> > > >=20
> > > > Even if these fields are transported in the slice header,
> > > > I think it makes sense for us to split them into the decode params
> > > > (per-frame) control.
> > > >=20
> > > > They are really specified to be the same across all slices,
> > > > so even I'd say if a bitstream violates this, it's likely
> > > > either a corrupted bitstream or an encoder bug.
> > > >=20
> > > > OTOH, one thing this makes me realize is that the slice params cont=
rol
> > > > is wrongly specified as an array.
> > >=20
> > > It is _not_.
> > >=20
> >=20
> > We introduced the hold capture buffer specifically to support
> > this without having a slice array.
> >=20
> > I don't think we have a plan to support this control properly
> > as an array.
> >=20
> > If we decide to support the slice control as an array,
> > we would have to implement a mechanism to specify the array size,
> > which we currently don't have AFAIK.
> >=20
>=20
> That wasn't the conclusion when we discussed this last time on IRC.
> +Nicolas Dufresne
>=20
> Currently the 1-slice per buffer model is quite impractical:
> 1) the maximum number of buffers is 32, which for some streams can be
> less than needed to queue a single frame,

To give more context, it seems the discussion was about being able to
use slice decoder with a 1 poll() per frame model. Of course this will
never be as efficient as when using a frame base decoder, but as
current design, you can keep a list of pending request (each request is
1 slice/buffer), and simply use memory pressure to poll a mid point and
dequeue the remaining. An example, yo have 8 pending request, and reach
your memory limit:
 =20
  [R1, R2, R3, R4, R5, R6, R7, R8]

As requests are in order and behaves like memory fences, you can pick
R6, and poll() that one. When R6 is ready, you can then dequeue R1 to
R6 without blocking. In this context, a limit of 16 or 32 buffers seems
fair, the optimization we can do in userspace is likely sufficient. So
I'd like to drop problem 1) from our list.

> 2) even more system call overhead due to the need to repeat various
> operations (e.g. qbuf/dqbuf) per-slice rather than per-frame,
> 3) no way to do hardware batching for hardware which supports queuing
> multiple slices at a time,
> 4) waste of memory - one needs to allocate all the OUTPUT buffers
> pessimistically to accommodate the biggest possible slice, while with
> all-slices-per-frame 1 buffer could be just heuristically allocated to
> be enough for the whole frame.
>=20
> These need to be carefully evaluated, with some proper testing done to
> confirm whether they are really a problem or not.

2, 3 and 4 seems to match what the currently unimplemented API propose.
You can mitigate 2) but having multiple slices per buffers. That came
with a byte offset to we can program the HW as if it was separate slice
buffers. But was limited to 16 buffers, likely a fair compromise.

3) is about batching, in the only use case we know, the batching
acceleration consist of programming the next operation on the
completion IRQ. I already looked with the Cedrus developers if and how
that was feasible, but we don't have a PoC yet. The optimization is
about removing context switches between operations, which could prevent
fully using the HW.

4) is also well covered with being able to multiplex 1 buffer with
multiple slices.

To be fair, I understand why we'd like to drop this API, as none of the
active developers here of slice decoder (cedrus) have time to engage in
supporting this untested "optimization". It's not only about kernel
support, but also requires userspace work. I also agree that it could
be added later, as an extension. It could be done with 3 new controls,
an array of slice_params and an array of slice start offset and the
number of slices, or just one, introduce a new structure that have a
slice_params structure embedded, num_slices and an array of
slice_start_offset. I don't have preference myself, but I'm just
illustrating that yes, we could drop the slice batching to avoid
pushing untested APIs without scarifying our ability to decode a valid
stream.

>=20
> > > > Namely, this text
> > > > should be removed:
> > > >=20
> > > >        This structure is expected to be passed as an array, with on=
e
> > > >        entry for each slice included in the bitstream buffer.
> > > >=20
> > > > As the API is really not defined that way.
> > > >=20
> > > > I'll remove that on next iteration.
> > >=20
> > > The v4l2_ctrl_h264_slice_params struct has more data than those that
> > > are deemed to be the same across all the slices. A remarkable example
> > > are the size and start_byte_offset fields.
> >=20
> > Not sure how this applies to this discussion.
>=20
> These fields need to be specified for each slice in the buffer to make
> it possible to handle multiple slices per buffer.
>=20
> Best regards,
> Tomasz

--=-I2CSNZITBQto0ikavh36
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXx8udAAKCRBxUwItrAao
HO8iAJ9Iu/bekf0T/cMTEzaJM8oZQwJvfgCeMMAuRTuDSsg/J+CoTqXG/xOGdZE=
=3UbG
-----END PGP SIGNATURE-----

--=-I2CSNZITBQto0ikavh36--

