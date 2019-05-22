Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0F2225FB8
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 10:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbfEVIoJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 04:44:09 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44786 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728491AbfEVIoJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 04:44:09 -0400
Received: by mail-ed1-f68.google.com with SMTP id b8so2624045edm.11
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8hZOMikNAdzCFXs81DxGOYILQe00ak1lGbNwJA4vBN4=;
        b=lLdzOP/71hf7UMsKFU7/V28RAB2acIvdFBwvqXVM5Zw5LWKzkEI2a3N+h8dVTBnYX+
         pvJLJKvlHHOI0lKXGG7rYRD/szkHoAbo0JhtIaC90HbDdIZxbSINW87+upiFbuShOpGq
         e2eIWh0Qfta43D0nSEBeVOIu2lko+k+H5l9HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8hZOMikNAdzCFXs81DxGOYILQe00ak1lGbNwJA4vBN4=;
        b=rUwHhBUlQjnu8Lhaz4LWEx6lzbo5yNkLOQPCr55bdprlFr5t8OT3ubH6WXblPPuEa6
         jBHXz05bX3r1IBL+S58n7QUXIgKnSJTGJYGcAWcBtl5N/QTwTn7EXqKSazYP+qhWQNq7
         BJBswOJIXqKBoMXqOeeIsBj3CP+EBMh2Gl/QaBdbGu6o3xUY2zXI3F0rsTeomlKY2g5t
         7eFziAs0NjBeoEdXft1L+dIOKNV/0fVrmTLDdf8Nuw+UYZLxHMkxDzCQXlyYY14uTILQ
         +qv4x3pokjIDpkp22EMwh96JgUyRn2y2uEa6cEADnUkE1oq1rqAM5k/h51TrWcRD/t8V
         TuKA==
X-Gm-Message-State: APjAAAVJTatmZAlvHaVewjp8TbA+zIW22nLlvbQANfdajVq2WX0C8DN9
        olG3QX5oVO4NrnzRbLzabzKZnuovJruowQ==
X-Google-Smtp-Source: APXvYqy+V7PDTow0dGDbRdiXW1cC1eJyV6u4Y3TI0L1M+4W5QSlAv0zHi+ANccTFDoJujxWfK59mcQ==
X-Received: by 2002:a50:8818:: with SMTP id b24mr88820964edb.28.1558514647018;
        Wed, 22 May 2019 01:44:07 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id s23sm67934edb.12.2019.05.22.01.44.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 01:44:05 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id w13so1261363wru.11
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 01:44:04 -0700 (PDT)
X-Received: by 2002:adf:e4d2:: with SMTP id v18mr13578692wrm.189.1558514643525;
 Wed, 22 May 2019 01:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190124100419.26492-1-tfiga@chromium.org> <20190124100419.26492-3-tfiga@chromium.org>
 <cb3c73e0-9481-54d1-8730-69e51655d7d8@xs4all.nl> <CAAFQd5AqRzGehW6fN4P=_oVdPdH+bJQqKhxgP6zsu80p-74bXA@mail.gmail.com>
 <fded491f-8a25-3283-76c4-dee3dd56045e@xs4all.nl> <CAAFQd5CYT=eA_eFyHLTePBQatOBVwsoDjAfMoybJeWrO7V-raA@mail.gmail.com>
 <2376896b-0087-5eee-a4b9-6ad03b0fef9c@xs4all.nl> <CAAFQd5BWXhTBWM0DtakC6KgrBdXbP_3rw5V4RhV53kFzh0awvw@mail.gmail.com>
In-Reply-To: <CAAFQd5BWXhTBWM0DtakC6KgrBdXbP_3rw5V4RhV53kFzh0awvw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 22 May 2019 17:43:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ci6QCFyVtTo11NeKZ2KA+keicqoVd72mOyhRK8-tGrsQ@mail.gmail.com>
Message-ID: <CAAFQd5Ci6QCFyVtTo11NeKZ2KA+keicqoVd72mOyhRK8-tGrsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pawel Osciak <posciak@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Kamil Debski <kamil@wypas.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Jeongtae Park <jtp.park@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= 
        <andrew-ct.chen@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Todor Tomov <todor.tomov@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dave.stevenson@raspberrypi.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 9, 2019 at 6:43 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Tue, Apr 9, 2019 at 6:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 4/9/19 9:11 AM, Tomasz Figa wrote:
> > > On Mon, Apr 8, 2019 at 5:43 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > >>
> > >> On 4/8/19 10:36 AM, Tomasz Figa wrote:
> > >>> On Mon, Mar 25, 2019 at 10:12 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > >>>>
> > >>>> Another comment found while creating compliance tests:
> > >>>>
> > >>>> On 1/24/19 11:04 AM, Tomasz Figa wrote:
> > >>>>> +Drain
> > >>>>> +=====
> > >>>>> +
> > >>>>> +To ensure that all the queued ``OUTPUT`` buffers have been processed and the
> > >>>>> +related ``CAPTURE`` buffers are given to the client, the client must follow the
> > >>>>> +drain sequence described below. After the drain sequence ends, the client has
> > >>>>> +received all encoded frames for all ``OUTPUT`` buffers queued before the
> > >>>>> +sequence was started.
> > >>>>> +
> > >>>>> +1. Begin the drain sequence by issuing :c:func:`VIDIOC_ENCODER_CMD`.
> > >>>>> +
> > >>>>> +   * **Required fields:**
> > >>>>> +
> > >>>>> +     ``cmd``
> > >>>>> +         set to ``V4L2_ENC_CMD_STOP``
> > >>>>> +
> > >>>>> +     ``flags``
> > >>>>> +         set to 0
> > >>>>> +
> > >>>>> +     ``pts``
> > >>>>> +         set to 0
> > >>>>> +
> > >>>>> +   .. warning::
> > >>>>> +
> > >>>>> +      The sequence can be only initiated if both ``OUTPUT`` and ``CAPTURE``
> > >>>>> +      queues are streaming. For compatibility reasons, the call to
> > >>>>> +      :c:func:`VIDIOC_ENCODER_CMD` will not fail even if any of the queues is
> > >>>>> +      not streaming, but at the same time it will not initiate the `Drain`
> > >>>>> +      sequence and so the steps described below would not be applicable.
> > >>>>> +
> > >>>>> +2. Any ``OUTPUT`` buffers queued by the client before the
> > >>>>> +   :c:func:`VIDIOC_ENCODER_CMD` was issued will be processed and encoded as
> > >>>>> +   normal. The client must continue to handle both queues independently,
> > >>>>> +   similarly to normal encode operation. This includes:
> > >>>>> +
> > >>>>> +   * queuing and dequeuing ``CAPTURE`` buffers, until a buffer marked with the
> > >>>>> +     ``V4L2_BUF_FLAG_LAST`` flag is dequeued,
> > >>>>> +
> > >>>>> +     .. warning::
> > >>>>> +
> > >>>>> +        The last buffer may be empty (with :c:type:`v4l2_buffer`
> > >>>>> +        ``bytesused`` = 0) and in that case it must be ignored by the client,
> > >>>>> +        as it does not contain an encoded frame.
> > >>>>> +
> > >>>>> +     .. note::
> > >>>>> +
> > >>>>> +        Any attempt to dequeue more buffers beyond the buffer marked with
> > >>>>> +        ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE error from
> > >>>>> +        :c:func:`VIDIOC_DQBUF`.
> > >>>>> +
> > >>>>> +   * dequeuing processed ``OUTPUT`` buffers, until all the buffers queued
> > >>>>> +     before the ``V4L2_ENC_CMD_STOP`` command are dequeued,
> > >>>>> +
> > >>>>> +   * dequeuing the ``V4L2_EVENT_EOS`` event, if the client subscribes to it.
> > >>>>> +
> > >>>>> +   .. note::
> > >>>>> +
> > >>>>> +      For backwards compatibility, the encoder will signal a ``V4L2_EVENT_EOS``
> > >>>>> +      event when the last frame has been decoded and all frames are ready to be
> > >>>>> +      dequeued. It is deprecated behavior and the client must not rely on it.
> > >>>>> +      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.
> > >>>>> +
> > >>>>> +3. Once all ``OUTPUT`` buffers queued before the ``V4L2_ENC_CMD_STOP`` call are
> > >>>>> +   dequeued and the last ``CAPTURE`` buffer is dequeued, the encoder is stopped
> > >>>>> +   and it will accept, but not process any newly queued ``OUTPUT`` buffers
> > >>>>> +   until the client issues any of the following operations:
> > >>>>> +
> > >>>>> +   * ``V4L2_ENC_CMD_START`` - the encoder will not be reset and will resume
> > >>>>> +     operation normally, with all the state from before the drain,
> > >>>>
> > >>>> I assume that calling CMD_START when *not* draining will succeed but does nothing.
> > >>>>
> > >>>> In other words: while draining is in progress START will return EBUSY. When draining
> > >>>> was finished, then START will resume the encoder. In all other cases it just returns
> > >>>> 0 since the encoder is really already started.
> > >>>>
> > >>>
> > >>> Yes, that was the intention and seems to be the closest to the
> > >>> behavior described in the existing documentation.
> > >>>
> > >>>>> +
> > >>>>> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
> > >>>>> +     ``CAPTURE`` queue - the encoder will be reset (see the `Reset` sequence)
> > >>>>> +     and then resume encoding,
> > >>>>> +
> > >>>>> +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAMON` on the
> > >>>>> +     ``OUTPUT`` queue - the encoder will resume operation normally, however any
> > >>>>> +     source frames queued to the ``OUTPUT`` queue between ``V4L2_ENC_CMD_STOP``
> > >>>>> +     and :c:func:`VIDIOC_STREAMOFF` will be discarded.
> > >>>>> +
> > >>>>> +.. note::
> > >>>>> +
> > >>>>> +   Once the drain sequence is initiated, the client needs to drive it to
> > >>>>> +   completion, as described by the steps above, unless it aborts the process by
> > >>>>> +   issuing :c:func:`VIDIOC_STREAMOFF` on any of the ``OUTPUT`` or ``CAPTURE``
> > >>>>> +   queues.  The client is not allowed to issue ``V4L2_ENC_CMD_START`` or
> > >>>>> +   ``V4L2_ENC_CMD_STOP`` again while the drain sequence is in progress and they
> > >>>>> +   will fail with -EBUSY error code if attempted.
> > >>>>
> > >>>> I assume calling STOP again once the drain sequence completed just returns 0 and
> > >>>> doesn't do anything else (since we're already stopped).
> > >>>>
> > >>>
> > >>> Right.
> > >>>
> > >>>>> +
> > >>>>> +   Although mandatory, the availability of encoder commands may be queried
> > >>>>> +   using :c:func:`VIDIOC_TRY_ENCODER_CMD`.
> > >>>>
> > >>>> Some corner cases:
> > >>>>
> > >>>> 1) No buffers are queued on either vb2_queue, but STREAMON is called for both queues.
> > >>>>    Now ENC_CMD_STOP is issued. What should happen?
> > >>>>
> > >>>>    Proposal: the next time the applications queues a CAPTURE buffer it is returned
> > >>>>    at once as an empty buffer with FLAG_LAST set.
> > >>>>
> > >>>
> > >>> SGTM. It's actually similar to a relatively common case where all
> > >>> CAPTURE buffers have been dequeued and the application has to refill
> > >>> the CAPTURE queue, but in the meantime a drain request needs to be
> > >>> issued.
> > >>>
> > >>>> 2) Both queues are streaming and buffers have been encoded, but currently no buffers
> > >>>>    are queued on either vb2_queue. Now ENC_CMD_STOP is issued. What should happen?
> > >>>>
> > >>>>    Proposal: the next time the applications queues a CAPTURE buffer it is returned
> > >>>>    at once as an empty buffer with FLAG_LAST set. This is consistent with the
> > >>>>    previous corner case.
> > >>>
> > >>> Agreed.
> > >>>
> > >>>>
> > >>>> 3) The CAPTURE queue contains buffers, the OUTPUT queue does not. Now ENC_CMD_STOP
> > >>>>    is issued. What should happen?
> > >>>>
> > >>>>    Proposal: the oldest CAPTURE buffer in the ready queue is returned as an empty
> > >>>>    buffer with FLAG_LAST set.
> > >>>
> > >>> Generally agreed, but not sure if there is a reason to specifically
> > >>> refer to the oldest buffer. (I'm personally for keeping the queues
> > >>> ordered, though...)
> > >>
> > >> Feel free to rephrase. Perhaps: "an empty CAPTURE buffer with FLAG_LAST set should be
> > >> queued up for userspace to signal that the encoder has stopped." Or something along
> > >> those lines.
> > >
> > > I've added a note:
> > >
> > >    For reference, handling of various corner cases is described below:
> > >
> > >    * In case of no buffer in the ``OUTPUT`` queue at the time the
> > >      ``V4L2_ENC_CMD_STOP`` command was issued, the drain sequence completes
> > >      immediately and the encoder returns an empty ``CAPTURE`` buffer with the
> > >      ``V4L2_BUF_FLAG_LAST`` flag set.
> > >
> > >    * In case of no buffer in the ``CAPTURE`` queue at the time the drain
> > >      sequence completes, the next time the client queues a ``CAPTURE`` buffer
> > >      it is returned at once as an empty buffer with the ``V4L2_BUF_FLAG_LAST``
> > >      flag set.
> > >
> > >    * If :c:func:`VIDIOC_STREAMOFF` is called on the ``CAPTURE`` queue in the
> > >      middle of the drain sequence, the drain sequence is cancelled and all
> >
> > cancelled -> canceled
> >
> > >      ``CAPTURE`` buffers are implicitly returned to the userpace.
> >
> > userpace -> userspace
> >
>
> Actually changed it to "client".
>
> > >
> > >    * If :c:func:`VIDIOC_STREAMOFF` is called on the ``OUTPUT`` queue in the
> > >      middle of the drain sequence, the drain sequence completes immediately and
> > >      next ``CAPTURE`` buffer will be returned empty with the
> > >      ``V4L2_BUF_FLAG_LAST`` flag set.
> > >
> > > Slightly changed the split into cases to cover behaviors rather than
> > > conditions. WDYT?
> >
> > Looks good (with those two typos fixed).
> >
>
> Thanks.

Hmm, we actually looked into implementing this in mtk-vcodec and
handling of this corner case gets quite complicated. When stopping the
streaming on OUTPUT, you may not have any available CAPTURE buffer, so
you need to keep some extra state in the driver and check it in vb2
.buf_queue for CAPTURE to return the first buffer and complete the
drain.

The general handling of drain would have to look like this:
 - VIDIOC_DECODER_CMD must check if a drain isn't already in progress
and also whether the queues are streaming,
 - STREAMOFF(CAPTURE) needs to cancel any pending drain,
 - STREAMOFF(OUTPUT) needs to return a CAPTURE buffer with LAST set if
there is one or postpone it until a buffer is queued,
 - QBUF(CAPTURE) must return the buffer instantly if such return was
postponed by STREAMOFF(OUTPUT).
 - DQBUF(CAPTURE) of a buffer with the LAST flag set would finish the sequence.

Sounds like we definitely need some generic code to handle this...

>
> >         Hans
> >
> > >
> > > Best regards,
> > > Tomasz
> > >
> > >>
> > >> Regards,
> > >>
> > >>         Hans
> > >>
> > >>>
> > >>>>
> > >>>> 4) Both queues have queued buffers. ENC_CMD_STOP is issued to start the drain process.
> > >>>>    Before the drain process completes STREAMOFF is called for either CAPTURE or
> > >>>>    OUTPUT queue. What should happen?
> > >>>>
> > >>>>    Proposal for STREAMOFF(CAPTURE): aborts the drain process and all CAPTURE buffers are
> > >>>>    returned to userspace. If encoding is restarted, then any remaining OUTPUT buffers
> > >>>>    will be used as input to the encoder.
> > >>>>
> > >>>
> > >>> Agreed.
> > >>>
> > >>>>    Proposal for STREAMOFF(OUTPUT): the next capture buffer will be empty and have
> > >>>>    FLAG_LAST set.
> > >>>
> > >>> Agreed.
> > >>>
> > >>>>
> > >>>> Some of this might have to be documented, but these corner cases should certainly be
> > >>>> tested by v4l2-compliance. Before I write those tests I'd like to know if you agree
> > >>>> with this.
> > >>>
> > >>> Agreed with just one minor comment. Thanks for checking with me!
> > >>>
> > >>> Best regards,
> > >>> Tomasz
> > >>>
> > >>
> >
