Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA37FCCEB
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 19:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfKNSPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 13:15:21 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:35234 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbfKNSPV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 13:15:21 -0500
Received: by mail-qk1-f194.google.com with SMTP id i19so5830295qki.2
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2019 10:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/I3xi8cQh+hSk0cTrOlUiZ8WwCAMR08gN+RReoK4lAA=;
        b=KsMR4DbjB9xMmZzM2Ubx7xhLiybhiX8ylBxtavwqg/Jg9z1a3RrtFbWuHB9t6xSvLA
         rR/6YGtweVbYcsE4f9lS2oCrnwZB/nkqzngAIxCfmDinIzZXSiCRfXx5Gyocjb96oKAr
         ZrqZnn0j6UEkSFgZo++Xdm2OxAsdhYiwoQfu4chmGw22ucCtVqPGphi/KouZQ5JDYjmw
         aaGXgQ2RxBBgcS/8Cr0H5Q8B0fmsfUdMRpp1RhquSARDO+vTgJQ+biOSvVWzJB5WVqZd
         0qRbnMk1xQhe7PVKBG5C9E8vh444+aHPNu7zFaAXEX3HmEFYkJ+Ovnuiv4ul48JaGQKV
         C2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/I3xi8cQh+hSk0cTrOlUiZ8WwCAMR08gN+RReoK4lAA=;
        b=uYmSL5ArejG5y2dfIeRPZ0g4tYnkVd0Aq8BlQ9OeUNZtC8L2CKrXTvcdqqMxenUleO
         1DByHObQObTGiqFR+hZyp91XbgoILU387EEJKsdU4uHa7KS9XzkNUfoA6DAWG5hY6aWz
         T3Y1/XT1/G2wO/tKfv9frGAKWw4pulUrmp4Tn3BH6wzYrZTheUAe6Y/fMXqbpm0F89VB
         SEiKk7emkNyq/TAGarcWk4BXU96E4v4svL3go1AjepAHpUdLUyO6CoWLxnWxtAbPB5CW
         YChXayKo8noWL1zmfpOFa7BFMpYEquzZv1fIyp5yT8sEotDLPWXGYl9kEAyqk/mnP5j1
         iXxg==
X-Gm-Message-State: APjAAAXB2pZa4XcK1KyCwwJQq+x8QPPdSwnHWjE408j0UNvsQRkGSYkV
        9FHgpT18wNexqQxeFIAZYPc4tJ8otcYMlQ==
X-Google-Smtp-Source: APXvYqx+BQvO8jYZSmibWnASTslIgGdK7meKyzZe4QCMUCZdmMZVXV05Cr1Wd18+cjYbdRCCBeorrw==
X-Received: by 2002:a05:620a:4:: with SMTP id j4mr8722646qki.357.1573755319688;
        Thu, 14 Nov 2019 10:15:19 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id o53sm3642136qtj.91.2019.11.14.10.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 10:15:18 -0800 (PST)
Message-ID: <f948c7918ea24ea2686fff72bcf813f340d55e45.camel@ndufresne.ca>
Subject: VP9 Stateless Support (follow up of [ANN] Report of Media Summit:
 Codecs)
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
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
Date:   Thu, 14 Nov 2019 13:15:17 -0500
In-Reply-To: <311a152e-b773-76d6-a17e-86112b583179@xs4all.nl>
References: <311a152e-b773-76d6-a17e-86112b583179@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I hope you all had a good return back after ELCE. I'm writing in order
to follow up and gather ideas around a blocker in our design regarding
stateless CODECs and the VP9 CODEC. This emails provides the context,
and I'd like, for who would like to participate, to have a chat on IRC
#v4l at 14:30 CET for an hour at most. Hans needs to leave at 16h. If
you can't attend, feel free to reply to this thread with ideas.

Context:
-------

VP9 has this concept that resolution can be changed at any frames,
including intra-frames. The consequence of this, is that references
frames maybe not all be of the same resolution. What happens in
practice is that the reference frames are scaled up, or down, to the
decoding target using a fully defined scaling algorithm.

