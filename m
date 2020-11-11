Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148202AF132
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 13:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgKKMrx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 07:47:53 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45183 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726207AbgKKMrx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 07:47:53 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cpWykn8MgRiwVcpX6kaLlF; Wed, 11 Nov 2020 13:47:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605098870; bh=764s9qizFJslTNse1o+RIcZfci3G2jnzqqGavb8U8fU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UcTDTQC9KinU1GIue9igoUmlL7rTofJMNgbu9pP0jUvpUhloyNCp9bQ48kCstGiDr
         1T5YvA8tx5l5BwZMZBddmqfXvMUHNDCJ0ca6y/mqjnlC2jcfhxUL277+sTNUGjI96q
         /MCyvlX4CSKBkrvCTjfLqwtOV/lb+5sCniFbKPFDoqV3j8jA1M6Oeiq8j9MLsptQ9L
         wyBTALqyRV66Z9QsYKEqlgGhkMkC2/NpWKE/yJ2lOlbjhk7baxJP1DR+GN4hyGD7vn
         qgP0G7xBDM5eblas7l6Z5JNWpaePF7GCDHgrP+cUQklr1LmXNrMLk9KgdffN1YSD+3
         SfVQ1bMMqpc3A==
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
 <695e6163-7bdc-d120-cd02-0cff6efb53ef@xs4all.nl>
 <CAAVeFuL9PDgirADEVXUNbNKY4YVw9uFpjbr5Zmt_Vb-3K4-2Yg@mail.gmail.com>
 <92db8b0e-c348-70ef-a607-eb5c42f86fac@xs4all.nl>
 <CAAVeFuJ_rSN=JBi-2L2-v7eVonarGRzL5agTL-UW_WOD91D_tw@mail.gmail.com>
 <CAAVeFu+ASgmkWhddJrhkrsoYbW1u1uCjckU44GTDxoKykc9aVQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <817895e0-6207-9fbb-5581-0bf784c63915@xs4all.nl>
Date:   Wed, 11 Nov 2020 13:47:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAVeFu+ASgmkWhddJrhkrsoYbW1u1uCjckU44GTDxoKykc9aVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHnp4hHBd9MTp8LNzGjgTCMUOOl35R6VtC4U+s6qbwRKa7BfYvBFoum4DXwDQNSP25wQxA6lbzd/JXJT9uWMKi7TK1RGTPBCST2Eq8Q9mJBOrYhhEprT
 aoiKij7QKULw6Cy08moFtWPuKYpb8RAeOn/LHAIIlSc4vhzsfQLAeiBISqU4gvaqOiTmhv8CUKaM7FKQ6ij+Jlq7IOmwQdgpXa6BA6b4j/JvvVJPZ/BiRTXA
 50Fw7LVgMlgW1bnej0LP5xVKVlIflIPgs1KFfbnplEbpC/4AipQaIiMqjd05F2oHZNyw96a+sY0UiNPeQfCZ8A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/11/2020 13:41, Alexandre Courbot wrote:
