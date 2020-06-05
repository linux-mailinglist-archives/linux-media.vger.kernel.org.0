Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02FB1EF1D4
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 09:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgFEHTN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 03:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgFEHTM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 03:19:12 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606F3C08C5C2
        for <linux-media@vger.kernel.org>; Fri,  5 Jun 2020 00:19:12 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id k11so8932129ejr.9
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2020 00:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YkwBwN3dnUPCTlfjTR3MYp+fWxYYUrCZuYfP1Bf70cE=;
        b=Qy51lZ3MN/GBpDghhvK5z3Am4VMpYa1hEIk2QhYW5kqmwSHzPnBDKIEABTums3DWqk
         R58AC527BDS87nrxVHgH+sRRWbPylW4j0X/sf0ha5i9ZFzk30yA07C08GOoJwQtEUaes
         FFrCZK0EH+VN39Ycl+sM7y50swoasCCR2rcRI7xIUbZYVp/sno1sAN1EPBNFzlXFwK+h
         h4H0ncaPG3ELIVJZMHubnHP5jQABzvqJDpB926nE/dQ5WsLiLajH2Hz9TuBLJqmuCd98
         alU1gtSoOAxgjx1e4A0JPLIOin3PuLGpTCzUtuV7DfMmpGPAK9XbveT+cKdA5OZy1LW4
         42bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YkwBwN3dnUPCTlfjTR3MYp+fWxYYUrCZuYfP1Bf70cE=;
        b=UhvSSRiajSM9RPjbBOF+l7buc7pb86u99YJdLV4aukXHsxcJkAA+V1kZHqYoQD0hwG
         envTMr3qdgCH6aSAiUL8wdO61HiyzkIkF/tscXyp01bfxQfkhwj8alwznA3qvgeycRWG
         R0Fobc5njmrjqhR9gjJHkNhu+l+JynZf5pZYwqhHK/Og/1nVVCf5Rvpoh4ms/LpAK6xI
         8pu8dSZK1QWMkO1rOEHHw16YqDRnD4Yp7Wbakbi7wM/RpRGKDAKcYd9Fnzcgki5IxGUF
         kNV58o84CvXhrtRmV74lHQz1MOSx0LUQcHhFISKePDxlS8S0vn6aYgKpQ7EcldTBzmW4
         tEfg==
X-Gm-Message-State: AOAM533Zjuc/uw3uibTqqCgY7t2PAIXmf+JfnRrJcXF1wcpm1PvZxrp2
        dS0AUamly7OWHafZvHKbowXCig==
X-Google-Smtp-Source: ABdhPJxABvxXOfOGFnmxvpJdKnE+U7yHEM4YukPh+U4UknM+yGPnFouVmk1V1nG73RG1e7YAeLf2bg==
X-Received: by 2002:a17:906:e05:: with SMTP id l5mr7959931eji.318.1591341550768;
        Fri, 05 Jun 2020 00:19:10 -0700 (PDT)
Received: from [192.168.1.4] (212-5-158-209.ip.btc-net.bg. [212.5.158.209])
        by smtp.googlemail.com with ESMTPSA id f1sm4215170edn.66.2020.06.05.00.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2020 00:19:09 -0700 (PDT)
Subject: Re: [PATCHv3 1/5] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <728b621a-0df7-5c6f-9135-8b9794035b95@linaro.org>
Date:   Fri, 5 Jun 2020 10:19:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/26/20 1:09 PM, Hans Verkuil wrote:
> From: Tomasz Figa <tfiga@chromium.org>
> 
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
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../userspace-api/media/v4l/dev-encoder.rst   | 728 ++++++++++++++++++
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>  5 files changed, 767 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> new file mode 100644
> index 000000000000..aace7b812a9c
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> @@ -0,0 +1,728 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _encoder:
> +
> +*************************************************
> +Memory-to-Memory Stateful Video Encoder Interface
> +*************************************************
> +
> +A stateful video encoder takes raw video frames in display order and encodes
> +them into a bytestream. It generates complete chunks of the bytestream, including
> +all metadata, headers, etc. The resulting bytestream does not require any
> +further post-processing by the client.
> +
> +Performing software stream processing, header generation etc. in the driver
> +in order to support this interface is strongly discouraged. In case such
> +operations are needed, use of the Stateless Video Encoder Interface (in
> +development) is strongly advised.
> +

<cut>

> +Encoding Parameter Changes
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

In request-api case does the control will return EBUSY immediately when
S_CTRL is called from the client? I'm asking in the context of the
controls which are not dynamic (cannot set during streaming and Reset
sequence is needed).

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
> +         set to ``V4L2_ENC_CMD_STOP``.
> +
> +     ``flags``
> +         set to 0.
> +
> +     ``pts``
> +         set to 0.
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
> +        Any attempt to dequeue more ``CAPTURE`` buffers beyond the buffer
> +        marked with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE error from
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
> +      event when the last frame has been encoded and all frames are ready to be
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
> +   For reference, handling of various corner cases is described below:
> +
> +   * In case of no buffer in the ``OUTPUT`` queue at the time the
> +     ``V4L2_ENC_CMD_STOP`` command was issued, the drain sequence completes
> +     immediately and the encoder returns an empty ``CAPTURE`` buffer with the
> +     ``V4L2_BUF_FLAG_LAST`` flag set.
> +
> +   * In case of no buffer in the ``CAPTURE`` queue at the time the drain
> +     sequence completes, the next time the client queues a ``CAPTURE`` buffer
> +     it is returned at once as an empty buffer with the ``V4L2_BUF_FLAG_LAST``
> +     flag set.
> +
> +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``CAPTURE`` queue in the
> +     middle of the drain sequence, the drain sequence is canceled and all
> +     ``CAPTURE`` buffers are implicitly returned to the client.
> +
> +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``OUTPUT`` queue in the
> +     middle of the drain sequence, the drain sequence completes immediately and
> +     next ``CAPTURE`` buffer will be returned empty with the
> +     ``V4L2_BUF_FLAG_LAST`` flag set.
> +
> +   Although not mandatory, the availability of encoder commands may be queried
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
> +  produced before the stop, e.g. no long term references for H.264/HEVC,
> +
> +* any headers that must be included in a standalone stream must be produced
> +  again, e.g. SPS and PPS for H.264/HEVC.

It seems that clients needs to know SPS/PPS (for muxers?) and thus they
will need to extract or parse the encoder output buffers to find them.
Maybe the spec should consider adding some buffer flag to mark such
buffers which contain SPS/PPS only.

[1] - see at "type AvcCBox struct"

Nicolas, how the gstreamer handle this?

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

<cut>

-- 
regards,
Stan

[1]
https://pkg.go.dev/github.com/Afrostream/afrostream-media-server/src/mp4?tab=doc
