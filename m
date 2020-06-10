Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B121F5B84
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 20:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgFJSw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 14:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729332AbgFJSww (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 14:52:52 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F10C03E96F
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 11:52:51 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id o26so2163254edq.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CbR96mtjILK7CXyFeJfJjgwimFAgYdYYoASbhiEt3b8=;
        b=UoA6mdIYYeZDClqnXSQssygIn/PG+NX40vT80Y6VCQxi+EBFCnFS6Wr7ztvKGCkcH4
         4kVSxit+x0RXy1PUroeD0u6Mbawsqh6va1iTczz8VDIdEiS/jdwT6C3SByXK6bJ8SaMZ
         LV6c/7zlWnLB6JilPSBzPSB5L+bjUdVQuQ5GhXTTqLQlopf14FpK8Aso+WDEhC12FsN/
         fxrMi0/plvpnlcpV/SF+2RehWTeVpskRO3SpSH7qOyw6ly41UFj97rly8sB2ZBQhHCNa
         Ad5iqI3BSb6PpZET2RVQNsoYfKMfTEqHxGejMSn1QviLBu1165Otf+5nmA5rlKCAWQ+h
         ad1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CbR96mtjILK7CXyFeJfJjgwimFAgYdYYoASbhiEt3b8=;
        b=YtZ9DP11Wu+4TCWbyBROqrxkOgiJDI8pfOYaSWDI8mdGO1A2xD7IOaft37BImAIyA2
         RxcUViFwHP4ekpHLnTKUb9jTzrHWRLLvZ5vRc9JP8QYVOzKrSjXyJj8ofXpOPSf8I0aq
         MAQh/tzi3GjILeVyhA3ZBNWWjY1hFr+J6v8TqYDeCM2Dz4jr0bEueiBytGrB/ihxClgH
         IEJ/KYknxFYUFXUg8TG5J0UahMHPtkPNtMwAzk5fznegWuX+FuilVMpJqFJhpf1rcAxU
         0K5FW4nVkrXs1PBCySata2Iy4BHbxDyWG8E8VGVJWwFY+ZpH9FgKt/82ypanwSIYhOk7
         2t0A==
X-Gm-Message-State: AOAM53251RKMYStkCQztEoqDJ7K/cSyRfTyYrZC9Qj/O116pwNxAT8jP
        5lLVFYS6daNiA1Y0cHzN5hu3RX0c7Y+i7kq53jR0Fw==
X-Google-Smtp-Source: ABdhPJxN/GLInQdzFlFb6QNZ7kF/EMF0jdmnsSPEii+SZBgYAz5zF8iUnVPfSKOUH7zSH4rYKOySSHmBDtruvjQjLd8=
X-Received: by 2002:a05:6402:149:: with SMTP id s9mr3576778edu.375.1591815170564;
 Wed, 10 Jun 2020 11:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com> <20200521171101.GA243874@chromium.org>
 <e31fe64a-c5c1-7b1e-eec1-27111fe43ac2@xs4all.nl> <CAAFQd5Ad_cnv0qztZOk9c2H0Y+XO6tRcRmS1t4dBw5qbG-d8Nw@mail.gmail.com>
In-Reply-To: <CAAFQd5Ad_cnv0qztZOk9c2H0Y+XO6tRcRmS1t4dBw5qbG-d8Nw@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 10 Jun 2020 15:52:39 -0300
Message-ID: <CAAEAJfDboyra5XcEiviJP_3Kk-mDNZH5nstDa_7P7XCV7bu7Pg@mail.gmail.com>
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, yuzhao@chromium.org,
        zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

Thanks for the patch.

On Wed, 10 Jun 2020 at 07:33, Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Wed, Jun 10, 2020 at 12:29 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 21/05/2020 19:11, Tomasz Figa wrote:
> > > Hi Jerry,
> > >
> > > On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
> > >> From: Pi-Hsun Shih <pihsun@chromium.org>
> > >>
> > >> Add two functions that can be used to stop new jobs from being queued /
> > >> continue running queued job. This can be used while a driver using m2m
> > >> helper is going to suspend / wake up from resume, and can ensure that
> > >> there's no job running in suspend process.
> > >>
> > >> BUG=b:143046833
> > >> TEST=build
> > >>

BUG/TEST tags need to be removed.

> > >> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > >> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>

This mail address probably needs correction?

> > >> ---
> > >>  drivers/media/v4l2-core/v4l2-mem2mem.c | 40 ++++++++++++++++++++++++++
> > >>  include/media/v4l2-mem2mem.h           | 22 ++++++++++++++
> > >>  2 files changed, 62 insertions(+)
> > >>
> > >> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > >> index 5bbdec55b7d7..76ba203e0035 100644
> > >> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > >> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > >> @@ -47,6 +47,10 @@ module_param(debug, bool, 0644);
> > >>  #define TRANS_ABORT         (1 << 2)
> > >>
> > >>
> > >> +/* The job queue is not running new jobs */
> > >> +#define QUEUE_PAUSED                (1 << 0)
> > >> +
> > >> +
> > >>  /* Offset base for buffers on the destination queue - used to distinguish
> > >>   * between source and destination buffers when mmapping - they receive the same
> > >>   * offsets but for different queues */
> > >> @@ -88,6 +92,7 @@ static const char * const m2m_entity_name[] = {
> > >>   * @job_queue:              instances queued to run
> > >>   * @job_spinlock:   protects job_queue
> > >>   * @job_work:               worker to run queued jobs.
> > >> + * @job_queue_flags:        flags of the queue status, %QUEUE_PAUSED.
> > >>   * @m2m_ops:                driver callbacks
> > >>   */
> > >>  struct v4l2_m2m_dev {
> > >> @@ -105,6 +110,7 @@ struct v4l2_m2m_dev {
> > >>      struct list_head        job_queue;
> > >>      spinlock_t              job_spinlock;
> > >>      struct work_struct      job_work;
> > >> +    unsigned long           job_queue_flags;
> > >>
> > >>      const struct v4l2_m2m_ops *m2m_ops;
> > >>  };
> > >> @@ -267,6 +273,12 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
> > >>              return;
> > >>      }
> > >>
> > >> +    if (m2m_dev->job_queue_flags & QUEUE_PAUSED) {
> > >> +            spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> > >> +            dprintk("Running new jobs is paused\n");
> > >> +            return;
> > >> +    }
> > >> +
> > >>      m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
> > >>                                 struct v4l2_m2m_ctx, queue);
> > >>      m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
> > >> @@ -447,6 +459,34 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
> > >>  }
> > >>  EXPORT_SYMBOL(v4l2_m2m_job_finish);
> > >>
> > >> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> > >> +{
> > >> +    unsigned long flags;
> > >> +    struct v4l2_m2m_ctx *curr_ctx;
> > >> +
> > >> +    spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> > >> +    m2m_dev->job_queue_flags |= QUEUE_PAUSED;
> > >> +    curr_ctx = m2m_dev->curr_ctx;
> > >> +    spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> > >> +
> > >> +    if (curr_ctx)
> > >> +            wait_event(curr_ctx->finished,
> > >> +                       !(curr_ctx->job_flags & TRANS_RUNNING));
> > >> +}
> > >> +EXPORT_SYMBOL(v4l2_m2m_suspend);
> > >> +
> > >> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev)
> > >> +{
> > >> +    unsigned long flags;
> > >> +
> > >> +    spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> > >> +    m2m_dev->job_queue_flags &= ~QUEUE_PAUSED;
> > >> +    spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> > >> +
> > >> +    v4l2_m2m_try_run(m2m_dev);
> > >> +}
> > >> +EXPORT_SYMBOL(v4l2_m2m_resume);
> > >> +
> > >>  int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> > >>                   struct v4l2_requestbuffers *reqbufs)
> > >>  {
> > >> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> > >> index 5467264771ec..119a195da390 100644
> > >> --- a/include/media/v4l2-mem2mem.h
> > >> +++ b/include/media/v4l2-mem2mem.h
> > >> @@ -183,6 +183,28 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
> > >>      vb2_buffer_done(&buf->vb2_buf, state);
> > >>  }
> > >>
> > >> +/**
> > >> + * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
> > >> + * to finish
> > >> + *
> > >> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> > >> + *
> > >> + * Called by a driver in the suspend hook. Stop new jobs from being run, and
> > >> + * wait for current running job to finish.
> > >> + */
> > >> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev);
> > >> +
> > >> +/**
> > >> + * v4l2_m2m_resume() - resume job running and try to run a queued job
> > >> + *
> > >> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> > >> + *
> > >> + * Called by a driver in the resume hook. This reverts the operation of
> > >> + * v4l2_m2m_suspend() and allows job to be run. Also try to run a queued job if
> > >> + * there is any.
> > >> + */
> > >> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev);
> > >> +
> > >>  /**
> > >>   * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
> > >>   *
> > >> --
> > >> 2.18.0
> > >
> > > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > >
> > > [Corrected Hans's email address.]
> > > Hans, does this look good to you?
> >
> > Yes, this looks good.
> >
> > Sorry for the late reply.
>
> No worries! Thanks a lot.
>
> >
> > I assume this will be part of a future patch series that calls these new functions?
>
> The mtk-jpeg encoder series depends on this patch as well, so I guess
> it would go together with whichever is ready first.
>
> I would also envision someone changing the other existing drivers to
> use the helpers, as I'm pretty much sure some of them don't handle
> suspend/resume correctly.
>

This indeed looks very good. If I understood the issue properly,
the change would be useful for both stateless (e.g. hantro, et al)
and stateful (e.g. coda) codecs.

Hantro uses pm_runtime_force_suspend, and I believe that
could is enough for proper suspend/resume operation.

I'm not seeing any code in CODA to handle this, so not sure
how it's handling suspend/resume.

Maybe we can have CODA as the first user, given it's a well-maintained
driver and should be fairly easy to test.

Regards,
Ezequiel
