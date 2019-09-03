Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44A5A6810
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 14:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbfICMFw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 08:05:52 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43827 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfICMFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 08:05:52 -0400
Received: by mail-ed1-f67.google.com with SMTP id c19so4417114edy.10
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 05:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=shfr8al4rhi7VC5dVA+njaWSgXwMHRZNL54RSSYO5X8=;
        b=f+pChn1DWI1kDyOALPT3YGKMc4fVTuji+fBHe796ew5lH7tmQdpTtcCo8tu0yBBCIY
         fmvRBhepeoyrUIhT5r9BlPlCbKYmb4aZoK6V/NPJNt5pMwSCTiQxV+5uU3ci46ZflHh5
         a1oZwxt/uIM0qlJ1KtcbDrn+cGw1+ztea5YZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=shfr8al4rhi7VC5dVA+njaWSgXwMHRZNL54RSSYO5X8=;
        b=Tyq0tiKfO/aXfgefOmSLGgWJQYSw0vjQumQ8FV0s33LajTtMP83nabBl3G9XcKqfo4
         RsMMLHILLoY6rnJLoRlD51mRdYpbc3to/uqzM6mVqUuFdLBs20N6LEg2bneO1XAMJXCf
         KhrKJ7/0nJ/eLsvb65wxBiZIwkKmBSR3OGnij4ltbcb9b6/ezX1xa4nitDeisXwIE/yJ
         pyfzZEHIRojZO9Nvi4b3GDRpF5sN4VO/Av/c7ePNfIcpwgwMxmmNOeajPmJekxz7mQQB
         xtxo9Dnc3wI7KSOJqw529VxgdZjqVgvLTX8HjUdkKHwCianEWn57ue4iwEdrlh2lvVVa
         xmEg==
X-Gm-Message-State: APjAAAXp7ZcPZzg4Ol9X1cYJj49ifzX6mE2mINCh+R3jvEqQt13o6Flg
        QKzeLEISDPlGgnFnACKEuOcPmX00S3vKZA==
X-Google-Smtp-Source: APXvYqyOnbPgfOMw33yDfnH6MLMkOBkf+ZlWB/W5HV3EugaoH4XYvXb6WJ+pJ2x13QvShYDiTn4Izw==
X-Received: by 2002:a50:858a:: with SMTP id a10mr5677060edh.284.1567512349841;
        Tue, 03 Sep 2019 05:05:49 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id p8sm2314320ejn.25.2019.09.03.05.05.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2019 05:05:47 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id g207so13876050wmg.5
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 05:05:46 -0700 (PDT)
X-Received: by 2002:a05:600c:240a:: with SMTP id 10mr17374468wmp.113.1567512346368;
 Tue, 03 Sep 2019 05:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
 <20190802082815.GA203993@chromium.org> <1566724680.20680.8.camel@mtksdccf07>
 <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
 <1566957625.20680.33.camel@mtksdccf07> <CAAFQd5D-Yg1FjUE_rwmqfS1gvfE0=MZ=r-ziueU_37-uo9QTbw@mail.gmail.com>
 <1567424859.18318.32.camel@mtksdccf07> <CAAFQd5AGgeFbto6V1KkL0dp1QPziOKV3pWQDU2OJ+S1QKvnBdg@mail.gmail.com>
 <1567493081.18318.49.camel@mtksdccf07> <CAAFQd5DWM=R7sFHYGhhR_rXrzgRnc4xtH_t8Pig-4tcP9KTSYg@mail.gmail.com>
 <1567511169.18318.65.camel@mtksdccf07>
In-Reply-To: <1567511169.18318.65.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 3 Sep 2019 21:05:34 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DiPcUxd+R-v_-BdRx+QqZ35Riii_jpgbqr5mc3BnQvDw@mail.gmail.com>
Message-ID: <CAAFQd5DiPcUxd+R-v_-BdRx+QqZ35Riii_jpgbqr5mc3BnQvDw@mail.gmail.com>
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <Frederic.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        =?UTF-8?B?UG8tWWFuZyBIdWFuZyAo6buD5p+P6Zm9KQ==?= 
        <po-yang.huang@mediatek.com>,
        "shik@chromium.org" <shik@chromium.org>,
        "suleiman@chromium.org" <suleiman@chromium.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 3, 2019 at 8:46 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Tue, 2019-09-03 at 15:04 +0800, Tomasz Figa wrote:
