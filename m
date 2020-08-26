Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B9425315A
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 16:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgHZOcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 10:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbgHZOcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 10:32:47 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CA2C061756
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2020 07:32:43 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id l2so3179709eji.3
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2020 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xc4SdNkRlbSHpKRznT4Nl8g4O2+3CSuiZxMgP3KUUlI=;
        b=qYkUCL0u/5fqg3ScucWxmTRkpwIdNAWXby4hdfttuxwPGBaHNiI70DIL2zwljcbc/X
         hzJ1nrHFHUXrYkyrWwoA5a8oXDaM26M/rvXdhLLqGXBW6Yx1GLJwau19D6RxYt13Zs/r
         TAsef2dfRmRWMAW9hvb7mWTDzs1akryl6MPe6x3s/IbNPrVizq+iHuof4R7eVH311Spe
         CjIsJW8GEMt8bPrss7NX2mJVH2R9v9mFDELp46dzCP1yT06MAJiYBLJz9K3OFA2arXf6
         PDVl2fVxZFRzz9bXSIDbG+GbUTgUydke38Eo444o6Wy7dKg76hB2DuoGVZUMLqnLEtx1
         7x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xc4SdNkRlbSHpKRznT4Nl8g4O2+3CSuiZxMgP3KUUlI=;
        b=dV3JPDRuBNbbB9IPIYOqSkIpJXC+6aXHUhTSVX1uWvR6AwzRQesynrfApr3aNp9kDy
         f7WAQJVOG1stH/Hi7CKghWaKSaTaQfVl0IluN64252CIewJ78scPs8jvQh/sQeFgah+j
         iVhupuvCsQ708N7LShkGbmHaonLS9MAXdkuRKE3R5d2zAcpr7bxXiVt2sc0bLw1LldhH
         rjPi4pD+c4BTJ50t3qBVIFsaBwor2nYNMI7u2nqcL6oEBhmNyefB2a2qwfzmGQrhc6Ec
         CXc/G/tyMM9eULXW9VjNEYImcS+VGsKbS8iClUcZaN686vtibYhBIMA+Ho3/MncFH71I
         jbvA==
X-Gm-Message-State: AOAM5325ZRF8aGU1eANr6hWY4zVCj9t8Xzy17cqCOzlqebiQGpXNPiqa
        QWQ/ZMmLvw1OoOsYPRqRkDRGpriE9G6YuUu8Q7BxhA==
X-Google-Smtp-Source: ABdhPJxo1NjMxIbSqe+ZPA6uRgtj9TMPpFZLS5JtySSwTIB0OLLYcIU0wVzh6MEGdDoeD2LjEd80WEFTHhmebVoSVZ8=
X-Received: by 2002:a17:906:640c:: with SMTP id d12mr15807782ejm.388.1598452362313;
 Wed, 26 Aug 2020 07:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200825145556.637323-1-gnurou@gmail.com> <20200825145556.637323-3-gnurou@gmail.com>
 <CAAEAJfD1kUJODa+-STV6Q+=9qWH8v2=KZzAA4ppgfbQxstO+Mg@mail.gmail.com> <CAAVeFuJgBqN7KYhNi=mMNxy6wHTZOn5E1=pHP3q=n8X++b5pmg@mail.gmail.com>
In-Reply-To: <CAAVeFuJgBqN7KYhNi=mMNxy6wHTZOn5E1=pHP3q=n8X++b5pmg@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 26 Aug 2020 11:32:31 -0300
Message-ID: <CAAEAJfCfjzGDOhD2WHYny-wVwL19qc_VA9c3uVNiHxpYdEHsLQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: v4l2-mem2mem: simplify poll logic a bit
To:     Alexandre Courbot <gnurou@gmail.com>
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

