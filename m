Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 085F938C03
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 15:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbfFGNzL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 09:55:11 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56382 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727915AbfFGNzL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 09:55:11 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190607135508euoutp029ef0f2047ef002a4acd565c121215a2f~l7xKBVaMn1209312093euoutp02V
        for <linux-media@vger.kernel.org>; Fri,  7 Jun 2019 13:55:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190607135508euoutp029ef0f2047ef002a4acd565c121215a2f~l7xKBVaMn1209312093euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559915708;
        bh=VRr+sPX9MEg19zgMg/Q+DZS8+7p6RRBpkpAjDjuzQ+k=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=cSn1gW/kB8T7e2Fub8no2DjLVVPp7oZsyWIk9Tp5IkHmUJuuayMRdI72xX1ShSqVY
         36p6vHzh8M+m6Bi50p3MIPRkFJrvIN1em2NU7HuKVujht4l8m9dNIhigtvpFn7n0Ki
         DgLL4S/YAGqsNqiJE+lyRmH8F6sbcuLTSlF403/o=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190607135508eucas1p28abdc7d7b2b2d525a9bb8ddf164b9a98~l7xJtPIAC0119701197eucas1p2Q;
        Fri,  7 Jun 2019 13:55:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 54.6C.04325.CBC6AFC5; Fri,  7
        Jun 2019 14:55:08 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190607135507eucas1p10c7c2b0f09f3d716867e898645986072~l7xIjgWAD0802108021eucas1p1S;
        Fri,  7 Jun 2019 13:55:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190607135506eusmtrp23078b666cf6901c948d606d22c877588~l7xIT_El82401924019eusmtrp2h;
        Fri,  7 Jun 2019 13:55:06 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-4a-5cfa6cbcb61b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 5F.F1.04146.ABC6AFC5; Fri,  7
        Jun 2019 14:55:06 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190607135506eusmtip19e2940150e6fa38e0466a4752294aa7a~l7xH64DCL0484304843eusmtip1P;
        Fri,  7 Jun 2019 13:55:06 +0000 (GMT)
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ddacf8a1-61c4-bc04-8c52-cd56dfd13842@samsung.com>
Date:   Fri, 7 Jun 2019 15:55:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4e711a70-ef25-b9f2-e27a-ae6c80288388@xs4all.nl>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsWy7djPc7p7cn7FGMxsZLE4NfkZk0XnxCXs
        Fj0btrJafNryjcnic+s/NgdWj9kNF1k8ZnfMZPWYdzLQ4/MmOY9TXz+zB7BGcdmkpOZklqUW
        6dslcGXsnfWCvWCTe8Xh+W4NjP/Nuxg5OSQETCTO3VvI3MXIxSEksIJRYkLrehYI5wujxK0X
        fUwQzmdGiaOrv7HBtHT9ucsOkVjOKDFp2gOolreMEhe/rWAFqRIWCJS4N+MWmC0iECuxYtEX
        RpAiZoFuRon1sxaAJdgEDCW63naBjeUVsJPYtWc5I4jNIqAi8WXVVGYQW1QgRuLr/qvMEDWC
        EidnPmEBsTkFbCVW978Am8MsIC+x/e0cZghbXOLWk/lgd0sILGKX6L31ngnibheJC7P6WSBs
        YYlXx7ewQ9gyEv93wjQ0M0o8PLeWHcLpYZS43DSDEaLKWuLw8YtA6ziAVmhKrN+lDxF2lPiz
        9yA7SFhCgE/ixltBiCP4JCZtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFPYFSaheS1WUjemYXk
        nVkIexcwsqxiFE8tLc5NTy02zkst1ytOzC0uzUvXS87P3cQITDin/x3/uoNx35+kQ4wCHIxK
        PLwe7D9jhFgTy4orcw8xSnAwK4nwll34ESPEm5JYWZValB9fVJqTWnyIUZqDRUmct5rhQbSQ
        QHpiSWp2ampBahFMlomDU6qBkYeDf9nhP8dvnH5683WwzQeTSaY/fi5UrQtpnehRrMai3+Ob
        xrhISth6Y7/7Xa3KHxtZnvxMufbosrdZVOUjb67Ik3s/W5615J12LU4wraPLZ9rPde1B35ss
        r/wX5m95ldSaE1gqVdSe+v/12+//F30/7cF/+f6StsnnMl/d6z/17sTKt+s2FCuxFGckGmox
        FxUnAgB6sQcKNAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xu7q7cn7FGEz/qm9xavIzJovOiUvY
        LXo2bGW1+LTlG5PF59Z/bA6sHrMbLrJ4zO6Yyeox72Sgx+dNch6nvn5mD2CN0rMpyi8tSVXI
        yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MvYO+sFe8Em94rD890a
        GP+bdzFyckgImEh0/bnL3sXIxSEksJRR4uyz++wQCRmJk9MaWCFsYYk/17rYIIpeM0qc2fEV
        rEhYIFDi3oxbYEUiArESXSv+gxUxC3QzShxtuM8I0XGMWWLGrj2MIFVsAoYSXW9BRnFy8ArY
        SezasxwsziKgIvFl1VRmEFtUIEair3EFC0SNoMTJmU/AbE4BW4nV/S/AtjELmEnM2/yQGcKW
        l9j+dg6ULS5x68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn
        525iBEbYtmM/N+9gvLQx+BCjAAejEg+vA8PPGCHWxLLiytxDjBIczEoivGUXfsQI8aYkVlal
        FuXHF5XmpBYfYjQFem4is5Rocj4w+vNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqem
        FqQWwfQxcXBKNTBa/5J9aL0zXsvyrd5Fxx/pVZ5lG7a5cbV/0Xtfvy5M1/PgKyexXg/OvNwf
        m4R+nLY/K/xx0t0Opd55aSFxE8XWh3YLrQg/9WbJ77udP002njn2fwP32YmmopfMm1fNnMt9
        8/e0NI3eZadXOfzPnhXRr7YwxTUqtsmvz6Vox8aZ/ekVvzJ1rvxQYinOSDTUYi4qTgQAPvwm
        QMYCAAA=