> On Thu, Nov 5, 2020 at 11:05 PM Alexandre Courbot <gnurou@gmail.com> wrote:
>>
>> On Thu, Nov 5, 2020 at 10:12 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>
>>> On 05/11/2020 13:52, Alexandre Courbot wrote:
>>>> On Thu, Nov 5, 2020 at 9:36 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>>
>>>>> On 05/11/2020 13:21, Alexandre Courbot wrote:
>>>>>> On Tue, Nov 3, 2020 at 6:48 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>>>>
>>>>>>> On 03/11/2020 09:51, Alexandre Courbot wrote:
>>>>>>>> Hi Hans,
>>>>>>>>
>>>>>>>> On Sat, Oct 31, 2020 at 12:09 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>>>>>>
>>>>>>>>> On 22/10/2020 14:24, Alexandre Courbot wrote:
>>>>>>>>>> do_poll()/do_select() seem to set the _qproc member of poll_table to
>>>>>>>>>> NULL the first time they are called on a given table, making subsequent
>>>>>>>>>> calls of poll_wait() on that table no-ops. This is a problem for mem2mem
>>>>>>>>>> which calls poll_wait() on the V4L2 queues' waitqueues only when a
>>>>>>>>>> queue-related event is requested, which may not necessarily be the case
>>>>>>>>>> during the first poll.
>>>>>>>>>>
>>>>>>>>>> For instance, a stateful decoder is typically only interested in
>>>>>>>>>> EPOLLPRI events when it starts, and will switch to listening to both
>>>>>>>>>> EPOLLPRI and EPOLLIN after receiving the initial resolution change event
>>>>>>>>>> and configuring the CAPTURE queue. However by the time that switch
>>>>>>>>>> happens and v4l2_m2m_poll_for_data() is called for the first time,
>>>>>>>>>> poll_wait() has become a no-op and the V4L2 queues waitqueues thus
>>>>>>>>>> cannot be registered.
>>>>>>>>>>
>>>>>>>>>> Fix this by moving the registration to v4l2_m2m_poll() and do it whether
>>>>>>>>>> or not one of the queue-related events are requested.
>>>>>>>>>
>>>>>>>>> This looks good, but would it be possible to add a test for this to
>>>>>>>>> v4l2-compliance? (Look for POLL_MODE_EPOLL in v4l2-test-buffers.cpp)
>>>>>>>>>
>>>>>>>>> If I understand this right, calling EPOLL_CTL_ADD for EPOLLPRI, then
>>>>>>>>> calling EPOLL_CTL_ADD for EPOLLIN/OUT would trigger this? Or does there
>>>>>>>>> have to be an epoll_wait call in between?
>>>>>>>>
>>>>>>>> Even without an epoll_wait() in between the behavior is visible.
>>>>>>>> v4l2_m2m_poll() will be called once during the initial EPOLL_CTL_ADD
>>>>>>>> and this will trigger the bug.
>>>>>>>>
>>>>>>>>> Another reason for adding this test is that I wonder if regular capture
>>>>>>>>> or output V4L2 devices don't have the same issue.
>>>>>>>>>
>>>>>>>>> It's a very subtle bug and so adding a test for this to v4l2-compliance
>>>>>>>>> would be very useful.
>>>>>>>>
>>>>>>>> I fully agree, this is very counter-intuitive since what basically
>>>>>>>> happens is that the kernel's poll_wait() function becomes a no-op
>>>>>>>> after the poll() hook of a driver is called for the first time. There
>>>>>>>> is no way one can expect this behavior just from browsing the code so
>>>>>>>> this is likely to affect other drivers.
>>>>>>>>
>>>>>>>> As for the test itself, we can easily reproduce the conditions for
>>>>>>>> failure in v4l2-test-buffers.cpp's captureBufs() function, but doing
>>>>>>>> so will make the streaming tests fail without being specific about the
>>>>>>>> cause. Or maybe we should add another pollmode to specifically test
>>>>>>>> epoll in this setup? Can I get your thoughts?
>>>>>>>
>>>>>>> No, just keep it as part of the poll test. Just add comments at the place
>>>>>>> where it fails describing this error.
>>>>>>>
>>>>>>> After all, it *is* a poll() bug, so it is only fair that it is tested as
>>>>>>> part of the epoll test.
>>>>>>>
>>>>>>> Can you call EPOLL_CTL_ADD with ev.events set to 0? And then call it again
>>>>>>> with the actual value that you need? If that triggers this issue as well,
>>>>>>> then that is a nice test (but perhaps EPOLL_CTL_ADD won't call poll() if
>>>>>>> ev.events is 0, but perhaps EPOLLERR would work instead of 0).
>>>>>>
>>>>>> Yup, actually the following is enough to make v4l2-compliance -s fail
>>>>>> with vicodec:
>>>>>
>>>>> Does it also fail with vivid? I am curious to know whether this issue is
>>>>> m2m specific or a more general problem.
>>>>
>>>> It does fail actually! And that made me notice that vb2_poll() uses
>>>> the same pattern as v4l2_m2m_poll() (probably because the latter is
>>>> inspired by the former?) and needs to be fixed similarly. I will send
>>>> another patch to fix vb2_poll() as well, thanks for pointing it out!
>>>
>>> I was afraid of that.
>>>
>>> Testing epoll for control events would be interesting as well. The
>>> vivid radio device is an example of a device that has controls, but
>>> does not do streaming (so is not using vb2).
>>>
>>> But from what I can see v4l2_ctrl_poll() does the right thing, so this
>>> should be fine.
>>
>> Indeed, it unconditionally calls poll_wait() with all the wait queues
>> that may wake us up (that is, only one), so there is no problem there.
> 
> Sorry, I noticed that this patch was marked with "Changes Requested"
> in patchwork, but isn't it valid as-is? We need a similar change to
> VB2, but that should go as a separate patch IMHO. I'm fine with doing
> both in one go if you prefer that though.
> 

In at least one reply you mentioned that you wanted to add a comment (reply
from 23 Oct). That's why I changed it to 'Changes Requested'.

Also, I prefer to fix both m2m and vb2 at the same time (separate patches,
but part of the same patch series). And together with a separate patch improving
v4l2-compliance.

Regards,

	Hans
