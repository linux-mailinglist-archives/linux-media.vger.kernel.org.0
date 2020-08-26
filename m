Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417D42533B2
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 17:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgHZPaX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 11:30:23 -0400
Received: from grey-smtp-cloud9.xs4all.net ([194.109.24.44]:56933 "EHLO
        grey-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726874AbgHZPaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 11:30:20 -0400
X-Greylist: delayed 432 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Aug 2020 11:30:18 EDT
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AxGRkkRmJuuXOAxGSkEYdq; Wed, 26 Aug 2020 17:23:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598455385; bh=trldSuk5qoiwVr84MQPYlc7WezHhEKq+3G3EIoKlsW4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mb9DX2PDKBhnc9UkSLHtuSDLcn6+A2IClGrzLNwofSoiBuior11OkCJwhgUhy8D3V
         TT7OgiVV/22wnzYq6Si/64C49NKjlv1dsheT1HVcy9KgotM6sosmAxZOHRgejUUhAa
         TFtfHYSrOG8V19FTIsw0bJ8oomgidsmfhvGsy2+tIhODba/JBE217vmte6FkALn2os
         Rp8HImHWAbs6mutMbsGPMwsQ+P5uR7vTkSpvaL6GxdzNi1S9MBnhZV028O+QadGExo
         jXTB5XfF917dDZgNkQI1vz2LedeLY/z4GAACCrtqEZFIBZo1oFde+luH8v7wYQ4Ig5
         dilPJnUk1n0ig==
Subject: Re: [PATCH 2/2] media: v4l2-mem2mem: simplify poll logic a bit
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Alexandre Courbot <gnurou@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200825145556.637323-1-gnurou@gmail.com>
 <20200825145556.637323-3-gnurou@gmail.com>
 <CAAEAJfD1kUJODa+-STV6Q+=9qWH8v2=KZzAA4ppgfbQxstO+Mg@mail.gmail.com>
 <CAAVeFuJgBqN7KYhNi=mMNxy6wHTZOn5E1=pHP3q=n8X++b5pmg@mail.gmail.com>
 <CAAEAJfCfjzGDOhD2WHYny-wVwL19qc_VA9c3uVNiHxpYdEHsLQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3dd23b1e-debd-bd50-e8a1-25837d2fd01e@xs4all.nl>
Date:   Wed, 26 Aug 2020 17:23:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfCfjzGDOhD2WHYny-wVwL19qc_VA9c3uVNiHxpYdEHsLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJRD2YFZD851Cya/ZVCglVkkKzP9XY+Am1EoxtVTE82JN0l6JGs8Wa9DTygHmsIuI2eMSu2aqeYm9kV1UIY15Pkdw0qtD8uqpLN7RgZcs9uZTwvDZl4k
 LDYKr2QRy2JD1wDFrus+PahAoQ2RfKNl7yk2oktQ/rFkeWqta2jS3gtrergF2RlatO9lKR4dStq+5g0K2eigSIHlx/1J05jIXAYfsDbqrfYzuvfmVyDbV+3W
 ud2gDP2wopXnyCdpAVjRcPEU+vKIUgJAgOjh/FQoJmAJpr8gwJDViMY+k5s5vGqxKc1adetvIFAhGoYJifEviufEQ7nVyN2QQ+5jsgpvm/X4oWF9h/sAqwe3
 2TayL524LPuy07ZoO9izXzhZD6E6sUyRGYy/q/4fKZQbHiBeIOVPOymQP96TkOQ7FvKyLoCSDQPGyKMbyY7cuVLRZRYnA73wTmbxbJuUFX7BihP0WdFtP1bN
 Ea/6E3f1PknqcqCK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/08/2020 16:32, Ezequiel Garcia wrote:
> On Wed, 26 Aug 2020 at 08:19, Alexandre Courbot <gnurou@gmail.com> wrote:
>>
>> Hi Ezequiel, thanks for the review!
>>
>> On Wed, Aug 26, 2020 at 1:15 PM Ezequiel Garcia
>> <ezequiel@vanguardiasur.com.ar> wrote:
>>>
>>> Hi Alexandre,
>>>
>>> On Tue, 25 Aug 2020 at 11:56, Alexandre Courbot <gnurou@gmail.com> wrote:
>>>>
>>>> Factorize redundant checks into a single code block, remove the early
>>>> return, and declare variables in their innermost block. Hopefully this
>>>> makes this code a little bit easier to follow.
>>>>
>>>
>>> This _definitely_ makes the poll handling more readable.
>>>
>>> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>>>
>>> See below a nitpick.
>>>
>>>> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-mem2mem.c | 35 +++++++++++---------------
>>>>  1 file changed, 15 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
>>>> index 0d0192119af20..aeac9707123d0 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
>>>> @@ -841,7 +841,6 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
>>>>                                        struct poll_table_struct *wait)
>>>>  {
>>>>         struct vb2_queue *src_q, *dst_q;
>>>> -       struct vb2_buffer *src_vb = NULL, *dst_vb = NULL;
>>>>         __poll_t rc = 0;
>>>>         unsigned long flags;
>>>>
>>>> @@ -863,33 +862,29 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
>>>>                 return EPOLLERR;
>>>>
>>>>         spin_lock_irqsave(&src_q->done_lock, flags);
>>>> -       if (!list_empty(&src_q->done_list))
>>>> -               src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
>>>> -                                               done_entry);
>>>> -       if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE
>>>> -                       || src_vb->state == VB2_BUF_STATE_ERROR))
>>>> -               rc |= EPOLLOUT | EPOLLWRNORM;
>>>> +       if (!list_empty(&src_q->done_list)) {
>>>> +               struct vb2_buffer *src_vb = list_first_entry(
>>>> +                       &src_q->done_list, struct vb2_buffer, done_entry);
>>>> +               if (src_vb->state == VB2_BUF_STATE_DONE ||
>>>> +                   src_vb->state == VB2_BUF_STATE_ERROR)
>>>> +                       rc |= EPOLLOUT | EPOLLWRNORM;
>>>> +       }
>>>>         spin_unlock_irqrestore(&src_q->done_lock, flags);
>>>>
>>>>         spin_lock_irqsave(&dst_q->done_lock, flags);
>>>> -       if (list_empty(&dst_q->done_list)) {
>>>> +       if (!list_empty(&dst_q->done_list)) {
>>>> +               struct vb2_buffer *dst_vb = list_first_entry(
>>>> +                       &dst_q->done_list, struct vb2_buffer, done_entry);
>>>> +               if (dst_vb->state == VB2_BUF_STATE_DONE ||
>>>> +                   dst_vb->state == VB2_BUF_STATE_ERROR)
>>>> +                       rc |= EPOLLIN | EPOLLRDNORM;
>>>> +       } else if (dst_q->last_buffer_dequeued) {
>>>>                 /*
>>>>                  * If the last buffer was dequeued from the capture queue,
>>>>                  * return immediately. DQBUF will return -EPIPE.
>>>>                  */
>>>
>>> The part about "returning immediately" doesn't make
>>> much sense now. Could we rephrase this, keeping the -EPIPE
>>> comment?
>>
>> I understood this sentence as referring to the system call and not
>> just this function, but maybe we can rephrase this as "... make
>> user-space wake up immediately"?
>>
> 
> But is this really about user-space wakeup? I am under the impression
> that past poll_wait on both queues, we are already about to return
> (and wakeup).
> 
> The way I see it, the original commit intention was to skip any
> done_list handling, returning immediately on the last buffer condition.
> 
> How about just
> 
> """
> If the last buffer was dequeued from the capture queue,
> signal userspace. DQBUF will return -EPIPE.

I'd write 'DQBUF(CAPTURE)' here to emphasize that only the capture
queue will return -EPIPE when you try to dequeue from it.

Also note that the original text was a copy-and-paste from vb2_core_poll().
The phrase 'return immediately' makes sense in that context since that
poll code deals with a single queue. In this case you have two queues,
and 'return immediately' no longer applies (in fact, that effectively is
the bug that being fixed here!).

Regards,

	Hans

> """
> 
> ?
> 
>>>
>>> Thanks,
>>> Ezequiel
>>>
>>>> -               if (dst_q->last_buffer_dequeued) {
>>>> -                       spin_unlock_irqrestore(&dst_q->done_lock, flags);
>>>> -                       rc |= EPOLLIN | EPOLLRDNORM;
>>>> -                       return rc;
>>>> -               }
>>>> -       }
>>>> -
>>>> -       if (!list_empty(&dst_q->done_list))
>>>> -               dst_vb = list_first_entry(&dst_q->done_list, struct vb2_buffer,
>>>> -                                               done_entry);
>>>> -       if (dst_vb && (dst_vb->state == VB2_BUF_STATE_DONE
>>>> -                       || dst_vb->state == VB2_BUF_STATE_ERROR))
>>>>                 rc |= EPOLLIN | EPOLLRDNORM;
>>>> +       }
>>>>         spin_unlock_irqrestore(&dst_q->done_lock, flags);
>>>>
>>>>         return rc;
>>>> --
>>>> 2.28.0
>>>>

