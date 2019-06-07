Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DADBC38D80
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 16:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfFGOj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 10:39:28 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51287 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728612AbfFGOj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 10:39:28 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190607143926euoutp0151b80bf1ffbe37591070221a0514b4e7~l8X09vKZ80315503155euoutp01c
        for <linux-media@vger.kernel.org>; Fri,  7 Jun 2019 14:39:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190607143926euoutp0151b80bf1ffbe37591070221a0514b4e7~l8X09vKZ80315503155euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559918366;
        bh=JNLxgPI/4AUJqtZqMeIQ34Cp7H2po7IcbxNxC4kMMas=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=fKJODt0OkeYao7JQKtpqcxPgakDClsrdCCpYQpEqvMKwM0m6kEmUfGAnCHACvwfrs
         9jeOalmN84xtihmKg8JgKmDvCheRLLh9LZco6OZH52pYnL99xeAzgxeCzFnG2yz4wP
         fYRV3tVFeYZmGYCbAqXQfxf3P20MC1zqFaj5bmeA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190607143925eucas1p1c596fa9f0109b0ab0cce229669d06f55~l8X0RTqxE1579115791eucas1p1W;
        Fri,  7 Jun 2019 14:39:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 23.14.04298.D177AFC5; Fri,  7
        Jun 2019 15:39:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190607143924eucas1p2f8a69d031d4154861c58853a887af1a7~l8XzYzre62621826218eucas1p25;
        Fri,  7 Jun 2019 14:39:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190607143924eusmtrp224a18ab672a439caf1ca01b600c5ec5f~l8XzJTGlE1716217162eusmtrp2O;
        Fri,  7 Jun 2019 14:39:24 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-b7-5cfa771dd65f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id AB.21.04140.C177AFC5; Fri,  7
        Jun 2019 15:39:24 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190607143923eusmtip1d0725378bf3305b6f763c9ad1eab9494~l8XyvqUg13200132001eusmtip18;
        Fri,  7 Jun 2019 14:39:23 +0000 (GMT)
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <3e0cf83d-1f69-0d71-96b5-339dad660b1d@samsung.com>
Date:   Fri, 7 Jun 2019 16:39:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <07253fe3-0152-24e1-87f1-ba77d8630a97@xs4all.nl>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsWy7djP87qy5b9iDJ7O47A4NfkZk0XnxCXs
        Fj0btrJafNryjcnic+s/NgdWj9kNF1k8ZnfMZPWYdzLQ4/MmOY9TXz+zB7BGcdmkpOZklqUW
        6dslcGXMWj2DqeBySMW8pweYGhifO3UxcnJICJhIzHu/gLGLkYtDSGAFo8SV9insEM4XRonz
        TYfYQaqEBD4zSryd7wrTsX3aHGaIouWMElvW32aDcN4ySlzb2A7WISwQKHFvxi1WEFtEIFZi
        xaIvYDuYBboZJdbPWgCWYBMwlOh628UGYvMK2Em0vJvPCGKzCKhIHDv7FywuKhAj8XX/VWaI
        GkGJkzOfsIDYnAK2Emt+zgebwywgL7H97RxmCFtc4taT+UwgyyQEFrFLzNyyjQXibheJQ98v
        sELYwhKvjm9hh7BlJP7vhGloZpR4eG4tO4TTwyhxuWkGI0SVtcTh4xeBujmAVmhKrN+lDxF2
        lPiz9yA7SFhCgE/ixltBiCP4JCZtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFPYFSaheS1WUje
        mYXknVkIexcwsqxiFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITDin/x3/tIPx66WkQ4wC
        HIxKPLwe7D9jhFgTy4orcw8xSnAwK4nwll34ESPEm5JYWZValB9fVJqTWnyIUZqDRUmct5rh
        QbSQQHpiSWp2ampBahFMlomDU6qBUVIhfv4aoTt7NavUlNLmd02IYuq8yskrsyVH70ZNgdB2
        uxXMjBPWHPCsV/7iuKwtuN5/yrVbbyJPrj56J+pXbel5Jtv1RpWVRWnNy16peq7JPKnoNEmq
        iUWobu/Xwkm6t2VDTnkl92++cXeHWNu8/uDkp0EvvFKavB7fORj9Y/3dLb8N9nN+V2Ipzkg0
        1GIuKk4EAAl05zk0AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xu7oy5b9iDBr+c1icmvyMyaJz4hJ2
        i54NW1ktPm35xmTxufUfmwOrx+yGiywesztmsnrMOxno8XmTnMepr5/ZA1ij9GyK8ktLUhUy
        8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DJmrZ7BVHA5pGLe0wNM
        DYzPnboYOTkkBEwktk+bwwxiCwksZZQ4+0gVIi4jcXJaAyuELSzx51oXWxcjF1DNa0aJ5xfv
        soMkhAUCJe7NuAVWJCIQK9G14j9YEbNAN6PE0Yb7jBAd61gkJv1ZB7aCTcBQoustyChODl4B
        O4mWd/MZQWwWARWJY2f/gsVFBWIk+hpXsEDUCEqcnPkEzOYUsJVY83M+2DZmATOJeZsfMkPY
        8hLb386BssUlbj2ZzzSBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k
        /NxNjMAI23bs55YdjF3vgg8xCnAwKvHwzmD6GSPEmlhWXJl7iFGCg1lJhLfswo8YId6UxMqq
        1KL8+KLSnNTiQ4ymQM9NZJYSTc4HRn9eSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU
        1ILUIpg+Jg5OqQbG5kuWAbd7vFlc42fqOCzSm9QoLaR8etOFXXuPv+UyNz8gZxuhxuqw9UbB
        7re3u03lg9fXW7wvZBC8kT1/XqtO0f1a3weVnV9fL69tS/uX/fDizq2lwRNevGh55aQm+C13
        oviR1rXrJn9rnMTx+pFc1W+hqHkqXLvav2SGZi5+c97KpKh95tFOJZbijERDLeai4kQABLO6
        MMYCAAA=
