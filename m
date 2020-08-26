Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E297252605
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 06:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgHZEP2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 00:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgHZEPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 00:15:25 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005BFC061574
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 21:15:24 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id md23so963130ejb.6
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 21:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QY6Ljmh2HXSSryC0p9M8nVGRSf9FH/y8FKhduU/dGHc=;
        b=ukqxvLek6Rh9EePhBgW6aHIfsWaXbpGPJVxjvwjQoc1UpjqQfbRWdjd1Di/NrmBs9V
         uMMYpdVdmrZnpsAC15Et463umxUcrFLQfwOJYkKs1teWoy3jMgb4WPxOhHY3+Tsx2U7n
         VAGY5d8iHraduuSrATiE5WN43eDP6GB1aIKH/w+BucM8S4or7eOq9islch5fTcwID0yI
         /1G/yLDyVue7PGWBzzi5UeWeR6m7L7SqbvERg40QJm01hRvuBHvDdoUtPTeG6enXdcad
         bLNBFytPl47lj19wukyxMYpcMSCKt1e1X7ZYwraGcNg/FiSFDiA+lrudZdnnVVPwY4ah
         nV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QY6Ljmh2HXSSryC0p9M8nVGRSf9FH/y8FKhduU/dGHc=;
        b=DtRna8oAYpBazdZ9McsWl2DT7sNg8PPfOrbkIFo3hys4y87XVA5efcTQfDqkiA/5Te
         p2ri/nMG7YU4Tcs6jGtV2O1/ZrDs6Q2DlexpcKG6v3pb0HIEqMti3ENN3myvZOifF/r1
         j/2RvzQYKj7/0PYCDUYOMyhwR0hBILRm1/ltnkZ5WLQE2mCHr0AGxWc23fg/Wr3Q/m0h
         QaAb2MHbo2oUc1pkNLsOSQhHTIMMlwKFc2YpqLI/oYFA7/1KLjnz6xW0MtbgD0rTE1Tf
         1cry2OHqgRXE9yFfQmNj7e1oXwhn/JZLZNsrtvgHzpBtBEgN87UNMrjE6SNif+XzLfuD
         9i2w==
X-Gm-Message-State: AOAM532WRVlrmKjYRrDZqHdFKmOOf1ALedFyeqbCD+OvIQcFLGYHRRVO
        rFFnKi1xk1HDziT19tZSTA8giBf/Y+LKcRJ07Gt/kg==
X-Google-Smtp-Source: ABdhPJyA8btFePNGsr5nV+ALqcQpJ9fj6erIwGjpRlDloWAH9ll3j6ubw2BSiKuJ9kDS4azvi+6cIg69pIPOmt+RT/k=
X-Received: by 2002:a17:906:a209:: with SMTP id r9mr14533660ejy.413.1598415323684;
 Tue, 25 Aug 2020 21:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200825145556.637323-1-gnurou@gmail.com> <20200825145556.637323-3-gnurou@gmail.com>
In-Reply-To: <20200825145556.637323-3-gnurou@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 26 Aug 2020 01:15:12 -0300
Message-ID: <CAAEAJfD1kUJODa+-STV6Q+=9qWH8v2=KZzAA4ppgfbQxstO+Mg@mail.gmail.com>
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

Hi Alexandre,

On Tue, 25 Aug 2020 at 11:56, Alexandre Courbot <gnurou@gmail.com> wrote:
>
> Factorize redundant checks into a single code block, remove the early
> return, and declare variables in their innermost block. Hopefully this
> makes this code a little bit easier to follow.
>

This _definitely_ makes the poll handling more readable.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

See below a nitpick.

> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 35 +++++++++++---------------
>  1 file changed, 15 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 0d0192119af20..aeac9707123d0 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -841,7 +841,6 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
>                                        struct poll_table_struct *wait)
>  {
>         struct vb2_queue *src_q, *dst_q;
> -       struct vb2_buffer *src_vb = NULL, *dst_vb = NULL;
>         __poll_t rc = 0;
>         unsigned long flags;
>
> @@ -863,33 +862,29 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
>                 return EPOLLERR;
>
>         spin_lock_irqsave(&src_q->done_lock, flags);
> -       if (!list_empty(&src_q->done_list))
> -               src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
> -                                               done_entry);
> -       if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE
> -                       || src_vb->state == VB2_BUF_STATE_ERROR))
> -               rc |= EPOLLOUT | EPOLLWRNORM;
> +       if (!list_empty(&src_q->done_list)) {
> +               struct vb2_buffer *src_vb = list_first_entry(
> +                       &src_q->done_list, struct vb2_buffer, done_entry);
> +               if (src_vb->state == VB2_BUF_STATE_DONE ||
> +                   src_vb->state == VB2_BUF_STATE_ERROR)
> +                       rc |= EPOLLOUT | EPOLLWRNORM;
> +       }
>         spin_unlock_irqrestore(&src_q->done_lock, flags);
>
>         spin_lock_irqsave(&dst_q->done_lock, flags);
> -       if (list_empty(&dst_q->done_list)) {
> +       if (!list_empty(&dst_q->done_list)) {
> +               struct vb2_buffer *dst_vb = list_first_entry(
> +                       &dst_q->done_list, struct vb2_buffer, done_entry);
> +               if (dst_vb->state == VB2_BUF_STATE_DONE ||
> +                   dst_vb->state == VB2_BUF_STATE_ERROR)
> +                       rc |= EPOLLIN | EPOLLRDNORM;
> +       } else if (dst_q->last_buffer_dequeued) {
>                 /*
>                  * If the last buffer was dequeued from the capture queue,
>                  * return immediately. DQBUF will return -EPIPE.
>                  */

The part about "returning immediately" doesn't make
much sense now. Could we rephrase this, keeping the -EPIPE
comment?

Thanks,
Ezequiel

> -               if (dst_q->last_buffer_dequeued) {
> -                       spin_unlock_irqrestore(&dst_q->done_lock, flags);
> -                       rc |= EPOLLIN | EPOLLRDNORM;
> -                       return rc;
> -               }
> -       }
> -
> -       if (!list_empty(&dst_q->done_list))
> -               dst_vb = list_first_entry(&dst_q->done_list, struct vb2_buffer,
> -                                               done_entry);
> -       if (dst_vb && (dst_vb->state == VB2_BUF_STATE_DONE
> -                       || dst_vb->state == VB2_BUF_STATE_ERROR))
>                 rc |= EPOLLIN | EPOLLRDNORM;
> +       }
>         spin_unlock_irqrestore(&dst_q->done_lock, flags);
>
>         return rc;
> --
> 2.28.0
>
