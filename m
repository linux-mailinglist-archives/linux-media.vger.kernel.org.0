Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFDCAA7998
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 06:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfIDEPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 00:15:23 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35604 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfIDEPW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 00:15:22 -0400
Received: by mail-ed1-f68.google.com with SMTP id t50so21051081edd.2
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 21:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q5y8opnX2BroSXjeQvIIpMYdtoQXE/i3qwOw+SgBMWc=;
        b=iYDRBf8+vO0Fifjo9hD461k+SooWnhbGjeBijRzwO6XmFh5LjRuA5meKxXnqc3+lPO
         2bnXk3QfBL1s04WFgseoqXQzmYznzmlEnHDCV9l3HsYfJkOdIlfLSjj6Pga09gXpv1PK
         73U8I3amxAhgx96sNaNy/UuCZIabceJbnVo+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q5y8opnX2BroSXjeQvIIpMYdtoQXE/i3qwOw+SgBMWc=;
        b=tjCuh02gue+yH+gUYK5NUpUi4AL+kpqBdW/g9Rq2s4Nxnk5QuLmHf0T/fihuPWT6bQ
         6GSBJF1BxwBFTmWfAjznuk0uvxtIJb/5uX0pO3XP2bvzppRb9cVrn5SAc8pRgunATei6
         nie4sKw2c4KiSk5tPGU3IpLxih0flHDM9S2XM0B0AJqANCK3R6bLRM+O+CNFZwh8TUWE
         37fdB8SU4nc8JJ8HV3+0XrRbOLdrzYVBvbDdIF98EpJg2i9dgbL3FgAtYtcpm5vPEaC7
         /w/2BsTyxUmme1C7BL0uuyuqxyRCSpK3ucE6GthnkVarux596B+YIg81Ff+Km4b+Yg2F
         x9UQ==
X-Gm-Message-State: APjAAAWENwWPv/xU4Mb8f/3iGqtTprRQoZlH01CvatlBf7dB0NTNnZB5
        Ra913uuZZ93Xb0YU6We6EGvStG0BvHoPxA==
X-Google-Smtp-Source: APXvYqwu2IQJwsJy3JBTbAqepKmBCAzbyL9pvv6EQq8ElX5uqEPh1yyPPPt8HYkFHRr6fLgbYy2xFQ==
X-Received: by 2002:a17:906:4a19:: with SMTP id w25mr10323846eju.239.1567570520221;
        Tue, 03 Sep 2019 21:15:20 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id ga12sm322788ejb.40.2019.09.03.21.15.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2019 21:15:18 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id u16so19628268wrr.0
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 21:15:18 -0700 (PDT)
X-Received: by 2002:a5d:6585:: with SMTP id q5mr14990028wru.162.1567570518232;
 Tue, 03 Sep 2019 21:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
 <20190802082815.GA203993@chromium.org> <1566724680.20680.8.camel@mtksdccf07>
 <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
 <1566957625.20680.33.camel@mtksdccf07> <CAAFQd5D-Yg1FjUE_rwmqfS1gvfE0=MZ=r-ziueU_37-uo9QTbw@mail.gmail.com>
 <1567424859.18318.32.camel@mtksdccf07> <CAAFQd5AGgeFbto6V1KkL0dp1QPziOKV3pWQDU2OJ+S1QKvnBdg@mail.gmail.com>
 <1567493081.18318.49.camel@mtksdccf07> <CAAFQd5DWM=R7sFHYGhhR_rXrzgRnc4xtH_t8Pig-4tcP9KTSYg@mail.gmail.com>
 <1567511169.18318.65.camel@mtksdccf07> <CAAFQd5DiPcUxd+R-v_-BdRx+QqZ35Riii_jpgbqr5mc3BnQvDw@mail.gmail.com>
 <1567568281.18318.80.camel@mtksdccf07>
In-Reply-To: <1567568281.18318.80.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 4 Sep 2019 13:15:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CRC2cyV30B4Qv59HdrJ7Cpe_yK5aY-BecQQ3J3i0PtCQ@mail.gmail.com>
Message-ID: <CAAFQd5CRC2cyV30B4Qv59HdrJ7Cpe_yK5aY-BecQQ3J3i0PtCQ@mail.gmail.com>
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

