Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10EC66ED79
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2019 05:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390443AbfGTDI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 23:08:28 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:45232 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727602AbfGTDI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 23:08:28 -0400
Received: by mail-vs1-f66.google.com with SMTP id h28so22749832vsl.12
        for <linux-media@vger.kernel.org>; Fri, 19 Jul 2019 20:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=BxzSe/xkK+aARbO6gOedvQnBC3AFjbuKq1Y+khJTFTY=;
        b=RCQ0LSxHyzHwsZbi8TbDDRlhN+yncWpToMN+voh/k5tbkgKSKA5Iej5Ku0d92kgnHM
         5Ea+ltDU2Y+xUzw5TK3ZOhr7b6VSNfmitK9XoYXn2+vKo1Xmh7yyDA3jKma46R9nNIhm
         6ThGA+JPp8H7+fNcMCIYZqbx4524n9Wg+ocXlCbys+lfXy3w1tvNt20li//QQhJmzhFJ
         KMSPWTgLgKAxDfZrwIY3/Z2saxw+gsxCjr8bBWmpShxAyHF6kFC2Q/PnOXjRnF4nMKKE
         h+TFhEIFkg6uIxRMxbPeomuIDugwXuKXF5vVdhxxxf+gJdoDwTohdFqHfxADBWYJZciI
         bJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=BxzSe/xkK+aARbO6gOedvQnBC3AFjbuKq1Y+khJTFTY=;
        b=j9K4UrOKlwgRhXiBu1sCE86QDLq4XIJp6K5i5bieQjIgs4qcvsZ7Jrp9YMrhI4eCtH
         1BSLiDmKLk9SZxkXj+vF4am5nhZjmkxndM+U6FVlLrgoRnrjO04trn8iJ58mlE92I8gd
         kZgA3ntJX6v5d27YHCJSJpzQdN3I1SK4AoyTMz0K/31N+cZI5HD+EltOczkN3vDwSruI
         0K0Mq7CVgigBPfFJ151Ur8yPUrUiW8b2fn8NcnEM0zQkVpjZl/gI24qaPwy+BD4zYTet
         uUVXFrBXuNLVJ0r8GsybcfrBuLzIPYy+1FYQfKuieyckoVBwfRSboFaMPSdD0ytm6VRW
         GROg==
X-Gm-Message-State: APjAAAU3Jf5cis9tr3FjA6AmkP6YfenIJRHxPiiaM+OlvSW6g5fJgYWW
        Tw49yNc2twbg8HlpwpPYkHE=
X-Google-Smtp-Source: APXvYqx034NFvvcDIhj4NA6eBL5mzkvPExBNcEfMoOhV+xKldP8TNrfCrdSMKUElTb0vW1z8pZ5wrg==
X-Received: by 2002:a67:c507:: with SMTP id e7mr34176828vsk.65.1563592105863;
        Fri, 19 Jul 2019 20:08:25 -0700 (PDT)
Received: from tpx230-nicolas ([63.237.252.15])
        by smtp.gmail.com with ESMTPSA id u65sm6894142vsu.34.2019.07.19.20.08.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 20:08:23 -0700 (PDT)
Message-ID: <510b55d59f19f1f90c98d68ffff643e799f28010.camel@ndufresne.ca>
Subject: Re: [PATCHv4 1/2] media: docs-rst: Document memory-to-memory video
 decoder interface
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Date:   Fri, 19 Jul 2019 23:08:21 -0400
In-Reply-To: <CAAFQd5BwM7mDOs-jTyT_b=1=BxwiKrdbjCFgQv1umuy4guZKbw@mail.gmail.com>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
         <20190603112835.19661-2-hverkuil-cisco@xs4all.nl>
         <4feacf8e6c5389ee0a3ff5e9b8611b05f6592c3c.camel@ndufresne.ca>
         <CAAFQd5BwM7mDOs-jTyT_b=1=BxwiKrdbjCFgQv1umuy4guZKbw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-69PNId784cO30llq+xkF"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-69PNId784cO30llq+xkF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 19 juillet 2019 =C3=A0 14:45 +0900, Tomasz Figa a =C3=A9crit :
