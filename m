Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06ACE2A409D
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 10:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgKCJss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 04:48:48 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:49187 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725993AbgKCJss (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 04:48:48 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZsvikFKxMlQTrZsvlk8Hcb; Tue, 03 Nov 2020 10:48:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604396925; bh=m5zheIhxPXns1WIoGNZIgm+PH68FiSLiEKXHFwjbo/I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FqPu4d2Z8lGRFbU+zeG0RZkgXU1cYHatGZ34h5kqYwWSr4aAlnzXqvH0mSZ2a3rkz
         v7CHpWzAL2RmaOF6qMzELGprWs30r5DpT5lAmgjE6zQapP6KxGOnqseyhNjAAlRg9v
         7srOrYJazC6lh4xrZsKGYAr7qYYh3X5oodyO7q2GblacfY7V5Oy/kc7w31XgJKlWIs
         fxI4sr0vpUYA76r42xDVYa2NseJjRXpIZzCA7h8uCjl7yVubcHlaFOoNQiEhSwDjn7
         ZavsJcyNGPgu7a0WoRT1ZH5iCMZU1tpXV8cyeN7U9/8/8ClMKkA9SeZ5ruytyGqF99
         llO54eu+LXo8g==
Subject: Re: [PATCH] media: v4l2-mem2mem: always call poll_wait() on queues
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201022122421.133976-1-gnurou@gmail.com>
 <c6454292-935b-f14a-e743-838ccabc6590@xs4all.nl>
 <CAAVeFuKCEQYBs84ssCvwAkGUxGikeDFc+XNX2LzkENGc5B1n8g@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <db7a95b0-3d63-ed38-fb8a-62f32c83c13e@xs4all.nl>
Date:   Tue, 3 Nov 2020 10:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAVeFuKCEQYBs84ssCvwAkGUxGikeDFc+XNX2LzkENGc5B1n8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPqZj+ael7pfSmNdIhgP5x+s+4HOyaomw+vZj1Jtd7md1lFlTgVJgKZhsd9vqfhtzUAaweyWZw5L259THNCfduqvP9zfOA3+BUjS9lH6VB/Z54hMWGjp
 3qIt89niSDi0aqixB9dIyANZKffgiHW8lahsBmUly9o+XL8o/sX/pzwke/WkioAfCVNe5hK9T/HdfeW6WDLZnXOyPCJC5irWcvqrSum+/iOH3R7e1erBt+eN
 Qda8rVqjSglCyUQPFD7Gvh6IVVfeZ0XIyiPmyNnUhaEywzI18UYfd1caT+WEJLE8ae9/y9PpynD2VYOrlPeJUA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/11/2020 09:51, Alexandre Courbot wrote:
> Hi Hans,
> 
> On Sat, Oct 31, 2020 at 12:09 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 22/10/2020 14:24, Alexandre Courbot wrote:
>>> do_poll()/do_select() seem to set the _qproc member of poll_table to
>>> NULL the first time they are called on a given table, making subsequent
>>> calls of poll_wait() on that table no-ops. This is a problem for mem2mem
>>> which calls poll_wait() on the V4L2 queues' waitqueues only when a
>>> queue-related event is requested, which may not necessarily be the case
>>> during the first poll.
>>>
>>> For instance, a stateful decoder is typically only interested in
>>> EPOLLPRI events when it starts, and will switch to listening to both
>>> EPOLLPRI and EPOLLIN after receiving the initial resolution change event
>>> and configuring the CAPTURE queue. However by the time that switch
>>> happens and v4l2_m2m_poll_for_data() is called for the first time,
>>> poll_wait() has become a no-op and the V4L2 queues waitqueues thus
>>> cannot be registered.
>>>
>>> Fix this by moving the registration to v4l2_m2m_poll() and do it whether
>>> or not one of the queue-related events are requested.
>>
>> This looks good, but would it be possible to add a test for this to
>> v4l2-compliance? (Look for POLL_MODE_EPOLL in v4l2-test-buffers.cpp)
>>
>> If I understand this right, calling EPOLL_CTL_ADD for EPOLLPRI, then
>> calling EPOLL_CTL_ADD for EPOLLIN/OUT would trigger this? Or does there
>> have to be an epoll_wait call in between?
> 
> Even without an epoll_wait() in between the behavior is visible.
> v4l2_m2m_poll() will be called once during the initial EPOLL_CTL_ADD
> and this will trigger the bug.
> 
>> Another reason for adding this test is that I wonder if regular capture
>> or output V4L2 devices don't have the same issue.
>>
>> It's a very subtle bug and so adding a test for this to v4l2-compliance
>> would be very useful.
> 
> I fully agree, this is very counter-intuitive since what basically
> happens is that the kernel's poll_wait() function becomes a no-op
> after the poll() hook of a driver is called for the first time. There
> is no way one can expect this behavior just from browsing the code so
> this is likely to affect other drivers.
> 
> As for the test itself, we can easily reproduce the conditions for
> failure in v4l2-test-buffers.cpp's captureBufs() function, but doing
> so will make the streaming tests fail without being specific about the
> cause. Or maybe we should add another pollmode to specifically test
> epoll in this setup? Can I get your thoughts?

No, just keep it as part of the poll test. Just add comments at the place
where it fails describing this error.

After all, it *is* a poll() bug, so it is only fair that it is tested as
part of the epoll test.

Can you call EPOLL_CTL_ADD with ev.events set to 0? And then call it again
with the actual value that you need? If that triggers this issue as well,
then that is a nice test (but perhaps EPOLL_CTL_ADD won't call poll() if
ev.events is 0, but perhaps EPOLLERR would work instead of 0).

The epoll_wait() will fail when this issue hits, so that's a good place
to add comments explaining this problem.

There is one other place where this needs to be tested: testEvents() in
v4l2-test-controls.cpp: currently this only tests select(), but there
should be a second epoll test here as well that just tests EPOLLPRI.

This would catch drivers that do not stream (i.e. no EPOLLIN/OUT) but
that do have controls (so support EPOLLPRI).

Congratulation, you found a really nasty corner case! :-)

Regards,

	Hans
