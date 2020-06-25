Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C45320A100
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 16:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405378AbgFYOmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 10:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405340AbgFYOmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 10:42:55 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7028EC08C5C1;
        Thu, 25 Jun 2020 07:42:54 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id E14B42A5073
Message-ID: <dc584b3a4eebdf259e555200dbc4bf8467d60591.camel@collabora.com>
Subject: Re: [RFC 0/7] media: Clean and make H264 stateless uAPI public
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu, 25 Jun 2020 10:42:48 -0400
In-Reply-To: <20200623182809.1375-1-ezequiel@collabora.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-HCoWxv4QLGgZqLc/WquU"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-HCoWxv4QLGgZqLc/WquU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 23 juin 2020 =C3=A0 15:28 -0300, Ezequiel Garcia a =C3=A9crit :
> The recent patch posted by Jernej (which I'm including for context),
> encouraged me to address all the known issues in the uAPI.
>=20
> I hope we can finally make this uAPI interface
> public; it would be nice to address the other codec
> interfaces so we can move the codec drivers out of staging.
>=20
> It should be noted that there is already GStreamer native
> support for this interface, which will be part of 1.18,
> once it's released [1], as well as support in Chromium [2].

Keep in mind, no one did a MultiView and/or SVC implementation in
userspace yet. Multiview seems to share a lot of interlacing, which
ffmpeg implementation covers, but some validation would be nice.

As for SVC, I only started looking at that this means for decoding. It
looks like buffer "holding" mechanism is mostly what we need, I'd would
simply like to verify, as I was told that scaling down might be
required when SVC stream is missing (but perhaps this is optional ?)

>=20
> The basic idea here is to sanitize the interface,
> making sure the structs are aligned to 64-bit,
> adding reserved fields for padding where suitable.
>=20
> These reserved fields can then be used to support future extensions,
> in case such need appears.
>=20
> In addition to this, moving the slice invariant fields
> to the per-frame control, makes the frame-mode driver
> implementation much nicer and the interface; see patch 6/7 for details.
>=20
> I'm not adding a MAINTAINERS entry, but I'd like to do so,
> so we make sure any uAPI changes are sent to those involved.
>=20
> Another potential change is the addition of a "Since:" tag to the
> control specification, so we can document which kernel version
> added the interface. This might prove useful if reserved
> fields are then used to extend the interface.
>=20
> Finally, I'm sneaking here a change from Philipp Zabel
> which apparently fell thru the cracks.

Thanks a lot of working on this.

>=20
> [1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/tree/maste=
r/sys/v4l2codecs
> [2] https://chromium.googlesource.com/chromium/src.git/+/refs/heads/maste=
r/media/gpu/v4l2/
>=20
> Ezequiel Garcia (5):
>   fixup! media: uapi: h264: update reference lists
>   media: uapi: h264: increase size of fields
>   media: uapi: h264: pad v4l2_ctrl_h264_pps to 64-bit
>   media: uapi: h264: Clean slice invariants syntax elements
>   media: uapi: make H264 stateless codec interface public
>=20
> Jernej Skrabec (1):
>   media: uapi: h264: update reference lists
>=20
> Philipp Zabel (1):
>   media: uapi: h264: clarify pic_order_cnt_bit_size field
>=20
>  .../media/v4l/ext-ctrls-codec.rst             | 135 ++++++++++++------
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  31 ++++
>  drivers/media/v4l2-core/v4l2-h264.c           |   8 +-
>  .../staging/media/hantro/hantro_g1_h264_dec.c |  21 ++-
>  drivers/staging/media/hantro/hantro_h264.c    |   3 +-
>  drivers/staging/media/hantro/hantro_hw.h      |   5 +-
>  drivers/staging/media/rkvdec/rkvdec-h264.c    |   6 +-
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  15 +-
>  include/media/v4l2-ctrls.h                    |   3 +-
>  include/media/v4l2-h264.h                     |   5 +-
>  .../linux/v4l2-h264-ctrls.h}                  |  73 ++++++----
>  11 files changed, 194 insertions(+), 111 deletions(-)
>  rename include/{media/h264-ctrls.h =3D> uapi/linux/v4l2-h264-ctrls.h} (8=
8%)
>=20

--=-HCoWxv4QLGgZqLc/WquU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXvS36AAKCRBxUwItrAao
HI/OAKDYK//qcJ5LXqGIBBjLa+eHSxO40QCaA4bUa9ALKuqrtC3OJUKzx9Kd4zc=
=3NNq
-----END PGP SIGNATURE-----

--=-HCoWxv4QLGgZqLc/WquU--

