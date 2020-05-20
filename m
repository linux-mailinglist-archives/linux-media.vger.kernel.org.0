Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967CA1DC036
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 22:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgETUd7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 16:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgETUd6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 16:33:58 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7379DC061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 13:33:58 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id x20so5797009ejb.11
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 13:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KGK5g6ZeyYgMt+fjiIo+/a3Da+ZbjJzcvLCGLSs1Dqs=;
        b=fpeCVWM1SFaCm7mNDPYF1U1H66394IK2F6l9mJD2cMj/XpwX49m88tLdPTl2OfAILZ
         rctqetEgOdCT2PbjfSkZs4syGhtkV/5yfyyYxjfRoKmA6I0nZZiwpXT/McSsgByQc6mq
         S9EVx0O3qjSRvSeQPTy7qzF1wSM795ZdFBtbZqKL7GC5cvqIdVZx2QufMtdXT4INeKg9
         HM6PlipvKkRytP3szhJRcnwBHIb3a62+OGegfEifdlyANVXK6O+wFif8RTfDQcrnoCuh
         ziMfa1/eAfUAdS3arsT8YYHchZ4xJ9NNL0T6zVbujy0o6VjHnSg8+2lkC8ETNpKJ5znM
         Q7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KGK5g6ZeyYgMt+fjiIo+/a3Da+ZbjJzcvLCGLSs1Dqs=;
        b=JKd75PuwC40N1GxWsMapGwbBZi6TTCG877sJnhK2MpBbVpByixNj+IaHiIe0rgqURc
         tiKczcEh7dloy29M3xZRBMCXARvxYKFv9CE/zLOkIFrRZ3uT7EdEqfFkHG0yK0VLAM4b
         qerRsg59PtQcenSgxoQEi+35thw4pHwBBuVKZodSe1SyEAS+b4K7EmsL4SdDecxQolI7
         NfzK5LqoYq1srAMNi3xRxExAfcB/sDiGAyxXOm8qzTYP/5R7ebm4FOwWXYF44jIzjpmd
         OZg7DyS4G1CTSNTAvX7AIaqwujZVDXH3s/B8T472N2CMvDE2zKxAdvyN6rd33PT0TqrO
         7TxQ==
X-Gm-Message-State: AOAM531IK5eyNP/SCtRZasqKkX/IxO+7szP9tDx74DCQ1OmLCZMbwFqw
        OFTqMs8U6RN+BBRk7mzlSylwtg==
X-Google-Smtp-Source: ABdhPJwzeyiVgDF5GcSSUsjOtxsKjaBodZJVhPf8Y3IxNOPEuhwOQGoLpdU2JDvNb5/es764l8tGtA==
X-Received: by 2002:a17:907:4003:: with SMTP id nj3mr732913ejb.527.1590006836998;
        Wed, 20 May 2020 13:33:56 -0700 (PDT)
Received: from [192.168.1.4] (212-5-158-12.ip.btc-net.bg. [212.5.158.12])
        by smtp.googlemail.com with ESMTPSA id h25sm2761903ejx.7.2020.05.20.13.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 13:33:56 -0700 (PDT)
Subject: Re: [PATCHv2 1/2] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
 <20200520100159.2094831-2-hverkuil-cisco@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9553a1bc-541b-6664-d476-14fdf6d9b4cf@linaro.org>
Date:   Wed, 20 May 2020 23:33:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520100159.2094831-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 5/20/20 1:01 PM, Hans Verkuil wrote:
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
>  .../userspace-api/media/v4l/dev-encoder.rst   | 727 ++++++++++++++++++
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>  5 files changed, 766 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> new file mode 100644
> index 000000000000..b30ef9c5d970
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> @@ -0,0 +1,727 @@
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

> +Encoding
> +========
> +
> +This state is reached after the `Initialization` sequence finishes
> +successfully.  In this state, the client queues and dequeues buffers to both
> +queues via :c:func:`VIDIOC_QBUF` and :c:func:`VIDIOC_DQBUF`, following the
> +standard semantics.
> +
> +The content of encoded ``CAPTURE`` buffers depends on the active coded pixel
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
> +* a buffer queued to ``OUTPUT`` may result in more than one buffer produced on
> +  ``CAPTURE`` (for example, if returning an encoded frame allowed the encoder
> +  to return a frame that preceded it in display, but succeeded it in the decode
> +  order; however, there may be other reasons for this as well),
> +
> +* a buffer queued to ``OUTPUT`` may result in a buffer being produced on
> +  ``CAPTURE`` later into encode process, and/or after processing further
> +  ``OUTPUT`` buffers, or be returned out of order, e.g. if display
> +  reordering is used,
> +
> +* buffers may become available on the ``CAPTURE`` queue without additional
> +  buffers queued to ``OUTPUT`` (e.g. during drain or ``EOS``), because of the
> +  ``OUTPUT`` buffers queued in the past whose decoding results are only

						 ^^^ encoding

> +  available at later time, due to specifics of the decoding process,

						      ^^^ encoding

> +
> +* buffers queued to ``OUTPUT`` may not become available to dequeue instantly
> +  after being encoded into a corresponding ``CAPTURE`` buffer, e.g. if the
> +  encoder needs to use the frame as a reference for encoding further frames.
> +

<cut>

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
> +   Although mandatory, the availability of encoder commands may be queried

maybe "Although not mandatory" ?

> +   using :c:func:`VIDIOC_TRY_ENCODER_CMD`.
> +

<cut>

-- 
regards,
Stan
