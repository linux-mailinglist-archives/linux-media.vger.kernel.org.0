Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 155E16A8A1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 14:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730754AbfGPMXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 08:23:54 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41042 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732743AbfGPMXw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 08:23:52 -0400
Received: by mail-vs1-f68.google.com with SMTP id 2so13732431vso.8
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 05:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=kpygOuP9fJtQAaooLu7gBxDW8z+SlZoHJA1NFB3DTRI=;
        b=eozOK2ptoVwMY5lE5AcNmmzGQDxY/nXnCulxTJMyc1vJMezARQCnripcyoXVvp1Q3T
         GZPnESdQJXMrq+MJpQWi45ep3l/fYmfvLYuHwVkCW8po4xNv0vnmkPGfctxNVyhfqYhW
         2RfuGIm6cCcA8Jp3oDzqtHkKU7WWWBF54v3Bemsynb/7k+ot65JB1ZHuTy80246mgXpP
         ng3g9p19x9Uqv4GLhANIYwzuMUSQZJafeNvQaiAZPA/cFe7xzpLwxo48xClpGoQp5Oh4
         6z3uyMZU/wFVmqfdKw1BR+GEz6jJhONM0ZmYCUxa0yJ359YyFwwRS7X5q/kk2zshQk0r
         FqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=kpygOuP9fJtQAaooLu7gBxDW8z+SlZoHJA1NFB3DTRI=;
        b=ew0IPTSMMA9EEX4B0BwepkH8DKlC4M/OMpmkfqlZZIUTAhCWOaDwIf/yTpccOmQOU9
         ijlVnqrSDEQJEJ3lNTMTyq2wbLsmWZF9/GroGdmIVX44fkvb0wIzqCaOzZs5J3uEriHW
         Oyi9OgTNedVH2/Dc4UD7qJZkTX2hXfHQKBu57dTSrGa8jjoC31xMgxWw4epYyXkr1qHW
         ib3eEE6R30lvFF+gDezRUA/q7axlXRPqRpr1iWgyUFMSUtO7uad384sN5N2EJ1TqdQjc
         vtfWDaFo6LmSbhoyt1PVEf4mgV0oH1fq5F9gPOA/Y/wHu0P3k7xp3wEJw1+msgFOitPL
         M5mw==
X-Gm-Message-State: APjAAAX4jCZm2i63j3DORvKntoLD9j1vMZAL9QygmdofWuWEaK3lt0Tn
        YKir8W8eFn1JYkX2n1upzIk=
X-Google-Smtp-Source: APXvYqxGY7PK9n0KmFz+ahHm73KDKlnjmpF8PBMcEdMK8FJFrjqaqpBhEoWLpW2nYbWxPHH2VNkkFg==
X-Received: by 2002:a67:cd14:: with SMTP id u20mr19149224vsl.36.1563279828636;
        Tue, 16 Jul 2019 05:23:48 -0700 (PDT)
Received: from tpx230-nicolas ([63.237.252.15])
        by smtp.gmail.com with ESMTPSA id w9sm9353863vkd.41.2019.07.16.05.23.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 05:23:47 -0700 (PDT)
Message-ID: <6629c967797391e7a75260fc1ec179e276b498d8.camel@ndufresne.ca>
Subject: Re: [PATCHv4 1/2] media: docs-rst: Document memory-to-memory video
 decoder interface
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Date:   Tue, 16 Jul 2019 08:23:44 -0400
In-Reply-To: <CAMO6nazhyamHC_RAOL8zq4YADD6xJ4dwHuobopSMn7RCrXUzsw@mail.gmail.com>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
         <20190603112835.19661-2-hverkuil-cisco@xs4all.nl>
         <ffaad429bbdcf1a15049ec6df404618f4f2a9a36.camel@ndufresne.ca>
         <9c19ece0-f980-62a6-f26e-a91930d117f3@xs4all.nl>
         <CAMO6nazhyamHC_RAOL8zq4YADD6xJ4dwHuobopSMn7RCrXUzsw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-wJyU/6uLLqwHawOHNLT+"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-wJyU/6uLLqwHawOHNLT+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 15 juillet 2019 =C3=A0 14:12 +0200, Maxime Jourdan a =C3=A9crit :
> On Tue, Jun 11, 2019 at 10:29 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> =
wrote:
> > On 6/10/19 9:54 PM, Nicolas Dufresne wrote:
> > > Hi Hans,
> > >=20
> > > I went through it, and I think we are close to ready. Unfortunately, =
I
> > > believe the SOURCE_CHANGE event is still under specified. There was a
> > > post recently to try and add a new flag for changes in color space
> > > which is not included here. We are also missing a workflow for change=
s
> > > that don't affect the allocation but will affect the rendering on a
> > > display (like colorimetry). Userspace needs to know at which frames
> > > these parameter changes in order to signal that to the following
> > > processing block. I think we must have a plane for this.
> >=20
> > Yes, we need a new flag for the SOURCE_CHANGE event to indicate colorim=
etry
> > changes. That's actually useful for e.g. HDMI receivers as well.
> >=20
> > But I don't see why that should make much of a change to the spec: you =
still
> > have to drain the capture queue, the only difference is that you don't =
need
> > to reallocate buffers, you can just restart the decoder.
> >=20
> > My intention was to get this spec in first, then extend it once we have=
 a new
> > colorimetry change flag.
> >=20
> > > Another aspect, I'd like if we could relax a bit the bits about dynam=
ic
> > > resolutions, making some space for the "static resolution" cases.
> > > Something to keep in mind, these "static resolution" HW might not be
> > > able to inform userspace of the display size of the picture, we shoul=
d
> > > check with Maxime what happens with the Amlogic.
> >=20
> > I've asked him about that in another email thread:
> >=20
> > https://www.mail-archive.com/linux-media@vger.kernel.org/msg147652.html
> >=20
> > Maxime, related to that: can the amlogic detect midstream colorimetry
> > changes? Or is that also impossible?
> >=20
>=20
> Hi Hans, Nicolas,
>=20
> The SOURCE_CHANGE limitations on amlogic are related to older
> compression standards. I'm focusing on H264, HEVC, VP9 which will all
> be able to properly report resolution changes (and probing at init).
> Currently, older codecs such as MPEG 1/2 require userspace to probe
> the coded resolution itself and set it to the driver via S_FMT, but
> there is no indication from the driver about that. See the series
> about the FIXED_RESOLUTION fmt flag for what I had in mind but isn't
> that great of a solution..
>=20
> When it comes to colorimetry, I don't believe I saw anything in the
> vendor SDK that relates to probing colorspace (e.g bt.709/bt.601
> etc.).
>=20
> @Nicolas: is this information embedded in a SEI packet or SPS/PPS when
> it comes to H264 ?

It seems it a VUI parameter, which is part of the active SPS.

>=20
> > > Le lundi 03 juin 2019 =C3=A0 13:28 +0200, Hans Verkuil a =C3=A9crit :
> > > > From: Tomasz Figa <tfiga@chromium.org>
> > > >=20
> > > > Due to complexity of the video decoding process, the V4L2 drivers o=
f
> > > > stateful decoder hardware require specific sequences of V4L2 API ca=
lls
> > > > to be followed. These include capability enumeration, initializatio=
n,
> > > > decoding, seek, pause, dynamic resolution change, drain and end of
> > > > stream.
> > > >=20
> > > > Specifics of the above have been discussed during Media Workshops a=
t
> > > > LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > > > Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API t=
hat
> > > > originated at those events was later implemented by the drivers we =
already
> > > > have merged in mainline, such as s5p-mfc or coda.
> > > >=20
> > > > The only thing missing was the real specification included as a par=
t of
> > > > Linux Media documentation. Fix it now and document the decoder part=
 of
> > > > the Codec API.
> > > >=20
> > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > > ---
> > > >  Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 +++++++++++++=
++++
> > > >  Documentation/media/uapi/v4l/dev-mem2mem.rst  |    8 +-
> > > >  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |    5 +
> > > >  Documentation/media/uapi/v4l/v4l2.rst         |   10 +-
> > > >  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
> > > >  5 files changed, 1132 insertions(+), 16 deletions(-)
> > > >  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
> > > >=20
> > > > diff --git a/Documentation/media/uapi/v4l/dev-decoder.rst b/Documen=
tation/media/uapi/v4l/dev-decoder.rst
> > > > new file mode 100644
> > > > index 000000000000..b106f2d97c48
> > > > --- /dev/null
> > > > +++ b/Documentation/media/uapi/v4l/dev-decoder.rst
> > > > @@ -0,0 +1,1084 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +.. _decoder:
> > > > +
> > > > +*************************************************
> > > > +Memory-to-memory Stateful Video Decoder Interface
> > > > +*************************************************
> > > > +
> > > > +A stateful video decoder takes complete chunks of the bitstream (e=
.g. Annex-B
> > > > +H.264/HEVC stream, raw VP8/9 stream) and decodes them into raw vid=
eo frames in
> > >=20
> > > (minor, may ignore)
> > > This isn't very precise, do we expect to document this per-format ? I
> > > think we should maybe say "a complete frame of the bitstream", that
> > > being said, I think stateful CODEC should be allowed to implement the
> > > per-slice/per-frame control we are adding to stateless CODEC. Maybe
> > > something like "documented complete chunks of bitstream" ?
> > >=20
> > > > +display order. The decoder is expected not to require any addition=
al information
> > > > +from the client to process these buffers.
> > > > +
> > > > +Performing software parsing, processing etc. of the stream in the =
driver in
> > > > +order to support this interface is strongly discouraged. In case s=
uch
> > > > +operations are needed, use of the Stateless Video Decoder Interfac=
e (in
> > > > +development) is strongly advised.
> > > > +
> > > > +Conventions and notation used in this document
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +1. The general V4L2 API rules apply if not specified in this docum=
ent
> > > > +   otherwise.
> > > > +
> > > > +2. The meaning of words "must", "may", "should", etc. is as per `R=
FC
> > > > +   2119 <https://tools.ietf.org/html/rfc2119>`_.
> > > > +
> > > > +3. All steps not marked "optional" are required.
> > > > +
> > > > +4. :c:func:`VIDIOC_G_EXT_CTRLS` and :c:func:`VIDIOC_S_EXT_CTRLS` m=
ay be used
> > > > +   interchangeably with :c:func:`VIDIOC_G_CTRL` and :c:func:`VIDIO=
C_S_CTRL`,
> > > > +   unless specified otherwise.
> > > > +
> > > > +5. Single-planar API (see :ref:`planar-apis`) and applicable struc=
tures may be
> > > > +   used interchangeably with multi-planar API, unless specified ot=
herwise,
> > > > +   depending on decoder capabilities and following the general V4L=
2 guidelines.
> > > > +
> > > > +6. i =3D [a..b]: sequence of integers from a to b, inclusive, i.e.=
 i =3D
