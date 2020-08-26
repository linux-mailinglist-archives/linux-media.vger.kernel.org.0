Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA7B252CC4
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 13:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbgHZLrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 07:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728786AbgHZLVm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 07:21:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD09C0613ED;
        Wed, 26 Aug 2020 04:21:32 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y2so1914600ljc.1;
        Wed, 26 Aug 2020 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RdgIpCwczQqon253S1bYfUgfts2Opcf7CDIOFNDECKI=;
        b=uSXSbgG9oq/51fUqC4T5ktqeKJ5wnt8dFwjDNRThRCsoExvUOXXr0jY9PQ1J8+IGfB
         n+A6kPAbUcurZWTCTyWLkWTE0/76FJGUitRx5FbIkzUnUpxcZ3QxKrNJTyTsJXevZhs3
         ZL+VMBNXysQuj9k8t1jAUf17nvjTyeRsSLF59M2WJgbM27G7B8gYOBi1ZAHWGYq10YEA
         rKg36vIm0HlNj6+pGrYhmFk8H7wdxxkkw8Fn7KgmrFHK7fNFe+ALBj4wXXRi9WhY21tO
         2Hh9mO0OI5xtK6TzAd08kP1pREF+LpthqVHBtM5TwEX++v+X+RlmLPw43SLtl3g/FUlF
         Pv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RdgIpCwczQqon253S1bYfUgfts2Opcf7CDIOFNDECKI=;
        b=c1P5VAVXfGhjeqLO8Y5LYTX9NCAVJnEEndKRpQVf3CBgiQOWOnGSLPfXOSaFUzv+xu
         3aXMYQ8puhiUTgO9I0Tki04vtR5VbhDXYkpZFcqXbfrAjQ1rXgsoudZAQyid0WcZODuU
         T5XTW11bJ2H086Qbl358H/zHEpRwKho6rXANyuglGlHsq0/SpcbzukvUWUo+AVG68gMK
         uXNzYeCccS+pr05QVnDlRYB/eo0CFy08tKKv3Wq4kJ8djm9Px+rlm7M4EYgG5GzLwqSo
         WwgJBKaiLTSkAHs+KQgA5FigMdzYsPDZBGx1IjghLW6s480thVnNdy9rEsbiG5G5NnDG
         KhuQ==
X-Gm-Message-State: AOAM531HGMSFwXbP4VKxodmwXqvJxL/CVcY+C8Ql8iHVo6CLwiLuIvH9
        3enkrSPyHvxYKwtB6XXYCxwXa4nGTe77RtUmxcQ=
X-Google-Smtp-Source: ABdhPJzsxvDHT3CSBq0HreUv8gP0r9P3r4jtbpKtloh+xuIvGCFPI7eUMno8maFFWPdbhol80sOamOnfSwiJTybPdtk=
X-Received: by 2002:a2e:9e8a:: with SMTP id f10mr6657140ljk.330.1598440890979;
 Wed, 26 Aug 2020 04:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200825145556.637323-1-gnurou@gmail.com> <20200825145556.637323-2-gnurou@gmail.com>
 <CAAEAJfBeJnSjqfyhosM_6jP4C+wQ7UVmt=oG_O0w--sAf0=0PQ@mail.gmail.com>
In-Reply-To: <CAAEAJfBeJnSjqfyhosM_6jP4C+wQ7UVmt=oG_O0w--sAf0=0PQ@mail.gmail.com>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Wed, 26 Aug 2020 20:21:19 +0900
Message-ID: <CAAVeFuLnfeBG89hVsM8JuFaCP+s7RTZe_OvFM6WPVH0dnkAZNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: v4l2-mem2mem: consider OUTPUT queue first when polling
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

On Wed, Aug 26, 2020 at 1:08 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Alexandre,
>
> On Tue, 25 Aug 2020 at 11:56, Alexandre Courbot <gnurou@gmail.com> wrote:
> >
> > If poll() is called on a m2m device with the EPOLLOUT event after the
> > last buffer of the CAPTURE queue is dequeued, any buffer available on
> > OUTPUT queue will never be signaled because v4l2_m2m_poll_for_data()
> > starts by checking whether dst_q->last_buffer_dequeued is set and
> > returns EPOLLIN in this case, without looking at the state of the OUTPUT
> > queue.
> >
> > Fix this by checking the state of the OUTPUT queue before considering
> > that early-return case.
> >
> > This also has the side-effect of bringing the two blocks of code dealing
> > with the CAPTURE queue next to one another, and saves us one spin
> > lock/unlock cycle, for what it's worth.
> >
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
>
> Change looks good to me.
>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> Do you think it qualifies for -stable? The issue has been
> here since the dawn of time.

Indeed, and this should be quite a rare corner case. I will leave that
call to the maintainers.

>
> Thanks,
> Ezequiel
>
> > ---
> >  drivers/media/v4l2-core/v4l2-mem2mem.c | 23 +++++++++++------------
> >  1 file changed, 11 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > index 95a8f2dc5341d..0d0192119af20 100644
> > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > @@ -862,6 +862,15 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
> >              list_empty(&dst_q->queued_list)))
> >                 return EPOLLERR;
> >
> > +       spin_lock_irqsave(&src_q->done_lock, flags);
> > +       if (!list_empty(&src_q->done_list))
> > +               src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
> > +                                               done_entry);
> > +       if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE
> > +                       || src_vb->state == VB2_BUF_STATE_ERROR))
> > +               rc |= EPOLLOUT | EPOLLWRNORM;
> > +       spin_unlock_irqrestore(&src_q->done_lock, flags);
> > +
> >         spin_lock_irqsave(&dst_q->done_lock, flags);
> >         if (list_empty(&dst_q->done_list)) {
> >                 /*
> > @@ -870,21 +879,11 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
> >                  */
> >                 if (dst_q->last_buffer_dequeued) {
> >                         spin_unlock_irqrestore(&dst_q->done_lock, flags);
> > -                       return EPOLLIN | EPOLLRDNORM;
> > +                       rc |= EPOLLIN | EPOLLRDNORM;
> > +                       return rc;
> >                 }
> >         }
> > -       spin_unlock_irqrestore(&dst_q->done_lock, flags);
> >
> > -       spin_lock_irqsave(&src_q->done_lock, flags);
> > -       if (!list_empty(&src_q->done_list))
> > -               src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
> > -                                               done_entry);
> > -       if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE
> > -                       || src_vb->state == VB2_BUF_STATE_ERROR))
> > -               rc |= EPOLLOUT | EPOLLWRNORM;
> > -       spin_unlock_irqrestore(&src_q->done_lock, flags);
> > -
> > -       spin_lock_irqsave(&dst_q->done_lock, flags);
> >         if (!list_empty(&dst_q->done_list))
> >                 dst_vb = list_first_entry(&dst_q->done_list, struct vb2_buffer,
> >                                                 done_entry);
> > --
> > 2.28.0
> >