In the context of Hantro (which I need to remind is likely the only VP9
HW decoder design in the world, considering you can get this design for
free), this scaling is done on the fly. The references frames are
passed in their original size.

Our current design for state-less decoder, is that all reference are
held and owned by the VB queue, and referred to with a timestamp (or
cookie). The problem is that as of today, the VB queue buffers are all
of the same formats (despite some looking forward attempt, like
CREATE_BUFS).

Boris has implemented a proof of concept with the current API
limitation, but we could like to find a way forward so that we can
support VP9 compliant implementation. The following are two ideas that
already come up, more could be discussed tomorrow of course.

1. CREATE_BUFS/DELETE_BUFS
--------------------------

I haven't checked how this is exposed in the VB2 framework, but
CREATE_BUFS was created with this idea that you could extend an
existing pool of buffers, with buffers of a different format.

In order to complete this story, we'd need a DELETE_BUF, which allow
asking VB2 to drop it's reference to a specific chunk of memory. For
VP9, a resolution change would looke like this (simplified):

- Userspace detect that next frame has different resolution
- Then DELETE_BUF any buffers that are no longer relevant
- Then TRY_FMT/CREATE_BUFS for the new resolution

As decoding continues, and references frame are no longer relevant,
userspace will do further DELETE_BUF calls. The STREAMON/OFF calls
are no needed anymore.

Pros:
 - It's simple to use
 - There is prior art in the API
Const:
 - QUERYBUF is now insufficient, as we need the format to be returned
 - G_FMT becomes ambiguous
 - It's unclear what to do with buffer index, are they shifted ?
 - Userspace and kernel need to keep managing buffer index, timestamp
   (aka cookie) which seems quite error prone
 - DELETE term might be off reality, maybe RELEASE ?


2. Use a control to pass references

That was an idea that came in previous discussion. We could introduce a
controls to set the 3 references in VP9. Along with each reference, we
could pass back the v4l2_format as it was when this reference frame was
decoded. This would fully by-pass the timestamp/cookie mechanism. But
would impose that VP9 only works with DMABuf, and that a
flush/streamoff/re-alloc/streamon operation happen. It would work if
the resolution changes are rare, e.g. not happening on consecutive
frames.

Pros:
  - Less invasive (uAPI/Spec whise)
Cons:
  - It's very expensive
  - The memory mapping cache is lost, and need to be re-implemented
    in the driver (or some helpers need to be exposed)
  - Is inconsistent with H264/HEVC


3. Split buffer allocation and queue

This is a bit of a crazy and unfinished idea. I'm writing it down just
to feed some ideas, and with hope somebody with the right knowledge (no
me) might make some sense out of it.

What we could consider is to dissociate completely the queues from
buffer allocation and their format. With this idea, the queues will
only serve as a queue of pending operations.

I believe such an allocation model would require a kernel object,
exposed to user-space as an FD, that can wrap an DMABuf and stored all
the relevant metadata, such as the video format for this "frame". For
those familiar with DRM, you'll see where this is inspired from. The
wrapper is also a good place for any caching needed when importing
buffers. So this is no longer cached in the queue.

This would require a whole new set of IOCTL to allocate, release (we
should start thinking in term of reference count rather then
create/delete).

As a side effect, these self contained frames allow serializing the
format changes inside a queue. In such model, the reference frames no
longer need to be in the queue, as they can be passed using their
wrapper. With this we basically get rid of the cookie/timestamp
mechanism which most of us dislike. The workflow is mostly identical
proposal 1, the difference is that reference lookup code can be
removed. The driver no longer need to strictly track the buffers that
has been allocated.

From the queue perspective, this would need to be a totally new type of
capture/output. The v4l2_buffer would point to a frame object rather
then memory pointer/dmabuf/dma-offset.

Pros:
  - Much more flexible model
  - Helps for buffer sharing
  - No more cookie/timestamp lookup all over kernel and userspace
  - A fully referenced count model
Cons:
  - This requires a lot of design, my idea is full of wholes
  - Can it really be implemented in parallel ?
  - Might have the same gruyere effect on the buffer index in queue
  - The io ops need to be re-factored into something else

see you tomorrow,
Nicolas

