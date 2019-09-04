Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1C5DA7EB4
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 11:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfIDJCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 05:02:00 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:46115 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726045AbfIDJCA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 05:02:00 -0400
X-UUID: e38f7aa176c54078b73d05a6db58dc7e-20190904
X-UUID: e38f7aa176c54078b73d05a6db58dc7e-20190904
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1544458190; Wed, 04 Sep 2019 17:01:50 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Sep 2019 17:01:48 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Sep 2019 17:01:48 +0800
Message-ID: <1567587708.22453.15.camel@mtksdccf07>
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>,
        "Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?=" 
        <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <Rynn.Wu@mediatek.com>,
        Po-Yang Huang =?UTF-8?Q?=28=E9=BB=83=E6=9F=8F=E9=99=BD=29?= 
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
Date:   Wed, 4 Sep 2019 17:01:48 +0800
In-Reply-To: <CAAFQd5Dzxy10g-MKHMnNbVO6kp9_L_jm1m+gtN+p=YF2LyBiag@mail.gmail.com>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
         <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
         <20190802082815.GA203993@chromium.org>
         <1566724680.20680.8.camel@mtksdccf07>
         <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
         <1566957625.20680.33.camel@mtksdccf07>
         <CAAFQd5D-Yg1FjUE_rwmqfS1gvfE0=MZ=r-ziueU_37-uo9QTbw@mail.gmail.com>
         <1567424859.18318.32.camel@mtksdccf07>
         <CAAFQd5AGgeFbto6V1KkL0dp1QPziOKV3pWQDU2OJ+S1QKvnBdg@mail.gmail.com>
         <1567493081.18318.49.camel@mtksdccf07>
         <CAAFQd5DWM=R7sFHYGhhR_rXrzgRnc4xtH_t8Pig-4tcP9KTSYg@mail.gmail.com>
         <1567511169.18318.65.camel@mtksdccf07>
         <CAAFQd5DiPcUxd+R-v_-BdRx+QqZ35Riii_jpgbqr5mc3BnQvDw@mail.gmail.com>
         <1567568281.18318.80.camel@mtksdccf07>
         <CAAFQd5CRC2cyV30B4Qv59HdrJ7Cpe_yK5aY-BecQQ3J3i0PtCQ@mail.gmail.com>
         <1567577389.18318.100.camel@mtksdccf07>
         <CAAFQd5AxTQPD+nP9CJs45QTzGHKssjv3vRtMqHONABfp12afYw@mail.gmail.com>
         <1567584577.22453.11.camel@mtksdccf07>
         <CAAFQd5Dzxy10g-MKHMnNbVO6kp9_L_jm1m+gtN+p=YF2LyBiag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Wed, 2019-09-04 at 16:25 +0800, Tomasz Figa wrote:
