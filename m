Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9FEA7923F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 19:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbfG2Rha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 13:37:30 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:34075 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbfG2Rh3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 13:37:29 -0400
Received: by mail-vk1-f195.google.com with SMTP id v68so8465116vkd.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 10:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=WREgU9er8eg1XhXxkf7aKwLaIpYs86AtZx68YBnWOWA=;
        b=j3IpZdirwbG6ZjfCueu0dyz66I2Ine3mU4iQAoUhHDHRQBOtHbHYRzc3Bf6Dq91Dmh
         Ll3kp+5923BpFQSvDZ/0vNja1VNzRb6ZCJ6EJuGQZsJn6G6p9YKz6zKKBeVHSKLROfEG
         IAZfQ3cR7Ox2XfPfx/uw3jhhyZNNipxylwF5GjhW2+H0AeVbItLVZpy69MJaL7WV/7zj
         4Tp40D/ykrW3ZUls3oxeoasX1sUCMff3qSFZ37uY3drVOUl7wz/vjoyozDXF6F3VV4UV
         TJHDpii4Ynq9A+wyNIYineBX3X5L2UgsAvkJaPMqQdW/ZD15Zlt7teXYS7JNfQEAcRcP
         BgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=WREgU9er8eg1XhXxkf7aKwLaIpYs86AtZx68YBnWOWA=;
        b=lGw9ThdnOsLNaKQJM/1YmVqGQGGYMRz1f1bEYDj35J2RJH4PLvLlDq9MXauuzIYQoe
         xAdW6EdoTKYhy/0e3EH8xhxq+8fUmDJVCyPlxYzHYfB3NpOAWW2m0b0ZxImnwZ963AfP
         aY7eim1SlvC0z/iJCbrfOamowtV95odRUbBQborhhMgeE+gTytVNu7uI5FgZKi7krV7U
         GLGL40s/bOrHPhpWmDWPdW8G52YP8yLYFP+Eq/oeExJ5Y8jlY4DFqQ43XYi0xL/J+6Nf
         lxVmSS/jvZMzzHzc+0Rp7J56PTC7a4Iyy5n/z9aJ/7HtUMVGHE0vhE4DsJNaDBYW/iL6
         dz2A==
X-Gm-Message-State: APjAAAXIOLFQhz8EMa2PoBV2Qb1x1U5TYYiU14PJ9q2fisicpmszLrHO
        QRmJQgvL/Gak0KUJ8CxiiIA=
X-Google-Smtp-Source: APXvYqy6Gcm1LTfm+/fMLfI+zVDrilkZ8cLAVTcOuBeVDOF+Tj0PpocoSUafa2HuG7BfCZ0UrNsvog==
X-Received: by 2002:a1f:e586:: with SMTP id c128mr37794796vkh.44.1564421847883;
        Mon, 29 Jul 2019 10:37:27 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id w9sm27320284vkd.41.2019.07.29.10.37.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 10:37:26 -0700 (PDT)
Message-ID: <6bf28c76757b2901f5105677fb9c453476085690.camel@ndufresne.ca>
Subject: Re: [PATCH 00/14] Stateful/stateless codec core support (resend)
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Chen-Yu Tsai <wens@kernel.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Mon, 29 Jul 2019 13:37:24 -0400
In-Reply-To: <1660d45a-00b0-3909-84e7-1bd58bc2972d@xs4all.nl>
References: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
         <CAMO6naxRxk8cLTNrfHjWspJVguA3=HLPsqne=eNhraRYjAzCZg@mail.gmail.com>
         <CAGb2v65p_U64aGwnq4c373VB9dN7XG=jHgzQ76XLH6-7A+j4xA@mail.gmail.com>
         <1660d45a-00b0-3909-84e7-1bd58bc2972d@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-Qf6SEx+YSghF/hdBDd+A"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-Qf6SEx+YSghF/hdBDd+A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 26 juillet 2019 =C3=A0 12:02 +0200, Hans Verkuil a =C3=A9crit :
