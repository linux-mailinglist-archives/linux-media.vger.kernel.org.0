Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2589D6E0B3
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 07:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfGSFpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 01:45:54 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:32932 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbfGSFpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 01:45:54 -0400
Received: by mail-ed1-f67.google.com with SMTP id i11so33396460edq.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2019 22:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=07pJ3nyuuSc07oWggqAbYmP3KjrWKt7fIOEkaSGmZv8=;
        b=eGCR0FigA28d1QM9Yl5AmYmEApYf782jdUGuq8uZJn/PqFYxEThDZPnMc8Unh6+KUe
         dSxlcp7pXXBEmeppylAuecxMB5mauy5xN/HbrHzzyM965K3yxh3te6IS22IIMaGJZIay
         MUQ1OstBmdfZKAagPPLJcH7w049xrv9kNpiw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=07pJ3nyuuSc07oWggqAbYmP3KjrWKt7fIOEkaSGmZv8=;
        b=NuBWwwNzFKEfpTLVZucjw9hi2uK6jjmxtxuBlKIzT+SxYjfa1zeIWn6nqk/SkteAsG
         1UPTTwXZiQyjx062u9dYueY+lv/ef6EQvjVjLFmmo9tXda5cFSgvcu+8mGZ0fnqNweqL
         hTOxe/aGtutcc1mOuwgQJRvGCUc7NVtUnV26mT3zyji4+3522Xovsw4AAwu/cFYenu5Z
         OyjIbSm11P6jMY6B3mcCrryhLSaaTUHvKorv92SjNzLq4Gfn6lqz/xGgRcf+H3Syd72D
         nwRBb/rpBT+1ioAVYHrlPZnE/JQOptH538Iwgmtf7ASlVJ4YZcgjx52NSK1uHkKV6IGC
         kz/Q==
X-Gm-Message-State: APjAAAXWT6qAfD2EsvjQw98435GJjVl/qKNg48uKPzmuabBcS6CIXOlK
        UkvLawHz9L89dwkS4vfrR+9AYxzaYz3mWA==
X-Google-Smtp-Source: APXvYqyp4X56XLDIYj3cEVh8uyN2wmzhW51D+yIiOacz/YrzwAraaciXCP4d5Ylf1qvvfsdP7atO1Q==
X-Received: by 2002:a17:906:cd1f:: with SMTP id oz31mr39087952ejb.226.1563515149510;
        Thu, 18 Jul 2019 22:45:49 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a8sm8044697edt.56.2019.07.18.22.45.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 22:45:48 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id g17so30956291wrr.5
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2019 22:45:47 -0700 (PDT)
X-Received: by 2002:adf:ed41:: with SMTP id u1mr51378709wro.162.1563515147179;
 Thu, 18 Jul 2019 22:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
 <20190603112835.19661-2-hverkuil-cisco@xs4all.nl> <4feacf8e6c5389ee0a3ff5e9b8611b05f6592c3c.camel@ndufresne.ca>
In-Reply-To: <4feacf8e6c5389ee0a3ff5e9b8611b05f6592c3c.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 19 Jul 2019 14:45:33 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BwM7mDOs-jTyT_b=1=BxwiKrdbjCFgQv1umuy4guZKbw@mail.gmail.com>
Message-ID: <CAAFQd5BwM7mDOs-jTyT_b=1=BxwiKrdbjCFgQv1umuy4guZKbw@mail.gmail.com>
Subject: Re: [PATCHv4 1/2] media: docs-rst: Document memory-to-memory video
 decoder interface
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
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

