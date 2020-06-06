Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8801F05A5
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2020 09:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728646AbgFFH6e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 03:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgFFH6d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 03:58:33 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7416BC08C5C2
        for <linux-media@vger.kernel.org>; Sat,  6 Jun 2020 00:58:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u13so10437361wml.1
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2020 00:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NQ7QADkk0hfD+cPR/lag0gEju3UTV8lNqsaKUYTptq8=;
        b=XpfMerZaT4HGrqHcDWmmlR4WoYqU6wEh7/7QUyBskmK1JckuIHP4CYemUyAChgu0fN
         sxcHV/dHfbxLO8S5OeXicMziZEjSkLxqVp9wIFSsHZZu/VzSKrPy+mO2i4YTPAP3pU5J
         MkoLPKzq25fOOhZeqt1mv1pZaPrigZuP937uIr8gwE0o/tFozSK7r0Pk7RyKNTOL0CRu
         x4re9CBCR293FdI51pNSjOprx5nhu8XkmMR4kLua07TSUhcLjJl7+3Me9xu87SdP8Sc1
         AXu8t95AJUrMLIs/X88vvtwGVnLPYlmSTd1kuJ8lPP1K8HWQ6NWWmlswHIiWI4qV0/5z
         PXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NQ7QADkk0hfD+cPR/lag0gEju3UTV8lNqsaKUYTptq8=;
        b=DWBQPQyMHNgSMPZ0QutARq7MH6nBOZvSocuGuO66Myaj0HiKmMJLBGLYD0hhupjEu3
         xD+Z3FS08qswLf5q55sw366k5/TxkV5XSYSJ2AR0/3hk50kKevJqN2FkBMHxa+3ad6jg
         HNCdX9MQXA0Jorz1toF2UfCjmuaZpnKkEbkhhQyPehoVkoPT+046vWGXZuh6wjeSvgt2
         a0wMfod2JFDNjT3Vzf5AbjmzOUdJo2pNQgYdzPze7BK28/VJTDko1bm4kAbYvgnFr9ok
         /805KK35yT0nM6iKP8waneF19cFn30pFUOZyWnMNI11FBMuDBeKwXPt98cZ5YM4rtAbe
         JJrA==
X-Gm-Message-State: AOAM532AjKsfG4nGVDuS6pHXfoPeL6qX7OA5qpA1k1WqQP0q5hUPxnju
        mo4u9JENalU3Rgehl7LIORUO9g==
X-Google-Smtp-Source: ABdhPJy8+KQboq3QjM+NcT/j+ogeavIDgmN7xDRt9Ui5144eeIKlSedb3oYeDIcYjpUtN8eiOXc2Vw==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr4580852wmb.165.1591430311992;
        Sat, 06 Jun 2020 00:58:31 -0700 (PDT)
Received: from [192.168.1.9] (hst-208-217.medicom.bg. [84.238.208.217])
        by smtp.googlemail.com with ESMTPSA id u4sm15031608wmb.48.2020.06.06.00.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2020 00:58:31 -0700 (PDT)
Subject: Re: [PATCHv3 1/5] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl>
 <728b621a-0df7-5c6f-9135-8b9794035b95@linaro.org>
 <b3c33f48ed8ac31e6148e54ccc1650f3d96e0daa.camel@ndufresne.ca>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <35facbd5-d85c-98b8-0cb6-9ecf52681f08@linaro.org>