> On 7/26/19 11:56 AM, Chen-Yu Tsai wrote:
> > On Fri, Jul 26, 2019 at 5:50 PM Maxime Jourdan <mjourdan@baylibre.com> =
wrote:
> > > On Wed, Jul 24, 2019 at 1:27 PM Hans Verkuil <hverkuil-cisco@xs4all.n=
l> wrote:
> > > > (There were too many recipients for my provider, so resending
> > > > again without the zillion CCs, and in batches of 5 patches. Stupid
> > > > spammer detection...)
> > > >=20
> > > > This series consolidates various patches/patch series that add
> > > > features or document memory-to-memory video codec interfaces.
> > > >=20
> > > > This includes patches adding V4L2_FMT_FLAG_DYN_RESOLUTION,
> > > > new code adding V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER, new code
> > > > adding V4L2_DEC_CMD_FLUSH, patches adding V4L2_BUF_FLAG_M2M_HOLD_CA=
PTURE_BUF
> > > > (now with documentation) and patches documenting the stateful
> > > > encoder/decoder and stateless decoder.
> > > >=20
> > > > The stateful encoder documentation is still RFC quality (there are
> > > > open TODOs, see https://patchwork.kernel.org/cover/10972783/).
> > > >=20
> > > > The stateless decoder documentation is the same as the v5 posted
> > > > by Alexandre, but with my comments incorporated.
> > > >=20
> > > > Also added are updated pixelformat descriptions. Please review this=
!
> > > > I didn't update the MPEG4 format since I'm not sure what to put the=
re.
> > > >=20
> > > > If anyone has access to recent codec standards, then I would really
> > > > like to have the right references to 'MPEG Picture' and 'Access Uni=
t'.
> > > > It would be good to just refer to the definition of what a Picture
> > > > or Access Unit is in the right standards.
> > > >=20
> > > > Changes for the stateful decoder documentation since v4:
> > > >=20
> > > > - In the Decoding section change "multiple ``OUTPUT`` buffers gener=
ate
> > > >   one ``CAPTURE`` buffer: timestamp of the ``OUTPUT`` buffer queued=
 last
> > > >   will be copied." to "queued first" since this corresponds to
> > > >   existing implementations.
> > > >=20
> > > > - Document that width and height are required fields in step 4 of t=
he
> > > >   Capture Setup.
> > > >=20
> > > > - Mention the new ENUM_FMT flags.
> > > >=20
> > > > Changes for the stateless decoder documentation since v5:
> > > >=20
> > > > - Document that width and height are required fields in step 4 of t=
he
> > > >   Capture Setup.
> > > >=20
> > > > - Mention the new V4L2_DEC_CMD_FLUSH command to flush the last held
> > > >   capture buffer. This replaces the 'queue an empty buffer' solutio=
n.
> > > >=20
> > > > In my view this series is ready to go in, except for the last patch
> > > > (stateful encoder).
> > > >=20
> > > > Maxime, I didn't add the proposed V4L2_FMT_FLAG_MANUAL_RESOLUTION
> > > > flag since I think that can go in separately. I also am not 100%
> > > > happy with that name, although I can't think of a better one.
> > > >=20
> > >=20
> > > Sure! I can prepare an RFC once this series lands if you wish.
> > >=20
> > > > Regards,
> > > >=20
> > > >         Hans
> > > >=20
> > > > Alexandre Courbot (1):
> > > >   media: docs-rst: Document m2m stateless video decoder interface
> > > >=20
> > > > Hans Verkuil (6):
> > > >   v4l2-ioctl.c: OR flags in v4l_fill_fmtdesc(), not don't overwrite
> > > >   videodev2.h: add V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER
> > > >   videodev2.h.rst.exceptions: tymecode -> timecode
> > > >   vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
> > > >   videodev2.h: add V4L2_DEC_CMD_FLUSH
> > > >   pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentat=
ion
> > > >=20
> > > > Maxime Jourdan (5):
> > > >   videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
> > > >   media: venus: vdec: flag OUTPUT formats with
> > > >     V4L2_FMT_FLAG_DYN_RESOLUTION
> > > >   media: s5p_mfc_dec: set flags for OUTPUT coded formats
> > > >   media: mtk-vcodec: flag OUTPUT formats with
> > > >     V4L2_FMT_FLAG_DYN_RESOLUTION
> > > >   media: vicodec: set flags for vdec/stateful OUTPUT coded formats
> > > >=20
> > > > Tomasz Figa (2):
> > > >   media: docs-rst: Document memory-to-memory video decoder interfac=
e
> > > >   media: docs-rst: Document memory-to-memory video encoder interfac=
e
> > > >=20
> > > >  Documentation/media/uapi/v4l/buffer.rst       |   13 +
> > > >  Documentation/media/uapi/v4l/dev-decoder.rst  | 1101 +++++++++++++=
++++
> > > >  Documentation/media/uapi/v4l/dev-encoder.rst  |  608 +++++++++
> > > >  Documentation/media/uapi/v4l/dev-mem2mem.rst  |   10 +-
> > > >  .../media/uapi/v4l/dev-stateless-decoder.rst  |  424 +++++++
> > > >  .../media/uapi/v4l/pixfmt-compressed.rst      |   36 +-
> > > >  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   10 +
> > > >  Documentation/media/uapi/v4l/v4l2.rst         |   12 +-
> > > >  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   52 +-
> > > >  .../media/uapi/v4l/vidioc-dqevent.rst         |   11 +-
> > > >  .../media/uapi/v4l/vidioc-encoder-cmd.rst     |   51 +-
> > > >  .../media/uapi/v4l/vidioc-enum-fmt.rst        |   16 +
> > > >  .../media/uapi/v4l/vidioc-reqbufs.rst         |    6 +
> > > >  .../media/videodev2.h.rst.exceptions          |    7 +-
> > > >  .../media/common/videobuf2/videobuf2-v4l2.c   |    8 +-
> > > >  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |    4 +
> > > >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |    1 +
> > > >  drivers/media/platform/qcom/venus/core.h      |    1 +
> > > >  drivers/media/platform/qcom/venus/vdec.c      |   11 +
> > > >  .../media/platform/s5p-mfc/s5p_mfc_common.h   |    1 +
> > > >  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   18 +
> > > >  drivers/media/platform/vicodec/vicodec-core.c |    3 +
> > > >  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +-
> > > >  include/media/v4l2-mem2mem.h                  |   42 +
> > > >  include/media/videobuf2-core.h                |    3 +
> > > >  include/media/videobuf2-v4l2.h                |    5 +
> > > >  include/uapi/linux/videodev2.h                |   20 +-
> > > >  27 files changed, 2419 insertions(+), 57 deletions(-)
> > > >  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
> > > >  create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst
> > > >  create mode 100644 Documentation/media/uapi/v4l/dev-stateless-deco=
der.rst
> > > >=20
> > > > --
> > > > 2.20.1
> > > >=20
> > >=20
> > > Thank you for including my series with your modifications on top.
> > >=20
> > > The patches regarding stateful decoders are fine by me. To nitpick, I
> > > would maybe rename V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER to something
> > > such as:
> > >  - V4L2_FMT_FLAG_FLEXIBLE_BITSTREAM_PARSER
> > >  - V4L2_FMT_FLAG_PERMISSIVE_BITSTREAM_PARSER
> > >=20
> > > Since by definition a stateful decoder is able to parse the bitstream=
,
> > > it could be a bit confusing to see a format without
> > > V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER, something actually quite common.
> > > But it is all well explained in the format documentation (patch 11/14=
)
> > > and is of low-ish importance, so I don't really mind either.
> >=20
> > Out of curiosity, would the new flags mean people have to update
> > userspace applications to check for them? I mean, stateful decoders
> > already "just work" right now, don't they? At least that was my
> > impression playing with the out-of-tree bcm2835-codec.
>=20
> Kind of. Some stateful codecs still require userspace to do some
> preparsing and give them buffers containing the Access Unit (H264).
> This is what e.g. gstreamer and ffmpeg do, and so that works. But such
> drivers can't handle the case where you just feed them a raw bitstream,
> and that was never documented.
>=20
> So we're tightening the spec reflecting what is actually used. And adding
> a new flag to tell userspace that there is a full parser so you don't
> have to split up the bitstream.

On top of this, V4L2_FMT_FLAG_DYN_RESOLUTION is what will allow adding
support for CODEC driven resolution change, and CODEC driven sync
detection. This should make things a little more robust and eventually
should also allow gapless resolution changes.

At the moment, in GStreamer we completely drain and stop the decoder
whenever a resolution change is detected which introduce a long delay.
With V4L2_FMT_FLAG_DYN_RESOLUTION enabled drivers, we'll be able to
start queuing the encoded data for the new resolution in before the
capture buffers are re-allocated.

>=20
> Regards,
>=20
> 	Hans

--=-Qf6SEx+YSghF/hdBDd+A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXT8u1AAKCRBxUwItrAao
HLeZAJ9EGZTEOV43tZuWDE1APA4+IrvzFwCfbeLizF9jOUdWRTPFwmN9avdkxTE=
=plHC
-----END PGP SIGNATURE-----

--=-Qf6SEx+YSghF/hdBDd+A--

