Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47F52B7681
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 11:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388909AbfISJlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 05:41:15 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:60699 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388084AbfISJlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 05:41:15 -0400
X-UUID: 7c4e54af02464508bce32b082209e874-20190919
X-UUID: 7c4e54af02464508bce32b082209e874-20190919
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 681303365; Thu, 19 Sep 2019 17:41:08 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Sep 2019 17:41:04 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Sep 2019 17:41:04 +0800
Message-ID: <1568886066.19171.16.camel@mtksdccf07>
Subject: Re: [RFC PATCH V3 4/5] platform: mtk-isp: Add Mediatek DIP driver
From:   Frederic Chen <frederic.chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>, "Sj Huang" <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Holmes Chiou =?UTF-8?Q?=28=E9=82=B1=E6=8C=BA=29?= 
        <holmes.chiou@mediatek.com>,
        Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <Rynn.Wu@mediatek.com>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>, Shik Chen <shik@chromium.org>,
        <suleiman@chromium.org>,
        Allan Yang =?UTF-8?Q?=28=E6=A5=8A=E6=99=BA=E9=88=9E=29?= 
        <Allan.Yang@mediatek.com>
Date:   Thu, 19 Sep 2019 17:41:06 +0800
In-Reply-To: <CAAFQd5Cd2-dyQnMEy0LBwaajn7UfzEbHiJp7AkDy=T8Zy6t_=A@mail.gmail.com>
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
         <20190909192244.9367-5-frederic.chen@mediatek.com>
         <CAAFQd5DEn_N26M7B4X7fKHVA=XBtWJN=Y4VF7D9B=TkgXf_i+Q@mail.gmail.com>
         <1568223671.19171.12.camel@mtksdccf07>
         <CAAFQd5Cd2-dyQnMEy0LBwaajn7UfzEbHiJp7AkDy=T8Zy6t_=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Tomasz,


