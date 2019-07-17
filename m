Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA1FA6BC2F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 14:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfGQMS0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 08:18:26 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:40659 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQMSZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 08:18:25 -0400
Received: by mail-vs1-f67.google.com with SMTP id a186so14666901vsd.7
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 05:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=WB1YXaKHUiXLHqWKGctybhsL6hcvOqCVMvD99S99yXk=;
        b=x7xRqp+TndJiFa0TlwlowQ5TBoJWbatBeMnnQTiDrnJgMjT0F00A0CBPTP8U4ffHAu
         KdwGs1DO0k4w+IYFHLSAITuKFiMDiix8M7H0Eh5LcS8gy7ZbxWkLrmJaGzI8PWcOK6gk
         Z11zV5Yghxj50CYr6+uc2eTO6Umb0mAK4ldcxZ9wjledQUqQn6YAU8b3zeGxA5Dt5pz9
         Op+7EFoXh/fzUzOXhQZR1Z8kbdQJlr8iQW1jL6UTyNj/Eh8jp6UFkOd6zdk8idW8dSU3
         6Nn1IcOH8htbLIfjO6ah55dRzNh17lX3zAnA27ckqJRn6wjOOB4tgAFPbhyxvF7mg6vy
         kGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=WB1YXaKHUiXLHqWKGctybhsL6hcvOqCVMvD99S99yXk=;
        b=Y4nKGxCp7MgjH8FzPYzXtDBdVf5SrRSjYgHxbFEeb2bTs1pbhsnxKatym+A6rDSi/R
         KVUrISFrIal9TqmWNz+9XoyNlFnEHx6E5x1ny97zTzHpcaqawpPhbYPagTkUdoRHmfV8
         ftiCEYXzsI32eHRwR6Igj2xQG655Ne5dd023pHAwkuH2IvzLcleA+HrDMA6q4FDAd4En
         WYcUPGBxvfytXjBZfezaVNF7G7hKZEMGzHv3wIcAq4HUFH0sdixEUX149r1/ScGeTn4n
         nfnxx5utcBkFfElVqleNlh1hLxp3xee7m7rUOyiUnTzNaDdO1mRdb50q5+weCbXH4fLk
         Nhhg==
X-Gm-Message-State: APjAAAVaKITBB5VLlSDNrpoG9TkVHQ8uQ0m3uHPuureg4nVziHgBZkAu
        Tat245t92PliELQ1SXIuoo0=
X-Google-Smtp-Source: APXvYqwM/bUX/KeK0kia/EdGUqK9971APEJc11NcQ8fGHquUuhZYoHz552/GRumWubkBBjKDPZ8UCA==
X-Received: by 2002:a67:f7cd:: with SMTP id a13mr24162666vsp.163.1563365902662;
        Wed, 17 Jul 2019 05:18:22 -0700 (PDT)
Received: from tpx230-nicolas ([63.237.252.15])
        by smtp.gmail.com with ESMTPSA id v143sm5564229vsv.20.2019.07.17.05.18.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 05:18:21 -0700 (PDT)
Message-ID: <4feacf8e6c5389ee0a3ff5e9b8611b05f6592c3c.camel@ndufresne.ca>
Subject: Re: [PATCHv4 1/2] media: docs-rst: Document memory-to-memory video
 decoder interface
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Date:   Wed, 17 Jul 2019 08:18:19 -0400
In-Reply-To: <20190603112835.19661-2-hverkuil-cisco@xs4all.nl>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
         <20190603112835.19661-2-hverkuil-cisco@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-lLbAJ2h/ym5L/f/fWfGJ"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-lLbAJ2h/ym5L/f/fWfGJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

there is one little detail/proposal, see inline	.

Le lundi 03 juin 2019 =C3=A0 13:28 +0200, Hans Verkuil a =C3=A9crit :
> From: Tomasz Figa <tfiga@chromium.org>
>=20
> Due to complexity of the video decoding process, the V4L2 drivers of
> stateful decoder hardware require specific sequences of V4L2 API calls
> to be followed. These include capability enumeration, initialization,
> decoding, seek, pause, dynamic resolution change, drain and end of
> stream.
>=20
> Specifics of the above have been discussed during Media Workshops at
> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API that
> originated at those events was later implemented by the drivers we alread=
y
> have merged in mainline, such as s5p-mfc or coda.
>=20
> The only thing missing was the real specification included as a part of
> Linux Media documentation. Fix it now and document the decoder part of
> the Codec API.
>=20
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 +++++++++++++++++
>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |    8 +-
>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |    5 +
>  Documentation/media/uapi/v4l/v4l2.rst         |   10 +-
>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
>  5 files changed, 1132 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
>=20
> diff --git a/Documentation/media/uapi/v4l/dev-decoder.rst b/Documentation=
/media/uapi/v4l/dev-decoder.rst
> new file mode 100644
> index 000000000000..b106f2d97c48
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/dev-decoder.rst
> @@ -0,0 +1,1084 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _decoder:
> +
> +*************************************************
> +Memory-to-memory Stateful Video Decoder Interface
> +*************************************************
> +
> +A stateful video decoder takes complete chunks of the bitstream (e.g. An=
nex-B
> +H.264/HEVC stream, raw VP8/9 stream) and decodes them into raw video fra=
mes in
> +display order. The decoder is expected not to require any additional inf=
ormation
> +from the client to process these buffers.
> +
> +Performing software parsing, processing etc. of the stream in the driver=
 in
> +order to support this interface is strongly discouraged. In case such
> +operations are needed, use of the Stateless Video Decoder Interface (in
> +development) is strongly advised.
> +
> +Conventions and notation used in this document
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +1. The general V4L2 API rules apply if not specified in this document
> +   otherwise.
> +
> +2. The meaning of words "must", "may", "should", etc. is as per `RFC
> +   2119 <https://tools.ietf.org/html/rfc2119>`_.
> +
> +3. All steps not marked "optional" are required.
> +
> +4. :c:func:`VIDIOC_G_EXT_CTRLS` and :c:func:`VIDIOC_S_EXT_CTRLS` may be =
used
> +   interchangeably with :c:func:`VIDIOC_G_CTRL` and :c:func:`VIDIOC_S_CT=
RL`,
> +   unless specified otherwise.
> +
> +5. Single-planar API (see :ref:`planar-apis`) and applicable structures =
may be
> +   used interchangeably with multi-planar API, unless specified otherwis=
e,
> +   depending on decoder capabilities and following the general V4L2 guid=
elines.
> +
> +6. i =3D [a..b]: sequence of integers from a to b, inclusive, i.e. i =3D
> +   [0..2]: i =3D 0, 1, 2.
> +
> +7. Given an ``OUTPUT`` buffer A, then A=E2=80=99 represents a buffer on =
the ``CAPTURE``
> +   queue containing data that resulted from processing buffer A.
> +
> +.. _decoder-glossary:
> +
> +Glossary
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +CAPTURE
> +   the destination buffer queue; for decoders, the queue of buffers cont=
aining
> +   decoded frames; for encoders, the queue of buffers containing an enco=
ded
> +   bitstream; ``V4L2_BUF_TYPE_VIDEO_CAPTURE`` or
> +   ``V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE``; data is captured from the har=
dware
> +   into ``CAPTURE`` buffers.
> +
> +client
> +   the application communicating with the decoder or encoder implementin=
g
> +   this interface.
> +
> +coded format
> +   encoded/compressed video bitstream format (e.g. H.264, VP8, etc.); se=
e
> +   also: raw format.
> +
> +coded height
> +   height for given coded resolution.
> +
> +coded resolution
> +   stream resolution in pixels aligned to codec and hardware requirement=
s;
> +   typically visible resolution rounded up to full macroblocks;
> +   see also: visible resolution.
> +
> +coded width
> +   width for given coded resolution.
> +
> +decode order
> +   the order in which frames are decoded; may differ from display order =
if the
> +   coded format includes a feature of frame reordering; for decoders,
> +   ``OUTPUT`` buffers must be queued by the client in decode order; for
> +   encoders ``CAPTURE`` buffers must be returned by the encoder in decod=
e order.
> +
> +destination
> +   data resulting from the decode process; see ``CAPTURE``.
> +
> +display order
> +   the order in which frames must be displayed; for encoders, ``OUTPUT``
> +   buffers must be queued by the client in display order; for decoders,
> +   ``CAPTURE`` buffers must be returned by the decoder in display order.
> +
> +DPB
> +   Decoded Picture Buffer; an H.264/HEVC term for a buffer that stores a=
 decoded
