Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6921F525C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 12:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgFJKdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 06:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbgFJKdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 06:33:11 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A995C03E96F
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 03:33:10 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id n24so2016257ejd.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 03:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b4xt9ro4s6EJh9yAJChrfwEE70fQqv8RKm8O5jxwnF8=;
        b=l1lc9WvNx7QdPB4+apffY5SPACt/ijyjhjbYY0C9EkWG3RnABAwn7TKeVaauSy9NMU
         MPhfLiuNtdM7gCzTJw6ftAbcxtZY2ersGZ0blDLT2GHrZiBZgnN0CO2oE5ddHmxZvIWd
         jimEGBuvkuu8oPARZ7ltp1pHctgWaMHIOf8o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b4xt9ro4s6EJh9yAJChrfwEE70fQqv8RKm8O5jxwnF8=;
        b=PLPK3GihPdt4btCYjxQtE95HDbB/qggM6Gtr69zqAwK3uHgnJ1LAv2UrjnbXDqYcKM
         ydws7kjziNUSCtkdTmqDE/oEWK3UfZZyAmg3QEn8UfqtC4K1LVBjlBSpq4yIw9OQZ8mu
         0j1gyrszcdbzWkResVPhQmKbDkheSBbjnHrQx2naw4cte17oyXR7Pd5DLx+2Axlwiuhm
         e3KBE7dQYaxE9/y6mxRKwH89xgYhm1u6xxOXG3GisNxqXfFyWjbBL0o/sHlUObJLqCA3
         hpLH/8y5MEIFDl7oYC+ug5DwVfg/hdfgIrdKPFcshk9YGZmmlHpbiWAD0FECunnswH5J
         GGvQ==
X-Gm-Message-State: AOAM532HRwgHKxHdEvyDThs4HuXB2swhjyalwO3GhTUSrSmFpKc3wFbj
        wfAWy7OZ4+I9UvrJa2KMJo9UCJavIy0krw==
X-Google-Smtp-Source: ABdhPJwiwXXZc5wsmGERLoNHz2kPd1CELCobYQKZemhLFeUPYCYZ7MiyhXBfbdBwe9Zuk/NgxZM/jg==
X-Received: by 2002:a17:906:6c98:: with SMTP id s24mr2843803ejr.438.1591785188787;
        Wed, 10 Jun 2020 03:33:08 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id b16sm17536605edu.89.2020.06.10.03.33.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 03:33:07 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id l11so1682679wru.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 03:33:07 -0700 (PDT)
X-Received: by 2002:adf:e2ce:: with SMTP id d14mr2923508wrj.415.1591785187039;
 Wed, 10 Jun 2020 03:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com> <20200521171101.GA243874@chromium.org>
 <e31fe64a-c5c1-7b1e-eec1-27111fe43ac2@xs4all.nl>
In-Reply-To: <e31fe64a-c5c1-7b1e-eec1-27111fe43ac2@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 10 Jun 2020 12:32:56 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Ad_cnv0qztZOk9c2H0Y+XO6tRcRmS1t4dBw5qbG-d8Nw@mail.gmail.com>
Message-ID: <CAAFQd5Ad_cnv0qztZOk9c2H0Y+XO6tRcRmS1t4dBw5qbG-d8Nw@mail.gmail.com>
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>,
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

