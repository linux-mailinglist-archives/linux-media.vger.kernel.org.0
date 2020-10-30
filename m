Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616122A0942
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 16:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgJ3PJL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 11:09:11 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:46933 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726785AbgJ3PJK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 11:09:10 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YW1YkpKAhWvjMYW1ckHxWj; Fri, 30 Oct 2020 16:09:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604070548; bh=p/He+fz0zQLb8/9KCljEG98pEvD5jnUi/OkVZ8SfxDo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=v031qkcc3Gewu84bfGaSqCKYiXjTDI3z6hJE+ML02pAqTb3cn/sRGUcqz18n3sLAS
         vMN3u/IRMSWvZUyrnCSZ1v4VgtF4aW5kox+4EVJD2GqZQFJ2/+cwlL460YzSRtI/we
         XPCT6nSlqD94Lpb66WLx1j9H/LEdVr4MYPImz5QQa2wVsh6gzrLX1rAvVZ9yRAJaLZ
         B4iGYz1JoyNbtLpeCGNDtpGZkpYW11ErdiNwXzPiAG+qQWpQLld1utf4SQ5Be6HQGQ
         /WVGeGHS8ejt6ORZdHEEwqpF7RZC/75zqLqFSGEdYGrb+8gO0s08G/h1kLUnqjto7M
         MJiZM9GQJv8Nw==
Subject: Re: [PATCH] media: v4l2-mem2mem: always call poll_wait() on queues
To:     Alexandre Courbot <gnurou@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201022122421.133976-1-gnurou@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c6454292-935b-f14a-e743-838ccabc6590@xs4all.nl>
Date:   Fri, 30 Oct 2020 16:09:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022122421.133976-1-gnurou@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGFsfFaY0/0VfEBGvVNLj2ISLjx4frqhe7qquKzPhoieP0/FeCKNKGs6qt+DwFmmE5n5aqk2cBqsaf+kr2MC/i/6ukEM+YNS48k+ZedX2qhp+fmtS4ZK
 Twbl+znnBFFjSq0uuYwNMqL8XLfgoPYYFS/5LALw94Rg0bU+DAu18uMopshGvvwAz5pzrZl7ffRXTKPSHH6+8lKB62/sdoPSIuwj+6RcZ2+JxDNRrhieXA4y
 +4h2qHFpZJnG1l1cheGvm7RXucd3vLOigYQ3eDr59aGnOZlU4x2N1JPtpI675ZOQvwYJDBz7hBvRTFWSAWHTag==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/10/2020 14:24, Alexandre Courbot wrote:
> do_poll()/do_select() seem to set the _qproc member of poll_table to
> NULL the first time they are called on a given table, making subsequent
> calls of poll_wait() on that table no-ops. This is a problem for mem2mem
> which calls poll_wait() on the V4L2 queues' waitqueues only when a
> queue-related event is requested, which may not necessarily be the case
> during the first poll.
> 
> For instance, a stateful decoder is typically only interested in
> EPOLLPRI events when it starts, and will switch to listening to both
> EPOLLPRI and EPOLLIN after receiving the initial resolution change event
> and configuring the CAPTURE queue. However by the time that switch
> happens and v4l2_m2m_poll_for_data() is called for the first time,
> poll_wait() has become a no-op and the V4L2 queues waitqueues thus
> cannot be registered.
> 
> Fix this by moving the registration to v4l2_m2m_poll() and do it whether
> or not one of the queue-related events are requested.

This looks good, but would it be possible to add a test for this to
v4l2-compliance? (Look for POLL_MODE_EPOLL in v4l2-test-buffers.cpp)

If I understand this right, calling EPOLL_CTL_ADD for EPOLLPRI, then
calling EPOLL_CTL_ADD for EPOLLIN/OUT would trigger this? Or does there
have to be an epoll_wait call in between?

Another reason for adding this test is that I wonder if regular capture
or output V4L2 devices don't have the same issue.

It's a very subtle bug and so adding a test for this to v4l2-compliance
would be very useful.

Regards,

	Hans

> 
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> ---
> I seem to be hitting all the polling corner cases recently! ^_^; This
> time I was wondering why epoll_wait() never returned after I received
> the first resolution change event from the vicodec stateful decoder.
> This is why - please take a look!
> 
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index b221b4e438a1..65476ef2879f 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -887,9 +887,6 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
>  	src_q = v4l2_m2m_get_src_vq(m2m_ctx);
>  	dst_q = v4l2_m2m_get_dst_vq(m2m_ctx);
>  
> -	poll_wait(file, &src_q->done_wq, wait);
> -	poll_wait(file, &dst_q->done_wq, wait);
> -
>  	/*
>  	 * There has to be at least one buffer queued on each queued_list, which
>  	 * means either in driver already or waiting for driver to claim it
> @@ -922,9 +919,14 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  		       struct poll_table_struct *wait)
>  {
>  	struct video_device *vfd = video_devdata(file);
> +	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(m2m_ctx);
> +	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(m2m_ctx);
>  	__poll_t req_events = poll_requested_events(wait);
>  	__poll_t rc = 0;
>  
> +	poll_wait(file, &src_q->done_wq, wait);
> +	poll_wait(file, &dst_q->done_wq, wait);
> +
>  	if (req_events & (EPOLLOUT | EPOLLWRNORM | EPOLLIN | EPOLLRDNORM))
>  		rc = v4l2_m2m_poll_for_data(file, m2m_ctx, wait);
>  
> 

