Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 210E441952
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 02:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfFLAML (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 20:12:11 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37102 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbfFLAMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 20:12:10 -0400
Received: by mail-qt1-f195.google.com with SMTP id y57so16828812qtk.4
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 17:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cysc0rg2xEB3ELLJ10WaTsRm6p4gEvu/MRIGjaU8j40=;
        b=i/E9pMVLUpin/Y+uWqLWHzv7bKFaHWsYxXRbTh6b+1n0v9PfesLoq4d83J5atpsagZ
         wjcgwMsVW4NHZDtDD0gexRba/LKcTUN0jI6eqc0lYsP8xxGYosZH0Fu6Nv6bZLyQzpgY
         Koq3NczidqVoWPgTKASiOTySOsn0zO+kDQvwj49TLmaljn+GgUALo28MX/64SEwD+sdR
         oXs78GGEy4zmuH77wJASBjNaF+mUOsJ6sKgWtvQKERAkVXBpMZJn2Dg9n95zBVzVi8Yp
         gkXFrecUrib5+4MEJAeCDbqe4bCxENsrSciTg/K1FmW3Y99G0/qdQWT15fTA5v8T+6Av
         pcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cysc0rg2xEB3ELLJ10WaTsRm6p4gEvu/MRIGjaU8j40=;
        b=CgRJrMJ+rInEJe2VFKhCB/GfgZNy0Rs3/5ccDWXSFmJRSUzcvuIkFXEPf8GAqBSYvO
         F3k7wKXzO+OugR3W6mCWWUuS90rVKXnEpQ1+W/hQH+LSEHqH5q+bsrI5i7fK+56po2GR
         haU5RlCoyLBSU6t2v4MgWN7hTtJbXxyhh3DqdeUlVoVaf5xac0J7nZrVEf/xYzRaXuvu
         Cg+D6+aIymdTKkWSsIbH3Sy3xhVM+SwHYPCi3Gs0VjCmIra95UFrtdp1BqgWCKJ08dyw
         McXNxPf13K6tpN2IFK/uVkavpfFUOHKoTRdt/Uitf51qNb6rVP3rf5HmhlTkCTkO/Q1z
         mKsw==
X-Gm-Message-State: APjAAAU4LoBoeKX5kw9Zh8/Rn1IF65pcI0aocxkygwlljCySr0HRRwE1
        SQIUluhJHRpNhlkfmdjuhyNP5g==
X-Google-Smtp-Source: APXvYqwH3enFoOeu2ZHo1trmK96IuGhKfpz+W+mYq7jjvQ/TUwx+6DPcS6ofbQ8v4TgSdvQjMEn6Uw==
X-Received: by 2002:a0c:a182:: with SMTP id e2mr4391326qva.15.1560298329488;
        Tue, 11 Jun 2019 17:12:09 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id z57sm7599868qta.62.2019.06.11.17.12.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 17:12:08 -0700 (PDT)
Message-ID: <6f5cfe33f69218da493ed4e8f595e82c6715ddd3.camel@ndufresne.ca>
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Tue, 11 Jun 2019 20:12:07 -0400
In-Reply-To: <8bf9afbb-3904-9fa0-f6ad-f0f1396c48ff@samsung.com>
References: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
         <20190607111634.GA7593@pendragon.ideasonboard.com>
         <CGME20190607120150epcas3p34178a04f712c89b013a263264cf2184f@epcas3p3.samsung.com>
         <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
         <e674539f-6b40-7b54-90bd-d1ed96ea5f55@samsung.com>
         <6c3ffe98-9d64-b881-470a-bfef8b9280de@xs4all.nl>
         <1f754020-296c-cf9b-1331-598bb774fa42@xs4all.nl>
         <4e711a70-ef25-b9f2-e27a-ae6c80288388@xs4all.nl>
         <ddacf8a1-61c4-bc04-8c52-cd56dfd13842@samsung.com>
         <07253fe3-0152-24e1-87f1-ba77d8630a97@xs4all.nl>
         <3e0cf83d-1f69-0d71-96b5-339dad660b1d@samsung.com>
         <5bc8b7842e16cfc31a2e86befab223b4cb01131b.camel@ndufresne.ca>
         <d3bf5fe7-02ab-8c6a-a495-33459dfdcb09@xs4all.nl>
         <8bf9afbb-3904-9fa0-f6ad-f0f1396c48ff@samsung.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 11 juin 2019 à 13:56 +0200, Marek Szyprowski a écrit :
> Hi Hans,
> 
> On 2019-06-11 09:52, Hans Verkuil wrote:
> > On 6/7/19 9:43 PM, Nicolas Dufresne wrote:
> > > Le vendredi 07 juin 2019 à 16:39 +0200, Marek Szyprowski a écrit :
> > > > Hi Hans,
> > > > 
> > > > On 2019-06-07 16:11, Hans Verkuil wrote:
> > > > > On 6/7/19 3:55 PM, Marek Szyprowski wrote:
> > > > > > On 2019-06-07 15:40, Hans Verkuil wrote:
> > > > > > > On 6/7/19 2:47 PM, Hans Verkuil wrote:
> > > > > > > > On 6/7/19 2:23 PM, Hans Verkuil wrote:
> > > > > > > > > On 6/7/19 2:14 PM, Marek Szyprowski wrote:
> > > > > > > > > > On 2019-06-07 14:01, Hans Verkuil wrote:
> > > > > > > > > > > On 6/7/19 1:16 PM, Laurent Pinchart wrote:
> > > > > > > > > > > > Thank you for the patch.
> > > > > > > > > > > > 
> > > > > > > > > > > > On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
> > > > > > > > > > > > > The __prepare_userptr() function made the incorrect assumption that if the
> > > > > > > > > > > > > same user pointer was used as the last one for which memory was acquired, then
> > > > > > > > > > > > > there was no need to re-acquire the memory. This assumption was never properly
> > > > > > > > > > > > > tested, and after doing that it became clear that this was in fact wrong.
> > > > > > > > > > > > Could you explain in the commit message why the assumption is not
> > > > > > > > > > > > correct ?
> > > > > > > > > > > You can free the memory, then allocate it again and you can get the same pointer,
> > > > > > > > > > > even though it is not necessarily using the same physical pages for the memory
> > > > > > > > > > > that the kernel is still using for it.
> > > > > > > > > > > 
> > > > > > > > > > > Worse, you can free the memory, then allocate only half the memory you need and
> > > > > > > > > > > get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
> > > > > > > > > > > the original mapping still remains), but this can corrupt userspace memory
> > > > > > > > > > > causing the application to crash. It's not quite clear to me how the memory can
> > > > > > > > > > > get corrupted. I don't know enough of those low-level mm internals to understand
> > > > > > > > > > > the sequence of events.
> > > > > > > > > > > 
> > > > > > > > > > > I have test code for v4l2-compliance available if someone wants to test this.
> > > > > > > > > > I'm interested, I would really like to know what happens in the mm
> > > > > > > > > > subsystem in such case.
> > > > > > > > > Here it is:
> > > > > > > > > 
> > > > > > > > > diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > > > > index be606e48..9abf41da 100644
> > > > > > > > > --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > > > > +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > > > > @@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
> > > > > > > > >     	return 0;
> > > > > > > > >     }
> > > > > > > > > 
> > > > > > > > > -static int captureBufs(struct node *node, const cv4l_queue &q,
> > > > > > > > > +static int captureBufs(struct node *node, cv4l_queue &q,
> > > > > > > > >     		const cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
> > > > > > > > >     		unsigned &capture_count)
> > > > > > > > >     {
> > > > > > > > > @@ -962,6 +962,21 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
> > > > > > > > >     				buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
> > > > > > > > >     				buf.s_request_fd(buf_req_fds[req_idx]);
> > > > > > > > >     			}
> > > > > > > > > +			if (v4l_type_is_capture(buf.g_type()) && q.g_memory() == V4L2_MEMORY_USERPTR) {
> > > > > > > > > +				printf("\nidx: %d", buf.g_index());
> > > > > > > > > +				for (unsigned p = 0; p < q.g_num_planes(); p++) {
> > > > > > > > > +					printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
> > > > > > > > > +					fflush(stdout);
> > > > > > > > > +					free(buf.g_userptr(p));
> > > > > > > > > +					void *m = calloc(1, q.g_length(p)/2);
> > > > > > > > > +
> > > > > > > > > +					fail_on_test(m == NULL);
> > > > > > > > > +					q.s_userptr(buf.g_index(), p, m);
> > > > > > > > > +					printf("new buf[%d]: %p", p, m);
> > > > > > > > > +					buf.s_userptr(m, p);
> > > > > > > > > +				}
> > > > > > > > > +				printf("\n");
> > > > > > > > > +			}
> > > > > > > > >     			fail_on_test(buf.qbuf(node, q));
> > > > > > > > >     			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
> > > > > > > > >     			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Load the vivid driver and just run 'v4l2-compliance -s10' and you'll see:
> > > > > > > > > 
> > > > > > > > > ...
> > > > > > > > > Streaming ioctls:
> > > > > > > > >            test read/write: OK
> > > > > > > > >            test blocking wait: OK
> > > > > > > > >            test MMAP (no poll): OK
> > > > > > > > >            test MMAP (select): OK
> > > > > > > > >            test MMAP (epoll): OK
> > > > > > > > >            Video Capture: Frame #000
> > > > > > > > > idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
> > > > > > > > >            Video Capture: Frame #001
> > > > > > > > > idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
> > > > > > > > >            Video Capture: Frame #002
> > > > > > > > > idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
> > > > > > > > > Aborted
> > > > > > > > To clarify: two full size buffers are allocated and queued (that happens in setupUserPtr()),
> > > > > > > > then streaming starts and captureBufs is called which basically just calls dqbuf
> > > > > > > > and qbuf.
> > > > > > > > 
> > > > > > > > Tomasz pointed out that all the pointers in this log are actually different. That's
> > > > > > > > correct, but here is a log where the old and new buf ptr are the same:
> > > > > > > > 
> > > > > > > > Streaming ioctls:
> > > > > > > >            test read/write: OK
> > > > > > > >            test blocking wait: OK
> > > > > > > >            test MMAP (no poll): OK
> > > > > > > >            test MMAP (select): OK
> > > > > > > >            test MMAP (epoll): OK
> > > > > > > >            Video Capture: Frame #000
> > > > > > > > idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e010
> > > > > > > >            Video Capture: Frame #001
> > > > > > > > idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15010
> > > > > > > >            Video Capture: Frame #002
> > > > > > > > idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e010
> > > > > > > >            Video Capture: Frame #003
> > > > > > > > idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
> > > > > > > > Aborted
> > > > > > > > 
> > > > > > > > It's weird that the first log fails that way: if the pointers are different,
> > > > > > > > then vb2 will call get_userptr and it should discover that the buffer isn't
> > > > > > > > large enough, causing qbuf to fail. That doesn't seem to happen.
> > > > > > > I think that the reason for this corruption is that the memory pool used
> > > > > > > by glibc is now large enough for vb2 to think it can map the full length
> > > > > > > of the user pointer into memory, even though only the first half is actually
> > > > > > > from the buffer that's allocated. When you capture a frame you just overwrite
> > > > > > > a random part of the application's memory pool, causing this invalid pointer.
> > > > > > > 
> > > > > > > But that's a matter of garbage in, garbage out. So that's not the issue here.
> > > > > > > 
> > > > > > > The real question is what happens when you free the old buffer, allocate a
> > > > > > > new buffer, end up with the same userptr, but it's using one or more different
> > > > > > > pages for its memory compared to the mapping that the kernel uses.
> > > > > > > 
> > > > > > > I managed to reproduce this with v4l2-ctl:
> > > > > > > 
> > > > > > > diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > > > > index 28b2b3b9..8f2ed9b5 100644
> > > > > > > --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > > > > +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > > > > @@ -1422,6 +1422,24 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
> > > > > > >     		 * has the size that fits the old resolution and might not
> > > > > > >     		 * fit to the new one.
> > > > > > >     		 */
> > > > > > > +		if (q.g_memory() == V4L2_MEMORY_USERPTR) {
> > > > > > > +			printf("\nidx: %d", buf.g_index());
> > > > > > > +			for (unsigned p = 0; p < q.g_num_planes(); p++) {
> > > > > > > +				unsigned *pb = (unsigned *)buf.g_userptr(p);
> > > > > > > +				printf(" old buf[%d]: %p first pixel: 0x%x", p, buf.g_userptr(p), *pb);
> > > > > > > +				fflush(stdout);
> > > > > > > +				free(buf.g_userptr(p));
> > > > > > > +				void *m = calloc(1, q.g_length(p));
> > > > > > > +
> > > > > > > +				if (m == NULL)
> > > > > > > +					return QUEUE_ERROR;
> > > > > > > +				q.s_userptr(buf.g_index(), p, m);
> > > > > > > +				if (m == buf.g_userptr(p))
> > > > > > > +					printf(" identical new buf");
> > > > > > > +				buf.s_userptr(m, p);
> > > > > > > +			}
> > > > > > > +			printf("\n");
> > > > > > > +		}
> > > > > > >     		if (fd.qbuf(buf) && errno != EINVAL) {
> > > > > > >     			fprintf(stderr, "%s: qbuf error\n", __func__);
> > > > > > >     			return QUEUE_ERROR;
> > > > > > > 
> > > > > > > 
> > > > > > > Load vivid, setup a pure white test pattern:
> > > > > > > 
> > > > > > > v4l2-ctl -c test_pattern=6
> > > > > > > 
> > > > > > > Now run v4l2-ctl --stream-user and you'll see:
> > > > > > > 
> > > > > > > idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x80ea80ea identical new buf
> > > > > > > <
> > > > > > > idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x80ea80ea identical new buf
> > > > > > > <
> > > > > > > idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x80ea80ea identical new buf
> > > > > > > <
> > > > > > > idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x80ea80ea identical new buf
> > > > > > > <
> > > > > > > idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x0 identical new buf
> > > > > > > <
> > > > > > > idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x0 identical new buf
> > > > > > > < 5.00 fps
> > > > > > > 
> > > > > > > idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x0 identical new buf
> > > > > > > <
> > > > > > > idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x0 identical new buf
> > > > > > > 
> > > > > > > The first four dequeued buffers are filled with data, after that the
> > > > > > > returned buffer is empty because vivid is actually writing to different
> > > > > > > memory pages.
> > > > > > > 
> > > > > > > With this patch the first pixel is always non-zero.
> > > > > > Good catch. The question is weather we treat that as undefined behavior
> > > > > > and keep the optimization for 'good applications' or assume that every
> > > > > > broken userspace code has to be properly handled. The good thing is that
> > > > > > there is still imho no security issue. The physical pages gathered by
> > > > > Yeah, that scared me for a bit, but it all looks secure.
> > > > > 
> > > > > > vb2 in worst case belongs to noone else (vb2 is their last user, they
> > > > > > are not yet returned to free pages pool).
> > > > > I see three options:
> > > > > 
> > > > > 1) just always reacquire the buffer, and if anyone complains about it
> > > > >      being slower we point them towards DMABUF.
> > > > > 
> > > > > 2) keep the current behavior, but document it.
> > > > > 
> > > > > 3) as 2), but also add a new buffer flag that forces a reacquire of the
> > > > >      buffer. This could be valid for DMABUF as well. E.g.:
> > > > > 
> > > > >      V4L2_BUF_FLAG_REACQUIRE
> > > > > 
> > > > > I'm leaning towards the third option since it won't slow down existing
> > > > > implementations, yet if you do change the userptr every time, then you
> > > > > can now force this to work safely.
> > > > Is there are valid use case for third variant? I would rather go for second.
> > > > 
> > > > There is one more issue related to this. There are many apps which use
> > > > either USERPTR or DMAbuf, but in a bit odd way: they use the same
> > > > buffers all the time, but they ignore buf->index and never match it to
> > > > respective buffer pointers or fds. This makes the current caching
> > > > mechanism useless. Maybe it would make a bit sense do rewrite the
> > > > caching in qbuf to ignore the provided buffer->index?
> > > Notably GStreamer, which inherited this issue from a public API design
> > > error some 15 years ago. Complaint wise, I don't remember someone
> > > complaining about that, so option 1) would simply make the performance
> > > consistent for the framework.
> > After analyzing the DMABUF behavior in this case I realized that the
> > dma_buf framework refcount the mapping, so it won't map again unless
> > it's really necessary. So there is (almost) no performance hit for
> > DMABUF if users do not match dmabuf fds with the buffer index.
> 
> Well, not really. If you consider only the first fs/userptr vs. index 
> mismatch, you are right, the mapping for the queued buffer already 
> exists are will be reused, but this also means that the mapping for the 
> buffer which used that index will be freed. Considering the next calls, 
> you will end up with a typical map/unmap pattern what really hits the 
> performance.
> 
> The question is how to implement a smart caching? If we are talking 
> about the gstreamer and v4l2 plugin, which afair doesn't even match the 
> number of buffers between source and destination between the pipeline 
> elements (for example: codec produces 8 buffers, but scaler operates 
> only with 2 buffers).

We'd match the size if we knew we could match the buffers index, as we
can't, matching it is useless. The CODEC might have 8 buffers, but will
likely only have 2 buffers travelling between the two devices at one
time as most of these buffers are used as reference during the decoding
process.

> 
> > So option 1 *would* slow down the USERPTR performance compared to
> > the other streaming models.
> 
> Best regards

