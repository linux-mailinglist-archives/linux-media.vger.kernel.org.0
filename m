Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36907A7EC5
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 11:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729251AbfIDJES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 05:04:18 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36786 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfIDJER (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 05:04:17 -0400
Received: by mail-ed1-f68.google.com with SMTP id g24so21717348edu.3
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2019 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SlDNtvqTlkGND+OCwOrEAc9WxGs6zVmm0CCR8hqfXtY=;
        b=emVBmdVn3njvoS0f5ToN11EX9aUXnklC3C3insakwJUhhJdsrlTeLOXf+xKsRDQphe
         wZAsgkupoxnLiP2Q2s7z0/0dh2FqGDSeHmBaBvWy6BY3nz2HDBycedrYQKfZczVihSFP
         aMax4R7LJc6TtXP/f0klf6tm1yXNU3UjFRWfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SlDNtvqTlkGND+OCwOrEAc9WxGs6zVmm0CCR8hqfXtY=;
        b=bevrQn/aBYzHBEiJKD/h4Yg0KWhprknKkmBKT882A/TNvd04H/dLR56e7bSi+ckl6R
         UxIjzmC9LozC5jE1tDNPRRboOEzw0QOQGF3gAlJQD5T6b+kGIEPDHRzwtKdYO34HdyEH
         rA7GWjA4Q/eBYf/UXUqBVDHA6Y0BT+7WMSf7WaZRKO2mCCzbn+eu6EkT67OxQOScx1t0
         WK9HBhjzXHlaEFLEkuwBqrv3qEdxkKScz+ehcTAPkDLEM9E5DZHuY1wF+N+u8gMprHU4
         sGN/lraoRqcNbBMlz2h/UxNhd3Vzg1XkOBq5YMc55xehIWj38Wrs0wzxd4QGvQFML0o2
         krhg==
X-Gm-Message-State: APjAAAX3/IKiaD7E1H+HerQaM40UmMR0hF4osuhQlwCbC7ZPbm5Da56W
        S/JSLWjgrzAzYhO0sY+oYxxJgFrfDspO0A==
X-Google-Smtp-Source: APXvYqzn6aWz06zKO9Uu3KRt9Lza+SEvE7Y7ZerpApwEnqTUXppMZK4KUyWS+GDK+ADPtKA0bOiOJA==
X-Received: by 2002:a50:f09d:: with SMTP id v29mr7110919edl.4.1567587853289;
        Wed, 04 Sep 2019 02:04:13 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id q10sm2638436ejt.54.2019.09.04.02.04.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 02:04:12 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id q12so890397wmj.4
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2019 02:04:11 -0700 (PDT)
X-Received: by 2002:a05:600c:240a:: with SMTP id 10mr3651794wmp.113.1567587851370;
 Wed, 04 Sep 2019 02:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
 <20190802082815.GA203993@chromium.org> <1566724680.20680.8.camel@mtksdccf07>
 <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
 <1566957625.20680.33.camel@mtksdccf07> <CAAFQd5D-Yg1FjUE_rwmqfS1gvfE0=MZ=r-ziueU_37-uo9QTbw@mail.gmail.com>
 <1567424859.18318.32.camel@mtksdccf07> <CAAFQd5AGgeFbto6V1KkL0dp1QPziOKV3pWQDU2OJ+S1QKvnBdg@mail.gmail.com>
 <1567493081.18318.49.camel@mtksdccf07> <CAAFQd5DWM=R7sFHYGhhR_rXrzgRnc4xtH_t8Pig-4tcP9KTSYg@mail.gmail.com>
 <1567511169.18318.65.camel@mtksdccf07> <CAAFQd5DiPcUxd+R-v_-BdRx+QqZ35Riii_jpgbqr5mc3BnQvDw@mail.gmail.com>
 <1567568281.18318.80.camel@mtksdccf07> <CAAFQd5CRC2cyV30B4Qv59HdrJ7Cpe_yK5aY-BecQQ3J3i0PtCQ@mail.gmail.com>
 <1567577389.18318.100.camel@mtksdccf07> <CAAFQd5AxTQPD+nP9CJs45QTzGHKssjv3vRtMqHONABfp12afYw@mail.gmail.com>
 <1567584577.22453.11.camel@mtksdccf07> <CAAFQd5Dzxy10g-MKHMnNbVO6kp9_L_jm1m+gtN+p=YF2LyBiag@mail.gmail.com>
 <1567587708.22453.15.camel@mtksdccf07>
In-Reply-To: <1567587708.22453.15.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 4 Sep 2019 18:03:59 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DWfEEiGthPi=qoxD-mpAWa68GOCi55mqpmagS-tsGYkA@mail.gmail.com>
Message-ID: <CAAFQd5DWfEEiGthPi=qoxD-mpAWa68GOCi55mqpmagS-tsGYkA@mail.gmail.com>
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

On Wed, Sep 4, 2019 at 6:02 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Wed, 2019-09-04 at 16:25 +0800, Tomasz Figa wrote:
> > On Wed, Sep 4, 2019 at 5:09 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Wed, 2019-09-04 at 14:34 +0800, Tomasz Figa wrote:
> > > > On Wed, Sep 4, 2019 at 3:09 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > >
> > > > > Hi Tomasz,
> > > > >
> > > > > On Wed, 2019-09-04 at 12:15 +0800, Tomasz Figa wrote:
> > > > > > On Wed, Sep 4, 2019 at 12:38 PM Jerry-ch Chen
> > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > >
> > > > > > > Hi Tomasz,
> > > > > > >
> > > > > > > On Tue, 2019-09-03 at 20:05 +0800, Tomasz Figa wrote:
> > > > > > > > On Tue, Sep 3, 2019 at 8:46 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Tomasz,
> > > > > > > > >
> > > > > > > > > On Tue, 2019-09-03 at 15:04 +0800, Tomasz Figa wrote:
> > > > > > > > > > On Tue, Sep 3, 2019 at 3:44 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Tue, 2019-09-03 at 13:19 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > On Mon, Sep 2, 2019 at 8:47 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Fri, 2019-08-30 at 16:33 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > On Wed, Aug 28, 2019 at 11:00 AM Jerry-ch Chen
> > > > > > > > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > Hi Jerry,
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> > > > > > > > > > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > > > Hi Jerry,
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> > > > > > > [snip]
> > > > > > > > > > > > > > > > [snip]
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > > > > > > > > > > > > > > > +   struct vb2_buffer *vb;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > How do we guarantee here that the hardware isn't still accessing the buffers
> > > > > > > > > > > > > > > > > > removed below?
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Maybe we can check the driver state flag and aborting the unfinished
> > > > > > > > > > > > > > > > > jobs?
> > > > > > > > > > > > > > > > > (fd_hw->state == FD_ENQ)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Yes, we need to either cancel or wait for the currently processing
> > > > > > > > > > > > > > > > job. It depends on hardware capabilities, but cancelling is generally
> > > > > > > > > > > > > > > > preferred for the lower latency.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Ok, it the state is ENQ, then we can disable the FD hw by controlling
> > > > > > > > > > > > > > > the registers.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > for example:
> > > > > > > > > > > > > > >         writel(0x0, fd->fd_base + FD_HW_ENABLE);
> > > > > > > > > > > > > > >         writel(0x0, fd->fd_base + FD_INT_EN);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > What's exactly the effect of writing 0 to FD_HW_ENABLE?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > Sorry, my last reply didn't solve the question,
> > > > > > > > > > > > > we should implement a mtk_fd_job_abort() for v4l2_m2m_ops().
> > > > > > > > > > > > >
> > > > > > > > > > > > > which is able to readl_poll_timeout_atomic()
> > > > > > > > > > > > > and check the HW busy bits in the register FD_INT_EN;
> > > > > > > > > > > > >
> > > > > > > > > > > > > if they are not cleared until timeout, we could handle the last
> > > > > > > > > > > > > processing job.
> > > > > > > > > > > > > Otherwise, the FD irq handler should have handled the last processing
> > > > > > > > > > > > > job and we could continue the stop_streaming().
> > > > > > > > > > > > >
> > > > > > > > > > > > > For job_abort():
> > > > > > > > > > > > > static void mtk_fd_job_abort(void *priv)
> > > > > > > > > > > > > {
> > > > > > > > > > > > >         struct mtk_fd_ctx *ctx = priv;
> > > > > > > > > > > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > > > > > > > > > > >         u32 val;
> > > > > > > > > > > > >         u32 ret;
> > > > > > > > > > > > >
> > > > > > > > > > > > >         ret = readl_poll_timeout_atomic(fd->fd_base + MTK_FD_REG_OFFSET_INT_EN,
> > > > > > > > > > > > >                                         val,
> > > > > > > > > > > > >                                         (val & MTK_FD_HW_BUSY_MASK) ==
> > > > > > > > > > > > >                                         MTK_FD_HW_STATE_IS_BUSY,
> > > > > > > > > > > > >                                         USEC_PER_MSEC, MTK_FD_STOP_HW_TIMEOUT);
> > > > > > > > > > > >
> > > > > > > > > > > > Hmm, would it be possible to avoid the busy wait by having a
> > > > > > > > > > > > completion that could be signalled from the interrupt handler?
> > > > > > > > > > > >
> > > > > > > > > > > > Best regards,
> > > > > > > > > > > > Tomasz
> > > > > > > > > > >
> > > > > > > > > > > I suppose that would be wakeup a wait queue in the interrupt handler,
> > > > > > > > > > > the the wait_event_interrupt_timeout() will be used in here and system
> > > > > > > > > > > suspend e.g. mtk_fd_suspend().
> > > > > > > > > >
> > > > > > > > > > Yes, that should work.
> > > > > > > > > >
> > > > > > > > > > > Or do you suggest to wait_event_interrupt_timeout() every frame in the
> > > > > > > > > > > mtk_fd_ipi_handler()?
> > > > > > > > > >
> > > > > > > > > > Nope, we shouldn't need that.
> > > > > > > > > >
> > > > > > > > > > > I think maybe the readl_poll_timeout_atomic would be good enough.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Not really. Busy waiting should be avoided as much as possible. What's
> > > > > > > > > > the point of entering suspend if you end up burning the power by
> > > > > > > > > > spinning the CPU for some milliseconds?
> > > > > > > > > >
> > > > > > > > > Ok, I see, busy waiting is not a good idea, I will use the wait queue
> > > > > > > > > instead. the job abort will refine as following:
> > > > > > > > >
> > > > > > > > > static void mtk_fd_job_abort(void *priv)
> > > > > > > > > {
> > > > > > > > >         struct mtk_fd_ctx *ctx = priv;
> > > > > > > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > > > > > > >         u32 ret;
> > > > > > > > >
> > > > > > > > >         ret = wait_event_interruptible_timeout
> > > > > > > > >                 (fd->wq, (fd->fd_irq_result & MTK_FD_HW_IRQ_MASK),
> > > > > > > > >                  usecs_to_jiffies(50000));
> > > > > > > > >         if (ret)
> > > > > > > > >                 mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> > > > > > > > >         dev_dbg(fd->dev, "%s, ret:%d\n", __func__, ret);
> > > > > > > > >
> > > > > > > > >         fd->fd_irq_result = 0;
> > > > > > > > > }
> > > > > > > > >
> > > > > > > > > static struct v4l2_m2m_ops fd_m2m_ops = {
> > > > > > > > >         .device_run = mtk_fd_device_run,
> > > > > > > > >         .job_abort = mtk_fd_job_abort,
> > > > > > > >
> > > > > > > > I'm not sure we should be using the functon above as the .job_abort
> > > > > > > > callback. It's expected to abort the job, but we're just waiting for
> > > > > > > > it to finish. I think we should just call mtk_fd_job_abort() manually
> > > > > > > > from .stop_streaming.
> > > > > > > >
> > > > > > >
> > > > > > > Ok, I will fix it.
> > > > > > >
> > > > > > > > > };
> > > > > > > > >
> > > > > > > > > and we could use it in suspend.
> > > > > > > > > static int mtk_fd_suspend(struct device *dev)
> > > > > > > > > {
> > > > > > > > >         struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> > > > > > > > >
> > > > > > > > >         if (pm_runtime_suspended(dev))
> > > > > > > > >                 return 0;
> > > > > > > > >
> > > > > > > > >         if (fd->fd_stream_count)
> > > > > > > > >                 mtk_fd_job_abort(fd->ctx);
> > > > > > > > >
> > > > > > > > >         /* suspend FD HW */
> > > > > > > > >         writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
> > > > > > > > >         writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
> > > > > > > > >         clk_disable_unprepare(fd->fd_clk);
> > > > > > > > >         dev_dbg(dev, "%s:disable clock\n", __func__);
> > > > > > > > >
> > > > > > > > >         return 0;
> > > > > > > > > }
> > > > > > > > >
> > > > > > > > > static irqreturn_t mtk_fd_irq(int irq, void *data)
> > > > > > > > > {
> > > > > > > > >         struct mtk_fd_dev *fd = (struct mtk_fd_dev *)data;
> > > > > > > > >
> > > > > > > > >         fd->fd_irq_result = readl(fd->fd_base + MTK_FD_REG_OFFSET_INT_VAL);
> > > > > > > > >         wake_up_interruptible(&fd->wq);
> > > > > > > >
> > > > > > > > The wake up should be done at the very end of this function. Otherwise
> > > > > > > > we end up with m2m framework racing with the mtk_fd_hw_job_finish()
> > > > > > > > below.
> > > > > > > >
> > > > > > > > Also, I'd use a completion here rather than an open coded wait and
> > > > > > > > wake-up. The driver could reinit_completion() before queuing a job to
> > > > > > > > the hardware and the IRQ handler would complete(). There would be no
> > > > > > > > need to store the IRQ flags in driver data anymore.
> > > > > > > Ok, It will be refined as following:
> > > > > > >
> > > > > > > suspend and stop streaming will call mtk_fd_job_abort()
> > > > > > >
> > > > > > > static void mtk_fd_job_abort(struct mtk_fd_dev *fd)
> > > > > > > {
> > > > > > >         u32 ret;
> > > > > > >
> > > > > > >         ret = wait_for_completion_timeout(&fd->fd_irq_done,
> > > > > > >                                           msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
> > > > > > >         if (ret)
> > > > > >
> > > > > > For the _timeout variants, !ret means the timeout and ret > 0 means
> > > > > > that the wait ended successfully before.
> > > > > >
> > > > > Thanks, fixed.
> > > > >
> > > > > > Also please make sure that the timeout is big enough not to happen
> > > > > > normally on a heavily loaded system. Something like 1 second should be
> > > > > > good.
> > > > > >
> > > > > Ok, I will make it 1 second
> > > > > #define MTK_FD_HW_TIMEOUT 1000
> > > > >
> > > > > Also, I will add a condition in mtk_fd_vb2_stop_streaming(), since it
> > > > > would be called twice, now it works fine whether I reuse the condition
> > > > > with mtk_fd_hw_disconnect or not, however, I think do it before buffer
> > > > > remove looks more reasonable.
> > > > >
> > > > > static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > {
> > > > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > > >         struct vb2_v4l2_buffer *vb;
> > > > >         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > > > >         struct v4l2_m2m_queue_ctx *queue_ctx;
> > > > >
> > > > >         if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > > > >                 mtk_fd_job_abort(fd);
> > > >
> > > > We need to do it regardless of the queue type, otherwise we could
> > > > still free CAPTURE buffers before the hardware releases them.
> > > >
> > >
> > > I think we may read the fd->fd_irq_done.done and do wait for completion
> > > if it's not being done.
> > > How do you think?
> > >
> > > static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > {
> > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > >         struct vb2_v4l2_buffer *vb;
> > >         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > >         struct v4l2_m2m_queue_ctx *queue_ctx;
> > >         u32 ret;
> > >
> > >         if (!fd->fd_irq_done.done)
> >
> > We shouldn't access internal fields of completion.
> >
> > >                 ret = wait_for_completion_timeout(&fd->fd_irq_done,
> > >                                                   msecs_to_jiffies(
> > >                                                         MTK_FD_HW_TIMEOUT));
> > >         queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ?
> > >                                         &m2m_ctx->out_q_ctx :
> > >                                         &m2m_ctx->cap_q_ctx;
> > >         while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
> > >                 v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> > >
> > >         if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > >                 mtk_fd_hw_disconnect(fd);
> > > }
> > >
> > > I've also tried to wait completion unconditionally for both queues and
> > > the second time will wait until timeout, as a result, it takes longer to
> > > swap the camera every time and close the camera app.
> >
> > I think it should work better if we call complete_all() instead of complete().
> >
> Thanks,
>
> I use complete_all(), and it works fine now.
>
> static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> {
>         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
>         struct mtk_fd_dev *fd = ctx->fd_dev;
>         struct vb2_v4l2_buffer *vb;
>         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>         struct v4l2_m2m_queue_ctx *queue_ctx;
>
>         wait_for_completion_timeout(&fd->fd_irq_done,
>                                           msecs_to_jiffies(MTK_FD_HW_TIMEOUT));

Shouldn't we still send some command to the hardware to stop? Like a
reset. Otherwise we don't know if it isn't still accessing the memory.

>         queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ?
>                                         &m2m_ctx->out_q_ctx :
>                                         &m2m_ctx->cap_q_ctx;
>         while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
>                 v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
>
>         if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>                 mtk_fd_hw_disconnect(fd);
> }
>
> Best regards,
> Jerry
>
> > Best regards,
> > Tomasz
>
>
