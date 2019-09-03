Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9BFA61AE
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 08:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfICGot (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 02:44:49 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:41959 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725956AbfICGot (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 02:44:49 -0400
X-UUID: 3c738cff8e05492494681aa556dc0d83-20190903
X-UUID: 3c738cff8e05492494681aa556dc0d83-20190903
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2091148019; Tue, 03 Sep 2019 14:44:42 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Sep 2019 14:44:41 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Sep 2019 14:44:41 +0800
Message-ID: <1567493081.18318.49.camel@mtksdccf07>
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
Date:   Tue, 3 Sep 2019 14:44:41 +0800
In-Reply-To: <CAAFQd5AGgeFbto6V1KkL0dp1QPziOKV3pWQDU2OJ+S1QKvnBdg@mail.gmail.com>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
         <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
         <20190802082815.GA203993@chromium.org>
         <1566724680.20680.8.camel@mtksdccf07>
         <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
         <1566957625.20680.33.camel@mtksdccf07>
         <CAAFQd5D-Yg1FjUE_rwmqfS1gvfE0=MZ=r-ziueU_37-uo9QTbw@mail.gmail.com>
         <1567424859.18318.32.camel@mtksdccf07>
         <CAAFQd5AGgeFbto6V1KkL0dp1QPziOKV3pWQDU2OJ+S1QKvnBdg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-09-03 at 13:19 +0800, Tomasz Figa wrote:
> On Mon, Sep 2, 2019 at 8:47 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> >
> > Hi Tomasz,
> >
> > On Fri, 2019-08-30 at 16:33 +0800, Tomasz Figa wrote:
> > > On Wed, Aug 28, 2019 at 11:00 AM Jerry-ch Chen
> > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > >
> > > > Hi Tomasz,
> > > >
> > > > On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> > > > > Hi Jerry,
> > > > >
> > > > > On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > >
> > > > > > Hi Tomasz,
> > > > > >
> > > > > > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > > > > > Hi Jerry,
> > > > > > >
> > > > > > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> [snip]
> > > > static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> > > >                                   unsigned int *num_buffers,
> > > >                                   unsigned int *num_planes,
> > > >                                   unsigned int sizes[],
> > > >                                   struct device *alloc_devs[])
> > > > {
> > > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > >         struct device *dev = ctx->dev;
> > > >         unsigned int size[2];
> > > >
> > > >         switch (vq->type) {
> > > >         case V4L2_BUF_TYPE_META_CAPTURE:
> > > >                 size[0] = ctx->dst_fmt.buffersize;
> > > >                 break;
> > > >         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > > >                 size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
> > > >                 if (*num_planes == 2)
> > > >                         size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
> > > >                 break;
> > > >         }
> > > >
> > > >         if (*num_planes == 1) {
> > > >                 if (sizes[0] < size[0])
> > > >                         return -EINVAL;
> > > >         } else if (*num_planes == 2) {
> > > >                 if ((sizes[0] < size[0]) && (sizes[1] < size[1]))
> > > >                         return -EINVAL;
> > >
> > > Can we just use a loop here and combine the 2 cases above?
> > >
> > > Also, we need to fail with -EINVAL if *num_planes is > 2.
> > >
> > > >         } else {
> > > >                 *num_planes = 1;
> > > >                 sizes[0] = size[0];
> > >
> > > This should be the case if *num_planes == 0 and the number of planes
> > > and sizes should match the currently active format.
> > >
> > I appreciate your comments,
> >
> > Ok, I will update as following:
> > static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> >                                   unsigned int *num_buffers,
> >                                   unsigned int *num_planes,
> >                                   unsigned int sizes[],
> >                                   struct device *alloc_devs[])
> > {
> >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> >         unsigned int size[2];
> >         unsigned int plane;
> >
> >         switch (vq->type) {
> >         case V4L2_BUF_TYPE_META_CAPTURE:
> >                 size[0] = ctx->dst_fmt.buffersize;
> >                 break;
> >         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> >                 size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
> >                 if (*num_planes == 2)
> >                         size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
> >                 break;
> >         }
> >
> >         if (*num_planes > 2)
> >                 return -EINVAL;
> >         if (*num_planes == 0) {
> >                 if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
> >                         sizes[0] = ctx->dst_fmt.buffersize;
> >                         *num_planes = 1;
> >                         return 0;
> >                 }
> >
> >                 *num_planes = ctx->src_fmt.num_planes;
> >                 for (plane = 0; plane < *num_planes; plane++)
> >                         sizes[plane] = ctx->src_fmt.plane_fmt[plane].sizeimage;
> >                 return 0;
> >         }
> >
> >         for (plane = 0; plane < *num_planes; plane++) {
> >                 if(sizes[plane] < size[plane])
> >                         return -EINVAL;
> >         }
> >         return 0;
> > }
> >
> 
> Looks good, thanks!
> 
> > > >         }
> > > >
> > > >         return 0;
> > > > }
> > > >
> > > > > [snip]
> > > > >
> > > > > > > > +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > > > > +{
> > > > > > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > > > > +   struct vb2_buffer *vb;
> > > > > > >
> > > > > > > How do we guarantee here that the hardware isn't still accessing the buffers
> > > > > > > removed below?
> > > > > > >
> > > > > > Maybe we can check the driver state flag and aborting the unfinished
> > > > > > jobs?
> > > > > > (fd_hw->state == FD_ENQ)
> > > > > >
> > > > >
> > > > > Yes, we need to either cancel or wait for the currently processing
> > > > > job. It depends on hardware capabilities, but cancelling is generally
> > > > > preferred for the lower latency.
> > > > >
> > > > Ok, it the state is ENQ, then we can disable the FD hw by controlling
> > > > the registers.
> > > >
> > > > for example:
> > > >         writel(0x0, fd->fd_base + FD_HW_ENABLE);
> > > >         writel(0x0, fd->fd_base + FD_INT_EN);
> > > >
> > >
> > > What's exactly the effect of writing 0 to FD_HW_ENABLE?
> > >
> > Sorry, my last reply didn't solve the question,
> > we should implement a mtk_fd_job_abort() for v4l2_m2m_ops().
> >
> > which is able to readl_poll_timeout_atomic()
> > and check the HW busy bits in the register FD_INT_EN;
> >
> > if they are not cleared until timeout, we could handle the last
> > processing job.
> > Otherwise, the FD irq handler should have handled the last processing
> > job and we could continue the stop_streaming().
> >
> > For job_abort():
> > static void mtk_fd_job_abort(void *priv)
> > {
> >         struct mtk_fd_ctx *ctx = priv;
> >         struct mtk_fd_dev *fd = ctx->fd_dev;
> >         u32 val;
> >         u32 ret;
> >
> >         ret = readl_poll_timeout_atomic(fd->fd_base + MTK_FD_REG_OFFSET_INT_EN,
> >                                         val,
> >                                         (val & MTK_FD_HW_BUSY_MASK) ==
> >                                         MTK_FD_HW_STATE_IS_BUSY,
> >                                         USEC_PER_MSEC, MTK_FD_STOP_HW_TIMEOUT);
> 
> Hmm, would it be possible to avoid the busy wait by having a
> completion that could be signalled from the interrupt handler?
> 
> Best regards,
> Tomasz

I suppose that would be wakeup a wait queue in the interrupt handler,
the the wait_event_interrupt_timeout() will be used in here and system
suspend e.g. mtk_fd_suspend().
Or do you suggest to wait_event_interrupt_timeout() every frame in the
mtk_fd_ipi_handler()?
I think maybe the readl_poll_timeout_atomic would be good enough.


One more thing, for the mtk_fd_video_device_register()
Sorry that I would need to use intermediate variable here since the 80
columns check.

	function = MEDIA_ENT_F_PROC_VIDEO_STATISTICS;
	ret = v4l2_m2m_register_media_controller(m2m_dev, vfd, function);
	if (ret) {
		dev_err(dev, "Failed to init mem2mem media controller\n");
		goto err_unreg_video;
	}


Thanks and Best regards,
Jerry