X-CMS-MailID: 20190607143924eucas1p2f8a69d031d4154861c58853a887af1a7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190607120150epcas3p34178a04f712c89b013a263264cf2184f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607120150epcas3p34178a04f712c89b013a263264cf2184f
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2019-06-07 16:11, Hans Verkuil wrote:
> On 6/7/19 3:55 PM, Marek Szyprowski wrote:
>> On 2019-06-07 15:40, Hans Verkuil wrote:
>>> On 6/7/19 2:47 PM, Hans Verkuil wrote:
>>>> On 6/7/19 2:23 PM, Hans Verkuil wrote:
>>>>> On 6/7/19 2:14 PM, Marek Szyprowski wrote:
>>>>>> On 2019-06-07 14:01, Hans Verkuil wrote:
>>>>>>> On 6/7/19 1:16 PM, Laurent Pinchart wrote:
>>>>>>>> Thank you for the patch.
>>>>>>>>
>>>>>>>> On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
>>>>>>>>> The __prepare_userptr() function made the incorrect assumption that if the
>>>>>>>>> same user pointer was used as the last one for which memory was acquired, then
>>>>>>>>> there was no need to re-acquire the memory. This assumption was never properly
>>>>>>>>> tested, and after doing that it became clear that this was in fact wrong.
>>>>>>>> Could you explain in the commit message why the assumption is not
>>>>>>>> correct ?
>>>>>>> You can free the memory, then allocate it again and you can get the same pointer,
>>>>>>> even though it is not necessarily using the same physical pages for the memory
>>>>>>> that the kernel is still using for it.
>>>>>>>
>>>>>>> Worse, you can free the memory, then allocate only half the memory you need and
>>>>>>> get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
>>>>>>> the original mapping still remains), but this can corrupt userspace memory
>>>>>>> causing the application to crash. It's not quite clear to me how the memory can
>>>>>>> get corrupted. I don't know enough of those low-level mm internals to understand
>>>>>>> the sequence of events.
>>>>>>>
>>>>>>> I have test code for v4l2-compliance available if someone wants to test this.
>>>>>> I'm interested, I would really like to know what happens in the mm
>>>>>> subsystem in such case.
>>>>> Here it is:
>>>>>
>>>>> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>>>>> index be606e48..9abf41da 100644
>>>>> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
>>>>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>>>>> @@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
>>>>>    	return 0;
>>>>>    }
>>>>>
>>>>> -static int captureBufs(struct node *node, const cv4l_queue &q,
>>>>> +static int captureBufs(struct node *node, cv4l_queue &q,
>>>>>    		const cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
>>>>>    		unsigned &capture_count)
>>>>>    {
>>>>> @@ -962,6 +962,21 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
>>>>>    				buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
>>>>>    				buf.s_request_fd(buf_req_fds[req_idx]);
>>>>>    			}
>>>>> +			if (v4l_type_is_capture(buf.g_type()) && q.g_memory() == V4L2_MEMORY_USERPTR) {
>>>>> +				printf("\nidx: %d", buf.g_index());
>>>>> +				for (unsigned p = 0; p < q.g_num_planes(); p++) {
>>>>> +					printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
>>>>> +					fflush(stdout);
>>>>> +					free(buf.g_userptr(p));
>>>>> +					void *m = calloc(1, q.g_length(p)/2);
>>>>> +
>>>>> +					fail_on_test(m == NULL);
>>>>> +					q.s_userptr(buf.g_index(), p, m);
>>>>> +					printf("new buf[%d]: %p", p, m);
>>>>> +					buf.s_userptr(m, p);
>>>>> +				}
>>>>> +				printf("\n");
>>>>> +			}
>>>>>    			fail_on_test(buf.qbuf(node, q));
>>>>>    			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
>>>>>    			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
>>>>>
>>>>>
>>>>>
>>>>> Load the vivid driver and just run 'v4l2-compliance -s10' and you'll see:
>>>>>
>>>>> ...
>>>>> Streaming ioctls:
>>>>>           test read/write: OK
>>>>>           test blocking wait: OK
>>>>>           test MMAP (no poll): OK
>>>>>           test MMAP (select): OK
>>>>>           test MMAP (epoll): OK
>>>>>           Video Capture: Frame #000
>>>>> idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
>>>>>           Video Capture: Frame #001
>>>>> idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
>>>>>           Video Capture: Frame #002
>>>>> idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
>>>>> Aborted
>>>> To clarify: two full size buffers are allocated and queued (that happens in setupUserPtr()),
>>>> then streaming starts and captureBufs is called which basically just calls dqbuf
>>>> and qbuf.
>>>>
>>>> Tomasz pointed out that all the pointers in this log are actually different. That's
>>>> correct, but here is a log where the old and new buf ptr are the same:
>>>>
>>>> Streaming ioctls:
>>>>           test read/write: OK
>>>>           test blocking wait: OK
>>>>           test MMAP (no poll): OK
>>>>           test MMAP (select): OK
>>>>           test MMAP (epoll): OK
>>>>           Video Capture: Frame #000
>>>> idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e010
>>>>           Video Capture: Frame #001
>>>> idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15010
>>>>           Video Capture: Frame #002
>>>> idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e010
>>>>           Video Capture: Frame #003
>>>> idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
>>>> Aborted
>>>>
>>>> It's weird that the first log fails that way: if the pointers are different,
>>>> then vb2 will call get_userptr and it should discover that the buffer isn't
>>>> large enough, causing qbuf to fail. That doesn't seem to happen.
>>> I think that the reason for this corruption is that the memory pool used
>>> by glibc is now large enough for vb2 to think it can map the full length
>>> of the user pointer into memory, even though only the first half is actually
>>> from the buffer that's allocated. When you capture a frame you just overwrite
>>> a random part of the application's memory pool, causing this invalid pointer.
>>>
>>> But that's a matter of garbage in, garbage out. So that's not the issue here.
>>>
>>> The real question is what happens when you free the old buffer, allocate a
>>> new buffer, end up with the same userptr, but it's using one or more different
>>> pages for its memory compared to the mapping that the kernel uses.
>>>
>>> I managed to reproduce this with v4l2-ctl:
>>>
>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>>> index 28b2b3b9..8f2ed9b5 100644
>>> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>>> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>>> @@ -1422,6 +1422,24 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
>>>    		 * has the size that fits the old resolution and might not
>>>    		 * fit to the new one.
>>>    		 */
>>> +		if (q.g_memory() == V4L2_MEMORY_USERPTR) {
>>> +			printf("\nidx: %d", buf.g_index());
>>> +			for (unsigned p = 0; p < q.g_num_planes(); p++) {
>>> +				unsigned *pb = (unsigned *)buf.g_userptr(p);
>>> +				printf(" old buf[%d]: %p first pixel: 0x%x", p, buf.g_userptr(p), *pb);
>>> +				fflush(stdout);
>>> +				free(buf.g_userptr(p));
>>> +				void *m = calloc(1, q.g_length(p));
>>> +
>>> +				if (m == NULL)
>>> +					return QUEUE_ERROR;
>>> +				q.s_userptr(buf.g_index(), p, m);
>>> +				if (m == buf.g_userptr(p))
>>> +					printf(" identical new buf");
>>> +				buf.s_userptr(m, p);
>>> +			}
>>> +			printf("\n");
>>> +		}
>>>    		if (fd.qbuf(buf) && errno != EINVAL) {
>>>    			fprintf(stderr, "%s: qbuf error\n", __func__);
>>>    			return QUEUE_ERROR;
>>>
>>>
>>> Load vivid, setup a pure white test pattern:
>>>
>>> v4l2-ctl -c test_pattern=6
>>>
>>> Now run v4l2-ctl --stream-user and you'll see:
>>>
>>> idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x80ea80ea identical new buf
>>> <
>>> idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x80ea80ea identical new buf
>>> <
>>> idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x80ea80ea identical new buf
>>> <
>>> idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x80ea80ea identical new buf
>>> <
>>> idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x0 identical new buf
>>> <
>>> idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x0 identical new buf
>>> < 5.00 fps
>>>
>>> idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x0 identical new buf
>>> <
>>> idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x0 identical new buf
>>>
>>> The first four dequeued buffers are filled with data, after that the
>>> returned buffer is empty because vivid is actually writing to different
>>> memory pages.
>>>
>>> With this patch the first pixel is always non-zero.
>> Good catch. The question is weather we treat that as undefined behavior
>> and keep the optimization for 'good applications' or assume that every
>> broken userspace code has to be properly handled. The good thing is that
>> there is still imho no security issue. The physical pages gathered by
> Yeah, that scared me for a bit, but it all looks secure.
>
>> vb2 in worst case belongs to noone else (vb2 is their last user, they
>> are not yet returned to free pages pool).
> I see three options:
>
> 1) just always reacquire the buffer, and if anyone complains about it
>     being slower we point them towards DMABUF.
>
> 2) keep the current behavior, but document it.
>
> 3) as 2), but also add a new buffer flag that forces a reacquire of the
>     buffer. This could be valid for DMABUF as well. E.g.:
>
>     V4L2_BUF_FLAG_REACQUIRE
>
> I'm leaning towards the third option since it won't slow down existing
> implementations, yet if you do change the userptr every time, then you
> can now force this to work safely.

Is there are valid use case for third variant? I would rather go for second.

There is one more issue related to this. There are many apps which use 
either USERPTR or DMAbuf, but in a bit odd way: they use the same 
buffers all the time, but they ignore buf->index and never match it to 
respective buffer pointers or fds. This makes the current caching 
mechanism useless. Maybe it would make a bit sense do rewrite the 
caching in qbuf to ignore the provided buffer->index?

>>> I wonder if it isn't possible to just check the physical address of
>>> the received user pointer with the physical address of the previous
>>> user pointer. Or something like that. I'll dig around a bit more.
>> Such check won't be so simple. Pages contiguous in the virtual memory
>> won't map to pages contiguous in the physical memory, so you would need
>> to check every single memory page. Make no sense. It is better to
>> reacquire buffer on every queue operation. This indeed show how broken
>> the USERPTR related part of v4l2 API is.
> OK, good to know. Then I'm not going to spend time on that.
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

