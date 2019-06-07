Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75B6838A19
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 14:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbfFGMXQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 08:23:16 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46901 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727693AbfFGMXQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 08:23:16 -0400
Received: from [IPv6:2001:420:44c1:2579:fc93:b89a:45f9:2c8a] ([IPv6:2001:420:44c1:2579:fc93:b89a:45f9:2c8a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZDtmhDSnV3qlsZDtphsisg; Fri, 07 Jun 2019 14:23:13 +0200
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
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
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6c3ffe98-9d64-b881-470a-bfef8b9280de@xs4all.nl>
Date:   Fri, 7 Jun 2019 14:23:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <e674539f-6b40-7b54-90bd-d1ed96ea5f55@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNNZKney+mT7znIjbbdVBv4Si4EM5Burk/gE0pBCbD0lpX3us5lK6oOWPC2QsQ+mpSCdJ1R34hOXaCB6z913C3kEd2Y26FdYs/fdqBDGbDLKPJJI6z5k
 FZCmY/ymOv90SfUBqiOWkBDj8WRfgrTb+E9GH/hoe0MnABVQsmxZI3qWgKe1rcV5py3ct4OZe8LZzYyZZCoPgmyWAh8pmw9KeFfHKugHWG9WyptFNBe3N/39
 K6Rgas3RKmEqfOxuoQYgI+S0QLNhg1DQp/N+2y/A3+fTUFWu0lR+9H2pmuoEMkx3VREMra2exZSGVNdwjRSS/avzzL/e4BPp8La4yP7EKJUhb4gW621jsopz
 n8mM+tsE6Y/+EoObMB1zPqvwoAwCaDkR3Szu7vzo+1v07s8P89ReYVXCGaBoM4pXToZ7fI8gCH74zg3OOj/jvKhZLTBglg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/7/19 2:14 PM, Marek Szyprowski wrote:
> Hi Hans,
> 
> On 2019-06-07 14:01, Hans Verkuil wrote:
>> On 6/7/19 1:16 PM, Laurent Pinchart wrote:
>>> Hi Hans,
>>>
>>> Thank you for the patch.
>>>
>>> On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
>>>> The __prepare_userptr() function made the incorrect assumption that if the
>>>> same user pointer was used as the last one for which memory was acquired, then
>>>> there was no need to re-acquire the memory. This assumption was never properly
>>>> tested, and after doing that it became clear that this was in fact wrong.
>>> Could you explain in the commit message why the assumption is not
>>> correct ?
>> You can free the memory, then allocate it again and you can get the same pointer,
>> even though it is not necessarily using the same physical pages for the memory
>> that the kernel is still using for it.
>>
>> Worse, you can free the memory, then allocate only half the memory you need and
>> get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
>> the original mapping still remains), but this can corrupt userspace memory
>> causing the application to crash. It's not quite clear to me how the memory can
>> get corrupted. I don't know enough of those low-level mm internals to understand
>> the sequence of events.
>>
>> I have test code for v4l2-compliance available if someone wants to test this.
> 
> I'm interested, I would really like to know what happens in the mm 
> subsystem in such case.

Here it is:

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index be606e48..9abf41da 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
 	return 0;
 }

-static int captureBufs(struct node *node, const cv4l_queue &q,
+static int captureBufs(struct node *node, cv4l_queue &q,
 		const cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
 		unsigned &capture_count)
 {
@@ -962,6 +962,21 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
 				buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
 				buf.s_request_fd(buf_req_fds[req_idx]);
 			}
+			if (v4l_type_is_capture(buf.g_type()) && q.g_memory() == V4L2_MEMORY_USERPTR) {
+				printf("\nidx: %d", buf.g_index());
+				for (unsigned p = 0; p < q.g_num_planes(); p++) {
+					printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
+					fflush(stdout);
+					free(buf.g_userptr(p));
+					void *m = calloc(1, q.g_length(p)/2);
+
+					fail_on_test(m == NULL);
+					q.s_userptr(buf.g_index(), p, m);
+					printf("new buf[%d]: %p", p, m);
+					buf.s_userptr(m, p);
+				}
+				printf("\n");
+			}
 			fail_on_test(buf.qbuf(node, q));
 			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
 			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {



Load the vivid driver and just run 'v4l2-compliance -s10' and you'll see:

...
Streaming ioctls:
        test read/write: OK
        test blocking wait: OK
        test MMAP (no poll): OK
        test MMAP (select): OK
        test MMAP (epoll): OK
        Video Capture: Frame #000
idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
        Video Capture: Frame #001
idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
        Video Capture: Frame #002
idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
Aborted

Regards,

	Hans
