Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC206F13D
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2019 04:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfGUCSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jul 2019 22:18:52 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:37930 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725996AbfGUCSw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jul 2019 22:18:52 -0400
X-UUID: 2bfb44cd0eed4d9fb2730924798f9dc4-20190721
X-UUID: 2bfb44cd0eed4d9fb2730924798f9dc4-20190721
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 877684932; Sun, 21 Jul 2019 10:18:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 21 Jul 2019 10:18:33 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 21 Jul 2019 10:18:33 +0800
Message-ID: <1563675513.1212.444.camel@mtksdccf07>
Subject: Re: [RFC,v3 8/9] media: platform: Add Mediatek ISP P1 SCP
 communication
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     <hverkuil@xs4all.nl>, <laurent.pinchart@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <sean.cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <ryan.yu@mediatek.com>,
        <rynn.wu@mediatek.com>, <frankie.chiu@mediatek.com>
Date:   Sun, 21 Jul 2019 10:18:33 +0800
In-Reply-To: <20190710095827.GC181405@chromium.org>
References: <jungo.lin@mediatek.com>
         <20190611035344.29814-1-jungo.lin@mediatek.com>
         <20190611035344.29814-9-jungo.lin@mediatek.com>
         <20190710095827.GC181405@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: E1887283C9BD64A87663B184A9A00DDF13C42CEBB7511799C2FE929E8A050AB32000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz:

On Wed, 2019-07-10 at 18:58 +0900, Tomasz Figa wrote:
> Hi Jungo,
> 
> On Tue, Jun 11, 2019 at 11:53:43AM +0800, Jungo Lin wrote:
> > This patch adds communication with the co-processor on the SoC
> > through the SCP driver. It supports bi-directional commands
> > to exchange data and perform command flow control function.
> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> > This patch depends on "Add support for mt8183 SCP"[1].
> > 
> > [1] https://patchwork.kernel.org/cover/10972143/
> > ---
> >  .../platform/mtk-isp/isp_50/cam/Makefile      |   1 +
> >  .../platform/mtk-isp/isp_50/cam/mtk_cam-scp.c | 371 ++++++++++++++++++
> >  .../platform/mtk-isp/isp_50/cam/mtk_cam-scp.h | 207 ++++++++++
> >  3 files changed, 579 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.c
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.h
> > 
> 
> Thanks for the patch! Please see my comments inline.
> 
> [snip]
> 

Thank you for your comments. Please check my replies inline.

[snip]

> > diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.c
> > new file mode 100644
> > index 000000000000..04519d0b942f
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.c
> > @@ -0,0 +1,371 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright (c) 2018 MediaTek Inc.
> > +
> > +#include <linux/atomic.h>
> > +#include <linux/kthread.h>
> > +#include <linux/platform_data/mtk_scp.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/remoteproc.h>
> > +#include <linux/sched.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/types.h>
> > +#include <linux/vmalloc.h>
> > +
> > +#include "mtk_cam.h"
> > +
> > +static void isp_composer_deinit(struct mtk_isp_p1_ctx *isp_ctx)
> > +{
> > +	struct mtk_isp_queue_work *ipi_job, *tmp_ipi_job;
> > +	struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
> > +
> > +	atomic_set(&isp_ctx->cmd_queued, 0);
> > +	atomic_set(&isp_ctx->composer_txlist.queue_cnt, 0);
> > +	atomic_set(&isp_ctx->composing_frame, 0);
> > +	atomic_set(&isp_ctx->ipi_occupied, 0);
> 
> Is there any point to set them if we are deinitalizing? Moreover,
> isp_composer_init() would set them once we start again.
> 

We will remove these variable assignments.

> > +
> > +	spin_lock(&isp_ctx->composer_txlist.lock);
> > +	list_for_each_entry_safe(ipi_job, tmp_ipi_job,
> > +				 &isp_ctx->composer_txlist.queue,
> > +				 list_entry) {
> > +		list_del(&ipi_job->list_entry);
> > +		kfree(ipi_job);
> > +	}
> > +	atomic_set(&isp_ctx->composer_txlist.queue_cnt, 0);
> > +	spin_unlock(&isp_ctx->composer_txlist.lock);
> > +
> > +	mutex_lock(&isp_ctx->lock);
> > +	if (isp_ctx->composer_tx_thread.thread) {
> > +		kthread_stop(isp_ctx->composer_tx_thread.thread);
> 
> Shouldn't the thread be stopped at this point already? If not, wouldn't the
> atomic_set() at the beginning of this function confuse it?
> 
> In any case, this should be greatly simplified after we move to a workqueue,
> with one work per one task to do, as per other comments.
> 

We will simplify the IPI sending mechanism and remove these kthread
handling.

> > +		wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
> > +		isp_ctx->composer_tx_thread.thread = NULL;
> > +	}
> > +
> > +	if (isp_ctx->composer_deinit_thread.thread) {
> > +		wake_up(&isp_ctx->composer_deinit_thread.wq);
> > +		isp_ctx->composer_deinit_thread.thread = NULL;
> > +	}
> > +	mutex_unlock(&isp_ctx->lock);
> > +
> > +	pm_runtime_put_sync(&p1_dev->pdev->dev);
> 
> No need to use the sync variant.
> 

We don't get this point. If we will call pm_runtime_get_sync in
mtk_isp_hw_init function, will we need to call
pm_runtime_put_sync_autosuspend in mtk_isp_hw_release in next patch?
As we know, we should call runtime pm functions in pair.

> > +}
> > +
> > +/*
> > + * Two kinds of flow control in isp_composer_tx_work.
> > + *
> > + * Case 1: IPI commands flow control. The maximum number of command queues is 3.
> > + * There are two types of IPI commands (SCP_ISP_CMD/SCP_ISP_FRAME) in P1 driver.
> > + * It is controlled by ipi_occupied.
> 
> ISP_COMPOSING_MAX_NUM is defined to 4, not 3. Is that expected?
> 

In this version, we use async. scp_ipi_send function call with wait = 0.
If kernel sends too many P1 IPI commands in short time, P1 task in SCP
may miss some IPI command due to the IPI command processing time and the
size of command queue in SCP side. In order to avoid this kind of
condition, we use ISP_COMPOSING_MAX_NUM to control the sending flow of
IPI command in kernel side. The ISP_COMPOSING_MAX_NUM is changed to 4
for Chromium EC OS. We just miss to update the comment here.

In new version, we will change to use sync. scp_ipi_send function call
with non-zero wait variable. Based on this, we could remove IPI command
flow control in P1 driver.

> > + * The priority of SCP_ISP_CMD is higher than SCP_ISP_FRAME.
> 
> What does it mean and why is it so?
> 

In the origin design, SCP_ISP_CMD & SCP_ISP_FRAME are sending in the
same command queue by order. However, if we receive ISP_CMD_DEINIT
command, we will like to send this command firstly to SCP before
SCP_ISP_FRAME are queued in the queue. So we need to have one command
prioritize design here. Btw, in the new design, SCP_ISP_CMD &
SCP_ISP_FRAME are sent independent and we can remove this. 

> > + *
> > + * Case 2: Frame buffers flow control. The maximum number of frame buffers is 3.
> > + * It is controlled by composing_frame.
> > + * Frame buffer is sent by SCP_ISP_FRAME command.
> 
> Case 1 already mentions SCP_ISP_FRAME. What's the difference between that
> and case 2?
> 

For case 2, it is related to frame request handling with CQ buffer.
We send frame request data via SCP_ISP_FRAME to compose CQ buffers in
SCP. The maximum CQ buffers in SCP are 3. So in kernel side, we can't
send any SCP_ISP_FRAME command to SCP when the CQ buffers are full in
SCP until ISP HW has output the new frame with the corresponding CQ
buffer.

In the new design, this will be controlled by mtk_cam_dev_req_try_queue
function with MTK_ISP_MAX_RUNNING_JOBS.

void mtk_cam_dev_req_try_queue(struct mtk_cam_dev *cam)
{
	struct mtk_cam_dev_request *req, *req_prev;
	struct list_head enqueue_job_list;
	int buffer_cnt = atomic_read(&cam->running_job_count);
	unsigned long flags;

	if (!cam->streaming || buffer_cnt >= MTK_ISP_MAX_RUNNING_JOBS) {
		dev_dbg(cam->dev, "stream off or buffers are full:%d\n",
			buffer_cnt);
		return;
	}

	INIT_LIST_HEAD(&enqueue_job_list);

	spin_lock(&cam->pending_job_lock);
	list_for_each_entry_safe(req, req_prev, &cam->pending_job_list, list) {
		list_del(&req->list);
		list_add_tail(&req->list, &enqueue_job_list);
		if (atomic_inc_return(&cam->running_job_count) >=
			MTK_ISP_MAX_RUNNING_JOBS)
			break;
	}
	spin_unlock(&cam->pending_job_lock);

	list_for_each_entry_safe(req, req_prev, &enqueue_job_list, list) {
		list_del(&req->list);
		spin_lock_irqsave(&cam->running_job_lock, flags);
		list_add_tail(&req->list, &cam->running_job_list);
		spin_unlock_irqrestore(&cam->running_job_lock, flags);

		mtk_isp_req_enqueue(cam, req);
	}
}

> > + */
> > +static int isp_composer_tx_work(void *data)
> > +{
> > +	struct mtk_isp_p1_ctx *isp_ctx = (struct mtk_isp_p1_ctx *)data;
> > +	struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +	struct mtk_isp_queue_work *isp_composer_work, *tmp_ipi_job;
> > +	struct isp_queue *composer_txlist = &isp_ctx->composer_txlist;
> > +	int ret;
> > +
> > +	while (1) {
> > +		ret = wait_event_interruptible
> > +			(isp_ctx->composer_tx_thread.wq,
> > +			 (atomic_read(&composer_txlist->queue_cnt) > 0 &&
> > +			 atomic_read(&isp_ctx->ipi_occupied)
> > +				< ISP_COMPOSING_MAX_NUM &&
> > +			 atomic_read(&isp_ctx->composing_frame)
> > +				< ISP_FRAME_COMPOSING_MAX_NUM) ||
> > +			 (atomic_read(&isp_ctx->cmd_queued) > 0 &&
> > +			 atomic_read(&isp_ctx->ipi_occupied)
> > +				< ISP_COMPOSING_MAX_NUM) ||
> > +			 kthread_should_stop());
> > +
> > +		if (kthread_should_stop())
> > +			break;
> > +
> > +		spin_lock(&composer_txlist->lock);
> > +		if (atomic_read(&isp_ctx->cmd_queued) > 0) {
> > +			list_for_each_entry_safe(isp_composer_work, tmp_ipi_job,
> > +						 &composer_txlist->queue,
> > +						 list_entry) {
> > +				if (isp_composer_work->type == SCP_ISP_CMD) {
> > +					dev_dbg(dev, "Found a cmd\n");
> > +					break;
> > +				}
> > +			}
> > +		} else {
> > +			if (atomic_read(&isp_ctx->composing_frame) >=
> > +				ISP_FRAME_COMPOSING_MAX_NUM) {
> > +				spin_unlock(&composer_txlist->lock);
> > +				continue;
> > +			}
> > +			isp_composer_work =
> > +			    list_first_entry_or_null
> > +				(&composer_txlist->queue,
> > +				 struct mtk_isp_queue_work,
> > +				 list_entry);
> > +		}
> 
> I don't understand why this special handling of CMD vs FRAME is here, so I
> might be missing something, but would we really lose anything if we just
> simply removed it and queued everything in order?
> 
> Moreover, in V4L2, buffer queue and control operations are serialized wrt
> each other, so we probably wouldn't even have a chance to hit a case when we
> need to prioritize a CMD IPI over a FRAME IPI.
> 

Yes, this implementation is complicated and we will remove
implementation in next patch. We will simplify current implementation by
using:
1. Use sync. scp_ipi_send function call
2. Use workqueue for SCP_ISP_FRAME sending

> > +
> > +		list_del(&isp_composer_work->list_entry);
> > +		atomic_dec(&composer_txlist->queue_cnt);
> > +		spin_unlock(&composer_txlist->lock);
> > +
> > +		if (isp_composer_work->type == SCP_ISP_CMD) {
> > +			scp_ipi_send
> > +				(p1_dev->scp_pdev,
> > +				 SCP_IPI_ISP_CMD,
> > +				 &isp_composer_work->cmd,
> > +				 sizeof(isp_composer_work->cmd),
> > +				 0);
> > +			atomic_dec(&isp_ctx->cmd_queued);
> > +			atomic_inc(&isp_ctx->ipi_occupied);
> > +			dev_dbg(dev,
> > +				"%s cmd id %d sent, %d ipi buf occupied",
> > +				__func__,
> > +				isp_composer_work->cmd.cmd_id,
> > +				atomic_read(&isp_ctx->ipi_occupied));
> > +		} else if (isp_composer_work->type == SCP_ISP_FRAME) {
> > +			scp_ipi_send
> > +				(p1_dev->scp_pdev,
> > +				 SCP_IPI_ISP_FRAME,
> > +				 &isp_composer_work->frameparams,
> > +				 sizeof(isp_composer_work->frameparams),
> > +				 0);
> > +			atomic_inc(&isp_ctx->ipi_occupied);
> > +			atomic_inc(&isp_ctx->composing_frame);
> 
> Why do we need composing frame here, if ipi_occupied already limits us to 3?
> 

If we send SCP_ISP_FRAME command, we need to increase ipi_occupied with
1 for IPI command sending command flow and increase composing_frame with
1 for CQ buffers composing. But this implementation will be removed.

> > +			dev_dbg(dev,
> > +				"%s frame %d sent, %d ipi, %d CQ bufs occupied",
> > +				__func__,
> > +				isp_composer_work->frameparams.frame_seq_no,
> > +				atomic_read(&isp_ctx->ipi_occupied),
> > +				atomic_read(&isp_ctx->composing_frame));
> > +		} else {
> > +			dev_err(dev,
> > +				"ignore IPI type: %d!\n",
> > +				isp_composer_work->type);
> > +		}
> > +		kfree(isp_composer_work);
> > +	}
> > +	return ret;
> > +}
> 
> The function above is way too complicated than it should be. I'd suggest a
> model similar to what we ended up in the DIP driver:
> >  - a freezable workqueue created for ISP composing works,
> >  - each ISP composing work entry would have a struct work_struct embedded,
> >  - isp_composer_enqueue() would enqueue the work_struct to the workqueue
> >    above,
> >  - the workqueue would keep a queue of works itself, so driver's own list
> >    wouldn't be needed anymore,
> >  - similarly, each execution of the work func would operate on its own ISP
> >    composing work, so things like checking for list emptiness, waiting for
> >    work to be queued, etc. wouldn't be needed,
> >  - freezability of the workqueue would ensure nice synchonization with
> >    system suspend/resume (although one would still need to wait for the
> >    hardware/firmware to complete).
> 
> WDYT?
> 

