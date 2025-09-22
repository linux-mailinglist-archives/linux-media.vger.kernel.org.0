Return-Path: <linux-media+bounces-42959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9BCB92718
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 19:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B320418952DA
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 17:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959E0314D3A;
	Mon, 22 Sep 2025 17:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c+A/r00d"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAE0314A85;
	Mon, 22 Sep 2025 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758562356; cv=none; b=rtq/uWgOOEHT2KtbH2rqz6reRurP/GUz+dhXAi3QFGCvgo3svHfh0eOBU8RfLrrmghH7hvZxKaR+TTWzpV+2zUjNukScxKOp91Au6dvwPYqmx1RwpsWz5NC2QRcF7uyq2wlziCyLjwhu/Y/qtFdPYYx8UKFnmh0rfiN8l9qUPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758562356; c=relaxed/simple;
	bh=yZBAp9PYnfoqC5ZPxh5LAGnnpmLB/byC+FP/9xaqI5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TOWvw7AJQvwpScDLkupr0NRP/PNOxpWoj/SCmC269Y5LIe8GHcQPnQpDBsfFz15UVfj3548mtiYUyOjBuZJzHYOZbVe05b+1ss0lQLHpE7Z5GaBLl/H1Frp0HoFK5rT4bYIHQ2npBpRSAGtWgf13ABgsx0let1Osug3RlgWRynM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c+A/r00d; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MHWLwI1282903;
	Mon, 22 Sep 2025 12:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758562341;
	bh=qOOUWMvIPy25pK/weWCVFRHyE5nFUrNH3WwejGyp2LM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c+A/r00dCiDoNbVecKRrOasdTy090+br4LkNvYFXcoCxYJiI3YdZtFFD0s3W6Po+v
	 DjG7SBuY4oo7IkDQRKNUqaVoT5O/JyIKVuXZbmK57Ca4q+k8i+nFI7QjhGwf7rdyhQ
	 OUv0ZNvcrscjTkGJHrssWCC9Khz06FrcQTQP6Bds=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MHWLX9467297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 12:32:21 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 12:32:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 12:32:21 -0500