> On Wed, Sep 4, 2019 at 5:09 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> >
> > Hi Tomasz,
> >
> > On Wed, 2019-09-04 at 14:34 +0800, Tomasz Figa wrote:
> > > On Wed, Sep 4, 2019 at 3:09 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > >
> > > > Hi Tomasz,
> > > >
> > > > On Wed, 2019-09-04 at 12:15 +0800, Tomasz Figa wrote:
> > > > > On Wed, Sep 4, 2019 at 12:38 PM Jerry-ch Chen
> > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > >
> > > > > > Hi Tomasz,
> > > > > >
> > > > > > On Tue, 2019-09-03 at 20:05 +0800, Tomasz Figa wrote:
> > > > > > > On Tue, Sep 3, 2019 at 8:46 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > >
> > > > > > > > Hi Tomasz,
> > > > > > > >
> > > > > > > > On Tue, 2019-09-03 at 15:04 +0800, Tomasz Figa wrote:
> > > > > > > > > On Tue, Sep 3, 2019 at 3:44 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Tue, 2019-09-03 at 13:19 +0800, Tomasz Figa wrote:
> > > > > > > > > > > On Mon, Sep 2, 2019 at 8:47 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > >
> > > > > > > > > > > > On Fri, 2019-08-30 at 16:33 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > On Wed, Aug 28, 2019 at 11:00 AM Jerry-ch Chen
> > > > > > > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > Hi Jerry,
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> > > > > > > > > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > > Hi Jerry,
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> > > > > > [snip]
> > > > > > > > > > > > > > > [snip]
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > > > > > > > > > > > > > > +   struct vb2_buffer *vb;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > How do we guarantee here that the hardware isn't still accessing the buffers
> > > > > > > > > > > > > > > > > removed below?
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Maybe we can check the driver state flag and aborting the unfinished
> > > > > > > > > > > > > > > > jobs?
> > > > > > > > > > > > > > > > (fd_hw->state == FD_ENQ)
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Yes, we need to either cancel or wait for the currently processing
> > > > > > > > > > > > > > > job. It depends on hardware capabilities, but cancelling is generally
> > > > > > > > > > > > > > > preferred for the lower latency.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > Ok, it the state is ENQ, then we can disable the FD hw by controlling
> > > > > > > > > > > > > > the registers.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > for example:
> > > > > > > > > > > > > >         writel(0x0, fd->fd_base + FD_HW_ENABLE);
> > > > > > > > > > > > > >         writel(0x0, fd->fd_base + FD_INT_EN);
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > What's exactly the effect of writing 0 to FD_HW_ENABLE?
> > > > > > > > > > > > >
> > > > > > > > > > > > Sorry, my last reply didn't solve the question,
> > > > > > > > > > > > we should implement a mtk_fd_job_abort() for v4l2_m2m_ops().
> > > > > > > > > > > >
> > > > > > > > > > > > which is able to readl_poll_timeout_atomic()
> > > > > > > > > > > > and check the HW busy bits in the register FD_INT_EN;
> > > > > > > > > > > >
> > > > > > > > > > > > if they are not cleared until timeout, we could handle the last
> > > > > > > > > > > > processing job.
> > > > > > > > > > > > Otherwise, the FD irq handler should have handled the last processing
> > > > > > > > > > > > job and we could continue the stop_streaming().
> > > > > > > > > > > >
> > > > > > > > > > > > For job_abort():
> > > > > > > > > > > > static void mtk_fd_job_abort(void *priv)
> > > > > > > > > > > > {
> > > > > > > > > > > >         struct mtk_fd_ctx *ctx = priv;
> > > > > > > > > > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > > > > > > > > > >         u32 val;
> > > > > > > > > > > >         u32 ret;
> > > > > > > > > > > >
> > > > > > > > > > > >         ret = readl_poll_timeout_atomic(fd->fd_base + MTK_FD_REG_OFFSET_INT_EN,
> > > > > > > > > > > >                                         val,
> > > > > > > > > > > >                                         (val & MTK_FD_HW_BUSY_MASK) ==
> > > > > > > > > > > >                                         MTK_FD_HW_STATE_IS_BUSY,
> > > > > > > > > > > >                                         USEC_PER_MSEC, MTK_FD_STOP_HW_TIMEOUT);
> > > > > > > > > > >
> > > > > > > > > > > Hmm, would it be possible to avoid the busy wait by having a
> > > > > > > > > > > completion that could be signalled from the interrupt handler?
> > > > > > > > > > >
> > > > > > > > > > > Best regards,
> > > > > > > > > > > Tomasz
> > > > > > > > > >
> > > > > > > > > > I suppose that would be wakeup a wait queue in the interrupt handler,
> > > > > > > > > > the the wait_event_interrupt_timeout() will be used in here and system
> > > > > > > > > > suspend e.g. mtk_fd_suspend().
> > > > > > > > >
> > > > > > > > > Yes, that should work.
> > > > > > > > >
> > > > > > > > > > Or do you suggest to wait_event_interrupt_timeout() every frame in the
> > > > > > > > > > mtk_fd_ipi_handler()?
> > > > > > > > >
> > > > > > > > > Nope, we shouldn't need that.
> > > > > > > > >
> > > > > > > > > > I think maybe the readl_poll_timeout_atomic would be good enough.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Not really. Busy waiting should be avoided as much as possible. What's
> > > > > > > > > the point of entering suspend if you end up burning the power by
> > > > > > > > > spinning the CPU for some milliseconds?
> > > > > > > > >
> > > > > > > > Ok, I see, busy waiting is not a good idea, I will use the wait queue
> > > > > > > > instead. the job abort will refine as following:
> > > > > > > >
> > > > > > > > static void mtk_fd_job_abort(void *priv)
> > > > > > > > {
> > > > > > > >         struct mtk_fd_ctx *ctx = priv;
> > > > > > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > > > > > >         u32 ret;
> > > > > > > >
> > > > > > > >         ret = wait_event_interruptible_timeout
> > > > > > > >                 (fd->wq, (fd->fd_irq_result & MTK_FD_HW_IRQ_MASK),
> > > > > > > >                  usecs_to_jiffies(50000));
> > > > > > > >         if (ret)
> > > > > > > >                 mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> > > > > > > >         dev_dbg(fd->dev, "%s, ret:%d\n", __func__, ret);
> > > > > > > >
> > > > > > > >         fd->fd_irq_result = 0;
> > > > > > > > }
> > > > > > > >
> > > > > > > > static struct v4l2_m2m_ops fd_m2m_ops = {
> > > > > > > >         .device_run = mtk_fd_device_run,
> > > > > > > >         .job_abort = mtk_fd_job_abort,
> > > > > > >
> > > > > > > I'm not sure we should be using the functon above as the .job_abort
> > > > > > > callback. It's expected to abort the job, but we're just waiting for
> > > > > > > it to finish. I think we should just call mtk_fd_job_abort() manually
> > > > > > > from .stop_streaming.
> > > > > > >
> > > > > >
> > > > > > Ok, I will fix it.
> > > > > >
> > > > > > > > };
> > > > > > > >
> > > > > > > > and we could use it in suspend.
> > > > > > > > static int mtk_fd_suspend(struct device *dev)
> > > > > > > > {
> > > > > > > >         struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> > > > > > > >
> > > > > > > >         if (pm_runtime_suspended(dev))
> > > > > > > >                 return 0;
> > > > > > > >
> > > > > > > >         if (fd->fd_stream_count)
> > > > > > > >                 mtk_fd_job_abort(fd->ctx);
> > > > > > > >
> > > > > > > >         /* suspend FD HW */
> > > > > > > >         writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
> > > > > > > >         writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
> > > > > > > >         clk_disable_unprepare(fd->fd_clk);
> > > > > > > >         dev_dbg(dev, "%s:disable clock\n", __func__);
> > > > > > > >
> > > > > > > >         return 0;
> > > > > > > > }
> > > > > > > >
> > > > > > > > static irqreturn_t mtk_fd_irq(int irq, void *data)
> > > > > > > > {
> > > > > > > >         struct mtk_fd_dev *fd = (struct mtk_fd_dev *)data;
> > > > > > > >
> > > > > > > >         fd->fd_irq_result = readl(fd->fd_base + MTK_FD_REG_OFFSET_INT_VAL);
> > > > > > > >         wake_up_interruptible(&fd->wq);
> > > > > > >
> > > > > > > The wake up should be done at the very end of this function. Otherwise
> > > > > > > we end up with m2m framework racing with the mtk_fd_hw_job_finish()
> > > > > > > below.
> > > > > > >
> > > > > > > Also, I'd use a completion here rather than an open coded wait and
> > > > > > > wake-up. The driver could reinit_completion() before queuing a job to
> > > > > > > the hardware and the IRQ handler would complete(). There would be no
> > > > > > > need to store the IRQ flags in driver data anymore.
> > > > > > Ok, It will be refined as following:
> > > > > >
> > > > > > suspend and stop streaming will call mtk_fd_job_abort()
> > > > > >
> > > > > > static void mtk_fd_job_abort(struct mtk_fd_dev *fd)
> > > > > > {
> > > > > >         u32 ret;
> > > > > >
> > > > > >         ret = wait_for_completion_timeout(&fd->fd_irq_done,
> > > > > >                                           msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
> > > > > >         if (ret)
> > > > >
> > > > > For the _timeout variants, !ret means the timeout and ret > 0 means
> > > > > that the wait ended successfully before.
> > > > >
> > > > Thanks, fixed.
> > > >
> > > > > Also please make sure that the timeout is big enough not to happen
> > > > > normally on a heavily loaded system. Something like 1 second should be
> > > > > good.
> > > > >
> > > > Ok, I will make it 1 second
> > > > #define MTK_FD_HW_TIMEOUT 1000
> > > >
> > > > Also, I will add a condition in mtk_fd_vb2_stop_streaming(), since it
> > > > would be called twice, now it works fine whether I reuse the condition
> > > > with mtk_fd_hw_disconnect or not, however, I think do it before buffer
> > > > remove looks more reasonable.
> > > >
> > > > static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > {
> > > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > >         struct vb2_v4l2_buffer *vb;
> > > >         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > > >         struct v4l2_m2m_queue_ctx *queue_ctx;
> > > >
> > > >         if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > > >                 mtk_fd_job_abort(fd);
> > >
> > > We need to do it regardless of the queue type, otherwise we could
> > > still free CAPTURE buffers before the hardware releases them.
> > >
> >
> > I think we may read the fd->fd_irq_done.done and do wait for completion
> > if it's not being done.
> > How do you think?
> >
> > static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > {
> >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> >         struct mtk_fd_dev *fd = ctx->fd_dev;
> >         struct vb2_v4l2_buffer *vb;
> >         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> >         struct v4l2_m2m_queue_ctx *queue_ctx;
> >         u32 ret;
> >
> >         if (!fd->fd_irq_done.done)
> 
> We shouldn't access internal fields of completion.
> 
> >                 ret = wait_for_completion_timeout(&fd->fd_irq_done,
> >                                                   msecs_to_jiffies(
> >                                                         MTK_FD_HW_TIMEOUT));
> >         queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ?
> >                                         &m2m_ctx->out_q_ctx :
> >                                         &m2m_ctx->cap_q_ctx;
> >         while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
> >                 v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> >
> >         if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> >                 mtk_fd_hw_disconnect(fd);
> > }
> >
> > I've also tried to wait completion unconditionally for both queues and
> > the second time will wait until timeout, as a result, it takes longer to
> > swap the camera every time and close the camera app.
> 
> I think it should work better if we call complete_all() instead of complete().
> 
Thanks,

I use complete_all(), and it works fine now.

static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
{
	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
	struct mtk_fd_dev *fd = ctx->fd_dev;
	struct vb2_v4l2_buffer *vb;
	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
	struct v4l2_m2m_queue_ctx *queue_ctx;

	wait_for_completion_timeout(&fd->fd_irq_done,
					  msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
	queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ?
					&m2m_ctx->out_q_ctx :
					&m2m_ctx->cap_q_ctx;
	while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);

	if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
		mtk_fd_hw_disconnect(fd);
}

Best regards,
Jerry

> Best regards,
> Tomasz


