Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 320A1688BC
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 14:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbfGOMNF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 08:13:05 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51055 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729948AbfGOMNE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 08:13:04 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so14930653wml.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2019 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0pvEXBnRgBw+8TbZ0v/IDzSiA5lrpEhS/3eiKCi2Ffk=;
        b=F/VFgXgkAf6fbXVFY7OVjktZ++8D9Cfnye8EL7uY0yND7HPDi2H4M1XijY7cPUTdlL
         vkJXD6spytBazxeae3AaGoceKxpKNE2ePsigEFv2+MLBi9pG07jadRJ8DVxXUl0Ym5dB
         ve8bmT5lNWTNjaaiYXzlOPyvCOF88rLhddnlY3ZJsB0nFVDOWiBRUo54tUd9Ptq2/y/n
         IOnqGwkCYZRcpZ/nOr7eDKwQSUm8YOCosUBSL6MDD4rC0Ez503yd5lEKZPyfeKRoGR4C
         zuBXu1Bl/epo3sij1McDSaHQ72IAVBVx+ae+lC9Jw/qHT5DpIa4/V2FPhqX9LdQWWNOm
         q1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0pvEXBnRgBw+8TbZ0v/IDzSiA5lrpEhS/3eiKCi2Ffk=;
        b=dZPUKZdVMDypqz106s8hv6Q3x9wbeAN+074s4vRMPmLPzje9vLXPz5anoOdp8KarHJ
         aB3XnBRYIAl3XdV7mh83h7ADo2uFnWzc92B24B692T1b4UHDdjYhcnh+vvKus3Qv1zBy
         29FxWiitnFmkCPCHuflj/8h6JfU5dd7Iezc072OE8eTfhbXVTMf/AXiEqKEcIBI61CB0
         7ed6HKVX8JGtZsjoW/KMfS3we4v1UCNw9AHNFhdF1/oUNBC7x5YSxp4G96OIZ0lai6YT
         8BhZPAta4GmmWedVSXjiALkNgB3aqVrquoOFYKP6hThOCHPQzBdpLcuL6cUaeiGX5B9X
         gP0Q==
X-Gm-Message-State: APjAAAX5dozvFXuSgZXGq/qE1NpwQWCpvW2qHZBhgFMWD+ZVsmeDLXuw
        LBQDofFc3oZuTmMI9TN33MPuZKlrd472TB/cH4vK5g==
X-Google-Smtp-Source: APXvYqz+516JnYzo3qTM0w12OusaEH3WUV9UG+PlsDILk8GaxcUBXKeNDwgrvR4Cu4PbbOxLjLF0WdUb9i99ofBdETg=
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr25260165wmc.62.1563192776204;
 Mon, 15 Jul 2019 05:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
 <20190603112835.19661-2-hverkuil-cisco@xs4all.nl> <ffaad429bbdcf1a15049ec6df404618f4f2a9a36.camel@ndufresne.ca>
 <9c19ece0-f980-62a6-f26e-a91930d117f3@xs4all.nl>
In-Reply-To: <9c19ece0-f980-62a6-f26e-a91930d117f3@xs4all.nl>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Mon, 15 Jul 2019 14:12:45 +0200
Message-ID: <CAMO6nazhyamHC_RAOL8zq4YADD6xJ4dwHuobopSMn7RCrXUzsw@mail.gmail.com>
Subject: Re: [PATCHv4 1/2] media: docs-rst: Document memory-to-memory video
 decoder interface
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 11, 2019 at 10:29 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wr=
ote:
>
> On 6/10/19 9:54 PM, Nicolas Dufresne wrote:
> > Hi Hans,
> >
> > I went through it, and I think we are close to ready. Unfortunately, I
> > believe the SOURCE_CHANGE event is still under specified. There was a
> > post recently to try and add a new flag for changes in color space
> > which is not included here. We are also missing a workflow for changes
> > that don't affect the allocation but will affect the rendering on a
> > display (like colorimetry). Userspace needs to know at which frames
> > these parameter changes in order to signal that to the following
> > processing block. I think we must have a plane for this.
>
> Yes, we need a new flag for the SOURCE_CHANGE event to indicate colorimet=
ry
> changes. That's actually useful for e.g. HDMI receivers as well.
>
> But I don't see why that should make much of a change to the spec: you st=
ill
> have to drain the capture queue, the only difference is that you don't ne=
ed
> to reallocate buffers, you can just restart the decoder.
>
> My intention was to get this spec in first, then extend it once we have a=
 new
> colorimetry change flag.
>
> >
> > Another aspect, I'd like if we could relax a bit the bits about dynamic
> > resolutions, making some space for the "static resolution" cases.
> > Something to keep in mind, these "static resolution" HW might not be
> > able to inform userspace of the display size of the picture, we should
> > check with Maxime what happens with the Amlogic.
>
> I've asked him about that in another email thread:
>
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg147652.html
>
> Maxime, related to that: can the amlogic detect midstream colorimetry
> changes? Or is that also impossible?
>

Hi Hans, Nicolas,

The SOURCE_CHANGE limitations on amlogic are related to older
compression standards. I'm focusing on H264, HEVC, VP9 which will all
be able to properly report resolution changes (and probing at init).
Currently, older codecs such as MPEG 1/2 require userspace to probe
the coded resolution itself and set it to the driver via S_FMT, but
there is no indication from the driver about that. See the series
about the FIXED_RESOLUTION fmt flag for what I had in mind but isn't
that great of a solution..

When it comes to colorimetry, I don't believe I saw anything in the
vendor SDK that relates to probing colorspace (e.g bt.709/bt.601
etc.).

@Nicolas: is this information embedded in a SEI packet or SPS/PPS when
it comes to H264 ?

> >
> > Le lundi 03 juin 2019 =C3=A0 13:28 +0200, Hans Verkuil a =C3=A9crit :
> >> From: Tomasz Figa <tfiga@chromium.org>
> >>
> >> Due to complexity of the video decoding process, the V4L2 drivers of
> >> stateful decoder hardware require specific sequences of V4L2 API calls
> >> to be followed. These include capability enumeration, initialization,
> >> decoding, seek, pause, dynamic resolution change, drain and end of
> >> stream.
> >>
> >> Specifics of the above have been discussed during Media Workshops at
> >> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> >> Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API that
> >> originated at those events was later implemented by the drivers we alr=
eady
> >> have merged in mainline, such as s5p-mfc or coda.
> >>
> >> The only thing missing was the real specification included as a part o=
f
> >> Linux Media documentation. Fix it now and document the decoder part of
> >> the Codec API.
> >>
> >> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 ++++++++++++++++=
+
> >>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |    8 +-
> >>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |    5 +
> >>  Documentation/media/uapi/v4l/v4l2.rst         |   10 +-
> >>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
> >>  5 files changed, 1132 insertions(+), 16 deletions(-)
> >>  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
> >>
> >> diff --git a/Documentation/media/uapi/v4l/dev-decoder.rst b/Documentat=
ion/media/uapi/v4l/dev-decoder.rst
> >> new file mode 100644
> >> index 000000000000..b106f2d97c48
> >> --- /dev/null
> >> +++ b/Documentation/media/uapi/v4l/dev-decoder.rst
> >> @@ -0,0 +1,1084 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +.. _decoder:
> >> +
> >> +*************************************************
> >> +Memory-to-memory Stateful Video Decoder Interface
> >> +*************************************************
> >> +
> >> +A stateful video decoder takes complete chunks of the bitstream (e.g.=
 Annex-B
> >> +H.264/HEVC stream, raw VP8/9 stream) and decodes them into raw video =
frames in
> >
> > (minor, may ignore)
> > This isn't very precise, do we expect to document this per-format ? I
> > think we should maybe say "a complete frame of the bitstream", that
> > being said, I think stateful CODEC should be allowed to implement the
> > per-slice/per-frame control we are adding to stateless CODEC. Maybe
> > something like "documented complete chunks of bitstream" ?
> >
> >> +display order. The decoder is expected not to require any additional =
information
> >> +from the client to process these buffers.
> >> +
> >> +Performing software parsing, processing etc. of the stream in the dri=
ver in
> >> +order to support this interface is strongly discouraged. In case such
> >> +operations are needed, use of the Stateless Video Decoder Interface (=
in
> >> +development) is strongly advised.
> >> +
> >> +Conventions and notation used in this document
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +1. The general V4L2 API rules apply if not specified in this document
> >> +   otherwise.
> >> +
> >> +2. The meaning of words "must", "may", "should", etc. is as per `RFC
> >> +   2119 <https://tools.ietf.org/html/rfc2119>`_.
> >> +
> >> +3. All steps not marked "optional" are required.
> >> +
> >> +4. :c:func:`VIDIOC_G_EXT_CTRLS` and :c:func:`VIDIOC_S_EXT_CTRLS` may =
be used
> >> +   interchangeably with :c:func:`VIDIOC_G_CTRL` and :c:func:`VIDIOC_S=
_CTRL`,
> >> +   unless specified otherwise.
> >> +
> >> +5. Single-planar API (see :ref:`planar-apis`) and applicable structur=
es may be
> >> +   used interchangeably with multi-planar API, unless specified other=
wise,
> >> +   depending on decoder capabilities and following the general V4L2 g=
uidelines.
> >> +
> >> +6. i =3D [a..b]: sequence of integers from a to b, inclusive, i.e. i =
=3D
> >> +   [0..2]: i =3D 0, 1, 2.
> >> +
> >> +7. Given an ``OUTPUT`` buffer A, then A=E2=80=99 represents a buffer =
on the ``CAPTURE``
> >> +   queue containing data that resulted from processing buffer A.
> >> +
> >> +.. _decoder-glossary:
> >> +
> >> +Glossary
> >> +=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +CAPTURE
> >> +   the destination buffer queue; for decoders, the queue of buffers c=
ontaining
> >> +   decoded frames; for encoders, the queue of buffers containing an e=
ncoded
> >> +   bitstream; ``V4L2_BUF_TYPE_VIDEO_CAPTURE`` or
> >> +   ``V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE``; data is captured from the =
hardware
> >> +   into ``CAPTURE`` buffers.
> >> +
> >> +client
> >> +   the application communicating with the decoder or encoder implemen=
ting
> >> +   this interface.
> >> +
> >> +coded format
> >> +   encoded/compressed video bitstream format (e.g. H.264, VP8, etc.);=
 see