yes, we will adopt your suggestion to re-factor current implementation.
Below is new implementation.

void mtk_isp_req_enqueue(struct mtk_cam_dev *cam,
			 struct mtk_cam_dev_request *req)
{
	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);
	int ret;

	/* Accumulated frame sequence number */
	req->frame_params.frame_seq_no = ++p1_dev->enqueue_frame_seq_no;

	INIT_WORK(&req->frame_work, isp_tx_frame_worker);
	ret = queue_work(p1_dev->composer_wq, &req->frame_work);
	if (!ret)
		dev_dbg(cam->dev, "frame_no:%d queue_work failed\n",
			req->frame_params.frame_seq_no, ret);
	else
		dev_dbg(cam->dev, "Enqueue fd:%s frame_seq_no:%d job cnt:%d\n",
			req->req.debug_str, req->frame_params.frame_seq_no,
			atomic_read(&cam->running_job_count));
}

static void isp_tx_frame_worker(struct work_struct *work)
{
	struct mtk_cam_dev_request *req =
		container_of(work, struct mtk_cam_dev_request, frame_work);
	struct mtk_cam_dev *cam =
		container_of(req->req.mdev, struct mtk_cam_dev, media_dev);
	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);

	scp_ipi_send(p1_dev->scp_pdev, SCP_IPI_ISP_FRAME, &req->frame_params,
		     sizeof(req->frame_params), MTK_ISP_IPI_SEND_TIMEOUT);
}