Received: from [10.250.32.112] ([10.250.32.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MHWKp23159777;
	Mon, 22 Sep 2025 12:32:20 -0500
Message-ID: <1f59f00d-eff7-4c65-a504-227df0de75d2@ti.com>
Date: Mon, 22 Sep 2025 12:32:20 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] media: chips-media: wave5: Improve performance of
 decoder
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <nicolas.dufresne@collabora.com>,
        <bob.beckett@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <lafley.kim@chipsnmedia.com>, <hverkuil@xs4all.nl>,
        <nas.chung@chipsnmedia.com>
References: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
 <20250922055255.116-5-jackson.lee@chipsnmedia.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20250922055255.116-5-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jackson,


On 9/22/2025 12:52 AM, Jackson.lee wrote:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> The current decoding method  was to wait until each frame was
> decoded after feeding a bitstream. As a result, performance was low
> and Wave5 could not achieve max pixel processing rate.
> 
> Update driver to use an asynchronous approach for decoding and feeding a
> bitstream in order to achieve full capabilities of the device.
> 
> WAVE5 supports command-queueing to maximize performance by pipelining
> internal commands and by hiding wait cycle taken to receive a command
> from Host processor.>
> Instead of waiting for each command to be executed before sending the
> next command, Host processor just places all the commands in the
> command-queue and goes on doing other things while the commands in the
> queue are processed by VPU.
> 
> While Host processor handles its own tasks, it can receive VPU interrupt
> request (IRQ).
> In this case, host processor can simply exit interrupt service routine
> (ISR) without accessing to host interface to read the result of the
> command reported by VPU.
> After host processor completed its tasks, host processor can read the
> command result when host processor needs the reports and does
> response processing.
> 
> To achieve this goal, the device_run() calls v4l2_m2m_job_finish
> so that next command can be sent to VPU continuously, if there is
> any result, then irq is triggered and gets decoded frames and returns
> them to upper layer.
> Theses processes work independently each other without waiting
> a decoded frame.
> 
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>   .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
>   .../chips-media/wave5/wave5-vpu-dec.c         | 166 ++++++++++++------
>   .../platform/chips-media/wave5/wave5-vpu.h    |   2 +-
>   .../platform/chips-media/wave5/wave5-vpuapi.c |  46 +++--
>   .../platform/chips-media/wave5/wave5-vpuapi.h |   6 +
>   .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
>   6 files changed, 154 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> index d94cf84c3ee5..687ce6ccf3ae 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -102,7 +102,7 @@ static void _wave5_print_reg_err(struct vpu_device *vpu_dev, u32 reg_fail_reason
>   		dev_dbg(dev, "%s: queueing failure: 0x%x\n", func, reg_val);
>   		break;
>   	case WAVE5_SYSERR_RESULT_NOT_READY:
> -		dev_err(dev, "%s: result not ready: 0x%x\n", func, reg_fail_reason);
> +		dev_dbg(dev, "%s: result not ready: 0x%x\n", func, reg_fail_reason);
>   		break;
>   	case WAVE5_SYSERR_ACCESS_VIOLATION_HW:
>   		dev_err(dev, "%s: access violation: 0x%x\n", func, reg_fail_reason);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index a3a135946078..e9cc6fedfea8 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -268,6 +268,7 @@ static void send_eos_event(struct vpu_instance *inst)
>   
>   	v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_eos);
>   	inst->eos = false;
> +	inst->sent_eos = true;
>   }
>   
>   static int handle_dynamic_resolution_change(struct vpu_instance *inst)
> @@ -347,13 +348,12 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
>   	struct vb2_v4l2_buffer *dec_buf = NULL;
>   	struct vb2_v4l2_buffer *disp_buf = NULL;
>   	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
> -	struct queue_status_info q_status;
>   
>   	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
>   
>   	ret = wave5_vpu_dec_get_output_info(inst, &dec_info);
>   	if (ret) {
> -		dev_warn(inst->dev->dev, "%s: could not get output info.", __func__);
> +		dev_dbg(inst->dev->dev, "%s: could not get output info.", __func__);
>   		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>   		return;
>   	}
> @@ -442,18 +442,14 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
>   		spin_unlock_irqrestore(&inst->state_spinlock, flags);
>   	}
>   
> -	/*
> -	 * During a resolution change and while draining, the firmware may flush
> -	 * the reorder queue regardless of having a matching decoding operation
> -	 * pending. Only terminate the job if there are no more IRQ coming.
> -	 */
> -	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
> -	if (q_status.report_queue_count == 0 &&
> -	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
> -		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
> -		pm_runtime_mark_last_busy(inst->dev->dev);

Patch is failing to apply here to linux-next because these redundant 
calls have already been removed[0].

Best,
Brandon

[0]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c?h=next-20250922&id=6f6fbd9a0c5a75eee0618c1499cf73cc770b3f52

> -		pm_runtime_put_autosuspend(inst->dev->dev);
> -		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +	if (inst->sent_eos &&
> +	    v4l2_m2m_get_curr_priv(inst->v4l2_m2m_dev)) {
> +		struct queue_status_info q_status;
> +
> +		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
> +		if (q_status.report_queue_count == 0 &&
> +		    q_status.instance_queue_count == 0)
> +			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>   	}
>   }
>   
> @@ -1143,11 +1139,31 @@ static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t b
>   	return 0;
>   }
>   
> +static struct vpu_src_buffer *inst_src_buf_remove(struct vpu_instance *inst)
> +{
> +	struct vpu_src_buffer *b;
> +
> +	if (list_empty(&inst->avail_src_bufs))
> +		return NULL;
> +	inst->queued_count--;
> +	b = list_first_entry(&inst->avail_src_bufs, struct vpu_src_buffer, list);
> +	list_del(&b->list);
> +	b->list.prev = NULL;
> +	b->list.next = NULL;
> +	INIT_LIST_HEAD(&b->list);
> +	if (inst->queued_count == 0) {
> +		inst->avail_src_bufs.prev = NULL;
> +		inst->avail_src_bufs.next = NULL;
> +		INIT_LIST_HEAD(&inst->avail_src_bufs);
> +	}
> +	return b;
> +}
> +
>   static int fill_ringbuffer(struct vpu_instance *inst)
>   {
>   	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> -	struct v4l2_m2m_buffer *buf, *n;
> -	int ret;
> +	struct vpu_src_buffer *vpu_buf;
> +	int ret = 0;
>   
>   	if (m2m_ctx->last_src_buf)  {
>   		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
> @@ -1158,9 +1174,8 @@ static int fill_ringbuffer(struct vpu_instance *inst)
>   		}
>   	}
>   
> -	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
> -		struct vb2_v4l2_buffer *vbuf = &buf->vb;
> -		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
> +	while ((vpu_buf = inst_src_buf_remove(inst)) != NULL) {
> +		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
>   		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
>   		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
>   		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
> @@ -1220,9 +1235,12 @@ static int fill_ringbuffer(struct vpu_instance *inst)
>   			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
>   			break;
>   		}
> +
> +		inst->queuing_num++;
> +		break;
>   	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
> @@ -1234,7 +1252,8 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
>   
>   	vpu_buf->consumed = false;
>   	vbuf->sequence = inst->queued_src_buf_num++;
> -
> +	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
> +	inst->queued_count++;
>   	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
>   }
>   
> @@ -1287,10 +1306,16 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
>   		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
>   		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
>   
> -	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		mutex_lock(&inst->feed_lock);
>   		wave5_vpu_dec_buf_queue_src(vb);
> -	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +
> +		if (inst->empty_queue)
> +			inst->empty_queue = false;
> +		mutex_unlock(&inst->feed_lock);
> +	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>   		wave5_vpu_dec_buf_queue_dst(vb);
> +	}
>   }
>   
>   static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
> @@ -1385,6 +1410,17 @@ static int streamoff_output(struct vb2_queue *q)
>   	dma_addr_t new_rd_ptr;
>   	struct dec_output_info dec_info;
>   	unsigned int i;
> +	struct vpu_src_buffer *vpu_buf, *tmp;
> +
> +	inst->retry = false;
> +	inst->queuing_num = 0;
> +	inst->queued_count = 0;
> +	mutex_lock(&inst->feed_lock);
> +	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list) {
> +		vpu_buf->consumed = false;
> +		list_del(&vpu_buf->list);
> +	}
> +	mutex_unlock(&inst->feed_lock);
>   
>   	for (i = 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
>   		ret = wave5_vpu_dec_set_disp_flag(inst, i);
> @@ -1470,27 +1506,10 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>   {
>   	struct vpu_instance *inst = vb2_get_drv_priv(q);
>   	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> -	bool check_cmd = TRUE;
>   
>   	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
>   	pm_runtime_resume_and_get(inst->dev->dev);
>   
> -	while (check_cmd) {
> -		struct queue_status_info q_status;
> -		struct dec_output_info dec_output_info;
> -
> -		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
> -
> -		if (q_status.report_queue_count == 0)
> -			break;
> -
> -		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
> -			break;
> -
> -		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
> -			dev_dbg(inst->dev->dev, "there is no output info\n");
> -	}
> -
>   	v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
>   
>   	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -1498,6 +1517,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>   	else
>   		streamoff_capture(q);
>   
> +	inst->empty_queue = false;
> +	inst->sent_eos = false;
>   	pm_runtime_mark_last_busy(inst->dev->dev);
>   	pm_runtime_put_autosuspend(inst->dev->dev);
>   }
> @@ -1577,13 +1598,24 @@ static void wave5_vpu_dec_device_run(void *priv)
>   	struct queue_status_info q_status;
>   	u32 fail_res = 0;
>   	int ret = 0;
> +	unsigned long flags;
>   
>   	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
>   	pm_runtime_resume_and_get(inst->dev->dev);
> -	ret = fill_ringbuffer(inst);
> -	if (ret) {
> -		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
> -		goto finish_job_and_return;
> +	if (!inst->retry) {
> +		mutex_lock(&inst->feed_lock);
> +		ret = fill_ringbuffer(inst);
> +		mutex_unlock(&inst->feed_lock);
> +		if (ret < 0) {
> +			dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
> +			goto finish_job_and_return;
> +		} else if (!inst->eos &&
> +				inst->queuing_num == 0 &&
> +				inst->state == VPU_INST_STATE_PIC_RUN) {
> +			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
> +			inst->empty_queue = true;
> +			goto finish_job_and_return;
> +		}
>   	}
>   
>   	switch (inst->state) {
> @@ -1608,7 +1640,9 @@ static void wave5_vpu_dec_device_run(void *priv)
>   			}
>   			spin_unlock_irqrestore(&inst->state_spinlock, flags);
>   		} else {
> +			spin_lock_irqsave(&inst->state_spinlock, flags);
>   			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
> +			spin_unlock_irqrestore(&inst->state_spinlock, flags);
>   		}
>   
>   		break;
> @@ -1619,8 +1653,9 @@ static void wave5_vpu_dec_device_run(void *priv)
>   		 * we had a chance to switch, which leads to an invalid state
>   		 * change.
>   		 */
> +		spin_lock_irqsave(&inst->state_spinlock, flags);
>   		switch_state(inst, VPU_INST_STATE_PIC_RUN);
> -
> +		spin_unlock_irqrestore(&inst->state_spinlock, flags);
>   		/*
>   		 * During DRC, the picture decoding remains pending, so just leave the job
>   		 * active until this decode operation completes.
> @@ -1634,12 +1669,14 @@ static void wave5_vpu_dec_device_run(void *priv)
>   		ret = wave5_prepare_fb(inst);
>   		if (ret) {
>   			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
> +			spin_lock_irqsave(&inst->state_spinlock, flags);
>   			switch_state(inst, VPU_INST_STATE_STOP);
> +			spin_unlock_irqrestore(&inst->state_spinlock, flags);
>   			break;
>   		}
>   
>   		if (q_status.instance_queue_count) {
> -			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> +			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>   			return;
>   		}
>   
> @@ -1650,26 +1687,42 @@ static void wave5_vpu_dec_device_run(void *priv)
>   			dev_err(inst->dev->dev,
>   				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
>   				m2m_ctx, ret, fail_res);
> -			break;
> +			goto finish_job_and_return;
> +		}
> +
> +		if (fail_res == WAVE5_SYSERR_QUEUEING_FAIL) {
> +			inst->retry = true;
> +		} else {
> +			inst->retry = false;
> +			if (!inst->eos)
> +				inst->queuing_num--;
>   		}
> -		/* Return so that we leave this job active */
> -		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> -		return;
> -	default:
> -		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
>   		break;
> +	default:
> +		dev_dbg(inst->dev->dev, "Execution of a job in state %s illegal.\n",
> +			state_to_str(inst->state));
>   	}
>   
>   finish_job_and_return:
>   	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
>   	pm_runtime_mark_last_busy(inst->dev->dev);
>   	pm_runtime_put_autosuspend(inst->dev->dev);
> -	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +	/*
> +	 * After receiving CMD_STOP, there is no input, but we have to run device_run
> +	 * to send DEC_PIC command until display index == -1, so job_finish was always
> +	 * called in the device_run to archive it, the logic was very wasteful
> +	 * in power and CPU time.
> +	 * If EOS is passed, device_run will not call job_finish no more, it is called
> +	 * only if HW is idle status in order to reduce overhead.
> +	 */
> +	if (!inst->sent_eos)
> +		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>   }
>   
>   static void wave5_vpu_dec_job_abort(void *priv)
>   {
>   	struct vpu_instance *inst = priv;
> +	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
>   	int ret;
>   
>   	ret = switch_state(inst, VPU_INST_STATE_STOP);
> @@ -1680,6 +1733,8 @@ static void wave5_vpu_dec_job_abort(void *priv)
>   	if (ret)
>   		dev_warn(inst->dev->dev,
>   			 "Setting EOS for the bitstream, fail: %d\n", ret);
> +
> +	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>   }
>   
>   static int wave5_vpu_dec_job_ready(void *priv)
> @@ -1715,7 +1770,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
>   				"No capture buffer ready to decode!\n");
>   			break;
>   		} else if (!wave5_is_draining_or_eos(inst) &&
> -			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
> +			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
> +			    inst->empty_queue)) {
>   			dev_dbg(inst->dev->dev,
>   				"No bitstream data to decode!\n");
>   			break;
> @@ -1755,6 +1811,8 @@ static int wave5_vpu_open_dec(struct file *filp)
>   	inst->ops = &wave5_vpu_dec_inst_ops;
>   
>   	spin_lock_init(&inst->state_spinlock);
> +	mutex_init(&inst->feed_lock);
> +	INIT_LIST_HEAD(&inst->avail_src_bufs);
>   
>   	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
>   	if (!inst->codec_info)
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.h b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
> index 5943bdaa9c4c..99c3be882192 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
> @@ -22,8 +22,8 @@
>   
>   struct vpu_src_buffer {
>   	struct v4l2_m2m_buffer	v4l2_m2m_buf;
> -	struct list_head	list;
>   	bool			consumed;
> +	struct list_head	list;
>   };
>   
>   struct vpu_dst_buffer {
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index 5b10f9f49b9f..b967f0efea57 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -52,11 +52,12 @@ int wave5_vpu_init_with_bitcode(struct device *dev, u8 *bitcode, size_t size)
>   int wave5_vpu_flush_instance(struct vpu_instance *inst)
>   {
>   	int ret = 0;
> +	int mutex_ret = 0;
>   	int retry = 0;
>   
> -	ret = mutex_lock_interruptible(&inst->dev->hw_lock);
> -	if (ret)
> -		return ret;
> +	mutex_ret = mutex_lock_interruptible(&inst->dev->hw_lock);
> +	if (mutex_ret)
> +		return mutex_ret;
>   	do {
>   		/*
>   		 * Repeat the FLUSH command until the firmware reports that the
> @@ -80,9 +81,9 @@ int wave5_vpu_flush_instance(struct vpu_instance *inst)
>   
>   			mutex_unlock(&inst->dev->hw_lock);
>   			wave5_vpu_dec_get_output_info(inst, &dec_info);
> -			ret = mutex_lock_interruptible(&inst->dev->hw_lock);
> -			if (ret)
> -				return ret;
> +			mutex_ret = mutex_lock_interruptible(&inst->dev->hw_lock);
> +			if (mutex_ret)
> +				return mutex_ret;
>   			if (dec_info.index_frame_display > 0)
>   				wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display);
>   		}
> @@ -207,6 +208,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>   	int retry = 0;
>   	struct vpu_device *vpu_dev = inst->dev;
>   	int i;
> +	struct dec_output_info dec_info;
> +	int ret_mutex;
>   
>   	*fail_res = 0;
>   	if (!inst->codec_info)
> @@ -214,10 +217,10 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>   
>   	pm_runtime_resume_and_get(inst->dev->dev);
>   
> -	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
> -	if (ret) {
> +	ret_mutex = mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret_mutex) {
>   		pm_runtime_put_sync(inst->dev->dev);
> -		return ret;
> +		return ret_mutex;
>   	}
>   
>   	do {
> @@ -227,11 +230,26 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>   			goto unlock_and_return;
>   		}
>   
> -		if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING &&
> -		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
> +		if (ret == 0)
> +			break;
> +
> +		if (*fail_res != WAVE5_SYSERR_VPU_STILL_RUNNING) {
> +			dev_warn(inst->dev->dev, "dec_finish_seq timed out\n");
> +			goto unlock_and_return;
> +		}
> +
> +		if (retry++ >= MAX_FIRMWARE_CALL_RETRY) {
>   			ret = -ETIMEDOUT;
>   			goto unlock_and_return;
>   		}
> +
> +		mutex_unlock(&vpu_dev->hw_lock);
> +		wave5_vpu_dec_get_output_info(inst, &dec_info);
> +		ret_mutex = mutex_lock_interruptible(&vpu_dev->hw_lock);
> +		if (ret_mutex) {
> +			pm_runtime_put_sync(inst->dev->dev);
> +			return ret_mutex;
> +		}
>   	} while (ret != 0);
>   
>   	dev_dbg(inst->dev->dev, "%s: dec_finish_seq complete\n", __func__);
> @@ -248,6 +266,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>   
>   	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
>   
> +	mutex_destroy(&inst->feed_lock);
> +
>   unlock_and_return:
>   	mutex_unlock(&vpu_dev->hw_lock);
>   	pm_runtime_put_sync(inst->dev->dev);
> @@ -460,11 +480,11 @@ int wave5_vpu_dec_set_rd_ptr(struct vpu_instance *inst, dma_addr_t addr, int upd
>   dma_addr_t wave5_vpu_dec_get_rd_ptr(struct vpu_instance *inst)
>   {
>   	int ret;
> -	dma_addr_t rd_ptr;
> +	dma_addr_t rd_ptr = 0;
>   
>   	ret = mutex_lock_interruptible(&inst->dev->hw_lock);
>   	if (ret)
> -		return ret;
> +		return rd_ptr;
>   
>   	rd_ptr = wave5_dec_get_rd_ptr(inst);
>   
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index bc101397204d..3088f3966fcb 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -818,6 +818,12 @@ struct vpu_instance {
>   	bool cbcr_interleave;
>   	bool nv21;
>   	bool eos;
> +	bool sent_eos; /* check if EOS is sent to application */
> +	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSERR_QUEUEING_FAIL*/
> +	int queuing_num; /* count of bitstream queued */
> +	int queued_count; /* the number of bitstream buffers queued from the buf_queue */
> +	struct mutex feed_lock; /* lock for feeding bitstream buffers */
> +	bool empty_queue;
>   	struct vpu_buf bitstream_vbuf;
>   	dma_addr_t last_rd_ptr;
>   	size_t remaining_consumed_bytes;
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
> index 1ea9f5f31499..4ebd48d5550e 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
> @@ -59,6 +59,7 @@
>   //  application specific configuration
>   #define VPU_ENC_TIMEOUT                 60000
>   #define VPU_DEC_TIMEOUT                 60000
> +#define VPU_DEC_STOP_TIMEOUT            10
>   
>   // for WAVE encoder
>   #define USE_SRC_PRP_AXI         0