Date:   Sat, 6 Jun 2020 10:58:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b3c33f48ed8ac31e6148e54ccc1650f3d96e0daa.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On 6/6/20 12:24 AM, Nicolas Dufresne wrote:
> Le vendredi 05 juin 2020 à 10:19 +0300, Stanimir Varbanov a écrit :
>>
>> On 5/26/20 1:09 PM, Hans Verkuil wrote:
>>> From: Tomasz Figa <tfiga@chromium.org>
>>>
>>> Due to complexity of the video encoding process, the V4L2 drivers of
>>> stateful encoder hardware require specific sequences of V4L2 API calls
>>> to be followed. These include capability enumeration, initialization,
>>> encoding, encode parameters change, drain and reset.
>>>
>>> Specifics of the above have been discussed during Media Workshops at
>>> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
>>> Conference Europe 2014 in Düsseldorf. The de facto Codec API that
>>> originated at those events was later implemented by the drivers we already
>>> have merged in mainline, such as s5p-mfc or coda.
>>>
>>> The only thing missing was the real specification included as a part of
>>> Linux Media documentation. Fix it now and document the encoder part of
>>> the Codec API.
>>>
>>> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> ---
>>>  .../userspace-api/media/v4l/dev-encoder.rst   | 728 ++++++++++++++++++
>>>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>>>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
>>>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
>>>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
>>>  5 files changed, 767 insertions(+), 20 deletions(-)
>>>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
>>> new file mode 100644
>>> index 000000000000..aace7b812a9c
>>> --- /dev/null
>>> +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
>>> @@ -0,0 +1,728 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +.. _encoder:
>>> +
>>> +*************************************************
>>> +Memory-to-Memory Stateful Video Encoder Interface
>>> +*************************************************
>>> +
>>> +A stateful video encoder takes raw video frames in display order and encodes
>>> +them into a bytestream. It generates complete chunks of the bytestream, including
>>> +all metadata, headers, etc. The resulting bytestream does not require any
>>> +further post-processing by the client.
>>> +
>>> +Performing software stream processing, header generation etc. in the driver
>>> +in order to support this interface is strongly discouraged. In case such
>>> +operations are needed, use of the Stateless Video Encoder Interface (in
>>> +development) is strongly advised.
>>> +
>>
>> <cut>
>>
>>> +Encoding Parameter Changes
>>> +==========================
>>> +
>>> +The client is allowed to use :c:func:`VIDIOC_S_CTRL` to change encoder
>>> +parameters at any time. The availability of parameters is encoder-specific
>>> +and the client must query the encoder to find the set of available controls.
>>> +
>>> +The ability to change each parameter during encoding is encoder-specific, as
>>> +per the standard semantics of the V4L2 control interface. The client may
>>> +attempt to set a control during encoding and if the operation fails with the
>>> +-EBUSY error code, the ``CAPTURE`` queue needs to be stopped for the
>>> +configuration change to be allowed. To do this, it may follow the `Drain`
>>> +sequence to avoid losing the already queued/encoded frames.
>>> +
>>> +The timing of parameter updates is encoder-specific, as per the standard
>>> +semantics of the V4L2 control interface. If the client needs to apply the
>>> +parameters exactly at specific frame, using the Request API
>>> +(:ref:`media-request-api`) should be considered, if supported by the encoder.
>>
>> In request-api case does the control will return EBUSY immediately when
>> S_CTRL is called from the client? I'm asking in the context of the
>> controls which are not dynamic (cannot set during streaming and Reset
>> sequence is needed).
> 
> This is all hypothetical, as nothing of that has been implemented. But
> I suppose there should be instant validation to allow that, even if
> that means more plumbing inside the kernel. It would be better then
> just running the request ignoring silently that control. Ideally
> userspace should not have to go into trial and errors, so controls that
> are means for the should be marked.

Meanwhile I looked into the controls code and found that at least
.try_ctrl will be called.

Do you have something to add in below subject for SPS/PPS?


