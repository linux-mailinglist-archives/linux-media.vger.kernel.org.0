Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE88297141
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 16:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465171AbgJWOXI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 10:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374830AbgJWOXI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 10:23:08 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA67C0613CE;
        Fri, 23 Oct 2020 07:23:06 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id v6so2276318lfa.13;
        Fri, 23 Oct 2020 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o98sUAeRbrb+A+UaiLkMy3FmWgT2O18cCb+RARaOj3E=;
        b=uk0kFLBbLZO4GwgQ14jK2wL+oqKrewXhlwH6K47Z0OaPIIvsL2bUlreldaFF+oHn5A
         1xF7FcCLiurGrzazkcshhKVhPrCv9qeYG/kC1aaAGHXhObNyZDToylrFz6FSW2Z0CoN+
         1ZE51zDezLl+B3LFJBrs7Zb/dxvFw780+ShOXRbvwB3s501TvMBfOzQg0c3ZHIh3bu4w
         rwh/kW5i/jGmiTH7OHt4Ynbq82o6VR6SrrIqCsd+9bhue+1Pl/FAcr0UMz7cZPkeYFli
         jgqkix0JOtjMEBv+ktKK+1EsfuFp7OXBdJglYTR2fj/I2xXbJcD+ZKVRa3S6mxBOHagu
         obxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o98sUAeRbrb+A+UaiLkMy3FmWgT2O18cCb+RARaOj3E=;
        b=ZtERHIjG4uGEuNdQpV9AAsNtxVpt2felKwuFRA8PTd9wLKHkb47Pjxm3XYl4QVK177
         Iu1iLQLTbwk4fITM9SxAZbDze3M9JySrHn7XYj20hZoxjS1UmHqsLWv2x/kun2STeR48
         ejSeojqenVtOJ5e99zODyNIVaR7R+tTrO+DzmnDRQQzLmK+0RVe1uRCocSJf3PCpgTJm
         rFKmEdEhf0/GbVrMU2M0zCMcXkLzOHAbKLtVF/XWZdmevx+21Q43os7jSiILGNjH2WlX
         ZKBrCRUm+HGFnUkOyC1wncaDXcR8GV5h9wY4tA3+EHk/x9J9360+oANfkBDSQOxx4n4y
         T14w==
X-Gm-Message-State: AOAM530Y5NlLGauHPlbOWVqEk2OUbnvq874PelPGLf7NV2pwKeKJ81np
        0jZG7KhKRQJDf/YFvVQ7ZUht8/qR8XBjhGy03T4=
X-Google-Smtp-Source: ABdhPJwgpoExunuD3z+CFCmAmQnUOxHL9KEOxmodPiG+o6BfjQjmAOAw9j4PuUH3O5RHY0D3tPDLOJZ2XzpkVyWqyDI=
X-Received: by 2002:a19:8114:: with SMTP id c20mr774275lfd.77.1603462984856;
 Fri, 23 Oct 2020 07:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201022122421.133976-1-gnurou@gmail.com>
In-Reply-To: <20201022122421.133976-1-gnurou@gmail.com>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Fri, 23 Oct 2020 23:22:52 +0900
Message-ID: <CAAVeFu+P-3pkQGZJgvoX6cRZj8keek70sNy5ZkRozeygiLCwKQ@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-mem2mem: always call poll_wait() on queues
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 22, 2020 at 9:24 PM Alexandre Courbot <gnurou@gmail.com> wrote:
>
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
>         src_q = v4l2_m2m_get_src_vq(m2m_ctx);
>         dst_q = v4l2_m2m_get_dst_vq(m2m_ctx);
>
> -       poll_wait(file, &src_q->done_wq, wait);
> -       poll_wait(file, &dst_q->done_wq, wait);
> -
>         /*
>          * There has to be at least one buffer queued on each queued_list, which
>          * means either in driver already or waiting for driver to claim it
> @@ -922,9 +919,14 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>                        struct poll_table_struct *wait)
>  {
>         struct video_device *vfd = video_devdata(file);
> +       struct vb2_queue *src_q = v4l2_m2m_get_src_vq(m2m_ctx);
> +       struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(m2m_ctx);
>         __poll_t req_events = poll_requested_events(wait);
>         __poll_t rc = 0;
>
> +       poll_wait(file, &src_q->done_wq, wait);
> +       poll_wait(file, &dst_q->done_wq, wait);

This should probably include a comment to not move this back to
v4l2_m2m_poll_for_data(). I'll add one and send a v2 unless someone
points out that the premise of this patch is a bad idea to begin with.


> +
>         if (req_events & (EPOLLOUT | EPOLLWRNORM | EPOLLIN | EPOLLRDNORM))
>                 rc = v4l2_m2m_poll_for_data(file, m2m_ctx, wait);
>
> --
> 2.29.0
>