> >> +   also: raw format.
> >> +
> >> +coded height
> >> +   height for given coded resolution.
> >> +
> >> +coded resolution
> >> +   stream resolution in pixels aligned to codec and hardware requirem=
ents;
> >> +   typically visible resolution rounded up to full macroblocks;
> >> +   see also: visible resolution.
> >> +
> >> +coded width
> >> +   width for given coded resolution.
> >> +
> >> +decode order
> >> +   the order in which frames are decoded; may differ from display ord=
er if the
> >> +   coded format includes a feature of frame reordering; for decoders,
> >> +   ``OUTPUT`` buffers must be queued by the client in decode order; f=
or
> >> +   encoders ``CAPTURE`` buffers must be returned by the encoder in de=
code order.
> >> +
> >> +destination
> >> +   data resulting from the decode process; see ``CAPTURE``.
> >> +
> >> +display order
> >> +   the order in which frames must be displayed; for encoders, ``OUTPU=
T``
> >> +   buffers must be queued by the client in display order; for decoder=
s,
> >> +   ``CAPTURE`` buffers must be returned by the decoder in display ord=
er.
> >> +
> >> +DPB
> >> +   Decoded Picture Buffer; an H.264/HEVC term for a buffer that store=
s a decoded
> >> +   raw frame available for reference in further decoding steps.
> >> +
> >> +EOS
> >> +   end of stream.
> >> +
> >> +IDR
> >> +   Instantaneous Decoder Refresh; a type of a keyframe in an H.264/HE=
VC-encoded
> >> +   stream, which clears the list of earlier reference frames (DPBs).
> >> +
> >> +keyframe
> >> +   an encoded frame that does not reference frames decoded earlier, i=
.e.
> >> +   can be decoded fully on its own.
> >> +
> >> +macroblock
> >> +   a processing unit in image and video compression formats based on =
linear
> >> +   block transforms (e.g. H.264, VP8, VP9); codec-specific, but for m=
ost of
> >> +   popular codecs the size is 16x16 samples (pixels).
> >> +
> >> +OUTPUT
> >> +   the source buffer queue; for decoders, the queue of buffers contai=
ning
> >> +   an encoded bitstream; for encoders, the queue of buffers containin=
g raw
> >> +   frames; ``V4L2_BUF_TYPE_VIDEO_OUTPUT`` or
> >> +   ``V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE``; the hardware is fed with da=
ta
> >> +   from ``OUTPUT`` buffers.
> >> +
> >> +PPS
> >> +   Picture Parameter Set; a type of metadata entity in an H.264/HEVC =
bitstream.
> >> +
> >> +raw format
> >> +   uncompressed format containing raw pixel data (e.g. YUV, RGB forma=
ts).
> >> +
> >> +resume point
> >> +   a point in the bitstream from which decoding may start/continue, w=
ithout
> >> +   any previous state/data present, e.g.: a keyframe (VP8/VP9) or
> >> +   SPS/PPS/IDR sequence (H.264/HEVC); a resume point is required to s=
tart decode
> >> +   of a new stream, or to resume decoding after a seek.
> >> +
> >> +source
> >> +   data fed to the decoder or encoder; see ``OUTPUT``.
> >> +
> >> +source height
> >> +   height in pixels for given source resolution; relevant to encoders=
 only.
> >> +
> >> +source resolution
> >> +   resolution in pixels of source frames being source to the encoder =
and
> >> +   subject to further cropping to the bounds of visible resolution; r=
elevant to
> >> +   encoders only.
> >> +
> >> +source width
> >> +   width in pixels for given source resolution; relevant to encoders =
only.
> >> +
> >> +SPS
> >> +   Sequence Parameter Set; a type of metadata entity in an H.264/HEVC=
 bitstream.
