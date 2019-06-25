Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D64654DC8
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 13:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730827AbfFYLft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 07:35:49 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:21339 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727770AbfFYLft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 07:35:49 -0400
X-UUID: b496fe072df747128483e8bbaa8a6713-20190625
X-UUID: b496fe072df747128483e8bbaa8a6713-20190625
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 241845985; Tue, 25 Jun 2019 19:35:40 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Jun 2019 19:35:38 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Jun 2019 19:35:38 +0800
Message-ID: <1561462538.23799.19.camel@mtksdccf07>
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek DIP driver
From:   Frederic Chen <frederic.chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        "Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?=" 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
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
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Date:   Tue, 25 Jun 2019 19:35:38 +0800
In-Reply-To: <CAAFQd5Ai2JmwY+_inA-WkE1rKhTOyvJeLM8XG3E6BsYCrp4pnw@mail.gmail.com>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
         <20190417104511.21514-7-frederic.chen@mediatek.com>
         <20190509094846.GA65444@google.com> <1558466055.15388.342.camel@mtksdccf07>
         <1560242886.23799.13.camel@mtksdccf07>
         <CAAFQd5CReiPOySyk-eFkgiQMDMoqB3Uhd=bcho2Qtsv74y8fmg@mail.gmail.com>
         <1560247648.23799.16.camel@mtksdccf07>
         <CAAFQd5Ai2JmwY+_inA-WkE1rKhTOyvJeLM8XG3E6BsYCrp4pnw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: A96D21B4832B5BB347BCC937165A0AD695ED92798361EA550FFEA438A530F48C2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Tue, 2019-06-11 at 19:13 +0900, Tomasz Figa wrote:
> On Tue, Jun 11, 2019 at 7:07 PM Frederic Chen
> <frederic.chen@mediatek.com> wrote:
> >
> > Hi Tomasz,
> >
> >
> > On Tue, 2019-06-11 at 17:59 +0900, Tomasz Figa wrote:
> > > On Tue, Jun 11, 2019 at 5:48 PM Frederic Chen
> > > <frederic.chen@mediatek.com> wrote:
> > > >
> > > > Dear Tomasz,
> > > >
> > > > I'd like to elaborate more about the tuning_data.va.
> > > > Would you like to give us some advice about our improvement proposal inline?
> > > >
> > > > Thank you very much.
> > > >
> > > >
> > > > On Wed, 2019-05-22 at 03:14 +0800, Frederic Chen wrote:
> > > > > Dear Tomasz,
> > > > >
> > > > > I appreciate your comment. It is very helpful for us.
> > > > >
> > > > >
> > > > > > > diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..54d2b5f5b802
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > > > > > > @@ -0,0 +1,1384 @@
> > > >
> > > > [snip]
> > > >
> > > > > > > +static void dip_submit_worker(struct work_struct *work)
> > > > > > > +{
> > > > > > > +       struct mtk_dip_hw_submit_work *dip_submit_work =
> > > > > > > +               container_of(work, struct mtk_dip_hw_submit_work, frame_work);
> > > > > > > +       struct mtk_dip_hw *dip_hw = dip_submit_work->dip_hw;
> > > > > > > +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> > > > > > > +       struct mtk_dip_hw_work *dip_work;
> > > > > > > +       struct mtk_dip_hw_subframe *buf;
> > > > > > > +       u32 len, num;
> > > > > > > +       int ret;
> > > > > > > +
> > > > > > > +       num  = atomic_read(&dip_hw->num_composing);
> > > > > > > +
> > > > > > > +       mutex_lock(&dip_hw->dip_worklist.queuelock);
> > > > > > > +       dip_work = list_first_entry(&dip_hw->dip_worklist.queue,
> > > >
> > > > [snip]
> > > >
> > > > > > > +
> > > > > > > +       if (dip_work->frameparams.tuning_data.pa == 0) {
> > > > > > > +               dev_dbg(&dip_dev->pdev->dev,
> > > > > > > +                       "%s: frame_no(%d) has no tuning_data\n",
> > > > > > > +                       __func__, dip_work->frameparams.frame_no);
> > > > > > > +
> > > > > > > +               memcpy(&dip_work->frameparams.tuning_data,
> > > > > > > +                      &buf->tuning_buf, sizeof(buf->tuning_buf));
> > > > > >
> > > > > > Ditto.
> > > > > >
> > > > >
> > > > > I got it.
> > > > >
> > > > > > > +               memset((char *)buf->tuning_buf.va, 0, DIP_TUNING_SZ);
> > > > > >
> > > > > > Ditto.
> > > > >
> > > > > I got it.
> > > > >
> > > > > >
> > > > > > > +               /*
> > > > > > > +                * When user enqueued without tuning buffer,
> > > > > > > +                * it would use driver internal buffer.
> > > > > > > +                * So, tuning_data.va should be 0
> > > > > > > +                */
> > > > > > > +               dip_work->frameparams.tuning_data.va = 0;
> > > > > >
> > > > > > I don't understand this. We just zeroed the buffer via this kernel VA few
> > > > > > lines above, so why would it have to be set to 0?
> > > > > >
> > > > >
> > > > > I will remove this unnecessary line.
> > > > >
> > > > > > > +       }
> > > >
> > > > After confirming the firmware part, I found that we use this field
> > > > (tuning_data.va) to notify firmware if there is no tuning data from
> > > > user.
> > > >
> > > > - frameparams.tuning_data.va is 0: use the default tuning data in
> > > >                                    SCP, but we still need to pass
> > > >                                    frameparams.tuning_data.pa because
> > > >                                    the buffer contains some working
> > > >                                    buffer required.
> > > > - frameparams.tuning_data.va is not 0: the tuning data was passed from
> > > >                                        the user
> > > >
> > > > Since we should not pass cpu addres to SCP, could I rename tuning_data.va
> > > > as tuning_data.cookie, and write a constant value to indicate if SCP
> > > > should use its internal default setting or not here?
> > > >
> > > > For example,
> > > > /* SCP uses tuning data passed from userspace*/
> > > > dip_work->frameparams.tuning_data.cookie = MTK_DIP_USER_TUNING_DATA;
> > > >
> > > > /* SCP uses internal tuning data */
> > > > dip_work->frameparams.tuning_data.cookie = MTK_DIP_DEFAULT_TUNING_DATA;
> > >
> > > Perhaps we could just call it "present" and set to true or false?
> > >
> >
> > Yes. I would like to use "present" here.
> >
> > Original:
> >   struct img_addr {
> >       u64 va; /* Used by Linux OS access */
> >       u32 pa; /* Used by CM4 access */
> >       u32 iova; /* Used by IOMMU HW access */
> >   } __attribute__ ((__packed__));
> >
> >   struct img_ipi_frameparam {
> >       u32 index;
> >       u32 frame_no;
> >       u64 timestamp;
> >       u8 type;  /* enum mdp_stream_type */
> >       u8 state;
> >       u8 num_inputs;
> >       u8 num_outputs;
> >       u64 drv_data;
> >       struct img_input inputs[IMG_MAX_HW_INPUTS];
> >       struct img_output outputs[IMG_MAX_HW_OUTPUTS];
> >       struct img_addr tuning_data;
> >       struct img_addr subfrm_data;
> >       struct img_sw_addr config_data;
> >       struct img_sw_addr self_data;
> >   } __attribute__ ((__packed__));
> >
> >
> > Modified:
> >   struct tuning_buf {
> >       u8 present;
> 
> I'd make this u32 to keep the other fields aligned.
> 
> >       u32 pa;   /* Used by CM4 access */
> >       u32 iova; /* Used by IOMMU HW access */
> >   } __attribute__ ((__packed__));
> 

We will use u32 to keep the fields aligned in next patch.


> Best regards,
> Tomasz


Sincerely,

Frederic Chen

