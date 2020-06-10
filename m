Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2BE1F5560
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 15:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbgFJNIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 09:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgFJNIn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 09:08:43 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2711CC03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 06:08:43 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id g62so1626950qtd.5
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=A4V43AieJq58YCvw6Xbq5NeVEBpKV9Bnoc/QLfv1ifk=;
        b=d8pHjoFVkf9YWXUyW97dAfr/sYMl71eu3LK7eNkOH7SI35lRBfLx6FmIF/FBfyg9V9
         NABl2uciNbmiqNFHFrymBhldlGgGA1sIn5MCdewAyRd2+o+rFPAw0n1CYhS8q6udfzv9
         8QLClXNVUi0WiCQi3lCS2BAzFSECIk2c0WaAabTi8DV7OiuK9rq/IICZ/Z7JJuYi5P2o
         bmsUu2RiGYuPgQCEH6LbXdfNvt/Lriu1zu3SLbWHFetgV2v8xCIK+pPkc2yvhXo7ep4+
         L/Gx+b3Kt83OlyK8kP16nGsraJMoCL5eHPczTMZJMFF0VfIWcUq3K0Q7M9LLIgF8uL0J
         gmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=A4V43AieJq58YCvw6Xbq5NeVEBpKV9Bnoc/QLfv1ifk=;
        b=lZ8eBq2FWkHSx9oLDM93XyHOmxizXwckh+2e3DhJ+peZ4rH17at5vnmhcwMctSDIFT
         O7iT0bfOb01NQrlR3UY4Axf5R9igfGfmBDlYtYoaRIOF9J34NFrQo7FRLQUBXc0vNhxg
         1tTk4mqbKJDSnmr1HiWuIkF8Mcg7ZdyKVfskRgAVcv8Ylc6NczL2r8mdvpH5Rloa/kWU
         rldnUXRSftskMbOVCeMGpYlTBkh7/m8I/PXiRNVaqmuQ8CubuPIinQe3kHTVm0rO4DyE
         NLIQ/Pkmkw218Ezhf97V2qx59YbhcHCFO/yaTvuAUhJ0BF3FPr+0EYJ8rqeoUDB0K6Y6
         enVw==
X-Gm-Message-State: AOAM530e2ZQ+gPa3KXy2xt+6UAWcSsKTv8M6COGSpiLih2vj3BD/TXz4
        P93LuHwHWoANtTRBTetM/NEfIA==
X-Google-Smtp-Source: ABdhPJywUNUz1Ya6RIDeuQ4oIesauh9CPLHInxoG9RdrRxqQtq8b3Cbvf95kaEj1mftFusBlHXIzaA==
X-Received: by 2002:aed:29c5:: with SMTP id o63mr3164326qtd.386.1591794521365;
        Wed, 10 Jun 2020 06:08:41 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id o66sm12239366qka.60.2020.06.10.06.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 06:08:40 -0700 (PDT)
Message-ID: <a8b466eee221bda45489eca2b7b8ac52c1635bb4.camel@ndufresne.ca>
Subject: Re: [PATCHv3 1/5] media: docs-rst: Document memory-to-memory video
 encoder interface
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Wed, 10 Jun 2020 09:08:39 -0400
In-Reply-To: <CAAFQd5Ce4MPOopmD6pXqF-QkiUdj1+UZ6dceKGeDbM8mvevDbQ@mail.gmail.com>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
         <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
         <728b621a-0df7-5c6f-9135-8b9794035b95@linaro.org>
         <b3c33f48ed8ac31e6148e54ccc1650f3d96e0daa.camel@ndufresne.ca>
         <CAAFQd5Ce4MPOopmD6pXqF-QkiUdj1+UZ6dceKGeDbM8mvevDbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 10 juin 2020 à 14:28 +0200, Tomasz Figa a écrit :