> On Wed, Jul 17, 2019 at 9:18 PM Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> > Hello,
> >=20
> > there is one little detail/proposal, see inline .
> >=20
> > Le lundi 03 juin 2019 =C3=A0 13:28 +0200, Hans Verkuil a =C3=A9crit :
> > > From: Tomasz Figa <tfiga@chromium.org>
> > >=20
> > > Due to complexity of the video decoding process, the V4L2 drivers of
> > > stateful decoder hardware require specific sequences of V4L2 API call=
s
> > > to be followed. These include capability enumeration, initialization,
> > > decoding, seek, pause, dynamic resolution change, drain and end of
> > > stream.
> > >=20
> > > Specifics of the above have been discussed during Media Workshops at
> > > LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > > Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API tha=
t
> > > originated at those events was later implemented by the drivers we al=
ready
> > > have merged in mainline, such as s5p-mfc or coda.
> > >=20
> > > The only thing missing was the real specification included as a part =
of
> > > Linux Media documentation. Fix it now and document the decoder part o=
f
> > > the Codec API.
> > >=20
> > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > ---
> > >  Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 +++++++++++++++=
++
> > >  Documentation/media/uapi/v4l/dev-mem2mem.rst  |    8 +-
> > >  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |    5 +
> > >  Documentation/media/uapi/v4l/v4l2.rst         |   10 +-
> > >  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
> > >  5 files changed, 1132 insertions(+), 16 deletions(-)
> > >  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
> > >=20
> > > diff --git a/Documentation/media/uapi/v4l/dev-decoder.rst b/Documenta=
tion/media/uapi/v4l/dev-decoder.rst
> > > new file mode 100644
> > > index 000000000000..b106f2d97c48
> > > --- /dev/null
> > > +++ b/Documentation/media/uapi/v4l/dev-decoder.rst
> > > @@ -0,0 +1,1084 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +.. _decoder:
> > > +
> > > +*************************************************
> > > +Memory-to-memory Stateful Video Decoder Interface
> > > +*************************************************
> > > +
> > > +A stateful video decoder takes complete chunks of the bitstream (e.g=
. Annex-B
> > > +H.264/HEVC stream, raw VP8/9 stream) and decodes them into raw video=
 frames in
> > > +display order. The decoder is expected not to require any additional=
 information
> > > +from the client to process these buffers.
> > > +
> > > +Performing software parsing, processing etc. of the stream in the dr=
iver in
> > > +order to support this interface is strongly discouraged. In case suc=
h
> > > +operations are needed, use of the Stateless Video Decoder Interface =
(in
> > > +development) is strongly advised.
> > > +
> > > +Conventions and notation used in this document
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +1. The general V4L2 API rules apply if not specified in this documen=
t
> > > +   otherwise.
> > > +
> > > +2. The meaning of words "must", "may", "should", etc. is as per `RFC
> > > +   2119 <https://tools.ietf.org/html/rfc2119>`_.
> > > +
> > > +3. All steps not marked "optional" are required.
> > > +
> > > +4. :c:func:`VIDIOC_G_EXT_CTRLS` and :c:func:`VIDIOC_S_EXT_CTRLS` may=
 be used
> > > +   interchangeably with :c:func:`VIDIOC_G_CTRL` and :c:func:`VIDIOC_=
S_CTRL`,
> > > +   unless specified otherwise.
> > > +
> > > +5. Single-planar API (see :ref:`planar-apis`) and applicable structu=
res may be
> > > +   used interchangeably with multi-planar API, unless specified othe=
rwise,
> > > +   depending on decoder capabilities and following the general V4L2 =
guidelines.
> > > +
> > > +6. i =3D [a..b]: sequence of integers from a to b, inclusive, i.e. i=
 =3D
> > > +   [0..2]: i =3D 0, 1, 2.
> > > +
> > > +7. Given an ``OUTPUT`` buffer A, then A=E2=80=99 represents a buffer=
 on the ``CAPTURE``
> > > +   queue containing data that resulted from processing buffer A.
> > > +
> > > +.. _decoder-glossary:
> > > +
> > > +Glossary
> > > +=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +CAPTURE
> > > +   the destination buffer queue; for decoders, the queue of buffers =
containing
> > > +   decoded frames; for encoders, the queue of buffers containing an =
encoded
> > > +   bitstream; ``V4L2_BUF_TYPE_VIDEO_CAPTURE`` or
> > > +   ``V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE``; data is captured from the=
 hardware
> > > +   into ``CAPTURE`` buffers.
> > > +
> > > +client
> > > +   the application communicating with the decoder or encoder impleme=
nting
> > > +   this interface.
> > > +
> > > +coded format
> > > +   encoded/compressed video bitstream format (e.g. H.264, VP8, etc.)=
; see
> > > +   also: raw format.
> > > +
> > > +coded height
> > > +   height for given coded resolution.
> > > +
> > > +coded resolution
> > > +   stream resolution in pixels aligned to codec and hardware require=
ments;
> > > +   typically visible resolution rounded up to full macroblocks;
> > > +   see also: visible resolution.
> > > +
> > > +coded width
> > > +   width for given coded resolution.
> > > +
> > > +decode order
> > > +   the order in which frames are decoded; may differ from display or=
der if the
> > > +   coded format includes a feature of frame reordering; for decoders=
,
> > > +   ``OUTPUT`` buffers must be queued by the client in decode order; =
for
> > > +   encoders ``CAPTURE`` buffers must be returned by the encoder in d=
ecode order.
> > > +
> > > +destination
> > > +   data resulting from the decode process; see ``CAPTURE``.
> > > +
> > > +display order
> > > +   the order in which frames must be displayed; for encoders, ``OUTP=
UT``
> > > +   buffers must be queued by the client in display order; for decode=
rs,
> > > +   ``CAPTURE`` buffers must be returned by the decoder in display or=
der.
> > > +
> > > +DPB
> > > +   Decoded Picture Buffer; an H.264/HEVC term for a buffer that stor=
es a decoded
> > > +   raw frame available for reference in further decoding steps.
> > > +
> > > +EOS
> > > +   end of stream.
> > > +
> > > +IDR
> > > +   Instantaneous Decoder Refresh; a type of a keyframe in an H.264/H=
EVC-encoded
> > > +   stream, which clears the list of earlier reference frames (DPBs).
> > > +
> > > +keyframe
> > > +   an encoded frame that does not reference frames decoded earlier, =
i.e.
> > > +   can be decoded fully on its own.
> > > +
> > > +macroblock
> > > +   a processing unit in image and video compression formats based on=
 linear
