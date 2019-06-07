Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB4438D10
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 16:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729120AbfFGOey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 10:34:54 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40852 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbfFGOey (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 10:34:54 -0400
Received: by mail-ed1-f66.google.com with SMTP id k8so2190455eds.7
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2019 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65c2Q9aljNGg2wo8HIhWmC8+7J5nhUH7CjwFSqMnZTs=;
        b=nCWNNe3mlAi6lgAm9AxAiZOYcXTmvG7yOdPnRYLJSsX7w9HK9yQb+lxvGqXwHtn8EH
         T0gr16uvDRweMbTxtuGEVfBl0OlYPuTjtrXxufKwNjrnpw9YbSfXGxziY2482Xzzq+ag
         dNTrT399m0qCS5nD38iWqUQOvJYTlOq7fkKAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65c2Q9aljNGg2wo8HIhWmC8+7J5nhUH7CjwFSqMnZTs=;
        b=AAi9/zzasHPU1I2xhjRi0s1aKJ+u19FSbmDHs8rac9F/+BZ0HsF2JMEkPBAv0SIx0u
         fcFEP3E1UlMbqYj8usqQWSzhS5iUc3cKh9ous/Bi3C70gXmibg6QdH5OJTP9E1MFPxqp
         hhzvwIrrYix+Ni6Om6v7ADGgMXm2RrbZBpDxh/ccBrxhBbmrpJOxz5r8NnwdnQ1ZKaRP
         TFmOG2DYFKwmRZq/wpH0EeKbpHc1fUY7bRya6KLf67oaGzJ0GVI8X8IAeLLl0s2YG1K7
         6ZcG8IOBFYV0ZodCH7qZF3Z/kCESMyYKyCjOdEeRRAhl0nuXlNoZ5ELAPSbW88podFtk
         fvWg==
X-Gm-Message-State: APjAAAUb5snLAJqOXv4sGfhAvceH8dZ1hV23vidrS82/CesnNdJKUoiW
        5NJ1maLKHEU7SOUuirnxFaKAbp3a1ES8Tg==
X-Google-Smtp-Source: APXvYqy5ONQ+ed4SZa/AUOqeYxTjLNwxnVoRJCXnXjkczu/k+Z4i1DGF00Ldd6WqiowQ9G1iiuxFuA==
X-Received: by 2002:a17:906:7cd2:: with SMTP id h18mr15068380ejp.267.1559918091269;
        Fri, 07 Jun 2019 07:34:51 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id u26sm457449edf.91.2019.06.07.07.34.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 07:34:51 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id f10so2338938wmb.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2019 07:34:50 -0700 (PDT)
X-Received: by 2002:a1c:407:: with SMTP id 7mr4202953wme.113.1559918089874;
 Fri, 07 Jun 2019 07:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
 <20190607111634.GA7593@pendragon.ideasonboard.com> <CGME20190607120150epcas3p34178a04f712c89b013a263264cf2184f@epcas3p3.samsung.com>
 <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl> <e674539f-6b40-7b54-90bd-d1ed96ea5f55@samsung.com>
 <6c3ffe98-9d64-b881-470a-bfef8b9280de@xs4all.nl> <1f754020-296c-cf9b-1331-598bb774fa42@xs4all.nl>
 <4e711a70-ef25-b9f2-e27a-ae6c80288388@xs4all.nl> <ddacf8a1-61c4-bc04-8c52-cd56dfd13842@samsung.com>
 <07253fe3-0152-24e1-87f1-ba77d8630a97@xs4all.nl>
In-Reply-To: <07253fe3-0152-24e1-87f1-ba77d8630a97@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 7 Jun 2019 23:34:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CyCHc5Q5j-9uHjkoCFqAjvN0zSfd_ask0thphojdXw+Q@mail.gmail.com>
Message-ID: <CAAFQd5CyCHc5Q5j-9uHjkoCFqAjvN0zSfd_ask0thphojdXw+Q@mail.gmail.com>
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR memory
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 7, 2019 at 11:11 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 6/7/19 3:55 PM, Marek Szyprowski wrote:
> > Hi Hans,
> >
> > On 2019-06-07 15:40, Hans Verkuil wrote:
> >> On 6/7/19 2:47 PM, Hans Verkuil wrote:
> >>> On 6/7/19 2:23 PM, Hans Verkuil wrote:
> >>>> On 6/7/19 2:14 PM, Marek Szyprowski wrote:
> >>>>> On 2019-06-07 14:01, Hans Verkuil wrote:
> >>>>>> On 6/7/19 1:16 PM, Laurent Pinchart wrote:
> >>>>>>> Thank you for the patch.
> >>>>>>>
> >>>>>>> On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
> >>>>>>>> The __prepare_userptr() function made the incorrect assumption that if the
> >>>>>>>> same user pointer was used as the last one for which memory was acquired, then
> >>>>>>>> there was no need to re-acquire the memory. This assumption was never properly
> >>>>>>>> tested, and after doing that it became clear that this was in fact wrong.
> >>>>>>> Could you explain in the commit message why the assumption is not
> >>>>>>> correct ?
> >>>>>> You can free the memory, then allocate it again and you can get the same pointer,
> >>>>>> even though it is not necessarily using the same physical pages for the memory
> >>>>>> that the kernel is still using for it.
> >>>>>>
> >>>>>> Worse, you can free the memory, then allocate only half the memory you need and
> >>>>>> get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
> >>>>>> the original mapping still remains), but this can corrupt userspace memory
> >>>>>> causing the application to crash. It's not quite clear to me how the memory can
> >>>>>> get corrupted. I don't know enough of those low-level mm internals to understand
> >>>>>> the sequence of events.
> >>>>>>
> >>>>>> I have test code for v4l2-compliance available if someone wants to test this.
> >>>>> I'm interested, I would really like to know what happens in the mm
> >>>>> subsystem in such case.
> >>>> Here it is:
> >>>>
> >>>> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> >>>> index be606e48..9abf41da 100644
> >>>> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> >>>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> >>>> @@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
> >>>>    return 0;
> >>>>   }
> >>>>
> >>>> -static int captureBufs(struct node *node, const cv4l_queue &q,
> >>>> +static int captureBufs(struct node *node, cv4l_queue &q,
> >>>>            const cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
> >>>>            unsigned &capture_count)
> >>>>   {
> >>>> @@ -962,6 +962,21 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
> >>>>                            buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
> >>>>                            buf.s_request_fd(buf_req_fds[req_idx]);
> >>>>                    }
> >>>> +                  if (v4l_type_is_capture(buf.g_type()) && q.g_memory() == V4L2_MEMORY_USERPTR) {
> >>>> +                          printf("\nidx: %d", buf.g_index());
> >>>> +                          for (unsigned p = 0; p < q.g_num_planes(); p++) {
> >>>> +                                  printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
> >>>> +                                  fflush(stdout);
> >>>> +                                  free(buf.g_userptr(p));
> >>>> +                                  void *m = calloc(1, q.g_length(p)/2);
> >>>> +
> >>>> +                                  fail_on_test(m == NULL);
> >>>> +                                  q.s_userptr(buf.g_index(), p, m);
> >>>> +                                  printf("new buf[%d]: %p", p, m);
> >>>> +                                  buf.s_userptr(m, p);
> >>>> +                          }
> >>>> +                          printf("\n");
> >>>> +                  }
> >>>>                    fail_on_test(buf.qbuf(node, q));
> >>>>                    fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
> >>>>                    if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
> >>>>
> >>>>
> >>>>
> >>>> Load the vivid driver and just run 'v4l2-compliance -s10' and you'll see:
> >>>>
> >>>> ...
> >>>> Streaming ioctls:
> >>>>          test read/write: OK
> >>>>          test blocking wait: OK
> >>>>          test MMAP (no poll): OK
> >>>>          test MMAP (select): OK
> >>>>          test MMAP (epoll): OK
> >>>>          Video Capture: Frame #000
> >>>> idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
> >>>>          Video Capture: Frame #001
> >>>> idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
> >>>>          Video Capture: Frame #002
> >>>> idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
> >>>> Aborted
> >>> To clarify: two full size buffers are allocated and queued (that happens in setupUserPtr()),
> >>> then streaming starts and captureBufs is called which basically just calls dqbuf
> >>> and qbuf.
> >>>
> >>> Tomasz pointed out that all the pointers in this log are actually different. That's
> >>> correct, but here is a log where the old and new buf ptr are the same:
> >>>
> >>> Streaming ioctls:
> >>>          test read/write: OK
> >>>          test blocking wait: OK
> >>>          test MMAP (no poll): OK
> >>>          test MMAP (select): OK
> >>>          test MMAP (epoll): OK
> >>>          Video Capture: Frame #000
> >>> idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e010
> >>>          Video Capture: Frame #001
> >>> idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15010
> >>>          Video Capture: Frame #002
> >>> idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e010
> >>>          Video Capture: Frame #003
> >>> idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
> >>> Aborted
> >>>
> >>> It's weird that the first log fails that way: if the pointers are different,
> >>> then vb2 will call get_userptr and it should discover that the buffer isn't
> >>> large enough, causing qbuf to fail. That doesn't seem to happen.
> >> I think that the reason for this corruption is that the memory pool used
> >> by glibc is now large enough for vb2 to think it can map the full length
> >> of the user pointer into memory, even though only the first half is actually
> >> from the buffer that's allocated. When you capture a frame you just overwrite
> >> a random part of the application's memory pool, causing this invalid pointer.
> >>
> >> But that's a matter of garbage in, garbage out. So that's not the issue here.
> >>
> >> The real question is what happens when you free the old buffer, allocate a
> >> new buffer, end up with the same userptr, but it's using one or more different
> >> pages for its memory compared to the mapping that the kernel uses.
> >>
> >> I managed to reproduce this with v4l2-ctl:
> >>
> >> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> >> index 28b2b3b9..8f2ed9b5 100644
> >> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> >> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> >> @@ -1422,6 +1422,24 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
> >>               * has the size that fits the old resolution and might not
> >>               * fit to the new one.
> >>               */
> >> +            if (q.g_memory() == V4L2_MEMORY_USERPTR) {
> >> +                    printf("\nidx: %d", buf.g_index());
> >> +                    for (unsigned p = 0; p < q.g_num_planes(); p++) {
> >> +                            unsigned *pb = (unsigned *)buf.g_userptr(p);
> >> +                            printf(" old buf[%d]: %p first pixel: 0x%x", p, buf.g_userptr(p), *pb);
> >> +                            fflush(stdout);
> >> +                            free(buf.g_userptr(p));
> >> +                            void *m = calloc(1, q.g_length(p));
> >> +
> >> +                            if (m == NULL)
> >> +                                    return QUEUE_ERROR;
> >> +                            q.s_userptr(buf.g_index(), p, m);
> >> +                            if (m == buf.g_userptr(p))
> >> +                                    printf(" identical new buf");
> >> +                            buf.s_userptr(m, p);
> >> +                    }
> >> +                    printf("\n");
> >> +            }
> >>              if (fd.qbuf(buf) && errno != EINVAL) {
> >>                      fprintf(stderr, "%s: qbuf error\n", __func__);
> >>                      return QUEUE_ERROR;
> >>
> >>
> >> Load vivid, setup a pure white test pattern:
> >>
> >> v4l2-ctl -c test_pattern=6
> >>
> >> Now run v4l2-ctl --stream-user and you'll see:
> >>
> >> idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x80ea80ea identical new buf
> >> <
> >> idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x80ea80ea identical new buf
> >> <
> >> idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x80ea80ea identical new buf
> >> <
> >> idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x80ea80ea identical new buf
> >> <
> >> idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x0 identical new buf
> >> <
> >> idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x0 identical new buf
> >> < 5.00 fps
> >>
> >> idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x0 identical new buf
> >> <
> >> idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x0 identical new buf
> >>
> >> The first four dequeued buffers are filled with data, after that the
> >> returned buffer is empty because vivid is actually writing to different
> >> memory pages.
> >>
> >> With this patch the first pixel is always non-zero.
> >
> > Good catch. The question is weather we treat that as undefined behavior
> > and keep the optimization for 'good applications' or assume that every
> > broken userspace code has to be properly handled. The good thing is that
> > there is still imho no security issue. The physical pages gathered by
>
> Yeah, that scared me for a bit, but it all looks secure.
>
> > vb2 in worst case belongs to noone else (vb2 is their last user, they
> > are not yet returned to free pages pool).
>
> I see three options:
>
> 1) just always reacquire the buffer, and if anyone complains about it
>    being slower we point them towards DMABUF.
>
> 2) keep the current behavior, but document it.
>
> 3) as 2), but also add a new buffer flag that forces a reacquire of the
>    buffer. This could be valid for DMABUF as well. E.g.:
>
>    V4L2_BUF_FLAG_REACQUIRE
>
> I'm leaning towards the third option since it won't slow down existing
> implementations, yet if you do change the userptr every time, then you
> can now force this to work safely.
>

I'd be for 1) or 3) as that would allow Chrome work on mainline.

Also I believe there is still some bug when the pointers don't match,
even if you don't free those pages. I guess some more testing that
includes verifying the contents of previously dequeued buffers could
show something.

> >> I wonder if it isn't possible to just check the physical address of
> >> the received user pointer with the physical address of the previous
> >> user pointer. Or something like that. I'll dig around a bit more.
> >
> > Such check won't be so simple. Pages contiguous in the virtual memory
> > won't map to pages contiguous in the physical memory, so you would need
> > to check every single memory page. Make no sense. It is better to
> > reacquire buffer on every queue operation. This indeed show how broken
> > the USERPTR related part of v4l2 API is.
>
> OK, good to know. Then I'm not going to spend time on that.
>
> Regards,
>
>         Hans