> > +
> > +static int isp_composer_deinit_work(void *data)
> > +{
> > +	struct mtk_isp_p1_ctx *isp_ctx = (struct mtk_isp_p1_ctx *)data;
> > +	struct isp_p1_device *p1_dev = p1_ctx_to_dev(data);
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +
> > +	wait_event_interruptible(isp_ctx->composer_deinit_thread.wq,
> > +				 atomic_read(&isp_ctx->scp_state) == SCP_OFF ||
> > +				 kthread_should_stop());
> > +
> > +	dev_dbg(dev, "%s run deinit", __func__);
> > +	isp_composer_deinit(isp_ctx);
> > +
> > +	return 0;
> > +}
> > +
> > +static void isp_composer_handler(void *data, unsigned int len, void *priv)
> > +{
> > +	struct mtk_isp_p1_ctx *isp_ctx = (struct mtk_isp_p1_ctx *)priv;
> > +	struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
> > +	struct device *dev = &p1_dev->pdev->dev;
> > +	struct mtk_isp_scp_p1_cmd *ipi_msg;
> > +
> > +	ipi_msg = (struct mtk_isp_scp_p1_cmd *)data;
> 
> Should we check that len == sizeof(*ipi_msg)? (Or at least >=, if data could
> contain some extra bytes at the end.)
> 

The len parameter is the actual sending bytes from SCP to kernel.
In the runtime, it is only 6 bytes for isp_ack_info command
However, sizeof(*ipi_msg) is large due to struct mtk_isp_scp_p1_cmd is
union structure.

> > +
> > +	if (ipi_msg->cmd_id != ISP_CMD_ACK)
> > +		return;
> > +
> > +	if (ipi_msg->ack_info.cmd_id == ISP_CMD_FRAME_ACK) {
> > +		dev_dbg(dev, "ack frame_num:%d",
> > +			ipi_msg->ack_info.frame_seq_no);
> > +		atomic_set(&isp_ctx->composed_frame_id,
> > +			   ipi_msg->ack_info.frame_seq_no);
> 
> I suppose we are expecting here that ipi_msg->ack_info.frame_seq_no would be
> just isp_ctx->composed_frame_id + 1, right? If not, we probably dropped some
> frames and we should handle that somehow.
> 

No, we use isp_ctx->composed_frame_id to save which frame sequence
number are composed done in SCP. In new design, we will move this from
isp_ctx to p1_dev.

	if (ipi_msg->ack_info.cmd_id == ISP_CMD_FRAME_ACK) {
		atomic_set(&p1_dev->composed_frame_seq_no,
			   ipi_msg->ack_info.frame_seq_no);
		dev_dbg(p1_dev->dev, "ack frame_num:%d\n",
			p1_dev->composed_frame_seq_no);
	}

> > +	} else if (ipi_msg->ack_info.cmd_id == ISP_CMD_DEINIT) {
> > +		dev_dbg(dev, "ISP_CMD_DEINIT is acked");
> > +		atomic_set(&isp_ctx->scp_state, SCP_OFF);
> > +		wake_up_interruptible(&isp_ctx->composer_deinit_thread.wq);
> > +	}
> > +
> > +	atomic_dec_return(&isp_ctx->ipi_occupied);
> > +	wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
> > +}
> > +
> > +int isp_composer_init(struct device *dev)
> > +{
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	int ret;
> > +
> > +	ret = scp_ipi_register(p1_dev->scp_pdev,
> > +			       SCP_IPI_ISP_CMD,
> > +			       isp_composer_handler,
> > +			       isp_ctx);
> > +	if (ret)
> > +		return ret;
> > +
> > +	atomic_set(&isp_ctx->cmd_queued, 0);
> > +	atomic_set(&isp_ctx->composer_txlist.queue_cnt, 0);
> > +	atomic_set(&isp_ctx->composing_frame, 0);
> > +	atomic_set(&isp_ctx->ipi_occupied, 0);
> > +	atomic_set(&isp_ctx->scp_state, SCP_ON);
> > +
> > +	mutex_lock(&isp_ctx->lock);
> > +	if (!isp_ctx->composer_tx_thread.thread) {
> > +		init_waitqueue_head(&isp_ctx->composer_tx_thread.wq);
> > +		INIT_LIST_HEAD(&isp_ctx->composer_txlist.queue);
> > +		spin_lock_init(&isp_ctx->composer_txlist.lock);
> > +		isp_ctx->composer_tx_thread.thread =
> > +			kthread_run(isp_composer_tx_work, isp_ctx,
> > +				    "isp_composer_tx");
> > +		if (IS_ERR(isp_ctx->composer_tx_thread.thread)) {
> > +			dev_err(dev, "unable to start kthread\n");
> > +			isp_ctx->composer_tx_thread.thread = NULL;
> > +			goto nomem;
> 
> Why nomem?
> 

It is wrong. Need to correct with
ERR_PTR(isp_ctx->composer_tx_thread.thread).
These kthread handling will be removed in next patch.

> > +		}
> > +	} else {
> > +		dev_warn(dev, "old tx thread is existed\n");
> 
> This shouldn't be possible to happen.
> 

Yes, it should not be happen. Otherwise, there is a bug.

> > +	}
> > +
> > +	if (!isp_ctx->composer_deinit_thread.thread) {
> > +		init_waitqueue_head(&isp_ctx->composer_deinit_thread.wq);
> > +		isp_ctx->composer_deinit_thread.thread =
> > +			kthread_run(isp_composer_deinit_work, isp_ctx,
> > +				    "isp_composer_deinit_work");
> 
> Why do we need to deinit from another kthread?
> 

This code will be removed in next patch.

> > +		if (IS_ERR(isp_ctx->composer_deinit_thread.thread)) {
> > +			dev_err(dev, "unable to start kthread\n");
> > +			isp_ctx->composer_deinit_thread.thread = NULL;
> > +			goto nomem;
> > +		}
> > +	} else {
> > +		dev_warn(dev, "old rx thread is existed\n");
> 
> rx? The code above seems to refer to deinit.
> 

Got it.

> > +	}
> > +	mutex_unlock(&isp_ctx->lock);
> > +
> > +	return 0;
> > +
> > +nomem:
> > +	mutex_unlock(&isp_ctx->lock);
> > +
> > +	return -ENOMEM;
> 
> We should return the original error code here.
> 

Got it.

> > +}
> > +
> > +void isp_composer_enqueue(struct device *dev,
> > +			  void *data,
> > +			  enum mtk_isp_scp_type type)
> > +{
> > +	struct mtk_isp_queue_work *isp_composer_work;
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> 
> Just pass p1_dev to this function instead of dev.
> 

Fix in next patch.

> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +
> > +	isp_composer_work = kzalloc(sizeof(*isp_composer_work), GFP_KERNEL);
> 
> For most of the cases, it should be possible to preallocate this, e.g.
> >  - for FRAME, this could be inside the request struct,
> >  - for buffer queue it could be inside the buffer struct.
> 
> I'd suggest making the caller responsible for allocating if needed.
> 

Fix in next patch.

> > +	isp_composer_work->type = type;
> > +
> > +	switch (type) {
> > +	case SCP_ISP_CMD:
> > +		memcpy(&isp_composer_work->cmd, data,
> > +		       sizeof(isp_composer_work->cmd));
> > +		dev_dbg(dev, "Enq ipi cmd id:%d\n",
> > +			isp_composer_work->cmd.cmd_id);
> > +
> > +		spin_lock(&isp_ctx->composer_txlist.lock);
> > +		list_add_tail(&isp_composer_work->list_entry,
> > +			      &isp_ctx->composer_txlist.queue);
> > +		atomic_inc(&isp_ctx->composer_txlist.queue_cnt);
> > +		spin_unlock(&isp_ctx->composer_txlist.lock);
> > +
> > +		atomic_inc(&isp_ctx->cmd_queued);
> > +		wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
> > +		break;
> > +	case SCP_ISP_FRAME:
> > +		memcpy(&isp_composer_work->frameparams, data,
> > +		       sizeof(isp_composer_work->frameparams));
> > +		dev_dbg(dev, "Enq ipi frame_num:%d\n",
> > +			isp_composer_work->frameparams.frame_seq_no);
> > +
> > +		spin_lock(&isp_ctx->composer_txlist.lock);
> > +		list_add_tail(&isp_composer_work->list_entry,
> > +			      &isp_ctx->composer_txlist.queue);
> > +		atomic_inc(&isp_ctx->composer_txlist.queue_cnt);
> > +		spin_unlock(&isp_ctx->composer_txlist.lock);
> > +
> > +		wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
> 
> The code in both cases is almost exactly the same. The only difference is
> the memcpy destination and size and whether isp_ctx->cmd_queued is
> incremented or not.
> 
> The memcpy will go away if my comment above is addressed and so that would
> go down to making the cmd_queued increment conditional.
> 

This function will be removed in next patch.
We will call scp_ipi_send directly in the caller, such as:

void mtk_isp_hw_config(struct mtk_cam_dev *cam,
		       struct p1_config_param *config_param)
{
	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);

	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
	composer_tx_cmd.cmd_id = ISP_CMD_CONFIG;
	memcpy(&composer_tx_cmd.config_param, config_param,
	       sizeof(*config_param));

	scp_ipi_send(p1_dev->scp_pdev, SCP_IPI_ISP_CMD, &composer_tx_cmd,
		     sizeof(composer_tx_cmd), MTK_ISP_IPI_SEND_TIMEOUT);
}

void mtk_isp_stream(struct mtk_cam_dev *cam, int on)
{
	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);

	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
	composer_tx_cmd.cmd_id = ISP_CMD_STREAM;
	composer_tx_cmd.is_stream_on = on;

	scp_ipi_send(p1_dev->scp_pdev, SCP_IPI_ISP_CMD, &composer_tx_cmd,
		     sizeof(composer_tx_cmd), MTK_ISP_IPI_SEND_TIMEOUT);
}

