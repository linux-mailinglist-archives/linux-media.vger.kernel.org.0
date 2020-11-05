Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF532A7EC1
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730681AbgKEMgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:36:52 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54561 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728371AbgKEMgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 07:36:41 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aeVGkCvLkNanzaeVJkoKjC; Thu, 05 Nov 2020 13:36:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604579798; bh=P4E26n1MJrzrkJ2BRBbM1Fj1NgVEkyFGFQpgoUFh2PY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ksi+PJfIxpSrYn9zCen1lqmNWkv8DlLrX3mYLqZST07O5M9uAzClmVwIJy30YVSXu
         mgOzjIiKDTXPvYIgsn+BHmqeBz61BTgyI/v35swQasMeoRSM1U+WUn13DECpiifmR8
         LekXUM8t5LCoyGsT37zbvefPY44GfSsXU/D9+2vTbeKqEFrrLmOhGSzaUJ2PxC/ots
         5bO5bLTeAyIygt/7X583A4DJjuz+RvDOntIgOAPh2IcHv4kLI+oOMdirPHCaFti0al
         Rp/cIocanYEYKqU/2klYJnBe0IOoueicOuvNI7GKd0+zD6fNcS6FXh9BZLq4b9F5Yl
         fPifmIcgadedQ==
Subject: Re: [PATCH] media: v4l2-mem2mem: always call poll_wait() on queues
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201022122421.133976-1-gnurou@gmail.com>
 <c6454292-935b-f14a-e743-838ccabc6590@xs4all.nl>
 <CAAVeFuKCEQYBs84ssCvwAkGUxGikeDFc+XNX2LzkENGc5B1n8g@mail.gmail.com>
 <db7a95b0-3d63-ed38-fb8a-62f32c83c13e@xs4all.nl>
 <CAAVeFuL8TaArTd_fOLSSE-854n9vwpob5LxdqgHNa-bTTn5Gxg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <695e6163-7bdc-d120-cd02-0cff6efb53ef@xs4all.nl>
Date:   Thu, 5 Nov 2020 13:36:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAVeFuL8TaArTd_fOLSSE-854n9vwpob5LxdqgHNa-bTTn5Gxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNcGXtHXNq/iZVASkE2z7dcJw88GClwRw+cZbTPA4ITww+IQdKxsGgvXk8ePFP7pec4E/8WllbIPQX1uK1maKD+m7vwT0n6BCsJ+zbw8s++7XpLWQeDb
 YsUj2cnVy53NCPa+7J2JzXC6ODpeiCCh0J1qWe/ACGeLV3+f/EmEEV3P+em09NHQlKtq7OFVIJjaUrvEzSpFoY92/WT0u5nv5RD2lGyxP0gKaSaOBJ5vZpxJ
 2KdEDee+Xyavl3VcWmJVOsHc6V5/LhkOaCshheV/hlhE8hdYvZ0ZNSX/uvUG3gMkgyGZg4tD16LM9zDhmrdI7A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/11/2020 13:21, Alexandre Courbot wrote:
