Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D9A252CBF
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 13:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgHZLWB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 07:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728902AbgHZLVZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 07:21:25 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4A1C061799;
        Wed, 26 Aug 2020 04:19:46 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y26so782934lfe.2;
        Wed, 26 Aug 2020 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uu4WskBztKVUoVSil4cy4MR9LWqcw8xk2hr+l0UQ5ho=;
        b=nLSKDQaBmzQREFSjfYHKCqFSUKm9X0iKZKktP8MRR7TUCwjXuSJJQWe4LWG8yLQR5B
         6ya721Xer1i/YscNwBz3wTajvo9dCz7ieCkXcXzy4pLGrwOxfu2LJ4wCam9Tacykvw5i
         RHga6ZekM3QBEWrT0WnzqT3K73yNX+D/45UWy5PUzN3iQeEMNBieoWxxtND4qaSYXy2H
         O1SMNuSUhs2bbLEusZUxwdWD9wrryrVS9yA34iQ/p/dnOVnRDpuTq2N/erfwBHywv+Wx
         GO8s99zdB/EYGMwGsdhphInw4RWcHUmk2wNPyfSxs/Pon7KfXSW4mfBiqDnQBE839FX/
         Z/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uu4WskBztKVUoVSil4cy4MR9LWqcw8xk2hr+l0UQ5ho=;
        b=uTuCaSNhOkJwnKb2eS65M5aK7RC+RS1dUb4Cdf0f3t6zh+mdOaaudwy47F1yQA851T
         qQBBu7GQ+sBn2Bq0Kntbt6CQv6yxq+v7nv4gOnQs4a4uaVzABK9HpO3ufc8nJBiwNzN+
         G5dSTQA6dYzSdnvKo5kcLoi797MLFByEXzQ8BUObZXhVnLsUS1sD2TT6bUb13FfFFvAZ
         H9hpvx1CYnBVJDh0fnqfW+sOYstPQ7c7g03/VfMHKzW9Q6JPXV2r+qDsdMaMHlcRfR1d
         wd4ZWajFZBvRbONMP4GkX2UMozZDNXN9EJVeKAN3MVd4kMxKF10uF1Q1Pq9t27Ngoirn
         cRwg==
X-Gm-Message-State: AOAM531e4eOgD/T1SxnaDFp7xAksEAnaBWBvMOm/ZdTzAR5y1otQFgmE
        /goc6Lg3UCeTuyp40r7cKXzS3ZBheU/eR6Ko+RU=
X-Google-Smtp-Source: ABdhPJxuVHbetnc2ILjUr/BDvb4NcfasRruvdoGDD4w183KvosLLP3yazMpa2v2J3UgwEYKy/joOCyF1a6VogES9xps=
X-Received: by 2002:ac2:5a0c:: with SMTP id q12mr2905449lfn.173.1598440784506;
 Wed, 26 Aug 2020 04:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200825145556.637323-1-gnurou@gmail.com> <20200825145556.637323-3-gnurou@gmail.com>
 <CAAEAJfD1kUJODa+-STV6Q+=9qWH8v2=KZzAA4ppgfbQxstO+Mg@mail.gmail.com>
In-Reply-To: <CAAEAJfD1kUJODa+-STV6Q+=9qWH8v2=KZzAA4ppgfbQxstO+Mg@mail.gmail.com>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Wed, 26 Aug 2020 20:19:33 +0900
Message-ID: <CAAVeFuJgBqN7KYhNi=mMNxy6wHTZOn5E1=pHP3q=n8X++b5pmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: v4l2-mem2mem: simplify poll logic a bit
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel, thanks for the review!

On Wed, Aug 26, 2020 at 1:15 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Alexandre,
>
> On Tue, 25 Aug 2020 at 11:56, Alexandre Courbot <gnurou@gmail.com> wrote:
> >
> > Factorize redundant checks into a single code block, remove the early
> > return, and declare variables in their innermost block. Hopefully this
> > makes this code a little bit easier to follow.
> >
>
> This _definitely_ makes the poll handling more readable.
>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> See below a nitpick.
>
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-mem2mem.c | 35 +++++++++++---------------
> >  1 file changed, 15 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > index 0d0192119af20..aeac9707123d0 100644
> > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > @@ -841,7 +841,6 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
> >                                        struct poll_table_struct *wait)
> >  {
> >         struct vb2_queue *src_q, *dst_q;
> > -       struct vb2_buffer *src_vb = NULL, *dst_vb = NULL;
> >         __poll_t rc = 0;
> >         unsigned long flags;
> >
> > @@ -863,33 +862,29 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
> >                 return EPOLLERR;
> >
> >         spin_lock_irqsave(&src_q->done_lock, flags);
> > -       if (!list_empty(&src_q->done_list))
> > -               src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
> > -                                               done_entry);
> > -       if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE
> > -                       || src_vb->state == VB2_BUF_STATE_ERROR))
> > -               rc |= EPOLLOUT | EPOLLWRNORM;
> > +       if (!list_empty(&src_q->done_list)) {
> > +               struct vb2_buffer *src_vb = list_first_entry(
> > +                       &src_q->done_list, struct vb2_buffer, done_entry);
> > +               if (src_vb->state == VB2_BUF_STATE_DONE ||
> > +                   src_vb->state == VB2_BUF_STATE_ERROR)
> > +                       rc |= EPOLLOUT | EPOLLWRNORM;
> > +       }
> >         spin_unlock_irqrestore(&src_q->done_lock, flags);
> >
> >         spin_lock_irqsave(&dst_q->done_lock, flags);
> > -       if (list_empty(&dst_q->done_list)) {
> > +       if (!list_empty(&dst_q->done_list)) {
> > +               struct vb2_buffer *dst_vb = list_first_entry(
> > +                       &dst_q->done_list, struct vb2_buffer, done_entry);
> > +               if (dst_vb->state == VB2_BUF_STATE_DONE ||
> > +                   dst_vb->state == VB2_BUF_STATE_ERROR)
> > +                       rc |= EPOLLIN | EPOLLRDNORM;
> > +       } else if (dst_q->last_buffer_dequeued) {
> >                 /*
> >                  * If the last buffer was dequeued from the capture queue,
> >                  * return immediately. DQBUF will return -EPIPE.
> >                  */
>
> The part about "returning immediately" doesn't make
> much sense now. Could we rephrase this, keeping the -EPIPE
> comment?

I understood this sentence as referring to the system call and not
just this function, but maybe we can rephrase this as "... make
user-space wake up immediately"?

>
> Thanks,
> Ezequiel
>
> > -               if (dst_q->last_buffer_dequeued) {
> > -                       spin_unlock_irqrestore(&dst_q->done_lock, flags);
> > -                       rc |= EPOLLIN | EPOLLRDNORM;
> > -                       return rc;
> > -               }
> > -       }
> > -
> > -       if (!list_empty(&dst_q->done_list))
> > -               dst_vb = list_first_entry(&dst_q->done_list, struct vb2_buffer,
> > -                                               done_entry);
> > -       if (dst_vb && (dst_vb->state == VB2_BUF_STATE_DONE
> > -                       || dst_vb->state == VB2_BUF_STATE_ERROR))
> >                 rc |= EPOLLIN | EPOLLRDNORM;
> > +       }
> >         spin_unlock_irqrestore(&dst_q->done_lock, flags);
> >
> >         return rc;
> > --
> > 2.28.0
> >