> > > +   block transforms (e.g. H.264, VP8, VP9); codec-specific, but for =
most of
> > > +   popular codecs the size is 16x16 samples (pixels).
> > > +
> > > +OUTPUT
> > > +   the source buffer queue; for decoders, the queue of buffers conta=
ining
> > > +   an encoded bitstream; for encoders, the queue of buffers containi=
ng raw
> > > +   frames; ``V4L2_BUF_TYPE_VIDEO_OUTPUT`` or
> > > +   ``V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE``; the hardware is fed with d=
ata
> > > +   from ``OUTPUT`` buffers.
> > > +
> > > +PPS
> > > +   Picture Parameter Set; a type of metadata entity in an H.264/HEVC=
 bitstream.
> > > +
> > > +raw format
> > > +   uncompressed format containing raw pixel data (e.g. YUV, RGB form=
ats).
> > > +
> > > +resume point
> > > +   a point in the bitstream from which decoding may start/continue, =
without
> > > +   any previous state/data present, e.g.: a keyframe (VP8/VP9) or
> > > +   SPS/PPS/IDR sequence (H.264/HEVC); a resume point is required to =
start decode
> > > +   of a new stream, or to resume decoding after a seek.
> > > +
> > > +source
> > > +   data fed to the decoder or encoder; see ``OUTPUT``.
> > > +
> > > +source height
> > > +   height in pixels for given source resolution; relevant to encoder=
s only.
> > > +
> > > +source resolution
> > > +   resolution in pixels of source frames being source to the encoder=
 and
> > > +   subject to further cropping to the bounds of visible resolution; =
relevant to
> > > +   encoders only.
> > > +
> > > +source width
> > > +   width in pixels for given source resolution; relevant to encoders=
 only.
