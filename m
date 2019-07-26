Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 933CB75FB9
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 09:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbfGZHYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 03:24:08 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:22047 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725864AbfGZHYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 03:24:08 -0400
X-UUID: 8d902d53753c46deaba2f6ce66d1e03c-20190726
X-UUID: 8d902d53753c46deaba2f6ce66d1e03c-20190726
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 237735330; Fri, 26 Jul 2019 15:23:54 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 26 Jul 2019 15:23:48 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 26 Jul 2019 15:23:48 +0800
Message-ID: <1564125828.1212.600.camel@mtksdccf07>
Subject: Re: [RFC,v3 7/9] media: platform: Add Mediatek ISP P1 device driver
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, Rob Herring <robh@kernel.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <sean.cheng@mediatek.com>, "Sj Huang" <sj.huang@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <frederic.chen@mediatek.com>,
        Ryan Yu =?UTF-8?Q?=28=E4=BD=99=E5=AD=9F=E4=BF=AE=29?= 
        <ryan.yu@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <rynn.wu@mediatek.com>,
        Frankie Chiu =?UTF-8?Q?=28=E9=82=B1=E6=96=87=E5=87=B1=29?= 
        <frankie.chiu@mediatek.com>
Date:   Fri, 26 Jul 2019 15:23:48 +0800
In-Reply-To: <CAAFQd5AmAXm1T0eLPiUTFLv9qiKxe-wZGyXxk0jvge+EanZ3FQ@mail.gmail.com>
References: <jungo.lin@mediatek.com>
         <20190611035344.29814-1-jungo.lin@mediatek.com>
         <20190611035344.29814-8-jungo.lin@mediatek.com>
         <20190710095646.GB181405@chromium.org>
         <1563616681.1212.386.camel@mtksdccf07>
         <CAAFQd5AmAXm1T0eLPiUTFLv9qiKxe-wZGyXxk0jvge+EanZ3FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Tomasz:

On Thu, 2019-07-25 at 18:23 +0900, Tomasz Figa wrote:
> .Hi Jungo,
> 
> On Sat, Jul 20, 2019 at 6:58 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> >
> > Hi, Tomasz:
> >
> > On Wed, 2019-07-10 at 18:56 +0900, Tomasz Figa wrote:
> > > Hi Jungo,
> > >
> > > On Tue, Jun 11, 2019 at 11:53:42AM +0800, Jungo Lin wrote:
> > > > This patch adds the Mediatek ISP P1 HW control device driver.
> > > > It handles the ISP HW configuration, provides interrupt handling and
> > > > initializes the V4L2 device nodes and other functions.
> > > >
> > > > (The current metadata interface used in meta input and partial
> > > > meta nodes is only a temporary solution to kick off the driver
> > > > development and is not ready to be reviewed yet.)
> > > >
> > > > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > > > ---
> > > >  .../platform/mtk-isp/isp_50/cam/Makefile      |    1 +
> > > >  .../mtk-isp/isp_50/cam/mtk_cam-regs.h         |  126 ++
> > > >  .../platform/mtk-isp/isp_50/cam/mtk_cam.c     | 1087 +++++++++++++++++
> > > >  .../platform/mtk-isp/isp_50/cam/mtk_cam.h     |  243 ++++
> > > >  4 files changed, 1457 insertions(+)
> > > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
> > > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
> > > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
> > > >
> > >
> > > Thanks for the patch! Please see my comments inline.
> > >
> > > [snip]
> > >
> >
> > Thanks for your comments. Please check my replies inline.
> >
> 
> Thanks! I'll snip anything I don't have further comments on.
> 
> [snip]

Ok, got it.

> > > > +/* META */
> > > > +#define REG_META0_VB2_INDEX                0x14dc
> > > > +#define REG_META1_VB2_INDEX                0x151c
> > >
> > > I don't believe these registers are really for VB2 indexes.
> > >
> >
> > MTK P1 ISP HW supports frame header spare registers for each DMA, such
> > as CAM_DMA_FH_AAO_SPARE or CAM_DMA_FH_AFO_SPARE. We could save some
> > frame information in these ISP registers. In this case, we save META0
> > VB2 index into AAO FH spare register and META1 VB2 index into AFO FH
> > spare register. These implementation is designed for non-request 3A
> > DMAs. These VB2 indexes are sent in ISP_CMD_ENQUEUE_META command of
> > mtk_isp_enqueue function. So we just call CAM_DMA_FH_AAO_SPARE as
> > REG_META0_VB2_INDEX for easy understanding.
> 
> Unfortunately it's not a good idea to mix hardware concepts with
> naming specific to the OS the driver is written for. Better to keep
> the hardware naming, e.g. CAM_DMA_FH_AAO_SPARE.
> 

Ok, got your point. We will pay attention in next time.
Moreover, we will remove AAO/AFO non-request design in next patch.
So these codes will also be removed.

