Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1648AFEE6
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 19:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfD3ReW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 30 Apr 2019 13:34:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48173 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfD3ReV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 13:34:21 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1hLWe2-0008SJ-PR; Tue, 30 Apr 2019 19:34:18 +0200
Date:   Tue, 30 Apr 2019 19:34:12 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pawel Osciak <posciak@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Kamil Debski <kamil@wypas.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Jeongtae Park <jtp.park@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Tiffany Lin (=?UTF-8?B?5p6X5oWn54+K?=) " <tiffany.lin@mediatek.com>,
        "Andrew-CT Chen (=?UTF-8?B?6Zmz5pm66L+q?=) " 
        <andrew-ct.chen@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Todor Tomov <todor.tomov@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dave.stevenson@raspberrypi.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Subject: Re: [PATCH v3 2/2] media: docs-rst: Document memory-to-memory video
 encoder interface
Message-ID: <20190430193412.4291fca8@litschi.hi.pengutronix.de>
In-Reply-To: <20190124100419.26492-3-tfiga@chromium.org>
References: <20190124100419.26492-1-tfiga@chromium.org>
        <20190124100419.26492-3-tfiga@chromium.org>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 24 Jan 2019 19:04:19 +0900, Tomasz Figa wrote:
> Due to complexity of the video encoding process, the V4L2 drivers of
> stateful encoder hardware require specific sequences of V4L2 API calls
> to be followed. These include capability enumeration, initialization,
> encoding, encode parameters change, drain and reset.
> 
> Specifics of the above have been discussed during Media Workshops at
> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> Conference Europe 2014 in Düsseldorf. The de facto Codec API that
> originated at those events was later implemented by the drivers we already
> have merged in mainline, such as s5p-mfc or coda.
> 
> The only thing missing was the real specification included as a part of
> Linux Media documentation. Fix it now and document the encoder part of
> the Codec API.
> 
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  Documentation/media/uapi/v4l/dev-encoder.rst  | 586 ++++++++++++++++++
>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |   1 +
>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   5 +
>  Documentation/media/uapi/v4l/v4l2.rst         |   2 +
>  .../media/uapi/v4l/vidioc-encoder-cmd.rst     |  38 +-
>  5 files changed, 617 insertions(+), 15 deletions(-)
>  create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst
> 
> diff --git a/Documentation/media/uapi/v4l/dev-encoder.rst b/Documentation/media/uapi/v4l/dev-encoder.rst
> new file mode 100644
> index 000000000000..fb8b05a132ee
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/dev-encoder.rst
> @@ -0,0 +1,586 @@
> +.. -*- coding: utf-8; mode: rst -*-
> +
> +.. _encoder:
> +
> +*************************************************
> +Memory-to-memory Stateful Video Encoder Interface
> +*************************************************
> +
> +A stateful video encoder takes raw video frames in display order and encodes
> +them into a bitstream. It generates complete chunks of the bitstream, including
> +all metadata, headers, etc. The resulting bitstream does not require any
> +further post-processing by the client.
> +
> +Performing software stream processing, header generation etc. in the driver
> +in order to support this interface is strongly discouraged. In case such
> +operations are needed, use of the Stateless Video Encoder Interface (in
> +development) is strongly advised.
> +
> +Conventions and notation used in this document
> +==============================================
> +
> +1. The general V4L2 API rules apply if not specified in this document
> +   otherwise.
> +
> +2. The meaning of words "must", "may", "should", etc. is as per `RFC
> +   2119 <https://tools.ietf.org/html/rfc2119>`_.
> +
> +3. All steps not marked "optional" are required.
> +
> +4. :c:func:`VIDIOC_G_EXT_CTRLS` and :c:func:`VIDIOC_S_EXT_CTRLS` may be used
> +   interchangeably with :c:func:`VIDIOC_G_CTRL` and :c:func:`VIDIOC_S_CTRL`,
> +   unless specified otherwise.
> +
> +5. Single-planar API (see :ref:`planar-apis`) and applicable structures may be
> +   used interchangeably with multi-planar API, unless specified otherwise,
> +   depending on decoder capabilities and following the general V4L2 guidelines.
> +
> +6. i = [a..b]: sequence of integers from a to b, inclusive, i.e. i =
> +   [0..2]: i = 0, 1, 2.
> +
> +7. Given an ``OUTPUT`` buffer A, then A’ represents a buffer on the ``CAPTURE``
> +   queue containing data that resulted from processing buffer A.
> +
> +Glossary
> +========
> +
> +Refer to :ref:`decoder-glossary`.
> +
> +State machine
> +=============
> +
> +.. kernel-render:: DOT
> +   :alt: DOT digraph of encoder state machine
> +   :caption: Encoder state machine
> +
> +   digraph encoder_state_machine {
> +       node [shape = doublecircle, label="Encoding"] Encoding;
> +
> +       node [shape = circle, label="Initialization"] Initialization;
> +       node [shape = circle, label="Stopped"] Stopped;
> +       node [shape = circle, label="Drain"] Drain;
> +       node [shape = circle, label="Reset"] Reset;
> +
> +       node [shape = point]; qi
> +       qi -> Initialization [ label = "open()" ];
> +
> +       Initialization -> Encoding [ label = "Both queues streaming" ];
> +
> +       Encoding -> Drain [ label = "V4L2_DEC_CMD_STOP" ];
> +       Encoding -> Reset [ label = "VIDIOC_STREAMOFF(CAPTURE)" ];
> +       Encoding -> Stopped [ label = "VIDIOC_STREAMOFF(OUTPUT)" ];
> +       Encoding -> Encoding;
> +
> +       Drain -> Stopped [ label = "All CAPTURE\nbuffers dequeued\nor\nVIDIOC_STREAMOFF(CAPTURE)" ];

Shouldn't this be

	Drain -> Stopped [ label = "All OUTPUT\nbuffers dequeued\nor\nVIDIOC_STREAMOFF(OUTPUT)" ];

? While draining, the encoder continues encoding until all source
buffers, i.e., buffers in the OUTPUT queue, are encoded or STREAMOFF
happens on the OUTPUT queue. At the same time, the client continues to
queue and dequeue buffers on the CAPTURE queue and there might be
buffers queued on the CAPTURE queue even if the driver returned the
buffer with the FLAG_LAST set and returns -EPIPE on further DQBUF
requests.

Michael

> +       Drain -> Reset [ label = "VIDIOC_STREAMOFF(CAPTURE)" ];
> +
> +       Reset -> Encoding [ label = "VIDIOC_STREAMON(CAPTURE)" ];
> +       Reset -> Initialization [ label = "VIDIOC_REQBUFS(OUTPUT, 0)" ];
> +
> +       Stopped -> Encoding [ label = "V4L2_DEC_CMD_START\nor\nVIDIOC_STREAMON(OUTPUT)" ];
> +       Stopped -> Reset [ label = "VIDIOC_STREAMOFF(CAPTURE)" ];
> +   }
> +
> +Querying capabilities
> +=====================
> +
> +1. To enumerate the set of coded formats supported by the encoder, the
> +   client may call :c:func:`VIDIOC_ENUM_FMT` on ``CAPTURE``.
> +
> +   * The full set of supported formats will be returned, regardless of the
> +     format set on ``OUTPUT``.
> +
> +2. To enumerate the set of supported raw formats, the client may call
> +   :c:func:`VIDIOC_ENUM_FMT` on ``OUTPUT``.
> +
> +   * Only the formats supported for the format currently active on ``CAPTURE``
> +     will be returned.
> +
> +   * In order to enumerate raw formats supported by a given coded format,
> +     the client must first set that coded format on ``CAPTURE`` and then
> +     enumerate the formats on ``OUTPUT``.
> +
> +3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect supported
> +   resolutions for a given format, passing desired pixel format in
> +   :c:type:`v4l2_frmsizeenum` ``pixel_format``.
> +
> +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a coded pixel
> +     format will include all possible coded resolutions supported by the
> +     encoder for given coded pixel format.
> +
> +   * Values returned by :c:func:`VIDIOC_ENUM_FRAMESIZES` for a raw pixel format
> +     will include all possible frame buffer resolutions supported by the
> +     encoder for given raw pixel format and coded format currently set on
> +     ``CAPTURE``.
> +
> +4. Supported profiles and levels for the coded format currently set on
> +   ``CAPTURE``, if applicable, may be queried using their respective controls
> +   via :c:func:`VIDIOC_QUERYCTRL`.
> +
> +5. Any additional encoder capabilities may be discovered by querying
> +   their respective controls.
> +
> +Initialization
> +==============
> +
> +1. Set the coded format on the ``CAPTURE`` queue via :c:func:`VIDIOC_S_FMT`
> +
> +   * **Required fields:**
> +
> +     ``type``
> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``
> +
> +     ``pixelformat``
> +         the coded format to be produced
> +
> +     ``sizeimage``
> +         desired size of ``CAPTURE`` buffers; the encoder may adjust it to
> +         match hardware requirements
> +
> +     ``width``, ``height``
> +         ignored (always zero)
> +
> +     other fields
> +         follow standard semantics
> +
> +   * **Return fields:**
> +
> +     ``sizeimage``
> +         adjusted size of ``CAPTURE`` buffers
> +
> +   .. important::
> +
> +      Changing the ``CAPTURE`` format may change the currently set ``OUTPUT``
> +      format. The encoder will derive a new ``OUTPUT`` format from the
> +      ``CAPTURE`` format being set, including resolution, colorimetry
> +      parameters, etc. If the client needs a specific ``OUTPUT`` format, it
> +      must adjust it afterwards.
> +
> +2. **Optional.** Enumerate supported ``OUTPUT`` formats (raw formats for
> +   source) for the selected coded format via :c:func:`VIDIOC_ENUM_FMT`.
> +
> +   * **Required fields:**
> +
> +     ``type``
> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``
> +
> +     other fields
> +         follow standard semantics
> +
> +   * **Return fields:**
> +
> +     ``pixelformat``
> +         raw format supported for the coded format currently selected on
> +         the ``CAPTURE`` queue.
> +
> +     other fields
> +         follow standard semantics
> +
> +3. Set the raw source format on the ``OUTPUT`` queue via
> +   :c:func:`VIDIOC_S_FMT`.
> +
> +   * **Required fields:**
> +
> +     ``type``
> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``
> +
> +     ``pixelformat``
> +         raw format of the source
> +
> +     ``width``, ``height``
> +         source resolution
> +
> +     other fields
> +         follow standard semantics
> +
> +   * **Return fields:**
> +
> +     ``width``, ``height``
> +         may be adjusted by encoder to match alignment requirements, as
> +         required by the currently selected formats
> +
> +     other fields
> +         follow standard semantics
> +
> +   * Setting the source resolution will reset the selection rectangles to their
> +     default values, based on the new resolution, as described in the step 5
> +     below.
> +
> +4. **Optional.** Set the visible resolution for the stream metadata via
> +   :c:func:`VIDIOC_S_SELECTION` on the ``OUTPUT`` queue.
> +
> +   * **Required fields:**
> +
> +     ``type``
> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``
> +
> +     ``target``
> +         set to ``V4L2_SEL_TGT_CROP``
> +
> +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> +         visible rectangle; this must fit within the `V4L2_SEL_TGT_CROP_BOUNDS`
> +         rectangle and may be subject to adjustment to match codec and
> +         hardware constraints
> +
> +   * **Return fields:**
> +
> +     ``r.left``, ``r.top``, ``r.width``, ``r.height``
> +         visible rectangle adjusted by the encoder
> +
> +   * The following selection targets are supported on ``OUTPUT``:
> +
> +     ``V4L2_SEL_TGT_CROP_BOUNDS``
> +         equal to the full source frame, matching the active ``OUTPUT``
> +         format
> +
> +     ``V4L2_SEL_TGT_CROP_DEFAULT``
> +         equal to ``V4L2_SEL_TGT_CROP_BOUNDS``
> +
> +     ``V4L2_SEL_TGT_CROP``
> +         rectangle within the source buffer to be encoded into the
> +         ``CAPTURE`` stream; defaults to ``V4L2_SEL_TGT_CROP_DEFAULT``
> +
> +         .. note::
> +
> +            A common use case for this selection target is encoding a source
> +            video with a resolution that is not a multiple of a macroblock,
> +            e.g.  the common 1920x1080 resolution may require the source
> +            buffers to be aligned to 1920x1088 for codecs with 16x16 macroblock
> +            size. To avoid encoding the padding, the client needs to explicitly
> +            configure this selection target to 1920x1080.
> +
> +     ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
> +         maximum rectangle within the coded resolution, which the cropped
> +         source frame can be composed into; if the hardware does not support
> +         composition or scaling, then this is always equal to the rectangle of
> +         width and height matching ``V4L2_SEL_TGT_CROP`` and located at (0, 0)
> +
> +     ``V4L2_SEL_TGT_COMPOSE_DEFAULT``
> +         equal to a rectangle of width and height matching
> +         ``V4L2_SEL_TGT_CROP`` and located at (0, 0)
> +
> +     ``V4L2_SEL_TGT_COMPOSE``
> +         rectangle within the coded frame, which the cropped source frame
> +         is to be composed into; defaults to
> +         ``V4L2_SEL_TGT_COMPOSE_DEFAULT``; read-only on hardware without
> +         additional compose/scaling capabilities; resulting stream will
> +         have this rectangle encoded as the visible rectangle in its
> +         metadata
> +
> +   .. warning::
> +
> +      The encoder may adjust the crop/compose rectangles to the nearest
> +      supported ones to meet codec and hardware requirements. The client needs
> +      to check the adjusted rectangle returned by :c:func:`VIDIOC_S_SELECTION`.
> +
> +5. Allocate buffers for both ``OUTPUT`` and ``CAPTURE`` via
> +   :c:func:`VIDIOC_REQBUFS`. This may be performed in any order.
> +
> +   * **Required fields:**
> +
> +     ``count``
> +         requested number of buffers to allocate; greater than zero
> +
> +     ``type``
> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT`` or
> +         ``CAPTURE``
> +
> +     other fields
> +         follow standard semantics
> +
> +   * **Return fields:**
> +
> +     ``count``
> +          actual number of buffers allocated
> +
> +   .. warning::
> +
> +      The actual number of allocated buffers may differ from the ``count``
> +      given. The client must check the updated value of ``count`` after the
> +      call returns.
> +
> +   .. note::
> +
> +      To allocate more than the minimum number of OUTPUT buffers (for pipeline
> +      depth), the client may query the ``V4L2_CID_MIN_BUFFERS_FOR_OUTPUT``
> +      control to get the minimum number of buffers required, and pass the
> +      obtained value plus the number of additional buffers needed in the
> +      ``count`` field to :c:func:`VIDIOC_REQBUFS`.
> +
> +   Alternatively, :c:func:`VIDIOC_CREATE_BUFS` can be used to have more
> +   control over buffer allocation.
> +
> +   * **Required fields:**
> +
> +     ``count``
> +         requested number of buffers to allocate; greater than zero
> +
> +     ``type``
> +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``
> +
> +     other fields
> +         follow standard semantics
> +
> +   * **Return fields:**
> +
> +     ``count``
> +         adjusted to the number of allocated buffers
> +
> +6. Begin streaming on both ``OUTPUT`` and ``CAPTURE`` queues via
> +   :c:func:`VIDIOC_STREAMON`. This may be performed in any order. The actual
> +   encoding process starts when both queues start streaming.
> +
> +.. note::
> +
> +   If the client stops the ``CAPTURE`` queue during the encode process and then
> +   restarts it again, the encoder will begin generating a stream independent
> +   from the stream generated before the stop. The exact constraints depend
> +   on the coded format, but may include the following implications:
> +
> +   * encoded frames produced after the restart must not reference any
> +     frames produced before the stop, e.g. no long term references for
> +     H.264,
> +
> +   * any headers that must be included in a standalone stream must be
> +     produced again, e.g. SPS and PPS for H.264.
> +
> +Encoding
> +========
> +
> +This state is reached after the `Initialization` sequence finishes
> +successfully.  In this state, the client queues and dequeues buffers to both
> +queues via :c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQBUF`, following the
> +standard semantics.
> +
> +The contents of encoded ``CAPTURE`` buffers depend on the active coded pixel
> +format and may be affected by codec-specific extended controls, as stated
> +in the documentation of each format.
> +
> +Both queues operate independently, following standard behavior of V4L2 buffer
> +queues and memory-to-memory devices. In addition, the order of encoded frames
> +dequeued from the ``CAPTURE`` queue may differ from the order of queuing raw
> +frames to the ``OUTPUT`` queue, due to properties of the selected coded format,
> +e.g. frame reordering.
> +
> +The client must not assume any direct relationship between ``CAPTURE`` and
> +``OUTPUT`` buffers and any specific timing of buffers becoming
> +available to dequeue. Specifically:
> +
> +* a buffer queued to ``OUTPUT`` may result in more than 1 buffer produced on
> +  ``CAPTURE`` (if returning an encoded frame allowed the encoder to return a
> +  frame that preceded it in display, but succeeded it in the decode order),
> +
> +* a buffer queued to ``OUTPUT`` may result in a buffer being produced on
> +  ``CAPTURE`` later into encode process, and/or after processing further
> +  ``OUTPUT`` buffers, or be returned out of order, e.g. if display
> +  reordering is used,
> +
> +* buffers may become available on the ``CAPTURE`` queue without additional
> +  buffers queued to ``OUTPUT`` (e.g. during drain or ``EOS``), because of the
> +  ``OUTPUT`` buffers queued in the past whose decoding results are only
> +  available at later time, due to specifics of the decoding process,
> +
> +* buffers queued to ``OUTPUT`` may not become available to dequeue instantly
> +  after being encoded into a corresponding ``CATPURE`` buffer, e.g. if the
> +  encoder needs to use the frame as a reference for encoding further frames.
> +
> +.. note::
> +
> +   To allow matching encoded ``CAPTURE`` buffers with ``OUTPUT`` buffers they
> +   originated from, the client can set the ``timestamp`` field of the
> +   :c:type:`v4l2_buffer` struct when queuing an ``OUTPUT`` buffer. The
> +   ``CAPTURE`` buffer(s), which resulted from encoding that ``OUTPUT`` buffer
> +   will have their ``timestamp`` field set to the same value when dequeued.
> +
> +   In addition to the straightforward case of one ``OUTPUT`` buffer producing
> +   one ``CAPTURE`` buffer, the following cases are defined:
> +
> +   * one ``OUTPUT`` buffer generates multiple ``CAPTURE`` buffers: the same
> +     ``OUTPUT`` timestamp will be copied to multiple ``CAPTURE`` buffers,
> +
> +   * the encoding order differs from the presentation order (i.e. the
> +     ``CAPTURE`` buffers are out-of-order compared to the ``OUTPUT`` buffers):
> +     ``CAPTURE`` timestamps will not retain the order of ``OUTPUT`` timestamps
> +     and thus monotonicity of the timestamps cannot be guaranteed.
> +
> +.. note::
> +
> +   To let the client distinguish between frame types (keyframes, intermediate
> +   frames; the exact list of types depends on the coded format), the
> +   ``CAPTURE`` buffers will have corresponding flag bits set in their
> +   :c:type:`v4l2_buffer` struct when dequeued. See the documentation of
> +   :c:type:`v4l2_buffer` and each coded pixel format for exact list of flags
> +   and their meanings.
> +
> +Encoding parameter changes
> +==========================
> +
> +The client is allowed to use :c:func:`VIDIOC_S_CTRL` to change encoder
> +parameters at any time. The availability of parameters is encoder-specific
> +and the client must query the encoder to find the set of available controls.
> +
> +The ability to change each parameter during encoding is encoder-specific, as
> +per the standard semantics of the V4L2 control interface. The client may
> +attempt to set a control during encoding and if the operation fails with the
> +-EBUSY error code, the ``CAPTURE`` queue needs to be stopped for the
> +configuration change to be allowed. To do this, it may follow the `Drain`
> +sequence to avoid losing the already queued/encoded frames.
> +
> +The timing of parameter updates is encoder-specific, as per the standard
> +semantics of the V4L2 control interface. If the client needs to apply the
> +parameters exactly at specific frame, using the Request API
> +(:ref:`media-request-api`) should be considered, if supported by the encoder.
> +
> +Drain
> +=====
> +
> +To ensure that all the queued ``OUTPUT`` buffers have been processed and the
> +related ``CAPTURE`` buffers are given to the client, the client must follow the
> +drain sequence described below. After the drain sequence ends, the client has
> +received all encoded frames for all ``OUTPUT`` buffers queued before the
> +sequence was started.
> +
> +1. Begin the drain sequence by issuing :c:func:`VIDIOC_ENCODER_CMD`.
> +
> +   * **Required fields:**
> +
> +     ``cmd``
> +         set to ``V4L2_ENC_CMD_STOP``
> +
> +     ``flags``
> +         set to 0
> +
> +     ``pts``
> +         set to 0
> +
> +   .. warning::
> +
> +      The sequence can be only initiated if both ``OUTPUT`` and ``CAPTURE``
> +      queues are streaming. For compatibility reasons, the call to
> +      :c:func:`VIDIOC_ENCODER_CMD` will not fail even if any of the queues is
> +      not streaming, but at the same time it will not initiate the `Drain`
> +      sequence and so the steps described below would not be applicable.
> +
> +2. Any ``OUTPUT`` buffers queued by the client before the
> +   :c:func:`VIDIOC_ENCODER_CMD` was issued will be processed and encoded as
> +   normal. The client must continue to handle both queues independently,
> +   similarly to normal encode operation. This includes:
> +
> +   * queuing and dequeuing ``CAPTURE`` buffers, until a buffer marked with the
> +     ``V4L2_BUF_FLAG_LAST`` flag is dequeued,
> +
> +     .. warning::
> +
> +        The last buffer may be empty (with :c:type:`v4l2_buffer`
> +        ``bytesused`` = 0) and in that case it must be ignored by the client,
> +        as it does not contain an encoded frame.
> +
> +     .. note::
> +
> +        Any attempt to dequeue more buffers beyond the buffer marked with
> +        ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE error from
> +        :c:func:`VIDIOC_DQBUF`.
> +
> +   * dequeuing processed ``OUTPUT`` buffers, until all the buffers queued
> +     before the ``V4L2_ENC_CMD_STOP`` command are dequeued,
> +
> +   * dequeuing the ``V4L2_EVENT_EOS`` event, if the client subscribes to it.
> +
> +   .. note::
> +
> +      For backwards compatibility, the encoder will signal a ``V4L2_EVENT_EOS``
> +      event when the last frame has been decoded and all frames are ready to be
> +      dequeued. It is deprecated behavior and the client must not rely on it.
> +      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.
> +
> +3. Once all ``OUTPUT`` buffers queued before the ``V4L2_ENC_CMD_STOP`` call are
> +   dequeued and the last ``CAPTURE`` buffer is dequeued, the encoder is stopped
> +   and it will accept, but not process any newly queued ``OUTPUT`` buffers
> +   until the client issues any of the following operations:
> +
> +   * ``V4L2_ENC_CMD_START`` - the encoder will not be reset and will resume
> +     operation normally, with all the state from before the drain,
> +
> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
> +     ``CAPTURE`` queue - the encoder will be reset (see the `Reset` sequence)
> +     and then resume encoding,
> +
> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
> +     ``OUTPUT`` queue - the encoder will resume operation normally, however any
> +     source frames queued to the ``OUTPUT`` queue between ``V4L2_ENC_CMD_STOP``
> +     and :c:func:`VIDIOC_STREAMOFF` will be discarded.
> +
> +.. note::
> +
> +   Once the drain sequence is initiated, the client needs to drive it to
> +   completion, as described by the steps above, unless it aborts the process by
> +   issuing :c:func:`VIDIOC_STREAMOFF` on any of the ``OUTPUT`` or ``CAPTURE``
> +   queues.  The client is not allowed to issue ``V4L2_ENC_CMD_START`` or
> +   ``V4L2_ENC_CMD_STOP`` again while the drain sequence is in progress and they
> +   will fail with -EBUSY error code if attempted.
> +
> +   Although mandatory, the availability of encoder commands may be queried
> +   using :c:func:`VIDIOC_TRY_ENCODER_CMD`.
> +
> +Reset
> +=====
> +
> +The client may want to request the encoder to reinitialize the encoding, so
> +that the following stream data becomes independent from the stream data
> +generated before. Depending on the coded format, that may imply that:
> +
> +* encoded frames produced after the restart must not reference any frames
> +  produced before the stop, e.g. no long term references for H.264,
> +
> +* any headers that must be included in a standalone stream must be produced
> +  again, e.g. SPS and PPS for H.264.
> +
> +This can be achieved by performing the reset sequence.
> +
> +1. Perform the `Drain` sequence to ensure all the in-flight encoding finishes
> +   and respective buffers are dequeued.
> +
> +2. Stop streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMOFF`. This
> +   will return all currently queued ``CAPTURE`` buffers to the client, without
> +   valid frame data.
> +
> +3. Start streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMON` and
> +   continue with regular encoding sequence. The encoded frames produced into
> +   ``CAPTURE`` buffers from now on will contain a standalone stream that can be
> +   decoded without the need for frames encoded before the reset sequence,
> +   starting at the first ``OUTPUT`` buffer queued after issuing the
> +   `V4L2_ENC_CMD_STOP` of the `Drain` sequence.
> +
> +This sequence may be also used to change encoding parameters for encoders
> +without the ability to change the parameters on the fly.
> +
> +Commit points
> +=============
> +
> +Setting formats and allocating buffers triggers changes in the behavior of the
> +encoder.
> +
> +1. Setting the format on the ``CAPTURE`` queue may change the set of formats
> +   supported/advertised on the ``OUTPUT`` queue. In particular, it also means
> +   that the ``OUTPUT`` format may be reset and the client must not rely on the
> +   previously set format being preserved.
> +
> +2. Enumerating formats on the ``OUTPUT`` queue always returns only formats
> +   supported for the current ``CAPTURE`` format.
> +
> +3. Setting the format on the ``OUTPUT`` queue does not change the list of
> +   formats available on the ``CAPTURE`` queue. An attempt to set the ``OUTPUT``
> +   format that is not supported for the currently selected ``CAPTURE`` format
> +   will result in the encoder adjusting the requested ``OUTPUT`` format to a
> +   supported one.
> +
> +4. Enumerating formats on the ``CAPTURE`` queue always returns the full set of
> +   supported coded formats, irrespectively of the current ``OUTPUT`` format.
> +
> +5. While buffers are allocated on the ``CAPTURE`` queue, the client must not
> +   change the format on the queue. Drivers will return the -EBUSY error code
> +   for any such format change attempt.
> +
> +To summarize, setting formats and allocation must always start with the
> +``CAPTURE`` queue and the ``CAPTURE`` queue is the master that governs the
> +set of supported formats for the ``OUTPUT`` queue.
> diff --git a/Documentation/media/uapi/v4l/dev-mem2mem.rst b/Documentation/media/uapi/v4l/dev-mem2mem.rst
> index a0e06a88c872..82630ea89b16 100644
> --- a/Documentation/media/uapi/v4l/dev-mem2mem.rst
> +++ b/Documentation/media/uapi/v4l/dev-mem2mem.rst
> @@ -17,6 +17,7 @@ Video Memory-To-Memory Interface
>      :maxdepth: 1
>  
>      dev-decoder
> +    dev-encoder
>  
>  A V4L2 memory-to-memory device can compress, decompress, transform, or
>  otherwise convert video data from one format into another format, in memory.
> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> index caf14e440447..593d25b935bf 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
> @@ -44,6 +44,11 @@ Single-planar format structure
>  	inside the stream, when fed to a stateful mem2mem decoder, the fields
>  	may be zero to rely on the decoder to detect the right values. For more
>  	details see :ref:`decoder` and format descriptions.
> +
> +	For compressed formats on the CAPTURE side of a stateful mem2mem
> +	encoder, the fields must be zero, since the coded size is expected to
> +	be calculated internally by the encoder itself, based on the OUTPUT
> +	side. For more details see :ref:`encoder` and format descriptions.
>      * - __u32
>        - ``pixelformat``
>        - The pixel format or type of compression, set by the application.
> diff --git a/Documentation/media/uapi/v4l/v4l2.rst b/Documentation/media/uapi/v4l/v4l2.rst
> index 97015b9b40b8..e236ea23481b 100644
> --- a/Documentation/media/uapi/v4l/v4l2.rst
> +++ b/Documentation/media/uapi/v4l/v4l2.rst
> @@ -63,6 +63,7 @@ Authors, in alphabetical order:
>  - Figa, Tomasz <tfiga@chromium.org>
>  
>    - Documented the memory-to-memory decoder interface.
> +  - Documented the memory-to-memory encoder interface.
>  
>  - H Schimek, Michael <mschimek@gmx.at>
>  
> @@ -75,6 +76,7 @@ Authors, in alphabetical order:
>  - Osciak, Pawel <posciak@chromium.org>
>  
>    - Documented the memory-to-memory decoder interface.
> +  - Documented the memory-to-memory encoder interface.
>  
>  - Osciak, Pawel <pawel@osciak.com>
>  
> diff --git a/Documentation/media/uapi/v4l/vidioc-encoder-cmd.rst b/Documentation/media/uapi/v4l/vidioc-encoder-cmd.rst
> index c313ca8b8cb5..2b59a4e7f5ce 100644
> --- a/Documentation/media/uapi/v4l/vidioc-encoder-cmd.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-encoder-cmd.rst
> @@ -57,19 +57,23 @@ currently only used by the STOP command and contains one bit: If the
>  until the end of the current *Group Of Pictures*, otherwise it will stop
>  immediately.
>  
> -A :ref:`read() <func-read>` or :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`
> -call sends an implicit START command to the encoder if it has not been
> -started yet. After a STOP command, :ref:`read() <func-read>` calls will read
> +After a STOP command, :ref:`read() <func-read>` calls will read
>  the remaining data buffered by the driver. When the buffer is empty,
>  :ref:`read() <func-read>` will return zero and the next :ref:`read() <func-read>`
>  call will restart the encoder.
>  
> +A :ref:`read() <func-read>` or :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`
> +call sends an implicit START command to the encoder if it has not been
> +started yet. Applies to both queues of mem2mem encoders.
> +
>  A :ref:`close() <func-close>` or :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
>  call of a streaming file descriptor sends an implicit immediate STOP to
> -the encoder, and all buffered data is discarded.
> +the encoder, and all buffered data is discarded. Applies to both queues of
> +mem2mem encoders.
>  
>  These ioctls are optional, not all drivers may support them. They were
> -introduced in Linux 2.6.21.
> +introduced in Linux 2.6.21. They are, however, mandatory for stateful mem2mem
> +encoders (as further documented in :ref:`encoder`).
>  
>  
>  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> @@ -114,16 +118,20 @@ introduced in Linux 2.6.21.
>        - Stop the encoder. When the ``V4L2_ENC_CMD_STOP_AT_GOP_END`` flag
>  	is set, encoding will continue until the end of the current *Group
>  	Of Pictures*, otherwise encoding will stop immediately. When the
> -	encoder is already stopped, this command does nothing. mem2mem
> -	encoders will send a ``V4L2_EVENT_EOS`` event when the last frame
> -	has been encoded and all frames are ready to be dequeued and will
> -	set the ``V4L2_BUF_FLAG_LAST`` buffer flag on the last buffer of
> -	the capture queue to indicate there will be no new buffers
> -	produced to dequeue. This buffer may be empty, indicated by the
> -	driver setting the ``bytesused`` field to 0. Once the
> -	``V4L2_BUF_FLAG_LAST`` flag was set, the
> -	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will not block anymore,
> -	but return an ``EPIPE`` error code.
> +	encoder is already stopped, this command does nothing.
> +
> +	A stateful mem2mem encoder will proceed with encoding the source
> +	buffers pending before the command is issued and then stop producing
> +	new frames. It will send a ``V4L2_EVENT_EOS`` event when the last frame
> +	has been encoded and all frames are ready to be dequeued and will set
> +	the ``V4L2_BUF_FLAG_LAST`` buffer flag on the last buffer of the
> +	capture queue to indicate there will be no new buffers produced to
> +	dequeue. This buffer may be empty, indicated by the driver setting the
> +	``bytesused`` field to 0. Once the buffer with the
> +	``V4L2_BUF_FLAG_LAST`` flag set was dequeued, the :ref:`VIDIOC_DQBUF
> +	<VIDIOC_QBUF>` ioctl will not block anymore, but return an ``EPIPE``
> +	error code. No flags or other arguments are accepted in case of mem2mem
> +	encoders.  See :ref:`encoder` for more details.
>      * - ``V4L2_ENC_CMD_PAUSE``
>        - 2
>        - Pause the encoder. When the encoder has not been started yet, the
