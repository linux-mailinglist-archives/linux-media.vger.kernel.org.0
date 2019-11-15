Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34E5BFD5E4
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 07:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfKOGMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 01:12:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58620 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfKOGMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 01:12:20 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 88CB1291546;
        Fri, 15 Nov 2019 06:12:17 +0000 (GMT)
Date:   Fri, 15 Nov 2019 07:12:13 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Jan Schmidt <jan@centricular.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Matthew Waters <matthew@centricular.com>
Subject: Re: VP9 Stateless Support (follow up of [ANN] Report of Media
 Summit: Codecs)
Message-ID: <20191115071213.42715a39@collabora.com>
In-Reply-To: <f948c7918ea24ea2686fff72bcf813f340d55e45.camel@ndufresne.ca>
References: <311a152e-b773-76d6-a17e-86112b583179@xs4all.nl>
        <f948c7918ea24ea2686fff72bcf813f340d55e45.camel@ndufresne.ca>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Thu, 14 Nov 2019 13:15:17 -0500
Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> Hi all,
> 
> I hope you all had a good return back after ELCE. I'm writing in order
> to follow up and gather ideas around a blocker in our design regarding
> stateless CODECs and the VP9 CODEC. This emails provides the context,
> and I'd like, for who would like to participate, to have a chat on IRC
> #v4l at 14:30 CET for an hour at most. Hans needs to leave at 16h. If
> you can't attend, feel free to reply to this thread with ideas.

Thanks for starting this discussion.

> 
> Context:
> -------
> 
> VP9 has this concept that resolution can be changed at any frames,
> including intra-frames. The consequence of this, is that references
> frames maybe not all be of the same resolution. What happens in
> practice is that the reference frames are scaled up, or down, to the
> decoding target using a fully defined scaling algorithm.
> 
> In the context of Hantro (which I need to remind is likely the only VP9
> HW decoder design in the world, considering you can get this design for
> free), this scaling is done on the fly. The references frames are
> passed in their original size.
> 
> Our current design for state-less decoder, is that all reference are
> held and owned by the VB queue, and referred to with a timestamp (or
> cookie). The problem is that as of today, the VB queue buffers are all
> of the same formats (despite some looking forward attempt, like
> CREATE_BUFS).
> 
> Boris has implemented a proof of concept with the current API

Correction: I am implementing this PoC, its not finished yet :).

> limitation, but we could like to find a way forward so that we can
> support VP9 compliant implementation. The following are two ideas that
> already come up, more could be discussed tomorrow of course.

Some extra context: here are the VP9 controls I'm using right now [1].
Those are based on the VP9 spec [2] and the existing chromium
implementation [3]. The existing implementation, which I'm using as a
base for my PoC, pass the ref frame size/subsampling/bit_depth info
through a control to bypass the limitations described by Nicolas. I
don't think the driver deals with buffer re-allocation, but it should
work as long as the initial allocation size was big enough to cope with
the largest resolution.

> 
> 1. CREATE_BUFS/DELETE_BUFS
> --------------------------
> 
> I haven't checked how this is exposed in the VB2 framework, but
> CREATE_BUFS was created with this idea that you could extend an
> existing pool of buffers, with buffers of a different format.
> 
> In order to complete this story, we'd need a DELETE_BUF, which allow
> asking VB2 to drop it's reference to a specific chunk of memory. For
> VP9, a resolution change would looke like this (simplified):
> 
> - Userspace detect that next frame has different resolution
> - Then DELETE_BUF any buffers that are no longer relevant
> - Then TRY_FMT/CREATE_BUFS for the new resolution
> 
> As decoding continues, and references frame are no longer relevant,
> userspace will do further DELETE_BUF calls. The STREAMON/OFF calls
> are no needed anymore.
> 
> Pros:
>  - It's simple to use
>  - There is prior art in the API
> Const:
>  - QUERYBUF is now insufficient, as we need the format to be returned
>  - G_FMT becomes ambiguous
>  - It's unclear what to do with buffer index, are they shifted ?
>  - Userspace and kernel need to keep managing buffer index, timestamp
>    (aka cookie) which seems quite error prone
>  - DELETE term might be off reality, maybe RELEASE ?
> 
> 
> 2. Use a control to pass references
> 
> That was an idea that came in previous discussion. We could introduce a
> controls to set the 3 references in VP9. Along with each reference, we
> could pass back the v4l2_format as it was when this reference frame was
> decoded. This would fully by-pass the timestamp/cookie mechanism. But
> would impose that VP9 only works with DMABuf, and that a
> flush/streamoff/re-alloc/streamon operation happen. It would work if
> the resolution changes are rare, e.g. not happening on consecutive
> frames.
> 
> Pros:
>   - Less invasive (uAPI/Spec whise)
> Cons:
>   - It's very expensive
>   - The memory mapping cache is lost, and need to be re-implemented
>     in the driver (or some helpers need to be exposed)

Ideally in some helpers, with most of the logic taken from the vb2 core.

>   - Is inconsistent with H264/HEVC
> 
> 
> 3. Split buffer allocation and queue
> 
> This is a bit of a crazy and unfinished idea. I'm writing it down just
> to feed some ideas, and with hope somebody with the right knowledge (no
> me) might make some sense out of it.
> 
> What we could consider is to dissociate completely the queues from
> buffer allocation and their format. With this idea, the queues will
> only serve as a queue of pending operations.
> 
> I believe such an allocation model would require a kernel object,
> exposed to user-space as an FD, that can wrap an DMABuf and stored all
> the relevant metadata, such as the video format for this "frame". For
> those familiar with DRM, you'll see where this is inspired from. The
> wrapper is also a good place for any caching needed when importing
> buffers. So this is no longer cached in the queue.
> 
> This would require a whole new set of IOCTL to allocate, release (we
> should start thinking in term of reference count rather then
> create/delete).
> 
> As a side effect, these self contained frames allow serializing the
> format changes inside a queue. In such model, the reference frames no
> longer need to be in the queue, as they can be passed using their
> wrapper. With this we basically get rid of the cookie/timestamp
> mechanism which most of us dislike. The workflow is mostly identical
> proposal 1, the difference is that reference lookup code can be
> removed. The driver no longer need to strictly track the buffers that
> has been allocated.
> 
> From the queue perspective, this would need to be a totally new type of
> capture/output. The v4l2_buffer would point to a frame object rather
> then memory pointer/dmabuf/dma-offset.

I really like this new idea.

> 
> Pros:
>   - Much more flexible model
>   - Helps for buffer sharing
>   - No more cookie/timestamp lookup all over kernel and userspace
>   - A fully referenced count model
> Cons:
>   - This requires a lot of design, my idea is full of wholes
>   - Can it really be implemented in parallel ?
>   - Might have the same gruyere effect on the buffer index in queue

Not entirely sure why we need buffers to be indexed in this new model.
Isn't userspace in charge of buffer management here. All the queue
would take care of would be queueing/dequeuing buffers, and the buffer
to queue/dequeue would be passed as a bufdesc handle (or FD) instead of
an index. 

>   - The io ops need to be re-factored into something else

> 
> see you tomorrow,
> Nicolas
> 

Thanks for this summary/braindump.

Boris


[1]https://github.com/bbrezillon/linux/blob/779c72b5ad926b57595bdadcf3bffcdb559402b1/include/media/vp9-ctrls.h
[2]https://storage.googleapis.com/downloads.webmproject.org/docs/vp9/vp9-bitstream-specification-v0.6-20160331-draft.pdf
[3]https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.4/include/uapi/linux/v4l2-controls.h#1240