On Wed, Jul 17, 2019 at 9:18 PM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Hello,
>
> there is one little detail/proposal, see inline .
>
> Le lundi 03 juin 2019 =C3=A0 13:28 +0200, Hans Verkuil a =C3=A9crit :
> > From: Tomasz Figa <tfiga@chromium.org>
> >
> > Due to complexity of the video decoding process, the V4L2 drivers of
> > stateful decoder hardware require specific sequences of V4L2 API calls
> > to be followed. These include capability enumeration, initialization,
> > decoding, seek, pause, dynamic resolution change, drain and end of
> > stream.
> >
> > Specifics of the above have been discussed during Media Workshops at
> > LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API that
> > originated at those events was later implemented by the drivers we alre=
ady
> > have merged in mainline, such as s5p-mfc or coda.
> >
> > The only thing missing was the real specification included as a part of
> > Linux Media documentation. Fix it now and document the decoder part of
> > the Codec API.
> >
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 +++++++++++++++++
> >  Documentation/media/uapi/v4l/dev-mem2mem.rst  |    8 +-
> >  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |    5 +
> >  Documentation/media/uapi/v4l/v4l2.rst         |   10 +-
> >  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
> >  5 files changed, 1132 insertions(+), 16 deletions(-)
> >  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
> >
> > diff --git a/Documentation/media/uapi/v4l/dev-decoder.rst b/Documentati=
on/media/uapi/v4l/dev-decoder.rst
> > new file mode 100644
> > index 000000000000..b106f2d97c48
> > --- /dev/null
> > +++ b/Documentation/media/uapi/v4l/dev-decoder.rst
> > @@ -0,0 +1,1084 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. _decoder:
> > +
> > +*************************************************
> > +Memory-to-memory Stateful Video Decoder Interface
> > +*************************************************
> > +
> > +A stateful video decoder takes complete chunks of the bitstream (e.g. =
Annex-B
> > +H.264/HEVC stream, raw VP8/9 stream) and decodes them into raw video f=
rames in
> > +display order. The decoder is expected not to require any additional i=
nformation
> > +from the client to process these buffers.
> > +
> > +Performing software parsing, processing etc. of the stream in the driv=
er in
> > +order to support this interface is strongly discouraged. In case such
> > +operations are needed, use of the Stateless Video Decoder Interface (i=
n
> > +development) is strongly advised.
> > +
> > +Conventions and notation used in this document
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. The general V4L2 API rules apply if not specified in this document
> > +   otherwise.
> > +
> > +2. The meaning of words "must", "may", "should", etc. is as per `RFC
> > +   2119 <https://tools.ietf.org/html/rfc2119>`_.
> > +
> > +3. All steps not marked "optional" are required.
> > +
> > +4. :c:func:`VIDIOC_G_EXT_CTRLS` and :c:func:`VIDIOC_S_EXT_CTRLS` may b=
e used
> > +   interchangeably with :c:func:`VIDIOC_G_CTRL` and :c:func:`VIDIOC_S_=
CTRL`,
> > +   unless specified otherwise.
> > +
> > +5. Single-planar API (see :ref:`planar-apis`) and applicable structure=
s may be
> > +   used interchangeably with multi-planar API, unless specified otherw=
ise,
> > +   depending on decoder capabilities and following the general V4L2 gu=
idelines.
> > +
> > +6. i =3D [a..b]: sequence of integers from a to b, inclusive, i.e. i =
=3D
> > +   [0..2]: i =3D 0, 1, 2.
> > +
> > +7. Given an ``OUTPUT`` buffer A, then A=E2=80=99 represents a buffer o=
n the ``CAPTURE``
> > +   queue containing data that resulted from processing buffer A.
> > +
> > +.. _decoder-glossary:
> > +
> > +Glossary
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +CAPTURE
> > +   the destination buffer queue; for decoders, the queue of buffers co=
ntaining
> > +   decoded frames; for encoders, the queue of buffers containing an en=
coded
> > +   bitstream; ``V4L2_BUF_TYPE_VIDEO_CAPTURE`` or
> > +   ``V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE``; data is captured from the h=
ardware
> > +   into ``CAPTURE`` buffers.
> > +
> > +client
> > +   the application communicating with the decoder or encoder implement=
ing
> > +   this interface.
> > +
> > +coded format
> > +   encoded/compressed video bitstream format (e.g. H.264, VP8, etc.); =
see
> > +   also: raw format.
> > +
> > +coded height
> > +   height for given coded resolution.
> > +
> > +coded resolution
> > +   stream resolution in pixels aligned to codec and hardware requireme=
nts;
> > +   typically visible resolution rounded up to full macroblocks;
> > +   see also: visible resolution.
> > +
> > +coded width
> > +   width for given coded resolution.
> > +
> > +decode order
> > +   the order in which frames are decoded; may differ from display orde=
r if the
> > +   coded format includes a feature of frame reordering; for decoders,
> > +   ``OUTPUT`` buffers must be queued by the client in decode order; fo=
r
> > +   encoders ``CAPTURE`` buffers must be returned by the encoder in dec=
ode order.
> > +
> > +destination
> > +   data resulting from the decode process; see ``CAPTURE``.
> > +
> > +display order
> > +   the order in which frames must be displayed; for encoders, ``OUTPUT=
``
> > +   buffers must be queued by the client in display order; for decoders=
,
> > +   ``CAPTURE`` buffers must be returned by the decoder in display orde=
r.
> > +
> > +DPB
> > +   Decoded Picture Buffer; an H.264/HEVC term for a buffer that stores=
 a decoded
> > +   raw frame available for reference in further decoding steps.
> > +
> > +EOS
> > +   end of stream.
> > +
> > +IDR
> > +   Instantaneous Decoder Refresh; a type of a keyframe in an H.264/HEV=
C-encoded
> > +   stream, which clears the list of earlier reference frames (DPBs).
> > +
> > +keyframe
> > +   an encoded frame that does not reference frames decoded earlier, i.=
e.
> > +   can be decoded fully on its own.
> > +
> > +macroblock
> > +   a processing unit in image and video compression formats based on l=
inear
> > +   block transforms (e.g. H.264, VP8, VP9); codec-specific, but for mo=
st of
> > +   popular codecs the size is 16x16 samples (pixels).
> > +
> > +OUTPUT
> > +   the source buffer queue; for decoders, the queue of buffers contain=
ing
> > +   an encoded bitstream; for encoders, the queue of buffers containing=
 raw