> > > +
> > > +SPS
> > > +   Sequence Parameter Set; a type of metadata entity in an H.264/HEV=
C bitstream.
> > > +
> > > +stream metadata
> > > +   additional (non-visual) information contained inside encoded bits=
tream;
> > > +   for example: coded resolution, visible resolution, codec profile.
> > > +
> > > +visible height
> > > +   height for given visible resolution; display height.
> > > +
> > > +visible resolution
> > > +   stream resolution of the visible picture, in pixels, to be used f=
or
> > > +   display purposes; must be smaller or equal to coded resolution;
> > > +   display resolution.
> > > +
> > > +visible width
> > > +   width for given visible resolution; display width.
> > > +
> > > +State machine
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +.. kernel-render:: DOT
> > > +   :alt: DOT digraph of decoder state machine
> > > +   :caption: Decoder state machine
> > > +
> > > +   digraph decoder_state_machine {
> > > +       node [shape =3D doublecircle, label=3D"Decoding"] Decoding;
> > > +
> > > +       node [shape =3D circle, label=3D"Initialization"] Initializat=
ion;
> > > +       node [shape =3D circle, label=3D"Capture\nsetup"] CaptureSetu=
p;
> > > +       node [shape =3D circle, label=3D"Dynamic\nresolution\nchange"=
] ResChange;
> > > +       node [shape =3D circle, label=3D"Stopped"] Stopped;
> > > +       node [shape =3D circle, label=3D"Drain"] Drain;
> > > +       node [shape =3D circle, label=3D"Seek"] Seek;
> > > +       node [shape =3D circle, label=3D"End of stream"] EoS;
> > > +
> > > +       node [shape =3D point]; qi
> > > +       qi -> Initialization [ label =3D "open()" ];
> > > +
> > > +       Initialization -> CaptureSetup [ label =3D "CAPTURE\nformat\n=
established" ];
> > > +
> > > +       CaptureSetup -> Stopped [ label =3D "CAPTURE\nbuffers\nready"=
 ];
> > > +
> > > +       Decoding -> ResChange [ label =3D "Stream\nresolution\nchange=
" ];
> > > +       Decoding -> Drain [ label =3D "V4L2_DEC_CMD_STOP" ];
> > > +       Decoding -> EoS [ label =3D "EoS mark\nin the stream" ];
> > > +       Decoding -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > > +       Decoding -> Stopped [ label =3D "VIDIOC_STREAMOFF(CAPTURE)" ]=
;
> > > +       Decoding -> Decoding;
> > > +
> > > +       ResChange -> CaptureSetup [ label =3D "CAPTURE\nformat\nestab=
lished" ];
> > > +       ResChange -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > > +
> > > +       EoS -> Drain [ label =3D "Implicit\ndrain" ];
> > > +
> > > +       Drain -> Stopped [ label =3D "All CAPTURE\nbuffers dequeued\n=
or\nVIDIOC_STREAMOFF(CAPTURE)" ];
> > > +       Drain -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > > +
> > > +       Seek -> Decoding [ label =3D "VIDIOC_STREAMON(OUTPUT)" ];
> > > +       Seek -> Initialization [ label =3D "VIDIOC_REQBUFS(OUTPUT, 0)=
" ];
> > > +
> > > +       Stopped -> Decoding [ label =3D "V4L2_DEC_CMD_START\nor\nVIDI=
OC_STREAMON(CAPTURE)" ];
> > > +       Stopped -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > > +   }
> > > +
> > > +Querying capabilities
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +1. To enumerate the set of coded formats supported by the decoder, t=
he
> > > +   client may call :c:func:`VIDIOC_ENUM_FMT` on ``OUTPUT``.
> > > +
> > > +   * The full set of supported formats will be returned, regardless =
of the
> > > +     format set on ``CAPTURE``.
> > > +
> > > +2. To enumerate the set of supported raw formats, the client may cal=
l
> > > +   :c:func:`VIDIOC_ENUM_FMT` on ``CAPTURE``.
> > > +
> > > +   * Only the formats supported for the format currently active on `=
`OUTPUT``
> > > +     will be returned.
> > > +
> > > +   * In order to enumerate raw formats supported by a given coded fo=
rmat,
> > > +     the client must first set that coded format on ``OUTPUT`` and t=
hen
> > > +     enumerate formats on ``CAPTURE``.
> > > +
> > > +3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect sup=
ported
> > > +   resolutions for a given format, passing desired pixel format in
> > > +   :c:type:`v4l2_frmsizeenum` ``pixel_format``.
> > > +
> > > +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a coded=
 pixel
> > > +     format will include all possible coded resolutions supported by=
 the
> > > +     decoder for given coded pixel format.
> > > +
> > > +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a raw p=
ixel format
> > > +     will include all possible frame buffer resolutions supported by=
 the
> > > +     decoder for given raw pixel format and the coded format current=
ly set on
> > > +     ``OUTPUT``.
> > > +
> > > +4. Supported profiles and levels for the coded format currently set =
on
> > > +   ``OUTPUT``, if applicable, may be queried using their respective =
controls
> > > +   via :c:func:`VIDIOC_QUERYCTRL`.
> > > +
> > > +Initialization
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +1. Set the coded format on ``OUTPUT`` via :c:func:`VIDIOC_S_FMT`
> > > +
> > > +   * **Required fields:**
> > > +
> > > +     ``type``
> > > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > > +
> > > +     ``pixelformat``
> > > +         a coded pixel format.
> > > +
> > > +     ``width``, ``height``
> > > +         coded resolution of the stream; required only if it cannot =
be parsed
> > > +         from the stream for the given coded format; otherwise the d=
ecoder will
> > > +         use this resolution as a placeholder resolution that will l=
ikely change
> > > +         as soon as it can parse the actual coded resolution from th=
e stream.
> > > +
> > > +     ``sizeimage``
> > > +         desired size of ``OUTPUT`` buffers; the decoder may adjust =
it to
> > > +         match hardware requirements.
> > > +
> > > +     other fields
> > > +         follow standard semantics.
> > > +
> > > +   * **Return fields:**
> > > +
> > > +     ``sizeimage``
> > > +         adjusted size of ``OUTPUT`` buffers.
> > > +
> > > +   * The ``CAPTURE`` format will be updated with an appropriate fram=
e buffer
> > > +     resolution instantly based on the width and height returned by
> > > +     :c:func:`VIDIOC_S_FMT`.
> > > +     However, for coded formats that include stream resolution infor=
mation,
> > > +     after the decoder is done parsing the information from the stre=
am, it will
> > > +     update the ``CAPTURE`` format with new values and signal a sour=
ce change
> > > +     event, regardless of whether they match the values set by the c=
lient or
> > > +     not.
> > > +
> > > +   .. important::
> > > +
> > > +      Changing the ``OUTPUT`` format may change the currently set ``=
CAPTURE``
> > > +      format. How the new ``CAPTURE`` format is determined is up to =
the decoder
> > > +      and the client must ensure it matches its needs afterwards.
> > > +
> > > +2.  Allocate source (bitstream) buffers via :c:func:`VIDIOC_REQBUFS`=
 on
> > > +    ``OUTPUT``.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``count``
> > > +          requested number of buffers to allocate; greater than zero=
.
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > > +
> > > +      ``memory``
> > > +          follows standard semantics.
> > > +
> > > +    * **Return fields:**
> > > +
> > > +      ``count``
> > > +          the actual number of buffers allocated.
> > > +
> > > +    .. warning::
> > > +
> > > +       The actual number of allocated buffers may differ from the ``=
count``
> > > +       given. The client must check the updated value of ``count`` a=
fter the
> > > +       call returns.
> > > +
> > > +    Alternatively, :c:func:`VIDIOC_CREATE_BUFS` on the ``OUTPUT`` qu=
eue can be
> > > +    used to have more control over buffer allocation.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``count``
> > > +          requested number of buffers to allocate; greater than zero=
.
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > > +
> > > +      ``memory``
> > > +          follows standard semantics.
> > > +
> > > +      ``format``
> > > +          follows standard semantics.
> > > +
> > > +    * **Return fields:**
> > > +
> > > +      ``count``
> > > +          adjusted to the number of allocated buffers.
> > > +
> > > +    .. warning::
> > > +
> > > +       The actual number of allocated buffers may differ from the ``=
count``
> > > +       given. The client must check the updated value of ``count`` a=
fter the
> > > +       call returns.
> > > +
> > > +3.  Start streaming on the ``OUTPUT`` queue via :c:func:`VIDIOC_STRE=
AMON`.
> > > +
> > > +4.  **This step only applies to coded formats that contain resolutio=
n information
> > > +    in the stream.** Continue queuing/dequeuing bitstream buffers to=
/from the
> > > +    ``OUTPUT`` queue via :c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_D=
QBUF`. The
> > > +    buffers will be processed and returned to the client in order, u=
ntil
> > > +    required metadata to configure the ``CAPTURE`` queue are found. =
This is
> > > +    indicated by the decoder sending a ``V4L2_EVENT_SOURCE_CHANGE`` =
event with
> > > +    ``changes`` set to ``V4L2_EVENT_SRC_CH_RESOLUTION``.
> > > +
> > > +    * It is not an error if the first buffer does not contain enough=
 data for
> > > +      this to occur. Processing of the buffers will continue as long=
 as more
> > > +      data is needed.
> > > +
> > > +    * If data in a buffer that triggers the event is required to dec=
ode the
> > > +      first frame, it will not be returned to the client, until the
> > > +      initialization sequence completes and the frame is decoded.
> > > +
> > > +    * If the client has not set the coded resolution of the stream o=
n its own,
> > > +      calling :c:func:`VIDIOC_G_FMT`, :c:func:`VIDIOC_S_FMT`,
> > > +      :c:func:`VIDIOC_TRY_FMT` or :c:func:`VIDIOC_REQBUFS` on the ``=
CAPTURE``
> > > +      queue will not return the real values for the stream until a
> > > +      ``V4L2_EVENT_SOURCE_CHANGE`` event is signaled.
> > > +
> > > +    .. important::
> > > +
> > > +       Any client query issued after the decoder queues the event wi=
ll return
> > > +       values applying to the just parsed stream, including queue fo=
rmats,
> > > +       selection rectangles and controls.
> > > +
> > > +    .. note::
> > > +
> > > +       A client capable of acquiring stream parameters from the bits=
tream on
> > > +       its own may attempt to set the width and height of the ``OUTP=
UT`` format
> > > +       to non-zero values matching the coded size of the stream, ski=
p this step
> > > +       and continue with the `Capture setup` sequence. However, it m=
ust not
> > > +       rely on any driver queries regarding stream parameters, such =
as
> > > +       selection rectangles and controls, since the decoder has not =
parsed them
> > > +       from the stream yet. If the values configured by the client d=
o not match
> > > +       those parsed by the decoder, a `Dynamic resolution change` wi=
ll be
> > > +       triggered to reconfigure them.
> > > +
> > > +    .. note::
> > > +
> > > +       No decoded frames are produced during this phase.
> > > +
> > > +5.  Continue with the `Capture setup` sequence.
> > > +
> > > +Capture setup
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +1.  Call :c:func:`VIDIOC_G_FMT` on the ``CAPTURE`` queue to get form=
at for the
> > > +    destination buffers parsed/decoded from the bitstream.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > +
> > > +    * **Return fields:**
> > > +
> > > +      ``width``, ``height``
> > > +          frame buffer resolution for the decoded frames.
> > > +
> > > +      ``pixelformat``
> > > +          pixel format for decoded frames.
> > > +
> > > +      ``num_planes`` (for _MPLANE ``type`` only)
> > > +          number of planes for pixelformat.
> > > +
> > > +      ``sizeimage``, ``bytesperline``
> > > +          as per standard semantics; matching frame buffer format.
> > > +
> > > +    .. note::
> > > +
> > > +       The value of ``pixelformat`` may be any pixel format supporte=
d by the
> > > +       decoder for the current stream. The decoder should choose a
> > > +       preferred/optimal format for the default configuration. For e=
xample, a
> > > +       YUV format may be preferred over an RGB format if an addition=
al
> > > +       conversion step would be required for the latter.
> > > +
> > > +2.  **Optional.** Acquire the visible resolution via
> > > +    :c:func:`VIDIOC_G_SELECTION`.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > +
> > > +      ``target``
> > > +          set to ``V4L2_SEL_TGT_COMPOSE``.
> > > +
> > > +    * **Return fields:**
> > > +
> > > +      ``r.left``, ``r.top``, ``r.width``, ``r.height``
> > > +          the visible rectangle; it must fit within the frame buffer=
 resolution
> > > +          returned by :c:func:`VIDIOC_G_FMT` on ``CAPTURE``.
> > > +
> > > +    * The following selection targets are supported on ``CAPTURE``:
> > > +
> > > +      ``V4L2_SEL_TGT_CROP_BOUNDS``
> > > +          corresponds to the coded resolution of the stream.
> > > +
> > > +      ``V4L2_SEL_TGT_CROP_DEFAULT``
> > > +          the rectangle covering the part of the ``CAPTURE`` buffer =
that
> > > +          contains meaningful picture data (visible area); width and=
 height
> > > +          will be equal to the visible resolution of the stream.
> > > +
> > > +      ``V4L2_SEL_TGT_CROP``
> > > +          the rectangle within the coded resolution to be output to
> > > +          ``CAPTURE``; defaults to ``V4L2_SEL_TGT_CROP_DEFAULT``; re=
ad-only on
> > > +          hardware without additional compose/scaling capabilities.
> > > +
> > > +      ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
> > > +          the maximum rectangle within a ``CAPTURE`` buffer, which t=
he cropped
> > > +          frame can be composed into; equal to ``V4L2_SEL_TGT_CROP``=
 if the
> > > +          hardware does not support compose/scaling.
> > > +
> > > +      ``V4L2_SEL_TGT_COMPOSE_DEFAULT``
> > > +          equal to ``V4L2_SEL_TGT_CROP``.
> > > +
> > > +      ``V4L2_SEL_TGT_COMPOSE``
> > > +          the rectangle inside a ``CAPTURE`` buffer into which the c=
ropped
> > > +          frame is written; defaults to ``V4L2_SEL_TGT_COMPOSE_DEFAU=
LT``;
> > > +          read-only on hardware without additional compose/scaling c=
apabilities.
> > > +
> > > +      ``V4L2_SEL_TGT_COMPOSE_PADDED``
> > > +          the rectangle inside a ``CAPTURE`` buffer which is overwri=
tten by the
> > > +          hardware; equal to ``V4L2_SEL_TGT_COMPOSE`` if the hardwar=
e does not
> > > +          write padding pixels.
> > > +
> > > +    .. warning::
> > > +
> > > +       The values are guaranteed to be meaningful only after the dec=
oder
> > > +       successfully parses the stream metadata. The client must not =
rely on the
> > > +       query before that happens.
> > > +
> > > +3.  **Optional.** Enumerate ``CAPTURE`` formats via :c:func:`VIDIOC_=
ENUM_FMT` on
> > > +    the ``CAPTURE`` queue. Once the stream information is parsed and=
 known, the
> > > +    client may use this ioctl to discover which raw formats are supp=
orted for
> > > +    given stream and select one of them via :c:func:`VIDIOC_S_FMT`.
> > > +
> > > +    .. important::
> > > +
> > > +       The decoder will return only formats supported for the curren=
tly
> > > +       established coded format, as per the ``OUTPUT`` format and/or=
 stream
> > > +       metadata parsed in this initialization sequence, even if more=
 formats
> > > +       may be supported by the decoder in general. In other words, t=
he set
> > > +       returned will be a subset of the initial query mentioned in t=
he
> > > +       `Querying capabilities` section.
> > > +
> > > +       For example, a decoder may support YUV and RGB formats for re=
solutions
> > > +       1920x1088 and lower, but only YUV for higher resolutions (due=
 to
> > > +       hardware limitations). After parsing a resolution of 1920x108=
8 or lower,
> > > +       :c:func:`VIDIOC_ENUM_FMT` may return a set of YUV and RGB pix=
el formats,
> > > +       but after parsing resolution higher than 1920x1088, the decod=
er will not
> > > +       return RGB, unsupported for this resolution.
> > > +
> > > +       However, subsequent resolution change event triggered after
> > > +       discovering a resolution change within the same stream may sw=
itch
> > > +       the stream into a lower resolution and :c:func:`VIDIOC_ENUM_F=
MT`
> > > +       would return RGB formats again in that case.
> > > +
> > > +4.  **Optional.** Set the ``CAPTURE`` format via :c:func:`VIDIOC_S_F=
MT` on the
> > > +    ``CAPTURE`` queue. The client may choose a different format than
> > > +    selected/suggested by the decoder in :c:func:`VIDIOC_G_FMT`.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > +
> > > +      ``pixelformat``
> > > +          a raw pixel format.
> > > +
> > > +   * Setting the ``CAPTURE`` format will reset the compose selection=
 rectangles
> > > +     to their default values, based on the new resolution, as descri=
bed in the
> > > +     previous step.
> > > +
> > > +5. **Optional.** Set the compose rectangle via :c:func:`VIDIOC_S_SEL=
ECTION` on
> > > +   the ``CAPTURE`` queue if it is desired and if the decoder has com=
pose and/or
> > > +   scaling capabilities.
> > > +
> > > +   * **Required fields:**
> > > +
> > > +     ``type``
> > > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > +
> > > +     ``target``
> > > +         set to ``V4L2_SEL_TGT_COMPOSE``.
> > > +
> > > +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> > > +         the rectangle inside a ``CAPTURE`` buffer into which the cr=
opped
> > > +         frame is written; defaults to ``V4L2_SEL_TGT_COMPOSE_DEFAUL=
T``;
> > > +         read-only on hardware without additional compose/scaling ca=
pabilities.
> > > +
> > > +   * **Return fields:**
> > > +
> > > +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> > > +         the visible rectangle; it must fit within the frame buffer =
resolution
> > > +         returned by :c:func:`VIDIOC_G_FMT` on ``CAPTURE``.
> > > +
> > > +   .. warning::
> > > +
> > > +      The decoder may adjust the compose rectangle to the nearest
> > > +      supported one to meet codec and hardware requirements. The cli=
ent needs
> > > +      to check the adjusted rectangle returned by :c:func:`VIDIOC_S_=
SELECTION`.
> > > +
> > > +6.  If all the following conditions are met, the client may resume t=
he decoding
> > > +    instantly:
> > > +
> > > +    * ``sizeimage`` of the new format (determined in previous steps)=
 is less
> > > +      than or equal to the size of currently allocated buffers,
> > > +
> > > +    * the number of buffers currently allocated is greater than or e=
qual to the
> > > +      minimum number of buffers acquired in previous steps. To fulfi=
ll this
> > > +      requirement, the client may use :c:func:`VIDIOC_CREATE_BUFS` t=
o add new
> > > +      buffers.
> > > +
> > > +    In that case, the remaining steps do not apply and the client ma=
y resume
> > > +    the decoding by one of the following actions:
> > > +
> > > +    * if the ``CAPTURE`` queue is streaming, call :c:func:`VIDIOC_DE=
CODER_CMD`
> > > +      with the ``V4L2_DEC_CMD_START`` command,
> > > +
> > > +    * if the ``CAPTURE`` queue is not streaming, call :c:func:`VIDIO=
C_STREAMON`
> > > +      on the ``CAPTURE`` queue.
> > > +
> > > +    However, if the client intends to change the buffer set, to lowe=
r
> > > +    memory usage or for any other reasons, it may be achieved by fol=
lowing
> > > +    the steps below.
> > > +
> > > +7.  **If the** ``CAPTURE`` **queue is streaming,** keep queuing and =
dequeuing
> > > +    buffers on the ``CAPTURE`` queue until a buffer marked with the
> > > +    ``V4L2_BUF_FLAG_LAST`` flag is dequeued.
> > > +
> > > +8.  **If the** ``CAPTURE`` **queue is streaming,** call :c:func:`VID=
IOC_STREAMOFF`
> > > +    on the ``CAPTURE`` queue to stop streaming.
> > > +
> > > +    .. warning::
> > > +
> > > +       The ``OUTPUT`` queue must remain streaming. Calling
> > > +       :c:func:`VIDIOC_STREAMOFF` on it would abort the sequence and=
 trigger a
> > > +       seek.
> > > +
> > > +9.  **If the** ``CAPTURE`` **queue has buffers allocated,** free the=
 ``CAPTURE``
> > > +    buffers using :c:func:`VIDIOC_REQBUFS`.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``count``
> > > +          set to 0.
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > +
> > > +      ``memory``
> > > +          follows standard semantics.
> > > +
> > > +10. Allocate ``CAPTURE`` buffers via :c:func:`VIDIOC_REQBUFS` on the
> > > +    ``CAPTURE`` queue.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``count``
> > > +          requested number of buffers to allocate; greater than zero=
.
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > +
> > > +      ``memory``
> > > +          follows standard semantics.
> > > +
> > > +    * **Return fields:**
> > > +
> > > +      ``count``
> > > +          actual number of buffers allocated.
> > > +
> > > +    .. warning::
> > > +
> > > +       The actual number of allocated buffers may differ from the ``=
count``
> > > +       given. The client must check the updated value of ``count`` a=
fter the
> > > +       call returns.
> > > +
> > > +    .. note::
> > > +
> > > +       To allocate more than the minimum number of buffers (for pipe=
line
> > > +       depth), the client may query the ``V4L2_CID_MIN_BUFFERS_FOR_C=
APTURE``
> > > +       control to get the minimum number of buffers required, and pa=
ss the
> > > +       obtained value plus the number of additional buffers needed i=
n the
> > > +       ``count`` field to :c:func:`VIDIOC_REQBUFS`.
> > > +
> > > +    Alternatively, :c:func:`VIDIOC_CREATE_BUFS` on the ``CAPTURE`` q=
ueue can be
> > > +    used to have more control over buffer allocation. For example, b=
y
> > > +    allocating buffers larger than the current ``CAPTURE`` format, f=
uture
> > > +    resolution changes can be accommodated.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``count``
> > > +          requested number of buffers to allocate; greater than zero=
.
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > +
> > > +      ``memory``
> > > +          follows standard semantics.
> > > +
> > > +      ``format``
> > > +          a format representing the maximum framebuffer resolution t=
o be
> > > +          accommodated by newly allocated buffers.
> > > +
> > > +    * **Return fields:**
> > > +
> > > +      ``count``
> > > +          adjusted to the number of allocated buffers.
> > > +
> > > +    .. warning::
> > > +
> > > +        The actual number of allocated buffers may differ from the `=
`count``
> > > +        given. The client must check the updated value of ``count`` =
after the
> > > +        call returns.
> > > +
> > > +    .. note::
> > > +
> > > +       To allocate buffers for a format different than parsed from t=
he stream
> > > +       metadata, the client must proceed as follows, before the meta=
data
> > > +       parsing is initiated:
> > > +
> > > +       * set width and height of the ``OUTPUT`` format to desired co=
ded resolution to
> > > +         let the decoder configure the ``CAPTURE`` format appropriat=
ely,
> > > +
> > > +       * query the ``CAPTURE`` format using :c:func:`VIDIOC_G_FMT` a=
nd save it
> > > +         until this step.
> > > +
> > > +       The format obtained in the query may be then used with
> > > +       :c:func:`VIDIOC_CREATE_BUFS` in this step to allocate the buf=
fers.
> > > +
> > > +11. Call :c:func:`VIDIOC_STREAMON` on the ``CAPTURE`` queue to start=
 decoding
> > > +    frames.
> > > +
> > > +Decoding
> > > +=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +This state is reached after the `Capture setup` sequence finishes su=
ccessfully.
> > > +In this state, the client queues and dequeues buffers to both queues=
 via
> > > +:c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQBUF`, following the stan=
dard
> > > +semantics.
> > > +
> > > +The content of the source ``OUTPUT`` buffers depends on the active c=
oded pixel
> > > +format and may be affected by codec-specific extended controls, as s=
tated in
> > > +the documentation of each format.
> > > +
> > > +Both queues operate independently, following the standard behavior o=
f V4L2
> > > +buffer queues and memory-to-memory devices. In addition, the order o=
f decoded
> > > +frames dequeued from the ``CAPTURE`` queue may differ from the order=
 of queuing
> > > +coded frames to the ``OUTPUT`` queue, due to properties of the selec=
ted coded
> > > +format, e.g. frame reordering.
> > > +
> > > +The client must not assume any direct relationship between ``CAPTURE=
``
> > > +and ``OUTPUT`` buffers and any specific timing of buffers becoming
> > > +available to dequeue. Specifically:
> > > +
> > > +* a buffer queued to ``OUTPUT`` may result in no buffers being produ=
ced
> > > +  on ``CAPTURE`` (e.g. if it does not contain encoded data, or if on=
ly
> > > +  metadata syntax structures are present in it),
> > > +
> > > +* a buffer queued to ``OUTPUT`` may result in more than one buffer p=
roduced
> > > +  on ``CAPTURE`` (if the encoded data contained more than one frame,=
 or if
> > > +  returning a decoded frame allowed the decoder to return a frame th=
at
> > > +  preceded it in decode, but succeeded it in the display order),
> > > +
> > > +* a buffer queued to ``OUTPUT`` may result in a buffer being produce=
d on
> > > +  ``CAPTURE`` later into decode process, and/or after processing fur=
ther
> > > +  ``OUTPUT`` buffers, or be returned out of order, e.g. if display
> > > +  reordering is used,
> > > +
> > > +* buffers may become available on the ``CAPTURE`` queue without addi=
tional
> > > +  buffers queued to ``OUTPUT`` (e.g. during drain or ``EOS``), becau=
se of the
> > > +  ``OUTPUT`` buffers queued in the past whose decoding results are o=
nly
> > > +  available at later time, due to specifics of the decoding process.
> > > +
> > > +.. note::
> > > +
> > > +   To allow matching decoded ``CAPTURE`` buffers with ``OUTPUT`` buf=
fers they
> > > +   originated from, the client can set the ``timestamp`` field of th=
e
> > > +   :c:type:`v4l2_buffer` struct when queuing an ``OUTPUT`` buffer. T=
he
> > > +   ``CAPTURE`` buffer(s), which resulted from decoding that ``OUTPUT=
`` buffer
> > > +   will have their ``timestamp`` field set to the same value when de=
queued.
> > > +
> > > +   In addition to the straightforward case of one ``OUTPUT`` buffer =
producing
> > > +   one ``CAPTURE`` buffer, the following cases are defined:
> > > +
> > > +   * one ``OUTPUT`` buffer generates multiple ``CAPTURE`` buffers: t=
he same
> > > +     ``OUTPUT`` timestamp will be copied to multiple ``CAPTURE`` buf=
fers.
> > > +
> > > +   * multiple ``OUTPUT`` buffers generate one ``CAPTURE`` buffer: ti=
mestamp of
> > > +     the ``OUTPUT`` buffer queued last will be copied.
> >=20
> > I'd like to propose to change this into " timestamp of the OUTPUT
> > buffer queued first will be copied". The rationale is the following, if
> > you have an OUTPUT buffer that is unaligned in the following form:
> >=20
> >   [ remaining | complete frame ]
> >=20
> > The remaining data is the last bits of the current frame. So it should
> > share a timestamp with the bits that came before. But then you have
> > another frame which by accident could fit entirely in your buffer. With
> > the last approach, it is not possible to give that frame a timestamp.
> >=20
> > The first approach fixes this problem. If there was a remaining on the
> > very first buffer, it will be dropped anyway, so it also work for this
> > case. This modification is aligned with MPEG TS container specification
> > which says the the timestamp of the packet applies to the first ES
> > packet that starts, the remaining bits will reuse the previous packet
> > timestamp. The rest is common sense, e.g. the same ES packet should
> > only have one timestamp etc.
>=20
> Wouldn't that replace one problem with another? How about the case below?
>=20
> [ complete frame | partial frame ] [ remaining ]

Right, both methods are kind of bad (even though I still like sticking
with something used elsewhere). Personally, I think it's probably not
worth giving that case a standard and it could be left undefined.

>=20
> Best regards,
> Tomasz

--=-69PNId784cO30llq+xkF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXTKFpQAKCRBxUwItrAao
HEBXAKDDbcNUVra4ysvXGaNDGNjBfGEu0wCffbvGevCdL0z0agnqogOmUuVcm0U=
=J2hE
-----END PGP SIGNATURE-----

--=-69PNId784cO30llq+xkF--