On Wed, 26 Aug 2020 at 08:19, Alexandre Courbot <gnurou@gmail.com> wrote:
>
> Hi Ezequiel, thanks for the review!
>
> On Wed, Aug 26, 2020 at 1:15 PM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > Hi Alexandre,
> >
> > On Tue, 25 Aug 2020 at 11:56, Alexandre Courbot <gnurou@gmail.com> wrote:
> > >
> > > Factorize redundant checks into a single code block, remove the early
> > > return, and declare variables in their innermost block. Hopefully this
> > > makes this code a little bit easier to follow.
> > >
> >
> > This _definitely_ makes the poll handling more readable.
> >
> > Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> >
> > See below a nitpick.
> >
> > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-mem2mem.c | 35 +++++++++++---------------
> > >  1 file changed, 15 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > > index 0d0192119af20..aeac9707123d0 100644
> > > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > > @@ -841,7 +841,6 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
> > >                                        struct poll_table_struct *wait)
> > >  {
> > >         struct vb2_queue *src_q, *dst_q;
> > > -       struct vb2_buffer *src_vb = NULL, *dst_vb = NULL;
> > >         __poll_t rc = 0;
> > >         unsigned long flags;
> > >
> > > @@ -863,33 +862,29 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
> > >                 return EPOLLERR;
> > >
> > >         spin_lock_irqsave(&src_q->done_lock, flags);
> > > -       if (!list_empty(&src_q->done_list))
> > > -               src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
> > > -                                               done_entry);
> > > -       if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE
> > > -                       || src_vb->state == VB2_BUF_STATE_ERROR))
> > > -               rc |= EPOLLOUT | EPOLLWRNORM;
> > > +       if (!list_empty(&src_q->done_list)) {
> > > +               struct vb2_buffer *src_vb = list_first_entry(
> > > +                       &src_q->done_list, struct vb2_buffer, done_entry);
> > > +               if (src_vb->state == VB2_BUF_STATE_DONE ||
> > > +                   src_vb->state == VB2_BUF_STATE_ERROR)
> > > +                       rc |= EPOLLOUT | EPOLLWRNORM;
> > > +       }
> > >         spin_unlock_irqrestore(&src_q->done_lock, flags);
> > >
> > >         spin_lock_irqsave(&dst_q->done_lock, flags);
> > > -       if (list_empty(&dst_q->done_list)) {
> > > +       if (!list_empty(&dst_q->done_list)) {
> > > +               struct vb2_buffer *dst_vb = list_first_entry(
> > > +                       &dst_q->done_list, struct vb2_buffer, done_entry);
> > > +               if (dst_vb->state == VB2_BUF_STATE_DONE ||
> > > +                   dst_vb->state == VB2_BUF_STATE_ERROR)
> > > +                       rc |= EPOLLIN | EPOLLRDNORM;
> > > +       } else if (dst_q->last_buffer_dequeued) {
> > >                 /*
> > >                  * If the last buffer was dequeued from the capture queue,
> > >                  * return immediately. DQBUF will return -EPIPE.
> > >                  */
> >
> > The part about "returning immediately" doesn't make
> > much sense now. Could we rephrase this, keeping the -EPIPE
> > comment?
>
> I understood this sentence as referring to the system call and not
> just this function, but maybe we can rephrase this as "... make
> user-space wake up immediately"?
>

But is this really about user-space wakeup? I am under the impression
that past poll_wait on both queues, we are already about to return
(and wakeup).

The way I see it, the original commit intention was to skip any
done_list handling, returning immediately on the last buffer condition.

How about just

"""
If the last buffer was dequeued from the capture queue,
signal userspace. DQBUF will return -EPIPE.
"""

?

> >
> > Thanks,
> > Ezequiel
> >
> > > -               if (dst_q->last_buffer_dequeued) {
> > > -                       spin_unlock_irqrestore(&dst_q->done_lock, flags);
> > > -                       rc |= EPOLLIN | EPOLLRDNORM;
> > > -                       return rc;
> > > -               }
> > > -       }
> > > -
> > > -       if (!list_empty(&dst_q->done_list))
> > > -               dst_vb = list_first_entry(&dst_q->done_list, struct vb2_buffer,
> > > -                                               done_entry);
> > > -       if (dst_vb && (dst_vb->state == VB2_BUF_STATE_DONE
> > > -                       || dst_vb->state == VB2_BUF_STATE_ERROR))
> > >                 rc |= EPOLLIN | EPOLLRDNORM;
> > > +       }
> > >         spin_unlock_irqrestore(&dst_q->done_lock, flags);
> > >
> > >         return rc;
> > > --
> > > 2.28.0
> > >