> > > > +   [0..2]: i =3D 0, 1, 2.
> > > > +
> > > > +7. Given an ``OUTPUT`` buffer A, then A=E2=80=99 represents a buff=
er on the ``CAPTURE``
> > > > +   queue containing data that resulted from processing buffer A.
> > > > +
> > > > +.. _decoder-glossary:
> > > > +
> > > > +Glossary
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +CAPTURE
> > > > +   the destination buffer queue; for decoders, the queue of buffer=
s containing
> > > > +   decoded frames; for encoders, the queue of buffers containing a=
n encoded
> > > > +   bitstream; ``V4L2_BUF_TYPE_VIDEO_CAPTURE`` or
> > > > +   ``V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE``; data is captured from t=
he hardware
> > > > +   into ``CAPTURE`` buffers.
> > > > +
> > > > +client
> > > > +   the application communicating with the decoder or encoder imple=
menting
> > > > +   this interface.
> > > > +
> > > > +coded format
> > > > +   encoded/compressed video bitstream format (e.g. H.264, VP8, etc=
.); see
> > > > +   also: raw format.
> > > > +
> > > > +coded height
> > > > +   height for given coded resolution.
> > > > +
> > > > +coded resolution
> > > > +   stream resolution in pixels aligned to codec and hardware requi=
rements;
> > > > +   typically visible resolution rounded up to full macroblocks;
> > > > +   see also: visible resolution.
> > > > +
> > > > +coded width
> > > > +   width for given coded resolution.
> > > > +
> > > > +decode order
> > > > +   the order in which frames are decoded; may differ from display =
order if the
> > > > +   coded format includes a feature of frame reordering; for decode=
rs,
> > > > +   ``OUTPUT`` buffers must be queued by the client in decode order=
; for
> > > > +   encoders ``CAPTURE`` buffers must be returned by the encoder in=
 decode order.
> > > > +
> > > > +destination
> > > > +   data resulting from the decode process; see ``CAPTURE``.
> > > > +
> > > > +display order
> > > > +   the order in which frames must be displayed; for encoders, ``OU=
TPUT``
> > > > +   buffers must be queued by the client in display order; for deco=
ders,
> > > > +   ``CAPTURE`` buffers must be returned by the decoder in display =
order.
> > > > +
> > > > +DPB
> > > > +   Decoded Picture Buffer; an H.264/HEVC term for a buffer that st=
ores a decoded
> > > > +   raw frame available for reference in further decoding steps.
> > > > +
> > > > +EOS
> > > > +   end of stream.
> > > > +
> > > > +IDR
> > > > +   Instantaneous Decoder Refresh; a type of a keyframe in an H.264=
/HEVC-encoded
> > > > +   stream, which clears the list of earlier reference frames (DPBs=
).
> > > > +
> > > > +keyframe
> > > > +   an encoded frame that does not reference frames decoded earlier=
, i.e.
> > > > +   can be decoded fully on its own.
> > > > +
> > > > +macroblock
> > > > +   a processing unit in image and video compression formats based =
on linear
> > > > +   block transforms (e.g. H.264, VP8, VP9); codec-specific, but fo=
r most of
> > > > +   popular codecs the size is 16x16 samples (pixels).
> > > > +
> > > > +OUTPUT
> > > > +   the source buffer queue; for decoders, the queue of buffers con=
taining
> > > > +   an encoded bitstream; for encoders, the queue of buffers contai=
ning raw
> > > > +   frames; ``V4L2_BUF_TYPE_VIDEO_OUTPUT`` or
> > > > +   ``V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE``; the hardware is fed with=
 data
> > > > +   from ``OUTPUT`` buffers.
> > > > +
> > > > +PPS
> > > > +   Picture Parameter Set; a type of metadata entity in an H.264/HE=
VC bitstream.
> > > > +
> > > > +raw format
> > > > +   uncompressed format containing raw pixel data (e.g. YUV, RGB fo=
rmats).
> > > > +
> > > > +resume point
> > > > +   a point in the bitstream from which decoding may start/continue=
, without
> > > > +   any previous state/data present, e.g.: a keyframe (VP8/VP9) or
> > > > +   SPS/PPS/IDR sequence (H.264/HEVC); a resume point is required t=
o start decode
> > > > +   of a new stream, or to resume decoding after a seek.
> > > > +
> > > > +source
> > > > +   data fed to the decoder or encoder; see ``OUTPUT``.
> > > > +
> > > > +source height
> > > > +   height in pixels for given source resolution; relevant to encod=
ers only.
> > > > +
> > > > +source resolution
> > > > +   resolution in pixels of source frames being source to the encod=
er and
> > > > +   subject to further cropping to the bounds of visible resolution=
; relevant to
> > > > +   encoders only.
> > > > +
> > > > +source width
> > > > +   width in pixels for given source resolution; relevant to encode=
rs only.
> > > > +
> > > > +SPS
> > > > +   Sequence Parameter Set; a type of metadata entity in an H.264/H=
EVC bitstream.
> > > > +
> > > > +stream metadata
> > > > +   additional (non-visual) information contained inside encoded bi=
tstream;
> > > > +   for example: coded resolution, visible resolution, codec profil=
e.
> > > > +
> > > > +visible height
> > > > +   height for given visible resolution; display height.
> > > > +
> > > > +visible resolution
> > > > +   stream resolution of the visible picture, in pixels, to be used=
 for