> > On Tue, Sep 3, 2019 at 3:44 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > On Tue, 2019-09-03 at 13:19 +0800, Tomasz Figa wrote:
> > > > On Mon, Sep 2, 2019 at 8:47 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > >
> > > > > Hi Tomasz,
> > > > >
> > > > > On Fri, 2019-08-30 at 16:33 +0800, Tomasz Figa wrote:
> > > > > > On Wed, Aug 28, 2019 at 11:00 AM Jerry-ch Chen
> > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > >
> > > > > > > Hi Tomasz,
> > > > > > >
> > > > > > > On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> > > > > > > > Hi Jerry,
> > > > > > > >
> > > > > > > > On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Tomasz,
> > > > > > > > >
> > > > > > > > > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > > > > > > > > Hi Jerry,
> > > > > > > > > >
> > > > > > > > > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> > > > [snip]
> > > > > > > static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> > > > > > >                                   unsigned int *num_buffers,
> > > > > > >                                   unsigned int *num_planes,
> > > > > > >                                   unsigned int sizes[],
> > > > > > >                                   struct device *alloc_devs[])
> > > > > > > {
> > > > > > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > > >         struct device *dev = ctx->dev;
> > > > > > >         unsigned int size[2];
> > > > > > >
> > > > > > >         switch (vq->type) {
> > > > > > >         case V4L2_BUF_TYPE_META_CAPTURE:
> > > > > > >                 size[0] = ctx->dst_fmt.buffersize;
> > > > > > >                 break;
> > > > > > >         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > > > > > >                 size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
> > > > > > >                 if (*num_planes == 2)
> > > > > > >                         size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
> > > > > > >                 break;
> > > > > > >         }
> > > > > > >
> > > > > > >         if (*num_planes == 1) {
> > > > > > >                 if (sizes[0] < size[0])
> > > > > > >                         return -EINVAL;
> > > > > > >         } else if (*num_planes == 2) {
> > > > > > >                 if ((sizes[0] < size[0]) && (sizes[1] < size[1]))
> > > > > > >                         return -EINVAL;
> > > > > >
> > > > > > Can we just use a loop here and combine the 2 cases above?
> > > > > >
> > > > > > Also, we need to fail with -EINVAL if *num_planes is > 2.
> > > > > >
> > > > > > >         } else {
> > > > > > >                 *num_planes = 1;
> > > > > > >                 sizes[0] = size[0];
> > > > > >
> > > > > > This should be the case if *num_planes == 0 and the number of planes
> > > > > > and sizes should match the currently active format.
> > > > > >
> > > > > I appreciate your comments,
> > > > >
> > > > > Ok, I will update as following:
> > > > > static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> > > > >                                   unsigned int *num_buffers,
> > > > >                                   unsigned int *num_planes,
> > > > >                                   unsigned int sizes[],
> > > > >                                   struct device *alloc_devs[])
> > > > > {
> > > > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > >         unsigned int size[2];
> > > > >         unsigned int plane;
> > > > >
> > > > >         switch (vq->type) {
> > > > >         case V4L2_BUF_TYPE_META_CAPTURE:
> > > > >                 size[0] = ctx->dst_fmt.buffersize;
> > > > >                 break;
> > > > >         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > > > >                 size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
> > > > >                 if (*num_planes == 2)
> > > > >                         size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
> > > > >                 break;
> > > > >         }
> > > > >
> > > > >         if (*num_planes > 2)
> > > > >                 return -EINVAL;
> > > > >         if (*num_planes == 0) {
> > > > >                 if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
> > > > >                         sizes[0] = ctx->dst_fmt.buffersize;
> > > > >                         *num_planes = 1;
> > > > >                         return 0;
> > > > >                 }
> > > > >
> > > > >                 *num_planes = ctx->src_fmt.num_planes;
> > > > >                 for (plane = 0; plane < *num_planes; plane++)
> > > > >                         sizes[plane] = ctx->src_fmt.plane_fmt[plane].sizeimage;
> > > > >                 return 0;
> > > > >         }
> > > > >
> > > > >         for (plane = 0; plane < *num_planes; plane++) {
> > > > >                 if(sizes[plane] < size[plane])
> > > > >                         return -EINVAL;
> > > > >         }
> > > > >         return 0;
> > > > > }
> > > > >
> > > >
> > > > Looks good, thanks!
> > > >
> > > > > > >         }
> > > > > > >
> > > > > > >         return 0;
> > > > > > > }
> > > > > > >
> > > > > > > > [snip]
> > > > > > > >
> > > > > > > > > > > +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > > > > > > > +{
> > > > > > > > > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > > > > > > > +   struct vb2_buffer *vb;
> > > > > > > > > >
> > > > > > > > > > How do we guarantee here that the hardware isn't still accessing the buffers
> > > > > > > > > > removed below?
> > > > > > > > > >
> > > > > > > > > Maybe we can check the driver state flag and aborting the unfinished
> > > > > > > > > jobs?
> > > > > > > > > (fd_hw->state == FD_ENQ)
> > > > > > > > >
> > > > > > > >
> > > > > > > > Yes, we need to either cancel or wait for the currently processing
> > > > > > > > job. It depends on hardware capabilities, but cancelling is generally
> > > > > > > > preferred for the lower latency.
> > > > > > > >
> > > > > > > Ok, it the state is ENQ, then we can disable the FD hw by controlling
> > > > > > > the registers.
> > > > > > >
> > > > > > > for example:
> > > > > > >         writel(0x0, fd->fd_base + FD_HW_ENABLE);
> > > > > > >         writel(0x0, fd->fd_base + FD_INT_EN);
> > > > > > >
> > > > > >
> > > > > > What's exactly the effect of writing 0 to FD_HW_ENABLE?
> > > > > >
> > > > > Sorry, my last reply didn't solve the question,
> > > > > we should implement a mtk_fd_job_abort() for v4l2_m2m_ops().
> > > > >
> > > > > which is able to readl_poll_timeout_atomic()
> > > > > and check the HW busy bits in the register FD_INT_EN;
> > > > >
> > > > > if they are not cleared until timeout, we could handle the last
> > > > > processing job.
> > > > > Otherwise, the FD irq handler should have handled the last processing
> > > > > job and we could continue the stop_streaming().
> > > > >
> > > > > For job_abort():
> > > > > static void mtk_fd_job_abort(void *priv)
> > > > > {
> > > > >         struct mtk_fd_ctx *ctx = priv;
> > > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > > >         u32 val;
> > > > >         u32 ret;
> > > > >
> > > > >         ret = readl_poll_timeout_atomic(fd->fd_base + MTK_FD_REG_OFFSET_INT_EN,
> > > > >                                         val,
> > > > >                                         (val & MTK_FD_HW_BUSY_MASK) ==
> > > > >                                         MTK_FD_HW_STATE_IS_BUSY,
> > > > >                                         USEC_PER_MSEC, MTK_FD_STOP_HW_TIMEOUT);
> > > >
> > > > Hmm, would it be possible to avoid the busy wait by having a
> > > > completion that could be signalled from the interrupt handler?
> > > >
> > > > Best regards,
> > > > Tomasz
> > >
> > > I suppose that would be wakeup a wait queue in the interrupt handler,
> > > the the wait_event_interrupt_timeout() will be used in here and system
> > > suspend e.g. mtk_fd_suspend().
> >
> > Yes, that should work.
> >
> > > Or do you suggest to wait_event_interrupt_timeout() every frame in the
> > > mtk_fd_ipi_handler()?
> >
> > Nope, we shouldn't need that.
> >
> > > I think maybe the readl_poll_timeout_atomic would be good enough.
> > >
> >
> > Not really. Busy waiting should be avoided as much as possible. What's
> > the point of entering suspend if you end up burning the power by
> > spinning the CPU for some milliseconds?
> >
> Ok, I see, busy waiting is not a good idea, I will use the wait queue
> instead. the job abort will refine as following:
>
> static void mtk_fd_job_abort(void *priv)
> {
>         struct mtk_fd_ctx *ctx = priv;
>         struct mtk_fd_dev *fd = ctx->fd_dev;
>         u32 ret;
>
>         ret = wait_event_interruptible_timeout
>                 (fd->wq, (fd->fd_irq_result & MTK_FD_HW_IRQ_MASK),
>                  usecs_to_jiffies(50000));
>         if (ret)
>                 mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
>         dev_dbg(fd->dev, "%s, ret:%d\n", __func__, ret);
>
>         fd->fd_irq_result = 0;
> }
>
> static struct v4l2_m2m_ops fd_m2m_ops = {
>         .device_run = mtk_fd_device_run,
>         .job_abort = mtk_fd_job_abort,

I'm not sure we should be using the functon above as the .job_abort
callback. It's expected to abort the job, but we're just waiting for
it to finish. I think we should just call mtk_fd_job_abort() manually
from .stop_streaming.

> };
>
> and we could use it in suspend.
> static int mtk_fd_suspend(struct device *dev)
> {
>         struct mtk_fd_dev *fd = dev_get_drvdata(dev);
>
>         if (pm_runtime_suspended(dev))
>                 return 0;
>
>         if (fd->fd_stream_count)
>                 mtk_fd_job_abort(fd->ctx);
>
>         /* suspend FD HW */
>         writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
>         writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
>         clk_disable_unprepare(fd->fd_clk);
>         dev_dbg(dev, "%s:disable clock\n", __func__);
>
>         return 0;
> }
>
> static irqreturn_t mtk_fd_irq(int irq, void *data)
> {
>         struct mtk_fd_dev *fd = (struct mtk_fd_dev *)data;
>
>         fd->fd_irq_result = readl(fd->fd_base + MTK_FD_REG_OFFSET_INT_VAL);
>         wake_up_interruptible(&fd->wq);

The wake up should be done at the very end of this function. Otherwise
we end up with m2m framework racing with the mtk_fd_hw_job_finish()
below.

Also, I'd use a completion here rather than an open coded wait and
wake-up. The driver could reinit_completion() before queuing a job to
the hardware and the IRQ handler would complete(). There would be no
need to store the IRQ flags in driver data anymore.

>         fd->output->number = readl(fd->fd_base + MTK_FD_REG_OFFSET_RESULT);
>         dev_dbg(fd->dev, "mtk_fd_face_num:%d\n", fd->output->number);
>
>         pm_runtime_put((fd->dev));
>         mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_DONE);
>         return IRQ_HANDLED;
> }
> > >
> > > One more thing, for the mtk_fd_video_device_register()
> > > Sorry that I would need to use intermediate variable here since the 80
> > > columns check.
> > >
> > >         function = MEDIA_ENT_F_PROC_VIDEO_STATISTICS;
> > >         ret = v4l2_m2m_register_media_controller(m2m_dev, vfd, function);
> >
> > Why not just make it like this:
> >
> > ret = v4l2_m2m_register_media_controller(m2m_dev,
> >                 MEDIA_ENT_F_PROC_VIDEO_STATISTICS);
> >
> > The above line is aligned using tabs so that its end is as close to
> > the 80 character boundary as possible.
> >
> I tried but the checkpatch script still gave me a check saying align to
> the scope, I will refine as following:
>
>         ret = v4l2_m2m_register_media_controller
>                 (m2m_dev, vfd, MEDIA_ENT_F_PROC_VIDEO_STATISTICS);

Please ignore that checkpatch warning, it sometimes gives false
positives. The above looks clearly worse and less consistent with
kernel coding style than what I suggested.

Best regards,
Tomasz
