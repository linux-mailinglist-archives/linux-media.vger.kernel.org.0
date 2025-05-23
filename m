Return-Path: <linux-media+bounces-33285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D3FAC28ED
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 19:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6F5A1C02371
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57F92989B9;
	Fri, 23 May 2025 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GApqQmT8"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C6D2949F1;
	Fri, 23 May 2025 17:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021966; cv=none; b=bCr4Br1aXOW1IakJu4bCD7K4X8m2gtExA5Z8GDzj74O1sYqLW62WuaBarD4My+vgXbkXtU6pDbDug9kfvpZzw/z/K5W+LBXhjEBELKg4533bFNfubLJG3lEpNe0Sn1ak73SVqhQDiqqpimnKun+LH8pJaGcbmI8EylC3h7z9jdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021966; c=relaxed/simple;
	bh=02vffonpKOnqriMsjoT9XenjnT73pxYrTVGG6i7hnoM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wh0DxQW1kT0Nez2GAd8/37aYOB8szD6oo6cgo05o5DBTwokNg/UPx2PB/tOO44Q2rJJFdNZhK6y/Gawu28FkzacGkEX7hGjK48yhHLz1OnJeVSXAYMbEP8QMx3aVsuOXTcXWNnaHLQMVieRrYZdfeZKaqV/YMKnSvYiKxKmtDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GApqQmT8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748021961;
	bh=02vffonpKOnqriMsjoT9XenjnT73pxYrTVGG6i7hnoM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GApqQmT8SktJucKb2uZZjjMRBcbNPCfIn0Gm+cYdsRvE15r5qxxRFNa9IAxy7xgLt
	 gFbAjSDcPlOZDzJ9THRR+Yw+IjrDK8ajshelBG0UIhPcbd+PhyJUZMdFWyzp66MKvM
	 dnS4anfTNJbsVc3ZFWiOnZTCHhK28Kvl6krt4/QH/as1iozY90pUFDc8BdD2R7964u
	 nLOaKojn1/eTVouMHsxAL4aqrSv+KtYVSgBQaIIIt1wijRZlfT+kT9gcGAVlxZlOb0
	 Q7WwtUou8cBW5mixivP/NJG41lX7OTFa8LEOzdLdkiFT9KuY1SKGHvMAlcvQ0neIuT
	 ao4pg4b1cf2Bg==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 59D5917E1135;
	Fri, 23 May 2025 19:39:20 +0200 (CEST)
Message-ID: <3afbd0253fabcf9f8795ab2231107e2e9da012cc.camel@collabora.com>
Subject: Re: [PATCH v2 2/7] media: chips-media: wave5: Improve performance
 of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 23 May 2025 13:39:19 -0400
