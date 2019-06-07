Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D196D38BD2
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 15:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbfFGNk7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 09:40:59 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46953 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727600AbfFGNk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 09:40:59 -0400
Received: from [IPv6:2001:420:44c1:2579:fc93:b89a:45f9:2c8a] ([IPv6:2001:420:44c1:2579:fc93:b89a:45f9:2c8a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZF6yhEJAy3qlsZF72htDF9; Fri, 07 Jun 2019 15:40:56 +0200
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
 <20190607111634.GA7593@pendragon.ideasonboard.com>
 <CGME20190607120150epcas3p34178a04f712c89b013a263264cf2184f@epcas3p3.samsung.com>
 <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
 <e674539f-6b40-7b54-90bd-d1ed96ea5f55@samsung.com>
 <6c3ffe98-9d64-b881-470a-bfef8b9280de@xs4all.nl>
 <1f754020-296c-cf9b-1331-598bb774fa42@xs4all.nl>
Message-ID: <4e711a70-ef25-b9f2-e27a-ae6c80288388@xs4all.nl>
Date:   Fri, 7 Jun 2019 15:40:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1f754020-296c-cf9b-1331-598bb774fa42@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHNeqZN+VGI3xw2BRrb/M/3NKy/sejTa7autWHL2rbZuO17WeAxq4TY9Zzpr6XyJ5TNmkyb578CmgdhwMhJjbv8+fnMq6EoqJ7gxV2ddpP8vKODC/Ka6
 lhrPlAh3JUgTAR2qcY2N9wStx6o93OvrvGcgqu6Uhi6M5HLUOgIQMhK+m8AsvxswMhhgIdk5PUlWH+uw9SHC6YWsZeed1SXPLgcrZO7QBEj2xq2vBOvp339c
 BCPTF61b6KoiImJVx4QE7vSVm0vIVi3asOf0WwI3Dg1akmMNQYSNShttY2YisQkcF8jMG2hPP/oY/fnO0xKgyYa6JwRl075Cj+Au9iSZxc3mwHDHxfBT2C1W
 OGBi1w5VvENpub4HnggPaNlX0Tb8Fl8tjFaXCZDlc1F7fUYaIYM+r4jeYUEqbyK6OdbQBLdZRPJaSrSR38OuJUTmw2HybQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/7/19 2:47 PM, Hans Verkuil wrote:
> On 6/7/19 2:23 PM, Hans Verkuil wrote:
>> On 6/7/19 2:14 PM, Marek Szyprowski wrote:
>>> Hi Hans,
>>>
>>> On 2019-06-07 14:01, Hans Verkuil wrote:
>>>> On 6/7/19 1:16 PM, Laurent Pinchart wrote:
>>>>> Hi Hans,
>>>>>
>>>>> Thank you for the patch.
>>>>>
>>>>> On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
>>>>>> The __prepare_userptr() function made the incorrect assumption that if the
>>>>>> same user pointer was used as the last one for which memory was acquired, then
>>>>>> there was no need to re-acquire the memory. This assumption was never properly
>>>>>> tested, and after doing that it became clear that this was in fact wrong.
>>>>> Could you explain in the commit message why the assumption is not
>>>>> correct ?
>>>> You can free the memory, then allocate it again and you can get the same pointer,
>>>> even though it is not necessarily using the same physical pages for the memory
>>>> that the kernel is still using for it.
>>>>
>>>> Worse, you can free the memory, then allocate only half the memory you need and
>>>> get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
>>>> the original mapping still remains), but this can corrupt userspace memory
>>>> causing the application to crash. It's not quite clear to me how the memory can
>>>> get corrupted. I don't know enough of those low-level mm internals to understand
>>>> the sequence of events.
>>>>
>>>> I have test code for v4l2-compliance available if someone wants to test this.
>>>
>>> I'm interested, I would really like to know what happens in the mm 
>>> subsystem in such case.
>>
>> Here it is:
>>
>> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> index be606e48..9abf41da 100644
>> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>> @@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
>>  	return 0;
>>  }
>>
>> -static int captureBufs(struct node *node, const cv4l_queue &q,
>> +static int captureBufs(struct node *node, cv4l_queue &q,
>>  		const cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
>>  		unsigned &capture_count)
>>  {
>> @@ -962,6 +962,21 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
>>  				buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
>>  				buf.s_request_fd(buf_req_fds[req_idx]);
>>  			}
>> +			if (v4l_type_is_capture(buf.g_type()) && q.g_memory() == V4L2_MEMORY_USERPTR) {
>> +				printf("\nidx: %d", buf.g_index());
>> +				for (unsigned p = 0; p < q.g_num_planes(); p++) {
>> +					printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
>> +					fflush(stdout);
>> +					free(buf.g_userptr(p));
>> +					void *m = calloc(1, q.g_length(p)/2);
>> +
>> +					fail_on_test(m == NULL);
>> +					q.s_userptr(buf.g_index(), p, m);
>> +					printf("new buf[%d]: %p", p, m);
>> +					buf.s_userptr(m, p);
>> +				}
>> +				printf("\n");
>> +			}
>>  			fail_on_test(buf.qbuf(node, q));
>>  			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
>>  			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
>>
>>
>>
>> Load the vivid driver and just run 'v4l2-compliance -s10' and you'll see:
>>
>> ...
>> Streaming ioctls:
>>         test read/write: OK
>>         test blocking wait: OK
>>         test MMAP (no poll): OK
>>         test MMAP (select): OK
>>         test MMAP (epoll): OK
>>         Video Capture: Frame #000
>> idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
>>         Video Capture: Frame #001
>> idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
>>         Video Capture: Frame #002
>> idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
>> Aborted
> 
> To clarify: two full size buffers are allocated and queued (that happens in setupUserPtr()),
> then streaming starts and captureBufs is called which basically just calls dqbuf
> and qbuf.
> 
> Tomasz pointed out that all the pointers in this log are actually different. That's
> correct, but here is a log where the old and new buf ptr are the same:
> 
> Streaming ioctls:
>         test read/write: OK
>         test blocking wait: OK
>         test MMAP (no poll): OK
>         test MMAP (select): OK
>         test MMAP (epoll): OK
>         Video Capture: Frame #000
> idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e010
>         Video Capture: Frame #001
> idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15010
>         Video Capture: Frame #002
> idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e010
>         Video Capture: Frame #003
> idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
> Aborted
> 
> It's weird that the first log fails that way: if the pointers are different,
> then vb2 will call get_userptr and it should discover that the buffer isn't
> large enough, causing qbuf to fail. That doesn't seem to happen.

I think that the reason for this corruption is that the memory pool used
by glibc is now large enough for vb2 to think it can map the full length
of the user pointer into memory, even though only the first half is actually
from the buffer that's allocated. When you capture a frame you just overwrite
a random part of the application's memory pool, causing this invalid pointer.

But that's a matter of garbage in, garbage out. So that's not the issue here.

The real question is what happens when you free the old buffer, allocate a
new buffer, end up with the same userptr, but it's using one or more different
pages for its memory compared to the mapping that the kernel uses.

I managed to reproduce this with v4l2-ctl:

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 28b2b3b9..8f2ed9b5 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1422,6 +1422,24 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 		 * has the size that fits the old resolution and might not
 		 * fit to the new one.
 		 */
+		if (q.g_memory() == V4L2_MEMORY_USERPTR) {
+			printf("\nidx: %d", buf.g_index());
+			for (unsigned p = 0; p < q.g_num_planes(); p++) {
+				unsigned *pb = (unsigned *)buf.g_userptr(p);
+				printf(" old buf[%d]: %p first pixel: 0x%x", p, buf.g_userptr(p), *pb);
+				fflush(stdout);
+				free(buf.g_userptr(p));
+				void *m = calloc(1, q.g_length(p));
+
+				if (m == NULL)
+					return QUEUE_ERROR;
+				q.s_userptr(buf.g_index(), p, m);
+				if (m == buf.g_userptr(p))
+					printf(" identical new buf");
+				buf.s_userptr(m, p);
+			}
+			printf("\n");
+		}
 		if (fd.qbuf(buf) && errno != EINVAL) {
 			fprintf(stderr, "%s: qbuf error\n", __func__);
 			return QUEUE_ERROR;


Load vivid, setup a pure white test pattern:

v4l2-ctl -c test_pattern=6

Now run v4l2-ctl --stream-user and you'll see:

idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x80ea80ea identical new buf
<
idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x80ea80ea identical new buf
<
idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x80ea80ea identical new buf
<
idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x80ea80ea identical new buf
<
idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x0 identical new buf
<
idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x0 identical new buf
< 5.00 fps

idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x0 identical new buf
<
idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x0 identical new buf

The first four dequeued buffers are filled with data, after that the
returned buffer is empty because vivid is actually writing to different
memory pages.

With this patch the first pixel is always non-zero.

I wonder if it isn't possible to just check the physical address of
the received user pointer with the physical address of the previous
user pointer. Or something like that. I'll dig around a bit more.

Regards,

	Hans
