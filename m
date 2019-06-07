Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF3BF38D97
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 16:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbfFGOos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 10:44:48 -0400
Received: from mga03.intel.com ([134.134.136.65]:17560 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728198AbfFGOos (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 10:44:48 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jun 2019 07:44:47 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007.jf.intel.com with ESMTP; 07 Jun 2019 07:44:45 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 15BF520758; Fri,  7 Jun 2019 17:44:45 +0300 (EEST)
Date:   Fri, 7 Jun 2019 17:44:45 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
Message-ID: <20190607144444.ccfpgoq5suzqwqsq@paasikivi.fi.intel.com>
References: <20190607111634.GA7593@pendragon.ideasonboard.com>
 <CGME20190607120150epcas3p34178a04f712c89b013a263264cf2184f@epcas3p3.samsung.com>
 <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
 <e674539f-6b40-7b54-90bd-d1ed96ea5f55@samsung.com>
 <6c3ffe98-9d64-b881-470a-bfef8b9280de@xs4all.nl>
 <1f754020-296c-cf9b-1331-598bb774fa42@xs4all.nl>
 <4e711a70-ef25-b9f2-e27a-ae6c80288388@xs4all.nl>
 <ddacf8a1-61c4-bc04-8c52-cd56dfd13842@samsung.com>
 <07253fe3-0152-24e1-87f1-ba77d8630a97@xs4all.nl>
 <3e0cf83d-1f69-0d71-96b5-339dad660b1d@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e0cf83d-1f69-0d71-96b5-339dad660b1d@samsung.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Fri, Jun 07, 2019 at 04:39:22PM +0200, Marek Szyprowski wrote:
> Hi Hans,
> 
> On 2019-06-07 16:11, Hans Verkuil wrote:
> > On 6/7/19 3:55 PM, Marek Szyprowski wrote:
> >> On 2019-06-07 15:40, Hans Verkuil wrote:
> >>> On 6/7/19 2:47 PM, Hans Verkuil wrote:
> >>>> On 6/7/19 2:23 PM, Hans Verkuil wrote:
> >>>>> On 6/7/19 2:14 PM, Marek Szyprowski wrote:
> >>>>>> On 2019-06-07 14:01, Hans Verkuil wrote:
> >>>>>>> On 6/7/19 1:16 PM, Laurent Pinchart wrote:
> >>>>>>>> Thank you for the patch.
> >>>>>>>>
> >>>>>>>> On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
> >>>>>>>>> The __prepare_userptr() function made the incorrect assumption that if the
> >>>>>>>>> same user pointer was used as the last one for which memory was acquired, then
> >>>>>>>>> there was no need to re-acquire the memory. This assumption was never properly
> >>>>>>>>> tested, and after doing that it became clear that this was in fact wrong.
> >>>>>>>> Could you explain in the commit message why the assumption is not
> >>>>>>>> correct ?
> >>>>>>> You can free the memory, then allocate it again and you can get the same pointer,
> >>>>>>> even though it is not necessarily using the same physical pages for the memory
> >>>>>>> that the kernel is still using for it.
> >>>>>>>
> >>>>>>> Worse, you can free the memory, then allocate only half the memory you need and
> >>>>>>> get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
> >>>>>>> the original mapping still remains), but this can corrupt userspace memory
> >>>>>>> causing the application to crash. It's not quite clear to me how the memory can
> >>>>>>> get corrupted. I don't know enough of those low-level mm internals to understand
> >>>>>>> the sequence of events.
> >>>>>>>
> >>>>>>> I have test code for v4l2-compliance available if someone wants to test this.
> >>>>>> I'm interested, I would really like to know what happens in the mm
> >>>>>> subsystem in such case.
> >>>>> Here it is:
> >>>>>
> >>>>> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> >>>>> index be606e48..9abf41da 100644
> >>>>> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> >>>>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> >>>>> @@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
> >>>>>    	return 0;
> >>>>>    }
> >>>>>
> >>>>> -static int captureBufs(struct node *node, const cv4l_queue &q,
> >>>>> +static int captureBufs(struct node *node, cv4l_queue &q,
> >>>>>    		const cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
> >>>>>    		unsigned &capture_count)
> >>>>>    {
> >>>>> @@ -962,6 +962,21 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
> >>>>>    				buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
> >>>>>    				buf.s_request_fd(buf_req_fds[req_idx]);
> >>>>>    			}
> >>>>> +			if (v4l_type_is_capture(buf.g_type()) && q.g_memory() == V4L2_MEMORY_USERPTR) {
> >>>>> +				printf("\nidx: %d", buf.g_index());
> >>>>> +				for (unsigned p = 0; p < q.g_num_planes(); p++) {
> >>>>> +					printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
> >>>>> +					fflush(stdout);
> >>>>> +					free(buf.g_userptr(p));
> >>>>> +					void *m = calloc(1, q.g_length(p)/2);
> >>>>> +
> >>>>> +					fail_on_test(m == NULL);
> >>>>> +					q.s_userptr(buf.g_index(), p, m);
> >>>>> +					printf("new buf[%d]: %p", p, m);
> >>>>> +					buf.s_userptr(m, p);
> >>>>> +				}
> >>>>> +				printf("\n");
> >>>>> +			}
> >>>>>    			fail_on_test(buf.qbuf(node, q));
> >>>>>    			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
> >>>>>    			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
> >>>>>
> >>>>>
> >>>>>
> >>>>> Load the vivid driver and just run 'v4l2-compliance -s10' and you'll see:
> >>>>>
> >>>>> ...
> >>>>> Streaming ioctls:
> >>>>>           test read/write: OK
> >>>>>           test blocking wait: OK
> >>>>>           test MMAP (no poll): OK
> >>>>>           test MMAP (select): OK
> >>>>>           test MMAP (epoll): OK
> >>>>>           Video Capture: Frame #000
> >>>>> idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
> >>>>>           Video Capture: Frame #001
> >>>>> idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
> >>>>>           Video Capture: Frame #002
> >>>>> idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
> >>>>> Aborted
> >>>> To clarify: two full size buffers are allocated and queued (that happens in setupUserPtr()),
> >>>> then streaming starts and captureBufs is called which basically just calls dqbuf
> >>>> and qbuf.
> >>>>
> >>>> Tomasz pointed out that all the pointers in this log are actually different. That's
> >>>> correct, but here is a log where the old and new buf ptr are the same:
> >>>>
> >>>> Streaming ioctls:
> >>>>           test read/write: OK
> >>>>           test blocking wait: OK
> >>>>           test MMAP (no poll): OK
> >>>>           test MMAP (select): OK
> >>>>           test MMAP (epoll): OK
> >>>>           Video Capture: Frame #000
> >>>> idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e010
> >>>>           Video Capture: Frame #001
> >>>> idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15010
> >>>>           Video Capture: Frame #002
> >>>> idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e010
> >>>>           Video Capture: Frame #003
> >>>> idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
> >>>> Aborted
> >>>>
> >>>> It's weird that the first log fails that way: if the pointers are different,
> >>>> then vb2 will call get_userptr and it should discover that the buffer isn't
> >>>> large enough, causing qbuf to fail. That doesn't seem to happen.
> >>> I think that the reason for this corruption is that the memory pool used
> >>> by glibc is now large enough for vb2 to think it can map the full length
> >>> of the user pointer into memory, even though only the first half is actually
> >>> from the buffer that's allocated. When you capture a frame you just overwrite
> >>> a random part of the application's memory pool, causing this invalid pointer.
> >>>
> >>> But that's a matter of garbage in, garbage out. So that's not the issue here.
> >>>
> >>> The real question is what happens when you free the old buffer, allocate a
> >>> new buffer, end up with the same userptr, but it's using one or more different
> >>> pages for its memory compared to the mapping that the kernel uses.
> >>>
> >>> I managed to reproduce this with v4l2-ctl:
> >>>
> >>> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> >>> index 28b2b3b9..8f2ed9b5 100644
> >>> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> >>> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> >>> @@ -1422,6 +1422,24 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
> >>>    		 * has the size that fits the old resolution and might not
> >>>    		 * fit to the new one.
> >>>    		 */
> >>> +		if (q.g_memory() == V4L2_MEMORY_USERPTR) {
> >>> +			printf("\nidx: %d", buf.g_index());
> >>> +			for (unsigned p = 0; p < q.g_num_planes(); p++) {
> >>> +				unsigned *pb = (unsigned *)buf.g_userptr(p);
> >>> +				printf(" old buf[%d]: %p first pixel: 0x%x", p, buf.g_userptr(p), *pb);
> >>> +				fflush(stdout);
> >>> +				free(buf.g_userptr(p));
> >>> +				void *m = calloc(1, q.g_length(p));
> >>> +
> >>> +				if (m == NULL)
> >>> +					return QUEUE_ERROR;
> >>> +				q.s_userptr(buf.g_index(), p, m);
> >>> +				if (m == buf.g_userptr(p))
> >>> +					printf(" identical new buf");
> >>> +				buf.s_userptr(m, p);
> >>> +			}
> >>> +			printf("\n");
> >>> +		}
> >>>    		if (fd.qbuf(buf) && errno != EINVAL) {
> >>>    			fprintf(stderr, "%s: qbuf error\n", __func__);
> >>>    			return QUEUE_ERROR;
> >>>
> >>>
> >>> Load vivid, setup a pure white test pattern:
> >>>
> >>> v4l2-ctl -c test_pattern=6
> >>>
> >>> Now run v4l2-ctl --stream-user and you'll see:
> >>>
> >>> idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x80ea80ea identical new buf
> >>> <
> >>> idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x80ea80ea identical new buf
> >>> <
> >>> idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x80ea80ea identical new buf
> >>> <
> >>> idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x80ea80ea identical new buf
> >>> <
> >>> idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x0 identical new buf
> >>> <
> >>> idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x0 identical new buf
> >>> < 5.00 fps
> >>>
> >>> idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x0 identical new buf
> >>> <
> >>> idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x0 identical new buf
> >>>
> >>> The first four dequeued buffers are filled with data, after that the
> >>> returned buffer is empty because vivid is actually writing to different
> >>> memory pages.
> >>>
> >>> With this patch the first pixel is always non-zero.
> >> Good catch. The question is weather we treat that as undefined behavior
> >> and keep the optimization for 'good applications' or assume that every
> >> broken userspace code has to be properly handled. The good thing is that
> >> there is still imho no security issue. The physical pages gathered by
> > Yeah, that scared me for a bit, but it all looks secure.
> >
> >> vb2 in worst case belongs to noone else (vb2 is their last user, they
> >> are not yet returned to free pages pool).
> > I see three options:
> >
> > 1) just always reacquire the buffer, and if anyone complains about it
> >     being slower we point them towards DMABUF.
> >
> > 2) keep the current behavior, but document it.
> >
> > 3) as 2), but also add a new buffer flag that forces a reacquire of the
> >     buffer. This could be valid for DMABUF as well. E.g.:
> >
> >     V4L2_BUF_FLAG_REACQUIRE
> >
> > I'm leaning towards the third option since it won't slow down existing
> > implementations, yet if you do change the userptr every time, then you
> > can now force this to work safely.
> 
> Is there are valid use case for third variant? I would rather go for second.
> 
> There is one more issue related to this. There are many apps which use 
> either USERPTR or DMAbuf, but in a bit odd way: they use the same 
> buffers all the time, but they ignore buf->index and never match it to 
> respective buffer pointers or fds. This makes the current caching 
> mechanism useless. Maybe it would make a bit sense do rewrite the 
> caching in qbuf to ignore the provided buffer->index?

It's the index that is used to refer to a given buffer object. The fact
that we have both queueing and mapping a buffer in the same IOCTL is, well,
something that I think we wouldn't do today.

So I don't think we can change this to work based on a memory address just
like that.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