> >> +
> >> +stream metadata
> >> +   additional (non-visual) information contained inside encoded bitst=
ream;
> >> +   for example: coded resolution, visible resolution, codec profile.
> >> +
> >> +visible height
> >> +   height for given visible resolution; display height.
> >> +
> >> +visible resolution
> >> +   stream resolution of the visible picture, in pixels, to be used fo=
r
> >> +   display purposes; must be smaller or equal to coded resolution;
> >> +   display resolution.
> >> +
> >> +visible width
> >> +   width for given visible resolution; display width.
> >> +
> >> +State machine
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +.. kernel-render:: DOT
> >> +   :alt: DOT digraph of decoder state machine
> >> +   :caption: Decoder state machine
> >> +
> >> +   digraph decoder_state_machine {
> >> +       node [shape =3D doublecircle, label=3D"Decoding"] Decoding;
> >> +
> >> +       node [shape =3D circle, label=3D"Initialization"] Initializati=
on;
> >> +       node [shape =3D circle, label=3D"Capture\nsetup"] CaptureSetup=
;
> >> +       node [shape =3D circle, label=3D"Dynamic\nresolution\nchange"]=
 ResChange;
> >> +       node [shape =3D circle, label=3D"Stopped"] Stopped;
> >> +       node [shape =3D circle, label=3D"Drain"] Drain;
> >> +       node [shape =3D circle, label=3D"Seek"] Seek;
> >> +       node [shape =3D circle, label=3D"End of stream"] EoS;
> >> +
> >> +       node [shape =3D point]; qi
> >> +       qi -> Initialization [ label =3D "open()" ];
> >> +
> >> +       Initialization -> CaptureSetup [ label =3D "CAPTURE\nformat\ne=
stablished" ];
> >> +
> >> +       CaptureSetup -> Stopped [ label =3D "CAPTURE\nbuffers\nready" =
];
> >> +
> >> +       Decoding -> ResChange [ label =3D "Stream\nresolution\nchange"=
 ];
> >> +       Decoding -> Drain [ label =3D "V4L2_DEC_CMD_STOP" ];
> >> +       Decoding -> EoS [ label =3D "EoS mark\nin the stream" ];
> >> +       Decoding -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> >> +       Decoding -> Stopped [ label =3D "VIDIOC_STREAMOFF(CAPTURE)" ];
> >> +       Decoding -> Decoding;
> >> +
> >> +       ResChange -> CaptureSetup [ label =3D "CAPTURE\nformat\nestabl=
ished" ];
> >> +       ResChange -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> >> +
> >> +       EoS -> Drain [ label =3D "Implicit\ndrain" ];
> >> +
> >> +       Drain -> Stopped [ label =3D "All CAPTURE\nbuffers dequeued\no=
r\nVIDIOC_STREAMOFF(CAPTURE)" ];
> >> +       Drain -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> >> +
> >> +       Seek -> Decoding [ label =3D "VIDIOC_STREAMON(OUTPUT)" ];
> >> +       Seek -> Initialization [ label =3D "VIDIOC_REQBUFS(OUTPUT, 0)"=
 ];
> >> +
> >> +       Stopped -> Decoding [ label =3D "V4L2_DEC_CMD_START\nor\nVIDIO=
C_STREAMON(CAPTURE)" ];
> >> +       Stopped -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> >> +   }
> >> +
> >> +Querying capabilities
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +1. To enumerate the set of coded formats supported by the decoder, th=
e
> >> +   client may call :c:func:`VIDIOC_ENUM_FMT` on ``OUTPUT``.
> >> +
> >> +   * The full set of supported formats will be returned, regardless o=
f the
> >> +     format set on ``CAPTURE``.
> >> +
> >> +2. To enumerate the set of supported raw formats, the client may call
> >> +   :c:func:`VIDIOC_ENUM_FMT` on ``CAPTURE``.
> >> +
> >> +   * Only the formats supported for the format currently active on ``=
OUTPUT``
> >> +     will be returned.
> >> +
> >> +   * In order to enumerate raw formats supported by a given coded for=
mat,
> >> +     the client must first set that coded format on ``OUTPUT`` and th=
en
> >> +     enumerate formats on ``CAPTURE``.
> >> +
> >> +3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect supp=
orted
> >> +   resolutions for a given format, passing desired pixel format in
> >> +   :c:type:`v4l2_frmsizeenum` ``pixel_format``.
> >> +
> >> +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a coded =
pixel
> >> +     format will include all possible coded resolutions supported by =
the
> >> +     decoder for given coded pixel format.
> >> +
> >> +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a raw pi=
xel format
> >> +     will include all possible frame buffer resolutions supported by =
the
> >> +     decoder for given raw pixel format and the coded format currentl=
y set on
> >> +     ``OUTPUT``.
> >> +
> >> +4. Supported profiles and levels for the coded format currently set o=
n
> >> +   ``OUTPUT``, if applicable, may be queried using their respective c=
ontrols
> >> +   via :c:func:`VIDIOC_QUERYCTRL`.
> >> +
> >> +Initialization
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +1. Set the coded format on ``OUTPUT`` via :c:func:`VIDIOC_S_FMT`
> >> +
> >> +   * **Required fields:**
> >> +
> >> +     ``type``
> >> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> >> +
> >> +     ``pixelformat``
> >> +         a coded pixel format.
> >> +
> >> +     ``width``, ``height``
> >> +         coded resolution of the stream; required only if it cannot b=
e parsed
> >> +         from the stream for the given coded format; otherwise the de=
coder will
> >> +         use this resolution as a placeholder resolution that will li=
kely change
> >> +         as soon as it can parse the actual coded resolution from the=
 stream.
> >> +
> >> +     ``sizeimage``
> >> +         desired size of ``OUTPUT`` buffers; the decoder may adjust i=
t to
> >> +         match hardware requirements.
> >> +
> >> +     other fields
> >> +         follow standard semantics.
> >> +
> >> +   * **Return fields:**
> >> +
> >> +     ``sizeimage``
> >> +         adjusted size of ``OUTPUT`` buffers.
> >> +
> >> +   * The ``CAPTURE`` format will be updated with an appropriate frame=
 buffer
> >> +     resolution instantly based on the width and height returned by
> >> +     :c:func:`VIDIOC_S_FMT`.
> >> +     However, for coded formats that include stream resolution inform=
ation,
> >> +     after the decoder is done parsing the information from the strea=
m, it will
> >> +     update the ``CAPTURE`` format with new values and signal a sourc=
e change
> >> +     event, regardless of whether they match the values set by the cl=
ient or
> >> +     not.
> >> +
> >> +   .. important::
> >> +
> >> +      Changing the ``OUTPUT`` format may change the currently set ``C=
APTURE``
> >> +      format. How the new ``CAPTURE`` format is determined is up to t=
he decoder
> >> +      and the client must ensure it matches its needs afterwards.
> >> +
> >> +2.  Allocate source (bitstream) buffers via :c:func:`VIDIOC_REQBUFS` =
on
> >> +    ``OUTPUT``.
> >> +
> >> +    * **Required fields:**
> >> +
> >> +      ``count``
> >> +          requested number of buffers to allocate; greater than zero.
> >> +
> >> +      ``type``
> >> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> >> +
> >> +      ``memory``
> >> +          follows standard semantics.
> >> +
> >> +    * **Return fields:**
> >> +
> >> +      ``count``
> >> +          the actual number of buffers allocated.
> >> +
> >> +    .. warning::
> >> +
> >> +       The actual number of allocated buffers may differ from the ``c=
ount``
> >> +       given. The client must check the updated value of ``count`` af=
ter the
> >> +       call returns.
> >> +
> >> +    Alternatively, :c:func:`VIDIOC_CREATE_BUFS` on the ``OUTPUT`` que=
ue can be
> >> +    used to have more control over buffer allocation.
> >> +
> >> +    * **Required fields:**
> >> +
> >> +      ``count``
> >> +          requested number of buffers to allocate; greater than zero.
> >> +
> >> +      ``type``
> >> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> >> +
> >> +      ``memory``
> >> +          follows standard semantics.
> >> +
> >> +      ``format``
> >> +          follows standard semantics.
> >> +
> >> +    * **Return fields:**
> >> +
> >> +      ``count``
> >> +          adjusted to the number of allocated buffers.
> >> +
> >> +    .. warning::
> >> +
> >> +       The actual number of allocated buffers may differ from the ``c=
ount``
> >> +       given. The client must check the updated value of ``count`` af=
ter the
> >> +       call returns.
> >> +
> >> +3.  Start streaming on the ``OUTPUT`` queue via :c:func:`VIDIOC_STREA=
MON`.
> >> +
> >> +4.  **This step only applies to coded formats that contain resolution=
 information
> >> +    in the stream.** Continue queuing/dequeuing bitstream buffers to/=
from the
> >> +    ``OUTPUT`` queue via :c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQ=
BUF`. The
> >> +    buffers will be processed and returned to the client in order, un=
til
> >> +    required metadata to configure the ``CAPTURE`` queue are found. T=
his is
> >> +    indicated by the decoder sending a ``V4L2_EVENT_SOURCE_CHANGE`` e=
vent with
> >> +    ``changes`` set to ``V4L2_EVENT_SRC_CH_RESOLUTION``.
> >> +
> >> +    * It is not an error if the first buffer does not contain enough =
data for
> >> +      this to occur. Processing of the buffers will continue as long =
as more
> >> +      data is needed.
> >> +
> >> +    * If data in a buffer that triggers the event is required to deco=
de the
> >> +      first frame, it will not be returned to the client, until the
> >> +      initialization sequence completes and the frame is decoded.
> >> +
> >> +    * If the client has not set the coded resolution of the stream on=
 its own,
> >> +      calling :c:func:`VIDIOC_G_FMT`, :c:func:`VIDIOC_S_FMT`,
> >> +      :c:func:`VIDIOC_TRY_FMT` or :c:func:`VIDIOC_REQBUFS` on the ``C=
APTURE``
> >> +      queue will not return the real values for the stream until a
> >> +      ``V4L2_EVENT_SOURCE_CHANGE`` event is signaled.
> >> +
> >> +    .. important::
> >> +
> >> +       Any client query issued after the decoder queues the event wil=
l return
> >> +       values applying to the just parsed stream, including queue for=
mats,
> >> +       selection rectangles and controls.
> >> +
> >> +    .. note::
> >> +
> >> +       A client capable of acquiring stream parameters from the bitst=
ream on
> >> +       its own may attempt to set the width and height of the ``OUTPU=
T`` format
> >> +       to non-zero values matching the coded size of the stream, skip=
 this step
> >> +       and continue with the `Capture setup` sequence. However, it mu=
st not
> >> +       rely on any driver queries regarding stream parameters, such a=
s
> >> +       selection rectangles and controls, since the decoder has not p=
arsed them
> >> +       from the stream yet. If the values configured by the client do=
 not match
> >> +       those parsed by the decoder, a `Dynamic resolution change` wil=
l be
> >> +       triggered to reconfigure them.
> >> +
> >> +    .. note::
> >> +
> >> +       No decoded frames are produced during this phase.
> >> +
> >> +5.  Continue with the `Capture setup` sequence.
> >> +
> >> +Capture setup
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +1.  Call :c:func:`VIDIOC_G_FMT` on the ``CAPTURE`` queue to get forma=
t for the
> >> +    destination buffers parsed/decoded from the bitstream.
> >> +
> >> +    * **Required fields:**
> >> +
> >> +      ``type``
> >> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> >> +
> >> +    * **Return fields:**
> >> +
> >> +      ``width``, ``height``
> >> +          frame buffer resolution for the decoded frames.
> >> +
> >> +      ``pixelformat``
> >> +          pixel format for decoded frames.
> >> +
> >> +      ``num_planes`` (for _MPLANE ``type`` only)
> >> +          number of planes for pixelformat.
> >> +
> >> +      ``sizeimage``, ``bytesperline``
> >> +          as per standard semantics; matching frame buffer format.
> >> +
> >> +    .. note::
> >> +
> >> +       The value of ``pixelformat`` may be any pixel format supported=
 by the
> >> +       decoder for the current stream. The decoder should choose a
> >> +       preferred/optimal format for the default configuration. For ex=
ample, a
> >> +       YUV format may be preferred over an RGB format if an additiona=
l
> >> +       conversion step would be required for the latter.
> >> +
> >> +2.  **Optional.** Acquire the visible resolution via
> >> +    :c:func:`VIDIOC_G_SELECTION`.
> >> +
> >> +    * **Required fields:**
> >> +
> >> +      ``type``
> >> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> >> +
> >> +      ``target``
> >> +          set to ``V4L2_SEL_TGT_COMPOSE``.
> >> +
> >> +    * **Return fields:**
> >> +
> >> +      ``r.left``, ``r.top``, ``r.width``, ``r.height``
> >> +          the visible rectangle; it must fit within the frame buffer =
resolution
> >> +          returned by :c:func:`VIDIOC_G_FMT` on ``CAPTURE``.
> >> +
> >> +    * The following selection targets are supported on ``CAPTURE``:
> >> +
> >> +      ``V4L2_SEL_TGT_CROP_BOUNDS``
> >> +          corresponds to the coded resolution of the stream.
> >> +
> >> +      ``V4L2_SEL_TGT_CROP_DEFAULT``
> >> +          the rectangle covering the part of the ``CAPTURE`` buffer t=
hat
> >> +          contains meaningful picture data (visible area); width and =
height
> >> +          will be equal to the visible resolution of the stream.
> >> +
> >> +      ``V4L2_SEL_TGT_CROP``
> >> +          the rectangle within the coded resolution to be output to
> >> +          ``CAPTURE``; defaults to ``V4L2_SEL_TGT_CROP_DEFAULT``; rea=
d-only on
> >> +          hardware without additional compose/scaling capabilities.
> >> +
> >> +      ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
> >> +          the maximum rectangle within a ``CAPTURE`` buffer, which th=
e cropped
> >> +          frame can be composed into; equal to ``V4L2_SEL_TGT_CROP`` =
if the
> >> +          hardware does not support compose/scaling.
> >> +
> >> +      ``V4L2_SEL_TGT_COMPOSE_DEFAULT``
> >> +          equal to ``V4L2_SEL_TGT_CROP``.
> >> +
> >> +      ``V4L2_SEL_TGT_COMPOSE``
> >> +          the rectangle inside a ``CAPTURE`` buffer into which the cr=
opped
> >> +          frame is written; defaults to ``V4L2_SEL_TGT_COMPOSE_DEFAUL=
T``;
> >> +          read-only on hardware without additional compose/scaling ca=
pabilities.
> >> +
> >> +      ``V4L2_SEL_TGT_COMPOSE_PADDED``
> >> +          the rectangle inside a ``CAPTURE`` buffer which is overwrit=
ten by the
> >> +          hardware; equal to ``V4L2_SEL_TGT_COMPOSE`` if the hardware=
 does not
> >> +          write padding pixels.
> >> +
> >> +    .. warning::
> >> +
> >> +       The values are guaranteed to be meaningful only after the deco=
der
> >> +       successfully parses the stream metadata. The client must not r=
ely on the
> >> +       query before that happens.
> >> +
> >> +3.  **Optional.** Enumerate ``CAPTURE`` formats via :c:func:`VIDIOC_E=
NUM_FMT` on
> >> +    the ``CAPTURE`` queue. Once the stream information is parsed and =
known, the
> >> +    client may use this ioctl to discover which raw formats are suppo=
rted for
> >> +    given stream and select one of them via :c:func:`VIDIOC_S_FMT`.
> >> +
> >> +    .. important::
> >> +
> >> +       The decoder will return only formats supported for the current=
ly
> >> +       established coded format, as per the ``OUTPUT`` format and/or =
stream
> >> +       metadata parsed in this initialization sequence, even if more =
formats
> >> +       may be supported by the decoder in general. In other words, th=
e set
> >> +       returned will be a subset of the initial query mentioned in th=
e
> >> +       `Querying capabilities` section.
> >> +
> >> +       For example, a decoder may support YUV and RGB formats for res=
olutions
> >> +       1920x1088 and lower, but only YUV for higher resolutions (due =
to
> >> +       hardware limitations). After parsing a resolution of 1920x1088=
 or lower,
> >> +       :c:func:`VIDIOC_ENUM_FMT` may return a set of YUV and RGB pixe=
l formats,
> >> +       but after parsing resolution higher than 1920x1088, the decode=
r will not
> >> +       return RGB, unsupported for this resolution.
> >> +
> >> +       However, subsequent resolution change event triggered after
> >> +       discovering a resolution change within the same stream may swi=
tch
> >> +       the stream into a lower resolution and :c:func:`VIDIOC_ENUM_FM=
T`
> >> +       would return RGB formats again in that case.
> >> +
> >> +4.  **Optional.** Set the ``CAPTURE`` format via :c:func:`VIDIOC_S_FM=
T` on the
> >> +    ``CAPTURE`` queue. The client may choose a different format than
> >> +    selected/suggested by the decoder in :c:func:`VIDIOC_G_FMT`.
> >> +
> >> +    * **Required fields:**
> >> +
> >> +      ``type``
> >> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> >> +
> >> +      ``pixelformat``
> >> +          a raw pixel format.
> >> +
> >> +   * Setting the ``CAPTURE`` format will reset the compose selection =
rectangles
> >> +     to their default values, based on the new resolution, as describ=
ed in the
> >> +     previous step.
> >> +
> >> +5. **Optional.** Set the compose rectangle via :c:func:`VIDIOC_S_SELE=
CTION` on
> >> +   the ``CAPTURE`` queue if it is desired and if the decoder has comp=
ose and/or
> >> +   scaling capabilities.
> >> +
> >> +   * **Required fields:**
> >> +
> >> +     ``type``
> >> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> >> +
> >> +     ``target``
> >> +         set to ``V4L2_SEL_TGT_COMPOSE``.
> >> +
> >> +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> >> +         the rectangle inside a ``CAPTURE`` buffer into which the cro=
pped
> >> +         frame is written; defaults to ``V4L2_SEL_TGT_COMPOSE_DEFAULT=
``;
> >> +         read-only on hardware without additional compose/scaling cap=
abilities.
> >> +
> >> +   * **Return fields:**
> >> +
> >> +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> >> +         the visible rectangle; it must fit within the frame buffer r=
esolution
> >> +         returned by :c:func:`VIDIOC_G_FMT` on ``CAPTURE``.
> >> +
> >> +   .. warning::
> >> +
> >> +      The decoder may adjust the compose rectangle to the nearest
> >> +      supported one to meet codec and hardware requirements. The clie=
nt needs
> >> +      to check the adjusted rectangle returned by :c:func:`VIDIOC_S_S=
ELECTION`.
> >> +
> >> +6.  If all the following conditions are met, the client may resume th=
e decoding
> >> +    instantly:
> >> +
> >> +    * ``sizeimage`` of the new format (determined in previous steps) =
is less
> >> +      than or equal to the size of currently allocated buffers,
> >> +
> >> +    * the number of buffers currently allocated is greater than or eq=
ual to the
> >> +      minimum number of buffers acquired in previous steps. To fulfil=
l this
> >> +      requirement, the client may use :c:func:`VIDIOC_CREATE_BUFS` to=
 add new
> >> +      buffers.
> >> +
> >> +    In that case, the remaining steps do not apply and the client may=
 resume
> >> +    the decoding by one of the following actions:
> >> +
> >> +    * if the ``CAPTURE`` queue is streaming, call :c:func:`VIDIOC_DEC=
ODER_CMD`
> >> +      with the ``V4L2_DEC_CMD_START`` command,
> >> +
> >> +    * if the ``CAPTURE`` queue is not streaming, call :c:func:`VIDIOC=
_STREAMON`
> >> +      on the ``CAPTURE`` queue.
> >> +
> >> +    However, if the client intends to change the buffer set, to lower
> >> +    memory usage or for any other reasons, it may be achieved by foll=
owing
> >> +    the steps below.
> >> +
> >> +7.  **If the** ``CAPTURE`` **queue is streaming,** keep queuing and d=
equeuing
> >> +    buffers on the ``CAPTURE`` queue until a buffer marked with the
> >> +    ``V4L2_BUF_FLAG_LAST`` flag is dequeued.
> >> +
> >> +8.  **If the** ``CAPTURE`` **queue is streaming,** call :c:func:`VIDI=
OC_STREAMOFF`
> >> +    on the ``CAPTURE`` queue to stop streaming.
> >> +
> >> +    .. warning::
> >> +
> >> +       The ``OUTPUT`` queue must remain streaming. Calling
> >> +       :c:func:`VIDIOC_STREAMOFF` on it would abort the sequence and =
trigger a
> >> +       seek.
> >> +
> >> +9.  **If the** ``CAPTURE`` **queue has buffers allocated,** free the =
``CAPTURE``
> >> +    buffers using :c:func:`VIDIOC_REQBUFS`.
> >> +
> >> +    * **Required fields:**
> >> +
> >> +      ``count``
> >> +          set to 0.
> >> +
> >> +      ``type``
> >> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> >> +
> >> +      ``memory``
> >> +          follows standard semantics.
> >> +
> >> +10. Allocate ``CAPTURE`` buffers via :c:func:`VIDIOC_REQBUFS` on the
> >> +    ``CAPTURE`` queue.
> >> +
> >> +    * **Required fields:**
> >> +
> >> +      ``count``
> >> +          requested number of buffers to allocate; greater than zero.
> >> +
> >> +      ``type``
> >> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> >> +
> >> +      ``memory``
> >> +          follows standard semantics.
> >> +
> >> +    * **Return fields:**
> >> +
> >> +      ``count``
> >> +          actual number of buffers allocated.
> >> +
> >> +    .. warning::
> >> +
> >> +       The actual number of allocated buffers may differ from the ``c=
ount``
> >> +       given. The client must check the updated value of ``count`` af=
ter the
> >> +       call returns.
> >> +
> >> +    .. note::
> >> +
> >> +       To allocate more than the minimum number of buffers (for pipel=
ine
> >> +       depth), the client may query the ``V4L2_CID_MIN_BUFFERS_FOR_CA=
PTURE``
> >> +       control to get the minimum number of buffers required, and pas=
s the
> >> +       obtained value plus the number of additional buffers needed in=
 the
> >> +       ``count`` field to :c:func:`VIDIOC_REQBUFS`.
> >> +
> >> +    Alternatively, :c:func:`VIDIOC_CREATE_BUFS` on the ``CAPTURE`` qu=
eue can be
> >> +    used to have more control over buffer allocation. For example, by
> >> +    allocating buffers larger than the current ``CAPTURE`` format, fu=
ture
> >> +    resolution changes can be accommodated.
> >> +
> >> +    * **Required fields:**
> >> +
> >> +      ``count``
> >> +          requested number of buffers to allocate; greater than zero.
> >> +
> >> +      ``type``
> >> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> >> +
> >> +      ``memory``
> >> +          follows standard semantics.
> >> +
> >> +      ``format``
> >> +          a format representing the maximum framebuffer resolution to=
 be
> >> +          accommodated by newly allocated buffers.
> >> +
> >> +    * **Return fields:**
> >> +
> >> +      ``count``
> >> +          adjusted to the number of allocated buffers.
> >> +
> >> +    .. warning::
> >> +
> >> +        The actual number of allocated buffers may differ from the ``=
count``
> >> +        given. The client must check the updated value of ``count`` a=
fter the
> >> +        call returns.
> >> +
> >> +    .. note::
> >> +
> >> +       To allocate buffers for a format different than parsed from th=
e stream
> >> +       metadata, the client must proceed as follows, before the metad=
ata
> >> +       parsing is initiated:
> >> +
> >> +       * set width and height of the ``OUTPUT`` format to desired cod=
ed resolution to
> >> +         let the decoder configure the ``CAPTURE`` format appropriate=
ly,
> >> +
> >> +       * query the ``CAPTURE`` format using :c:func:`VIDIOC_G_FMT` an=
d save it
> >> +         until this step.
> >> +
> >> +       The format obtained in the query may be then used with
> >> +       :c:func:`VIDIOC_CREATE_BUFS` in this step to allocate the buff=
ers.
> >> +
> >> +11. Call :c:func:`VIDIOC_STREAMON` on the ``CAPTURE`` queue to start =
decoding
> >> +    frames.
> >> +
> >> +Decoding
> >> +=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +This state is reached after the `Capture setup` sequence finishes suc=
cessfully.
> >> +In this state, the client queues and dequeues buffers to both queues =
via
> >> +:c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQBUF`, following the stand=
ard
> >> +semantics.
> >> +
> >> +The content of the source ``OUTPUT`` buffers depends on the active co=
ded pixel
> >> +format and may be affected by codec-specific extended controls, as st=
ated in
> >> +the documentation of each format.
> >> +
> >> +Both queues operate independently, following the standard behavior of=
 V4L2
> >> +buffer queues and memory-to-memory devices. In addition, the order of=
 decoded
> >> +frames dequeued from the ``CAPTURE`` queue may differ from the order =
of queuing
> >> +coded frames to the ``OUTPUT`` queue, due to properties of the select=
ed coded
> >> +format, e.g. frame reordering.
> >> +
> >> +The client must not assume any direct relationship between ``CAPTURE`=
`
> >> +and ``OUTPUT`` buffers and any specific timing of buffers becoming
> >> +available to dequeue. Specifically:
> >> +
> >> +* a buffer queued to ``OUTPUT`` may result in no buffers being produc=
ed
> >> +  on ``CAPTURE`` (e.g. if it does not contain encoded data, or if onl=
y
> >> +  metadata syntax structures are present in it),
> >> +
> >> +* a buffer queued to ``OUTPUT`` may result in more than one buffer pr=
oduced
> >> +  on ``CAPTURE`` (if the encoded data contained more than one frame, =
or if
> >> +  returning a decoded frame allowed the decoder to return a frame tha=
t
> >> +  preceded it in decode, but succeeded it in the display order),
> >> +
> >> +* a buffer queued to ``OUTPUT`` may result in a buffer being produced=
 on
> >> +  ``CAPTURE`` later into decode process, and/or after processing furt=
her
> >> +  ``OUTPUT`` buffers, or be returned out of order, e.g. if display
> >> +  reordering is used,
> >> +
> >> +* buffers may become available on the ``CAPTURE`` queue without addit=
ional
> >> +  buffers queued to ``OUTPUT`` (e.g. during drain or ``EOS``), becaus=
e of the
> >> +  ``OUTPUT`` buffers queued in the past whose decoding results are on=
ly
> >> +  available at later time, due to specifics of the decoding process.
> >> +
> >> +.. note::
> >> +
> >> +   To allow matching decoded ``CAPTURE`` buffers with ``OUTPUT`` buff=
ers they
> >> +   originated from, the client can set the ``timestamp`` field of the
> >> +   :c:type:`v4l2_buffer` struct when queuing an ``OUTPUT`` buffer. Th=
e
> >> +   ``CAPTURE`` buffer(s), which resulted from decoding that ``OUTPUT`=
` buffer
> >> +   will have their ``timestamp`` field set to the same value when deq=
ueued.
> >> +
> >> +   In addition to the straightforward case of one ``OUTPUT`` buffer p=
roducing
> >> +   one ``CAPTURE`` buffer, the following cases are defined:
> >> +
> >> +   * one ``OUTPUT`` buffer generates multiple ``CAPTURE`` buffers: th=
e same
> >> +     ``OUTPUT`` timestamp will be copied to multiple ``CAPTURE`` buff=
ers.
> >> +
> >> +   * multiple ``OUTPUT`` buffers generate one ``CAPTURE`` buffer: tim=
estamp of
> >> +     the ``OUTPUT`` buffer queued last will be copied.
> >> +
> >> +   * the decoding order differs from the display order (i.e. the ``CA=
PTURE``
> >> +     buffers are out-of-order compared to the ``OUTPUT`` buffers): ``=
CAPTURE``
> >> +     timestamps will not retain the order of ``OUTPUT`` timestamps.
> >> +
> >> +During the decoding, the decoder may initiate one of the special sequ=
ences, as
> >> +listed below. The sequences will result in the decoder returning all =
the
> >> +``CAPTURE`` buffers that originated from all the ``OUTPUT`` buffers p=
rocessed
> >> +before the sequence started. Last of the buffers will have the
> >> +``V4L2_BUF_FLAG_LAST`` flag set. To determine the sequence to follow,=
 the client
> >> +must check if there is any pending event and:
> >> +
> >> +* if a ``V4L2_EVENT_SOURCE_CHANGE`` event is pending, the `Dynamic re=
solution
> >> +  change` sequence needs to be followed,
> >> +
> >> +* if a ``V4L2_EVENT_EOS`` event is pending, the `End of stream` seque=
nce needs
> >> +  to be followed.
> >> +
> >> +Some of the sequences can be intermixed with each other and need to b=
e handled
> >> +as they happen. The exact operation is documented for each sequence.
> >> +
> >> +Should a decoding error occur, it will be reported to the client with=
 the level
> >> +of details depending on the decoder capabilities. Specifically:
> >> +
> >> +* the CAPTURE buffer that contains the results of the failed decode o=
peration
> >> +  will be returned with the V4L2_BUF_FLAG_ERROR flag set,
> >> +
> >> +* if the decoder is able to precisely report the OUTPUT buffer that t=
riggered
> >> +  the error, such buffer will be returned with the V4L2_BUF_FLAG_ERRO=
R flag
> >> +  set.
> >> +
> >> +In case of a fatal failure that does not allow the decoding to contin=
ue, any
> >> +further operations on corresponding decoder file handle will return t=
he -EIO
> >> +error code. The client may close the file handle and open a new one, =
or
> >> +alternatively reinitialize the instance by stopping streaming on both=
 queues,
> >> +releasing all buffers and performing the Initialization sequence agai=
n.
> >> +
> >> +Seek
> >> +=3D=3D=3D=3D
> >> +
> >> +Seek is controlled by the ``OUTPUT`` queue, as it is the source of co=
ded data.
> >> +The seek does not require any specific operation on the ``CAPTURE`` q=
ueue, but
> >> +it may be affected as per normal decoder operation.
> >> +
> >> +1. Stop the ``OUTPUT`` queue to begin the seek sequence via
> >> +   :c:func:`VIDIOC_STREAMOFF`.
> >> +
> >> +   * **Required fields:**
> >> +
> >> +     ``type``
> >> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> >> +
> >> +   * The decoder will drop all the pending ``OUTPUT`` buffers and the=
y must be
> >> +     treated as returned to the client (following standard semantics)=
.
> >> +
> >> +2. Restart the ``OUTPUT`` queue via :c:func:`VIDIOC_STREAMON`
> >> +
> >> +   * **Required fields:**
> >> +
> >> +     ``type``
> >> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> >> +
> >> +   * The decoder will start accepting new source bitstream buffers af=
ter the
> >> +     call returns.
> >> +
> >> +3. Start queuing buffers containing coded data after the seek to the =
``OUTPUT``
> >> +   queue until a suitable resume point is found.
> >> +
> >> +   .. note::
> >> +
> >> +      There is no requirement to begin queuing coded data starting ex=
actly
> >> +      from a resume point (e.g. SPS or a keyframe). Any queued ``OUTP=
UT``
> >> +      buffers will be processed and returned to the client until a su=
itable
> >> +      resume point is found.  While looking for a resume point, the d=
ecoder
> >> +      should not produce any decoded frames into ``CAPTURE`` buffers.
> >> +
> >> +      Some hardware is known to mishandle seeks to a non-resume point=
. Such an
> >> +      operation may result in an unspecified number of corrupted deco=
ded frames
> >> +      being made available on the ``CAPTURE`` queue. Drivers must ens=
ure that
> >> +      no fatal decoding errors or crashes occur, and implement any ne=
cessary
> >> +      handling and workarounds for hardware issues related to seek op=
erations.
> >> +
> >> +   .. warning::
> >> +
> >> +      In case of the H.264/HEVC codec, the client must take care not =
to seek
> >> +      over a change of SPS/PPS. Even though the target frame could be=
 a
> >> +      keyframe, the stale SPS/PPS inside decoder state would lead to =
undefined
> >> +      results when decoding. Although the decoder must handle that ca=
se without
> >> +      a crash or a fatal decode error, the client must not expect a s=
ensible
> >> +      decode output.
> >> +
> >> +      If the hardware can detect such corrupted decoded frames, then
> >> +      corresponding buffers will be returned to the client with the
> >> +      V4L2_BUF_FLAG_ERROR set. See the `Decoding` section for further
> >> +      description of decode error reporting.
> >> +
> >> +4. After a resume point is found, the decoder will start returning ``=
CAPTURE``
> >> +   buffers containing decoded frames.
> >> +
> >> +.. important::
> >> +
> >> +   A seek may result in the `Dynamic resolution change` sequence bein=
g
> >> +   initiated, due to the seek target having decoding parameters diffe=
rent from
> >> +   the part of the stream decoded before the seek. The sequence must =
be handled
> >> +   as per normal decoder operation.
> >> +
> >> +.. warning::
> >> +
> >> +   It is not specified when the ``CAPTURE`` queue starts producing bu=
ffers
> >> +   containing decoded data from the ``OUTPUT`` buffers queued after t=
he seek,
> >> +   as it operates independently from the ``OUTPUT`` queue.
> >> +
> >> +   The decoder may return a number of remaining ``CAPTURE`` buffers c=
ontaining
> >> +   decoded frames originating from the ``OUTPUT`` buffers queued befo=
re the
> >> +   seek sequence is performed.
> >> +
> >> +   The ``VIDIOC_STREAMOFF`` operation discards any remaining queued
> >> +   ``OUTPUT`` buffers, which means that not all of the ``OUTPUT`` buf=
fers
> >> +   queued before the seek sequence may have matching ``CAPTURE`` buff=
ers
> >> +   produced.  For example, given the sequence of operations on the
> >> +   ``OUTPUT`` queue:
> >> +
> >> +     QBUF(A), QBUF(B), STREAMOFF(), STREAMON(), QBUF(G), QBUF(H),
> >> +
> >> +   any of the following results on the ``CAPTURE`` queue is allowed:
> >> +
> >> +     {A=E2=80=99, B=E2=80=99, G=E2=80=99, H=E2=80=99}, {A=E2=80=99, G=
=E2=80=99, H=E2=80=99}, {G=E2=80=99, H=E2=80=99}.
> >> +
> >> +   To determine the CAPTURE buffer containing the first decoded frame=
 after the
> >> +   seek, the client may observe the timestamps to match the CAPTURE a=
nd OUTPUT
> >> +   buffers or use V4L2_DEC_CMD_STOP and V4L2_DEC_CMD_START to drain t=
he
> >> +   decoder.
> >> +
> >> +.. note::
> >> +
> >> +   To achieve instantaneous seek, the client may restart streaming on=
 the
> >> +   ``CAPTURE`` queue too to discard decoded, but not yet dequeued buf=
fers.
> >> +
> >> +Dynamic resolution change
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >> +
> >> +Streams that include resolution metadata in the bitstream may require=
 switching
> >> +to a different resolution during the decoding.
> >> +
> >> +The sequence starts when the decoder detects a coded frame with one o=
r more of
> >> +the following parameters different from those previously established =
(and
> >> +reflected by corresponding queries):
> >> +
> >> +* coded resolution (``OUTPUT`` width and height),
> >> +
> >> +* visible resolution (selection rectangles),
> >> +
> >> +* the minimum number of buffers needed for decoding.
> >> +
> >> +Whenever that happens, the decoder must proceed as follows:
> >> +
> >> +1.  After encountering a resolution change in the stream, the decoder=
 sends a
> >> +    ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
> >> +    ``V4L2_EVENT_SRC_CH_RESOLUTION``.
> >
> > What about a format changes that does now affect the resolution, like a
> > pixel format change ? Also, what about changes that don't require a
>
> A pixel format change always implies a resolution change.
>
> > reallocation ? Like a change in the colorimetry parameters ? I don't
> > think the spec need to initially cover it all, but we need to make sure
> > there is a mechanism for userspace to know at which frames to read back
> > the new format (G_FMT). Maybe we need both an event and a buffer flag
> > to mark it ?
>
> After a SOURCE_CHANGE event is received, G_FMT returns the *new* format,
> including colorimetry. This will become the active format once the drain
> operation finished.
>
> If that's not clear from the spec, then I need to improve it.
>
> Regards,
>
>         Hans
>
> >
> >> +
> >> +    .. important::
> >> +
> >> +       Any client query issued after the decoder queues the event wil=
l return
> >> +       values applying to the stream after the resolution change, inc=
luding
> >> +       queue formats, selection rectangles and controls.
> >> +
> >> +2.  The decoder will then process and decode all remaining buffers fr=
om before
> >> +    the resolution change point.
> >> +
> >> +    * The last buffer from before the change must be marked with the
> >> +      ``V4L2_BUF_FLAG_LAST`` flag, similarly to the `Drain` sequence =
above.
> >> +
> >> +    .. warning::
> >> +
> >> +       The last buffer may be empty (with :c:type:`v4l2_buffer` ``byt=
esused``
> >> +       =3D 0) and in that case it must be ignored by the client, as i=
t does not
> >> +       contain a decoded frame.
> >> +
> >> +    .. note::
> >> +
> >> +       Any attempt to dequeue more ``CAPTURE`` buffers beyond the buf=
fer marked
> >> +       with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE error from
> >> +       :c:func:`VIDIOC_DQBUF`.
> >> +
> >> +The client must continue the sequence as described below to continue =
the
> >> +decoding process.
> >> +
> >> +1.  Dequeue the source change event.
> >> +
> >> +    .. important::
> >> +
> >> +       A source change triggers an implicit decoder drain, similar to=
 the
> >> +       explicit `Drain` sequence. The decoder is stopped after it com=
pletes.
> >> +       The decoding process must be resumed with either a pair of cal=
ls to
> >> +       :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on th=
e
> >> +       ``CAPTURE`` queue, or a call to :c:func:`VIDIOC_DECODER_CMD` w=
ith the
> >> +       ``V4L2_DEC_CMD_START`` command.
> >> +
> >> +2.  Continue with the `Capture setup` sequence.
> >> +
> >> +.. note::
> >> +
> >> +   During the resolution change sequence, the ``OUTPUT`` queue must r=
emain
> >> +   streaming. Calling :c:func:`VIDIOC_STREAMOFF` on the ``OUTPUT`` qu=
eue would
> >> +   abort the sequence and initiate a seek.
> >> +
> >> +   In principle, the ``OUTPUT`` queue operates separately from the ``=
CAPTURE``
> >> +   queue and this remains true for the duration of the entire resolut=
ion change
> >> +   sequence as well.
> >> +
> >> +   The client should, for best performance and simplicity, keep queui=
ng/dequeuing
> >> +   buffers to/from the ``OUTPUT`` queue even while processing this se=
quence.
> >> +
> >> +Drain
> >> +=3D=3D=3D=3D=3D
> >> +
> >> +To ensure that all queued ``OUTPUT`` buffers have been processed and =
related
> >> +``CAPTURE`` buffers are given to the client, the client must follow t=
he drain
> >> +sequence described below. After the drain sequence ends, the client h=
as
> >> +received all decoded frames for all ``OUTPUT`` buffers queued before =
the
> >> +sequence was started.
> >> +
> >> +1. Begin drain by issuing :c:func:`VIDIOC_DECODER_CMD`.
> >> +
> >> +   * **Required fields:**
> >> +
> >> +     ``cmd``
> >> +         set to ``V4L2_DEC_CMD_STOP``.
> >> +
> >> +     ``flags``
> >> +         set to 0.
> >> +
> >> +     ``pts``
> >> +         set to 0.
> >> +
> >> +   .. warning::
> >> +
> >> +      The sequence can be only initiated if both ``OUTPUT`` and ``CAP=
TURE``
> >> +      queues are streaming. For compatibility reasons, the call to
> >> +      :c:func:`VIDIOC_DECODER_CMD` will not fail even if any of the q=
ueues is
> >> +      not streaming, but at the same time it will not initiate the `D=
rain`
> >> +      sequence and so the steps described below would not be applicab=
le.
> >> +
> >> +2. Any ``OUTPUT`` buffers queued by the client before the
> >> +   :c:func:`VIDIOC_DECODER_CMD` was issued will be processed and deco=
ded as
> >> +   normal. The client must continue to handle both queues independent=
ly,
> >> +   similarly to normal decode operation. This includes:
> >> +
> >> +   * handling any operations triggered as a result of processing thos=
e buffers,
> >> +     such as the `Dynamic resolution change` sequence, before continu=
ing with
> >> +     the drain sequence,
> >> +
> >> +   * queuing and dequeuing ``CAPTURE`` buffers, until a buffer marked=
 with the
> >> +     ``V4L2_BUF_FLAG_LAST`` flag is dequeued,
> >> +
> >> +     .. warning::
> >> +
> >> +        The last buffer may be empty (with :c:type:`v4l2_buffer`
> >> +        ``bytesused`` =3D 0) and in that case it must be ignored by t=
he client,
> >> +        as it does not contain a decoded frame.
> >> +
> >> +     .. note::
> >> +
> >> +        Any attempt to dequeue more ``CAPTURE`` buffers beyond the bu=
ffer
> >> +        marked with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE er=
ror from
> >> +        :c:func:`VIDIOC_DQBUF`.
> >> +
> >> +   * dequeuing processed ``OUTPUT`` buffers, until all the buffers qu=
eued
> >> +     before the ``V4L2_DEC_CMD_STOP`` command are dequeued,
> >> +
> >> +   * dequeuing the ``V4L2_EVENT_EOS`` event, if the client subscribed=
 to it.
> >> +
> >> +   .. note::
> >> +
> >> +      For backwards compatibility, the decoder will signal a ``V4L2_E=
VENT_EOS``
> >> +      event when the last frame has been decoded and all frames are r=
eady to be
> >> +      dequeued. It is a deprecated behavior and the client must not r=
ely on it.
> >> +      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.
> >> +
> >> +3. Once all the ``OUTPUT`` buffers queued before the ``V4L2_DEC_CMD_S=
TOP`` call
> >> +   are dequeued and the last ``CAPTURE`` buffer is dequeued, the deco=
der is
> >> +   stopped and it will accept, but not process, any newly queued ``OU=
TPUT``
> >> +   buffers until the client issues any of the following operations:
> >> +
> >> +   * ``V4L2_DEC_CMD_START`` - the decoder will not be reset and will =
resume
> >> +     operation normally, with all the state from before the drain,
> >> +
> >> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMO=
N` on the
> >> +     ``CAPTURE`` queue - the decoder will resume the operation normal=
ly,
> >> +     however any ``CAPTURE`` buffers still in the queue will be retur=
ned to the
> >> +     client,
> >> +
> >> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMO=
N` on the
> >> +     ``OUTPUT`` queue - any pending source buffers will be returned t=
o the
> >> +     client and the `Seek` sequence will be triggered.
> >> +
> >> +.. note::
> >> +
> >> +   Once the drain sequence is initiated, the client needs to drive it=
 to
> >> +   completion, as described by the steps above, unless it aborts the =
process by
> >> +   issuing :c:func:`VIDIOC_STREAMOFF` on any of the ``OUTPUT`` or ``C=
APTURE``
> >> +   queues.  The client is not allowed to issue ``V4L2_DEC_CMD_START``=
 or
> >> +   ``V4L2_DEC_CMD_STOP`` again while the drain sequence is in progres=
s and they
> >> +   will fail with -EBUSY error code if attempted.
> >> +
> >> +   Although mandatory, the availability of decoder commands may be qu=
eried
> >> +   using :c:func:`VIDIOC_TRY_DECODER_CMD`.
> >> +
> >> +End of stream
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +If the decoder encounters an end of stream marking in the stream, the=
 decoder
> >> +will initiate the `Drain` sequence, which the client must handle as d=
escribed
> >> +above, skipping the initial :c:func:`VIDIOC_DECODER_CMD`.
> >> +
> >> +Commit points
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +Setting formats and allocating buffers trigger changes in the behavio=
r of the
> >> +decoder.
> >> +
> >> +1. Setting the format on the ``OUTPUT`` queue may change the set of f=
ormats
> >> +   supported/advertised on the ``CAPTURE`` queue. In particular, it a=
lso means
> >> +   that the ``CAPTURE`` format may be reset and the client must not r=
ely on the
> >> +   previously set format being preserved.
> >> +
> >> +2. Enumerating formats on the ``CAPTURE`` queue always returns only f=
ormats
> >> +   supported for the current ``OUTPUT`` format.
> >> +
> >> +3. Setting the format on the ``CAPTURE`` queue does not change the li=
st of
> >> +   formats available on the ``OUTPUT`` queue. An attempt to set a ``C=
APTURE``
> >> +   format that is not supported for the currently selected ``OUTPUT``=
 format
> >> +   will result in the decoder adjusting the requested ``CAPTURE`` for=
mat to a
> >> +   supported one.
> >> +
> >> +4. Enumerating formats on the ``OUTPUT`` queue always returns the ful=
l set of
> >> +   supported coded formats, irrespectively of the current ``CAPTURE``=
 format.
> >> +
> >> +5. While buffers are allocated on any of the ``OUTPUT`` or ``CAPTURE`=
` queues,
> >> +   the client must not change the format on the ``OUTPUT`` queue. Dri=
vers will
> >> +   return the -EBUSY error code for any such format change attempt.
> >> +
> >> +To summarize, setting formats and allocation must always start with t=
he
> >> +``OUTPUT`` queue and the ``OUTPUT`` queue is the master that governs =
the
> >> +set of supported formats for the ``CAPTURE`` queue.
> >> diff --git a/Documentation/media/uapi/v4l/dev-mem2mem.rst b/Documentat=
ion/media/uapi/v4l/dev-mem2mem.rst
> >> index 67a980818dc8..caa05f5f6380 100644
> >> --- a/Documentation/media/uapi/v4l/dev-mem2mem.rst
> >> +++ b/Documentation/media/uapi/v4l/dev-mem2mem.rst
> >> @@ -39,4 +39,10 @@ file handle is visible through another file handle)=
.
> >>  One of the most common memory-to-memory device is the codec. Codecs
> >>  are more complicated than most and require additional setup for
> >>  their codec parameters. This is done through codec controls.
> >> -See :ref:`mpeg-controls`.
> >> +See :ref:`mpeg-controls`. More details on how to use codec memory-to-=
memory
> >> +devices are given in the following sections.
> >> +
> >> +.. toctree::
> >> +    :maxdepth: 1
> >> +
> >> +    dev-decoder
> >> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentat=
ion/media/uapi/v4l/pixfmt-v4l2.rst
> >> index 71eebfc6d853..caf14e440447 100644
> >> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> >> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> >> @@ -39,6 +39,11 @@ Single-planar format structure
> >>      to a multiple of the scale factor of any smaller planes. For
> >>      example when the image format is YUV 4:2:0, ``width`` and
> >>      ``height`` must be multiples of two.
> >> +
> >> +    For compressed formats that contain the resolution information en=
coded
> >> +    inside the stream, when fed to a stateful mem2mem decoder, the fi=
elds
> >> +    may be zero to rely on the decoder to detect the right values. Fo=
r more
> >> +    details see :ref:`decoder` and format descriptions.
> >>      * - __u32
> >>        - ``pixelformat``
> >>        - The pixel format or type of compression, set by the applicati=
on.
> >> diff --git a/Documentation/media/uapi/v4l/v4l2.rst b/Documentation/med=
ia/uapi/v4l/v4l2.rst
> >> index 004ec00db6bd..97015b9b40b8 100644
> >> --- a/Documentation/media/uapi/v4l/v4l2.rst
> >> +++ b/Documentation/media/uapi/v4l/v4l2.rst
> >> @@ -60,6 +60,10 @@ Authors, in alphabetical order:
> >>
> >>    - Original author of the V4L2 API and documentation.
> >>
> >> +- Figa, Tomasz <tfiga@chromium.org>
> >> +
> >> +  - Documented the memory-to-memory decoder interface.
> >> +
> >>  - H Schimek, Michael <mschimek@gmx.at>
> >>
> >>    - Original author of the V4L2 API and documentation.
> >> @@ -68,6 +72,10 @@ Authors, in alphabetical order:
> >>
> >>    - Documented the Digital Video timings API.
> >>
> >> +- Osciak, Pawel <posciak@chromium.org>
> >> +
> >> +  - Documented the memory-to-memory decoder interface.
> >> +
> >>  - Osciak, Pawel <pawel@osciak.com>
> >>
> >>    - Designed and documented the multi-planar API.
> >> @@ -92,7 +100,7 @@ Authors, in alphabetical order:
> >>
> >>    - Designed and documented the VIDIOC_LOG_STATUS ioctl, the extended=
 control ioctls, major parts of the sliced VBI API, the MPEG encoder and de=
coder APIs and the DV Timings API.
> >>
> >> -**Copyright** |copy| 1999-2016: Bill Dirks, Michael H. Schimek, Hans =
Verkuil, Martin Rubli, Andy Walls, Muralidharan Karicheri, Mauro Carvalho C=
hehab, Pawel Osciak, Sakari Ailus & Antti Palosaari.
> >> +**Copyright** |copy| 1999-2018: Bill Dirks, Michael H. Schimek, Hans =
Verkuil, Martin Rubli, Andy Walls, Muralidharan Karicheri, Mauro Carvalho C=
hehab, Pawel Osciak, Sakari Ailus & Antti Palosaari, Tomasz Figa
> >>
> >>  Except when explicitly stated as GPL, programming examples within thi=
s
> >>  part can be used and distributed without restrictions.
> >> diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Doc=
umentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> >> index ccf83b05afa7..57f0066f4cff 100644
> >> --- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> >> +++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> >> @@ -56,14 +56,16 @@ The ``cmd`` field must contain the command code. S=
ome commands use the
> >>
> >>  A :ref:`write() <func-write>` or :ref:`VIDIOC_STREAMON`
> >>  call sends an implicit START command to the decoder if it has not bee=
n
> >> -started yet.
> >> +started yet. Applies to both queues of mem2mem decoders.
> >>
> >>  A :ref:`close() <func-close>` or :ref:`VIDIOC_STREAMOFF <VIDIOC_STREA=
MON>`
> >>  call of a streaming file descriptor sends an implicit immediate STOP
> >> -command to the decoder, and all buffered data is discarded.
> >> +command to the decoder, and all buffered data is discarded. Applies t=
o both
> >> +queues of mem2mem decoders.
> >>
> >> -These ioctls are optional, not all drivers may support them. They wer=
e
> >> -introduced in Linux 3.3.
> >> +In principle, these ioctls are optional, not all drivers may support =
them. They were
> >> +introduced in Linux 3.3. They are, however, mandatory for stateful me=
m2mem decoders
> >> +(as further documented in :ref:`decoder`).
> >>
> >>
> >>  .. tabularcolumns:: |p{1.1cm}|p{2.4cm}|p{1.2cm}|p{1.6cm}|p{10.6cm}|
> >> @@ -167,26 +169,32 @@ introduced in Linux 3.3.
> >>      ``V4L2_DEC_CMD_RESUME`` for that. This command has one flag:
> >>      ``V4L2_DEC_CMD_START_MUTE_AUDIO``. If set, then audio will be
> >>      muted when playing back at a non-standard speed.
> >> +
> >> +    For a device implementing the :ref:`decoder`, once the drain sequ=
ence
> >> +    is initiated with the ``V4L2_DEC_CMD_STOP`` command, it must be d=
riven
> >> +    to completion before this command can be invoked.  Any attempt to
> >> +    invoke the command while the drain sequence is in progress will t=
rigger
> >> +    an ``EBUSY`` error code.  The command may be also used to restart=
 the
> >> +    decoder in case of an implicit stop initiated by the decoder itse=
lf,
> >> +    without the ``V4L2_DEC_CMD_STOP`` being called explicitly. See
> >> +    :ref:`decoder` for more details.
> >>      * - ``V4L2_DEC_CMD_STOP``
> >>        - 1
> >>        - Stop the decoder. When the decoder is already stopped, this
> >>      command does nothing. This command has two flags: if
> >>      ``V4L2_DEC_CMD_STOP_TO_BLACK`` is set, then the decoder will set
> >>      the picture to black after it stopped decoding. Otherwise the las=
t
> >> -    image will repeat. mem2mem decoders will stop producing new frame=
s
> >> -    altogether. They will send a ``V4L2_EVENT_EOS`` event when the
> >> -    last frame has been decoded and all frames are ready to be
> >> -    dequeued and will set the ``V4L2_BUF_FLAG_LAST`` buffer flag on
> >> -    the last buffer of the capture queue to indicate there will be no
> >> -    new buffers produced to dequeue. This buffer may be empty,
> >> -    indicated by the driver setting the ``bytesused`` field to 0. Onc=
e
> >> -    the ``V4L2_BUF_FLAG_LAST`` flag was set, the
> >> -    :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will not block anymore,
> >> -    but return an ``EPIPE`` error code. If
> >> +    image will repeat. If
> >>      ``V4L2_DEC_CMD_STOP_IMMEDIATELY`` is set, then the decoder stops
> >>      immediately (ignoring the ``pts`` value), otherwise it will keep
> >>      decoding until timestamp >=3D pts or until the last of the pendin=
g
> >>      data from its internal buffers was decoded.
> >> +
> >> +    For a device implementing the :ref:`decoder`, the command will in=
itiate
> >> +    the drain sequence as documented in :ref:`decoder`.  No flags or =
other
> >> +    arguments are accepted in this case. Any attempt to invoke the co=
mmand
> >> +    again before the sequence completes will trigger an ``EBUSY`` err=
or
> >> +    code.
> >>      * - ``V4L2_DEC_CMD_PAUSE``
> >>        - 2
> >>        - Pause the decoder. When the decoder has not been started yet,=
 the
> >> @@ -209,6 +217,11 @@ On success 0 is returned, on error -1 and the ``e=
rrno`` variable is set
> >>  appropriately. The generic error codes are described at the
> >>  :ref:`Generic Error Codes <gen-errors>` chapter.
> >>
> >> +EBUSY
> >> +    A drain sequence of a device implementing the :ref:`decoder` is s=
till in
> >> +    progress. It is not allowed to issue another decoder command unti=
l it
> >> +    completes.
> >> +
> >>  EINVAL
> >>      The ``cmd`` field is invalid.
> >>
>