In-Reply-To: <20250522072606.51-3-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
	 <20250522072606.51-3-jackson.lee@chipsnmedia.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Le jeudi 22 mai 2025 à 16:26 +0900, Jackson.lee a écrit :
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> The current decoding method  was to wait until each frame was
> decoded after feeding a bitstream. As a result, performance was low
> and Wave5 could not achieve max pixel processing rate.
> 
> Update driver to use an asynchronous approach for decoding and feeding a
> bitstream in order to achieve full capabilities of the device.
> 
> WAVE5 supports command-queueing to maximize performance by pipelining
> internal commands and by hiding wait cycle taken to receive a command
> from Host processor.
> 
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
> To archive this goal, the device_run() calls v4l2_m2m_job_finish
> so that next command can be sent to VPU continuously, if there is
> any result, then irq is triggered and gets decoded frames and returns
> them to upper layer.
> Theses processes work independently each other without waiting
> a decoded frame.
> 
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../platform/chips-media/wave5/wave5-hw.c     |  2 +-
>  .../chips-media/wave5/wave5-vpu-dec.c         | 84 +++++++++++--------
>  .../platform/chips-media/wave5/wave5-vpuapi.c |  2 +
>  .../platform/chips-media/wave5/wave5-vpuapi.h |  3 +
>  4 files changed, 57 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> index d94cf84c3ee5..687ce6ccf3ae 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -102,7 +102,7 @@ static void _wave5_print_reg_err(struct vpu_device *vpu_dev, u32 reg_fail_reason
>  		dev_dbg(dev, "%s: queueing failure: 0x%x\n", func, reg_val);
>  		break;
>  	case WAVE5_SYSERR_RESULT_NOT_READY:
> -		dev_err(dev, "%s: result not ready: 0x%x\n", func, reg_fail_reason);
> +		dev_dbg(dev, "%s: result not ready: 0x%x\n", func, reg_fail_reason);
>  		break;
>  	case WAVE5_SYSERR_ACCESS_VIOLATION_HW:
>  		dev_err(dev, "%s: access violation: 0x%x\n", func, reg_fail_reason);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-
> media/wave5/wave5-vpu-dec.c
> index 32de43de1870..995234a3a6d6 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -347,13 +347,12 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
>  	struct vb2_v4l2_buffer *dec_buf = NULL;
>  	struct vb2_v4l2_buffer *disp_buf = NULL;
>  	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
> -	struct queue_status_info q_status;
>  
>  	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
>  
>  	ret = wave5_vpu_dec_get_output_info(inst, &dec_info);
>  	if (ret) {
> -		dev_warn(inst->dev->dev, "%s: could not get output info.", __func__);
> +		dev_dbg(inst->dev->dev, "%s: could not get output info.", __func__);

Wouldn't it be better to check the return value to possibly differentiate some errors
from something similar to EGAIN?

>  		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  		return;
>  	}
> @@ -441,20 +440,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
>  		}
>  		spin_unlock_irqrestore(&inst->state_spinlock, flags);
>  	}
> -
> -	/*
> -	 * During a resolution change and while draining, the firmware may flush
> -	 * the reorder queue regardless of having a matching decoding operation
> -	 * pending. Only terminate the job if there are no more IRQ coming.
> -	 */
> -	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
> -	if (q_status.report_queue_count == 0 &&
> -	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
> -		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
> -		pm_runtime_mark_last_busy(inst->dev->dev);
> -		pm_runtime_put_autosuspend(inst->dev->dev);
> -		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> -	}
>  }
>  
>  static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> @@ -1146,8 +1131,8 @@ static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t b
>  static int fill_ringbuffer(struct vpu_instance *inst)
>  {
>  	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> -	struct v4l2_m2m_buffer *buf, *n;
> -	int ret;
> +	struct vpu_src_buffer *vpu_buf;
> +	int ret = 0;
>  
>  	if (m2m_ctx->last_src_buf)  {
>  		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
> @@ -1158,9 +1143,8 @@ static int fill_ringbuffer(struct vpu_instance *inst)
>  		}
>  	}
>  
> -	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
> -		struct vb2_v4l2_buffer *vbuf = &buf->vb;
> -		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
> +	list_for_each_entry(vpu_buf, &inst->avail_src_bufs, list) {
> +		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
>  		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
>  		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
>  		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
> @@ -1220,9 +1204,13 @@ static int fill_ringbuffer(struct vpu_instance *inst)
>  			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
>  			break;
>  		}
> +
> +		inst->queuing_num++;
> +		list_del_init(&vpu_buf->list);
> +		break;
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
> @@ -1236,6 +1224,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
>  	vbuf->sequence = inst->queued_src_buf_num++;
>  
>  	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
> +
> +	INIT_LIST_HEAD(&vpu_buf->list);
> +	mutex_lock(&inst->feed_lock);
> +	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
> +	mutex_unlock(&inst->feed_lock);
>  }
>  
>  static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
> @@ -1385,6 +1378,13 @@ static int streamoff_output(struct vb2_queue *q)
>  	dma_addr_t new_rd_ptr;
>  	struct dec_output_info dec_info;
>  	unsigned int i;
> +	struct vpu_src_buffer *vpu_buf, *tmp;
> +
> +	inst->retry = false;
> +	inst->queuing_num = 0;
> +
> +	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list)
> +		list_del_init(&vpu_buf->list);
>  
>  	for (i = 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
>  		ret = wave5_vpu_dec_set_disp_flag(inst, i);
> @@ -1580,10 +1580,19 @@ static void wave5_vpu_dec_device_run(void *priv)
>  
>  	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
>  	pm_runtime_resume_and_get(inst->dev->dev);
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
> +			goto finish_job_and_return;
> +		}
>  	}
>  
>  	switch (inst->state) {
> @@ -1639,7 +1648,7 @@ static void wave5_vpu_dec_device_run(void *priv)
>  		}
>  
>  		if (q_status.instance_queue_count) {
> -			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> +			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  			return;
>  		}
>  
> @@ -1650,14 +1659,21 @@ static void wave5_vpu_dec_device_run(void *priv)
>  			dev_err(inst->dev->dev,
>  				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
>  				m2m_ctx, ret, fail_res);
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

I looked into the original state machine violation you had in previous version, and I got
the impression that the reason you did hit that was that you actually call device_run
passed inst->eos. Its probably not that simple in practice, but I think you forgot to adapt
the job_ready() ops to prevent more device_run() called passed CMD_STOP and having all
pending buffer written in the ring buffer.

As a side effect, you endup calling device_run() in a race with the finish() setting
the state to STOP. I really think there is a way to use inst->eos boolean to prevent
that race in the first place. Might need to be combined with checking if you have buffers
prior to command stop that did not yet fit into the ring buffer.

>  		}
> -		/* Return so that we leave this job active */
> -		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> -		return;
> -	default:
> -		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
>  		break;
> +	default:
> +		dev_dbg(inst->dev->dev, "Execution of a job in state %s illegal.\n",
> +			state_to_str(inst->state));
> +
>  	}
>  
>  finish_job_and_return:
> @@ -1755,6 +1771,8 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	inst->ops = &wave5_vpu_dec_inst_ops;
>  
>  	spin_lock_init(&inst->state_spinlock);
> +	mutex_init(&inst->feed_lock);
> +	INIT_LIST_HEAD(&inst->avail_src_bufs);
>  
>  	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
>  	if (!inst->codec_info)
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-
> vpuapi.c
> index e5e879a13e8b..68d86625538f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -255,6 +255,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  	if (inst_count == 1)
>  		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
>  
> +	mutex_destroy(&inst->feed_lock);
> +
>  unlock_and_return:
>  	mutex_unlock(&vpu_dev->hw_lock);
>  	pm_runtime_put_sync(inst->dev->dev);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-
> vpuapi.h
> index f3c1ad6fb3be..fd0aef0bac4e 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -818,6 +818,9 @@ struct vpu_instance {
>  	bool cbcr_interleave;
>  	bool nv21;
>  	bool eos;
> +	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSERR_QUEUEING_FAIL*/
> +	int queuing_num; /* check if there is input buffer or not */

This is described as a boolean, but is implemented as a counter. What does it count exactly ?
I think it needs a better name too.

Nicolas

> +	struct mutex feed_lock; /* lock for feeding bitstream buffers */
>  	struct vpu_buf bitstream_vbuf;
>  	dma_addr_t last_rd_ptr;
>  	size_t remaining_consumed_bytes;