On Thu, 2019-09-12 at 14:58 +0900, Tomasz Figa wrote:
> On Thu, Sep 12, 2019 at 2:41 AM Frederic Chen
> <frederic.chen@mediatek.com> wrote:
> >
> > Hi Tomasz,
> >
> > I appreciate your helpful comments.
> >
> >
> > On Tue, 2019-09-10 at 13:04 +0900, Tomasz Figa wrote:
> > > Hi Frederic,
> > >
> > > On Tue, Sep 10, 2019 at 4:23 AM <frederic.chen@mediatek.com> wrote:
> > > >
> > > > From: Frederic Chen <frederic.chen@mediatek.com>
> > > >
> > > > This patch adds the driver of Digital Image Processing (DIP)
> > > > unit in Mediatek ISP system, providing image format
> > > > conversion, resizing, and rotation features.
> > > >
> > > > The mtk-isp directory will contain drivers for multiple IP
> > > > blocks found in Mediatek ISP system. It will include ISP
> > > > Pass 1 driver(CAM), sensor interface driver, DIP driver and
> > > > face detection driver.
> > > >
> > > > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > > > ---
> > > >  drivers/media/platform/mtk-isp/Makefile       |    7 +
> > > >  .../media/platform/mtk-isp/isp_50/Makefile    |    7 +
> > > >  .../platform/mtk-isp/isp_50/dip/Makefile      |   18 +
> > > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c |  650 +++++
> > > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  566 +++++
> > > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  156 ++
> > > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c |  521 ++++
> > > >  .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 2255 +++++++++++++++++
> > > >  8 files changed, 4180 insertions(+)
> > > >  create mode 100644 drivers/media/platform/mtk-isp/Makefile
> > > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
> > > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
> > > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
> > > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
> > > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
> > > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
> > > >
> > >
> > > Thanks for sending v3!
> > >
> > > I'm going to do a full review a bit later, but please check one
> > > comment about power handling below.
> > >
> > > Other than that one comment, from a quick look, I think we only have a
> > > number of style issues left. Thanks for the hard work!
> > >
> > > [snip]
> > > > +static void dip_runner_func(struct work_struct *work)
> > > > +{
> > > > +       struct mtk_dip_request *req = mtk_dip_hw_mdp_work_to_req(work);
> > > > +       struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> > > > +       struct img_config *config_data =
> > > > +               (struct img_config *)req->working_buf->config_data.vaddr;
> > > > +
> > > > +       /*
> > > > +        * Call MDP/GCE API to do HW excecution
> > > > +        * Pass the framejob to MDP driver
> > > > +        */
> > > > +       pm_runtime_get_sync(dip_dev->dev);
> > > > +       mdp_cmdq_sendtask(dip_dev->mdp_pdev, config_data,
> > > > +                         &req->img_fparam.frameparam, NULL, false,
> > > > +                         dip_mdp_cb_func, req);
> > > > +}
> > > [snip]
> > > > +static void dip_composer_workfunc(struct work_struct *work)
> > > > +{
> > > > +       struct mtk_dip_request *req = mtk_dip_hw_fw_work_to_req(work);
> > > > +       struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> > > > +       struct img_ipi_param ipi_param;
> > > > +       struct mtk_dip_hw_subframe *buf;
> > > > +       int ret;
> > > > +
> > > > +       down(&dip_dev->sem);
> > > > +
> > > > +       buf = mtk_dip_hw_working_buf_alloc(req->dip_pipe->dip_dev);
> > > > +       if (!buf) {
> > > > +               dev_err(req->dip_pipe->dip_dev->dev,
> > > > +                       "%s:%s:req(%p): no free working buffer available\n",
> > > > +                       __func__, req->dip_pipe->desc->name, req);
> > > > +       }
> > > > +
> > > > +       req->working_buf = buf;
> > > > +       mtk_dip_wbuf_to_ipi_img_addr(&req->img_fparam.frameparam.subfrm_data,
> > > > +                                    &buf->buffer);
> > > > +       memset(buf->buffer.vaddr, 0, DIP_SUB_FRM_SZ);
> > > > +       mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.config_data,
> > > > +                                       &buf->config_data);
> > > > +       memset(buf->config_data.vaddr, 0, DIP_COMP_SZ);
> > > > +
> > > > +       if (!req->img_fparam.frameparam.tuning_data.present) {
> > > > +               /*
> > > > +                * When user enqueued without tuning buffer,
> > > > +                * it would use driver internal buffer.
> > > > +                */
> > > > +               dev_dbg(dip_dev->dev,
> > > > +                       "%s: frame_no(%d) has no tuning_data\n",
> > > > +                       __func__, req->img_fparam.frameparam.frame_no);
> > > > +
> > > > +               mtk_dip_wbuf_to_ipi_tuning_addr
> > > > +                               (&req->img_fparam.frameparam.tuning_data,
> > > > +                                &buf->tuning_buf);
> > > > +               memset(buf->tuning_buf.vaddr, 0, DIP_TUNING_SZ);
> > > > +       }
> > > > +
> > > > +       mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.self_data,
> > > > +                                       &buf->frameparam);
> > > > +       memcpy(buf->frameparam.vaddr, &req->img_fparam.frameparam,
> > > > +              sizeof(req->img_fparam.frameparam));
> > > > +       ipi_param.usage = IMG_IPI_FRAME;
> > > > +       ipi_param.frm_param.handle = req->id;
> > > > +       ipi_param.frm_param.scp_addr = (u32)buf->frameparam.scp_daddr;
> > > > +
> > > > +       mutex_lock(&dip_dev->hw_op_lock);
> > > > +       atomic_inc(&dip_dev->num_composing);
> > > > +       ret = scp_ipi_send(dip_dev->scp_pdev, SCP_IPI_DIP, &ipi_param,
> > > > +                          sizeof(ipi_param), 0);
> > >
> > > We're not holding the pm_runtime enable count here
> > > (pm_runtime_get_sync() wasn't called), so rproc_shutdown() might have
> > > been called. Wouldn't that affect the ability for this IPI to run?
> > >
> > > We had a related discussion with Jerry on the FD series and I think
> > > the conclusion is:
> > > a) if there is any state that needs to be preserved between jobs, that
> > > would be cleared by rproc_shutdown() then we need to call
> > > rproc_boot/shutdown() when we start/stop streaming.
> > > b) it there is no such state, we can keep them inside runtime PM
> > > callbacks, but we need to call pm_runtime_get_sync() before sending an
> > > IPI and pm_runtime_mark_last_busy() + pm_runtime_put_autosuspend()
> > > after the SCP signals completion. In this case the runtime PM
> > > autosuspend delay should be set to around 2-3 times the delay needed
> > > for rproc_shutdown() + rproc_boot() to complete.
> >
> > Since each IMG_IPI_FRAME command is stateless, I would like to
> > use pm_runtime_get_sync()/ pm_runtime_mark_last_busy()/
> > pm_runtime_put_autosuspend() to fix this issue (solution b).
> 
> What does IMG_IPI_INIT do then? Do we need it at all?
> 
> I'm worried about the fact that we call rproc_boot(), IMG_IPI_INIT and
> then rproc_shutdown(). The latter can completely shutdown the SCP and
> clear any state there. How would the effects of IMG_IPI_INIT be
> preserved until IMG_IPI_FRAME is called?
> 

The command IMG_IPI_INIT is to initialize the DIP hardware. Although the
DIP hardware status is not cleared when SCP is powered off, it can still
be cleared after mtk_dip_runtime_suspend() is called (it means that DIP
is going to be powered off).

I would like to re-initialize the DIP with IMG_IPI_INIT in
mtk_dip_runtime_resume() to handle this case. Is is OK?


> Best regards,
> Tomasz


Sincerely,

Frederic Chen

