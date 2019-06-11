Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EECF93C665
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 10:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391441AbfFKIsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 04:48:11 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:11437 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2391273AbfFKIsL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 04:48:11 -0400
X-UUID: 6571d7cae7254b0aac08865429bde460-20190611
X-UUID: 6571d7cae7254b0aac08865429bde460-20190611
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1043744316; Tue, 11 Jun 2019 16:48:07 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Jun 2019 16:48:05 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 16:48:06 +0800
Message-ID: <1560242886.23799.13.camel@mtksdccf07>
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek DIP driver
From:   Frederic Chen <frederic.chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>, <shik@chromium.org>,
        <suleiman@chromium.org>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <hans.verkuil@cisco.com>
Date:   Tue, 11 Jun 2019 16:48:06 +0800
In-Reply-To: <1558466055.15388.342.camel@mtksdccf07>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
         <20190417104511.21514-7-frederic.chen@mediatek.com>
         <20190509094846.GA65444@google.com> <1558466055.15388.342.camel@mtksdccf07>
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

I'd like to elaborate more about the tuning_data.va.
Would you like to give us some advice about our improvement proposal inline?

Thank you very much.


On Wed, 2019-05-22 at 03:14 +0800, Frederic Chen wrote:
> Dear Tomasz,
> 
> I appreciate your comment. It is very helpful for us.
> 
> 
> > > diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > > new file mode 100644
> > > index 000000000000..54d2b5f5b802
> > > --- /dev/null
> > > +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > > @@ -0,0 +1,1384 @@

[snip]

> > > +static void dip_submit_worker(struct work_struct *work)
> > > +{
> > > +       struct mtk_dip_hw_submit_work *dip_submit_work =
> > > +               container_of(work, struct mtk_dip_hw_submit_work, frame_work);
> > > +       struct mtk_dip_hw *dip_hw = dip_submit_work->dip_hw;
> > > +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> > > +       struct mtk_dip_hw_work *dip_work;
> > > +       struct mtk_dip_hw_subframe *buf;
> > > +       u32 len, num;
> > > +       int ret;
> > > +
> > > +       num  = atomic_read(&dip_hw->num_composing);
> > > +
> > > +       mutex_lock(&dip_hw->dip_worklist.queuelock);
> > > +       dip_work = list_first_entry(&dip_hw->dip_worklist.queue,

[snip]

> > > +
> > > +       if (dip_work->frameparams.tuning_data.pa == 0) {
> > > +               dev_dbg(&dip_dev->pdev->dev,
> > > +                       "%s: frame_no(%d) has no tuning_data\n",
> > > +                       __func__, dip_work->frameparams.frame_no);
> > > +
> > > +               memcpy(&dip_work->frameparams.tuning_data,
> > > +                      &buf->tuning_buf, sizeof(buf->tuning_buf));
> > 
> > Ditto.
> > 
> 
> I got it.
> 
> > > +               memset((char *)buf->tuning_buf.va, 0, DIP_TUNING_SZ);
> > 
> > Ditto.
> 
> I got it.
> 
> > 
> > > +               /*
> > > +                * When user enqueued without tuning buffer,
> > > +                * it would use driver internal buffer.
> > > +                * So, tuning_data.va should be 0
> > > +                */
> > > +               dip_work->frameparams.tuning_data.va = 0;
> > 
> > I don't understand this. We just zeroed the buffer via this kernel VA few
> > lines above, so why would it have to be set to 0?
> > 
> 
> I will remove this unnecessary line.
> 
> > > +       }

After confirming the firmware part, I found that we use this field
(tuning_data.va) to notify firmware if there is no tuning data from
user.

- frameparams.tuning_data.va is 0: use the default tuning data in
				   SCP, but we still need to pass
				   frameparams.tuning_data.pa because
				   the buffer contains some working
				   buffer required.
- frameparams.tuning_data.va is not 0: the tuning data was passed from
				       the user

Since we should not pass cpu addres to SCP, could I rename tuning_data.va
as tuning_data.cookie, and write a constant value to indicate if SCP
should use its internal default setting or not here?

For example,
/* SCP uses tuning data passed from userspace*/
dip_work->frameparams.tuning_data.cookie = MTK_DIP_USER_TUNING_DATA;

/* SCP uses internal tuning data */
dip_work->frameparams.tuning_data.cookie = MTK_DIP_DEFAULT_TUNING_DATA;


> > > +
> > > +       dip_work->frameparams.drv_data = (u64)dip_hw;
> > 
> > Passing kernel pointers to firmware?
> 
> I will remove this line.
> 
> > 
> > > +       dip_work->frameparams.state = FRAME_STATE_COMPOSING;
> > > +
> > > +       memcpy((void *)buf->frameparam.va, &dip_work->frameparams,
> > > +              sizeof(dip_work->frameparams));
> > 
> > There shouldn't be a need to type cast the pointer.
> > 
> 
> I will fix it.
> 
> > > +
> > > +       dip_send(dip_hw->vpu_pdev, SCP_IPI_DIP_FRAME,
> > > +                (void *)&dip_work->frameparams,
> > 

[snip]


Sincerely,

Frederic Chen