> 
>>
>>> +
>>> +Drain
>>> +=====
>>> +
>>> +To ensure that all the queued ``OUTPUT`` buffers have been processed and the
>>> +related ``CAPTURE`` buffers are given to the client, the client must follow the
>>> +drain sequence described below. After the drain sequence ends, the client has
>>> +received all encoded frames for all ``OUTPUT`` buffers queued before the
>>> +sequence was started.
>>> +
>>> +1. Begin the drain sequence by issuing :c:func:`VIDIOC_ENCODER_CMD`.
>>> +
>>> +   * **Required fields:**
>>> +
>>> +     ``cmd``
>>> +         set to ``V4L2_ENC_CMD_STOP``.
>>> +
>>> +     ``flags``
>>> +         set to 0.
>>> +
>>> +     ``pts``
>>> +         set to 0.
>>> +
>>> +   .. warning::
>>> +
>>> +      The sequence can be only initiated if both ``OUTPUT`` and ``CAPTURE``
>>> +      queues are streaming. For compatibility reasons, the call to
>>> +      :c:func:`VIDIOC_ENCODER_CMD` will not fail even if any of the queues is
>>> +      not streaming, but at the same time it will not initiate the `Drain`
>>> +      sequence and so the steps described below would not be applicable.
>>> +
>>> +2. Any ``OUTPUT`` buffers queued by the client before the
>>> +   :c:func:`VIDIOC_ENCODER_CMD` was issued will be processed and encoded as
>>> +   normal. The client must continue to handle both queues independently,
>>> +   similarly to normal encode operation. This includes:
>>> +
>>> +   * queuing and dequeuing ``CAPTURE`` buffers, until a buffer marked with the
>>> +     ``V4L2_BUF_FLAG_LAST`` flag is dequeued,
>>> +
>>> +     .. warning::
>>> +
>>> +        The last buffer may be empty (with :c:type:`v4l2_buffer`
>>> +        ``bytesused`` = 0) and in that case it must be ignored by the client,
>>> +        as it does not contain an encoded frame.
>>> +
>>> +     .. note::
>>> +
>>> +        Any attempt to dequeue more ``CAPTURE`` buffers beyond the buffer
>>> +        marked with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE error from
>>> +        :c:func:`VIDIOC_DQBUF`.
>>> +
>>> +   * dequeuing processed ``OUTPUT`` buffers, until all the buffers queued
>>> +     before the ``V4L2_ENC_CMD_STOP`` command are dequeued,
>>> +
>>> +   * dequeuing the ``V4L2_EVENT_EOS`` event, if the client subscribes to it.
>>> +
>>> +   .. note::
>>> +
>>> +      For backwards compatibility, the encoder will signal a ``V4L2_EVENT_EOS``
>>> +      event when the last frame has been encoded and all frames are ready to be
>>> +      dequeued. It is deprecated behavior and the client must not rely on it.
>>> +      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.
>>> +
>>> +3. Once all ``OUTPUT`` buffers queued before the ``V4L2_ENC_CMD_STOP`` call are
>>> +   dequeued and the last ``CAPTURE`` buffer is dequeued, the encoder is stopped
>>> +   and it will accept, but not process any newly queued ``OUTPUT`` buffers
>>> +   until the client issues any of the following operations:
>>> +
>>> +   * ``V4L2_ENC_CMD_START`` - the encoder will not be reset and will resume
>>> +     operation normally, with all the state from before the drain,
>>> +
>>> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
>>> +     ``CAPTURE`` queue - the encoder will be reset (see the `Reset` sequence)
>>> +     and then resume encoding,
>>> +
>>> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
>>> +     ``OUTPUT`` queue - the encoder will resume operation normally, however any
>>> +     source frames queued to the ``OUTPUT`` queue between ``V4L2_ENC_CMD_STOP``
>>> +     and :c:func:`VIDIOC_STREAMOFF` will be discarded.
>>> +
>>> +.. note::
>>> +
>>> +   Once the drain sequence is initiated, the client needs to drive it to
>>> +   completion, as described by the steps above, unless it aborts the process by
>>> +   issuing :c:func:`VIDIOC_STREAMOFF` on any of the ``OUTPUT`` or ``CAPTURE``
>>> +   queues.  The client is not allowed to issue ``V4L2_ENC_CMD_START`` or
>>> +   ``V4L2_ENC_CMD_STOP`` again while the drain sequence is in progress and they
>>> +   will fail with -EBUSY error code if attempted.
>>> +
>>> +   For reference, handling of various corner cases is described below:
>>> +
>>> +   * In case of no buffer in the ``OUTPUT`` queue at the time the
>>> +     ``V4L2_ENC_CMD_STOP`` command was issued, the drain sequence completes
>>> +     immediately and the encoder returns an empty ``CAPTURE`` buffer with the
>>> +     ``V4L2_BUF_FLAG_LAST`` flag set.
>>> +
>>> +   * In case of no buffer in the ``CAPTURE`` queue at the time the drain
>>> +     sequence completes, the next time the client queues a ``CAPTURE`` buffer
>>> +     it is returned at once as an empty buffer with the ``V4L2_BUF_FLAG_LAST``
>>> +     flag set.
>>> +
>>> +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``CAPTURE`` queue in the
>>> +     middle of the drain sequence, the drain sequence is canceled and all
>>> +     ``CAPTURE`` buffers are implicitly returned to the client.
>>> +
>>> +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``OUTPUT`` queue in the
>>> +     middle of the drain sequence, the drain sequence completes immediately and
>>> +     next ``CAPTURE`` buffer will be returned empty with the
>>> +     ``V4L2_BUF_FLAG_LAST`` flag set.
>>> +
>>> +   Although not mandatory, the availability of encoder commands may be queried
>>> +   using :c:func:`VIDIOC_TRY_ENCODER_CMD`.
>>> +
>>> +Reset
>>> +=====
>>> +
>>> +The client may want to request the encoder to reinitialize the encoding, so
>>> +that the following stream data becomes independent from the stream data
>>> +generated before. Depending on the coded format, that may imply that:
>>> +
>>> +* encoded frames produced after the restart must not reference any frames
>>> +  produced before the stop, e.g. no long term references for H.264/HEVC,
>>> +
>>> +* any headers that must be included in a standalone stream must be produced
>>> +  again, e.g. SPS and PPS for H.264/HEVC.
>>
>> It seems that clients needs to know SPS/PPS (for muxers?) and thus they
>> will need to extract or parse the encoder output buffers to find them.
>> Maybe the spec should consider adding some buffer flag to mark such
>> buffers which contain SPS/PPS only.
>>
>> [1] - see at "type AvcCBox struct"
>>
>> Nicolas, how the gstreamer handle this?
>>
>>> +
>>> +This can be achieved by performing the reset sequence.
>>> +
>>> +1. Perform the `Drain` sequence to ensure all the in-flight encoding finishes
>>> +   and respective buffers are dequeued.
>>> +
>>> +2. Stop streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMOFF`. This
>>> +   will return all currently queued ``CAPTURE`` buffers to the client, without
>>> +   valid frame data.
>>> +
>>> +3. Start streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMON` and
>>> +   continue with regular encoding sequence. The encoded frames produced into
>>> +   ``CAPTURE`` buffers from now on will contain a standalone stream that can be
>>> +   decoded without the need for frames encoded before the reset sequence,
>>> +   starting at the first ``OUTPUT`` buffer queued after issuing the
>>> +   `V4L2_ENC_CMD_STOP` of the `Drain` sequence.
>>> +
>>> +This sequence may be also used to change encoding parameters for encoders
>>> +without the ability to change the parameters on the fly.
>>> +
>>
>> <cut>
>>
> 

-- 
regards,
Stan