On Wed, Jun 10, 2020 at 12:29 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 21/05/2020 19:11, Tomasz Figa wrote:
> > Hi Jerry,
> >
> > On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
> >> From: Pi-Hsun Shih <pihsun@chromium.org>
> >>
> >> Add two functions that can be used to stop new jobs from being queued /
> >> continue running queued job. This can be used while a driver using m2m
> >> helper is going to suspend / wake up from resume, and can ensure that
> >> there's no job running in suspend process.
> >>
> >> BUG=b:143046833
> >> TEST=build
> >>
> >> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> >> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
> >> ---
> >>  drivers/media/v4l2-core/v4l2-mem2mem.c | 40 ++++++++++++++++++++++++++
> >>  include/media/v4l2-mem2mem.h           | 22 ++++++++++++++
> >>  2 files changed, 62 insertions(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> >> index 5bbdec55b7d7..76ba203e0035 100644
> >> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> >> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> >> @@ -47,6 +47,10 @@ module_param(debug, bool, 0644);
> >>  #define TRANS_ABORT         (1 << 2)
> >>
> >>
> >> +/* The job queue is not running new jobs */
> >> +#define QUEUE_PAUSED                (1 << 0)
> >> +
> >> +
> >>  /* Offset base for buffers on the destination queue - used to distinguish
> >>   * between source and destination buffers when mmapping - they receive the same
> >>   * offsets but for different queues */
> >> @@ -88,6 +92,7 @@ static const char * const m2m_entity_name[] = {
> >>   * @job_queue:              instances queued to run
> >>   * @job_spinlock:   protects job_queue
> >>   * @job_work:               worker to run queued jobs.
> >> + * @job_queue_flags:        flags of the queue status, %QUEUE_PAUSED.
> >>   * @m2m_ops:                driver callbacks
> >>   */
> >>  struct v4l2_m2m_dev {
> >> @@ -105,6 +110,7 @@ struct v4l2_m2m_dev {
> >>      struct list_head        job_queue;
> >>      spinlock_t              job_spinlock;
> >>      struct work_struct      job_work;
> >> +    unsigned long           job_queue_flags;
> >>
> >>      const struct v4l2_m2m_ops *m2m_ops;
> >>  };
> >> @@ -267,6 +273,12 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
> >>              return;
> >>      }
> >>
> >> +    if (m2m_dev->job_queue_flags & QUEUE_PAUSED) {
> >> +            spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> >> +            dprintk("Running new jobs is paused\n");
> >> +            return;
> >> +    }
> >> +
> >>      m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
> >>                                 struct v4l2_m2m_ctx, queue);
> >>      m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
> >> @@ -447,6 +459,34 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
> >>  }
> >>  EXPORT_SYMBOL(v4l2_m2m_job_finish);
> >>
> >> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> >> +{
> >> +    unsigned long flags;
> >> +    struct v4l2_m2m_ctx *curr_ctx;
> >> +
> >> +    spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> >> +    m2m_dev->job_queue_flags |= QUEUE_PAUSED;
> >> +    curr_ctx = m2m_dev->curr_ctx;
> >> +    spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> >> +
> >> +    if (curr_ctx)
> >> +            wait_event(curr_ctx->finished,
> >> +                       !(curr_ctx->job_flags & TRANS_RUNNING));
> >> +}
> >> +EXPORT_SYMBOL(v4l2_m2m_suspend);
> >> +
> >> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev)
> >> +{
> >> +    unsigned long flags;
> >> +
> >> +    spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> >> +    m2m_dev->job_queue_flags &= ~QUEUE_PAUSED;
> >> +    spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> >> +
> >> +    v4l2_m2m_try_run(m2m_dev);
> >> +}
> >> +EXPORT_SYMBOL(v4l2_m2m_resume);
> >> +
> >>  int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> >>                   struct v4l2_requestbuffers *reqbufs)
> >>  {
> >> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> >> index 5467264771ec..119a195da390 100644
> >> --- a/include/media/v4l2-mem2mem.h
> >> +++ b/include/media/v4l2-mem2mem.h
> >> @@ -183,6 +183,28 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
> >>      vb2_buffer_done(&buf->vb2_buf, state);
> >>  }
> >>
> >> +/**
> >> + * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
> >> + * to finish
> >> + *
> >> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> >> + *
> >> + * Called by a driver in the suspend hook. Stop new jobs from being run, and
> >> + * wait for current running job to finish.
> >> + */
> >> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev);
> >> +
> >> +/**
> >> + * v4l2_m2m_resume() - resume job running and try to run a queued job
> >> + *
> >> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> >> + *
> >> + * Called by a driver in the resume hook. This reverts the operation of
> >> + * v4l2_m2m_suspend() and allows job to be run. Also try to run a queued job if
> >> + * there is any.
> >> + */
> >> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev);
> >> +
> >>  /**
> >>   * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
> >>   *
> >> --
> >> 2.18.0
> >
> > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> >
> > [Corrected Hans's email address.]
> > Hans, does this look good to you?
>
> Yes, this looks good.
>
> Sorry for the late reply.

No worries! Thanks a lot.

>
> I assume this will be part of a future patch series that calls these new functions?

The mtk-jpeg encoder series depends on this patch as well, so I guess
it would go together with whichever is ready first.

I would also envision someone changing the other existing drivers to
use the helpers, as I'm pretty much sure some of them don't handle
suspend/resume correctly.

Best regards,
Tomasz