> > Moreover, if we only need to
> > support request mode, we should remove this here.
> >
> > cmd_params.cmd_id = ISP_CMD_ENQUEUE_META;
> > cmd_params.meta_frame.enabled_dma = dma_port;
> > cmd_params.meta_frame.vb_index = buffer->vbb.vb2_buf.index;
> > cmd_params.meta_frame.meta_addr.iova = buffer->daddr;
> > cmd_params.meta_frame.meta_addr.scp_addr = buffer->scp_addr;
> >
> 
> Okay, removing sounds good to me. Let's keep the code simple.
> 
> [snip]

Thanks.

> > > > +
> > > > +   err_status = irq_status & INT_ST_MASK_CAM_ERR;
> > > > +
> > > > +   /* Sof, done order check */
> > > > +   if ((irq_status & SOF_INT_ST) && (irq_status & HW_PASS1_DON_ST)) {
> > > > +           dev_dbg(dev, "sof_done block cnt:%d\n", isp_dev->sof_count);
> > > > +
> > > > +           /* Notify IRQ event and enqueue frame */
> > > > +           irq_handle_notify_event(isp_dev, irq_status, dma_status, 0);
> > > > +           isp_dev->current_frame = hw_frame_num;
> > >
> > > What exactly is hw_frame_num? Shouldn't we assign it before notifying the
> > > event?
> > >
> >
> > This is a another spare register for frame sequence number usage.
> > It comes from struct p1_frame_param:frame_seq_no which is sent by
> > SCP_ISP_FRAME IPI command. We will rename this to dequeue_frame_seq_no.
> > Is it a better understanding?
> 
> I'm sorry, unfortunately it's still not clear to me. Is it the
> sequence number of the frame that was just processed and returned to
> the kernel or the next frame that is going to be processed from now
> on?
> 

It is the next frame that is going to be proceed. 
We simplify the implementation of isp_irq_cam function. The hw_frame_num
is renamed to dequeue_frame_seq_no and saved this value from HW at
SOF_INT_ST. Since it is obtained in SOF_INI_ST event, it means it is
next frame to be processed. If there is SW_PASS1_DON_ST, it means this
frame is processed done. We use this value to de-queue the frame request
and return buffers to VB2.

The normal IRQ sequence is SOF_INT_ST => SW_PASS1_DON_ST &
HW_PASS1_DON_ST.

a. SW_PASS_DON_ST is designed for DMAs done event.
If there is no available DMA buffers en-queued into HW, there is no
SW_PADD_DON_ST.

b. HW_PASS_DON_ST is designed to trigger CQ buffer load procedure.
It is paired with SOF IRQ event, even if there is no available DMA
buffers.

static void isp_irq_handle_sof(struct mtk_isp_p1_device *p1_dev,
			       unsigned int dequeue_frame_seq_no)
{
	dma_addr_t base_addr = p1_dev->composer_iova;
	int composed_frame_seq_no =
atomic_read(&p1_dev->composed_frame_seq_no);
	unsigned int addr_offset;

	/* Send V4L2_EVENT_FRAME_SYNC event */
	mtk_cam_dev_event_frame_sync(&p1_dev->cam_dev, dequeue_frame_seq_no);
	
	p1_dev->sof_count += 1;
	/* Save dequeue frame information */
	p1_dev->dequeue_frame_seq_no = dequeue_frame_seq_no;

	/* Update CQ base address if needed */
	if (composed_frame_seq_no <= dequeue_frame_seq_no) {
		dev_dbg(p1_dev->dev,
			"SOF_INT_ST, no update, cq_num:%d, frame_seq:%d",
			composed_frame_seq_no, dequeue_frame_seq_no);
		return;
	}
	addr_offset = MTK_ISP_CQ_ADDRESS_OFFSET *
		(dequeue_frame_seq_no % MTK_ISP_CQ_BUFFER_COUNT);
	writel(base_addr + addr_offset, p1_dev->regs + REG_CQ_THR0_BASEADDR);
	dev_dbg(p1_dev->dev,
		"SOF_INT_ST, update next, cq_num:%d, frame_seq:%d cq_addr:0x%x",
		composed_frame_seq_no, dequeue_frame_seq_no, addr_offset);
}

void mtk_cam_dev_dequeue_req_frame(struct mtk_cam_dev *cam,
				   unsigned int frame_seq_no)
{
	struct mtk_cam_dev_request *req, *req_prev;
	unsigned long flags;

	spin_lock_irqsave(&cam->running_job_lock, flags);
	list_for_each_entry_safe(req, req_prev, &cam->running_job_list, list) {
		dev_dbg(cam->dev, "frame_seq:%d, de-queue frame_seq:%d\n",
			req->frame_params.frame_seq_no, frame_seq_no);

		/* Match by the en-queued request number */
		if (req->frame_params.frame_seq_no == frame_seq_no) {
			atomic_dec(&cam->running_job_count);
			/* Pass to user space */
			mtk_cam_dev_job_done(cam, req, VB2_BUF_STATE_DONE);
			list_del(&req->list);
			break;
		} else if (req->frame_params.frame_seq_no < frame_seq_no) {
			atomic_dec(&cam->running_job_count);
			/* Pass to user space for frame drop */
			mtk_cam_dev_job_done(cam, req, VB2_BUF_STATE_ERROR);
			dev_warn(cam->dev, "frame_seq:%d drop\n",
				 req->frame_params.frame_seq_no);
			list_del(&req->list);
		} else {
			break;
		}
	}
	spin_unlock_irqrestore(&cam->running_job_lock, flags);

static irqreturn_t isp_irq_cam(int irq, void *data)
{
	struct mtk_isp_p1_device *p1_dev = (struct mtk_isp_p1_device *)data;
	struct device *dev = p1_dev->dev;
	unsigned int dequeue_frame_seq_no;
	unsigned int irq_status, err_status, dma_status;
	unsigned long flags;

	spin_lock_irqsave(&p1_dev->spinlock_irq, flags);
	irq_status = readl(p1_dev->regs + REG_CTL_RAW_INT_STAT);
	err_status = irq_status & INT_ST_MASK_CAM_ERR;
	dma_status = readl(p1_dev->regs + REG_CTL_RAW_INT2_STAT);
	dequeue_frame_seq_no = readl(p1_dev->regs + REG_FRAME_SEQ_NUM);
	spin_unlock_irqrestore(&p1_dev->spinlock_irq, flags);

	/*
	 * In normal case, the next SOF ISR should come after HW PASS1 DONE
ISR.
	 * If these two ISRs come together, print warning msg to hint.
	 */
	if ((irq_status & SOF_INT_ST) && (irq_status & HW_PASS1_DON_ST))
		dev_warn(dev, "sof_done block cnt:%d\n", p1_dev->sof_count);

	/* De-queue frame */
	if (irq_status & SW_PASS1_DON_ST) {
		mtk_cam_dev_dequeue_req_frame(&p1_dev->cam_dev,
					      dequeue_frame_seq_no);
		mtk_cam_dev_req_try_queue(&p1_dev->cam_dev);
	}

	/* Save frame info. & update CQ address for frame HW en-queue */
	if (irq_status & SOF_INT_ST)
		isp_irq_handle_sof(p1_dev, dequeue_frame_seq_no);

	/* Check ISP error status */
	if (err_status) {
		dev_err(dev, "int_err:0x%x 0x%x\n", irq_status, err_status);
		/* Show DMA errors in detail */
		if (err_status & DMA_ERR_ST)
			isp_irq_handle_dma_err(p1_dev);
	}

	dev_dbg(dev, "SOF:%d irq:0x%x, dma:0x%x, frame_num:%d",
		p1_dev->sof_count, irq_status, dma_status,
		dequeue_frame_seq_no);

	return IRQ_HANDLED;
}

> >
> > Below is our frame request handling in current design.
> >
> > 1. Buffer preparation
> > - Combined image buffers (IMGO/RRZO) + meta input buffer (Tuining) +
> > other meta histogram buffers (LCSO/LMVO) into one request.
> > - Accumulated one unique frame sequence number to each request and send
> > this request to the SCP composer to compose CQ (Command queue) buffer
> > via SCP_ISP_FRAME IPI command.
> > - CQ buffer is frame registers set. If ISP registers should be updated
> > per frame, these registers are configured in the CQ buffer, such as
> > frame sequence number, DMA addresses and tuning ISP registers.
> > - One frame request will be composed into one CQ buffer.Once CQ buffer
> > is composed done and kernel driver will receive ISP_CMD_FRAME_ACK with
> > its corresponding frame sequence number. Based on this, kernel driver
> > knows which request is ready to be en-queued and save this with
> > p1_dev->isp_ctx.composed_frame_id.
> 
> Hmm, why do we need to save this in p1_dev->isp_ctx? Wouldn't we
> already have a linked lists of requests that are composed and ready to
> be enqueued? Also, the request itself would contain its frame ID
> inside the driver request struct, right?
> 

Below is current implementation for frame request en-queued.
Before en-queued into HW by CQ, the request should be composed by SCP
composer.

a. mtk_cam_dev_req_try_queue()
- Insert the request into p1_dev->running_job_list
b. mtk_isp_req_enqueue()
- Assign new next frame ID to this request.
- Sending to SCP by workqueue
- This request is ready to compose
c. isp_tx_frame_worker()
- Send request to SCP with sync. mode. by SCP_IPI_ISP_FRAME command
- SCP composer will compose the buffer CQ for this request frame based
on struct mtk_p1_frame_param which includes frame ID.
- If scp_ipi_send() is returned, it means the request is composed done.
Or
d. isp_composer_handler()
- If we received the ISP_CMD_FRAME_ACK for SCP_IPI_ISP_FRAME, we save
the frame ID in p1_dev->composed_frame_seq_no which is sent in step C.
- The request is composed done here.
e. isp_irq_handle_sof()
- In SOF timing, we will check there is any available composed CQ
buffers by comparing composed & current de-queued frame ID.

For p1_dev->running_job_list, we can't guarantee the requests are
composed until the end of step c. For step e, we need to know how many
available composed requests are ready to en-queued.

Do you suggest we add another new link-list to save these requests in
step c or we could update p1_dev->composed_frame_seq_no in step c and
remove the implementation in step d[1]?

[1]. isp_composer_handler() is mandatory callback function for SCP
sending API with sync mode design.

static void isp_composer_handler(void *data, unsigned int len, void
*priv)
{
	struct mtk_isp_p1_device *p1_dev = (struct mtk_isp_p1_device *)priv;
	struct mtk_isp_scp_p1_cmd *ipi_msg;

	ipi_msg = (struct mtk_isp_scp_p1_cmd *)data;

	if (ipi_msg->cmd_id != ISP_CMD_ACK)
		return;

	if (ipi_msg->ack_info.cmd_id == ISP_CMD_FRAME_ACK) {
		atomic_set(&p1_dev->composed_frame_seq_no,
			   ipi_msg->ack_info.frame_seq_no);
		dev_dbg(p1_dev->dev, "ack frame_num:%d\n",
			p1_dev->composed_frame_seq_no);
	}
}

> > - The maximum number of CQ buffers in SCP is 3.
> >
> > 2. Buffer en-queue flow
> > - In order to configure correct CQ buffer setting before next SQF event,
> > it is depended on by MTK ISP P1 HW CQ mechanism.
> > - The basic concept of CQ mechanism is loaded ISP CQ buffer settings
> > when HW_PASS1_DON_ST is received which means DMA output is done.
> > - Btw, the pre-condition of this, need to tell ISP HW which CQ buffer
> > address is used. Otherwise, it will loaded one dummy CQ buffer to
> > bypass.
> > - So we will check available CQ buffers by comparing composed frame
> > sequence number & dequeued frame sequence from ISP HW in SOF event.
> > - If there are available CQ buffers, update the CQ base address to the
> > next CQ buffer address based on current de-enqueue frame sequence
> > number. So MTK ISP P1 HW will load this CQ buffer into HW when
> > HW_PASS1_DON_ST is triggered which is before the next SOF.
> > - So in next SOF event, ISP HW starts to output DMA buffers with this
> > request until request is done.
> > - But, for the first request, it is loaded into HW manually when
> > streaming is on for better performance.
> >
> > 3. Buffer de-queue flow
> > - We will use frame sequence number to decide which request is ready to
> > de-queue.
> > - We will save some important register setting from ISP HW when SOF is
> > received. This is because the ISP HW starts to output the data with the
> > corresponding settings, especially frame sequence number setting.
> 
> Could you explain a bit more about these important register settings?
> When does the hardware update the values in the register to new ones?
> At SOF?
> 

Sorry about my words.
In the current implementation, we just save frame ID.


> > - When receiving SW_PASS1_DON_ST IRQ event, it means the DMA output is
> > done. So we could call isp_deque_request_frame with frame sequence
> > number to de-queue frame to VB2
> 
> What's the difference between HW_PASS1_DON_ST and SW_PASS1_DON_ST?
> 

This is explained above.

> > - For AAO/AFO buffers, it has similar design concept. Sometimes, if only
> > AAO/AFO non-request buffers are en-queued without request buffers at the
> > same time, there will be no SW P1 done event for AAO/AFO DMA done.
> > Needs to depend on other IRQ events, such as AAO/AFO_DONE_EVENT.
> 
> Do we have a case like this? Wouldn't we normally always want to
> bundle AAO/AFO buffers with frame buffers?
> 

For upstream driver, we will remove non-request design.

> > - Due to CQ buffer number limitation, if we receive SW_PASS1_DONT_ST,
> > we may try to send another request to SCP for composing.
> 
> Okay, so basically in SW_PASS1_DONT_ST the CQ completed reading the CQ
> buffers, right?
> 

We expected the the life cycle of CQ buffer is same as frame request.
So SW_PASS1_DON_ST is good timing to re-queue the next request to
compose.
For the CQ operations, we will explain later.

> >
> > Hopefully, my explanation is helpful for better understanding our
> > implementation. If you still have any questions, please let me know.
> >
> 
> Yes, it's more clear now, thanks. Still some more comments above, though.
> 
> > > > +           isp_dev->meta0_vb2_index = meta0_vb2_index;
> > > > +           isp_dev->meta1_vb2_index = meta1_vb2_index;
> > > > +   } else {
> > > > +           if (irq_status & SOF_INT_ST) {
> > > > +                   isp_dev->current_frame = hw_frame_num;
> > > > +                   isp_dev->meta0_vb2_index = meta0_vb2_index;
> > > > +                   isp_dev->meta1_vb2_index = meta1_vb2_index;
> > > > +           }
> > > > +           irq_handle_notify_event(isp_dev, irq_status, dma_status, 1);
> > > > +   }
> > >
> > > The if and else blocks do almost the same things just in different order. Is
> > > it really expected?
> > >
> >
> > If we receive HW_PASS1_DON_ST & SOF_INT_ST IRQ events at the same time,
> > the correct sequence should be handle HW_PASS1_DON_ST firstly to check
> > any de-queued frame and update the next frame setting later.
> > Normally, this is a corner case or system performance issue.
> 
> So it sounds like HW_PASS1_DON_ST means that all data from current
> frame has been written, right? If I understand your explanation above
> correctly, that would mean following handling of each interrupt:
> 
> HW_PASS1_DON_ST:
>  - CQ executes with next CQ buffer to prepare for next frame. <- how
> is this handled? does the CQ hardware automatically receive this event
> from the ISP hadware?
>  - return VB2 buffers,
>  - complete requests.
> 
> SOF_INT_ST:
>  - send VSYNC event to userspace,
>  - program next CQ buffer to CQ,
> 
> SW_PASS1_DON_ST:
>  - reclaim CQ buffer and enqueue next frame to composing if available
> 

Sorry for our implementation of HW_PASS1_DON_ST.
It is confusing. 
Below is the revised version based on your conclusion.
So in our new implemmenation, we just handle SOF_INT_ST &
SW_PASS1_DON_ST events. We just add one warning message for
HW_PASS1_DON_ST
 
HW_PASS1_DON_ST:
- CQ executes with next CQ buffer to prepare for next frame.
 
SOF_INT_ST:
- send VSYNC event to userspace,
- program next CQ buffer to CQ,
 
SW_PASS1_DON_ST:
- reclaim CQ buffer and enqueue next frame to composing if available
- return VB2 buffers,
- complete requests.

For CQ HW operations, it is listed below:

a. The CQ buffer has two kinds of information
 - Which ISP registers needs to be updated.
 - Where the corresponding ISP register data to be read.
b. The CQ buffer loading procedure is triggered by HW_PASS1_DONT_ST IRQ
event periodically. 
 - Normally, if the ISP HW receives the completed frame and it will
trigger W_PASS1_DONT_ST IRQ and perform CQ buffer loading immediately.
-  So the CQ buffer loading is performed by ISP HW automatically.
c. The ISP HW will read CQ base address register(REG_CQ_THR0_BASEADDR)
to decide which CQ buffer is loaded.
   - So we configure the next CQ base address in SOF.
d. For CQ buffer loading, CQ will read the ISP registers from CQ buffer
and update the ISP register values into HW.
   - SCP composer will compose one dummy CQ buffer and assign it to
REG_CQ_THR0_BASEADDR of each CQ buffer.
   - Dummy CQ buffer has no updated ISP registers comparing with other
CQ buffers.
   - With this design, if there is no updated new CQ buffer by driver
which may be caused no en-queue frames from user space. The CQ HW will
load dummy CQ buffer and do nothing.
f. The CQ buffer loading is guaranteed by HW to finish before the next
SOF.

> >
> > Btw, we will revise the above implementation as below.
> >
> >
> > if (irq_status & SOF_INT_ST)
> >         mtk_cam_dev_event_frame_sync(&p1_dev->cam_dev,
> >                                              dequeue_frame_seq_no);
> >
> > /* Sof, done order check */
> > if ((irq_status & SOF_INT_ST) && (irq_status & HW_PASS1_DON_ST))
> >         dev_warn(dev, "sof_done block cnt:%d\n", p1_dev->sof_count);
> >
> > /* Notify IRQ event and de-enqueue frame */
> > irq_handle_notify_event(p1_dev, irq_status, dma_status);
> 
> Don't we still need to do this conditionally, only if we got HW_PASS1_DON_ST?
> 
> [snip]

Yes, in the new version, we will add SW_PASS1_DON_ST check before
calling mtk_cam_dev_dequeue_req_frame function.

> > > > +/* ISP P1 interface functions */
> > > > +int mtk_isp_power_init(struct mtk_cam_dev *cam_dev)
> > > > +{
> > > > +   struct device *dev = &cam_dev->pdev->dev;
> > > > +   struct isp_p1_device *p1_dev = get_p1_device(dev);
> > > > +   struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > > > +   int ret;
> > > > +
> > > > +   ret = isp_setup_scp_rproc(p1_dev);
> > > > +   if (ret)
> > > > +           return ret;
> > > > +
> > > > +   ret = isp_init_context(p1_dev);
> > > > +   if (ret)
> > > > +           return ret;
> > >
> > > The above function doesn't really seem to be related to power management.
> > > Should it be called from subdev stream on?
> > >
> >
> > We will rename this function to mtk_isp_hw_init.
> > But, it will be called when the first video node is streamed on.
> > This is because we need to initialize the HW firstly for sub-device
> > stream-on performance.  We need to send some IPI commands, such as
> > ISP_CMD_INIT & ISP_CMD_CONFIG_META & ISP_CMD_ENQUEUE_META in this
> > timing.
> 
> What performance do you mean here? The time between first video node
> stream on and last video node stream on should be really short. Are
> you seeing some long delays there?
> 
> That said, doing it when the first video node starts streaming is okay.
> 
> [snip]

Ok, for IPI command sending performance issue is gone with removing the
design of non-request mode of 3A buffers. We could skip this question.

> > > > +   /* Use pure RAW as default HW path */
> > > > +   isp_ctx->isp_raw_path = ISP_PURE_RAW_PATH;
> > > > +   atomic_set(&p1_dev->cam_dev.streamed_node_count, 0);
> > > > +
> > > > +   isp_composer_hw_init(dev);
> > > > +   /* Check enabled DMAs which is configured by media setup */
> > > > +   isp_composer_meta_config(dev, get_enabled_dma_ports(cam_dev));
> > >
> > > Hmm, this seems to be also configured by isp_compoer_hw_config(). Are both
> > > necessary?
> > >
> >
> > Yes, it is necessary for non-request buffers design for Camera 3A video
> > nodes. For 3A video nodes, we just want to know which 3A video nodes are
> > enabled in ISP_CMD_CONFIG_META. In this stage, we may not know the image
> > format from user space. So we just pass the enabled DMA information from
> > kernel to SCP only. With 3A enabled DMA information, we could configure
> > related 3A registers in SCP.
> 
> We should try to remove this non-request mode. Let's continue
> discussion on the other patch where I brought this topic.
> 
> [snip]

Ok. We will remove the non-request in next patch.

> > > > +int mtk_isp_power_release(struct device *dev)
> > > > +{
> > > > +   isp_composer_hw_deinit(dev);
> > > > +   isp_uninit_context(dev);
> > >
> > > These two don't seem to be related to power either.
> > >
> > > Instead, I don't see anything that could undo the rproc_boot() operation
> > > here.
> > >
> >
> > We will rename this function to mtk_isp_hw_release.
> > We will also add rproc_shutdown function call here.
> >
> > int mtk_isp_hw_release(struct mtk_cam_dev *cam)
> > {
> >         struct device *dev = cam->dev;
> >         struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
> >
> >         isp_composer_hw_deinit(p1_dev);
> >         pm_runtime_put_sync_autosuspend(dev);
> 
> Note that for autosuspend to work correctly, you also need to call
> pm_runtime_mark_last_busy() before this one.
> 
> [snip]

Ok, thanks for your hint.

> > > > +   struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > > > +   struct p1_frame_param frameparams;
> > > > +   struct mtk_isp_queue_job *framejob;
> > > > +   struct media_request_object *obj, *obj_safe;
> > > > +   struct vb2_buffer *vb;
> > > > +   struct mtk_cam_dev_buffer *buf;
> > > > +
> > > > +   framejob = kzalloc(sizeof(*framejob), GFP_ATOMIC);
> > >
> > > This allocation shouldn't be needed. The structure should be already a part
> > > of the mtk_cam_dev_request struct that wraps media_request. Actually. I'd
> > > even say that the contents of this struct should be just moved to that one
> > > to avoid overabstracting.
> > >
> >
> > For this function, we will apply the new design from P2 driver's
> > comment. Here is the new implementation.
> >
> > struct mtk_cam_dev_request {
> >         struct media_request req;
> >         struct mtk_p1_frame_param frame_params;
> >         struct work_struct frame_work;
> >         struct list_head list;
> >         atomic_t buf_count;
> > };
> >
> > void mtk_isp_req_enqueue(struct mtk_cam_dev *cam,
> >                          struct mtk_cam_dev_request *req)
> > {
> >         struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);
> >         int ret;
> >
> >         req->frame_params.frame_seq_no = ++p1_dev->enqueue_frame_seq_no;
> >         INIT_WORK(&req->frame_work, isp_tx_frame_worker);
> >         ret = queue_work(p1_dev->composer_wq, &req->frame_work);
> >         if (!ret)
> >                 dev_dbg(cam->dev, "frame_no:%d queue_work failed\n",
> >                         req->frame_params.frame_seq_no, ret);
> >         else
> >                 dev_dbg(cam->dev, "Enqueue fd:%s frame_seq_no:%d job cnt:%d\n",
> >                         req->req.debug_str, req->frame_params.frame_seq_no,
> >                         atomic_read(&cam->running_job_count));
> 
> It shouldn't be possible for queue_work() to fail here. We just
> received a brand new request from the Request API core and called
> INIT_WORK() on the work struct.
> 
> [snip]

Ok, got it. We will remove this unnecessary error checking.

> > > > +   enable_sys_clock(p1_dev);
> > > > +
> > > > +   /* V4L2 stream-on phase & restore HW stream-on status */
> > > > +   if (p1_dev->cam_dev.streaming) {
> > > > +           dev_dbg(dev, "Cam:%d resume,enable VF\n", module);
> > > > +           /* Enable CMOS */
> > > > +           reg_val = readl(isp_dev->regs + REG_TG_SEN_MODE);
> > > > +           writel((reg_val | CMOS_EN_BIT),
> > > > +                  isp_dev->regs + REG_TG_SEN_MODE);
> > > > +           /* Enable VF */
> > > > +           reg_val = readl(isp_dev->regs + REG_TG_VF_CON);
> > > > +           writel((reg_val | VFDATA_EN_BIT),
> > > > +                  isp_dev->regs + REG_TG_VF_CON);
> > > > +   }
> > >
> > > Does the hardware keep all the state, e.g. queued buffers, during suspend?
> > > Would the code above continue all the capture from the next buffer, as
> > > queued by the userspace before the suspend?
> > >
> >
> > Yes, we will test it.
> > 1. SCP buffers are kept by SCP processor
> > 2. ISP registers are still kept even if ISP clock is disable.
> >
> 
> That said, during system suspend, it would be more than just ISP clock
> disabled. I'd expect that the ISP power domain would be powered off.
> However, if we ensure that the ISP completes before suspend, I guess
> that after the resume the next frame CQ buffer would reprogram all the
> registers, right?
> 
> Also, would SCP always keep running in system suspend?
> 
> [snip]

Q1. Firstly, we will make sure the ISP complete the current frame before
suspend. For the resume behavior, we will check internally.

Q2. Sorry for my wrong reply. The CQ buffer data should be kept in
memory, not SCP. SCP should also be stopped when system is suspend.

> > > > +
> > > > +   for (i = ISP_CAMSYS_CONFIG_IDX; i < ISP_DEV_NODE_NUM; i++) {
> > >
> > > I think we want to start from 0 here?
> > >
> >
> > Because of single CAM support, we will revise our DTS tree to support
> > single CAM only.
> 
> Note that DT bindings should describe the hardware not the driver. So
> please design the bindings in a way that would cover all the cameras,
> even if the driver only takes the information needed to handle 1.
> 

Ok, we will cover all Camera ISP P1 HW units in the DT.

> > So we could remove this loop and check the CAM-B HW
> > information here. Here is below new function.
> >
> > static int mtk_isp_probe(struct platform_device *pdev)
> > {
> >         /* List of clocks required by isp cam */
> >         static const char * const clk_names[] = {
> >                 "camsys_cam_cgpdn", "camsys_camtg_cgpdn"
> >         };
> >         struct mtk_isp_p1_device *p1_dev;
> >         struct device *dev = &pdev->dev;
> >         struct resource *res;
> >         int irq, ret, i;
> >
> >         p1_dev = devm_kzalloc(dev, sizeof(*p1_dev), GFP_KERNEL);
> >         if (!p1_dev)
> >                 return -ENOMEM;
> >
> >         p1_dev->dev = dev;
> >         dev_set_drvdata(dev, p1_dev);
> >
> >         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >         p1_dev->regs = devm_ioremap_resource(dev, res);
> >         if (IS_ERR(p1_dev->regs)) {
> >                 dev_err(dev, "Failed platform resources map\n");
> >                 return PTR_ERR(p1_dev->regs);
> >         }
> >         dev_dbg(dev, "cam, map_addr=0x%pK\n", p1_dev->regs);
> >
> >         irq = platform_get_irq(pdev, 0);
> >         if (!irq) {
> >                 dev_err(dev, "Missing IRQ resources data\n");
> >                 return -ENODEV;
> >         }
> >         ret = devm_request_irq(dev, irq, isp_irq_cam, IRQF_SHARED,
> >                                dev_name(dev), p1_dev);
> >         if (ret) {
> >                 dev_err(dev, "req_irq fail, dev:%s irq=%d\n",
> >                         dev->of_node->name, irq);
> >                 return ret;
> >         }
> >         dev_dbg(dev, "Reg. irq=%d, isr:%s\n", irq, dev_driver_string(dev));
> >         spin_lock_init(&p1_dev->spinlock_irq);
> >
> >         p1_dev->num_clks = ARRAY_SIZE(clk_names);
> >         p1_dev->clks = devm_kcalloc(dev, p1_dev->num_clks,
> >                                     sizeof(*p1_dev->clks), GFP_KERNEL);
> >         if (!p1_dev->clks)
> >                 return -ENOMEM;
> >
> >         for (i = 0; i < p1_dev->num_clks; ++i)
> >                 p1_dev->clks[i].id = clk_names[i];
> >
> >         ret = devm_clk_bulk_get(dev, p1_dev->num_clks, p1_dev->clks);
> >         if (ret) {
> >                 dev_err(dev, "cannot get isp cam clock:%d\n", ret);
> >                 return ret;
> >         }
> >
> >         ret = isp_setup_scp_rproc(p1_dev, pdev);
> >         if (ret)
> >                 return ret;
> >
> >         pm_runtime_enable(dev);
> 
> We also need to call pm_runtime_use_autosuspend() and
> pm_runtime_set_autosuspend_delay() before enabling runtime PM. I'd
> suggest an autosuspend delay equal to around 2x the time that's needed
> to stop and start streaming in total.
> 
> [snip]

O, we will add these function calls.

> > > > +static const struct dev_pm_ops mtk_isp_pm_ops = {
> > > > +   SET_SYSTEM_SLEEP_PM_OPS(mtk_isp_suspend, mtk_isp_resume)
> > > > +   SET_RUNTIME_PM_OPS(mtk_isp_suspend, mtk_isp_resume, NULL)
> > >
> > > For V4L2 drivers system and runtime PM ops would normally be completely
> > > different. Runtime PM ops would be called when the hardware is idle already
> > > or is about to become active. System PM ops would be called at system power
> > > state change and the hardware might be both idle or active. Please also see
> > > my comments to mtk_isp_suspend() and mtk_isp_resume() above.
> > >
> >
> > Here is the new implementation. It should be clear to show the
> > difference between system and runtime PM ops.
> >
> > static const struct dev_pm_ops mtk_isp_pm_ops = {
> >         SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> >                                 pm_runtime_force_resume)
> >         SET_RUNTIME_PM_OPS(mtk_isp_runtime_suspend, mtk_isp_runtime_resume,
> > NULL)
> > };
> 
> That's still not correct. In runtime suspend/resume ops we already are
> not streaming anymore, because we call pm_runtime_get/put_*() when
> starting and stopping streaming. In system suspend/resume ops we might
> be streaming and that's when we need to stop the hardware and wait for
> it to finish. Please implement these ops separately.
> 
> Best regards,
> Tomasz


Ok, got your point.
Below is the new implementation for your review.

static int mtk_isp_pm_suspend(struct device *dev)
{
	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
	u32 val;
	int ret;

	dev_dbg(dev, "- %s\n", __func__);

	/* Check ISP is streaming or not */
	if (!p1_dev->cam_dev.streaming)
		goto done;

	/* Disable ISP's view finder and wait for TG idle */
	dev_dbg(dev, "Cam suspend, disable VF\n");
	val = readl(p1_dev->regs + REG_TG_VF_CON);
	writel(val & (~TG_VF_CON_VFDATA_EN), p1_dev->regs + REG_TG_VF_CON);
	ret = readl_poll_timeout_atomic(p1_dev->regs + REG_TG_INTER_ST, val,
					(val & TG_CS_MASK) == TG_IDLE_ST,
					USEC_PER_MSEC, MTK_ISP_STOP_HW_TIMEOUT);
	if (ret)
		dev_warn(dev, "can't stop HW:%d:0x%x\n", ret, val);

	/* Disable CMOS */
	val = readl(p1_dev->regs + REG_TG_SEN_MODE);
	writel(val & (~TG_SEN_MODE_CMOS_EN), p1_dev->regs + REG_TG_SEN_MODE);

done:
	/* Force ISP HW to idle */
	ret = pm_runtime_force_suspend(dev);
	if (ret)
		return ret;

	return 0;
}

static int mtk_isp_pm_resume(struct device *dev)
{
	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
	u32 val;
	int ret;

	dev_dbg(dev, "- %s\n", __func__);

	/* Force ISP HW to resume if needed */
	ret = pm_runtime_force_resume(dev);
	if (ret)
		return ret;

	if (!p1_dev->cam_dev.streaming)
		return 0;

	/* Enable CMOS */
	dev_dbg(dev, "Cam resume, enable CMOS/VF\n");
	val = readl(p1_dev->regs + REG_TG_SEN_MODE);
	writel(val | TG_SEN_MODE_CMOS_EN, p1_dev->regs + REG_TG_SEN_MODE);

	/* Enable VF */
	val = readl(p1_dev->regs + REG_TG_VF_CON);
	writel(val | TG_VF_CON_VFDATA_EN, p1_dev->regs + REG_TG_VF_CON);

	return 0;
}

static int mtk_isp_runtime_suspend(struct device *dev)
{
	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);

	dev_dbg(dev, "- %s\n", __func__);

	if (pm_runtime_suspended(dev))
		return 0;

	dev_dbg(dev, "%s:disable clock\n", __func__);
	clk_bulk_disable_unprepare(p1_dev->num_clks, p1_dev->clks);

	return 0;
}

static int mtk_isp_runtime_resume(struct device *dev)
{
	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
	int ret;

	dev_dbg(dev, "- %s\n", __func__);

	if (pm_runtime_suspended(dev))
		return 0;

	dev_dbg(dev, "enable clock\n");
	ret = clk_bulk_prepare_enable(p1_dev->num_clks, p1_dev->clks);
	if (ret) {
		dev_err(dev, "cannot enable clock:%d\n", ret);
		return ret;
	}

	return 0;
}

static const struct dev_pm_ops mtk_isp_pm_ops = {
	SET_SYSTEM_SLEEP_PM_OPS(mtk_isp_pm_suspend, mtk_isp_pm_resume)
	SET_RUNTIME_PM_OPS(mtk_isp_runtime_suspend, mtk_isp_runtime_resume,
			   NULL)
};

Best regards,


Jungo