> On Tue, Nov 3, 2020 at 6:48 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 03/11/2020 09:51, Alexandre Courbot wrote:
>>> Hi Hans,
>>>
>>> On Sat, Oct 31, 2020 at 12:09 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>
>>>> On 22/10/2020 14:24, Alexandre Courbot wrote:
>>>>> do_poll()/do_select() seem to set the _qproc member of poll_table to
>>>>> NULL the first time they are called on a given table, making subsequent
>>>>> calls of poll_wait() on that table no-ops. This is a problem for mem2mem
>>>>> which calls poll_wait() on the V4L2 queues' waitqueues only when a
>>>>> queue-related event is requested, which may not necessarily be the case
>>>>> during the first poll.
>>>>>
>>>>> For instance, a stateful decoder is typically only interested in
>>>>> EPOLLPRI events when it starts, and will switch to listening to both
>>>>> EPOLLPRI and EPOLLIN after receiving the initial resolution change event
>>>>> and configuring the CAPTURE queue. However by the time that switch
>>>>> happens and v4l2_m2m_poll_for_data() is called for the first time,
>>>>> poll_wait() has become a no-op and the V4L2 queues waitqueues thus
>>>>> cannot be registered.
>>>>>
>>>>> Fix this by moving the registration to v4l2_m2m_poll() and do it whether
>>>>> or not one of the queue-related events are requested.
>>>>
>>>> This looks good, but would it be possible to add a test for this to
>>>> v4l2-compliance? (Look for POLL_MODE_EPOLL in v4l2-test-buffers.cpp)
>>>>
>>>> If I understand this right, calling EPOLL_CTL_ADD for EPOLLPRI, then
>>>> calling EPOLL_CTL_ADD for EPOLLIN/OUT would trigger this? Or does there
>>>> have to be an epoll_wait call in between?
>>>
>>> Even without an epoll_wait() in between the behavior is visible.
>>> v4l2_m2m_poll() will be called once during the initial EPOLL_CTL_ADD
>>> and this will trigger the bug.
>>>
>>>> Another reason for adding this test is that I wonder if regular capture
>>>> or output V4L2 devices don't have the same issue.
>>>>
>>>> It's a very subtle bug and so adding a test for this to v4l2-compliance
>>>> would be very useful.
>>>
>>> I fully agree, this is very counter-intuitive since what basically
>>> happens is that the kernel's poll_wait() function becomes a no-op
>>> after the poll() hook of a driver is called for the first time. There
>>> is no way one can expect this behavior just from browsing the code so
>>> this is likely to affect other drivers.
>>>
>>> As for the test itself, we can easily reproduce the conditions for
>>> failure in v4l2-test-buffers.cpp's captureBufs() function, but doing
>>> so will make the streaming tests fail without being specific about the
>>> cause. Or maybe we should add another pollmode to specifically test
>>> epoll in this setup? Can I get your thoughts?
>>
>> No, just keep it as part of the poll test. Just add comments at the place
>> where it fails describing this error.
>>
>> After all, it *is* a poll() bug, so it is only fair that it is tested as
>> part of the epoll test.
>>
>> Can you call EPOLL_CTL_ADD with ev.events set to 0? And then call it again
>> with the actual value that you need? If that triggers this issue as well,
>> then that is a nice test (but perhaps EPOLL_CTL_ADD won't call poll() if
>> ev.events is 0, but perhaps EPOLLERR would work instead of 0).
> 
> Yup, actually the following is enough to make v4l2-compliance -s fail
> with vicodec:

Does it also fail with vivid? I am curious to know whether this issue is
m2m specific or a more general problem.

Regards,

	Hans

> 
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index 8000db23..b63326cd 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -903,6 +903,10 @@ static int captureBufs(struct node *node, struct
> node *node_m2m_cap, const cv4l_
>                 epollfd = epoll_create1(0);
> 
>                 fail_on_test(epollfd < 0);
> +
> +               ev.events = 0;
> +               fail_on_test(epoll_ctl(epollfd, EPOLL_CTL_ADD,
> node->g_fd(), &ev));
> +
>                 if (node->is_m2m)
>                         ev.events = EPOLLIN | EPOLLOUT | EPOLLPRI;
>                 else if (v4l_type_is_output(q.g_type()))
> @@ -910,7 +914,7 @@ static int captureBufs(struct node *node, struct
> node *node_m2m_cap, const cv4l_
>                 else
>                         ev.events = EPOLLIN;
>                 ev.data.fd = node->g_fd();
> -               fail_on_test(epoll_ctl(epollfd, EPOLL_CTL_ADD,
> node->g_fd(), &ev));
> +               fail_on_test(epoll_ctl(epollfd, EPOLL_CTL_MOD,
> node->g_fd(), &ev));
>         }
> 
>         if (pollmode)
> 
>>
>> The epoll_wait() will fail when this issue hits, so that's a good place
>> to add comments explaining this problem.
>>
>> There is one other place where this needs to be tested: testEvents() in
>> v4l2-test-controls.cpp: currently this only tests select(), but there
>> should be a second epoll test here as well that just tests EPOLLPRI.
>>
>> This would catch drivers that do not stream (i.e. no EPOLLIN/OUT) but
>> that do have controls (so support EPOLLPRI).
> 
> I'll take a look there as well, and think about a proper comment
> before sending a patch towards you.
> 
> Cheers,
> Alex.
> 