static void isp_composer_hw_deinit(struct mtk_isp_p1_device *p1_dev)
{
	struct mtk_isp_scp_p1_cmd composer_tx_cmd;

	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
	composer_tx_cmd.cmd_id = ISP_CMD_DEINIT;

	scp_ipi_send(p1_dev->scp_pdev, SCP_IPI_ISP_CMD, &composer_tx_cmd,
		     sizeof(composer_tx_cmd), MTK_ISP_IPI_SEND_TIMEOUT);

	isp_composer_uninit(p1_dev);
}


> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> > +void isp_composer_hw_init(struct device *dev)
> > +{
> > +	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +
> > +	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> > +	composer_tx_cmd.cmd_id = ISP_CMD_INIT;
> > +	composer_tx_cmd.frameparam.hw_module = isp_ctx->isp_hw_module;
> > +	composer_tx_cmd.frameparam.cq_addr.iova = isp_ctx->scp_mem_iova;
> > +	composer_tx_cmd.frameparam.cq_addr.scp_addr = isp_ctx->scp_mem_pa;
> 
> Should we also specify the size of the buffer? Otherwise we could end up
> with some undetectable overruns.
> 

The size of SCP composer's memory is fixed to 0x200000.
Is it necessary to specify the size of this buffer?

#define MTK_ISP_COMPOSER_MEM_SIZE 0x200000

ptr = dma_alloc_coherent(p1_dev->cam_dev.smem_dev,
			MTK_ISP_COMPOSER_MEM_SIZE, &addr, GFP_KERNEL);

> > +	isp_composer_enqueue(dev, &composer_tx_cmd, SCP_ISP_CMD);
> > +}
> > +
> > +void isp_composer_meta_config(struct device *dev,
> > +			      unsigned int dma)
> > +{
> > +	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> > +
> > +	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> > +	composer_tx_cmd.cmd_id = ISP_CMD_CONFIG_META;
> > +	composer_tx_cmd.cfg_meta_out_param.enabled_meta_dmas = dma;
> > +	isp_composer_enqueue(dev, &composer_tx_cmd, SCP_ISP_CMD);
> > +}
> > +
> > +void isp_composer_hw_config(struct device *dev,
> > +			    struct p1_config_param *config_param)
> > +{
> > +	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> > +
> > +	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> > +	composer_tx_cmd.cmd_id = ISP_CMD_CONFIG;
> > +	memcpy(&composer_tx_cmd.config_param, config_param,
> > +	       sizeof(*config_param));
> > +	isp_composer_enqueue(dev, &composer_tx_cmd, SCP_ISP_CMD);
> > +}
> > +
> > +void isp_composer_stream(struct device *dev, int on)
> > +{
> > +	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> > +
> > +	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> > +	composer_tx_cmd.cmd_id = ISP_CMD_STREAM;
> > +	composer_tx_cmd.is_stream_on = on;
> > +	isp_composer_enqueue(dev, &composer_tx_cmd, SCP_ISP_CMD);
> > +}
> > +
> > +void isp_composer_hw_deinit(struct device *dev)
> > +{
> > +	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> > +	struct isp_p1_device *p1_dev = get_p1_device(dev);
> > +	struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > +	int ret;
> > +
> > +	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> > +	composer_tx_cmd.cmd_id = ISP_CMD_DEINIT;
> > +	isp_composer_enqueue(dev, &composer_tx_cmd, SCP_ISP_CMD);
> > +
> > +	/* Wait for ISP_CMD_DEINIT command is handled done */
> > +	ret = wait_event_timeout(isp_ctx->composer_deinit_thread.wq,
> > +				 atomic_read(&isp_ctx->scp_state) == SCP_OFF,
> > +				 msecs_to_jiffies(2000));
> > +	if (ret)
> > +		return;
> > +
> > +	dev_warn(dev, "Timeout & local de-init\n");
> > +	isp_composer_deinit(isp_ctx);
> > +}
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.h
> > new file mode 100644
> > index 000000000000..fbd8593e9c2d
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-scp.h
> > @@ -0,0 +1,207 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + */
> > +
> > +#ifndef _MTK_ISP_SCP_H
> > +#define _MTK_ISP_SCP_H
> > +
> > +#include <linux/types.h>
> > +
> > +#include "mtk_cam-v4l2-util.h"
> > +
> > +/*
> > + * struct img_size - image size information.
> > + *
> > + * @w: image width, the unit is pixel
> > + * @h: image height, the unit is pixel
> > + * @xsize: bytes per line based on width.
> > + * @stride: bytes per line when changing line.
> > + *          Normally, calculate new STRIDE based on
> > + *          xsize + HW constrain(page or align).
> > + *
> > + */
> > +struct img_size {
> > +	__u32 w;
> > +	__u32 h;
> > +	__u32 xsize;
> > +	__u32 stride;
> > +} __packed;
> > +
> > +/*
> > + * struct img_buffer - buffer address information.
> > + *
> > + * @iova: DMA address for external devices.
> > + * @scp_addr: SCP address for external co-process unit.
> > + *
> > + */
> > +struct img_buffer {
> > +	__u32 iova;
> > +	__u32 scp_addr;
> > +} __packed;
> > +
> > +struct p1_img_crop {
> > +	__u32 left;
> > +	__u32 top;
> > +	__u32 width;
> > +	__u32 height;
> > +} __packed;
> > +
> > +struct p1_img_output {
> > +	struct img_buffer buffer;
> > +	struct img_size size;
> > +	struct p1_img_crop crop;
> > +	__u8 pixel_byte;
> > +	__u32 img_fmt;
> > +} __packed;
> 
> Please document.
> 