> On Fri, Jun 5, 2020 at 11:24 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > Le vendredi 05 juin 2020 à 10:19 +0300, Stanimir Varbanov a écrit :
> > > On 5/26/20 1:09 PM, Hans Verkuil wrote:
> > > > From: Tomasz Figa <tfiga@chromium.org>
> > > > 
> > > > Due to complexity of the video encoding process, the V4L2 drivers of
> > > > stateful encoder hardware require specific sequences of V4L2 API calls
> > > > to be followed. These include capability enumeration, initialization,
> > > > encoding, encode parameters change, drain and reset.
> > > > 
> > > > Specifics of the above have been discussed during Media Workshops at
> > > > LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > > > Conference Europe 2014 in Düsseldorf. The de facto Codec API that
> > > > originated at those events was later implemented by the drivers we already
> > > > have merged in mainline, such as s5p-mfc or coda.
> > > > 
> > > > The only thing missing was the real specification included as a part of
> > > > Linux Media documentation. Fix it now and document the encoder part of
> > > > the Codec API.
> > > > 
> > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > > ---
> > > >  .../userspace-api/media/v4l/dev-encoder.rst   | 728 ++++++++++++++++++
> > > >  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
> > > >  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
> > > >  .../userspace-api/media/v4l/v4l2.rst          |   2 +
> > > >  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
> > > >  5 files changed, 767 insertions(+), 20 deletions(-)
> > > >  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> > > > new file mode 100644
> > > > index 000000000000..aace7b812a9c
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> > > > @@ -0,0 +1,728 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +.. _encoder:
> > > > +
> > > > +*************************************************
> > > > +Memory-to-Memory Stateful Video Encoder Interface
> > > > +*************************************************
> > > > +
> > > > +A stateful video encoder takes raw video frames in display order and encodes
> > > > +them into a bytestream. It generates complete chunks of the bytestream, including
> > > > +all metadata, headers, etc. The resulting bytestream does not require any
> > > > +further post-processing by the client.
> > > > +
> > > > +Performing software stream processing, header generation etc. in the driver
> > > > +in order to support this interface is strongly discouraged. In case such
> > > > +operations are needed, use of the Stateless Video Encoder Interface (in
> > > > +development) is strongly advised.
> > > > +
> > > 
> > > <cut>
> > > 
> > > > +Encoding Parameter Changes
> > > > +==========================
> > > > +
> > > > +The client is allowed to use :c:func:`VIDIOC_S_CTRL` to change encoder
> > > > +parameters at any time. The availability of parameters is encoder-specific
> > > > +and the client must query the encoder to find the set of available controls.
> > > > +
> > > > +The ability to change each parameter during encoding is encoder-specific, as
> > > > +per the standard semantics of the V4L2 control interface. The client may
> > > > +attempt to set a control during encoding and if the operation fails with the
> > > > +-EBUSY error code, the ``CAPTURE`` queue needs to be stopped for the
> > > > +configuration change to be allowed. To do this, it may follow the `Drain`
> > > > +sequence to avoid losing the already queued/encoded frames.
> > > > +
> > > > +The timing of parameter updates is encoder-specific, as per the standard
> > > > +semantics of the V4L2 control interface. If the client needs to apply the
> > > > +parameters exactly at specific frame, using the Request API
> > > > +(:ref:`media-request-api`) should be considered, if supported by the encoder.
> > > 
> > > In request-api case does the control will return EBUSY immediately when
> > > S_CTRL is called from the client? I'm asking in the context of the
> > > controls which are not dynamic (cannot set during streaming and Reset
> > > sequence is needed).
> > 
> > This is all hypothetical, as nothing of that has been implemented. But
> > I suppose there should be instant validation to allow that, even if
> > that means more plumbing inside the kernel. It would be better then
> > just running the request ignoring silently that control. Ideally
> > userspace should not have to go into trial and errors, so controls that
> > are means for the should be marked.
> > 
> 
> There isn't much to be implemented here, as it's the same standard
> V4L2 behavior as existed for a while. If a device supports changing
> the control on the fly, a call to S_CTRL succeeds, if not, it fails
> with -EBUSY. This is regardless of whether requests are used or not.

Are you against introducing flags to signal generically when a control
will have live effect, delayed effect or will simply be rejected (-
EBUSY) if set while streaming ? I'm particularly concern for cases
where the same control may work live for one driver, and not for
another. It would be very disappointing to get an EBUSY on a bitrate
control of an encoder as an example. So if someone foresee having
bitrate control that cannot be adapted while streaming (or that will
only be applied if a key frame is generated), I'd rather prefer to know
in advance, and likely not select this encoder for WebRTC purpose as an
example. Having to do all the steps to get the driver in streaming in
order to set the control and discover that it's not suitable for the
purpose seems quite sub-optimal.