> +   raw frame available for reference in further decoding steps.
> +
> +EOS
> +   end of stream.
> +
> +IDR
> +   Instantaneous Decoder Refresh; a type of a keyframe in an H.264/HEVC-=
encoded
> +   stream, which clears the list of earlier reference frames (DPBs).
> +
> +keyframe
> +   an encoded frame that does not reference frames decoded earlier, i.e.
> +   can be decoded fully on its own.
> +
> +macroblock
> +   a processing unit in image and video compression formats based on lin=
ear
> +   block transforms (e.g. H.264, VP8, VP9); codec-specific, but for most=
 of
> +   popular codecs the size is 16x16 samples (pixels).
> +
> +OUTPUT
> +   the source buffer queue; for decoders, the queue of buffers containin=
g
> +   an encoded bitstream; for encoders, the queue of buffers containing r=
aw
> +   frames; ``V4L2_BUF_TYPE_VIDEO_OUTPUT`` or
> +   ``V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE``; the hardware is fed with data
> +   from ``OUTPUT`` buffers.
> +
> +PPS
> +   Picture Parameter Set; a type of metadata entity in an H.264/HEVC bit=
stream.
> +
> +raw format
> +   uncompressed format containing raw pixel data (e.g. YUV, RGB formats)=
.
> +
> +resume point
> +   a point in the bitstream from which decoding may start/continue, with=
out
> +   any previous state/data present, e.g.: a keyframe (VP8/VP9) or
> +   SPS/PPS/IDR sequence (H.264/HEVC); a resume point is required to star=
t decode
> +   of a new stream, or to resume decoding after a seek.
> +
> +source
> +   data fed to the decoder or encoder; see ``OUTPUT``.
> +
> +source height
> +   height in pixels for given source resolution; relevant to encoders on=
ly.
> +
> +source resolution
> +   resolution in pixels of source frames being source to the encoder and
> +   subject to further cropping to the bounds of visible resolution; rele=
vant to
> +   encoders only.
> +
> +source width
> +   width in pixels for given source resolution; relevant to encoders onl=
y.
> +
> +SPS
> +   Sequence Parameter Set; a type of metadata entity in an H.264/HEVC bi=
tstream.
> +
> +stream metadata
> +   additional (non-visual) information contained inside encoded bitstrea=
m;
> +   for example: coded resolution, visible resolution, codec profile.
> +
> +visible height
> +   height for given visible resolution; display height.
> +
> +visible resolution
> +   stream resolution of the visible picture, in pixels, to be used for
> +   display purposes; must be smaller or equal to coded resolution;
> +   display resolution.
> +
> +visible width
> +   width for given visible resolution; display width.
> +
> +State machine
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. kernel-render:: DOT
> +   :alt: DOT digraph of decoder state machine
> +   :caption: Decoder state machine
> +
> +   digraph decoder_state_machine {
> +       node [shape =3D doublecircle, label=3D"Decoding"] Decoding;
> +
> +       node [shape =3D circle, label=3D"Initialization"] Initialization;
> +       node [shape =3D circle, label=3D"Capture\nsetup"] CaptureSetup;
> +       node [shape =3D circle, label=3D"Dynamic\nresolution\nchange"] Re=
sChange;
> +       node [shape =3D circle, label=3D"Stopped"] Stopped;
> +       node [shape =3D circle, label=3D"Drain"] Drain;
> +       node [shape =3D circle, label=3D"Seek"] Seek;
> +       node [shape =3D circle, label=3D"End of stream"] EoS;
> +
> +       node [shape =3D point]; qi
> +       qi -> Initialization [ label =3D "open()" ];
> +
> +       Initialization -> CaptureSetup [ label =3D "CAPTURE\nformat\nesta=
blished" ];
> +
> +       CaptureSetup -> Stopped [ label =3D "CAPTURE\nbuffers\nready" ];
> +
> +       Decoding -> ResChange [ label =3D "Stream\nresolution\nchange" ];
> +       Decoding -> Drain [ label =3D "V4L2_DEC_CMD_STOP" ];
> +       Decoding -> EoS [ label =3D "EoS mark\nin the stream" ];
> +       Decoding -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> +       Decoding -> Stopped [ label =3D "VIDIOC_STREAMOFF(CAPTURE)" ];
> +       Decoding -> Decoding;
> +
> +       ResChange -> CaptureSetup [ label =3D "CAPTURE\nformat\nestablish=
ed" ];
> +       ResChange -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> +
> +       EoS -> Drain [ label =3D "Implicit\ndrain" ];
> +
> +       Drain -> Stopped [ label =3D "All CAPTURE\nbuffers dequeued\nor\n=
VIDIOC_STREAMOFF(CAPTURE)" ];
> +       Drain -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> +
> +       Seek -> Decoding [ label =3D "VIDIOC_STREAMON(OUTPUT)" ];
> +       Seek -> Initialization [ label =3D "VIDIOC_REQBUFS(OUTPUT, 0)" ];
> +
> +       Stopped -> Decoding [ label =3D "V4L2_DEC_CMD_START\nor\nVIDIOC_S=
TREAMON(CAPTURE)" ];
> +       Stopped -> Seek [ label =3D "VIDIOC_STREAMOFF(OUTPUT)" ];
> +   }
> +
> +Querying capabilities
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +1. To enumerate the set of coded formats supported by the decoder, the
> +   client may call :c:func:`VIDIOC_ENUM_FMT` on ``OUTPUT``.
> +
> +   * The full set of supported formats will be returned, regardless of t=
he
> +     format set on ``CAPTURE``.
> +
> +2. To enumerate the set of supported raw formats, the client may call
> +   :c:func:`VIDIOC_ENUM_FMT` on ``CAPTURE``.
> +
> +   * Only the formats supported for the format currently active on ``OUT=
PUT``
> +     will be returned.
> +
> +   * In order to enumerate raw formats supported by a given coded format=
,
> +     the client must first set that coded format on ``OUTPUT`` and then
> +     enumerate formats on ``CAPTURE``.
> +
> +3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect support=
ed
> +   resolutions for a given format, passing desired pixel format in
> +   :c:type:`v4l2_frmsizeenum` ``pixel_format``.
> +
> +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a coded pix=
el
> +     format will include all possible coded resolutions supported by the
> +     decoder for given coded pixel format.
> +
> +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a raw pixel=
 format
> +     will include all possible frame buffer resolutions supported by the
> +     decoder for given raw pixel format and the coded format currently s=
et on
> +     ``OUTPUT``.
> +
> +4. Supported profiles and levels for the coded format currently set on
> +   ``OUTPUT``, if applicable, may be queried using their respective cont=
rols
> +   via :c:func:`VIDIOC_QUERYCTRL`.
> +
> +Initialization
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +1. Set the coded format on ``OUTPUT`` via :c:func:`VIDIOC_S_FMT`
> +
> +   * **Required fields:**
> +
> +     ``type``
> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> +
> +     ``pixelformat``
> +         a coded pixel format.
> +
> +     ``width``, ``height``
> +         coded resolution of the stream; required only if it cannot be p=
arsed
> +         from the stream for the given coded format; otherwise the decod=
er will
> +         use this resolution as a placeholder resolution that will likel=
y change
> +         as soon as it can parse the actual coded resolution from the st=
ream.
> +
> +     ``sizeimage``
> +         desired size of ``OUTPUT`` buffers; the decoder may adjust it t=
o
> +         match hardware requirements.
> +
> +     other fields
> +         follow standard semantics.
> +
> +   * **Return fields:**
> +
> +     ``sizeimage``
> +         adjusted size of ``OUTPUT`` buffers.
> +
> +   * The ``CAPTURE`` format will be updated with an appropriate frame bu=
ffer
> +     resolution instantly based on the width and height returned by
> +     :c:func:`VIDIOC_S_FMT`.
> +     However, for coded formats that include stream resolution informati=
on,
> +     after the decoder is done parsing the information from the stream, =
it will
> +     update the ``CAPTURE`` format with new values and signal a source c=
hange
> +     event, regardless of whether they match the values set by the clien=
t or
> +     not.
> +
> +   .. important::
> +
> +      Changing the ``OUTPUT`` format may change the currently set ``CAPT=
URE``
> +      format. How the new ``CAPTURE`` format is determined is up to the =
decoder
> +      and the client must ensure it matches its needs afterwards.
> +
> +2.  Allocate source (bitstream) buffers via :c:func:`VIDIOC_REQBUFS` on
> +    ``OUTPUT``.
> +
> +    * **Required fields:**
> +
> +      ``count``
> +          requested number of buffers to allocate; greater than zero.
> +
> +      ``type``
> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> +
> +      ``memory``
> +          follows standard semantics.
> +
> +    * **Return fields:**
> +
> +      ``count``
> +          the actual number of buffers allocated.
> +
> +    .. warning::
> +
> +       The actual number of allocated buffers may differ from the ``coun=
t``
> +       given. The client must check the updated value of ``count`` after=
 the
> +       call returns.
> +
> +    Alternatively, :c:func:`VIDIOC_CREATE_BUFS` on the ``OUTPUT`` queue =
can be
> +    used to have more control over buffer allocation.
> +
> +    * **Required fields:**
> +
> +      ``count``
> +          requested number of buffers to allocate; greater than zero.
> +
> +      ``type``
> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> +
> +      ``memory``
> +          follows standard semantics.
> +
> +      ``format``
> +          follows standard semantics.
> +
> +    * **Return fields:**
> +
> +      ``count``
> +          adjusted to the number of allocated buffers.
> +
> +    .. warning::
> +
> +       The actual number of allocated buffers may differ from the ``coun=
t``
> +       given. The client must check the updated value of ``count`` after=
 the
> +       call returns.
> +
> +3.  Start streaming on the ``OUTPUT`` queue via :c:func:`VIDIOC_STREAMON=
`.
> +
> +4.  **This step only applies to coded formats that contain resolution in=
formation
> +    in the stream.** Continue queuing/dequeuing bitstream buffers to/fro=
m the
> +    ``OUTPUT`` queue via :c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQBUF=
`. The
> +    buffers will be processed and returned to the client in order, until
> +    required metadata to configure the ``CAPTURE`` queue are found. This=
 is
> +    indicated by the decoder sending a ``V4L2_EVENT_SOURCE_CHANGE`` even=
t with
> +    ``changes`` set to ``V4L2_EVENT_SRC_CH_RESOLUTION``.
> +
> +    * It is not an error if the first buffer does not contain enough dat=
a for
> +      this to occur. Processing of the buffers will continue as long as =
more
> +      data is needed.
> +
> +    * If data in a buffer that triggers the event is required to decode =
the
> +      first frame, it will not be returned to the client, until the
> +      initialization sequence completes and the frame is decoded.
> +
> +    * If the client has not set the coded resolution of the stream on it=
s own,
> +      calling :c:func:`VIDIOC_G_FMT`, :c:func:`VIDIOC_S_FMT`,
> +      :c:func:`VIDIOC_TRY_FMT` or :c:func:`VIDIOC_REQBUFS` on the ``CAPT=
URE``
> +      queue will not return the real values for the stream until a
> +      ``V4L2_EVENT_SOURCE_CHANGE`` event is signaled.
> +
> +    .. important::
> +
> +       Any client query issued after the decoder queues the event will r=
eturn
> +       values applying to the just parsed stream, including queue format=
s,
> +       selection rectangles and controls.
> +
> +    .. note::
> +
> +       A client capable of acquiring stream parameters from the bitstrea=
m on
> +       its own may attempt to set the width and height of the ``OUTPUT``=
 format
> +       to non-zero values matching the coded size of the stream, skip th=
is step
> +       and continue with the `Capture setup` sequence. However, it must =
not
> +       rely on any driver queries regarding stream parameters, such as
> +       selection rectangles and controls, since the decoder has not pars=
ed them
> +       from the stream yet. If the values configured by the client do no=
t match
> +       those parsed by the decoder, a `Dynamic resolution change` will b=
e
> +       triggered to reconfigure them.
> +
> +    .. note::
> +
> +       No decoded frames are produced during this phase.
> +
> +5.  Continue with the `Capture setup` sequence.
> +
> +Capture setup
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +1.  Call :c:func:`VIDIOC_G_FMT` on the ``CAPTURE`` queue to get format f=
or the
> +    destination buffers parsed/decoded from the bitstream.
> +
> +    * **Required fields:**
> +
> +      ``type``
> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> +
> +    * **Return fields:**
> +
> +      ``width``, ``height``
> +          frame buffer resolution for the decoded frames.
> +
> +      ``pixelformat``
> +          pixel format for decoded frames.
> +
> +      ``num_planes`` (for _MPLANE ``type`` only)
> +          number of planes for pixelformat.
> +
> +      ``sizeimage``, ``bytesperline``
> +          as per standard semantics; matching frame buffer format.
> +
> +    .. note::
> +
> +       The value of ``pixelformat`` may be any pixel format supported by=
 the
> +       decoder for the current stream. The decoder should choose a
> +       preferred/optimal format for the default configuration. For examp=
le, a
> +       YUV format may be preferred over an RGB format if an additional
> +       conversion step would be required for the latter.
> +
> +2.  **Optional.** Acquire the visible resolution via
> +    :c:func:`VIDIOC_G_SELECTION`.
> +
> +    * **Required fields:**
> +
> +      ``type``
> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> +
> +      ``target``
> +          set to ``V4L2_SEL_TGT_COMPOSE``.
> +
> +    * **Return fields:**
> +
> +      ``r.left``, ``r.top``, ``r.width``, ``r.height``
> +          the visible rectangle; it must fit within the frame buffer res=
olution
> +          returned by :c:func:`VIDIOC_G_FMT` on ``CAPTURE``.
> +
> +    * The following selection targets are supported on ``CAPTURE``:
> +
> +      ``V4L2_SEL_TGT_CROP_BOUNDS``
> +          corresponds to the coded resolution of the stream.
> +
> +      ``V4L2_SEL_TGT_CROP_DEFAULT``
> +          the rectangle covering the part of the ``CAPTURE`` buffer that
> +          contains meaningful picture data (visible area); width and hei=
ght
> +          will be equal to the visible resolution of the stream.
> +
> +      ``V4L2_SEL_TGT_CROP``
> +          the rectangle within the coded resolution to be output to
> +          ``CAPTURE``; defaults to ``V4L2_SEL_TGT_CROP_DEFAULT``; read-o=
nly on
> +          hardware without additional compose/scaling capabilities.
> +
> +      ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
> +          the maximum rectangle within a ``CAPTURE`` buffer, which the c=
ropped
> +          frame can be composed into; equal to ``V4L2_SEL_TGT_CROP`` if =
the
> +          hardware does not support compose/scaling.
> +
> +      ``V4L2_SEL_TGT_COMPOSE_DEFAULT``
> +          equal to ``V4L2_SEL_TGT_CROP``.
> +
> +      ``V4L2_SEL_TGT_COMPOSE``
> +          the rectangle inside a ``CAPTURE`` buffer into which the cropp=
ed
> +          frame is written; defaults to ``V4L2_SEL_TGT_COMPOSE_DEFAULT``=
;
> +          read-only on hardware without additional compose/scaling capab=
ilities.
> +
> +      ``V4L2_SEL_TGT_COMPOSE_PADDED``
> +          the rectangle inside a ``CAPTURE`` buffer which is overwritten=
 by the
> +          hardware; equal to ``V4L2_SEL_TGT_COMPOSE`` if the hardware do=
es not
> +          write padding pixels.
> +
> +    .. warning::
> +
> +       The values are guaranteed to be meaningful only after the decoder
> +       successfully parses the stream metadata. The client must not rely=
 on the
> +       query before that happens.
> +
> +3.  **Optional.** Enumerate ``CAPTURE`` formats via :c:func:`VIDIOC_ENUM=
_FMT` on
> +    the ``CAPTURE`` queue. Once the stream information is parsed and kno=
wn, the
> +    client may use this ioctl to discover which raw formats are supporte=
d for
> +    given stream and select one of them via :c:func:`VIDIOC_S_FMT`.
> +
> +    .. important::
> +
> +       The decoder will return only formats supported for the currently
> +       established coded format, as per the ``OUTPUT`` format and/or str=
eam
> +       metadata parsed in this initialization sequence, even if more for=
mats
> +       may be supported by the decoder in general. In other words, the s=
et
> +       returned will be a subset of the initial query mentioned in the
> +       `Querying capabilities` section.
> +
> +       For example, a decoder may support YUV and RGB formats for resolu=
tions
> +       1920x1088 and lower, but only YUV for higher resolutions (due to
> +       hardware limitations). After parsing a resolution of 1920x1088 or=
 lower,
> +       :c:func:`VIDIOC_ENUM_FMT` may return a set of YUV and RGB pixel f=
ormats,
> +       but after parsing resolution higher than 1920x1088, the decoder w=
ill not
> +       return RGB, unsupported for this resolution.
> +
> +       However, subsequent resolution change event triggered after
> +       discovering a resolution change within the same stream may switch
> +       the stream into a lower resolution and :c:func:`VIDIOC_ENUM_FMT`
> +       would return RGB formats again in that case.
> +
> +4.  **Optional.** Set the ``CAPTURE`` format via :c:func:`VIDIOC_S_FMT` =
on the
> +    ``CAPTURE`` queue. The client may choose a different format than
> +    selected/suggested by the decoder in :c:func:`VIDIOC_G_FMT`.
> +
> +    * **Required fields:**
> +
> +      ``type``
> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> +
> +      ``pixelformat``
> +          a raw pixel format.
> +
> +   * Setting the ``CAPTURE`` format will reset the compose selection rec=
tangles
> +     to their default values, based on the new resolution, as described =
in the
> +     previous step.
> +
> +5. **Optional.** Set the compose rectangle via :c:func:`VIDIOC_S_SELECTI=
ON` on
> +   the ``CAPTURE`` queue if it is desired and if the decoder has compose=
 and/or
> +   scaling capabilities.
> +
> +   * **Required fields:**
> +
> +     ``type``
> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> +
> +     ``target``
> +         set to ``V4L2_SEL_TGT_COMPOSE``.
> +
> +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> +         the rectangle inside a ``CAPTURE`` buffer into which the croppe=
d
> +         frame is written; defaults to ``V4L2_SEL_TGT_COMPOSE_DEFAULT``;
> +         read-only on hardware without additional compose/scaling capabi=
lities.
> +
> +   * **Return fields:**
> +
> +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> +         the visible rectangle; it must fit within the frame buffer reso=
lution
> +         returned by :c:func:`VIDIOC_G_FMT` on ``CAPTURE``.
> +
> +   .. warning::
> +
> +      The decoder may adjust the compose rectangle to the nearest
> +      supported one to meet codec and hardware requirements. The client =
needs
> +      to check the adjusted rectangle returned by :c:func:`VIDIOC_S_SELE=
CTION`.
> +
> +6.  If all the following conditions are met, the client may resume the d=
ecoding
> +    instantly:
> +
> +    * ``sizeimage`` of the new format (determined in previous steps) is =
less
> +      than or equal to the size of currently allocated buffers,
> +
> +    * the number of buffers currently allocated is greater than or equal=
 to the
> +      minimum number of buffers acquired in previous steps. To fulfill t=
his
> +      requirement, the client may use :c:func:`VIDIOC_CREATE_BUFS` to ad=
d new
> +      buffers.
> +
> +    In that case, the remaining steps do not apply and the client may re=
sume
> +    the decoding by one of the following actions:
> +
> +    * if the ``CAPTURE`` queue is streaming, call :c:func:`VIDIOC_DECODE=
R_CMD`
> +      with the ``V4L2_DEC_CMD_START`` command,
> +
> +    * if the ``CAPTURE`` queue is not streaming, call :c:func:`VIDIOC_ST=
REAMON`
> +      on the ``CAPTURE`` queue.
> +
> +    However, if the client intends to change the buffer set, to lower
> +    memory usage or for any other reasons, it may be achieved by followi=
ng
> +    the steps below.
> +
> +7.  **If the** ``CAPTURE`` **queue is streaming,** keep queuing and dequ=
euing
> +    buffers on the ``CAPTURE`` queue until a buffer marked with the
> +    ``V4L2_BUF_FLAG_LAST`` flag is dequeued.
> +
> +8.  **If the** ``CAPTURE`` **queue is streaming,** call :c:func:`VIDIOC_=
STREAMOFF`
> +    on the ``CAPTURE`` queue to stop streaming.
> +
> +    .. warning::
> +
> +       The ``OUTPUT`` queue must remain streaming. Calling
> +       :c:func:`VIDIOC_STREAMOFF` on it would abort the sequence and tri=
gger a
> +       seek.
> +
> +9.  **If the** ``CAPTURE`` **queue has buffers allocated,** free the ``C=
APTURE``
> +    buffers using :c:func:`VIDIOC_REQBUFS`.
> +
> +    * **Required fields:**
> +
> +      ``count``
> +          set to 0.
> +
> +      ``type``
> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> +
> +      ``memory``
> +          follows standard semantics.
> +
> +10. Allocate ``CAPTURE`` buffers via :c:func:`VIDIOC_REQBUFS` on the
> +    ``CAPTURE`` queue.
> +
> +    * **Required fields:**
> +
> +      ``count``
> +          requested number of buffers to allocate; greater than zero.
> +
> +      ``type``
> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> +
> +      ``memory``
> +          follows standard semantics.
> +
> +    * **Return fields:**
> +
> +      ``count``
> +          actual number of buffers allocated.
> +
> +    .. warning::
> +
> +       The actual number of allocated buffers may differ from the ``coun=
t``
> +       given. The client must check the updated value of ``count`` after=
 the
> +       call returns.
> +
> +    .. note::
> +
> +       To allocate more than the minimum number of buffers (for pipeline
> +       depth), the client may query the ``V4L2_CID_MIN_BUFFERS_FOR_CAPTU=
RE``
> +       control to get the minimum number of buffers required, and pass t=
he
> +       obtained value plus the number of additional buffers needed in th=
e
> +       ``count`` field to :c:func:`VIDIOC_REQBUFS`.
> +
> +    Alternatively, :c:func:`VIDIOC_CREATE_BUFS` on the ``CAPTURE`` queue=
 can be
> +    used to have more control over buffer allocation. For example, by
> +    allocating buffers larger than the current ``CAPTURE`` format, futur=
e
> +    resolution changes can be accommodated.
> +
> +    * **Required fields:**
> +
> +      ``count``
> +          requested number of buffers to allocate; greater than zero.
> +
> +      ``type``
> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> +
> +      ``memory``
> +          follows standard semantics.
> +
> +      ``format``
> +          a format representing the maximum framebuffer resolution to be
> +          accommodated by newly allocated buffers.
> +
> +    * **Return fields:**
> +
> +      ``count``
> +          adjusted to the number of allocated buffers.
> +
> +    .. warning::
> +
> +        The actual number of allocated buffers may differ from the ``cou=
nt``
> +        given. The client must check the updated value of ``count`` afte=
r the
> +        call returns.
> +
> +    .. note::
> +
> +       To allocate buffers for a format different than parsed from the s=
tream
> +       metadata, the client must proceed as follows, before the metadata
> +       parsing is initiated:
> +
> +       * set width and height of the ``OUTPUT`` format to desired coded =
resolution to
> +         let the decoder configure the ``CAPTURE`` format appropriately,
> +
> +       * query the ``CAPTURE`` format using :c:func:`VIDIOC_G_FMT` and s=
ave it
> +         until this step.
> +
> +       The format obtained in the query may be then used with
> +       :c:func:`VIDIOC_CREATE_BUFS` in this step to allocate the buffers=
.
> +
> +11. Call :c:func:`VIDIOC_STREAMON` on the ``CAPTURE`` queue to start dec=
oding
> +    frames.
> +
> +Decoding
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This state is reached after the `Capture setup` sequence finishes succes=
sfully.
> +In this state, the client queues and dequeues buffers to both queues via
> +:c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQBUF`, following the standard
> +semantics.
> +
> +The content of the source ``OUTPUT`` buffers depends on the active coded=
 pixel
> +format and may be affected by codec-specific extended controls, as state=
d in
> +the documentation of each format.
> +
> +Both queues operate independently, following the standard behavior of V4=
L2
> +buffer queues and memory-to-memory devices. In addition, the order of de=
coded
> +frames dequeued from the ``CAPTURE`` queue may differ from the order of =
queuing
> +coded frames to the ``OUTPUT`` queue, due to properties of the selected =
coded
> +format, e.g. frame reordering.
> +
> +The client must not assume any direct relationship between ``CAPTURE``
> +and ``OUTPUT`` buffers and any specific timing of buffers becoming
> +available to dequeue. Specifically:
> +
> +* a buffer queued to ``OUTPUT`` may result in no buffers being produced
> +  on ``CAPTURE`` (e.g. if it does not contain encoded data, or if only
> +  metadata syntax structures are present in it),
> +
> +* a buffer queued to ``OUTPUT`` may result in more than one buffer produ=
ced
> +  on ``CAPTURE`` (if the encoded data contained more than one frame, or =
if
> +  returning a decoded frame allowed the decoder to return a frame that
> +  preceded it in decode, but succeeded it in the display order),
> +
> +* a buffer queued to ``OUTPUT`` may result in a buffer being produced on
> +  ``CAPTURE`` later into decode process, and/or after processing further
> +  ``OUTPUT`` buffers, or be returned out of order, e.g. if display
> +  reordering is used,
> +
> +* buffers may become available on the ``CAPTURE`` queue without addition=
al
> +  buffers queued to ``OUTPUT`` (e.g. during drain or ``EOS``), because o=
f the
> +  ``OUTPUT`` buffers queued in the past whose decoding results are only
> +  available at later time, due to specifics of the decoding process.
> +
> +.. note::
> +
> +   To allow matching decoded ``CAPTURE`` buffers with ``OUTPUT`` buffers=
 they
> +   originated from, the client can set the ``timestamp`` field of the
> +   :c:type:`v4l2_buffer` struct when queuing an ``OUTPUT`` buffer. The
> +   ``CAPTURE`` buffer(s), which resulted from decoding that ``OUTPUT`` b=
uffer
> +   will have their ``timestamp`` field set to the same value when dequeu=
ed.
> +
> +   In addition to the straightforward case of one ``OUTPUT`` buffer prod=
ucing
> +   one ``CAPTURE`` buffer, the following cases are defined:
> +
> +   * one ``OUTPUT`` buffer generates multiple ``CAPTURE`` buffers: the s=
ame
> +     ``OUTPUT`` timestamp will be copied to multiple ``CAPTURE`` buffers=
.
> +
> +   * multiple ``OUTPUT`` buffers generate one ``CAPTURE`` buffer: timest=
amp of
> +     the ``OUTPUT`` buffer queued last will be copied.

I'd like to propose to change this into " timestamp of the OUTPUT
buffer queued first will be copied". The rationale is the following, if
you have an OUTPUT buffer that is unaligned in the following form:

  [ remaining | complete frame ]

The remaining data is the last bits of the current frame. So it should
share a timestamp with the bits that came before. But then you have
another frame which by accident could fit entirely in your buffer. With
the last approach, it is not possible to give that frame a timestamp.

The first approach fixes this problem. If there was a remaining on the
very first buffer, it will be dropped anyway, so it also work for this
case. This modification is aligned with MPEG TS container specification
which says the the timestamp of the packet applies to the first ES
packet that starts, the remaining bits will reuse the previous packet
timestamp. The rest is common sense, e.g. the same ES packet should
only have one timestamp etc.

> +
> +   * the decoding order differs from the display order (i.e. the ``CAPTU=
RE``
> +     buffers are out-of-order compared to the ``OUTPUT`` buffers): ``CAP=
TURE``
> +     timestamps will not retain the order of ``OUTPUT`` timestamps.
> +
> +During the decoding, the decoder may initiate one of the special sequenc=
es, as
> +listed below. The sequences will result in the decoder returning all the
> +``CAPTURE`` buffers that originated from all the ``OUTPUT`` buffers proc=
essed
> +before the sequence started. Last of the buffers will have the
> +``V4L2_BUF_FLAG_LAST`` flag set. To determine the sequence to follow, th=
e client
> +must check if there is any pending event and:
> +
> +* if a ``V4L2_EVENT_SOURCE_CHANGE`` event is pending, the `Dynamic resol=
ution
> +  change` sequence needs to be followed,
> +
> +* if a ``V4L2_EVENT_EOS`` event is pending, the `End of stream` sequence=
 needs
> +  to be followed.
> +
> +Some of the sequences can be intermixed with each other and need to be h=
andled
> +as they happen. The exact operation is documented for each sequence.
> +
> +Should a decoding error occur, it will be reported to the client with th=
e level
> +of details depending on the decoder capabilities. Specifically:
> +
> +* the CAPTURE buffer that contains the results of the failed decode oper=
ation
> +  will be returned with the V4L2_BUF_FLAG_ERROR flag set,
> +
> +* if the decoder is able to precisely report the OUTPUT buffer that trig=
gered
> +  the error, such buffer will be returned with the V4L2_BUF_FLAG_ERROR f=
lag
> +  set.
> +
> +In case of a fatal failure that does not allow the decoding to continue,=
 any
> +further operations on corresponding decoder file handle will return the =
-EIO
> +error code. The client may close the file handle and open a new one, or
> +alternatively reinitialize the instance by stopping streaming on both qu=
eues,
> +releasing all buffers and performing the Initialization sequence again.
> +
> +Seek
> +=3D=3D=3D=3D
> +
> +Seek is controlled by the ``OUTPUT`` queue, as it is the source of coded=
 data.
> +The seek does not require any specific operation on the ``CAPTURE`` queu=
e, but
> +it may be affected as per normal decoder operation.
> +
> +1. Stop the ``OUTPUT`` queue to begin the seek sequence via
> +   :c:func:`VIDIOC_STREAMOFF`.
> +
> +   * **Required fields:**
> +
> +     ``type``
> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> +
> +   * The decoder will drop all the pending ``OUTPUT`` buffers and they m=
ust be
> +     treated as returned to the client (following standard semantics).
> +
> +2. Restart the ``OUTPUT`` queue via :c:func:`VIDIOC_STREAMON`
> +
> +   * **Required fields:**
> +
> +     ``type``
> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> +
> +   * The decoder will start accepting new source bitstream buffers after=
 the
> +     call returns.
> +
> +3. Start queuing buffers containing coded data after the seek to the ``O=
UTPUT``
> +   queue until a suitable resume point is found.
> +
> +   .. note::
> +
> +      There is no requirement to begin queuing coded data starting exact=
ly
> +      from a resume point (e.g. SPS or a keyframe). Any queued ``OUTPUT`=
`
> +      buffers will be processed and returned to the client until a suita=
ble
> +      resume point is found.  While looking for a resume point, the deco=
der
> +      should not produce any decoded frames into ``CAPTURE`` buffers.
> +
> +      Some hardware is known to mishandle seeks to a non-resume point. S=
uch an
> +      operation may result in an unspecified number of corrupted decoded=
 frames
> +      being made available on the ``CAPTURE`` queue. Drivers must ensure=
 that
> +      no fatal decoding errors or crashes occur, and implement any neces=
sary
> +      handling and workarounds for hardware issues related to seek opera=
tions.
> +
> +   .. warning::
> +
> +      In case of the H.264/HEVC codec, the client must take care not to =
seek
> +      over a change of SPS/PPS. Even though the target frame could be a
> +      keyframe, the stale SPS/PPS inside decoder state would lead to und=
efined
> +      results when decoding. Although the decoder must handle that case =
without
> +      a crash or a fatal decode error, the client must not expect a sens=
ible
> +      decode output.
> +
> +      If the hardware can detect such corrupted decoded frames, then
> +      corresponding buffers will be returned to the client with the
> +      V4L2_BUF_FLAG_ERROR set. See the `Decoding` section for further
> +      description of decode error reporting.
> +
> +4. After a resume point is found, the decoder will start returning ``CAP=
TURE``
> +   buffers containing decoded frames.
> +
> +.. important::
> +
> +   A seek may result in the `Dynamic resolution change` sequence being
> +   initiated, due to the seek target having decoding parameters differen=
t from
> +   the part of the stream decoded before the seek. The sequence must be =
handled
> +   as per normal decoder operation.
> +
> +.. warning::
> +
> +   It is not specified when the ``CAPTURE`` queue starts producing buffe=
rs
> +   containing decoded data from the ``OUTPUT`` buffers queued after the =
seek,
> +   as it operates independently from the ``OUTPUT`` queue.
> +
> +   The decoder may return a number of remaining ``CAPTURE`` buffers cont=
aining
> +   decoded frames originating from the ``OUTPUT`` buffers queued before =
the
> +   seek sequence is performed.
> +
> +   The ``VIDIOC_STREAMOFF`` operation discards any remaining queued
> +   ``OUTPUT`` buffers, which means that not all of the ``OUTPUT`` buffer=
s
> +   queued before the seek sequence may have matching ``CAPTURE`` buffers
> +   produced.  For example, given the sequence of operations on the
> +   ``OUTPUT`` queue:
> +
> +     QBUF(A), QBUF(B), STREAMOFF(), STREAMON(), QBUF(G), QBUF(H),
> +
> +   any of the following results on the ``CAPTURE`` queue is allowed:
> +
> +     {A=E2=80=99, B=E2=80=99, G=E2=80=99, H=E2=80=99}, {A=E2=80=99, G=E2=
=80=99, H=E2=80=99}, {G=E2=80=99, H=E2=80=99}.
> +
> +   To determine the CAPTURE buffer containing the first decoded frame af=
ter the
> +   seek, the client may observe the timestamps to match the CAPTURE and =
OUTPUT
> +   buffers or use V4L2_DEC_CMD_STOP and V4L2_DEC_CMD_START to drain the
> +   decoder.
> +
> +.. note::
> +
> +   To achieve instantaneous seek, the client may restart streaming on th=
e
> +   ``CAPTURE`` queue too to discard decoded, but not yet dequeued buffer=
s.
> +
> +Dynamic resolution change
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +Streams that include resolution metadata in the bitstream may require sw=
itching
> +to a different resolution during the decoding.
> +
> +The sequence starts when the decoder detects a coded frame with one or m=
ore of
> +the following parameters different from those previously established (an=
d
> +reflected by corresponding queries):
> +
> +* coded resolution (``OUTPUT`` width and height),
> +
> +* visible resolution (selection rectangles),
> +
> +* the minimum number of buffers needed for decoding.
> +
> +Whenever that happens, the decoder must proceed as follows:
> +
> +1.  After encountering a resolution change in the stream, the decoder se=
nds a
> +    ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
> +    ``V4L2_EVENT_SRC_CH_RESOLUTION``.
> +
> +    .. important::
> +
> +       Any client query issued after the decoder queues the event will r=
eturn
> +       values applying to the stream after the resolution change, includ=
ing
> +       queue formats, selection rectangles and controls.
> +
> +2.  The decoder will then process and decode all remaining buffers from =
before
> +    the resolution change point.
> +
> +    * The last buffer from before the change must be marked with the
> +      ``V4L2_BUF_FLAG_LAST`` flag, similarly to the `Drain` sequence abo=
ve.
> +
> +    .. warning::
> +
> +       The last buffer may be empty (with :c:type:`v4l2_buffer` ``bytesu=
sed``
> +       =3D 0) and in that case it must be ignored by the client, as it d=
oes not
> +       contain a decoded frame.
> +
> +    .. note::
> +
> +       Any attempt to dequeue more ``CAPTURE`` buffers beyond the buffer=
 marked
> +       with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE error from
> +       :c:func:`VIDIOC_DQBUF`.
> +
> +The client must continue the sequence as described below to continue the
> +decoding process.
> +
> +1.  Dequeue the source change event.
> +
> +    .. important::
> +
> +       A source change triggers an implicit decoder drain, similar to th=
e
> +       explicit `Drain` sequence. The decoder is stopped after it comple=
tes.
> +       The decoding process must be resumed with either a pair of calls =
to
> +       :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
> +       ``CAPTURE`` queue, or a call to :c:func:`VIDIOC_DECODER_CMD` with=
 the
> +       ``V4L2_DEC_CMD_START`` command.
> +
> +2.  Continue with the `Capture setup` sequence.
> +
> +.. note::
> +
> +   During the resolution change sequence, the ``OUTPUT`` queue must rema=
in
> +   streaming. Calling :c:func:`VIDIOC_STREAMOFF` on the ``OUTPUT`` queue=
 would
> +   abort the sequence and initiate a seek.
> +
> +   In principle, the ``OUTPUT`` queue operates separately from the ``CAP=
TURE``
> +   queue and this remains true for the duration of the entire resolution=
 change
> +   sequence as well.
> +
> +   The client should, for best performance and simplicity, keep queuing/=
dequeuing
> +   buffers to/from the ``OUTPUT`` queue even while processing this seque=
nce.
> +
> +Drain
> +=3D=3D=3D=3D=3D
> +
> +To ensure that all queued ``OUTPUT`` buffers have been processed and rel=
ated
> +``CAPTURE`` buffers are given to the client, the client must follow the =
drain
> +sequence described below. After the drain sequence ends, the client has
> +received all decoded frames for all ``OUTPUT`` buffers queued before the
> +sequence was started.
> +
> +1. Begin drain by issuing :c:func:`VIDIOC_DECODER_CMD`.
> +
> +   * **Required fields:**
> +
> +     ``cmd``
> +         set to ``V4L2_DEC_CMD_STOP``.
> +
> +     ``flags``
> +         set to 0.
> +
> +     ``pts``
> +         set to 0.
> +
> +   .. warning::
> +
> +      The sequence can be only initiated if both ``OUTPUT`` and ``CAPTUR=
E``
> +      queues are streaming. For compatibility reasons, the call to
> +      :c:func:`VIDIOC_DECODER_CMD` will not fail even if any of the queu=
es is
> +      not streaming, but at the same time it will not initiate the `Drai=
n`
> +      sequence and so the steps described below would not be applicable.
> +
> +2. Any ``OUTPUT`` buffers queued by the client before the
> +   :c:func:`VIDIOC_DECODER_CMD` was issued will be processed and decoded=
 as
> +   normal. The client must continue to handle both queues independently,
> +   similarly to normal decode operation. This includes:
> +
> +   * handling any operations triggered as a result of processing those b=
uffers,
> +     such as the `Dynamic resolution change` sequence, before continuing=
 with
> +     the drain sequence,
> +
> +   * queuing and dequeuing ``CAPTURE`` buffers, until a buffer marked wi=
th the
> +     ``V4L2_BUF_FLAG_LAST`` flag is dequeued,
> +
> +     .. warning::
> +
> +        The last buffer may be empty (with :c:type:`v4l2_buffer`
> +        ``bytesused`` =3D 0) and in that case it must be ignored by the =
client,
> +        as it does not contain a decoded frame.
> +
> +     .. note::
> +
> +        Any attempt to dequeue more ``CAPTURE`` buffers beyond the buffe=
r
> +        marked with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE error=
 from
> +        :c:func:`VIDIOC_DQBUF`.
> +
> +   * dequeuing processed ``OUTPUT`` buffers, until all the buffers queue=
d
> +     before the ``V4L2_DEC_CMD_STOP`` command are dequeued,
> +
> +   * dequeuing the ``V4L2_EVENT_EOS`` event, if the client subscribed to=
 it.
> +
> +   .. note::
> +
> +      For backwards compatibility, the decoder will signal a ``V4L2_EVEN=
T_EOS``
> +      event when the last frame has been decoded and all frames are read=
y to be
> +      dequeued. It is a deprecated behavior and the client must not rely=
 on it.
> +      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.
> +
> +3. Once all the ``OUTPUT`` buffers queued before the ``V4L2_DEC_CMD_STOP=
`` call
> +   are dequeued and the last ``CAPTURE`` buffer is dequeued, the decoder=
 is
> +   stopped and it will accept, but not process, any newly queued ``OUTPU=
T``
> +   buffers until the client issues any of the following operations:
> +
> +   * ``V4L2_DEC_CMD_START`` - the decoder will not be reset and will res=
ume
> +     operation normally, with all the state from before the drain,
> +
> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` =
on the
> +     ``CAPTURE`` queue - the decoder will resume the operation normally,
> +     however any ``CAPTURE`` buffers still in the queue will be returned=
 to the
> +     client,
> +
> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` =
on the
> +     ``OUTPUT`` queue - any pending source buffers will be returned to t=
he
> +     client and the `Seek` sequence will be triggered.
> +
> +.. note::
> +
> +   Once the drain sequence is initiated, the client needs to drive it to
> +   completion, as described by the steps above, unless it aborts the pro=
cess by
> +   issuing :c:func:`VIDIOC_STREAMOFF` on any of the ``OUTPUT`` or ``CAPT=
URE``
> +   queues.  The client is not allowed to issue ``V4L2_DEC_CMD_START`` or
> +   ``V4L2_DEC_CMD_STOP`` again while the drain sequence is in progress a=
nd they
> +   will fail with -EBUSY error code if attempted.
> +
> +   Although mandatory, the availability of decoder commands may be queri=
ed
> +   using :c:func:`VIDIOC_TRY_DECODER_CMD`.
> +
> +End of stream
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +If the decoder encounters an end of stream marking in the stream, the de=
coder
> +will initiate the `Drain` sequence, which the client must handle as desc=
ribed
> +above, skipping the initial :c:func:`VIDIOC_DECODER_CMD`.
> +
> +Commit points
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Setting formats and allocating buffers trigger changes in the behavior o=
f the
> +decoder.
> +
> +1. Setting the format on the ``OUTPUT`` queue may change the set of form=
ats
> +   supported/advertised on the ``CAPTURE`` queue. In particular, it also=
 means
> +   that the ``CAPTURE`` format may be reset and the client must not rely=
 on the
> +   previously set format being preserved.
> +
> +2. Enumerating formats on the ``CAPTURE`` queue always returns only form=
ats
> +   supported for the current ``OUTPUT`` format.
> +
> +3. Setting the format on the ``CAPTURE`` queue does not change the list =
of
> +   formats available on the ``OUTPUT`` queue. An attempt to set a ``CAPT=
URE``
> +   format that is not supported for the currently selected ``OUTPUT`` fo=
rmat
> +   will result in the decoder adjusting the requested ``CAPTURE`` format=
 to a
> +   supported one.
> +
> +4. Enumerating formats on the ``OUTPUT`` queue always returns the full s=
et of
> +   supported coded formats, irrespectively of the current ``CAPTURE`` fo=
rmat.
> +
> +5. While buffers are allocated on any of the ``OUTPUT`` or ``CAPTURE`` q=
ueues,
> +   the client must not change the format on the ``OUTPUT`` queue. Driver=
s will
> +   return the -EBUSY error code for any such format change attempt.
> +
> +To summarize, setting formats and allocation must always start with the
> +``OUTPUT`` queue and the ``OUTPUT`` queue is the master that governs the
> +set of supported formats for the ``CAPTURE`` queue.
> diff --git a/Documentation/media/uapi/v4l/dev-mem2mem.rst b/Documentation=
/media/uapi/v4l/dev-mem2mem.rst
> index 67a980818dc8..caa05f5f6380 100644
> --- a/Documentation/media/uapi/v4l/dev-mem2mem.rst
> +++ b/Documentation/media/uapi/v4l/dev-mem2mem.rst
> @@ -39,4 +39,10 @@ file handle is visible through another file handle).
>  One of the most common memory-to-memory device is the codec. Codecs
>  are more complicated than most and require additional setup for
>  their codec parameters. This is done through codec controls.
> -See :ref:`mpeg-controls`.
> +See :ref:`mpeg-controls`. More details on how to use codec memory-to-mem=
ory
> +devices are given in the following sections.
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +    dev-decoder
> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation=
/media/uapi/v4l/pixfmt-v4l2.rst
> index 71eebfc6d853..caf14e440447 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> @@ -39,6 +39,11 @@ Single-planar format structure
>  	to a multiple of the scale factor of any smaller planes. For
>  	example when the image format is YUV 4:2:0, ``width`` and
>  	``height`` must be multiples of two.
> +
> +	For compressed formats that contain the resolution information encoded
> +	inside the stream, when fed to a stateful mem2mem decoder, the fields
> +	may be zero to rely on the decoder to detect the right values. For more
> +	details see :ref:`decoder` and format descriptions.
>      * - __u32
>        - ``pixelformat``
>        - The pixel format or type of compression, set by the application.
> diff --git a/Documentation/media/uapi/v4l/v4l2.rst b/Documentation/media/=
uapi/v4l/v4l2.rst
> index 004ec00db6bd..97015b9b40b8 100644
> --- a/Documentation/media/uapi/v4l/v4l2.rst
> +++ b/Documentation/media/uapi/v4l/v4l2.rst
> @@ -60,6 +60,10 @@ Authors, in alphabetical order:
> =20
>    - Original author of the V4L2 API and documentation.
> =20
> +- Figa, Tomasz <tfiga@chromium.org>
> +
> +  - Documented the memory-to-memory decoder interface.
> +
>  - H Schimek, Michael <mschimek@gmx.at>
> =20
>    - Original author of the V4L2 API and documentation.
> @@ -68,6 +72,10 @@ Authors, in alphabetical order:
> =20
>    - Documented the Digital Video timings API.
> =20
> +- Osciak, Pawel <posciak@chromium.org>
> +
> +  - Documented the memory-to-memory decoder interface.
> +
>  - Osciak, Pawel <pawel@osciak.com>
> =20
>    - Designed and documented the multi-planar API.
> @@ -92,7 +100,7 @@ Authors, in alphabetical order:
> =20
>    - Designed and documented the VIDIOC_LOG_STATUS ioctl, the extended co=
ntrol ioctls, major parts of the sliced VBI API, the MPEG encoder and decod=
er APIs and the DV Timings API.
> =20
> -**Copyright** |copy| 1999-2016: Bill Dirks, Michael H. Schimek, Hans Ver=
kuil, Martin Rubli, Andy Walls, Muralidharan Karicheri, Mauro Carvalho Cheh=
ab, Pawel Osciak, Sakari Ailus & Antti Palosaari.
> +**Copyright** |copy| 1999-2018: Bill Dirks, Michael H. Schimek, Hans Ver=
kuil, Martin Rubli, Andy Walls, Muralidharan Karicheri, Mauro Carvalho Cheh=
ab, Pawel Osciak, Sakari Ailus & Antti Palosaari, Tomasz Figa
> =20
>  Except when explicitly stated as GPL, programming examples within this
>  part can be used and distributed without restrictions.
> diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Docume=
ntation/media/uapi/v4l/vidioc-decoder-cmd.rst
> index ccf83b05afa7..57f0066f4cff 100644
> --- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> @@ -56,14 +56,16 @@ The ``cmd`` field must contain the command code. Some=
 commands use the
> =20
>  A :ref:`write() <func-write>` or :ref:`VIDIOC_STREAMON`
>  call sends an implicit START command to the decoder if it has not been
> -started yet.
> +started yet. Applies to both queues of mem2mem decoders.
> =20
>  A :ref:`close() <func-close>` or :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON=
>`
>  call of a streaming file descriptor sends an implicit immediate STOP
> -command to the decoder, and all buffered data is discarded.
> +command to the decoder, and all buffered data is discarded. Applies to b=
oth
> +queues of mem2mem decoders.
> =20
> -These ioctls are optional, not all drivers may support them. They were
> -introduced in Linux 3.3.
> +In principle, these ioctls are optional, not all drivers may support the=
m. They were
> +introduced in Linux 3.3. They are, however, mandatory for stateful mem2m=
em decoders
> +(as further documented in :ref:`decoder`).
> =20
> =20
>  .. tabularcolumns:: |p{1.1cm}|p{2.4cm}|p{1.2cm}|p{1.6cm}|p{10.6cm}|
> @@ -167,26 +169,32 @@ introduced in Linux 3.3.
>  	``V4L2_DEC_CMD_RESUME`` for that. This command has one flag:
>  	``V4L2_DEC_CMD_START_MUTE_AUDIO``. If set, then audio will be
>  	muted when playing back at a non-standard speed.
> +
> +	For a device implementing the :ref:`decoder`, once the drain sequence
> +	is initiated with the ``V4L2_DEC_CMD_STOP`` command, it must be driven
> +	to completion before this command can be invoked.  Any attempt to
> +	invoke the command while the drain sequence is in progress will trigger
> +	an ``EBUSY`` error code.  The command may be also used to restart the
> +	decoder in case of an implicit stop initiated by the decoder itself,
> +	without the ``V4L2_DEC_CMD_STOP`` being called explicitly. See
> +	:ref:`decoder` for more details.
>      * - ``V4L2_DEC_CMD_STOP``
>        - 1
>        - Stop the decoder. When the decoder is already stopped, this
>  	command does nothing. This command has two flags: if
>  	``V4L2_DEC_CMD_STOP_TO_BLACK`` is set, then the decoder will set
>  	the picture to black after it stopped decoding. Otherwise the last
> -	image will repeat. mem2mem decoders will stop producing new frames
> -	altogether. They will send a ``V4L2_EVENT_EOS`` event when the
> -	last frame has been decoded and all frames are ready to be
> -	dequeued and will set the ``V4L2_BUF_FLAG_LAST`` buffer flag on
> -	the last buffer of the capture queue to indicate there will be no
> -	new buffers produced to dequeue. This buffer may be empty,
> -	indicated by the driver setting the ``bytesused`` field to 0. Once
> -	the ``V4L2_BUF_FLAG_LAST`` flag was set, the
> -	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will not block anymore,
> -	but return an ``EPIPE`` error code. If
> +	image will repeat. If
>  	``V4L2_DEC_CMD_STOP_IMMEDIATELY`` is set, then the decoder stops
>  	immediately (ignoring the ``pts`` value), otherwise it will keep
>  	decoding until timestamp >=3D pts or until the last of the pending
>  	data from its internal buffers was decoded.
> +
> +	For a device implementing the :ref:`decoder`, the command will initiate
> +	the drain sequence as documented in :ref:`decoder`.  No flags or other
> +	arguments are accepted in this case. Any attempt to invoke the command
> +	again before the sequence completes will trigger an ``EBUSY`` error
> +	code.
>      * - ``V4L2_DEC_CMD_PAUSE``
>        - 2
>        - Pause the decoder. When the decoder has not been started yet, th=
e
> @@ -209,6 +217,11 @@ On success 0 is returned, on error -1 and the ``errn=
o`` variable is set
>  appropriately. The generic error codes are described at the
>  :ref:`Generic Error Codes <gen-errors>` chapter.
> =20
> +EBUSY
> +    A drain sequence of a device implementing the :ref:`decoder` is stil=
l in
> +    progress. It is not allowed to issue another decoder command until i=
t
> +    completes.
> +
>  EINVAL
>      The ``cmd`` field is invalid.
> =20

--=-lLbAJ2h/ym5L/f/fWfGJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXS8SCwAKCRBxUwItrAao
HEu1AKCnmJwaIPfQwWvCxsGDLygWp0YfzACeKi2AMfQuPhZ9F+Fn7Yc0cEJJGfA=
=qrbd
-----END PGP SIGNATURE-----

--=-lLbAJ2h/ym5L/f/fWfGJ--

