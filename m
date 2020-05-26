Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94CB1E1D17
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 10:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgEZIS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 04:18:56 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39073 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726926AbgEZISz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 04:18:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id dUnQjEhxgdPgTdUnUjic57; Tue, 26 May 2020 10:18:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590481132; bh=mOnl31eD/R3ZB8RaOIh/NqeuDuZekmeJbY59KzW2x5k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SoCimVBlOVm2lnBgpzu4531fzkZw30VORnUdy1cndRTV9MSn1lNATRQDW177ucPXW
         8uz7mE86cF9G4TQzj4pnZe2xC3fQhvnnyDBnRsMs71DPuTzSQxst9+3rJu6v8F6pU3
         FLG2T6ClqN/S0dqGlD161EvruEr+BSwuG4DrQc8UQzsArN+dT8C0h9q1+oqdo2P3kh
         9m3SiqHmkcuF+Rx3iyJujhNwc7cgw8fdx+FWEbhcFol7SltJHL3d9lwhhjToDn/LTN
         1/MvgsxEOZ6s8S+aamv54/h0ZytHZQcVl1WdyrAiyTfdWO26lipUoUTc5Y5QjrFyuU
         jtvzm646cGrdA==
Subject: Re: [PATCHv2 1/2] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
 <20200520100159.2094831-2-hverkuil-cisco@xs4all.nl>
 <9553a1bc-541b-6664-d476-14fdf6d9b4cf@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4d2a3c27-7e7b-d7ba-842f-a396047fb3b8@xs4all.nl>
Date:   Tue, 26 May 2020 10:18:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9553a1bc-541b-6664-d476-14fdf6d9b4cf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfC51UbWM495tkblGawdTwejrXjA4AeVpbmFsclmpexQj9BOXEeF7EzscqTiNXaIh5J+VOLIBhZjIwSveqEYNkKc3m+GylhNI+VhnJ/h3BTUzgIyfMmrH
 RZDRMKH+ckINPWLB6VBeozQ/kyD0X3g/GhWdigISKmU3anjWhHH8Go0drvfP0MRFD38jfk2TqgEaBgUzGk8CW2ZXKZuZkiYL8reVverxMiXe+hF0DCEn7LhW
 aXywPiaiKDgIVy0ujdWvFxObY8aovQCiZUVHGvwKo/Ewv1QSrhuE0gdhEHBJi8+L3exUP9E6Qmd6p9fAiMiIzLMNkVrCY33C5EF5fmHi+/I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/05/2020 22:33, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 5/20/20 1:01 PM, Hans Verkuil wrote:
>> From: Tomasz Figa <tfiga@chromium.org>
>>
>> Due to complexity of the video encoding process, the V4L2 drivers of
>> stateful encoder hardware require specific sequences of V4L2 API calls
>> to be followed. These include capability enumeration, initialization,
>> encoding, encode parameters change, drain and reset.
>>
>> Specifics of the above have been discussed during Media Workshops at
>> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
>> Conference Europe 2014 in Düsseldorf. The de facto Codec API that
>> originated at those events was later implemented by the drivers we already
>> have merged in mainline, such as s5p-mfc or coda.
>>
>> The only thing missing was the real specification included as a part of
>> Linux Media documentation. Fix it now and document the encoder part of
>> the Codec API.
>>
>> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../userspace-api/media/v4l/dev-encoder.rst   | 727 ++++++++++++++++++
>>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>>  5 files changed, 766 insertions(+), 20 deletions(-)
>>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
>> new file mode 100644
>> index 000000000000..b30ef9c5d970
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
>> @@ -0,0 +1,727 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +.. _encoder:
>> +
>> +*************************************************
>> +Memory-to-Memory Stateful Video Encoder Interface
>> +*************************************************
>> +
>> +A stateful video encoder takes raw video frames in display order and encodes
>> +them into a bytestream. It generates complete chunks of the bytestream, including
>> +all metadata, headers, etc. The resulting bytestream does not require any
>> +further post-processing by the client.
>> +
>> +Performing software stream processing, header generation etc. in the driver
>> +in order to support this interface is strongly discouraged. In case such
>> +operations are needed, use of the Stateless Video Encoder Interface (in
>> +development) is strongly advised.
>> +
> 
> <cut>
> 
>> +Encoding
>> +========
>> +
>> +This state is reached after the `Initialization` sequence finishes
>> +successfully.  In this state, the client queues and dequeues buffers to both
>> +queues via :c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQBUF`, following the
>> +standard semantics.
>> +
>> +The content of encoded ``CAPTURE`` buffers depends on the active coded pixel
>> +format and may be affected by codec-specific extended controls, as stated
>> +in the documentation of each format.
>> +
>> +Both queues operate independently, following standard behavior of V4L2 buffer
>> +queues and memory-to-memory devices. In addition, the order of encoded frames
>> +dequeued from the ``CAPTURE`` queue may differ from the order of queuing raw
>> +frames to the ``OUTPUT`` queue, due to properties of the selected coded format,
>> +e.g. frame reordering.
>> +
>> +The client must not assume any direct relationship between ``CAPTURE`` and
>> +``OUTPUT`` buffers and any specific timing of buffers becoming
>> +available to dequeue. Specifically:
>> +
>> +* a buffer queued to ``OUTPUT`` may result in more than one buffer produced on
>> +  ``CAPTURE`` (for example, if returning an encoded frame allowed the encoder
>> +  to return a frame that preceded it in display, but succeeded it in the decode
>> +  order; however, there may be other reasons for this as well),
>> +
>> +* a buffer queued to ``OUTPUT`` may result in a buffer being produced on
>> +  ``CAPTURE`` later into encode process, and/or after processing further
>> +  ``OUTPUT`` buffers, or be returned out of order, e.g. if display
>> +  reordering is used,
>> +
>> +* buffers may become available on the ``CAPTURE`` queue without additional
>> +  buffers queued to ``OUTPUT`` (e.g. during drain or ``EOS``), because of the
>> +  ``OUTPUT`` buffers queued in the past whose decoding results are only
> 
> 						 ^^^ encoding
> 
>> +  available at later time, due to specifics of the decoding process,
> 
> 						      ^^^ encoding

Good catch!

> 
>> +
>> +* buffers queued to ``OUTPUT`` may not become available to dequeue instantly
>> +  after being encoded into a corresponding ``CAPTURE`` buffer, e.g. if the
>> +  encoder needs to use the frame as a reference for encoding further frames.
>> +
> 
> <cut>
> 
>> +Drain
>> +=====
>> +
>> +To ensure that all the queued ``OUTPUT`` buffers have been processed and the
>> +related ``CAPTURE`` buffers are given to the client, the client must follow the
>> +drain sequence described below. After the drain sequence ends, the client has
>> +received all encoded frames for all ``OUTPUT`` buffers queued before the
>> +sequence was started.
>> +
>> +1. Begin the drain sequence by issuing :c:func:`VIDIOC_ENCODER_CMD`.
>> +
>> +   * **Required fields:**
>> +
>> +     ``cmd``
>> +         set to ``V4L2_ENC_CMD_STOP``.
>> +
>> +     ``flags``
>> +         set to 0.
>> +
>> +     ``pts``
>> +         set to 0.
>> +
>> +   .. warning::
>> +
>> +      The sequence can be only initiated if both ``OUTPUT`` and ``CAPTURE``
>> +      queues are streaming. For compatibility reasons, the call to
>> +      :c:func:`VIDIOC_ENCODER_CMD` will not fail even if any of the queues is
>> +      not streaming, but at the same time it will not initiate the `Drain`
>> +      sequence and so the steps described below would not be applicable.
>> +
>> +2. Any ``OUTPUT`` buffers queued by the client before the
>> +   :c:func:`VIDIOC_ENCODER_CMD` was issued will be processed and encoded as
>> +   normal. The client must continue to handle both queues independently,
>> +   similarly to normal encode operation. This includes:
>> +
>> +   * queuing and dequeuing ``CAPTURE`` buffers, until a buffer marked with the
>> +     ``V4L2_BUF_FLAG_LAST`` flag is dequeued,
>> +
>> +     .. warning::
>> +
>> +        The last buffer may be empty (with :c:type:`v4l2_buffer`
>> +        ``bytesused`` = 0) and in that case it must be ignored by the client,
>> +        as it does not contain an encoded frame.
>> +
>> +     .. note::
>> +
>> +        Any attempt to dequeue more ``CAPTURE`` buffers beyond the buffer
>> +        marked with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE error from
>> +        :c:func:`VIDIOC_DQBUF`.
>> +
>> +   * dequeuing processed ``OUTPUT`` buffers, until all the buffers queued
>> +     before the ``V4L2_ENC_CMD_STOP`` command are dequeued,
>> +
>> +   * dequeuing the ``V4L2_EVENT_EOS`` event, if the client subscribes to it.
>> +
>> +   .. note::
>> +
>> +      For backwards compatibility, the encoder will signal a ``V4L2_EVENT_EOS``
>> +      event when the last frame has been encoded and all frames are ready to be
>> +      dequeued. It is deprecated behavior and the client must not rely on it.
>> +      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.
>> +
>> +3. Once all ``OUTPUT`` buffers queued before the ``V4L2_ENC_CMD_STOP`` call are
>> +   dequeued and the last ``CAPTURE`` buffer is dequeued, the encoder is stopped
>> +   and it will accept, but not process any newly queued ``OUTPUT`` buffers
>> +   until the client issues any of the following operations:
>> +
>> +   * ``V4L2_ENC_CMD_START`` - the encoder will not be reset and will resume
>> +     operation normally, with all the state from before the drain,
>> +
>> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
>> +     ``CAPTURE`` queue - the encoder will be reset (see the `Reset` sequence)
>> +     and then resume encoding,
>> +
>> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
>> +     ``OUTPUT`` queue - the encoder will resume operation normally, however any
>> +     source frames queued to the ``OUTPUT`` queue between ``V4L2_ENC_CMD_STOP``
>> +     and :c:func:`VIDIOC_STREAMOFF` will be discarded.
>> +
>> +.. note::
>> +
>> +   Once the drain sequence is initiated, the client needs to drive it to
>> +   completion, as described by the steps above, unless it aborts the process by
>> +   issuing :c:func:`VIDIOC_STREAMOFF` on any of the ``OUTPUT`` or ``CAPTURE``
>> +   queues.  The client is not allowed to issue ``V4L2_ENC_CMD_START`` or
>> +   ``V4L2_ENC_CMD_STOP`` again while the drain sequence is in progress and they
>> +   will fail with -EBUSY error code if attempted.
>> +
>> +   For reference, handling of various corner cases is described below:
>> +
>> +   * In case of no buffer in the ``OUTPUT`` queue at the time the
>> +     ``V4L2_ENC_CMD_STOP`` command was issued, the drain sequence completes
>> +     immediately and the encoder returns an empty ``CAPTURE`` buffer with the
>> +     ``V4L2_BUF_FLAG_LAST`` flag set.
>> +
>> +   * In case of no buffer in the ``CAPTURE`` queue at the time the drain
>> +     sequence completes, the next time the client queues a ``CAPTURE`` buffer
>> +     it is returned at once as an empty buffer with the ``V4L2_BUF_FLAG_LAST``
>> +     flag set.
>> +
>> +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``CAPTURE`` queue in the
>> +     middle of the drain sequence, the drain sequence is canceled and all
>> +     ``CAPTURE`` buffers are implicitly returned to the client.
>> +
>> +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``OUTPUT`` queue in the
>> +     middle of the drain sequence, the drain sequence completes immediately and
>> +     next ``CAPTURE`` buffer will be returned empty with the
>> +     ``V4L2_BUF_FLAG_LAST`` flag set.
>> +
>> +   Although mandatory, the availability of encoder commands may be queried
> 
> maybe "Although not mandatory" ?

And another good catch. The same mistake is in dev-decoder.rst, I'll fix it there
as well.

Thanks!

	Hans

> 
>> +   using :c:func:`VIDIOC_TRY_ENCODER_CMD`.
>> +
> 
> <cut>
> 