I'm just saying, but the "standard" that existed for a while has always
been hardcoded to the control (through control documentation, and
that's fine with me) or the HW driver being used (which isn't fine in
my opinion).

> Requests in this case simply synchronize applying the new control
> values with the right frame.
> 
> 
> > > > +
> > > > +Drain
> > > > +=====
> > > > +
> > > > +To ensure that all the queued ``OUTPUT`` buffers have been processed and the
> > > > +related ``CAPTURE`` buffers are given to the client, the client must follow the
> > > > +drain sequence described below. After the drain sequence ends, the client has
> > > > +received all encoded frames for all ``OUTPUT`` buffers queued before the
> > > > +sequence was started.
> > > > +
> > > > +1. Begin the drain sequence by issuing :c:func:`VIDIOC_ENCODER_CMD`.
> > > > +
> > > > +   * **Required fields:**
> > > > +
> > > > +     ``cmd``
> > > > +         set to ``V4L2_ENC_CMD_STOP``.
> > > > +
> > > > +     ``flags``
> > > > +         set to 0.
> > > > +
> > > > +     ``pts``
> > > > +         set to 0.
> > > > +
> > > > +   .. warning::
> > > > +
> > > > +      The sequence can be only initiated if both ``OUTPUT`` and ``CAPTURE``
> > > > +      queues are streaming. For compatibility reasons, the call to
> > > > +      :c:func:`VIDIOC_ENCODER_CMD` will not fail even if any of the queues is
> > > > +      not streaming, but at the same time it will not initiate the `Drain`
> > > > +      sequence and so the steps described below would not be applicable.
> > > > +
> > > > +2. Any ``OUTPUT`` buffers queued by the client before the
> > > > +   :c:func:`VIDIOC_ENCODER_CMD` was issued will be processed and encoded as
> > > > +   normal. The client must continue to handle both queues independently,
> > > > +   similarly to normal encode operation. This includes:
> > > > +
> > > > +   * queuing and dequeuing ``CAPTURE`` buffers, until a buffer marked with the
> > > > +     ``V4L2_BUF_FLAG_LAST`` flag is dequeued,
> > > > +
> > > > +     .. warning::
> > > > +
> > > > +        The last buffer may be empty (with :c:type:`v4l2_buffer`
> > > > +        ``bytesused`` = 0) and in that case it must be ignored by the client,
> > > > +        as it does not contain an encoded frame.
> > > > +
> > > > +     .. note::
> > > > +
> > > > +        Any attempt to dequeue more ``CAPTURE`` buffers beyond the buffer
> > > > +        marked with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE error from
> > > > +        :c:func:`VIDIOC_DQBUF`.
> > > > +
> > > > +   * dequeuing processed ``OUTPUT`` buffers, until all the buffers queued
> > > > +     before the ``V4L2_ENC_CMD_STOP`` command are dequeued,
> > > > +
> > > > +   * dequeuing the ``V4L2_EVENT_EOS`` event, if the client subscribes to it.
> > > > +
> > > > +   .. note::
> > > > +
> > > > +      For backwards compatibility, the encoder will signal a ``V4L2_EVENT_EOS``
> > > > +      event when the last frame has been encoded and all frames are ready to be
> > > > +      dequeued. It is deprecated behavior and the client must not rely on it.
> > > > +      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.
> > > > +
> > > > +3. Once all ``OUTPUT`` buffers queued before the ``V4L2_ENC_CMD_STOP`` call are
> > > > +   dequeued and the last ``CAPTURE`` buffer is dequeued, the encoder is stopped
> > > > +   and it will accept, but not process any newly queued ``OUTPUT`` buffers
> > > > +   until the client issues any of the following operations:
> > > > +
> > > > +   * ``V4L2_ENC_CMD_START`` - the encoder will not be reset and will resume
> > > > +     operation normally, with all the state from before the drain,
> > > > +
> > > > +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
> > > > +     ``CAPTURE`` queue - the encoder will be reset (see the `Reset` sequence)
> > > > +     and then resume encoding,
> > > > +
> > > > +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
> > > > +     ``OUTPUT`` queue - the encoder will resume operation normally, however any
> > > > +     source frames queued to the ``OUTPUT`` queue between ``V4L2_ENC_CMD_STOP``
> > > > +     and :c:func:`VIDIOC_STREAMOFF` will be discarded.
> > > > +
> > > > +.. note::
> > > > +
> > > > +   Once the drain sequence is initiated, the client needs to drive it to
> > > > +   completion, as described by the steps above, unless it aborts the process by
> > > > +   issuing :c:func:`VIDIOC_STREAMOFF` on any of the ``OUTPUT`` or ``CAPTURE``
> > > > +   queues.  The client is not allowed to issue ``V4L2_ENC_CMD_START`` or
> > > > +   ``V4L2_ENC_CMD_STOP`` again while the drain sequence is in progress and they
> > > > +   will fail with -EBUSY error code if attempted.
> > > > +
> > > > +   For reference, handling of various corner cases is described below:
> > > > +
> > > > +   * In case of no buffer in the ``OUTPUT`` queue at the time the
> > > > +     ``V4L2_ENC_CMD_STOP`` command was issued, the drain sequence completes
> > > > +     immediately and the encoder returns an empty ``CAPTURE`` buffer with the
> > > > +     ``V4L2_BUF_FLAG_LAST`` flag set.
> > > > +
> > > > +   * In case of no buffer in the ``CAPTURE`` queue at the time the drain
> > > > +     sequence completes, the next time the client queues a ``CAPTURE`` buffer
> > > > +     it is returned at once as an empty buffer with the ``V4L2_BUF_FLAG_LAST``
> > > > +     flag set.
> > > > +
> > > > +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``CAPTURE`` queue in the
> > > > +     middle of the drain sequence, the drain sequence is canceled and all
> > > > +     ``CAPTURE`` buffers are implicitly returned to the client.
> > > > +
> > > > +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``OUTPUT`` queue in the
> > > > +     middle of the drain sequence, the drain sequence completes immediately and
> > > > +     next ``CAPTURE`` buffer will be returned empty with the
> > > > +     ``V4L2_BUF_FLAG_LAST`` flag set.
> > > > +
> > > > +   Although not mandatory, the availability of encoder commands may be queried
> > > > +   using :c:func:`VIDIOC_TRY_ENCODER_CMD`.
> > > > +
> > > > +Reset
> > > > +=====
> > > > +
> > > > +The client may want to request the encoder to reinitialize the encoding, so
> > > > +that the following stream data becomes independent from the stream data
> > > > +generated before. Depending on the coded format, that may imply that:
> > > > +
> > > > +* encoded frames produced after the restart must not reference any frames
> > > > +  produced before the stop, e.g. no long term references for H.264/HEVC,
> > > > +
> > > > +* any headers that must be included in a standalone stream must be produced
> > > > +  again, e.g. SPS and PPS for H.264/HEVC.
> > > 
> > > It seems that clients needs to know SPS/PPS (for muxers?) and thus they
> > > will need to extract or parse the encoder output buffers to find them.
> > > Maybe the spec should consider adding some buffer flag to mark such
> > > buffers which contain SPS/PPS only.
> > > 
> > > [1] - see at "type AvcCBox struct"
> > > 
> > > Nicolas, how the gstreamer handle this?
> > > 
> > > > +
> > > > +This can be achieved by performing the reset sequence.
> > > > +
> > > > +1. Perform the `Drain` sequence to ensure all the in-flight encoding finishes
> > > > +   and respective buffers are dequeued.
> > > > +
> > > > +2. Stop streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMOFF`. This
> > > > +   will return all currently queued ``CAPTURE`` buffers to the client, without
> > > > +   valid frame data.
> > > > +
> > > > +3. Start streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMON` and
> > > > +   continue with regular encoding sequence. The encoded frames produced into
> > > > +   ``CAPTURE`` buffers from now on will contain a standalone stream that can be
> > > > +   decoded without the need for frames encoded before the reset sequence,
> > > > +   starting at the first ``OUTPUT`` buffer queued after issuing the
> > > > +   `V4L2_ENC_CMD_STOP` of the `Drain` sequence.
> > > > +
> > > > +This sequence may be also used to change encoding parameters for encoders
> > > > +without the ability to change the parameters on the fly.
> > > > +
> > > 
> > > <cut>
> > > 