Fix in next patch.

> > +
> > +/*
> > + * struct cfg_in_param - image input parameters structure.
> > + *                       Normally, it comes from sensor information.
> > + *
> > + * @continuous: indicate the sensor mode.
> > + *              1: continuous
> > + *              0: single
> > + * @subsample: indicate to enables SOF subsample or not.
> > + * @pixel_mode: describe 1/2/4 pixels per clock cycle.
> > + * @data_pattern: describe input data pattern.
> > + * @raw_pixel_id: bayer sequence.
> > + * @tg_fps: the fps rate of TG (time generator).
> > + * @img_fmt: the image format of input source.
> > + * @p1_img_crop: the crop configuration of input source.
> > + *
> > + */
> > +struct cfg_in_param {
> > +	__u8 continuous;
> > +	__u8 subsample;
> > +	__u8 pixel_mode;
> > +	__u8 data_pattern;
> > +	__u8 raw_pixel_id;
> > +	__u16 tg_fps;
> > +	__u32 img_fmt;
> > +	struct p1_img_crop crop;
> > +} __packed;
> > +
> > +/*
> > + * struct cfg_main_out_param - the image output parameters of main stream.
> > + *
> > + * @bypass: indicate this device is enabled or disabled or not .
> 
> Remove the space before the period.
> 

Fix in next patch.

> > + * @pure_raw: indicate the image path control.
> > + *            1: pure raw
> > + *            0: processing raw
> > + * @pure_raw_pack: indicate the image is packed or not.
> > + *                 1: packed mode
> > + *                 0: unpacked mode
> > + * @p1_img_output: the output image information.
> > + *
> > + */
> > +struct cfg_main_out_param {
> > +	/* Bypass main out parameters */
> > +	__u8 bypass;
> > +	/* Control HW image raw path */
> > +	__u8 pure_raw;
> > +	/* Control HW image pack function */
> 
> No need for these inline comments.
> 

Fix in next patch.

> > +	__u8 pure_raw_pack;
> > +	struct p1_img_output output;
> > +} __packed;
> > +
> > +/*
> > + * struct cfg_resize_out_param - the image output parameters of
> > + *                               packed out stream.
> > + *
> > + * @bypass: indicate this device is enabled or disabled or not .
> 
> Remove the space before the period.
> 

Fix in next patch.

> > + * @p1_img_output: the output image information.
> > + *
> > + */
> > +struct cfg_resize_out_param {
> > +	/* Bypass resize parameters */
> 
> No need for this inline comment.
> 

Fix in next patch.

> > +	__u8 bypass;
> > +	struct p1_img_output output;
> > +} __packed;
> > +
> > +/*
> > + * struct cfg_meta_out_param - output meta information.
> > + *
> > + * @enabled_meta_dmas: indicate which meta DMAs are enabled.
> > + *
> > + */
> > +struct cfg_meta_out_param {
> > +	__u32 enabled_meta_dmas;
> > +} __packed;
> > +
> > +struct p1_config_param {
> > +	/* Sensor/TG info */
> > +	struct cfg_in_param cfg_in_param;
> > +	/* IMGO DMA */
> > +	struct cfg_main_out_param cfg_main_param;
> > +	/* RRZO DMA */
> > +	struct cfg_resize_out_param cfg_resize_param;
> > +	/* 3A DMAs and other. */
> > +	struct cfg_meta_out_param cfg_meta_param;
> 
> Please change the inline comments to a kerneldoc comment at the top.
> 

Fix in next patch.

> > +} __packed;
> > +
> > +struct p1_frame_param {
> > +	/* frame sequence number */
> > +	__u32 frame_seq_no;
> > +	/* SOF index */
> > +	__u32 sof_idx;
> > +	/* The memory address of tuning buffer from user space */
> 
> Ditto.
> 

Fix in next patch.

> > +	struct img_buffer dma_buffers[MTK_CAM_P1_TOTAL_NODES];
> > +} __packed;
> > +
> > +struct P1_meta_frame {
> > +	__u32 enabled_dma;
> > +	__u32 vb_index;
> > +	struct img_buffer meta_addr;
> > +} __packed;
> > +
> > +struct isp_init_info {
> > +	__u8 hw_module;
> > +	struct img_buffer cq_addr;
> > +} __packed;
> > +
> > +struct isp_ack_info {
> > +	__u8 cmd_id;
> > +	__u32 frame_seq_no;
> > +} __packed;
> > +
> > +enum mtk_isp_scp_cmds {
> > +	ISP_CMD_INIT,
> > +	ISP_CMD_CONFIG,
> > +	ISP_CMD_STREAM,
> > +	ISP_CMD_DEINIT,
> > +	ISP_CMD_ACK,
> > +	ISP_CMD_FRAME_ACK,
> > +	ISP_CMD_CONFIG_META,
> > +	ISP_CMD_ENQUEUE_META,
> > +	ISP_CMD_RESERVED,
> > +};
> > +
> > +struct mtk_isp_scp_p1_cmd {
> > +	__u8 cmd_id;
> > +	union {
> > +		struct isp_init_info frameparam;
> > +		struct p1_config_param config_param;
> > +		struct cfg_meta_out_param cfg_meta_out_param;
> > +		struct P1_meta_frame meta_frame;
> > +		__u8 is_stream_on;
> > +		struct isp_ack_info ack_info;
> > +	};
> > +} __packed;
> > +
> > +enum mtk_isp_scp_type {
> > +	SCP_ISP_CMD = 0,
> > +	SCP_ISP_FRAME,
> > +};
> 
> Please document all the structs and enum above using kerneldoc.
> 

Fix in next patch.

> Best regards,
> Tomasz
> 

Thank you for your valuable comments.

Best regards,


Jungo 