> > +   frames; ``V4L2_BUF_TYPE_VIDEO_OUTPUT`` or
> > +   ``V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE``; the hardware is fed with dat=
a
> > +   from ``OUTPUT`` buffers.
> > +
> > +PPS
> > +   Picture Parameter Set; a type of metadata entity in an H.264/HEVC b=
itstream.
> > +
> > +raw format
> > +   uncompressed format containing raw pixel data (e.g. YUV, RGB format=
s).
> > +
> > +resume point
> > +   a point in the bitstream from which decoding may start/continue, wi=
thout
> > +   any previous state/data present, e.g.: a keyframe (VP8/VP9) or
> > +   SPS/PPS/IDR sequence (H.264/HEVC); a resume point is required to st=
art decode
> > +   of a new stream, or to resume decoding after a seek.
> > +
> > +source
> > +   data fed to the decoder or encoder; see ``OUTPUT``.
> > +
> > +source height
> > +   height in pixels for given source resolution; relevant to encoders =
only.
> > +
> > +source resolution
> > +   resolution in pixels of source frames being source to the encoder a=
nd
> > +   subject to further cropping to the bounds of visible resolution; re=
levant to
> > +   encoders only.
> > +
> > +source width
> > +   width in pixels for given source resolution; relevant to encoders o=
nly.
> > +
> > +SPS
> > +   Sequence Parameter Set; a type of metadata entity in an H.264/HEVC =
bitstream.
> > +
> > +stream metadata
> > +   additional (non-visual) information contained inside encoded bitstr=
eam;
> > +   for example: coded resolution, visible resolution, codec profile.
> > +
> > +visible height
> > +   height for given visible resolution; display height.
> > +
> > +visible resolution
> > +   stream resolution of the visible picture, in pixels, to be used for
> > +   display purposes; must be smaller or equal to coded resolution;
> > +   display resolution.
> > +
> > +visible width
> > +   width for given visible resolution; display width.
> > +
> > +State machine
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. kernel-render:: DOT
> > +   :alt: DOT digraph of decoder state machine
> > +   :caption: Decoder state machine
> > +
> > +   digraph decoder_state_machine {
> > +       node [shape =3D doublecircle, label=3D"Decoding"] Decoding;
> > +
> > +       node [shape =3D circle, label=3D"Initialization"] Initializatio=
n;
> > +       node [shape =3D circle, label=3D"Capture\nsetup"] CaptureSetup;
> > +       node [shape =3D circle, label=3D"Dynamic\nresolution\nchange"] =
ResChange;
> > +       node [shape =3D circle, label=3D"Stopped"] Stopped;
> > +       node [shape =3D circle, label=3D"Drain"] Drain;
> > +       node [shape =3D circle, label=3D"Seek"] Seek;
> > +       node [shape =3D circle, label=3D"End of stream"] EoS;
> > +
> > +       node [shape =3D point]; qi
> > +       qi -> Initialization [ label =3D "open()" ];
> > +
> > +       Initialization -> CaptureSetup [ label =3D "CAPTURE\nformat\nes=
tablished" ];
> > +
> > +       CaptureSetup -> Stopped [ label =3D "CAPTURE\nbuffers\nready" ]=
;
> > +
> > +       Decoding -> ResChange [ label =3D "Stream\nresolution\nchange" =
];
> > +       Decoding -> Drain [ label =3D "V4L2_DEC_CMD_STOP" ];
> > +       Decoding -> EoS [ label =3D "EoS mark\nin the stream" ];
> > +       Decoding -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > +       Decoding -> Stopped [ label =3D "VIDIOC_STREAMOFF(CAPTURE)" ];
> > +       Decoding -> Decoding;
> > +
> > +       ResChange -> CaptureSetup [ label =3D "CAPTURE\nformat\nestabli=
shed" ];
> > +       ResChange -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > +
> > +       EoS -> Drain [ label =3D "Implicit\ndrain" ];
> > +
> > +       Drain -> Stopped [ label =3D "All CAPTURE\nbuffers dequeued\nor=
\nVIDIOC_STREAMOFF(CAPTURE)" ];
> > +       Drain -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > +
> > +       Seek -> Decoding [ label =3D "VIDIOC_STREAMON(OUTPUT)" ];
> > +       Seek -> Initialization [ label =3D "VIDIOC_REQBUFS(OUTPUT, 0)" =
];
> > +
> > +       Stopped -> Decoding [ label =3D "V4L2_DEC_CMD_START\nor\nVIDIOC=
_STREAMON(CAPTURE)" ];
> > +       Stopped -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> > +   }
> > +
> > +Querying capabilities
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. To enumerate the set of coded formats supported by the decoder, the
> > +   client may call :c:func:`VIDIOC_ENUM_FMT` on ``OUTPUT``.
> > +
> > +   * The full set of supported formats will be returned, regardless of=
 the
> > +     format set on ``CAPTURE``.
> > +
> > +2. To enumerate the set of supported raw formats, the client may call
> > +   :c:func:`VIDIOC_ENUM_FMT` on ``CAPTURE``.
> > +
> > +   * Only the formats supported for the format currently active on ``O=
UTPUT``
> > +     will be returned.
> > +
> > +   * In order to enumerate raw formats supported by a given coded form=
at,
> > +     the client must first set that coded format on ``OUTPUT`` and the=
n
> > +     enumerate formats on ``CAPTURE``.
> > +
> > +3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect suppo=
rted
> > +   resolutions for a given format, passing desired pixel format in
> > +   :c:type:`v4l2_frmsizeenum` ``pixel_format``.
> > +
> > +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a coded p=
ixel
> > +     format will include all possible coded resolutions supported by t=
he
> > +     decoder for given coded pixel format.
> > +
> > +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a raw pix=
el format
> > +     will include all possible frame buffer resolutions supported by t=
he
> > +     decoder for given raw pixel format and the coded format currently=
 set on
> > +     ``OUTPUT``.
> > +
> > +4. Supported profiles and levels for the coded format currently set on
> > +   ``OUTPUT``, if applicable, may be queried using their respective co=
ntrols
> > +   via :c:func:`VIDIOC_QUERYCTRL`.
> > +
> > +Initialization
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. Set the coded format on ``OUTPUT`` via :c:func:`VIDIOC_S_FMT`
> > +
> > +   * **Required fields:**
> > +
> > +     ``type``
> > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > +
> > +     ``pixelformat``
> > +         a coded pixel format.
> > +
> > +     ``width``, ``height``
> > +         coded resolution of the stream; required only if it cannot be=
 parsed
> > +         from the stream for the given coded format; otherwise the dec=
oder will
> > +         use this resolution as a placeholder resolution that will lik=
ely change
> > +         as soon as it can parse the actual coded resolution from the =
stream.
> > +
> > +     ``sizeimage``
> > +         desired size of ``OUTPUT`` buffers; the decoder may adjust it=
 to
> > +         match hardware requirements.
> > +
> > +     other fields
> > +         follow standard semantics.
> > +
> > +   * **Return fields:**
> > +
> > +     ``sizeimage``
> > +         adjusted size of ``OUTPUT`` buffers.
> > +
> > +   * The ``CAPTURE`` format will be updated with an appropriate frame =
buffer
> > +     resolution instantly based on the width and height returned by
> > +     :c:func:`VIDIOC_S_FMT`.
> > +     However, for coded formats that include stream resolution informa=
tion,
> > +     after the decoder is done parsing the information from the stream=
, it will
> > +     update the ``CAPTURE`` format with new values and signal a source=
 change
> > +     event, regardless of whether they match the values set by the cli=
ent or
> > +     not.
> > +
> > +   .. important::
> > +
> > +      Changing the ``OUTPUT`` format may change the currently set ``CA=
PTURE``
> > +      format. How the new ``CAPTURE`` format is determined is up to th=
e decoder
> > +      and the client must ensure it matches its needs afterwards.
> > +
> > +2.  Allocate source (bitstream) buffers via :c:func:`VIDIOC_REQBUFS` o=
n
> > +    ``OUTPUT``.
> > +
> > +    * **Required fields:**
> > +
> > +      ``count``
> > +          requested number of buffers to allocate; greater than zero.
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > +
> > +      ``memory``
> > +          follows standard semantics.
> > +
> > +    * **Return fields:**
> > +
> > +      ``count``
> > +          the actual number of buffers allocated.
> > +
> > +    .. warning::
> > +
> > +       The actual number of allocated buffers may differ from the ``co=
unt``
> > +       given. The client must check the updated value of ``count`` aft=
er the
> > +       call returns.
> > +
> > +    Alternatively, :c:func:`VIDIOC_CREATE_BUFS` on the ``OUTPUT`` queu=
e can be
> > +    used to have more control over buffer allocation.
> > +
> > +    * **Required fields:**
> > +
> > +      ``count``
> > +          requested number of buffers to allocate; greater than zero.
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > +
> > +      ``memory``
> > +          follows standard semantics.
> > +
> > +      ``format``
> > +          follows standard semantics.
> > +
> > +    * **Return fields:**
> > +
> > +      ``count``
> > +          adjusted to the number of allocated buffers.
> > +
> > +    .. warning::
> > +
> > +       The actual number of allocated buffers may differ from the ``co=
unt``
> > +       given. The client must check the updated value of ``count`` aft=
er the
> > +       call returns.
> > +
> > +3.  Start streaming on the ``OUTPUT`` queue via :c:func:`VIDIOC_STREAM=
ON`.
> > +
> > +4.  **This step only applies to coded formats that contain resolution =
information
> > +    in the stream.** Continue queuing/dequeuing bitstream buffers to/f=
rom the
> > +    ``OUTPUT`` queue via :c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQB=
UF`. The
> > +    buffers will be processed and returned to the client in order, unt=
il
> > +    required metadata to configure the ``CAPTURE`` queue are found. Th=
is is
> > +    indicated by the decoder sending a ``V4L2_EVENT_SOURCE_CHANGE`` ev=
ent with
> > +    ``changes`` set to ``V4L2_EVENT_SRC_CH_RESOLUTION``.
> > +
> > +    * It is not an error if the first buffer does not contain enough d=
ata for
> > +      this to occur. Processing of the buffers will continue as long a=
s more
> > +      data is needed.
> > +
> > +    * If data in a buffer that triggers the event is required to decod=
e the
> > +      first frame, it will not be returned to the client, until the
> > +      initialization sequence completes and the frame is decoded.
> > +
> > +    * If the client has not set the coded resolution of the stream on =
its own,
> > +      calling :c:func:`VIDIOC_G_FMT`, :c:func:`VIDIOC_S_FMT`,
> > +      :c:func:`VIDIOC_TRY_FMT` or :c:func:`VIDIOC_REQBUFS` on the ``CA=
PTURE``
> > +      queue will not return the real values for the stream until a
> > +      ``V4L2_EVENT_SOURCE_CHANGE`` event is signaled.
> > +
> > +    .. important::
> > +
> > +       Any client query issued after the decoder queues the event will=
 return
> > +       values applying to the just parsed stream, including queue form=
ats,
> > +       selection rectangles and controls.
> > +
> > +    .. note::
> > +
> > +       A client capable of acquiring stream parameters from the bitstr=
eam on
> > +       its own may attempt to set the width and height of the ``OUTPUT=
`` format
> > +       to non-zero values matching the coded size of the stream, skip =
this step
> > +       and continue with the `Capture setup` sequence. However, it mus=
t not
> > +       rely on any driver queries regarding stream parameters, such as
> > +       selection rectangles and controls, since the decoder has not pa=
rsed them
> > +       from the stream yet. If the values configured by the client do =
not match
> > +       those parsed by the decoder, a `Dynamic resolution change` will=
 be
> > +       triggered to reconfigure them.
> > +
> > +    .. note::
> > +
> > +       No decoded frames are produced during this phase.
> > +
> > +5.  Continue with the `Capture setup` sequence.
> > +
> > +Capture setup
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1.  Call :c:func:`VIDIOC_G_FMT` on the ``CAPTURE`` queue to get format=
 for the
> > +    destination buffers parsed/decoded from the bitstream.
> > +
> > +    * **Required fields:**
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > +
> > +    * **Return fields:**
> > +
> > +      ``width``, ``height``
> > +          frame buffer resolution for the decoded frames.
> > +
> > +      ``pixelformat``
> > +          pixel format for decoded frames.
> > +
> > +      ``num_planes`` (for _MPLANE ``type`` only)
> > +          number of planes for pixelformat.
> > +
> > +      ``sizeimage``, ``bytesperline``
> > +          as per standard semantics; matching frame buffer format.
> > +
> > +    .. note::
> > +
> > +       The value of ``pixelformat`` may be any pixel format supported =
by the
> > +       decoder for the current stream. The decoder should choose a
> > +       preferred/optimal format for the default configuration. For exa=
mple, a
> > +       YUV format may be preferred over an RGB format if an additional
> > +       conversion step would be required for the latter.
> > +
> > +2.  **Optional.** Acquire the visible resolution via
> > +    :c:func:`VIDIOC_G_SELECTION`.
> > +
> > +    * **Required fields:**
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > +
> > +      ``target``
> > +          set to ``V4L2_SEL_TGT_COMPOSE``.
> > +
> > +    * **Return fields:**
> > +
> > +      ``r.left``, ``r.top``, ``r.width``, ``r.height``
> > +          the visible rectangle; it must fit within the frame buffer r=
esolution
> > +          returned by :c:func:`VIDIOC_G_FMT` on ``CAPTURE``.
> > +
> > +    * The following selection targets are supported on ``CAPTURE``:
> > +
> > +      ``V4L2_SEL_TGT_CROP_BOUNDS``
> > +          corresponds to the coded resolution of the stream.
> > +
> > +      ``V4L2_SEL_TGT_CROP_DEFAULT``
> > +          the rectangle covering the part of the ``CAPTURE`` buffer th=
at
> > +          contains meaningful picture data (visible area); width and h=
eight
> > +          will be equal to the visible resolution of the stream.
> > +
> > +      ``V4L2_SEL_TGT_CROP``
> > +          the rectangle within the coded resolution to be output to
> > +          ``CAPTURE``; defaults to ``V4L2_SEL_TGT_CROP_DEFAULT``; read=
-only on
> > +          hardware without additional compose/scaling capabilities.
> > +
> > +      ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
> > +          the maximum rectangle within a ``CAPTURE`` buffer, which the=
 cropped
> > +          frame can be composed into; equal to ``V4L2_SEL_TGT_CROP`` i=
f the
> > +          hardware does not support compose/scaling.
> > +
> > +      ``V4L2_SEL_TGT_COMPOSE_DEFAULT``
> > +          equal to ``V4L2_SEL_TGT_CROP``.
> > +
> > +      ``V4L2_SEL_TGT_COMPOSE``
> > +          the rectangle inside a ``CAPTURE`` buffer into which the cro=
pped
> > +          frame is written; defaults to ``V4L2_SEL_TGT_COMPOSE_DEFAULT=
``;
> > +          read-only on hardware without additional compose/scaling cap=
abilities.
> > +
> > +      ``V4L2_SEL_TGT_COMPOSE_PADDED``
> > +          the rectangle inside a ``CAPTURE`` buffer which is overwritt=
en by the
> > +          hardware; equal to ``V4L2_SEL_TGT_COMPOSE`` if the hardware =
does not
> > +          write padding pixels.
> > +
> > +    .. warning::
> > +
> > +       The values are guaranteed to be meaningful only after the decod=
er
> > +       successfully parses the stream metadata. The client must not re=
ly on the
> > +       query before that happens.
> > +
> > +3.  **Optional.** Enumerate ``CAPTURE`` formats via :c:func:`VIDIOC_EN=
UM_FMT` on
> > +    the ``CAPTURE`` queue. Once the stream information is parsed and k=
nown, the
> > +    client may use this ioctl to discover which raw formats are suppor=
ted for
> > +    given stream and select one of them via :c:func:`VIDIOC_S_FMT`.
> > +
> > +    .. important::
> > +
> > +       The decoder will return only formats supported for the currentl=
y
> > +       established coded format, as per the ``OUTPUT`` format and/or s=
tream
> > +       metadata parsed in this initialization sequence, even if more f=
ormats
> > +       may be supported by the decoder in general. In other words, the=
 set
> > +       returned will be a subset of the initial query mentioned in the
> > +       `Querying capabilities` section.
> > +
> > +       For example, a decoder may support YUV and RGB formats for reso=
lutions
> > +       1920x1088 and lower, but only YUV for higher resolutions (due t=
o
> > +       hardware limitations). After parsing a resolution of 1920x1088 =
or lower,
> > +       :c:func:`VIDIOC_ENUM_FMT` may return a set of YUV and RGB pixel=
 formats,
> > +       but after parsing resolution higher than 1920x1088, the decoder=
 will not
> > +       return RGB, unsupported for this resolution.
> > +
> > +       However, subsequent resolution change event triggered after
> > +       discovering a resolution change within the same stream may swit=
ch
> > +       the stream into a lower resolution and :c:func:`VIDIOC_ENUM_FMT=
`
> > +       would return RGB formats again in that case.
> > +
> > +4.  **Optional.** Set the ``CAPTURE`` format via :c:func:`VIDIOC_S_FMT=
` on the
> > +    ``CAPTURE`` queue. The client may choose a different format than
> > +    selected/suggested by the decoder in :c:func:`VIDIOC_G_FMT`.
> > +
> > +    * **Required fields:**
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > +
> > +      ``pixelformat``
> > +          a raw pixel format.
> > +
> > +   * Setting the ``CAPTURE`` format will reset the compose selection r=
ectangles
> > +     to their default values, based on the new resolution, as describe=
d in the
> > +     previous step.
> > +
> > +5. **Optional.** Set the compose rectangle via :c:func:`VIDIOC_S_SELEC=
TION` on
> > +   the ``CAPTURE`` queue if it is desired and if the decoder has compo=
se and/or
> > +   scaling capabilities.
> > +
> > +   * **Required fields:**
> > +
> > +     ``type``
> > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > +
> > +     ``target``
> > +         set to ``V4L2_SEL_TGT_COMPOSE``.
> > +
> > +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> > +         the rectangle inside a ``CAPTURE`` buffer into which the crop=
ped
> > +         frame is written; defaults to ``V4L2_SEL_TGT_COMPOSE_DEFAULT`=
`;
> > +         read-only on hardware without additional compose/scaling capa=
bilities.
> > +
> > +   * **Return fields:**
> > +
> > +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> > +         the visible rectangle; it must fit within the frame buffer re=
solution
> > +         returned by :c:func:`VIDIOC_G_FMT` on ``CAPTURE``.
> > +
> > +   .. warning::
> > +
> > +      The decoder may adjust the compose rectangle to the nearest
> > +      supported one to meet codec and hardware requirements. The clien=
t needs
> > +      to check the adjusted rectangle returned by :c:func:`VIDIOC_S_SE=
LECTION`.
> > +
> > +6.  If all the following conditions are met, the client may resume the=
 decoding
> > +    instantly:
> > +
> > +    * ``sizeimage`` of the new format (determined in previous steps) i=
s less
> > +      than or equal to the size of currently allocated buffers,
> > +
> > +    * the number of buffers currently allocated is greater than or equ=
al to the
> > +      minimum number of buffers acquired in previous steps. To fulfill=
 this
> > +      requirement, the client may use :c:func:`VIDIOC_CREATE_BUFS` to =
add new
> > +      buffers.
> > +
> > +    In that case, the remaining steps do not apply and the client may =
resume
> > +    the decoding by one of the following actions:
> > +
> > +    * if the ``CAPTURE`` queue is streaming, call :c:func:`VIDIOC_DECO=
DER_CMD`
> > +      with the ``V4L2_DEC_CMD_START`` command,
> > +
> > +    * if the ``CAPTURE`` queue is not streaming, call :c:func:`VIDIOC_=
STREAMON`
> > +      on the ``CAPTURE`` queue.
> > +
> > +    However, if the client intends to change the buffer set, to lower
> > +    memory usage or for any other reasons, it may be achieved by follo=
wing
> > +    the steps below.
> > +
> > +7.  **If the** ``CAPTURE`` **queue is streaming,** keep queuing and de=
queuing
> > +    buffers on the ``CAPTURE`` queue until a buffer marked with the
> > +    ``V4L2_BUF_FLAG_LAST`` flag is dequeued.
> > +
> > +8.  **If the** ``CAPTURE`` **queue is streaming,** call :c:func:`VIDIO=
C_STREAMOFF`
> > +    on the ``CAPTURE`` queue to stop streaming.
> > +
> > +    .. warning::
> > +
> > +       The ``OUTPUT`` queue must remain streaming. Calling
> > +       :c:func:`VIDIOC_STREAMOFF` on it would abort the sequence and t=
rigger a
> > +       seek.
> > +
> > +9.  **If the** ``CAPTURE`` **queue has buffers allocated,** free the `=
`CAPTURE``
> > +    buffers using :c:func:`VIDIOC_REQBUFS`.
> > +
> > +    * **Required fields:**
> > +
> > +      ``count``
> > +          set to 0.
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > +
> > +      ``memory``
> > +          follows standard semantics.
> > +
> > +10. Allocate ``CAPTURE`` buffers via :c:func:`VIDIOC_REQBUFS` on the
> > +    ``CAPTURE`` queue.
> > +
> > +    * **Required fields:**
> > +
> > +      ``count``
> > +          requested number of buffers to allocate; greater than zero.
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > +
> > +      ``memory``
> > +          follows standard semantics.
> > +
> > +    * **Return fields:**
> > +
> > +      ``count``
> > +          actual number of buffers allocated.
> > +
> > +    .. warning::
> > +
> > +       The actual number of allocated buffers may differ from the ``co=
unt``
> > +       given. The client must check the updated value of ``count`` aft=
er the
> > +       call returns.
> > +
> > +    .. note::
> > +
> > +       To allocate more than the minimum number of buffers (for pipeli=
ne
> > +       depth), the client may query the ``V4L2_CID_MIN_BUFFERS_FOR_CAP=
TURE``
> > +       control to get the minimum number of buffers required, and pass=
 the
> > +       obtained value plus the number of additional buffers needed in =
the
> > +       ``count`` field to :c:func:`VIDIOC_REQBUFS`.
> > +
> > +    Alternatively, :c:func:`VIDIOC_CREATE_BUFS` on the ``CAPTURE`` que=
ue can be
> > +    used to have more control over buffer allocation. For example, by
> > +    allocating buffers larger than the current ``CAPTURE`` format, fut=
ure
> > +    resolution changes can be accommodated.
> > +
> > +    * **Required fields:**
> > +
> > +      ``count``
> > +          requested number of buffers to allocate; greater than zero.
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > +
> > +      ``memory``
> > +          follows standard semantics.
> > +
> > +      ``format``
> > +          a format representing the maximum framebuffer resolution to =
be
> > +          accommodated by newly allocated buffers.
> > +
> > +    * **Return fields:**
> > +
> > +      ``count``
> > +          adjusted to the number of allocated buffers.
> > +
> > +    .. warning::
> > +
> > +        The actual number of allocated buffers may differ from the ``c=
ount``
> > +        given. The client must check the updated value of ``count`` af=
ter the
> > +        call returns.
> > +
> > +    .. note::
> > +
> > +       To allocate buffers for a format different than parsed from the=
 stream
> > +       metadata, the client must proceed as follows, before the metada=
ta
> > +       parsing is initiated:
> > +
> > +       * set width and height of the ``OUTPUT`` format to desired code=
d resolution to
> > +         let the decoder configure the ``CAPTURE`` format appropriatel=
y,
> > +
> > +       * query the ``CAPTURE`` format using :c:func:`VIDIOC_G_FMT` and=
 save it
> > +         until this step.
> > +
> > +       The format obtained in the query may be then used with
> > +       :c:func:`VIDIOC_CREATE_BUFS` in this step to allocate the buffe=
rs.
> > +
> > +11. Call :c:func:`VIDIOC_STREAMON` on the ``CAPTURE`` queue to start d=
ecoding
> > +    frames.
> > +
> > +Decoding
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +This state is reached after the `Capture setup` sequence finishes succ=
essfully.
> > +In this state, the client queues and dequeues buffers to both queues v=
ia
> > +:c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQBUF`, following the standa=
rd
> > +semantics.
> > +
> > +The content of the source ``OUTPUT`` buffers depends on the active cod=
ed pixel
> > +format and may be affected by codec-specific extended controls, as sta=
ted in
> > +the documentation of each format.
> > +
> > +Both queues operate independently, following the standard behavior of =
V4L2
> > +buffer queues and memory-to-memory devices. In addition, the order of =
decoded
> > +frames dequeued from the ``CAPTURE`` queue may differ from the order o=
f queuing
> > +coded frames to the ``OUTPUT`` queue, due to properties of the selecte=
d coded
> > +format, e.g. frame reordering.
> > +
> > +The client must not assume any direct relationship between ``CAPTURE``
> > +and ``OUTPUT`` buffers and any specific timing of buffers becoming
> > +available to dequeue. Specifically:
> > +
> > +* a buffer queued to ``OUTPUT`` may result in no buffers being produce=
d
> > +  on ``CAPTURE`` (e.g. if it does not contain encoded data, or if only
> > +  metadata syntax structures are present in it),
> > +
> > +* a buffer queued to ``OUTPUT`` may result in more than one buffer pro=
duced
> > +  on ``CAPTURE`` (if the encoded data contained more than one frame, o=
r if
> > +  returning a decoded frame allowed the decoder to return a frame that
> > +  preceded it in decode, but succeeded it in the display order),
> > +
> > +* a buffer queued to ``OUTPUT`` may result in a buffer being produced =
on
> > +  ``CAPTURE`` later into decode process, and/or after processing furth=
er
> > +  ``OUTPUT`` buffers, or be returned out of order, e.g. if display
> > +  reordering is used,
> > +
> > +* buffers may become available on the ``CAPTURE`` queue without additi=
onal
> > +  buffers queued to ``OUTPUT`` (e.g. during drain or ``EOS``), because=
 of the
> > +  ``OUTPUT`` buffers queued in the past whose decoding results are onl=
y
> > +  available at later time, due to specifics of the decoding process.
> > +
> > +.. note::
> > +
> > +   To allow matching decoded ``CAPTURE`` buffers with ``OUTPUT`` buffe=
rs they
> > +   originated from, the client can set the ``timestamp`` field of the
> > +   :c:type:`v4l2_buffer` struct when queuing an ``OUTPUT`` buffer. The
> > +   ``CAPTURE`` buffer(s), which resulted from decoding that ``OUTPUT``=
 buffer
> > +   will have their ``timestamp`` field set to the same value when dequ=
eued.
> > +
> > +   In addition to the straightforward case of one ``OUTPUT`` buffer pr=
oducing
> > +   one ``CAPTURE`` buffer, the following cases are defined:
> > +
> > +   * one ``OUTPUT`` buffer generates multiple ``CAPTURE`` buffers: the=
 same
> > +     ``OUTPUT`` timestamp will be copied to multiple ``CAPTURE`` buffe=
rs.
> > +
> > +   * multiple ``OUTPUT`` buffers generate one ``CAPTURE`` buffer: time=
stamp of
> > +     the ``OUTPUT`` buffer queued last will be copied.
>
> I'd like to propose to change this into " timestamp of the OUTPUT
> buffer queued first will be copied". The rationale is the following, if
> you have an OUTPUT buffer that is unaligned in the following form:
>
>   [ remaining | complete frame ]
>
> The remaining data is the last bits of the current frame. So it should
> share a timestamp with the bits that came before. But then you have
> another frame which by accident could fit entirely in your buffer. With
> the last approach, it is not possible to give that frame a timestamp.
>
> The first approach fixes this problem. If there was a remaining on the
> very first buffer, it will be dropped anyway, so it also work for this
> case. This modification is aligned with MPEG TS container specification
> which says the the timestamp of the packet applies to the first ES
> packet that starts, the remaining bits will reuse the previous packet
> timestamp. The rest is common sense, e.g. the same ES packet should
> only have one timestamp etc.

Wouldn't that replace one problem with another? How about the case below?

[ complete frame | partial frame ] [ remaining ]

Best regards,
Tomasz
