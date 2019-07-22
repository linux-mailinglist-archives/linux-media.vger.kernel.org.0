Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF82870086
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 15:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbfGVNFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 09:05:48 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41241 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbfGVNFs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 09:05:48 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D9DA6C000D;
        Mon, 22 Jul 2019 13:05:44 +0000 (UTC)
Date:   Mon, 22 Jul 2019 15:05:44 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] media: docs-rst: Document m2m stateless video decoder
 interface
Message-ID: <20190722130544.GC1908@aptenodytes>
References: <20190620073505.33819-1-acourbot@chromium.org>
 <94ac16b6-110a-18d7-22cf-47e39ee68e0d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <94ac16b6-110a-18d7-22cf-47e39ee68e0d@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

[...]

> > +Buffer management while decoding
> > +================================
> > +Contrary to stateful decoders, a stateless decoder does not perform any kind of
> > +buffer management: it only guarantees that dequeued ``CAPTURE`` buffers can be
> > +used by the client for as long as they are not queued again. "Used" here
> > +encompasses using the buffer for compositing or display.
> > +
> > +A dequeued capture buffer can also be used as the reference frame of another
> > +buffer.
> > +
> > +A frame is specified as reference by converting its timestamp into nanoseconds,
> > +and storing it into the relevant member of a codec-dependent control structure.
> > +The :c:func:`v4l2_timeval_to_ns` function must be used to perform that
> > +conversion. The timestamp of a frame can be used to reference it as soon as all
> > +its units of encoded data are successfully submitted to the ``OUTPUT`` queue.
> > +
> > +A decoded buffer containing a reference frame must not be reused as a decoding
> > +target until all the frames referencing it have been decoded. The safest way to
> > +achieve this is to refrain from queueing a reference buffer until all the
> > +decoded frames referencing it have been dequeued. However, if the driver can
> > +guarantee that buffers queued to the ``CAPTURE`` queue are processed in queued
> > +order, then user-space can take advantage of this guarantee and queue a
> > +reference buffer when the following conditions are met:
> > +
> > +1. All the requests for frames affected by the reference frame have been
> > +   queued, and
> > +
> > +2. A sufficient number of ``CAPTURE`` buffers to cover all the decoded
> > +   referencing frames have been queued.
> > +
> > +When queuing a decoding request, the driver will increase the reference count of
> > +all the resources associated with reference frames. This means that the client
> 
> Does this really happen? I don't think we've implemented support for incrementing
> the ref count yet. It *should* happen like this, that I agree with.

I'm pretty sure we don't do anything particular to increment the refcount of
imported dma-buf buffers at the time they are used as references.

> > +can e.g. close the DMABUF file descriptors of reference frame buffers if it
> > +won't need them afterwards.
> 
> I'm fairly certain that this will fail with the current code.
> 
> We're missing vb2 helpers that ensure that the memory of reference frames sticks
> around: the memory refcount should be incremented when validating the request, and
> decremented when the request is completed.
> 
> If the reference frame memory that is requested has already been deleted (i.e. the
> CAPTURE buffer dmabuf has been closed before the new request was queued), then
> the request validation code will fail.
> 
> I know this has been discussed before, but we never actually implemented this.
> 
> Unfortunately, this will require new vb2 memops, so it is a bit more work.

Last time we discussed this, we merged a patch to keep dma-buf-imported buffers
mapped until they are either replaced with another dma-buf fd or destroyed:
media: vb2: Keep dma-buf buffers mapped until they are freed

Won't think cover the issue at hand here? I strongly suspect that mapping
implies keeping the access refcount incremented. So even if userspace closes the
fd, I'm pretty sure the memory would be kept alive.

There's a good chance I'm missing something though, feel free to let me know!

Cheers,

Paul

> > +
> > +Seeking
> > +=======
> > +In order to seek, the client just needs to submit requests using input buffers
> > +corresponding to the new stream position. It must however be aware that
> > +resolution may have changed and follow the dynamic resolution change sequence in
> > +that case. Also depending on the codec used, picture parameters (e.g. SPS/PPS
> > +for H.264) may have changed and the client is responsible for making sure that a
> > +valid state is sent to the decoder.
> > +
> > +The client is then free to ignore any returned ``CAPTURE`` buffer that comes
> > +from the pre-seek position.
> > +
> > +Pausing
> > +=======
> > +
> > +In order to pause, the client can just cease queuing buffers onto the ``OUTPUT``
> > +queue. Without source bitstream data, there is no data to process and the codec
> > +will remain idle.
> > +
> > +Dynamic resolution change
> > +=========================
> > +
> > +If the client detects a resolution change in the stream, it will need to perform
> > +the initialization sequence again with the new resolution:
> > +
> > +1. Wait until all submitted requests have completed and dequeue the
> > +   corresponding output buffers.
> > +
> > +2. Call :c:func:`VIDIOC_STREAMOFF` on both the ``OUTPUT`` and ``CAPTURE``
> > +   queues.
> 
> Note: you have the same problem with HOLD_CAPTURE_BUF here as in the Drain
> situation. I think this should be mentioned here as well.
> 
> > +
> > +3. Free all ``CAPTURE`` buffers by calling :c:func:`VIDIOC_REQBUFS` on the
> > +   ``CAPTURE`` queue with a buffer count of zero.
> > +
> > +4. Perform the initialization sequence again (minus the allocation of
> > +   ``OUTPUT`` buffers), with the new resolution set on the ``OUTPUT`` queue.
> > +   Note that due to resolution constraints, a different format may need to be
> > +   picked on the ``CAPTURE`` queue.
> > +
> > +Drain
> > +=====
> > +
> > +In order to drain the stream on a stateless decoder, the client just needs to
> > +wait until all the submitted requests are completed. There is no need to send a
> > +``V4L2_DEC_CMD_STOP`` command since requests are processed sequentially by the
> > +decoder.
> > +
> > +If the last submitted request resulted in a ``CAPTURE`` buffer being held by the
> > +use of the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag, the last frame may not
> > +be available on the ``CAPTURE`` queue. In this case, an extra request with an
> > +empty ``OUTPUT`` buffer (e.g. which ``bytesused`` is set to 0) and a different
> 
> which -> where
> 
> > +timestamp can be queued. This will make the driver release the held ``CAPTURE``
> > +buffer without doing any extra processing.
> > 
> 
> I don't like this. It's a special request which would require special handling in
> drivers. It just makes things more complicated.
> 
> How about this: add a new command to VIDIOC_DECODER_CMD: V4L2_DEC_CMD_END_OF_FRAME.
> 
> A stateless decoder that supports HOLD_CAPTURE_BUF would implement support for this
> command to flush the last frame, if any.
> 
> What do you think?
> 
> Regards,
> 
> 	Hans

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
