Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE7D38A8E
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 14:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbfFGMr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 08:47:26 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48939 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727102AbfFGMr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 08:47:26 -0400
Received: from [IPv6:2001:420:44c1:2579:fc93:b89a:45f9:2c8a] ([IPv6:2001:420:44c1:2579:fc93:b89a:45f9:2c8a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZEHAhDjVH3qlsZEHDhssvo; Fri, 07 Jun 2019 14:47:23 +0200
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
Message-ID: <1f754020-296c-cf9b-1331-598bb774fa42@xs4all.nl>
Date:   Fri, 7 Jun 2019 14:47:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <6c3ffe98-9d64-b881-470a-bfef8b9280de@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB4AFCNSZU446ViZgZqbNNk8qdkmIilNnH/smZrV27fKl6TrUubyQ5Sl9/9pG6F6Z0k5w8/cD9aBWzigr5Re3I3NM1NE7abzCtACQhNZXPFLYL5ZcwfV
 Ey7ALwfOhBQMXcj4Vffj+umjiKnUNCdXniJrTLRn32+fbDMszMiEbD0L4qcd2f0ISox109nB1DGKCfj7biufo4+7fPVAxr1DS6QTwc8dsYjDjgUQ+8ZIvtGO
 gpt4GOriTNg3rXYV+M5fMAOOthhDwQoz7USvsulxijeGr7/IOdhlNTSIjHUpsf3AcIggJp5v9/QqJwfXqPnIZHviwr0xJ15DXoqqV/+h7EMWY0XTuyhwxnQc
 +AHv+R2fIa+23Vhxbl3GDFsnUmP94waVyY1n21TMvQeBLW8Xm54PLZWc/VDorfvpTtC3vJ3l1WQ/YdBr2Q92xtP8ZtjpMQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/7/19 2:23 PM, Hans Verkuil wrote:
> On 6/7/19 2:14 PM, Marek Szyprowski wrote:
>> Hi Hans,
>>
>> On 2019-06-07 14:01, Hans Verkuil wrote:
>>> On 6/7/19 1:16 PM, Laurent Pinchart wrote:
>>>> Hi Hans,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
>>>>> The __prepare_userptr() function made the incorrect assumption that if the
>>>>> same user pointer was used as the last one for which memory was acquired, then
>>>>> there was no need to re-acquire the memory. This assumption was never properly
>>>>> tested, and after doing that it became clear that this was in fact wrong.
>>>> Could you explain in the commit message why the assumption is not
>>>> correct ?
>>> You can free the memory, then allocate it again and you can get the same pointer,
>>> even though it is not necessarily using the same physical pages for the memory
>>> that the kernel is still using for it.
>>>
>>> Worse, you can free the memory, then allocate only half the memory you need and
>>> get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
>>> the original mapping still remains), but this can corrupt userspace memory
>>> causing the application to crash. It's not quite clear to me how the memory can
>>> get corrupted. I don't know enough of those low-level mm internals to understand
>>> the sequence of events.
>>>
>>> I have test code for v4l2-compliance available if someone wants to test this.
>>
>> I'm interested, I would really like to know what happens in the mm 
>> subsystem in such case.
> 
> Here it is:
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index be606e48..9abf41da 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
>  	return 0;
>  }
> 
> -static int captureBufs(struct node *node, const cv4l_queue &q,
> +static int captureBufs(struct node *node, cv4l_queue &q,
>  		const cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
>  		unsigned &capture_count)
>  {
> @@ -962,6 +962,21 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
>  				buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
>  				buf.s_request_fd(buf_req_fds[req_idx]);
>  			}
> +			if (v4l_type_is_capture(buf.g_type()) && q.g_memory() == V4L2_MEMORY_USERPTR) {
> +				printf("\nidx: %d", buf.g_index());
> +				for (unsigned p = 0; p < q.g_num_planes(); p++) {
> +					printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
> +					fflush(stdout);
> +					free(buf.g_userptr(p));
> +					void *m = calloc(1, q.g_length(p)/2);
> +
> +					fail_on_test(m == NULL);
> +					q.s_userptr(buf.g_index(), p, m);
> +					printf("new buf[%d]: %p", p, m);
> +					buf.s_userptr(m, p);
> +				}
> +				printf("\n");
> +			}
>  			fail_on_test(buf.qbuf(node, q));
>  			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
>  			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
> 
> 
> 
> Load the vivid driver and just run 'v4l2-compliance -s10' and you'll see:
> 
> ...
> Streaming ioctls:
>         test read/write: OK
>         test blocking wait: OK
>         test MMAP (no poll): OK
>         test MMAP (select): OK
>         test MMAP (epoll): OK
>         Video Capture: Frame #000
> idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
>         Video Capture: Frame #001
> idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
>         Video Capture: Frame #002
> idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
> Aborted

To clarify: two full size buffers are allocated and queued (that happens in setupUserPtr()),
then streaming starts and captureBufs is called which basically just calls dqbuf
and qbuf.

Tomasz pointed out that all the pointers in this log are actually different. That's
correct, but here is a log where the old and new buf ptr are the same:

Streaming ioctls:
        test read/write: OK
        test blocking wait: OK
        test MMAP (no poll): OK
        test MMAP (select): OK
        test MMAP (epoll): OK
        Video Capture: Frame #000
idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e010
        Video Capture: Frame #001
idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15010
        Video Capture: Frame #002
idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e010
        Video Capture: Frame #003
idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
Aborted

It's weird that the first log fails that way: if the pointers are different,
then vb2 will call get_userptr and it should discover that the buffer isn't
large enough, causing qbuf to fail. That doesn't seem to happen.

Regards,

	Hans
