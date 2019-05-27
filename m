Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D88602B601
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 15:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfE0NID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 09:08:03 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:48542 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726094AbfE0NID (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 09:08:03 -0400
X-UUID: c067ae55b5c54f6dbc33ac29ce95a819-20190527
X-UUID: c067ae55b5c54f6dbc33ac29ce95a819-20190527
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 548731275; Mon, 27 May 2019 21:07:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 27 May 2019 21:07:47 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 27 May 2019 21:07:46 +0800
Message-ID: <1558962466.5721.22.camel@mtksdccf07>
Subject: Re: [RFC, V2, 09/11] media: platform: Add Mediatek ISP P1 device
 driver
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Drew Davenport <ddavenport@chromium.org>
CC:     <ryan.yu@mediatek.com>, <frankie.chiu@mediatek.com>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <Rynn.Wu@mediatek.com>, <suleiman@chromium.org>,
        <Jerry-ch.Chen@mediatek.com>, <hans.verkuil@cisco.com>,
        <frederic.chen@mediatek.com>, <seraph.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <shik@chromium.org>, <yuzhao@chromium.org>,
        <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <Sean.Cheng@mediatek.com>, <srv_heupstream@mediatek.com>,
        <sj.huang@mediatek.com>, <tfiga@chromium.org>,
        <christie.yu@mediatek.com>, <zwisler@chromium.org>
Date:   Mon, 27 May 2019 21:07:46 +0800
In-Reply-To: <20190524211957.GA127243@chromium.org>
References: <jungo.lin@mediatek.com>
         <20190510015755.51495-10-jungo.lin@mediatek.com>
         <20190524211957.GA127243@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Drew:


On Fri, 2019-05-24 at 15:19 -0600, Drew Davenport wrote:
> Hi Jungo,
> 
> On Fri, May 10, 2019 at 09:58:04AM +0800, Jungo Lin wrote:
> > This patch adds the Mediatek ISP P1 HW control device driver.
> > It handles the ISP HW configuration, provides interrupt handling and
> > initializes the V4L2 device nodes and other functions.
> 
> A few comments inline.
> 

Appreciate your feedback on this patch set firstly.

> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> >  .../mtk-isp/isp_50/cam/mtk_cam-regs.h         |  149 ++
> >  .../platform/mtk-isp/isp_50/cam/mtk_cam.c     | 1206 +++++++++++++++++
> >  .../platform/mtk-isp/isp_50/cam/mtk_cam.h     |  300 ++++
> >  3 files changed, 1655 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
> > 
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
> > new file mode 100644
> > index 000000000000..342f0e0e9837
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
> > @@ -0,0 +1,149 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + * Author: Ryan Yu <ryan.yu@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef _CAM_REGS_H
> > +#define _CAM_REGS_H
> > +
> > +/* TG Bit Mask */
> > +#define VFDATA_EN_BIT	BIT(0)
> > +#define CMOS_EN_BIT	BIT(0)
> > +
> > +/* normal signal bit */
> > +#define VS_INT_ST	BIT(0)
> > +#define HW_PASS1_DON_ST	BIT(11)
> > +#define SOF_INT_ST	BIT(12)
> > +#define SW_PASS1_DON_ST	BIT(30)
> > +
> > +/* err status bit */
> > +#define TG_ERR_ST	BIT(4)
> > +#define TG_GBERR_ST	BIT(5)
> > +#define CQ_CODE_ERR_ST	BIT(6)
> > +#define CQ_APB_ERR_ST	BIT(7)
> > +#define CQ_VS_ERR_ST	BIT(8)
> > +#define AMX_ERR_ST	BIT(15)
> > +#define RMX_ERR_ST	BIT(16)
> > +#define BMX_ERR_ST	BIT(17)
> > +#define RRZO_ERR_ST	BIT(18)
> > +#define AFO_ERR_ST	BIT(19)
> > +#define IMGO_ERR_ST	BIT(20)
> > +#define AAO_ERR_ST	BIT(21)
> > +#define PSO_ERR_ST	BIT(22)
> > +#define LCSO_ERR_ST	BIT(23)
> > +#define BNR_ERR_ST	BIT(24)
> > +#define LSCI_ERR_ST	BIT(25)
> > +#define DMA_ERR_ST	BIT(29)
> > +
> > +/* CAM DMA done status */
> > +#define FLKO_DONE_ST	BIT(4)
> > +#define AFO_DONE_ST	BIT(5)
> > +#define AAO_DONE_ST	BIT(7)
> > +#define PSO_DONE_ST	BIT(14)
> 
> Please align the values using tabs here and elsewhere.
> 

Ok, we will revise this coding style issue in next patch.

> > +
> > +/* IRQ signal mask */
> > +#define INT_ST_MASK_CAM	( \
> > +			VS_INT_ST |\
> > +			SOF_INT_ST |\
> > +			HW_PASS1_DON_ST |\
> > +			SW_PASS1_DON_ST)
> > +
> > +/* IRQ Warning Mask */
> > +#define INT_ST_MASK_CAM_WARN	(\
> > +				RRZO_ERR_ST |\
> > +				AFO_ERR_ST |\
> > +				IMGO_ERR_ST |\
> > +				AAO_ERR_ST |\
> > +				PSO_ERR_ST | \
> > +				LCSO_ERR_ST |\
> > +				BNR_ERR_ST |\
> > +				LSCI_ERR_ST)
> > +
> > +/* IRQ Error Mask */
> > +#define INT_ST_MASK_CAM_ERR	(\
> > +				TG_ERR_ST |\
> > +				TG_GBERR_ST |\
> > +				CQ_CODE_ERR_ST |\
> > +				CQ_APB_ERR_ST |\
> > +				CQ_VS_ERR_ST |\
> > +				BNR_ERR_ST |\
> > +				RMX_ERR_ST |\
> > +				BMX_ERR_ST |\
> > +				BNR_ERR_ST |\
> > +				LSCI_ERR_ST |\
> > +				DMA_ERR_ST)
> > +
> > +/* IRQ Signal Log Mask */
> > +#define INT_ST_LOG_MASK_CAM	(\
> > +				SOF_INT_ST |\
> > +				SW_PASS1_DON_ST |\
> > +				VS_INT_ST |\
> > +				TG_ERR_ST |\
> > +				TG_GBERR_ST |\
> > +				RRZO_ERR_ST |\
> > +				AFO_ERR_ST |\
> > +				IMGO_ERR_ST |\
> > +				AAO_ERR_ST |\
> > +				DMA_ERR_ST)
> > +
> > +/* DMA Event Notification Mask */
> > +#define DMA_ST_MASK_CAM	(\
> > +			AFO_DONE_ST |\
> > +			AAO_DONE_ST |\
> > +			PSO_DONE_ST |\
> > +			FLKO_DONE_ST)
> > +
> > +/* Status check */
> > +#define REG_CTL_EN		0x0004
> > +#define REG_CTL_DMA_EN		0x0008
> > +#define REG_CTL_FMT_SEL		0x0010
> > +#define REG_CTL_EN2		0x0018
> > +#define REG_CTL_RAW_INT_EN	0x0020
> > +#define REG_CTL_RAW_INT_STAT	0x0024
> > +#define REG_CTL_RAW_INT2_STAT	0x0034
> > +#define REG_CTL_RAW_INT3_STAT	0x00c4
> > +#define REG_CTL_TWIN_STAT	0x0050
> > +
> > +#define REG_TG_SEN_MODE		0x0230
> > +#define REG_TG_SEN_GRAB_PIX	0x0238
> > +#define REG_TG_SEN_GRAB_LIN	0x023c
> > +#define REG_TG_VF_CON		0x0234
> > +#define REG_TG_SUB_PERIOD	0x02a4
> > +
> > +#define REG_IMGO_BASE_ADDR	0x1020
> > +#define REG_RRZO_BASE_ADDR	0x1050
> > +
> > +/* Error status log */
> > +#define REG_IMGO_ERR_STAT	0x1360
> > +#define REG_RRZO_ERR_STAT	0x1364
> > +#define REG_AAO_ERR_STAT	0x1368
> > +#define REG_AFO_ERR_STAT	0x136c
> > +#define REG_LCSO_ERR_STAT	0x1370
> > +#define REG_UFEO_ERR_STAT	0x1374
> > +#define REG_PDO_ERR_STAT	0x1378
> > +#define REG_BPCI_ERR_STAT	0x137c
> > +#define REG_LSCI_ERR_STAT	0x1384
> > +#define REG_PDI_ERR_STAT	0x138c
> > +#define REG_LMVO_ERR_STAT	0x1390
> > +#define REG_FLKO_ERR_STAT	0x1394
> > +#define REG_PSO_ERR_STAT	0x13a0
> > +
> > +/* ISP command */
> > +#define REG_CQ_THR0_BASEADDR	0x0198
> > +#define REG_HW_FRAME_NUM	0x13b8
> > +
> > +/* META */
> > +#define REG_META0_VB2_INDEX	0x14dc
> > +#define REG_META1_VB2_INDEX	0x151c
> > +
> > +#endif	/* _CAM_REGS_H */
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
> > new file mode 100644
> > index 000000000000..fc874ec8f7f0
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
> > @@ -0,0 +1,1206 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + * Author: Ryan Yu <ryan.yu@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/atomic.h>
> > +#include <linux/cdev.h>
> > +#include <linux/compat.h>
> > +#include <linux/fs.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/kernel.h>
> > +#include <linux/ktime.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/platform_data/mtk_scp.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/remoteproc.h>
> > +#include <linux/sched/clock.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/types.h>
> > +#include <linux/videodev2.h>
> > +#include <linux/vmalloc.h>
> > +
> > +#include "mtk_cam.h"
> > +#include "mtk_cam-regs.h"
> > +#include "mtk_cam-smem.h"
> > +
> > +static const struct of_device_id mtk_isp_of_ids[] = {
> > +	{.compatible = "mediatek,mt8183-camisp",},
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_isp_of_ids);
> > +
> > +/* list of clocks required by isp cam */
> > +static const char * const mtk_isp_clks[] = {
> > +	"CAMSYS_CAM_CGPDN", "CAMSYS_CAMTG_CGPDN"
> > +};
> > +
> > +static void isp_dump_dma_status(struct isp_device *isp_dev)
> > +{
> > +	dev_err(isp_dev->dev,
> > +		"IMGO:0x%x, RRZO:0x%x, AAO=0x%x, AFO=0x%x, LMVO=0x%x\n",
> > +		readl(isp_dev->regs + REG_IMGO_ERR_STAT),
> > +		readl(isp_dev->regs + REG_RRZO_ERR_STAT),
> > +		readl(isp_dev->regs + REG_AAO_ERR_STAT),
> > +		readl(isp_dev->regs + REG_AFO_ERR_STAT),
> > +		readl(isp_dev->regs + REG_LMVO_ERR_STAT));
> > +	dev_err(isp_dev->dev,
> > +		"LCSO=0x%x, PSO=0x%x, FLKO=0x%x, BPCI:0x%x, LSCI=0x%x\n",
> > +		readl(isp_dev->regs + REG_LCSO_ERR_STAT),
> > +		readl(isp_dev->regs + REG_PSO_ERR_STAT),
> > +		readl(isp_dev->regs + REG_FLKO_ERR_STAT),
> > +		readl(isp_dev->regs + REG_BPCI_ERR_STAT),
> > +		readl(isp_dev->regs + REG_LSCI_ERR_STAT));
> > +}
> > +
> > +static void mtk_isp_notify(struct mtk_isp_p1_ctx *isp_ctx,
> > +			   unsigned int request_fd,
> > +			   unsigned int frame_seq_no,
> > +			   struct list_head *list_buf,
> > +			   enum vb2_buffer_state state)
> > +{
> > +	struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +	struct mtk_cam_dev_finish_param fram_param;
> > +
> > +	fram_param.list_buf = list_buf;
> > +	fram_param.request_fd = request_fd;
> > +	fram_param.frame_seq_no = frame_seq_no;
> > +	fram_param.state = state;
> > +	dev_dbg(dev, "request fd:%d frame_seq_no:%d\n",
> > +		fram_param.request_fd,
> > +		fram_param.frame_seq_no);
> > +	mtk_cam_dev_job_finish(p1_dev->cam_dev, &fram_param);
> > +}
> > +
> > +static void isp_deque_frame(struct isp_p1_device *p1_dev,
> > +			    unsigned int node_id, int vb2_index,
> > +			    int frame_seq_no)
> > +{
> > +	struct mtk_cam_dev *cam_dev = p1_dev->cam_dev;
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +	struct vb2_queue *vb2_queue = &cam_dev->mem2mem2_nodes[node_id].vbq;
> > +	struct vb2_buffer *vb;
> > +	struct vb2_v4l2_buffer *vbb;
> > +
> > +	if (!cam_dev->mem2mem2_nodes[node_id].enabled)
> > +		return;
> > +
> > +	mutex_lock(vb2_queue->lock);
> > +	list_for_each_entry(vb, &vb2_queue->queued_list, queued_entry) {
> > +		vbb = to_vb2_v4l2_buffer(vb);
> > +		if (vbb->request_fd < 0 &&
> > +		    vb->index == vb2_index &&
> > +		    vb->state == VB2_BUF_STATE_ACTIVE) {
> > +			dev_dbg(dev, "%s:%d:%d", __func__, node_id, vb2_index);
> > +			vbb->vb2_buf.timestamp = ktime_get_ns();
> > +			vbb->sequence = frame_seq_no;
> > +			vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
> > +		}
> > +	}
> > +	mutex_unlock(vb2_queue->lock);
> > +}
> > +
> > +static void isp_deque_request_frame(struct isp_p1_device *p1_dev,
> > +				    int frame_seq_no)
> > +{
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +	struct mtk_isp_queue_job *framejob, *tmp;
> > +	struct isp_queue *p1_enqueue_list = &isp_ctx->p1_enqueue_list;
> > +
> > +	/* Match dequeue work and enqueue frame */
> > +	spin_lock(&p1_enqueue_list->lock);
> > +	list_for_each_entry_safe(framejob, tmp, &p1_enqueue_list->queue,
> > +				 list_entry) {
> > +		dev_dbg(dev,
> > +			"%s frame_seq_no:%d, target frame_seq_no:%d\n",
> > +			__func__,
> > +			framejob->frame_seq_no, frame_seq_no);
> > +		/* Match by the en-queued request number */
> > +		if (framejob->frame_seq_no == frame_seq_no) {
> > +			/* Pass to user space */
> > +			mtk_isp_notify(isp_ctx,
> > +				       framejob->request_fd,
> > +				       framejob->frame_seq_no,
> > +				       &framejob->list_buf,
> > +				       VB2_BUF_STATE_DONE);
> > +			atomic_dec(&p1_enqueue_list->queue_cnt);
> > +			dev_dbg(dev,
> > +				"frame_seq_no:%d is done, queue_cnt:%d\n",
> > +				framejob->frame_seq_no,
> > +				atomic_read(&p1_enqueue_list->queue_cnt));
> > +
> > +			/* remove only when frame ready */
> > +			list_del(&framejob->list_entry);
> > +			kfree(framejob);
> > +			break;
> > +		} else if (framejob->frame_seq_no < frame_seq_no) {
> > +			/* Pass to user space for frame drop */
> > +			mtk_isp_notify(isp_ctx,
> > +				       framejob->request_fd,
> > +				       framejob->frame_seq_no,
> > +				       &framejob->list_buf,
> > +				       VB2_BUF_STATE_ERROR);
> > +			atomic_dec(&p1_enqueue_list->queue_cnt);
> > +			dev_dbg(dev,
> > +				"frame_seq_no:%d drop, queue_cnt:%d\n",
> > +				framejob->frame_seq_no,
> > +				atomic_read(&p1_enqueue_list->queue_cnt));
> > +
> > +			/* remove only drop frame */
> > +			list_del(&framejob->list_entry);
> > +			kfree(framejob);
> > +		}
> > +	}
> > +	spin_unlock(&p1_enqueue_list->lock);
> > +}
> > +
> > +static int isp_deque_work(void *data)
> > +{
> > +	struct isp_p1_device *p1_dev = (struct isp_p1_device *)data;
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +	struct mtk_cam_dev *cam_dev = p1_dev->cam_dev;
> > +	struct mtk_cam_dev_stat_event_data event_data;
> > +	atomic_t *irq_data_end = &isp_ctx->irq_data_end;
> > +	atomic_t *irq_data_start = &isp_ctx->irq_data_start;
> > +	unsigned long flags;
> > +	int ret, i;
> > +
> > +	while (1) {
> > +		ret = wait_event_interruptible(isp_ctx->isp_deque_thread.wq,
> > +					       (atomic_read(irq_data_end) !=
> > +					       atomic_read(irq_data_start)) ||
> > +					       kthread_should_stop());
> > +
> > +		if (kthread_should_stop())
> > +			break;
> > +
> > +		if (ret == ERESTARTSYS) {
> > +			dev_err(dev, "interrupted by a signal!\n");
> > +			continue;
> > +		}
> > +
> > +		spin_lock_irqsave(&isp_ctx->irq_dequeue_lock, flags);
> > +		i = atomic_read(&isp_ctx->irq_data_start);
> > +		memcpy(&event_data, &isp_ctx->irq_event_datas[i],
> > +		       sizeof(event_data));
> > +		memset(&isp_ctx->irq_event_datas[i], 0x00, sizeof(event_data));
> > +		atomic_set(&isp_ctx->irq_data_start, ++i & 0x3);
> > +		spin_unlock_irqrestore(&isp_ctx->irq_dequeue_lock, flags);
> > +
> > +		if (event_data.irq_status_mask & VS_INT_ST) {
> > +			/* Notify specific HW events to user space */
> > +			mtk_cam_dev_event_frame_sync(cam_dev,
> > +						     event_data.frame_seq_no);
> > +			dev_dbg(dev,
> > +				"event IRQ:0x%x DMA:0x%x is sent\n",
> > +				event_data.irq_status_mask,
> > +				event_data.dma_status_mask);
> > +		}
> > +
> > +		if (event_data.dma_status_mask & AAO_DONE_ST) {
> > +			isp_deque_frame(p1_dev,
> > +					MTK_CAM_P1_META_OUT_0,
> > +					event_data.meta0_vb2_index,
> > +					event_data.frame_seq_no);
> > +		}
> > +
> > +		if (event_data.irq_status_mask & SW_PASS1_DON_ST) {
> > +			isp_deque_frame(p1_dev,
> > +					MTK_CAM_P1_META_OUT_0,
> > +					event_data.meta0_vb2_index,
> > +					event_data.frame_seq_no);
> > +
> > +			isp_deque_request_frame(p1_dev,
> > +						event_data.frame_seq_no);
> > +		}
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int irq_handle_sof(struct isp_device *isp_dev,
> > +			  dma_addr_t base_addr,
> > +			  unsigned int frame_num)
> > +{
> > +	unsigned int cq_addr_index;
> > +	struct isp_p1_device *p1_dev = get_p1_device(isp_dev->dev);
> > +	int cq_num = atomic_read(&p1_dev->isp_ctx.composed_frame_id);
> > +
> > +	if (cq_num > frame_num) {
> > +		cq_addr_index = frame_num % CQ_BUFFER_COUNT;
> > +
> > +		writel(base_addr +
> > +			(dma_addr_t)(CQ_ADDRESS_OFFSET * cq_addr_index),
> > +			isp_dev->regs + REG_CQ_THR0_BASEADDR);
> > +		dev_dbg(isp_dev->dev,
> > +			"SOF_INT_ST, update next, cq_num:%d, frame_num:%d cq_addr:%d",
> > +			cq_num, frame_num, cq_addr_index);
> > +	} else {
> > +		dev_dbg(isp_dev->dev,
> > +			"SOF_INT_ST, wait next, cq_num:%d, frame_num:%d",
> > +			cq_num, frame_num);
> > +	}
> > +
> > +	isp_dev->sof_count += 1;
> > +
> > +	return cq_num;
> > +}
> > +
> > +static int irq_handle_notify_event(struct isp_device *isp_dev,
> > +				   unsigned int irqstatus,
> > +				   unsigned int dmastatus)
> > +{
> > +	struct isp_p1_device *p1_dev = get_p1_device(isp_dev->dev);
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	unsigned long flags;
> > +	int i;
> > +
> > +	spin_lock_irqsave(&isp_ctx->irq_dequeue_lock, flags);
> > +	i = atomic_read(&isp_ctx->irq_data_end);
> > +	isp_ctx->irq_event_datas[i].frame_seq_no = isp_dev->current_frame;
> > +	isp_ctx->irq_event_datas[i].meta0_vb2_index = isp_dev->meta0_vb2_index;
> > +	isp_ctx->irq_event_datas[i].meta1_vb2_index = isp_dev->meta1_vb2_index;
> > +	isp_ctx->irq_event_datas[i].irq_status_mask |=
> > +		(irqstatus & INT_ST_MASK_CAM);
> > +	isp_ctx->irq_event_datas[i].dma_status_mask |=
> > +		(dmastatus & DMA_ST_MASK_CAM);
> > +	atomic_set(&isp_ctx->irq_data_end, ++i & 0x3);
> > +	spin_unlock_irqrestore(&isp_ctx->irq_dequeue_lock, flags);
> > +
> > +	wake_up_interruptible(&isp_ctx->isp_deque_thread.wq);
> > +
> > +	dev_dbg(isp_dev->dev,
> > +		"%s IRQ:0x%x DMA:0x%x seq:%d idx0:%d idx1:%d\n",
> > +		__func__,
> > +		(irqstatus & INT_ST_MASK_CAM),
> > +		(dmastatus & DMA_ST_MASK_CAM),
> > +		isp_dev->current_frame,
> > +		isp_dev->meta0_vb2_index,
> > +		isp_dev->meta1_vb2_index);
> > +
> > +	return 0;
> > +}
> > +
> > +irqreturn_t isp_irq_cam(int irq, void *data)
> > +{
> > +	struct isp_device *isp_dev = (struct isp_device *)data;
> > +	struct isp_p1_device *p1_dev = get_p1_device(isp_dev->dev);
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	struct device *dev = isp_dev->dev;
> > +	unsigned int cardinalnum, cq_num, hw_frame_num;
> > +	unsigned int meta0_vb2_index, meta1_vb2_index;
> > +	unsigned int irqstatus, errstatus, warnstatus, dmastatus;
> > +	unsigned long flags;
> > +
> > +	/* Check the streaming is off or not */
> > +	if (!p1_dev->cam_dev->streaming)
> > +		return IRQ_HANDLED;
> > +
> > +	cardinalnum = isp_dev->isp_hw_module - ISP_CAM_A_IDX;
> > +	cq_num = 0;
> > +
> > +	spin_lock_irqsave(&isp_dev->spinlock_irq, flags);
> > +	irqstatus = readl(isp_dev->regs + REG_CTL_RAW_INT_STAT);
> > +	dmastatus = readl(isp_dev->regs + REG_CTL_RAW_INT2_STAT);
> > +	hw_frame_num = readl(isp_dev->regs + REG_HW_FRAME_NUM);
> > +	meta0_vb2_index = readl(isp_dev->regs + REG_META0_VB2_INDEX);
> > +	meta1_vb2_index = readl(isp_dev->regs + REG_META1_VB2_INDEX);
> > +	spin_unlock_irqrestore(&isp_dev->spinlock_irq, flags);
> > +
> > +	/* Ignore unnecessary IRQ */
> > +	if (irqstatus == 0)
> > +		return IRQ_HANDLED;
> > +
> > +	errstatus = irqstatus & INT_ST_MASK_CAM_ERR;
> > +	warnstatus = irqstatus & INT_ST_MASK_CAM_WARN;
> > +	irqstatus = irqstatus & INT_ST_MASK_CAM;
> > +
> > +	/* sof , done order check . */
> > +	spin_lock_irqsave(&isp_dev->spinlock_irq, flags);
> > +	if ((irqstatus & HW_PASS1_DON_ST) && (irqstatus & SOF_INT_ST)) {
> > +		dev_warn(dev,
> > +			 "isp sof_don block, sof_cnt:%d\n",
> > +			 isp_dev->sof_count);
> > +
> > +		/* Notify IRQ event and enqueue ready frame */
> > +		irq_handle_notify_event(isp_dev, irqstatus, dmastatus);
> > +		isp_dev->current_frame = hw_frame_num;
> > +		isp_dev->meta0_vb2_index = meta0_vb2_index;
> > +		isp_dev->meta1_vb2_index = meta1_vb2_index;
> > +	} else {
> > +		if (irqstatus & SOF_INT_ST) {
> > +			isp_dev->current_frame = hw_frame_num;
> > +			isp_dev->meta0_vb2_index = meta0_vb2_index;
> > +			isp_dev->meta1_vb2_index = meta1_vb2_index;
> > +		}
> > +
> > +		if ((irqstatus & INT_ST_MASK_CAM) ||
> > +		    (dmastatus & DMA_ST_MASK_CAM))
> > +			irq_handle_notify_event(isp_dev, irqstatus, dmastatus);
> > +	}
> > +	spin_unlock_irqrestore(&isp_dev->spinlock_irq, flags);
> > +
> > +	if (irqstatus & SOF_INT_ST)
> > +		cq_num = irq_handle_sof(isp_dev, isp_ctx->scp_mem_iova,
> > +					hw_frame_num);
> > +
> > +	if (irqstatus & SW_PASS1_DON_ST) {
> > +		int num = atomic_dec_return(&isp_ctx->composing_frame);
> > +
> > +		dev_dbg(dev, "SW_PASS1_DON_ST queued frame:%d\n", num);
> > +		/* Notify TX thread to send if TX frame is blocked */
> > +		wake_up_interruptible
> > +				(&isp_ctx->composer_tx_thread.wq);
> > +	}
> > +
> > +	/* check ISP error status */
> > +	if (errstatus) {
> > +		dev_err(dev,
> > +			"raw_int_err:0x%x/0x%x/0x%x\n",
> > +			irqstatus, warnstatus, errstatus);
> > +
> > +		/* show DMA errors in detail */
> > +		if (errstatus & DMA_ERR_ST)
> > +			isp_dump_dma_status(isp_dev);
> > +	}
> > +
> > +	if (irqstatus & INT_ST_LOG_MASK_CAM)
> > +		dev_dbg(dev, IRQ_STAT_STR,
> > +			'A' + cardinalnum,
> > +			isp_dev->sof_count,
> > +			irqstatus,
> > +			dmastatus,
> > +			hw_frame_num,
> > +			cq_num);
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int enable_sys_clock(struct isp_p1_device *p1_dev)
> > +{
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +	int ret;
> > +
> > +	dev_info(dev, "- %s dev id:%d\n", __func__, dev->id);
> > +
> > +	ret = clk_bulk_prepare_enable(p1_dev->isp_clk.num_clks,
> > +				      p1_dev->isp_clk.clk_list);
> > +	if (ret < 0)
> > +		goto clk_err;
> > +	return 0;
> > +clk_err:
> > +	dev_err(dev, "cannot pre-en isp_cam clock:%d\n", ret);
> > +	clk_bulk_disable_unprepare(p1_dev->isp_clk.num_clks,
> > +				   p1_dev->isp_clk.clk_list);
> > +	return ret;
> > +}
> > +
> > +static void disable_sys_clock(struct isp_p1_device *p1_dev)
> > +{
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +
> > +	dev_info(dev, "- %s dev id:%d\n", __func__, dev->id);
> > +	clk_bulk_disable_unprepare(p1_dev->isp_clk.num_clks,
> > +				   p1_dev->isp_clk.clk_list);
> > +}
> > +
> > +static int mtk_isp_probe(struct platform_device *pdev)
> > +{
> > +	struct isp_p1_device *p1_dev;
> > +	struct mtk_isp_p1_ctx *isp_ctx;
> > +	struct isp_device *isp_dev;
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	int ret;
> > +	unsigned int i;
> > +
> > +	/* Allocate context */
> > +	p1_dev = devm_kzalloc(dev, sizeof(*p1_dev), GFP_KERNEL);
> > +	if (!p1_dev)
> > +		return -ENOMEM;
> > +
> > +	dev_set_drvdata(dev, p1_dev);
> > +	isp_ctx = &p1_dev->isp_ctx;
> > +	p1_dev->pdev = pdev;
> > +
> > +	p1_dev->isp_devs =
> > +		devm_kzalloc(dev,
> > +			     sizeof(struct isp_device) * ISP_DEV_NODE_NUM,
> > +			     GFP_KERNEL);
> > +	if (!p1_dev->isp_devs)
> > +		return -ENOMEM;
> > +
> > +	p1_dev->cam_dev =
> > +		devm_kzalloc(dev, sizeof(struct mtk_cam_dev), GFP_KERNEL);
> > +	if (!p1_dev->isp_devs)
> > +		return -ENOMEM;
> > +
> > +	/* iomap registers */
> > +	for (i = ISP_CAMSYS_CONFIG_IDX; i < ISP_DEV_NODE_NUM; i++) {
> > +		isp_dev = &p1_dev->isp_devs[i];
> > +		isp_dev->isp_hw_module = i;
> > +		isp_dev->dev = dev;
> > +		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> > +		isp_dev->regs = devm_ioremap_resource(dev, res);
> > +
> > +		dev_info(dev, "cam%u, map_addr=0x%lx\n",
> > +			 i, (unsigned long)isp_dev->regs);
> > +
> > +		if (!isp_dev->regs)
> > +			return PTR_ERR(isp_dev->regs);
> > +
> > +		/* support IRQ from ISP_CAM_A_IDX */
> > +		if (i >= ISP_CAM_A_IDX) {
> > +			/* reg & interrupts index is shifted with 1  */
> > +			isp_dev->irq = platform_get_irq(pdev, i - 1);
> > +			if (isp_dev->irq > 0) {
> > +				ret = devm_request_irq(dev, isp_dev->irq,
> > +						       isp_irq_cam,
> > +						       IRQF_SHARED,
> > +						       dev_driver_string(dev),
> > +						       (void *)isp_dev);
> > +				if (ret) {
> > +					dev_err(dev,
> > +						"req_irq fail, dev:%s irq=%d\n",
> > +						dev->of_node->name,
> > +						isp_dev->irq);
> > +					return ret;
> > +				}
> > +				dev_info(dev, "Registered irq=%d, ISR:%s\n",
> > +					 isp_dev->irq, dev_driver_string(dev));
> > +			}
> > +		}
> > +		spin_lock_init(&isp_dev->spinlock_irq);
> > +	}
> > +
> > +	p1_dev->isp_clk.num_clks = ARRAY_SIZE(mtk_isp_clks);
> > +	p1_dev->isp_clk.clk_list =
> > +		devm_kcalloc(dev,
> > +			     p1_dev->isp_clk.num_clks,
> > +			     sizeof(*p1_dev->isp_clk.clk_list),
> > +			     GFP_KERNEL);
> > +	if (!p1_dev->isp_clk.clk_list)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < p1_dev->isp_clk.num_clks; ++i)
> > +		p1_dev->isp_clk.clk_list->id = mtk_isp_clks[i];
> > +
> > +	ret = devm_clk_bulk_get(dev,
> > +				p1_dev->isp_clk.num_clks,
> > +				p1_dev->isp_clk.clk_list);
> > +	if (ret) {
> > +		dev_err(dev, "cannot get isp cam clock:%d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	/* Initialize reserved DMA memory */
> > +	ret = mtk_cam_reserved_memory_init(p1_dev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to configure DMA memory\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Initialize the v4l2 common part */
> > +	ret = mtk_cam_dev_init(pdev, p1_dev->cam_dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	spin_lock_init(&isp_ctx->p1_enqueue_list.lock);
> > +	atomic_set(&p1_dev->isp_ctx.isp_user_cnt, 0);
> > +	pm_runtime_enable(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_isp_remove(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct isp_p1_device *p1_dev = dev_get_drvdata(dev);
> > +
> > +	pm_runtime_disable(dev);
> > +	mtk_cam_dev_release(pdev, p1_dev->cam_dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_isp_suspend(struct device *dev)
> > +{
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> > +	struct isp_device *isp_dev;
> > +	unsigned int reg_val;
> > +	int usercount, module;
> > +
> > +	module = p1_dev->isp_ctx.isp_hw_module;
> > +	usercount = atomic_read(&p1_dev->isp_ctx.isp_user_cnt);
> > +
> > +	dev_dbg(dev, "- %s:%d\n", __func__, usercount);
> > +
> > +	/* If no user count, no further action */
> > +	if (!usercount)
> > +		return 0;
> > +
> > +	isp_dev = &p1_dev->isp_devs[module];
> > +	reg_val = readl(isp_dev->regs + REG_TG_VF_CON);
> > +	if (reg_val & VFDATA_EN_BIT) {
> > +		dev_dbg(dev, "Cam:%d suspend, disable VF\n", module);
> > +		/* disable VF */
> > +		writel((reg_val & (~VFDATA_EN_BIT)),
> > +		       isp_dev->regs + REG_TG_VF_CON);
> > +		/*
> > +		 * After VF enable, The TG frame count will be reset to 0;
> > +		 */
> > +		reg_val = readl(isp_dev->regs + REG_TG_SEN_MODE);
> > +		writel((reg_val & (~CMOS_EN_BIT)),
> > +		       isp_dev->regs +  + REG_TG_SEN_MODE);
> > +	}
> > +
> > +	disable_sys_clock(p1_dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_isp_resume(struct device *dev)
> > +{
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> > +	struct isp_device *isp_dev;
> > +	unsigned int reg_val;
> > +	int module, usercount;
> > +
> > +	module = p1_dev->isp_ctx.isp_hw_module;
> > +	usercount = atomic_read(&p1_dev->isp_ctx.isp_user_cnt);
> > +
> > +	dev_dbg(dev, "- %s:%d\n", __func__, usercount);
> > +
> > +	/* If no user count, no further action */
> > +	if (!usercount)
> > +		return 0;
> > +
> > +	enable_sys_clock(p1_dev);
> > +
> > +	/* V4L2 stream-on phase & restore HW stream-on status */
> > +	if (p1_dev->cam_dev->streaming) {
> > +		isp_dev = &p1_dev->isp_devs[module];
> > +		dev_dbg(dev, "Cam:%d resume,enable VF\n", module);
> > +		/* Enable CMOS */
> > +		reg_val = readl(isp_dev->regs + REG_TG_SEN_MODE);
> > +		writel((reg_val | CMOS_EN_BIT),
> > +		       isp_dev->regs + REG_TG_SEN_MODE);
> > +		/* Enable VF */
> > +		reg_val = readl(isp_dev->regs + REG_TG_VF_CON);
> > +		writel((reg_val | VFDATA_EN_BIT),
> > +		       isp_dev->regs + REG_TG_VF_CON);
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int isp_setup_scp_rproc(struct isp_p1_device *p1_dev)
> > +{
> > +	phandle rproc_phandle;
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +	int ret;
> > +
> > +	p1_dev->scp_pdev = scp_get_pdev(p1_dev->pdev);
> > +	if (!p1_dev->scp_pdev) {
> > +		dev_err(dev, "Failed to get scp device\n");
> > +		return -ENODEV;
> > +	}
> > +	ret = of_property_read_u32(dev->of_node, "mediatek,scp",
> > +				   &rproc_phandle);
> > +	if (ret) {
> > +		dev_err(dev, "fail to get rproc_phandle:%d\n", ret);
> > +		return -EINVAL;
> > +	}
> > +
> > +	p1_dev->rproc_handle = rproc_get_by_phandle(rproc_phandle);
> > +	dev_dbg(dev, "p1 rproc_phandle: 0x%pK\n\n",
> > +		p1_dev->rproc_handle);
> > +	if (!p1_dev->rproc_handle) {
> > +		dev_err(dev, "fail to get rproc_handle\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = rproc_boot(p1_dev->rproc_handle);
> > +	if (ret < 0) {
> > +		/*
> > +		 * Return 0 if downloading firmware successfully,
> > +		 * otherwise it is failed
> > +		 */
> > +		return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int isp_init_context(struct isp_p1_device *p1_dev)
> > +{
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +	unsigned int i;
> > +
> > +	dev_dbg(dev, "init irq work thread\n");
> > +	if (!isp_ctx->isp_deque_thread.thread) {
> > +		mutex_init(&isp_ctx->composer_tx_lock);
> > +		init_waitqueue_head(&isp_ctx->isp_deque_thread.wq);
> > +		isp_ctx->isp_deque_thread.thread =
> > +			kthread_run(isp_deque_work, (void *)p1_dev,
> > +				    "isp_deque_work");
> > +		if (IS_ERR(isp_ctx->isp_deque_thread.thread)) {
> > +			dev_err(dev, "unable to alloc kthread\n");
> > +			isp_ctx->isp_deque_thread.thread = NULL;
> > +			return -ENOMEM;
> > +		}
> > +	}
> > +	spin_lock_init(&isp_ctx->irq_dequeue_lock);
> > +
> > +	INIT_LIST_HEAD(&isp_ctx->p1_enqueue_list.queue);
> > +	atomic_set(&isp_ctx->p1_enqueue_list.queue_cnt, 0);
> > +
> > +	for (i = 0; i < ISP_DEV_NODE_NUM; i++)
> > +		spin_lock_init(&p1_dev->isp_devs[i].spinlock_irq);
> > +
> > +	spin_lock_init(&isp_ctx->p1_enqueue_list.lock);
> > +	spin_lock_init(&isp_ctx->composer_txlist.lock);
> > +
> > +	atomic_set(&isp_ctx->irq_data_end, 0);
> > +	atomic_set(&isp_ctx->irq_data_start, 0);
> > +	return 0;
> > +}
> > +
> > +static int isp_uninit_context(struct isp_p1_device *p1_dev)
> > +{
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	struct mtk_isp_queue_job *framejob, *tmp_framejob;
> > +
> > +	spin_lock_irq(&isp_ctx->p1_enqueue_list.lock);
> > +	list_for_each_entry_safe(framejob, tmp_framejob,
> > +				 &isp_ctx->p1_enqueue_list.queue, list_entry) {
> > +		list_del(&framejob->list_entry);
> > +		kfree(framejob);
> > +	}
> > +	spin_unlock_irq(&isp_ctx->p1_enqueue_list.lock);
> > +
> > +	atomic_set(&isp_ctx->isp_user_cnt, 0);
> > +
> > +	if (!IS_ERR(isp_ctx->isp_deque_thread.thread)) {
> > +		kthread_stop(isp_ctx->isp_deque_thread.thread);
> > +		wake_up_interruptible(&isp_ctx->isp_deque_thread.wq);
> > +		isp_ctx->isp_deque_thread.thread = NULL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned int get_enable_dma_ports(struct mtk_cam_dev *cam_dev)
> 
> I think s/enable/enabled would be a clearer name for both the function
> and local variable.
> 

Ok, we will revised this "enabled" working in next patch.

> > +{
> > +	unsigned int enable_dma_ports, i;
> > +
> > +	/* Get the enabled meta DMA ports */
> > +	enable_dma_ports = 0;
> > +	for (i = 0; i < cam_dev->dev_node_num; i++) {
> > +		if (cam_dev->mem2mem2_nodes[i].enabled)
> > +			enable_dma_ports |=
> > +				cam_dev->mem2mem2_nodes[i].desc.dma_port;
> > +	}
> > +	dev_dbg(&cam_dev->pdev->dev, "%s enable_dma_ports:0x%x",
> > +		__func__, enable_dma_ports);
> > +
> > +	return enable_dma_ports;
> > +}
> > +
> > +/* Utility functions */
> > +static unsigned int get_sensor_pixel_id(unsigned int fmt)
> > +{
> > +	switch (fmt) {
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> > +		return raw_pxl_id_b;
> > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> > +		return raw_pxl_id_gb;
> > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> > +		return raw_pxl_id_gr;
> > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> > +		return raw_pxl_id_r;
> > +	default:
> > +		return raw_pxl_id_b;
> > +	}
> > +}
> > +
> > +static unsigned int get_sensor_fmt(unsigned int fmt)
> > +{
> > +	switch (fmt) {
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +		return img_fmt_bayer8;
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +		return img_fmt_bayer10;
> > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +		return img_fmt_bayer12;
> > +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> > +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> > +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> > +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> > +		return img_fmt_bayer14;
> > +	default:
> > +		return img_fmt_unknown;
> > +	}
> > +}
> > +
> > +static unsigned int get_img_fmt(unsigned int fourcc)
> > +{
> > +	switch (fourcc) {
> > +	case V4L2_PIX_FMT_MTISP_B8:
> > +		return img_fmt_bayer8;
> > +	case V4L2_PIX_FMT_MTISP_F8:
> > +		return img_fmt_fg_bayer8;
> > +	case V4L2_PIX_FMT_MTISP_B10:
> > +		return img_fmt_bayer10;
> > +	case V4L2_PIX_FMT_MTISP_F10:
> > +		return img_fmt_fg_bayer10;
> > +	case V4L2_PIX_FMT_MTISP_B12:
> > +		return img_fmt_bayer12;
> > +	case V4L2_PIX_FMT_MTISP_F12:
> > +		return img_fmt_fg_bayer12;
> > +	case V4L2_PIX_FMT_MTISP_B14:
> > +		return img_fmt_bayer14;
> > +	case V4L2_PIX_FMT_MTISP_F14:
> > +		return img_fmt_fg_bayer14;
> > +	default:
> > +		return img_fmt_unknown;
> > +	}
> > +}
> > +
> > +static unsigned int get_pixel_byte(unsigned int fourcc)
> > +{
> > +	switch (fourcc) {
> > +	case V4L2_PIX_FMT_MTISP_B8:
> > +	case V4L2_PIX_FMT_MTISP_F8:
> > +		return 8;
> > +	case V4L2_PIX_FMT_MTISP_B10:
> > +	case V4L2_PIX_FMT_MTISP_F10:
> > +		return 10;
> > +	case V4L2_PIX_FMT_MTISP_B12:
> > +	case V4L2_PIX_FMT_MTISP_F12:
> > +		return 12;
> > +	case V4L2_PIX_FMT_MTISP_B14:
> > +	case V4L2_PIX_FMT_MTISP_F14:
> > +		return 14;
> > +	case V4L2_PIX_FMT_MTISP_U8:
> > +	case V4L2_PIX_FMT_MTISP_U10:
> > +	case V4L2_PIX_FMT_MTISP_U12:
> > +	case V4L2_PIX_FMT_MTISP_U14:
> > +		return 16;
> > +	default:
> > +		return 10;
> > +	}
> > +}
> > +
> > +static void composer_deinit_done_cb(void *data)
> > +{
> > +	struct isp_p1_device *p1_dev = p1_ctx_to_dev(data);
> > +
> > +	disable_sys_clock(p1_dev);
> > +	/* Notify PM */
> > +	pm_runtime_put_sync(&p1_dev->pdev->dev);
> > +}
> > +
> > +/* ISP P1 interface functions */
> > +int mtk_isp_open(struct device *dev)
> > +{
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	s32 usercount = atomic_inc_return(&isp_ctx->isp_user_cnt);
> > +	int ret;
> > +
> > +	dev_dbg(dev, "%s usercount=%d\n", __func__, usercount);
> > +
> > +	if (usercount == 1) {
> > +		ret = isp_setup_scp_rproc(p1_dev);
> > +		if (ret)
> > +			goto scp_err;
> > +
> > +		/* ISP HW INIT */
> > +		isp_ctx->isp_hw_module = ISP_CAM_B_IDX;
> > +		/* Use pure RAW as default HW path */
> > +		isp_ctx->isp_raw_path = ISP_PURE_RAW_PATH;
> > +		/* Check enabled DMAs which is configured by media setup */
> > +		isp_ctx->enable_dma_ports =
> > +			get_enable_dma_ports(p1_dev->cam_dev);
> > +
> > +		if (!isp_ctx->enable_dma_ports) {
> > +			dev_dbg(dev, "No DMAs are enabled\n");
> > +			ret = -EINVAL;
> > +			goto scp_err;
> > +		}
> > +
> > +		pm_runtime_get_sync(dev);
> > +
> > +		ret = isp_init_context(p1_dev);
> > +		if (ret)
> > +			goto ctx_err;
> > +		ret = isp_composer_init(isp_ctx);
> > +		if (ret)
> > +			goto composer_err;
> > +		ret = isp_composer_hw_init(isp_ctx);
> > +		if (ret)
> > +			goto composer_err;
> > +
> > +		isp_composer_meta_config(&p1_dev->isp_ctx,
> > +					 isp_ctx->enable_dma_ports);
> > +	}
> > +
> > +	return 0;
> > +composer_err:
> > +	isp_uninit_context(p1_dev);
> > +ctx_err:
> > +	pm_runtime_put_sync(dev);
> > +scp_err:
> > +	atomic_dec_return(&isp_ctx->isp_user_cnt);
> > +	return ret;
> > +}
> > +
> > +int mtk_isp_release(struct device *dev)
> > +{
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +
> > +	if (atomic_dec_and_test(&p1_dev->isp_ctx.isp_user_cnt)) {
> > +		isp_composer_hw_deinit(isp_ctx, composer_deinit_done_cb);
> > +		isp_uninit_context(p1_dev);
> > +	}
> > +
> > +	dev_dbg(dev, "%s usercount=%d\n", __func__,
> > +		atomic_read(&p1_dev->isp_ctx.isp_user_cnt));
> > +
> > +	return 0;
> > +}
> > +
> > +int mtk_isp_config(struct device *dev)
> > +{
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	struct p1_config_param config_param;
> > +	struct mtk_cam_dev *cam_dev = p1_dev->cam_dev;
> > +	struct v4l2_subdev_format sd_format;
> > +	unsigned int sd_width, sd_height;
> > +	unsigned int enable_dma_ports, idx;
> > +	int ret;
> > +
> > +	p1_dev->isp_devs[isp_ctx->isp_hw_module].current_frame = 0;
> > +	p1_dev->isp_devs[isp_ctx->isp_hw_module].sof_count = 0;
> > +
> > +	isp_ctx->frame_seq_no = 1;
> > +	atomic_set(&isp_ctx->composed_frame_id, 0);
> > +
> > +	/* Get the enabled DMA ports */
> > +	enable_dma_ports = isp_ctx->enable_dma_ports;
> > +	dev_dbg(dev, "%s enable_dma_ports:0x%x", __func__, enable_dma_ports);
> > +
> > +	/* sensor config */
> > +	sd_format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > +	ret = v4l2_subdev_call(cam_dev->sensor,
> > +			       pad, get_fmt, NULL, &sd_format);
> > +
> > +	if (ret) {
> > +		dev_dbg(dev, "sensor:%s g_fmt on failed:%d\n",
> > +			cam_dev->sensor->entity.name, ret);
> > +		return -EPERM;
> > +	}
> > +
> > +	dev_dbg(dev,
> > +		"sensor get_fmt ret=%d, w=%d, h=%d, code=0x%x, field=%d, color=%d\n",
> > +		ret, sd_format.format.width, sd_format.format.height,
> > +		sd_format.format.code, sd_format.format.field,
> > +		sd_format.format.colorspace);
> > +
> > +	config_param.cfg_in_param.continuous = 0x1;
> > +	config_param.cfg_in_param.subsample = 0x0;
> > +	/* fix to one pixel mode in default */
> > +	config_param.cfg_in_param.pixel_mode = one_pixel_mode;
> > +	/* support normal pattern in default */
> > +	config_param.cfg_in_param.data_pattern = 0x0;
> > +
> > +	config_param.cfg_in_param.crop.left = 0x0;
> > +	config_param.cfg_in_param.crop.top = 0x0;
> > +
> > +	config_param.cfg_in_param.raw_pixel_id =
> > +		get_sensor_pixel_id(sd_format.format.code);
> > +	config_param.cfg_in_param.img_fmt =
> > +		get_sensor_fmt(sd_format.format.code);
> > +	config_param.cfg_in_param.crop.width = sd_format.format.width;
> > +	config_param.cfg_in_param.crop.height = sd_format.format.height;
> > +	sd_width = sd_format.format.width;
> > +	sd_height = sd_format.format.height;
> > +
> > +	idx = MTK_CAM_P1_MAIN_STREAM_OUT;
> 
> The idx variable is unnecessary. Just use MTK_CAM_P1_... to index into
> mem2mem2_nodes directly here and below.
> 

Ok, we will remove idx variable and use const value to index.

> > +	if ((enable_dma_ports & R_IMGO) == R_IMGO) {
> > +		struct v4l2_format *imgo_fmt =
> > +			&p1_dev->cam_dev->mem2mem2_nodes[idx].vdev_fmt;
> > +
> > +		config_param.cfg_main_param.pure_raw = isp_ctx->isp_raw_path;
> > +		config_param.cfg_main_param.pure_raw_pack = 1;
> > +		config_param.cfg_main_param.bypass = 0;
> > +
> > +		config_param.cfg_main_param.output.img_fmt =
> > +			get_img_fmt(imgo_fmt->fmt.pix_mp.pixelformat);
> > +		config_param.cfg_main_param.output.pixel_byte =
> > +			get_pixel_byte(imgo_fmt->fmt.pix_mp.pixelformat);
> > +		config_param.cfg_main_param.output.size.w =
> > +			imgo_fmt->fmt.pix_mp.width;
> > +		config_param.cfg_main_param.output.size.h =
> > +			imgo_fmt->fmt.pix_mp.height;
> > +
> > +		config_param.cfg_main_param.output.size.stride =
> > +			imgo_fmt->fmt.pix_mp.plane_fmt[0].bytesperline;
> > +		config_param.cfg_main_param.output.size.xsize =
> > +			imgo_fmt->fmt.pix_mp.plane_fmt[0].bytesperline;
> > +
> > +		config_param.cfg_main_param.output.crop.left = 0x0;
> > +		config_param.cfg_main_param.output.crop.top = 0x0;
> > +
> > +		config_param.cfg_main_param.output.crop.width = sd_width;
> > +		config_param.cfg_main_param.output.crop.height = sd_height;
> > +
> > +		WARN_ONCE(imgo_fmt->fmt.pix_mp.width > sd_width ||
> > +			  imgo_fmt->fmt.pix_mp.height > sd_height,
> > +			  "img out:%d:%d in:%d:%d",
> > +			  imgo_fmt->fmt.pix_mp.width,
> > +			  imgo_fmt->fmt.pix_mp.height,
> > +			  sd_width,
> > +			  sd_height);
> > +
> > +		dev_dbg(dev,
> > +			"imgo pixel_byte:%d img_fmt:0x%x raw:%d\n",
> > +			config_param.cfg_main_param.output.pixel_byte,
> > +			config_param.cfg_main_param.output.img_fmt,
> > +			config_param.cfg_main_param.pure_raw);
> > +		dev_dbg(dev,
> > +			"imgo param:size=%0dx%0d, stride:%d,xsize:%d,crop=%0dx%0d\n",
> > +			config_param.cfg_main_param.output.size.w,
> > +			config_param.cfg_main_param.output.size.h,
> > +			config_param.cfg_main_param.output.size.stride,
> > +			config_param.cfg_main_param.output.size.xsize,
> > +			config_param.cfg_main_param.output.crop.width,
> > +			config_param.cfg_main_param.output.crop.height);
> > +	} else {
> > +		config_param.cfg_main_param.bypass = 1;
> > +	}
> > +
> > +	idx = MTK_CAM_P1_PACKED_BIN_OUT;
> > +	if ((enable_dma_ports & R_RRZO) == R_RRZO) {
> > +		struct v4l2_format *rrzo_fmt =
> > +			&p1_dev->cam_dev->mem2mem2_nodes[idx].vdev_fmt;
> > +
> > +		config_param.cfg_resize_param.bypass = 0;
> > +		config_param.cfg_resize_param.output.img_fmt =
> > +			get_img_fmt(rrzo_fmt->fmt.pix_mp.pixelformat);
> > +		config_param.cfg_resize_param.output.pixel_byte =
> > +			get_pixel_byte(rrzo_fmt->fmt.pix_mp.pixelformat);
> > +		config_param.cfg_resize_param.output.size.w =
> > +			rrzo_fmt->fmt.pix_mp.width;
> > +		config_param.cfg_resize_param.output.size.h =
> > +			rrzo_fmt->fmt.pix_mp.height;
> > +		config_param.cfg_resize_param.output.size.stride =
> > +			rrzo_fmt->fmt.pix_mp.plane_fmt[0].bytesperline;
> > +		config_param.cfg_resize_param.output.size.xsize =
> > +			rrzo_fmt->fmt.pix_mp.plane_fmt[0].bytesperline;
> > +
> > +		config_param.cfg_resize_param.output.crop.left = 0x0;
> > +		config_param.cfg_resize_param.output.crop.top = 0x0;
> > +		config_param.cfg_resize_param.output.crop.width = sd_width;
> > +		config_param.cfg_resize_param.output.crop.height = sd_height;
> > +
> > +		WARN_ONCE(rrzo_fmt->fmt.pix_mp.width > sd_width ||
> > +			  rrzo_fmt->fmt.pix_mp.height > sd_height,
> > +			  "rrz out:%d:%d in:%d:%d",
> > +			  rrzo_fmt->fmt.pix_mp.width,
> > +			  rrzo_fmt->fmt.pix_mp.height,
> > +			  sd_width,
> > +			  sd_height);
> > +
> > +		dev_dbg(dev, "rrzo pixel_byte:%d img_fmt:0x%x\n",
> > +			config_param.cfg_resize_param.output.pixel_byte,
> > +			config_param.cfg_resize_param.output.img_fmt);
> > +		dev_dbg(dev,
> > +			"rrzo param:size=%0dx%0d,stride:%d,xsize:%d,crop=%0dx%0d\n",
> > +			config_param.cfg_resize_param.output.size.w,
> > +			config_param.cfg_resize_param.output.size.h,
> > +			config_param.cfg_resize_param.output.size.stride,
> > +			config_param.cfg_resize_param.output.size.xsize,
> > +			config_param.cfg_resize_param.output.crop.width,
> > +			config_param.cfg_resize_param.output.crop.height);
> > +	} else {
> > +		config_param.cfg_resize_param.bypass = 1;
> > +	}
> > +
> > +	/* Configure meta DMAs info. */
> > +	config_param.cfg_meta_param.enabled_meta_dmas = enable_dma_ports;
> > +
> > +	isp_composer_hw_config(isp_ctx, &config_param);
> > +
> > +	dev_dbg(dev, "%s done\n", __func__);
> > +	return 0;
> > +}
> > +
> > +int mtk_isp_enqueue(struct device *dev,
> > +		    unsigned int dma_port,
> > +		    struct mtk_cam_dev_buffer *buffer)
> > +{
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	struct mtk_isp_scp_p1_cmd frameparams;
> > +
> > +	memset(&frameparams, 0, sizeof(frameparams));
> > +
> > +	frameparams.cmd_id = ISP_CMD_ENQUEUE_META;
> > +	frameparams.meta_frame.enabled_dma = dma_port;
> > +	frameparams.meta_frame.vb_index = buffer->vbb.vb2_buf.index;
> > +	frameparams.meta_frame.meta_addr.iova = buffer->daddr;
> > +	frameparams.meta_frame.meta_addr.scp_addr = buffer->scp_addr;
> > +
> > +	isp_composer_enqueue(isp_ctx, &frameparams, SCP_ISP_CMD);
> > +
> > +	return 0;
> > +}
> > +
> > +int mtk_isp_req_enqueue(struct device *dev,
> > +			struct mtk_cam_dev_start_param *frameparamsbase)
> > +{
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	struct p1_frame_param frameparams;
> > +	struct mtk_isp_queue_job *framejob;
> > +	struct mtk_cam_dev_buffer **bundle_buffers;
> > +	unsigned int i, idx;
> > +
> > +	framejob = kzalloc(sizeof(*framejob), GFP_ATOMIC);
> > +	memset(framejob, 0, sizeof(*framejob));
> > +	memset(&frameparams, 0, sizeof(frameparams));
> > +	INIT_LIST_HEAD(&framejob->list_buf);
> > +
> > +	bundle_buffers = &frameparamsbase->buffers[0];
> > +	frameparams.frame_seq_no = isp_ctx->frame_seq_no++;
> > +	frameparams.sof_idx =
> > +		p1_dev->isp_devs[isp_ctx->isp_hw_module].sof_count;
> > +	framejob->request_fd = frameparamsbase->request_fd;
> > +	framejob->frame_seq_no = frameparams.frame_seq_no;
> > +
> > +	idx = MTK_CAM_P1_META_IN_0;
> > +	if (bundle_buffers[idx]) {
> > +		frameparams.tuning_addr.iova =
> > +			bundle_buffers[idx]->daddr;
> > +		frameparams.tuning_addr.scp_addr =
> > +			bundle_buffers[idx]->scp_addr;
> > +		list_add_tail(&bundle_buffers[idx]->list,
> > +			      &framejob->list_buf);
> > +	}
> > +
> > +	/* Image output */
> > +	idx = MTK_CAM_P1_MAIN_STREAM_OUT;
> > +	if (bundle_buffers[idx]) {
> > +		frameparams.img_dma_buffers[0].buffer.iova =
> > +			bundle_buffers[idx]->daddr;
> > +		frameparams.img_dma_buffers[0].buffer.scp_addr =
> > +			bundle_buffers[idx]->scp_addr;
> > +		dev_dbg(dev, "main stream address iova:0x%x\n",
> > +			frameparams.img_dma_buffers[0].buffer.iova);
> > +		list_add_tail(&bundle_buffers[idx]->list,
> > +			      &framejob->list_buf);
> > +	}
> > +
> > +	/* Resize output */
> > +	idx = MTK_CAM_P1_PACKED_BIN_OUT;
> > +	if (bundle_buffers[idx]) {
> > +		frameparams.img_dma_buffers[1].buffer.iova =
> > +			bundle_buffers[idx]->daddr;
> > +		frameparams.img_dma_buffers[1].buffer.scp_addr =
> > +			bundle_buffers[idx]->scp_addr;
> > +		dev_dbg(dev, "packed out address iova:0x%x\n",
> > +			frameparams.img_dma_buffers[1].buffer.iova);
> > +		list_add_tail(&bundle_buffers[idx]->list,
> > +			      &framejob->list_buf);
> > +	}
> > +
> > +	/* Meta output DMAs */
> > +	for (i = 0; i < MAX_META_DMA_NODES; i++) {
> > +		idx = MTK_CAM_P1_META_OUT_0 + i;
> > +		if (bundle_buffers[idx]) {
> > +			frameparams.meta_addrs[i].iova =
> > +			  bundle_buffers[idx]->daddr;
> > +			frameparams.meta_addrs[i].scp_addr =
> > +			  bundle_buffers[idx]->scp_addr;
> > +			list_add_tail(&bundle_buffers[idx]->list,
> > +				      &framejob->list_buf);
> > +		} else {
> > +			frameparams.meta_addrs[i].iova = 0;
> > +			frameparams.meta_addrs[i].scp_addr = 0;
> > +		}
> > +	}
> > +
> > +	spin_lock(&isp_ctx->p1_enqueue_list.lock);
> > +	list_add_tail(&framejob->list_entry, &isp_ctx->p1_enqueue_list.queue);
> > +	atomic_inc(&isp_ctx->p1_enqueue_list.queue_cnt);
> > +	spin_unlock(&isp_ctx->p1_enqueue_list.lock);
> > +
> > +	isp_composer_enqueue(isp_ctx, &frameparams, SCP_ISP_FRAME);
> > +	dev_dbg(dev, "request fd:%d frame_seq_no:%d is queued cnt:%d\n",
> > +		frameparamsbase->request_fd,
> > +		frameparams.frame_seq_no,
> > +		atomic_read(&isp_ctx->p1_enqueue_list.queue_cnt));
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops mtk_isp_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(mtk_isp_suspend, mtk_isp_resume)
> > +	SET_RUNTIME_PM_OPS(mtk_isp_suspend, mtk_isp_resume, NULL)
> > +};
> > +
> > +static struct platform_driver mtk_isp_driver = {
> > +	.probe   = mtk_isp_probe,
> > +	.remove  = mtk_isp_remove,
> > +	.driver  = {
> > +		.name  = "mtk-cam",
> > +		.of_match_table = of_match_ptr(mtk_isp_of_ids),
> > +		.pm     = &mtk_isp_pm_ops,
> > +	}
> > +};
> > +
> > +module_platform_driver(mtk_isp_driver);
> > +
> > +MODULE_DESCRIPTION("Camera ISP driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
> > new file mode 100644
> > index 000000000000..6cf8bb4ba93a
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
> > @@ -0,0 +1,300 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + * Author: Ryan Yu <ryan.yu@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef __CAMERA_ISP_H
> > +#define __CAMERA_ISP_H
> > +
> > +#include <linux/cdev.h>
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/ioctl.h>
> > +#include <linux/irqreturn.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/pm_qos.h>
> > +#include <linux/scatterlist.h>
> > +
> > +#include "mtk_cam-dev.h"
> > +#include "mtk_cam-scp.h"
> > +
> > +#define CAM_A_MAX_WIDTH		3328U
> > +#define CAM_A_MAX_HEIGHT	2496U
> > +#define CAM_B_MAX_WIDTH		5376U
> > +#define CAM_B_MAX_HEIGHT	4032U
> > +
> > +#define CAM_MIN_WIDTH		80U
> > +#define CAM_MIN_HEIGHT		60U
> > +
> > +#define IMG_MAX_WIDTH		CAM_B_MAX_WIDTH
> > +#define IMG_MAX_HEIGHT		CAM_B_MAX_HEIGHT
> > +#define IMG_MIN_WIDTH		CAM_MIN_WIDTH
> > +#define IMG_MIN_HEIGHT		CAM_MIN_HEIGHT
> > +
> > +#define RRZ_MAX_WIDTH		CAM_B_MAX_WIDTH
> > +#define RRZ_MAX_HEIGHT		CAM_B_MAX_HEIGHT
> > +#define RRZ_MIN_WIDTH		CAM_MIN_WIDTH
> > +#define RRZ_MIN_HEIGHT		CAM_MIN_HEIGHT
> > +
> > +#define R_IMGO		BIT(0)
> > +#define R_RRZO		BIT(1)
> > +#define R_AAO		BIT(3)
> > +#define R_AFO		BIT(4)
> > +#define R_LCSO		BIT(5)
> > +#define R_PDO		BIT(6)
> > +#define R_LMVO		BIT(7)
> > +#define R_FLKO		BIT(8)
> > +#define R_RSSO		BIT(9)
> > +#define R_PSO		BIT(10)
> > +
> > +#define ISP_COMPOSING_MAX_NUM		4
> > +#define ISP_FRAME_COMPOSING_MAX_NUM	3
> > +
> > +#define IRQ_DATA_BUF_SIZE		4
> > +#define COMPOSRE_EVENT_BUF_SIZE		4
> > +
> > +#define CQ_ADDRESS_OFFSET		0x640
> > +#define CQ_BUFFER_COUNT			3
> 
> Please align macro values using tabs.
> 
> > +
> > +#define IRQ_STAT_STR "cam%c, SOF_%d irq(0x%x), " \
> > +			"dma(0x%x), frame_num(%d)/cq_num(%d)\n"
> > +
> > +/*
> > + * In order with the sequence of device nodes defined in dtsi rule,
> > + * one hardware module should be mapping to one node.
> > + */
> > +enum isp_dev_node_enum {
> > +	ISP_CAMSYS_CONFIG_IDX = 0,
> > +	ISP_CAM_UNI_IDX,
> > +	ISP_CAM_A_IDX,
> > +	ISP_CAM_B_IDX,
> > +	ISP_DEV_NODE_NUM
> > +};
> > +
> > +/* Image RAW path for ISP P1 module. */
> > +enum isp_raw_path_enum {
> > +	ISP_PROCESS_RAW_PATH = 0,
> > +	ISP_PURE_RAW_PATH
> > +};
> > +
> > +enum {
> > +	img_fmt_unknown		= 0x0000,
> > +	img_fmt_raw_start	= 0x2200,
> > +	img_fmt_bayer8		= img_fmt_raw_start,
> > +	img_fmt_bayer10,
> > +	img_fmt_bayer12,
> > +	img_fmt_bayer14,
> > +	img_fmt_fg_bayer8,
> > +	img_fmt_fg_bayer10,
> > +	img_fmt_fg_bayer12,
> > +	img_fmt_fg_bayer14,
> > +};
> > +
> > +enum {
> > +	raw_pxl_id_b   = 0,
> > +	raw_pxl_id_gb,
> > +	raw_pxl_id_gr,
> > +	raw_pxl_id_r
> > +};
> > +
> > +enum {
> > +	default_pixel_mode = 0,
> > +	one_pixel_mode,
> > +	two_pixel_mode,
> > +	four_pixel_mode,
> > +	pixel_mode_num,
> > +};
> > +
> > +enum mtk_isp_scp_ipi_type {
> > +	SCP_ISP_CMD = 0,
> > +	SCP_ISP_FRAME,
> > +};
> > +
> > +struct isp_queue {
> > +	struct list_head queue;
> > +	atomic_t queue_cnt;
> > +	spinlock_t lock; /* queue attributes protection */
> > +};
> > +
> > +struct isp_thread {
> > +	struct task_struct *thread;
> > +	wait_queue_head_t wq;
> > +};
> > +
> > +struct mtk_isp_queue_work {
> > +	union {
> > +		struct mtk_isp_scp_p1_cmd cmd;
> > +		struct p1_frame_param frameparams;
> > +	};
> > +	struct list_head list_entry;
> > +	enum mtk_isp_scp_ipi_type type;
> > +};
> > +
> > +struct mtk_cam_dev_stat_event_data {
> > +	__u32 frame_seq_no;
> > +	__u32 meta0_vb2_index;
> > +	__u32 meta1_vb2_index;
> > +	__u32 irq_status_mask;
> > +	__u32 dma_status_mask;
> > +};
> > +
> > +struct mtk_isp_queue_job {
> > +	struct list_head list_entry;
> > +	struct list_head list_buf;
> > +	unsigned int request_fd;
> > +	unsigned int frame_seq_no;
> > +};
> > +
> > +struct isp_clk_struct {
> > +	int num_clks;
> > +	struct clk_bulk_data *clk_list;
> > +};
> > +
> > +struct isp_device {
> > +	struct device *dev;
> > +	void __iomem *regs;
> > +	int irq;
> > +	spinlock_t spinlock_irq; /* ISP reg setting integrity */
> > +	unsigned int current_frame;
> > +	unsigned int meta0_vb2_index;
> > +	unsigned int meta1_vb2_index;
> > +	u8 sof_count;
> > +	u8 isp_hw_module;
> > +};
> > +
> > +struct mtk_isp_p1_ctx {
> > +	struct isp_queue composer_txlist;
> > +	struct isp_thread composer_tx_thread;
> > +	atomic_t cmd_queued;
> > +	struct mutex composer_tx_lock; /* isp composer work protection */
> > +
> > +	struct isp_thread composer_rx_thread;
> > +	struct mtk_isp_scp_p1_cmd composer_evts[COMPOSRE_EVENT_BUF_SIZE];
> > +	atomic_t composer_evts_start;
> > +	atomic_t composer_evts_end;
> > +	spinlock_t composer_evts_lock; /* SCP events protection */
> > +	/* increase after ipi */
> > +	atomic_t ipi_occupied;
> > +	/* increase after frame enqueue */
> > +	atomic_t composing_frame;
> > +	/* current composed frame id */
> > +	atomic_t composed_frame_id;
> > +
> > +	struct isp_queue p1_enqueue_list;
> > +
> > +	struct isp_thread isp_deque_thread;
> > +	struct mtk_cam_dev_stat_event_data irq_event_datas[IRQ_DATA_BUF_SIZE];
> > +	atomic_t irq_data_start;
> > +	atomic_t irq_data_end;
> > +	spinlock_t irq_dequeue_lock; /* ISP frame dequeuq protection */
> > +
> > +	dma_addr_t scp_mem_pa;
> > +	dma_addr_t scp_mem_iova;
> > +	struct sg_table sgtable;
> > +
> > +	/* increase after open, decrease when close */
> > +	atomic_t isp_user_cnt;
> > +	/* frame sequence number, increase per en-queue*/
> > +	int frame_seq_no;
> > +	unsigned int isp_hw_module;
> > +	unsigned int isp_raw_path;
> > +	unsigned int enable_dma_ports;
> > +
> > +	void (*composer_deinit_donecb)(void *isp_ctx);
> > +
> > +	struct list_head list;
> > +};
> > +
> > +struct isp_p1_device {
> > +	struct platform_device *pdev;
> > +
> > +	/* for SCP driver  */
> > +	struct platform_device *scp_pdev;
> > +	struct rproc *rproc_handle;
> > +
> > +	struct mtk_isp_p1_ctx isp_ctx;
> > +	struct isp_clk_struct isp_clk;
> 
> What's the benefit of having mtk_isp_p1_ctx and isp_clk_struct in
> separate structs? They are only ever used in isp_p1_device.
> 

Ok, we will merge isp_clk_struct into mtk_isp_p1_ctx in next patch.

> > +	struct mtk_cam_dev *cam_dev;
> > +	struct isp_device *isp_devs;
> 
> Similarly, why are these allocated at runtime rather then just members
> of the struct?
> 

Ok, we will revise new isp_p1_device structure as below list:

struct isp_p1_device {
	struct platform_device *pdev;
	struct platform_device *scp_pdev;
	struct rproc *rproc_handle;
	struct mtk_isp_p1_ctx isp_ctx;
	struct mtk_cam_dev cam_dev;
	struct isp_device isp_devs[ISP_DEV_NODE_NUM];
};


> In mtk_isp_probe the struct isp_p1_device is allocated, and immediately
> afterwards the struct mtk_cam_dev and struct isp_devices are. There will
> only ever be ISP_DEV_NODE_NUM isp_devices.
> 
> Could this be changed to:
> 	struct mtk_cam_dev cam_dev;
> 	struct isp_device isp_devs[ISP_DEV_NODE_NUM];
> ?
> 

Yes, thanks for your suggestion as above.

> > +};
> > +
> > +static inline struct isp_p1_device *
> > +p1_ctx_to_dev(const struct mtk_isp_p1_ctx *__p1_ctx)
> > +{
> > +	return container_of(__p1_ctx, struct isp_p1_device, isp_ctx);
> > +}
> > +
> > +static inline struct isp_p1_device *get_p1_device(struct device *dev)
> > +{
> > +	return ((struct isp_p1_device *)dev_get_drvdata(dev));
> > +}
> > +
> > +int isp_composer_init(struct mtk_isp_p1_ctx *isp_ctx);
> > +int isp_composer_hw_init(struct mtk_isp_p1_ctx *isp_ctx);
> > +void isp_composer_meta_config(struct mtk_isp_p1_ctx *isp_ctx,
> > +			      unsigned int dma);
> > +void isp_composer_hw_config(struct mtk_isp_p1_ctx *isp_ctx,
> > +			    struct p1_config_param *config_param);
> > +void isp_composer_stream(struct mtk_isp_p1_ctx *isp_ctx, int on);
> > +void isp_composer_hw_deinit(struct mtk_isp_p1_ctx *isp_ctx,
> > +			    void (*donecb)(void *data));
> > +void isp_composer_enqueue(struct mtk_isp_p1_ctx *isp_ctx,
> > +			  void *data,
> > +			  enum mtk_isp_scp_ipi_type type);
> 
> These functions are declared here, but implemented in mtk_cam-scp.c.
> Can the funtion declarations be moved to mtk_cam-scp.h?
> 

Ok, we will revise these function declared in next patch.

Best regards,


Jungo 

> > +
> > +/**
> > + * mtk_isp_open - open isp driver and initialize related resources.
> > + *
> > + * @dev:	isp device.
> > + *
> > + */
> > +int mtk_isp_open(struct device *dev);
> > +
> > +/**
> > + * mtk_isp_release - release isp driver and related resources.
> > + *
> > + * @dev:	isp device.
> > + *
> > + */
> > +int mtk_isp_release(struct device *dev);
> > +
> > +/**
> > + * mtk_isp_config - output image & meta data configuration.
> > + *
> > + * @dev:	isp device.
> > + *
> > + */
> > +int mtk_isp_config(struct device *dev);
> > +
> > +/**
> > + * mtk_isp_req_enqueue - enqueue a frame bundle (per-frame basis) to ISP driver.
> > + *
> > + * @dev:	isp device.
> > + * @frameparamsbase: pointer to &struct mtk_cam_dev_start_param.
> > + *
> > + */
> > +int mtk_isp_req_enqueue(struct device *dev,
> > +			struct mtk_cam_dev_start_param *frameparamsbase);
> > +
> > +/**
> > + * mtk_isp_enqueue - enqueue a single frame to ISP driver
> > + * for non-per-frame DMA.
> > + *
> > + * @dev:	isp device.
> > + * @buffer: pointer to &struct mtk_cam_dev_buffer.
> > + *
> > + */
> > +int mtk_isp_enqueue(struct device *dev,
> > +		    unsigned int dma_idx,
> > +		    struct mtk_cam_dev_buffer *buffer);
> > +#endif /*__CAMERA_ISP_H*/
> > -- 
> > 2.18.0
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