> > > > +   display purposes; must be smaller or equal to coded resolution;
> > > > +   display resolution.
> > > > +
> > > > +visible width
> > > > +   width for given visible resolution; display width.
> > > > +
> > > > +State machine
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +.. kernel-render:: DOT
> > > > +   :alt: DOT digraph of decoder state machine
> > > > +   :caption: Decoder state machine
> > > > +
> > > > +   digraph decoder_state_machine {
> > > > +       node [shape =3D doublecircle, label=3D"Decoding"] Decoding;
> > > > +
> > > > +       node [shape =3D circle, label=3D"Initialization"] Initializ=
ation;
> > > > +       node [shape =3D circle, label=3D"Capture\nsetup"] CaptureSe=
tup;
> > > > +       node [shape =3D circle, label=3D"Dynamic\nresolution\nchang=
e"] ResChange;
> > > > +       node [shape =3D circle, label=3D"Stopped"] Stopped;
> > > > +       node [shape =3D circle, label=3D"Drain"] Drain;
> > > > +       node [shape =3D circle, label=3D"Seek"] Seek;
> > > > +       node [shape =3D circle, label=3D"End of stream"] EoS;
> > > > +
> > > > +       node [shape =3D point]; qi
> > > > +       qi -> Initialization [ label =3D "open()" ];
> > > > +
> > > > +       Initialization -> CaptureSetup [ label =3D "CAPTURE\nformat=
\nestablished" ];
> > > > +
> > > > +       CaptureSetup -> Stopped [ label =3D "CAPTURE\nbuffers\nread=
y" ];
> > > > +
> > > > +       Decoding -> ResChange [ label =3D "Stream\nresolution\nchan=
ge" ];
> > > > +       Decoding -> Drain [ label =3D "V4L2_DEC_CMD_STOP" ];
> > > > +       Decoding -> EoS [ label =3D "EoS mark\nin the stream" ];
> > > > +       Decoding -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > > > +       Decoding -> Stopped [ label =3D "VIDIOC_STREAMOFF(CAPTURE)"=
 ];
> > > > +       Decoding -> Decoding;
> > > > +
> > > > +       ResChange -> CaptureSetup [ label =3D "CAPTURE\nformat\nest=
ablished" ];
> > > > +       ResChange -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > > > +
> > > > +       EoS -> Drain [ label =3D "Implicit\ndrain" ];
> > > > +
> > > > +       Drain -> Stopped [ label =3D "All CAPTURE\nbuffers dequeued=
\nor\nVIDIOC_STREAMOFF(CAPTURE)" ];
> > > > +       Drain -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > > > +
> > > > +       Seek -> Decoding [ label =3D "VIDIOC_STREAMON(OUTPUT)" ];
> > > > +       Seek -> Initialization [ label =3D "VIDIOC_REQBUFS(OUTPUT, =
0)" ];
> > > > +
> > > > +       Stopped -> Decoding [ label =3D "V4L2_DEC_CMD_START\nor\nVI=
DIOC_STREAMON(CAPTURE)" ];
> > > > +       Stopped -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > > > +   }
> > > > +
> > > > +Querying capabilities
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +1. To enumerate the set of coded formats supported by the decoder,=
 the
> > > > +   client may call :c:func:`VIDIOC_ENUM_FMT` on ``OUTPUT``.
> > > > +
> > > > +   * The full set of supported formats will be returned, regardles=
s of the
> > > > +     format set on ``CAPTURE``.
> > > > +
> > > > +2. To enumerate the set of supported raw formats, the client may c=
all
> > > > +   :c:func:`VIDIOC_ENUM_FMT` on ``CAPTURE``.
> > > > +
> > > > +   * Only the formats supported for the format currently active on=
 ``OUTPUT``
> > > > +     will be returned.
> > > > +
> > > > +   * In order to enumerate raw formats supported by a given coded =
format,
> > > > +     the client must first set that coded format on ``OUTPUT`` and=
 then
> > > > +     enumerate formats on ``CAPTURE``.
> > > > +
> > > > +3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect s=
upported
> > > > +   resolutions for a given format, passing desired pixel format in
> > > > +   :c:type:`v4l2_frmsizeenum` ``pixel_format``.
> > > > +
> > > > +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a cod=
ed pixel
> > > > +     format will include all possible coded resolutions supported =
by the
> > > > +     decoder for given coded pixel format.
> > > > +
> > > > +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a raw=
 pixel format
> > > > +     will include all possible frame buffer resolutions supported =
by the
> > > > +     decoder for given raw pixel format and the coded format curre=
ntly set on
> > > > +     ``OUTPUT``.
> > > > +
> > > > +4. Supported profiles and levels for the coded format currently se=
t on
> > > > +   ``OUTPUT``, if applicable, may be queried using their respectiv=
e controls
> > > > +   via :c:func:`VIDIOC_QUERYCTRL`.
> > > > +
> > > > +Initialization
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +1. Set the coded format on ``OUTPUT`` via :c:func:`VIDIOC_S_FMT`
> > > > +
> > > > +   * **Required fields:**
> > > > +
> > > > +     ``type``
> > > > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > > > +
> > > > +     ``pixelformat``
> > > > +         a coded pixel format.
> > > > +
> > > > +     ``width``, ``height``
> > > > +         coded resolution of the stream; required only if it canno=
t be parsed
> > > > +         from the stream for the given coded format; otherwise the=
 decoder will
> > > > +         use this resolution as a placeholder resolution that will=
 likely change
> > > > +         as soon as it can parse the actual coded resolution from =
the stream.
> > > > +
> > > > +     ``sizeimage``
> > > > +         desired size of ``OUTPUT`` buffers; the decoder may adjus=
t it to
> > > > +         match hardware requirements.
> > > > +
> > > > +     other fields
> > > > +         follow standard semantics.
> > > > +
> > > > +   * **Return fields:**
> > > > +
> > > > +     ``sizeimage``
> > > > +         adjusted size of ``OUTPUT`` buffers.
> > > > +
> > > > +   * The ``CAPTURE`` format will be updated with an appropriate fr=
ame buffer
> > > > +     resolution instantly based on the width and height returned b=
y
> > > > +     :c:func:`VIDIOC_S_FMT`.
> > > > +     However, for coded formats that include stream resolution inf=
ormation,
> > > > +     after the decoder is done parsing the information from the st=
ream, it will
> > > > +     update the ``CAPTURE`` format with new values and signal a so=
urce change
> > > > +     event, regardless of whether they match the values set by the=
 client or
> > > > +     not.
> > > > +
> > > > +   .. important::
> > > > +
> > > > +      Changing the ``OUTPUT`` format may change the currently set =
``CAPTURE``
> > > > +      format. How the new ``CAPTURE`` format is determined is up t=
o the decoder
> > > > +      and the client must ensure it matches its needs afterwards.
> > > > +
> > > > +2.  Allocate source (bitstream) buffers via :c:func:`VIDIOC_REQBUF=
S` on
> > > > +    ``OUTPUT``.
> > > > +
> > > > +    * **Required fields:**
> > > > +
> > > > +      ``count``
> > > > +          requested number of buffers to allocate; greater than ze=
ro.
> > > > +
> > > > +      ``type``
> > > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > > > +
> > > > +      ``memory``
> > > > +          follows standard semantics.
> > > > +
> > > > +    * **Return fields:**
> > > > +
> > > > +      ``count``
> > > > +          the actual number of buffers allocated.
> > > > +
> > > > +    .. warning::
> > > > +
> > > > +       The actual number of allocated buffers may differ from the =
``count``
> > > > +       given. The client must check the updated value of ``count``=
 after the
> > > > +       call returns.
> > > > +
> > > > +    Alternatively, :c:func:`VIDIOC_CREATE_BUFS` on the ``OUTPUT`` =
queue can be
> > > > +    used to have more control over buffer allocation.
> > > > +
> > > > +    * **Required fields:**
> > > > +
> > > > +      ``count``
> > > > +          requested number of buffers to allocate; greater than ze=
ro.
> > > > +
> > > > +      ``type``
> > > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > > > +
> > > > +      ``memory``
> > > > +          follows standard semantics.
> > > > +
> > > > +      ``format``
> > > > +          follows standard semantics.
> > > > +
> > > > +    * **Return fields:**
> > > > +
> > > > +      ``count``
> > > > +          adjusted to the number of allocated buffers.
> > > > +
> > > > +    .. warning::
> > > > +
> > > > +       The actual number of allocated buffers may differ from the =
``count``
> > > > +       given. The client must check the updated value of ``count``=
 after the
> > > > +       call returns.
> > > > +
> > > > +3.  Start streaming on the ``OUTPUT`` queue via :c:func:`VIDIOC_ST=
REAMON`.
> > > > +
> > > > +4.  **This step only applies to coded formats that contain resolut=
ion information
> > > > +    in the stream.** Continue queuing/dequeuing bitstream buffers =
to/from the
> > > > +    ``OUTPUT`` queue via :c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC=
_DQBUF`. The
> > > > +    buffers will be processed and returned to the client in order,=
 until
> > > > +    required metadata to configure the ``CAPTURE`` queue are found=
. This is
> > > > +    indicated by the decoder sending a ``V4L2_EVENT_SOURCE_CHANGE`=
` event with
> > > > +    ``changes`` set to ``V4L2_EVENT_SRC_CH_RESOLUTION``.
> > > > +
> > > > +    * It is not an error if the first buffer does not contain enou=
gh data for
> > > > +      this to occur. Processing of the buffers will continue as lo=
ng as more
> > > > +      data is needed.
> > > > +
> > > > +    * If data in a buffer that triggers the event is required to d=
ecode the
> > > > +      first frame, it will not be returned to the client, until th=
e
> > > > +      initialization sequence completes and the frame is decoded.
> > > > +
> > > > +    * If the client has not set the coded resolution of the stream=
 on its own,
> > > > +      calling :c:func:`VIDIOC_G_FMT`, :c:func:`VIDIOC_S_FMT`,
> > > > +      :c:func:`VIDIOC_TRY_FMT` or :c:func:`VIDIOC_REQBUFS` on the =
``CAPTURE``
> > > > +      queue will not return the real values for the stream until a
> > > > +      ``V4L2_EVENT_SOURCE_CHANGE`` event is signaled.
> > > > +
> > > > +    .. important::
> > > > +
> > > > +       Any client query issued after the decoder queues the event =
will return
> > > > +       values applying to the just parsed stream, including queue =
formats,
> > > > +       selection rectangles and controls.
> > > > +
> > > > +    .. note::
> > > > +
> > > > +       A client capable of acquiring stream parameters from the bi=
tstream on
> > > > +       its own may attempt to set the width and height of the ``OU=
TPUT`` format
> > > > +       to non-zero values matching the coded size of the stream, s=
kip this step
> > > > +       and continue with the `Capture setup` sequence. However, it=
 must not
> > > > +       rely on any driver queries regarding stream parameters, suc=
h as
> > > > +       selection rectangles and controls, since the decoder has no=
t parsed them
> > > > +       from the stream yet. If the values configured by the client=
 do not match
> > > > +       those parsed by the decoder, a `Dynamic resolution change` =
will be
> > > > +       triggered to reconfigure them.
> > > > +
> > > > +    .. note::
> > > > +
> > > > +       No decoded frames are produced during this phase.
> > > > +
> > > > +5.  Continue with the `Capture setup` sequence.
> > > > +
> > > > +Capture setup
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +1.  Call :c:func:`VIDIOC_G_FMT` on the ``CAPTURE`` queue to get fo=
rmat for the
> > > > +    destination buffers parsed/decoded from the bitstream.
> > > > +
> > > > +    * **Required fields:**
> > > > +
> > > > +      ``type``
> > > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > > +
> > > > +    * **Return fields:**
> > > > +
> > > > +      ``width``, ``height``
> > > > +          frame buffer resolution for the decoded frames.
> > > > +
> > > > +      ``pixelformat``
> > > > +          pixel format for decoded frames.
> > > > +
> > > > +      ``num_planes`` (for _MPLANE ``type`` only)
> > > > +          number of planes for pixelformat.
> > > > +
> > > > +      ``sizeimage``, ``bytesperline``
> > > > +          as per standard semantics; matching frame buffer format.
> > > > +
> > > > +    .. note::
> > > > +
> > > > +       The value of ``pixelformat`` may be any pixel format suppor=
ted by the
> > > > +       decoder for the current stream. The decoder should choose a
> > > > +       preferred/optimal format for the default configuration. For=
 example, a
> > > > +       YUV format may be preferred over an RGB format if an additi=
onal
> > > > +       conversion step would be required for the latter.
> > > > +
> > > > +2.  **Optional.** Acquire the visible resolution via
> > > > +    :c:func:`VIDIOC_G_SELECTION`.
> > > > +
> > > > +    * **Required fields:**
> > > > +
> > > > +      ``type``
> > > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > > +
> > > > +      ``target``
> > > > +          set to ``V4L2_SEL_TGT_COMPOSE``.
> > > > +
> > > > +    * **Return fields:**
> > > > +
> > > > +      ``r.left``, ``r.top``, ``r.width``, ``r.height``
> > > > +          the visible rectangle; it must fit within the frame buff=
er resolution
> > > > +          returned by :c:func:`VIDIOC_G_FMT` on ``CAPTURE``.
> > > > +
> > > > +    * The following selection targets are supported on ``CAPTURE``=
:
> > > > +
> > > > +      ``V4L2_SEL_TGT_CROP_BOUNDS``
> > > > +          corresponds to the coded resolution of the stream.
> > > > +
> > > > +      ``V4L2_SEL_TGT_CROP_DEFAULT``
> > > > +          the rectangle covering the part of the ``CAPTURE`` buffe=
r that
> > > > +          contains meaningful picture data (visible area); width a=
nd height
> > > > +          will be equal to the visible resolution of the stream.
> > > > +
> > > > +      ``V4L2_SEL_TGT_CROP``
> > > > +          the rectangle within the coded resolution to be output t=
o
> > > > +          ``CAPTURE``; defaults to ``V4L2_SEL_TGT_CROP_DEFAULT``; =
read-only on
> > > > +          hardware without additional compose/scaling capabilities=
.
> > > > +
> > > > +      ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
> > > > +          the maximum rectangle within a ``CAPTURE`` buffer, which=
 the cropped
> > > > +          frame can be composed into; equal to ``V4L2_SEL_TGT_CROP=
`` if the
> > > > +          hardware does not support compose/scaling.
> > > > +
> > > > +      ``V4L2_SEL_TGT_COMPOSE_DEFAULT``
> > > > +          equal to ``V4L2_SEL_TGT_CROP``.
> > > > +
> > > > +      ``V4L2_SEL_TGT_COMPOSE``
> > > > +          the rectangle inside a ``CAPTURE`` buffer into which the=
 cropped
> > > > +          frame is written; defaults to ``V4L2_SEL_TGT_COMPOSE_DEF=
AULT``;
> > > > +          read-only on hardware without additional compose/scaling=
 capabilities.
> > > > +
> > > > +      ``V4L2_SEL_TGT_COMPOSE_PADDED``
> > > > +          the rectangle inside a ``CAPTURE`` buffer which is overw=
ritten by the
> > > > +          hardware; equal to ``V4L2_SEL_TGT_COMPOSE`` if the hardw=
are does not
> > > > +          write padding pixels.
> > > > +
> > > > +    .. warning::
> > > > +
> > > > +       The values are guaranteed to be meaningful only after the d=
ecoder
> > > > +       successfully parses the stream metadata. The client must no=
t rely on the
> > > > +       query before that happens.
> > > > +
> > > > +3.  **Optional.** Enumerate ``CAPTURE`` formats via :c:func:`VIDIO=
C_ENUM_FMT` on
> > > > +    the ``CAPTURE`` queue. Once the stream information is parsed a=
nd known, the
> > > > +    client may use this ioctl to discover which raw formats are su=
pported for
> > > > +    given stream and select one of them via :c:func:`VIDIOC_S_FMT`=
.
> > > > +
> > > > +    .. important::
> > > > +
> > > > +       The decoder will return only formats supported for the curr=
ently
> > > > +       established coded format, as per the ``OUTPUT`` format and/=
or stream
> > > > +       metadata parsed in this initialization sequence, even if mo=
re formats
> > > > +       may be supported by the decoder in general. In other words,=
 the set
> > > > +       returned will be a subset of the initial query mentioned in=
 the
> > > > +       `Querying capabilities` section.
> > > > +
> > > > +       For example, a decoder may support YUV and RGB formats for =
resolutions
> > > > +       1920x1088 and lower, but only YUV for higher resolutions (d=
ue to
> > > > +       hardware limitations). After parsing a resolution of 1920x1=
088 or lower,
> > > > +       :c:func:`VIDIOC_ENUM_FMT` may return a set of YUV and RGB p=
ixel formats,
> > > > +       but after parsing resolution higher than 1920x1088, the dec=
oder will not
> > > > +       return RGB, unsupported for this resolution.
> > > > +
> > > > +       However, subsequent resolution change event triggered after
> > > > +       discovering a resolution change within the same stream may =
switch
> > > > +       the stream into a lower resolution and :c:func:`VIDIOC_ENUM=
_FMT`
> > > > +       would return RGB formats again in that case.
> > > > +
> > > > +4.  **Optional.** Set the ``CAPTURE`` format via :c:func:`VIDIOC_S=
_FMT` on the
> > > > +    ``CAPTURE`` queue. The client may choose a different format th=
an
> > > > +    selected/suggested by the decoder in :c:func:`VIDIOC_G_FMT`.
> > > > +
> > > > +    * **Required fields:**
> > > > +
> > > > +      ``type``
> > > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > > +
> > > > +      ``pixelformat``
> > > > +          a raw pixel format.
> > > > +
> > > > +   * Setting the ``CAPTURE`` format will reset the compose selecti=
on rectangles
> > > > +     to their default values, based on the new resolution, as desc=
ribed in the
> > > > +     previous step.
> > > > +
> > > > +5. **Optional.** Set the compose rectangle via :c:func:`VIDIOC_S_S=
ELECTION` on
> > > > +   the ``CAPTURE`` queue if it is desired and if the decoder has c=
ompose and/or
> > > > +   scaling capabilities.
> > > > +
> > > > +   * **Required fields:**
> > > > +
> > > > +     ``type``
> > > > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > > +
> > > > +     ``target``
> > > > +         set to ``V4L2_SEL_TGT_COMPOSE``.
> > > > +
> > > > +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> > > > +         the rectangle inside a ``CAPTURE`` buffer into which the =
cropped
> > > > +         frame is written; defaults to ``V4L2_SEL_TGT_COMPOSE_DEFA=
ULT``;
> > > > +         read-only on hardware without additional compose/scaling =
capabilities.
> > > > +
> > > > +   * **Return fields:**
> > > > +
> > > > +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> > > > +         the visible rectangle; it must fit within the frame buffe=
r resolution
> > > > +         returned by :c:func:`VIDIOC_G_FMT` on ``CAPTURE``.
> > > > +
> > > > +   .. warning::
> > > > +
> > > > +      The decoder may adjust the compose rectangle to the nearest
> > > > +      supported one to meet codec and hardware requirements. The c=
lient needs
> > > > +      to check the adjusted rectangle returned by :c:func:`VIDIOC_=
S_SELECTION`.
> > > > +
> > > > +6.  If all the following conditions are met, the client may resume=
 the decoding
> > > > +    instantly:
> > > > +
> > > > +    * ``sizeimage`` of the new format (determined in previous step=
s) is less
> > > > +      than or equal to the size of currently allocated buffers,
> > > > +
> > > > +    * the number of buffers currently allocated is greater than or=
 equal to the
> > > > +      minimum number of buffers acquired in previous steps. To ful=
fill this
> > > > +      requirement, the client may use :c:func:`VIDIOC_CREATE_BUFS`=
 to add new
> > > > +      buffers.
> > > > +
> > > > +    In that case, the remaining steps do not apply and the client =
may resume
> > > > +    the decoding by one of the following actions:
> > > > +
> > > > +    * if the ``CAPTURE`` queue is streaming, call :c:func:`VIDIOC_=
DECODER_CMD`
> > > > +      with the ``V4L2_DEC_CMD_START`` command,
> > > > +
> > > > +    * if the ``CAPTURE`` queue is not streaming, call :c:func:`VID=
IOC_STREAMON`
> > > > +      on the ``CAPTURE`` queue.
> > > > +
> > > > +    However, if the client intends to change the buffer set, to lo=
wer
> > > > +    memory usage or for any other reasons, it may be achieved by f=
ollowing
> > > > +    the steps below.
> > > > +
> > > > +7.  **If the** ``CAPTURE`` **queue is streaming,** keep queuing an=
d dequeuing
> > > > +    buffers on the ``CAPTURE`` queue until a buffer marked with th=
e
> > > > +    ``V4L2_BUF_FLAG_LAST`` flag is dequeued.
> > > > +
> > > > +8.  **If the** ``CAPTURE`` **queue is streaming,** call :c:func:`V=
IDIOC_STREAMOFF`
> > > > +    on the ``CAPTURE`` queue to stop streaming.
> > > > +
> > > > +    .. warning::
> > > > +
> > > > +       The ``OUTPUT`` queue must remain streaming. Calling
> > > > +       :c:func:`VIDIOC_STREAMOFF` on it would abort the sequence a=
nd trigger a
> > > > +       seek.
> > > > +
> > > > +9.  **If the** ``CAPTURE`` **queue has buffers allocated,** free t=
he ``CAPTURE``
> > > > +    buffers using :c:func:`VIDIOC_REQBUFS`.
> > > > +
> > > > +    * **Required fields:**
> > > > +
> > > > +      ``count``
> > > > +          set to 0.
> > > > +
> > > > +      ``type``
> > > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > > +
> > > > +      ``memory``
> > > > +          follows standard semantics.
> > > > +
> > > > +10. Allocate ``CAPTURE`` buffers via :c:func:`VIDIOC_REQBUFS` on t=
he
> > > > +    ``CAPTURE`` queue.
> > > > +
> > > > +    * **Required fields:**
> > > > +
> > > > +      ``count``
> > > > +          requested number of buffers to allocate; greater than ze=
ro.
> > > > +
> > > > +      ``type``
> > > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > > +
> > > > +      ``memory``
> > > > +          follows standard semantics.
> > > > +
> > > > +    * **Return fields:**
> > > > +
> > > > +      ``count``
> > > > +          actual number of buffers allocated.
> > > > +
> > > > +    .. warning::
> > > > +
> > > > +       The actual number of allocated buffers may differ from the =
``count``
> > > > +       given. The client must check the updated value of ``count``=
 after the
> > > > +       call returns.
> > > > +
> > > > +    .. note::
> > > > +
> > > > +       To allocate more than the minimum number of buffers (for pi=
peline
> > > > +       depth), the client may query the ``V4L2_CID_MIN_BUFFERS_FOR=
_CAPTURE``
> > > > +       control to get the minimum number of buffers required, and =
pass the
> > > > +       obtained value plus the number of additional buffers needed=
 in the
> > > > +       ``count`` field to :c:func:`VIDIOC_REQBUFS`.
> > > > +
> > > > +    Alternatively, :c:func:`VIDIOC_CREATE_BUFS` on the ``CAPTURE``=
 queue can be
> > > > +    used to have more control over buffer allocation. For example,=
 by
> > > > +    allocating buffers larger than the current ``CAPTURE`` format,=
 future
> > > > +    resolution changes can be accommodated.
> > > > +
> > > > +    * **Required fields:**
> > > > +
> > > > +      ``count``
> > > > +          requested number of buffers to allocate; greater than ze=
ro.
> > > > +
> > > > +      ``type``
> > > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > > +
> > > > +      ``memory``
> > > > +          follows standard semantics.
> > > > +
> > > > +      ``format``
> > > > +          a format representing the maximum framebuffer resolution=
 to be
> > > > +          accommodated by newly allocated buffers.
> > > > +
> > > > +    * **Return fields:**
> > > > +
> > > > +      ``count``
> > > > +          adjusted to the number of allocated buffers.
> > > > +
> > > > +    .. warning::
> > > > +
> > > > +        The actual number of allocated buffers may differ from the=
 ``count``
> > > > +        given. The client must check the updated value of ``count`=
` after the
> > > > +        call returns.
> > > > +
> > > > +    .. note::
> > > > +
> > > > +       To allocate buffers for a format different than parsed from=
 the stream
> > > > +       metadata, the client must proceed as follows, before the me=
tadata
> > > > +       parsing is initiated:
> > > > +
> > > > +       * set width and height of the ``OUTPUT`` format to desired =
coded resolution to
> > > > +         let the decoder configure the ``CAPTURE`` format appropri=
ately,
> > > > +
> > > > +       * query the ``CAPTURE`` format using :c:func:`VIDIOC_G_FMT`=
 and save it
> > > > +         until this step.
> > > > +
> > > > +       The format obtained in the query may be then used with
> > > > +       :c:func:`VIDIOC_CREATE_BUFS` in this step to allocate the b=
uffers.
> > > > +
> > > > +11. Call :c:func:`VIDIOC_STREAMON` on the ``CAPTURE`` queue to sta=
rt decoding
> > > > +    frames.
> > > > +
> > > > +Decoding
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +This state is reached after the `Capture setup` sequence finishes =
successfully.
> > > > +In this state, the client queues and dequeues buffers to both queu=
es via
> > > > +:c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQBUF`, following the st=
andard
> > > > +semantics.
> > > > +
> > > > +The content of the source ``OUTPUT`` buffers depends on the active=
 coded pixel
> > > > +format and may be affected by codec-specific extended controls, as=
 stated in
> > > > +the documentation of each format.
> > > > +
> > > > +Both queues operate independently, following the standard behavior=
 of V4L2
> > > > +buffer queues and memory-to-memory devices. In addition, the order=
 of decoded
> > > > +frames dequeued from the ``CAPTURE`` queue may differ from the ord=
er of queuing
> > > > +coded frames to the ``OUTPUT`` queue, due to properties of the sel=
ected coded
> > > > +format, e.g. frame reordering.
> > > > +
> > > > +The client must not assume any direct relationship between ``CAPTU=
RE``
> > > > +and ``OUTPUT`` buffers and any specific timing of buffers becoming
> > > > +available to dequeue. Specifically:
> > > > +
> > > > +* a buffer queued to ``OUTPUT`` may result in no buffers being pro=
duced
> > > > +  on ``CAPTURE`` (e.g. if it does not contain encoded data, or if =
only
> > > > +  metadata syntax structures are present in it),
> > > > +
> > > > +* a buffer queued to ``OUTPUT`` may result in more than one buffer=
 produced
> > > > +  on ``CAPTURE`` (if the encoded data contained more than one fram=
e, or if
> > > > +  returning a decoded frame allowed the decoder to return a frame =
that
> > > > +  preceded it in decode, but succeeded it in the display order),
> > > > +
> > > > +* a buffer queued to ``OUTPUT`` may result in a buffer being produ=
ced on
> > > > +  ``CAPTURE`` later into decode process, and/or after processing f=
urther
> > > > +  ``OUTPUT`` buffers, or be returned out of order, e.g. if display
> > > > +  reordering is used,
> > > > +
> > > > +* buffers may become available on the ``CAPTURE`` queue without ad=
ditional
> > > > +  buffers queued to ``OUTPUT`` (e.g. during drain or ``EOS``), bec=
ause of the
> > > > +  ``OUTPUT`` buffers queued in the past whose decoding results are=
 only
> > > > +  available at later time, due to specifics of the decoding proces=
s.
> > > > +
> > > > +.. note::
> > > > +
> > > > +   To allow matching decoded ``CAPTURE`` buffers with ``OUTPUT`` b=
uffers they
> > > > +   originated from, the client can set the ``timestamp`` field of =
the
> > > > +   :c:type:`v4l2_buffer` struct when queuing an ``OUTPUT`` buffer.=
 The
> > > > +   ``CAPTURE`` buffer(s), which resulted from decoding that ``OUTP=
UT`` buffer
> > > > +   will have their ``timestamp`` field set to the same value when =
dequeued.
> > > > +
> > > > +   In addition to the straightforward case of one ``OUTPUT`` buffe=
r producing
> > > > +   one ``CAPTURE`` buffer, the following cases are defined:
> > > > +
> > > > +   * one ``OUTPUT`` buffer generates multiple ``CAPTURE`` buffers:=
 the same
> > > > +     ``OUTPUT`` timestamp will be copied to multiple ``CAPTURE`` b=
uffers.
> > > > +
> > > > +   * multiple ``OUTPUT`` buffers generate one ``CAPTURE`` buffer: =
timestamp of
> > > > +     the ``OUTPUT`` buffer queued last will be copied.
> > > > +
> > > > +   * the decoding order differs from the display order (i.e. the `=
`CAPTURE``
> > > > +     buffers are out-of-order compared to the ``OUTPUT`` buffers):=
 ``CAPTURE``
> > > > +     timestamps will not retain the order of ``OUTPUT`` timestamps=
.
> > > > +
> > > > +During the decoding, the decoder may initiate one of the special s=
equences, as
> > > > +listed below. The sequences will result in the decoder returning a=
ll the
> > > > +``CAPTURE`` buffers that originated from all the ``OUTPUT`` buffer=
s processed
> > > > +before the sequence started. Last of the buffers will have the
> > > > +``V4L2_BUF_FLAG_LAST`` flag set. To determine the sequence to foll=
ow, the client
> > > > +must check if there is any pending event and:
> > > > +
> > > > +* if a ``V4L2_EVENT_SOURCE_CHANGE`` event is pending, the `Dynamic=
 resolution
> > > > +  change` sequence needs to be followed,
> > > > +
> > > > +* if a ``V4L2_EVENT_EOS`` event is pending, the `End of stream` se=
quence needs
> > > > +  to be followed.
> > > > +
> > > > +Some of the sequences can be intermixed with each other and need t=
o be handled
> > > > +as they happen. The exact operation is documented for each sequenc=
e.
> > > > +
> > > > +Should a decoding error occur, it will be reported to the client w=
ith the level
> > > > +of details depending on the decoder capabilities. Specifically:
> > > > +
> > > > +* the CAPTURE buffer that contains the results of the failed decod=
e operation
> > > > +  will be returned with the V4L2_BUF_FLAG_ERROR flag set,
> > > > +
> > > > +* if the decoder is able to precisely report the OUTPUT buffer tha=
t triggered
> > > > +  the error, such buffer will be returned with the V4L2_BUF_FLAG_E=
RROR flag
> > > > +  set.
> > > > +
> > > > +In case of a fatal failure that does not allow the decoding to con=
tinue, any
> > > > +further operations on corresponding decoder file handle will retur=
n the -EIO
> > > > +error code. The client may close the file handle and open a new on=
e, or
> > > > +alternatively reinitialize the instance by stopping streaming on b=
oth queues,
> > > > +releasing all buffers and performing the Initialization sequence a=
gain.
> > > > +
> > > > +Seek
> > > > +=3D=3D=3D=3D
> > > > +
> > > > +Seek is controlled by the ``OUTPUT`` queue, as it is the source of=
 coded data.
> > > > +The seek does not require any specific operation on the ``CAPTURE`=
` queue, but
> > > > +it may be affected as per normal decoder operation.
> > > > +
> > > > +1. Stop the ``OUTPUT`` queue to begin the seek sequence via
> > > > +   :c:func:`VIDIOC_STREAMOFF`.
> > > > +
> > > > +   * **Required fields:**
> > > > +
> > > > +     ``type``
> > > > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > > > +
> > > > +   * The decoder will drop all the pending ``OUTPUT`` buffers and =
they must be
> > > > +     treated as returned to the client (following standard semanti=
cs).
> > > > +
> > > > +2. Restart the ``OUTPUT`` queue via :c:func:`VIDIOC_STREAMON`
> > > > +
> > > > +   * **Required fields:**
> > > > +
> > > > +     ``type``
> > > > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > > > +
> > > > +   * The decoder will start accepting new source bitstream buffers=
 after the
> > > > +     call returns.
> > > > +
> > > > +3. Start queuing buffers containing coded data after the seek to t=
he ``OUTPUT``
> > > > +   queue until a suitable resume point is found.
> > > > +
> > > > +   .. note::
> > > > +
> > > > +      There is no requirement to begin queuing coded data starting=
 exactly
> > > > +      from a resume point (e.g. SPS or a keyframe). Any queued ``O=
UTPUT``
> > > > +      buffers will be processed and returned to the client until a=
 suitable
> > > > +      resume point is found.  While looking for a resume point, th=
e decoder
> > > > +      should not produce any decoded frames into ``CAPTURE`` buffe=
rs.
> > > > +
> > > > +      Some hardware is known to mishandle seeks to a non-resume po=
int. Such an
> > > > +      operation may result in an unspecified number of corrupted d=
ecoded frames
> > > > +      being made available on the ``CAPTURE`` queue. Drivers must =
ensure that
> > > > +      no fatal decoding errors or crashes occur, and implement any=
 necessary
> > > > +      handling and workarounds for hardware issues related to seek=
 operations.
> > > > +
> > > > +   .. warning::
> > > > +
> > > > +      In case of the H.264/HEVC codec, the client must take care n=
ot to seek
> > > > +      over a change of SPS/PPS. Even though the target frame could=
 be a
> > > > +      keyframe, the stale SPS/PPS inside decoder state would lead =
to undefined
> > > > +      results when decoding. Although the decoder must handle that=
 case without
> > > > +      a crash or a fatal decode error, the client must not expect =
a sensible
> > > > +      decode output.
> > > > +
> > > > +      If the hardware can detect such corrupted decoded frames, th=
en
> > > > +      corresponding buffers will be returned to the client with th=
e
> > > > +      V4L2_BUF_FLAG_ERROR set. See the `Decoding` section for furt=
her
> > > > +      description of decode error reporting.
> > > > +
> > > > +4. After a resume point is found, the decoder will start returning=
 ``CAPTURE``
> > > > +   buffers containing decoded frames.
> > > > +
> > > > +.. important::
> > > > +
> > > > +   A seek may result in the `Dynamic resolution change` sequence b=
eing
> > > > +   initiated, due to the seek target having decoding parameters di=
fferent from
> > > > +   the part of the stream decoded before the seek. The sequence mu=
st be handled
> > > > +   as per normal decoder operation.
> > > > +
> > > > +.. warning::
> > > > +
> > > > +   It is not specified when the ``CAPTURE`` queue starts producing=
 buffers
> > > > +   containing decoded data from the ``OUTPUT`` buffers queued afte=
r the seek,
> > > > +   as it operates independently from the ``OUTPUT`` queue.
> > > > +
> > > > +   The decoder may return a number of remaining ``CAPTURE`` buffer=
s containing
> > > > +   decoded frames originating from the ``OUTPUT`` buffers queued b=
efore the
> > > > +   seek sequence is performed.
> > > > +
> > > > +   The ``VIDIOC_STREAMOFF`` operation discards any remaining queue=
d
> > > > +   ``OUTPUT`` buffers, which means that not all of the ``OUTPUT`` =
buffers
> > > > +   queued before the seek sequence may have matching ``CAPTURE`` b=
uffers
> > > > +   produced.  For example, given the sequence of operations on the
> > > > +   ``OUTPUT`` queue:
> > > > +
> > > > +     QBUF(A), QBUF(B), STREAMOFF(), STREAMON(), QBUF(G), QBUF(H),
> > > > +
> > > > +   any of the following results on the ``CAPTURE`` queue is allowe=
d:
> > > > +
> > > > +     {A=E2=80=99, B=E2=80=99, G=E2=80=99, H=E2=80=99}, {A=E2=80=99=
, G=E2=80=99, H=E2=80=99}, {G=E2=80=99, H=E2=80=99}.
> > > > +
> > > > +   To determine the CAPTURE buffer containing the first decoded fr=
ame after the
> > > > +   seek, the client may observe the timestamps to match the CAPTUR=
E and OUTPUT
> > > > +   buffers or use V4L2_DEC_CMD_STOP and V4L2_DEC_CMD_START to drai=
n the
> > > > +   decoder.
> > > > +
> > > > +.. note::
> > > > +
> > > > +   To achieve instantaneous seek, the client may restart streaming=
 on the
> > > > +   ``CAPTURE`` queue too to discard decoded, but not yet dequeued =
buffers.
> > > > +
> > > > +Dynamic resolution change
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > +
> > > > +Streams that include resolution metadata in the bitstream may requ=
ire switching
> > > > +to a different resolution during the decoding.
> > > > +
> > > > +The sequence starts when the decoder detects a coded frame with on=
e or more of
> > > > +the following parameters different from those previously establish=
ed (and
> > > > +reflected by corresponding queries):
> > > > +
> > > > +* coded resolution (``OUTPUT`` width and height),
> > > > +
> > > > +* visible resolution (selection rectangles),
> > > > +
> > > > +* the minimum number of buffers needed for decoding.
> > > > +
> > > > +Whenever that happens, the decoder must proceed as follows:
> > > > +
> > > > +1.  After encountering a resolution change in the stream, the deco=
der sends a
> > > > +    ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
> > > > +    ``V4L2_EVENT_SRC_CH_RESOLUTION``.
> > >=20
> > > What about a format changes that does now affect the resolution, like=
 a
> > > pixel format change ? Also, what about changes that don't require a
> >=20
> > A pixel format change always implies a resolution change.
> >=20
> > > reallocation ? Like a change in the colorimetry parameters ? I don't
> > > think the spec need to initially cover it all, but we need to make su=
re
> > > there is a mechanism for userspace to know at which frames to read ba=
ck
> > > the new format (G_FMT). Maybe we need both an event and a buffer flag
> > > to mark it ?
> >=20
> > After a SOURCE_CHANGE event is received, G_FMT returns the *new* format=
,
> > including colorimetry. This will become the active format once the drai=
n
> > operation finished.
> >=20
> > If that's not clear from the spec, then I need to improve it.
> >=20
> > Regards,
> >=20
> >         Hans
> >=20
> > > > +
> > > > +    .. important::
> > > > +
> > > > +       Any client query issued after the decoder queues the event =
will return
> > > > +       values applying to the stream after the resolution change, =
including
> > > > +       queue formats, selection rectangles and controls.
> > > > +
> > > > +2.  The decoder will then process and decode all remaining buffers=
 from before
> > > > +    the resolution change point.
> > > > +
> > > > +    * The last buffer from before the change must be marked with t=
he
> > > > +      ``V4L2_BUF_FLAG_LAST`` flag, similarly to the `Drain` sequen=
ce above.
> > > > +
> > > > +    .. warning::
> > > > +
> > > > +       The last buffer may be empty (with :c:type:`v4l2_buffer` ``=
bytesused``
> > > > +       =3D 0) and in that case it must be ignored by the client, a=
s it does not
> > > > +       contain a decoded frame.
> > > > +
> > > > +    .. note::
> > > > +
> > > > +       Any attempt to dequeue more ``CAPTURE`` buffers beyond the =
buffer marked
> > > > +       with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE error f=
rom
> > > > +       :c:func:`VIDIOC_DQBUF`.
> > > > +
> > > > +The client must continue the sequence as described below to contin=
ue the
> > > > +decoding process.
> > > > +
> > > > +1.  Dequeue the source change event.
> > > > +
> > > > +    .. important::
> > > > +
> > > > +       A source change triggers an implicit decoder drain, similar=
 to the
> > > > +       explicit `Drain` sequence. The decoder is stopped after it =
completes.
> > > > +       The decoding process must be resumed with either a pair of =
calls to
> > > > +       :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on=
 the
> > > > +       ``CAPTURE`` queue, or a call to :c:func:`VIDIOC_DECODER_CMD=
` with the
> > > > +       ``V4L2_DEC_CMD_START`` command.
> > > > +
> > > > +2.  Continue with the `Capture setup` sequence.
> > > > +
> > > > +.. note::
> > > > +
> > > > +   During the resolution change sequence, the ``OUTPUT`` queue mus=
t remain
> > > > +   streaming. Calling :c:func:`VIDIOC_STREAMOFF` on the ``OUTPUT``=
 queue would
> > > > +   abort the sequence and initiate a seek.
> > > > +
> > > > +   In principle, the ``OUTPUT`` queue operates separately from the=
 ``CAPTURE``
> > > > +   queue and this remains true for the duration of the entire reso=
lution change
> > > > +   sequence as well.
> > > > +
> > > > +   The client should, for best performance and simplicity, keep qu=
euing/dequeuing
> > > > +   buffers to/from the ``OUTPUT`` queue even while processing this=
 sequence.
> > > > +
> > > > +Drain
> > > > +=3D=3D=3D=3D=3D
> > > > +
> > > > +To ensure that all queued ``OUTPUT`` buffers have been processed a=
nd related
> > > > +``CAPTURE`` buffers are given to the client, the client must follo=
w the drain
> > > > +sequence described below. After the drain sequence ends, the clien=
t has
> > > > +received all decoded frames for all ``OUTPUT`` buffers queued befo=
re the
> > > > +sequence was started.
> > > > +
> > > > +1. Begin drain by issuing :c:func:`VIDIOC_DECODER_CMD`.
> > > > +
> > > > +   * **Required fields:**
> > > > +
> > > > +     ``cmd``
> > > > +         set to ``V4L2_DEC_CMD_STOP``.
> > > > +
> > > > +     ``flags``
> > > > +         set to 0.
> > > > +
> > > > +     ``pts``
> > > > +         set to 0.
> > > > +
> > > > +   .. warning::
> > > > +
> > > > +      The sequence can be only initiated if both ``OUTPUT`` and ``=
CAPTURE``
> > > > +      queues are streaming. For compatibility reasons, the call to
> > > > +      :c:func:`VIDIOC_DECODER_CMD` will not fail even if any of th=
e queues is
> > > > +      not streaming, but at the same time it will not initiate the=
 `Drain`
> > > > +      sequence and so the steps described below would not be appli=
cable.
> > > > +
> > > > +2. Any ``OUTPUT`` buffers queued by the client before the
> > > > +   :c:func:`VIDIOC_DECODER_CMD` was issued will be processed and d=
ecoded as
> > > > +   normal. The client must continue to handle both queues independ=
ently,
> > > > +   similarly to normal decode operation. This includes:
> > > > +
> > > > +   * handling any operations triggered as a result of processing t=
hose buffers,
> > > > +     such as the `Dynamic resolution change` sequence, before cont=
inuing with
> > > > +     the drain sequence,
> > > > +
> > > > +   * queuing and dequeuing ``CAPTURE`` buffers, until a buffer mar=
ked with the
> > > > +     ``V4L2_BUF_FLAG_LAST`` flag is dequeued,
> > > > +
> > > > +     .. warning::
> > > > +
> > > > +        The last buffer may be empty (with :c:type:`v4l2_buffer`
> > > > +        ``bytesused`` =3D 0) and in that case it must be ignored b=
y the client,
> > > > +        as it does not contain a decoded frame.
> > > > +
> > > > +     .. note::
> > > > +
> > > > +        Any attempt to dequeue more ``CAPTURE`` buffers beyond the=
 buffer
> > > > +        marked with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE=
 error from
> > > > +        :c:func:`VIDIOC_DQBUF`.
> > > > +
> > > > +   * dequeuing processed ``OUTPUT`` buffers, until all the buffers=
 queued
> > > > +     before the ``V4L2_DEC_CMD_STOP`` command are dequeued,
> > > > +
> > > > +   * dequeuing the ``V4L2_EVENT_EOS`` event, if the client subscri=
bed to it.
> > > > +
> > > > +   .. note::
> > > > +
> > > > +      For backwards compatibility, the decoder will signal a ``V4L=
2_EVENT_EOS``
> > > > +      event when the last frame has been decoded and all frames ar=
e ready to be
> > > > +      dequeued. It is a deprecated behavior and the client must no=
t rely on it.
> > > > +      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instea=
d.
> > > > +
> > > > +3. Once all the ``OUTPUT`` buffers queued before the ``V4L2_DEC_CM=
D_STOP`` call
> > > > +   are dequeued and the last ``CAPTURE`` buffer is dequeued, the d=
ecoder is
> > > > +   stopped and it will accept, but not process, any newly queued `=
`OUTPUT``
> > > > +   buffers until the client issues any of the following operations=
:
> > > > +
> > > > +   * ``V4L2_DEC_CMD_START`` - the decoder will not be reset and wi=
ll resume
> > > > +     operation normally, with all the state from before the drain,
> > > > +
> > > > +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STRE=
AMON` on the
> > > > +     ``CAPTURE`` queue - the decoder will resume the operation nor=
mally,
> > > > +     however any ``CAPTURE`` buffers still in the queue will be re=
turned to the
> > > > +     client,
> > > > +
> > > > +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STRE=
AMON` on the
> > > > +     ``OUTPUT`` queue - any pending source buffers will be returne=
d to the
> > > > +     client and the `Seek` sequence will be triggered.
> > > > +
> > > > +.. note::
> > > > +
> > > > +   Once the drain sequence is initiated, the client needs to drive=
 it to
> > > > +   completion, as described by the steps above, unless it aborts t=
he process by
> > > > +   issuing :c:func:`VIDIOC_STREAMOFF` on any of the ``OUTPUT`` or =
``CAPTURE``
> > > > +   queues.  The client is not allowed to issue ``V4L2_DEC_CMD_STAR=
T`` or
> > > > +   ``V4L2_DEC_CMD_STOP`` again while the drain sequence is in prog=
ress and they
> > > > +   will fail with -EBUSY error code if attempted.
> > > > +
> > > > +   Although mandatory, the availability of decoder commands may be=
 queried
> > > > +   using :c:func:`VIDIOC_TRY_DECODER_CMD`.
> > > > +
> > > > +End of stream
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +If the decoder encounters an end of stream marking in the stream, =
the decoder
> > > > +will initiate the `Drain` sequence, which the client must handle a=
s described
> > > > +above, skipping the initial :c:func:`VIDIOC_DECODER_CMD`.
> > > > +
> > > > +Commit points
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +Setting formats and allocating buffers trigger changes in the beha=
vior of the
> > > > +decoder.
> > > > +
> > > > +1. Setting the format on the ``OUTPUT`` queue may change the set o=
f formats
> > > > +   supported/advertised on the ``CAPTURE`` queue. In particular, i=
t also means
> > > > +   that the ``CAPTURE`` format may be reset and the client must no=
t rely on the
> > > > +   previously set format being preserved.
> > > > +
> > > > +2. Enumerating formats on the ``CAPTURE`` queue always returns onl=
y formats
> > > > +   supported for the current ``OUTPUT`` format.
> > > > +
> > > > +3. Setting the format on the ``CAPTURE`` queue does not change the=
 list of
> > > > +   formats available on the ``OUTPUT`` queue. An attempt to set a =
``CAPTURE``
> > > > +   format that is not supported for the currently selected ``OUTPU=
T`` format
> > > > +   will result in the decoder adjusting the requested ``CAPTURE`` =
format to a
> > > > +   supported one.
> > > > +
> > > > +4. Enumerating formats on the ``OUTPUT`` queue always returns the =
full set of
> > > > +   supported coded formats, irrespectively of the current ``CAPTUR=
E`` format.
> > > > +
> > > > +5. While buffers are allocated on any of the ``OUTPUT`` or ``CAPTU=
RE`` queues,
> > > > +   the client must not change the format on the ``OUTPUT`` queue. =
Drivers will
> > > > +   return the -EBUSY error code for any such format change attempt=
.
> > > > +
> > > > +To summarize, setting formats and allocation must always start wit=
h the
> > > > +``OUTPUT`` queue and the ``OUTPUT`` queue is the master that gover=
ns the
> > > > +set of supported formats for the ``CAPTURE`` queue.
> > > > diff --git a/Documentation/media/uapi/v4l/dev-mem2mem.rst b/Documen=
tation/media/uapi/v4l/dev-mem2mem.rst
> > > > index 67a980818dc8..caa05f5f6380 100644
> > > > --- a/Documentation/media/uapi/v4l/dev-mem2mem.rst
> > > > +++ b/Documentation/media/uapi/v4l/dev-mem2mem.rst
> > > > @@ -39,4 +39,10 @@ file handle is visible through another file hand=
le).
> > > >  One of the most common memory-to-memory device is the codec. Codec=
s
> > > >  are more complicated than most and require additional setup for
> > > >  their codec parameters. This is done through codec controls.
> > > > -See :ref:`mpeg-controls`.
> > > > +See :ref:`mpeg-controls`. More details on how to use codec memory-=
to-memory
> > > > +devices are given in the following sections.
> > > > +
> > > > +.. toctree::
> > > > +    :maxdepth: 1
> > > > +
> > > > +    dev-decoder
> > > > diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documen=
tation/media/uapi/v4l/pixfmt-v4l2.rst
> > > > index 71eebfc6d853..caf14e440447 100644
> > > > --- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> > > > +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> > > > @@ -39,6 +39,11 @@ Single-planar format structure
> > > >      to a multiple of the scale factor of any smaller planes. For
> > > >      example when the image format is YUV 4:2:0, ``width`` and
> > > >      ``height`` must be multiples of two.
> > > > +
> > > > +    For compressed formats that contain the resolution information=
 encoded
> > > > +    inside the stream, when fed to a stateful mem2mem decoder, the=
 fields
> > > > +    may be zero to rely on the decoder to detect the right values.=
 For more
> > > > +    details see :ref:`decoder` and format descriptions.
> > > >      * - __u32
> > > >        - ``pixelformat``
> > > >        - The pixel format or type of compression, set by the applic=
ation.
> > > > diff --git a/Documentation/media/uapi/v4l/v4l2.rst b/Documentation/=
media/uapi/v4l/v4l2.rst
> > > > index 004ec00db6bd..97015b9b40b8 100644
> > > > --- a/Documentation/media/uapi/v4l/v4l2.rst
> > > > +++ b/Documentation/media/uapi/v4l/v4l2.rst
> > > > @@ -60,6 +60,10 @@ Authors, in alphabetical order:
> > > >=20
> > > >    - Original author of the V4L2 API and documentation.
> > > >=20
> > > > +- Figa, Tomasz <tfiga@chromium.org>
> > > > +
> > > > +  - Documented the memory-to-memory decoder interface.
> > > > +
> > > >  - H Schimek, Michael <mschimek@gmx.at>
> > > >=20
> > > >    - Original author of the V4L2 API and documentation.
> > > > @@ -68,6 +72,10 @@ Authors, in alphabetical order:
> > > >=20
> > > >    - Documented the Digital Video timings API.
> > > >=20
> > > > +- Osciak, Pawel <posciak@chromium.org>
> > > > +
> > > > +  - Documented the memory-to-memory decoder interface.
> > > > +
> > > >  - Osciak, Pawel <pawel@osciak.com>
> > > >=20
> > > >    - Designed and documented the multi-planar API.
> > > > @@ -92,7 +100,7 @@ Authors, in alphabetical order:
> > > >=20
> > > >    - Designed and documented the VIDIOC_LOG_STATUS ioctl, the exten=
ded control ioctls, major parts of the sliced VBI API, the MPEG encoder and=
 decoder APIs and the DV Timings API.
> > > >=20
> > > > -**Copyright** |copy| 1999-2016: Bill Dirks, Michael H. Schimek, Ha=
ns Verkuil, Martin Rubli, Andy Walls, Muralidharan Karicheri, Mauro Carvalh=
o Chehab, Pawel Osciak, Sakari Ailus & Antti Palosaari.
> > > > +**Copyright** |copy| 1999-2018: Bill Dirks, Michael H. Schimek, Ha=
ns Verkuil, Martin Rubli, Andy Walls, Muralidharan Karicheri, Mauro Carvalh=
o Chehab, Pawel Osciak, Sakari Ailus & Antti Palosaari, Tomasz Figa
> > > >=20
> > > >  Except when explicitly stated as GPL, programming examples within =
this
> > > >  part can be used and distributed without restrictions.
> > > > diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/=
Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> > > > index ccf83b05afa7..57f0066f4cff 100644
> > > > --- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> > > > +++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> > > > @@ -56,14 +56,16 @@ The ``cmd`` field must contain the command code=
. Some commands use the
> > > >=20
> > > >  A :ref:`write() <func-write>` or :ref:`VIDIOC_STREAMON`
> > > >  call sends an implicit START command to the decoder if it has not =
been
> > > > -started yet.
> > > > +started yet. Applies to both queues of mem2mem decoders.
> > > >=20
> > > >  A :ref:`close() <func-close>` or :ref:`VIDIOC_STREAMOFF <VIDIOC_ST=
REAMON>`
> > > >  call of a streaming file descriptor sends an implicit immediate ST=
OP
> > > > -command to the decoder, and all buffered data is discarded.
> > > > +command to the decoder, and all buffered data is discarded. Applie=
s to both
> > > > +queues of mem2mem decoders.
> > > >=20
> > > > -These ioctls are optional, not all drivers may support them. They =
were
> > > > -introduced in Linux 3.3.
> > > > +In principle, these ioctls are optional, not all drivers may suppo=
rt them. They were
> > > > +introduced in Linux 3.3. They are, however, mandatory for stateful=
 mem2mem decoders
> > > > +(as further documented in :ref:`decoder`).
> > > >=20
> > > >=20
> > > >  .. tabularcolumns:: |p{1.1cm}|p{2.4cm}|p{1.2cm}|p{1.6cm}|p{10.6cm}=
|
> > > > @@ -167,26 +169,32 @@ introduced in Linux 3.3.
> > > >      ``V4L2_DEC_CMD_RESUME`` for that. This command has one flag:
> > > >      ``V4L2_DEC_CMD_START_MUTE_AUDIO``. If set, then audio will be
> > > >      muted when playing back at a non-standard speed.
> > > > +
> > > > +    For a device implementing the :ref:`decoder`, once the drain s=
equence
> > > > +    is initiated with the ``V4L2_DEC_CMD_STOP`` command, it must b=
e driven
> > > > +    to completion before this command can be invoked.  Any attempt=
 to
> > > > +    invoke the command while the drain sequence is in progress wil=
l trigger
> > > > +    an ``EBUSY`` error code.  The command may be also used to rest=
art the
> > > > +    decoder in case of an implicit stop initiated by the decoder i=
tself,
> > > > +    without the ``V4L2_DEC_CMD_STOP`` being called explicitly. See
> > > > +    :ref:`decoder` for more details.
> > > >      * - ``V4L2_DEC_CMD_STOP``
> > > >        - 1
> > > >        - Stop the decoder. When the decoder is already stopped, thi=
s
> > > >      command does nothing. This command has two flags: if
> > > >      ``V4L2_DEC_CMD_STOP_TO_BLACK`` is set, then the decoder will s=
et
> > > >      the picture to black after it stopped decoding. Otherwise the =
last
> > > > -    image will repeat. mem2mem decoders will stop producing new fr=
ames
> > > > -    altogether. They will send a ``V4L2_EVENT_EOS`` event when the
> > > > -    last frame has been decoded and all frames are ready to be
> > > > -    dequeued and will set the ``V4L2_BUF_FLAG_LAST`` buffer flag o=
n
> > > > -    the last buffer of the capture queue to indicate there will be=
 no
> > > > -    new buffers produced to dequeue. This buffer may be empty,
> > > > -    indicated by the driver setting the ``bytesused`` field to 0. =
Once
> > > > -    the ``V4L2_BUF_FLAG_LAST`` flag was set, the
> > > > -    :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will not block anymore=
,
> > > > -    but return an ``EPIPE`` error code. If
> > > > +    image will repeat. If
> > > >      ``V4L2_DEC_CMD_STOP_IMMEDIATELY`` is set, then the decoder sto=
ps
> > > >      immediately (ignoring the ``pts`` value), otherwise it will ke=
ep
> > > >      decoding until timestamp >=3D pts or until the last of the pen=
ding
> > > >      data from its internal buffers was decoded.
> > > > +
> > > > +    For a device implementing the :ref:`decoder`, the command will=
 initiate
> > > > +    the drain sequence as documented in :ref:`decoder`.  No flags =
or other
> > > > +    arguments are accepted in this case. Any attempt to invoke the=
 command
> > > > +    again before the sequence completes will trigger an ``EBUSY`` =
error
> > > > +    code.
> > > >      * - ``V4L2_DEC_CMD_PAUSE``
> > > >        - 2
> > > >        - Pause the decoder. When the decoder has not been started y=
et, the
> > > > @@ -209,6 +217,11 @@ On success 0 is returned, on error -1 and the =
``errno`` variable is set
> > > >  appropriately. The generic error codes are described at the
> > > >  :ref:`Generic Error Codes <gen-errors>` chapter.
> > > >=20
> > > > +EBUSY
> > > > +    A drain sequence of a device implementing the :ref:`decoder` i=
s still in
> > > > +    progress. It is not allowed to issue another decoder command u=
ntil it
> > > > +    completes.
> > > > +
> > > >  EINVAL
> > > >      The ``cmd`` field is invalid.
> > > >=20

--=-wJyU/6uLLqwHawOHNLT+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXS3B0QAKCRBxUwItrAao
HBgmAKC3mTvWT9m3N/YBsTBANpWflvs0QQCfSIk7naGN/Gaxz4wI+mPajWByYH4=
=8Xx7
-----END PGP SIGNATURE-----

--=-wJyU/6uLLqwHawOHNLT+--