X-CMS-MailID: 20190607135507eucas1p10c7c2b0f09f3d716867e898645986072
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2019-06-07 15:40, Hans Verkuil wrote:
> On 6/7/19 2:47 PM, Hans Verkuil wrote:
>> On 6/7/19 2:23 PM, Hans Verkuil wrote:
>>> On 6/7/19 2:14 PM, Marek Szyprowski wrote:
>>>> On 2019-06-07 14:01, Hans Verkuil wrote:
>>>>> On 6/7/19 1:16 PM, Laurent Pinchart wrote:
>>>>>> Thank you for the patch.
>>>>>>
>>>>>> On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
>>>>>>> The __prepare_userptr() function made the incorrect assumption that if the
>>>>>>> same user pointer was used as the last one for which memory was acquired, then
>>>>>>> there was no need to re-acquire the memory. This assumption was never properly
>>>>>>> tested, and after doing that it became clear that this was in fact wrong.
>>>>>> Could you explain in the commit message why the assumption is not
>>>>>> correct ?
>>>>> You can free the memory, then allocate it again and you can get the same pointer,
>>>>> even though it is not necessarily using the same physical pages for the memory
>>>>> that the kernel is still using for it.
>>>>>
>>>>> Worse, you can free the memory, then allocate only half the memory you need and
>>>>> get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
>>>>> the original mapping still remains), but this can corrupt userspace memory
>>>>> causing the application to crash. It's not quite clear to me how the memory can
>>>>> get corrupted. I don't know enough of those low-level mm internals to understand
>>>>> the sequence of events.
>>>>>
>>>>> I have test code for v4l2-compliance available if someone wants to test this.
>>>> I'm interested, I would really like to know what happens in the mm
>>>> subsystem in such case.
>>> Here it is:
>>>
>>> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>>> index be606e48..9abf41da 100644
>>> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>>> @@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
>>>   	return 0;
>>>   }
>>>
>>> -static int captureBufs(struct node *node, const cv4l_queue &q,
>>> +static int captureBufs(struct node *node, cv4l_queue &q,
>>>   		const cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
>>>   		unsigned &capture_count)
>>>   {
>>> @@ -962,6 +962,21 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
>>>   				buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
>>>   				buf.s_request_fd(buf_req_fds[req_idx]);
>>>   			}
>>> +			if (v4l_type_is_capture(buf.g_type()) && q.g_memory() == V4L2_MEMORY_USERPTR) {
>>> +				printf("\nidx: %d", buf.g_index());
>>> +				for (unsigned p = 0; p < q.g_num_planes(); p++) {
>>> +					printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
>>> +					fflush(stdout);
>>> +					free(buf.g_userptr(p));
>>> +					void *m = calloc(1, q.g_length(p)/2);
>>> +
>>> +					fail_on_test(m == NULL);
>>> +					q.s_userptr(buf.g_index(), p, m);
>>> +					printf("new buf[%d]: %p", p, m);
>>> +					buf.s_userptr(m, p);
>>> +				}
>>> +				printf("\n");
>>> +			}
>>>   			fail_on_test(buf.qbuf(node, q));
>>>   			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
>>>   			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
>>>
>>>
>>>
>>> Load the vivid driver and just run 'v4l2-compliance -s10' and you'll see:
>>>
>>> ...
>>> Streaming ioctls:
>>>          test read/write: OK
>>>          test blocking wait: OK
>>>          test MMAP (no poll): OK
>>>          test MMAP (select): OK
>>>          test MMAP (epoll): OK
>>>          Video Capture: Frame #000
>>> idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
>>>          Video Capture: Frame #001
>>> idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
>>>          Video Capture: Frame #002
>>> idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
>>> Aborted
>> To clarify: two full size buffers are allocated and queued (that happens in setupUserPtr()),
>> then streaming starts and captureBufs is called which basically just calls dqbuf
>> and qbuf.
>>
>> Tomasz pointed out that all the pointers in this log are actually different. That's
>> correct, but here is a log where the old and new buf ptr are the same:
>>
>> Streaming ioctls:
>>          test read/write: OK
>>          test blocking wait: OK
>>          test MMAP (no poll): OK
>>          test MMAP (select): OK
>>          test MMAP (epoll): OK
>>          Video Capture: Frame #000
>> idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e010
>>          Video Capture: Frame #001
>> idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15010
>>          Video Capture: Frame #002
>> idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e010
>>          Video Capture: Frame #003
>> idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
>> Aborted
>>
>> It's weird that the first log fails that way: if the pointers are different,
>> then vb2 will call get_userptr and it should discover that the buffer isn't
>> large enough, causing qbuf to fail. That doesn't seem to happen.
> I think that the reason for this corruption is that the memory pool used
> by glibc is now large enough for vb2 to think it can map the full length
> of the user pointer into memory, even though only the first half is actually
> from the buffer that's allocated. When you capture a frame you just overwrite
> a random part of the application's memory pool, causing this invalid pointer.
>
> But that's a matter of garbage in, garbage out. So that's not the issue here.
>
> The real question is what happens when you free the old buffer, allocate a
> new buffer, end up with the same userptr, but it's using one or more different
> pages for its memory compared to the mapping that the kernel uses.
>
> I managed to reproduce this with v4l2-ctl:
>
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 28b2b3b9..8f2ed9b5 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -1422,6 +1422,24 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
>   		 * has the size that fits the old resolution and might not
>   		 * fit to the new one.
>   		 */
> +		if (q.g_memory() == V4L2_MEMORY_USERPTR) {
> +			printf("\nidx: %d", buf.g_index());
> +			for (unsigned p = 0; p < q.g_num_planes(); p++) {
> +				unsigned *pb = (unsigned *)buf.g_userptr(p);
> +				printf(" old buf[%d]: %p first pixel: 0x%x", p, buf.g_userptr(p), *pb);
> +				fflush(stdout);
> +				free(buf.g_userptr(p));
> +				void *m = calloc(1, q.g_length(p));
> +
> +				if (m == NULL)
> +					return QUEUE_ERROR;
> +				q.s_userptr(buf.g_index(), p, m);
> +				if (m == buf.g_userptr(p))
> +					printf(" identical new buf");
> +				buf.s_userptr(m, p);
> +			}
> +			printf("\n");
> +		}
>   		if (fd.qbuf(buf) && errno != EINVAL) {
>   			fprintf(stderr, "%s: qbuf error\n", __func__);
>   			return QUEUE_ERROR;
>
>
> Load vivid, setup a pure white test pattern:
>
> v4l2-ctl -c test_pattern=6
>
> Now run v4l2-ctl --stream-user and you'll see:
>
> idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x80ea80ea identical new buf
> <
> idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x80ea80ea identical new buf
> <
> idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x80ea80ea identical new buf
> <
> idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x80ea80ea identical new buf
> <
> idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x0 identical new buf
> <
> idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x0 identical new buf
> < 5.00 fps
>
> idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x0 identical new buf
> <
> idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x0 identical new buf
>
> The first four dequeued buffers are filled with data, after that the
> returned buffer is empty because vivid is actually writing to different
> memory pages.
>
> With this patch the first pixel is always non-zero.

Good catch. The question is weather we treat that as undefined behavior 
and keep the optimization for 'good applications' or assume that every 
broken userspace code has to be properly handled. The good thing is that 
there is still imho no security issue. The physical pages gathered by 
vb2 in worst case belongs to noone else (vb2 is their last user, they 
are not yet returned to free pages pool).

> I wonder if it isn't possible to just check the physical address of
> the received user pointer with the physical address of the previous
> user pointer. Or something like that. I'll dig around a bit more.

Such check won't be so simple. Pages contiguous in the virtual memory 
won't map to pages contiguous in the physical memory, so you would need 
to check every single memory page. Make no sense. It is better to 
reacquire buffer on every queue operation. This indeed show how broken 
the USERPTR related part of v4l2 API is.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