On Wed, Sep 4, 2019 at 12:38 PM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Tue, 2019-09-03 at 20:05 +0800, Tomasz Figa wrote:
> > On Tue, Sep 3, 2019 at 8:46 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Tue, 2019-09-03 at 15:04 +0800, Tomasz Figa wrote:
> > > > On Tue, Sep 3, 2019 at 3:44 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > >
> > > > > On Tue, 2019-09-03 at 13:19 +0800, Tomasz Figa wrote:
> > > > > > On Mon, Sep 2, 2019 at 8:47 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > >
> > > > > > > Hi Tomasz,
> > > > > > >
> > > > > > > On Fri, 2019-08-30 at 16:33 +0800, Tomasz Figa wrote:
> > > > > > > > On Wed, Aug 28, 2019 at 11:00 AM Jerry-ch Chen
> > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Tomasz,
> > > > > > > > >
> > > > > > > > > On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> > > > > > > > > > Hi Jerry,
> > > > > > > > > >
> > > > > > > > > > On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> > > > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > >
> > > > > > > > > > > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > Hi Jerry,
> > > > > > > > > > > >
> > > > > > > > > > > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> [snip]
> > > > > > > > > > [snip]
> > > > > > > > > >
> > > > > > > > > > > > > +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > > > > > > > > > +{
> > > > > > > > > > > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > > > > > > > > > +   struct vb2_buffer *vb;
> > > > > > > > > > > >
> > > > > > > > > > > > How do we guarantee here that the hardware isn't still accessing the buffers
> > > > > > > > > > > > removed below?
> > > > > > > > > > > >
> > > > > > > > > > > Maybe we can check the driver state flag and aborting the unfinished
> > > > > > > > > > > jobs?
> > > > > > > > > > > (fd_hw->state == FD_ENQ)
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Yes, we need to either cancel or wait for the currently processing
> > > > > > > > > > job. It depends on hardware capabilities, but cancelling is generally
> > > > > > > > > > preferred for the lower latency.
> > > > > > > > > >
> > > > > > > > > Ok, it the state is ENQ, then we can disable the FD hw by controlling
> > > > > > > > > the registers.
> > > > > > > > >
> > > > > > > > > for example:
> > > > > > > > >         writel(0x0, fd->fd_base + FD_HW_ENABLE);
> > > > > > > > >         writel(0x0, fd->fd_base + FD_INT_EN);
> > > > > > > > >
> > > > > > > >
> > > > > > > > What's exactly the effect of writing 0 to FD_HW_ENABLE?
> > > > > > > >
> > > > > > > Sorry, my last reply didn't solve the question,
> > > > > > > we should implement a mtk_fd_job_abort() for v4l2_m2m_ops().
> > > > > > >
> > > > > > > which is able to readl_poll_timeout_atomic()
> > > > > > > and check the HW busy bits in the register FD_INT_EN;
> > > > > > >
> > > > > > > if they are not cleared until timeout, we could handle the last
> > > > > > > processing job.
> > > > > > > Otherwise, the FD irq handler should have handled the last processing
> > > > > > > job and we could continue the stop_streaming().
> > > > > > >
> > > > > > > For job_abort():
> > > > > > > static void mtk_fd_job_abort(void *priv)
> > > > > > > {
> > > > > > >         struct mtk_fd_ctx *ctx = priv;
> > > > > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > > > > >         u32 val;
> > > > > > >         u32 ret;
> > > > > > >
> > > > > > >         ret = readl_poll_timeout_atomic(fd->fd_base + MTK_FD_REG_OFFSET_INT_EN,
> > > > > > >                                         val,
> > > > > > >                                         (val & MTK_FD_HW_BUSY_MASK) ==
> > > > > > >                                         MTK_FD_HW_STATE_IS_BUSY,
> > > > > > >                                         USEC_PER_MSEC, MTK_FD_STOP_HW_TIMEOUT);
> > > > > >
> > > > > > Hmm, would it be possible to avoid the busy wait by having a
> > > > > > completion that could be signalled from the interrupt handler?
> > > > > >
> > > > > > Best regards,
> > > > > > Tomasz
> > > > >
> > > > > I suppose that would be wakeup a wait queue in the interrupt handler,
> > > > > the the wait_event_interrupt_timeout() will be used in here and system
> > > > > suspend e.g. mtk_fd_suspend().
> > > >
> > > > Yes, that should work.
> > > >
> > > > > Or do you suggest to wait_event_interrupt_timeout() every frame in the
> > > > > mtk_fd_ipi_handler()?
> > > >
> > > > Nope, we shouldn't need that.
> > > >
> > > > > I think maybe the readl_poll_timeout_atomic would be good enough.
> > > > >
> > > >
> > > > Not really. Busy waiting should be avoided as much as possible. What's
> > > > the point of entering suspend if you end up burning the power by
> > > > spinning the CPU for some milliseconds?
> > > >
> > > Ok, I see, busy waiting is not a good idea, I will use the wait queue
> > > instead. the job abort will refine as following:
> > >
> > > static void mtk_fd_job_abort(void *priv)
> > > {
> > >         struct mtk_fd_ctx *ctx = priv;
> > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > >         u32 ret;
> > >
> > >         ret = wait_event_interruptible_timeout
> > >                 (fd->wq, (fd->fd_irq_result & MTK_FD_HW_IRQ_MASK),
> > >                  usecs_to_jiffies(50000));
> > >         if (ret)
> > >                 mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> > >         dev_dbg(fd->dev, "%s, ret:%d\n", __func__, ret);
> > >
> > >         fd->fd_irq_result = 0;
> > > }
> > >
> > > static struct v4l2_m2m_ops fd_m2m_ops = {
> > >         .device_run = mtk_fd_device_run,
> > >         .job_abort = mtk_fd_job_abort,
> >
> > I'm not sure we should be using the functon above as the .job_abort
> > callback. It's expected to abort the job, but we're just waiting for
> > it to finish. I think we should just call mtk_fd_job_abort() manually
> > from .stop_streaming.
> >
>
> Ok, I will fix it.
>
> > > };
> > >
> > > and we could use it in suspend.
> > > static int mtk_fd_suspend(struct device *dev)
> > > {
> > >         struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> > >
> > >         if (pm_runtime_suspended(dev))
> > >                 return 0;
> > >
> > >         if (fd->fd_stream_count)
> > >                 mtk_fd_job_abort(fd->ctx);
> > >
> > >         /* suspend FD HW */
> > >         writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
> > >         writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
> > >         clk_disable_unprepare(fd->fd_clk);
> > >         dev_dbg(dev, "%s:disable clock\n", __func__);
> > >
> > >         return 0;
> > > }
> > >
> > > static irqreturn_t mtk_fd_irq(int irq, void *data)
> > > {
> > >         struct mtk_fd_dev *fd = (struct mtk_fd_dev *)data;
> > >
> > >         fd->fd_irq_result = readl(fd->fd_base + MTK_FD_REG_OFFSET_INT_VAL);
> > >         wake_up_interruptible(&fd->wq);
> >
> > The wake up should be done at the very end of this function. Otherwise
> > we end up with m2m framework racing with the mtk_fd_hw_job_finish()
> > below.
> >
> > Also, I'd use a completion here rather than an open coded wait and
> > wake-up. The driver could reinit_completion() before queuing a job to
> > the hardware and the IRQ handler would complete(). There would be no
> > need to store the IRQ flags in driver data anymore.
> Ok, It will be refined as following:
>
> suspend and stop streaming will call mtk_fd_job_abort()
>
> static void mtk_fd_job_abort(struct mtk_fd_dev *fd)
> {
>         u32 ret;
>
>         ret = wait_for_completion_timeout(&fd->fd_irq_done,
>                                           msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
>         if (ret)

For the _timeout variants, !ret means the timeout and ret > 0 means
that the wait ended successfully before.

Also please make sure that the timeout is big enough not to happen
normally on a heavily loaded system. Something like 1 second should be
good.

>                 mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> }
>
> complete at irq handler
>
> static irqreturn_t mtk_fd_irq(int irq, void *data)
> {
>         struct mtk_fd_dev *fd = (struct mtk_fd_dev *)data;
>
>         /* must read this register otherwise HW will keep sending irq */
>         readl(fd->fd_base + MTK_FD_REG_OFFSET_INT_VAL);
>         fd->output->number = readl(fd->fd_base + MTK_FD_REG_OFFSET_RESULT);
>         dev_dbg(fd->dev, "mtk_fd_face_num:%d\n", fd->output->number);
>
>         pm_runtime_put((fd->dev));
>         mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_DONE);
>         complete(&fd->fd_irq_done);
>         return IRQ_HANDLED;
> }
>
> and reinit_completion before time before sending a job to HW
>
> static int mtk_fd_hw_job_exec(struct mtk_fd_dev *fd,
>                               struct fd_enq_param *fd_param)
> {
>         struct ipi_message fd_ipi_msg;
>         int ret;
>
>         pm_runtime_get_sync((fd->dev));
>
>         reinit_completion(&fd->fd_irq_done);
>         fd_ipi_msg.cmd_id = MTK_FD_IPI_CMD_ENQUEUE;
>         memcpy(&fd_ipi_msg.fd_enq_param, fd_param, sizeof(struct
> fd_enq_param));
>         ret = scp_ipi_send(fd->scp_pdev, SCP_IPI_FD_CMD, &fd_ipi_msg,
>                            sizeof(fd_ipi_msg), MTK_FD_IPI_SEND_TIMEOUT);
>         if (ret) {
>                 pm_runtime_put((fd->dev));
>                 mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
>                 return ret;
>         }
>         return 0;
> }

Looks good, thanks. Please also don't forget about init_completion()
in driver probe.

Best regards,
Tomasz
