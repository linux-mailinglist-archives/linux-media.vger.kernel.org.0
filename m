Return-Path: <linux-media+bounces-22357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E025D9DE9F8
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 16:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0764281472
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 15:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389631474A2;
	Fri, 29 Nov 2024 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="BTmMKtuv"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE73148FF5;
	Fri, 29 Nov 2024 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732895577; cv=pass; b=kLqp1TXFmZGblJzhH6zegSKJ82ETeUlDAgMXr7FrERJ+VHuI/QS63l9WzrfyyTXhbRJKl+9FR0DOHTHFs9En574nsM2CkGktrErvXRrLsry34Ct4wWonkai/evfrpJDCSA2H/nJonzzzjPSWYNXhYqeZMJJeeHEVzQU7vXkWuSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732895577; c=relaxed/simple;
	bh=iF36e1CESeiox8i3w6g7l7fMnxI5koZJlEMBSa7pp/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGeHjKrMBRNeiqM8wK951Kbq/avMfRNDfah0Y9NARWFwbfL2LKavud/nOqQzoDmu1PGfLiK5HIKqsrAvxKw+7pWPFb9mm8CWhlNM+Q1tedaeiqvY1LRmxAHyhw2aogqlfgGC/FUU2pVX7jhn6rXHRE/BmxLrblSXYLFO94mV3i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=BTmMKtuv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1732895556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HCvKPflelr3jYysdFItbcyVUE0gQ2pkyI0VhoEQO3qxa3i7lGw4Cuc5Z/M+bdaYIiYZ3Awj6lMSlb9rpboZxKwqfrYGJ6W36kfRHnrJ7uVghztP8orF3IEZ3uOpWkX1ILNmHrLmtzGp9alXuyt9BCRDGnOC7DtfkdxpOkQMm1Vw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732895556; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NsmdXm1h8IPlgk1aPuEFX+YoxJF9epDI458ZjCoLCLY=; 
	b=IvlAy0IOs8ezxtoUYrShQuFo2ImfCGBXGiT1D4+D5YcisAUUTOlkDXjqECYdPSRC3gxNF1H5GPrgZHxlT2CGUiGRafVXD08vjAM0TSXlSMwuyqyUCwx5G9410ajIYFL1o2adgYw596Gq+5lpGq8kZNKw67GqhJxTXAr6xNkSmU8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732895556;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=NsmdXm1h8IPlgk1aPuEFX+YoxJF9epDI458ZjCoLCLY=;
	b=BTmMKtuvR68vpgv8sKKwyRFsOHQvHKHPkVbDT+tfRHA4lEIh1bIKqpeaVVqcMf1I
	qYGuJ92rwmdqjJoxQXHYXRScn+kJhVYeKR/lUJ695riOZfuX+lFU6UHCXX1p7e0n7yo
	btPQxTaSEkkUBAup92xcDMpJyKgy7z0sX82vec9s=
Received: by mx.zohomail.com with SMTPS id 1732895554497242.54250611912528;
	Fri, 29 Nov 2024 07:52:34 -0800 (PST)
Date: Fri, 29 Nov 2024 16:52:29 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>
Cc: mchehab@kernel.org, nicolas@ndufresne.ca, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	b-brnich@ti.com
Subject: Re: [PATCH v0 3/6] media: chips-media: wave5: Improve performance of
 decoder
Message-ID: <20241129155229.tzitsog4aqz2rd74@basti-XPS-13-9310>
References: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
 <20241112021517.121-4-jackson.lee@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241112021517.121-4-jackson.lee@chipsnmedia.com>
X-ZohoMailClient: External

Hey Jackson,

I did a bit of testing and I ran into a couple of different issues when
decoding with more than 1 thread, could you have a look into these? I
know that this is broken before the patch as well, but I feel like we
should first get decoding with more than 1 thread correct before we make
decoding asynchronous, because that won't make debugging any easier.

Have a look here: https://paste.debian.net/1337231/

Regards,
Sebastian

On 12.11.2024 11:15, Jackson.lee wrote:
>The existing way for decoding frames was to wait until each frame was
>decoded after feeding a bitstream. As a result, performance was low
>and Wave5 could not achieve max pixel processing rate.
>
>Update driver to use an asynchronous approach for decoding and feeding a
>bitstream in order to achieve full capabilities of the device.
>
>Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
>Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>---
> .../platform/chips-media/wave5/wave5-helper.c |   6 +
> .../chips-media/wave5/wave5-vpu-dec.c         | 380 +++++++++++-------
> .../platform/chips-media/wave5/wave5-vpu.c    |   5 +-
> .../platform/chips-media/wave5/wave5-vpuapi.c |   1 +
> .../platform/chips-media/wave5/wave5-vpuapi.h |   6 +
> 5 files changed, 251 insertions(+), 147 deletions(-)
>
>diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
>index 2c9d8cbca6e4..2412de290eca 100644
>--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
>+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
>@@ -62,6 +62,12 @@ int wave5_vpu_release_device(struct file *filp,
> 	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
> 	int ret = 0;
>
>+	if (inst->run_thread) {
>+		kthread_stop(inst->run_thread);
>+		up(&inst->run_sem);
>+		inst->run_thread = NULL;
>+	}
>+
> 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> 	if (inst->state != VPU_INST_STATE_NONE) {
> 		u32 fail_res;
>diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
>index d3ff420c52ce..f0db531247ac 100644
>--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
>+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
>@@ -6,6 +6,9 @@
>  */
>
> #include <linux/pm_runtime.h>
>+#include <linux/delay.h>
>+#include <linux/timer.h>
>+#include <linux/atomic.h>
> #include "wave5-helper.h"
>
> #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
>@@ -101,6 +104,24 @@ static const struct vpu_format dec_fmt_list[FMT_TYPES][MAX_FMTS] = {
> 	}
> };
>
>+static int run_thread(void *data)
>+{
>+	struct vpu_instance *inst = (struct vpu_instance *)data;
>+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
>+
>+	while (!kthread_should_stop()) {
>+		if (down_interruptible(&inst->run_sem))
>+			continue;
>+
>+		if (kthread_should_stop())
>+			break;
>+
>+		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>+	}
>+
>+	return 0;
>+}
>+
> /*
>  * Make sure that the state switch is allowed and add logging for debugging
>  * purposes
>@@ -230,7 +251,6 @@ static int start_decode(struct vpu_instance *inst, u32 *fail_res)
> 		switch_state(inst, VPU_INST_STATE_STOP);
>
> 		dev_dbg(inst->dev->dev, "%s: pic run failed / finish job", __func__);
>-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> 	}
>
> 	return ret;
>@@ -347,7 +367,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
> 	struct vb2_v4l2_buffer *dec_buf = NULL;
> 	struct vb2_v4l2_buffer *disp_buf = NULL;
> 	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
>-	struct queue_status_info q_status;
>
> 	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
>
>@@ -360,11 +379,22 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
>
> 	dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &dec_info.rd_ptr,
> 		&dec_info.wr_ptr);
>-	wave5_handle_src_buffer(inst, dec_info.rd_ptr);
>
> 	dev_dbg(inst->dev->dev, "%s: dec_info dec_idx %i disp_idx %i", __func__,
> 		dec_info.index_frame_decoded, dec_info.index_frame_display);
>
>+	if (inst->std == W_AVC_DEC &&
>+	    dec_info.index_frame_decoded == DECODED_IDX_FLAG_SKIP &&
>+	    dec_info.index_frame_display == DISPLAY_IDX_FLAG_NO_FB) {
>+		struct vb2_v4l2_buffer *src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
>+
>+		if (src_buf)
>+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
>+		return;
>+	}
>+
>+	wave5_handle_src_buffer(inst, dec_info.rd_ptr);
>+
> 	if (!vb2_is_streaming(dst_vq)) {
> 		dev_dbg(inst->dev->dev, "%s: capture is not streaming..", __func__);
> 		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>@@ -441,20 +471,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
> 		}
> 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
> 	}
>-
>-	/*
>-	 * During a resolution change and while draining, the firmware may flush
>-	 * the reorder queue regardless of having a matching decoding operation
>-	 * pending. Only terminate the job if there are no more IRQ coming.
>-	 */
>-	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
>-	if (q_status.report_queue_count == 0 &&
>-	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
>-		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
>-		pm_runtime_mark_last_busy(inst->dev->dev);
>-		pm_runtime_put_autosuspend(inst->dev->dev);
>-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>-	}
> }
>
> static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>@@ -465,6 +481,142 @@ static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capab
> 	return 0;
> }
>
>+static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
>+			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
>+{
>+	size_t size;
>+	size_t offset = wr_ptr - ring_buffer->daddr;
>+	int ret;
>+
>+	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
>+		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
>+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
>+		if (ret < 0)
>+			return ret;
>+
>+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
>+					     buffer_size - size);
>+		if (ret < 0)
>+			return ret;
>+	} else {
>+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
>+					     buffer_size);
>+		if (ret < 0)
>+			return ret;
>+	}
>+
>+	return 0;
>+}
>+
>+static int fill_ringbuffer(struct vpu_instance *inst)
>+{
>+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
>+	struct vpu_src_buffer *vpu_buf;
>+	int ret = 0;
>+
>+	if (m2m_ctx->last_src_buf)  {
>+		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
>+
>+		if (vpu_buf->consumed) {
>+			dev_dbg(inst->dev->dev, "last src buffer already written\n");
>+			return 0;
>+		}
>+	}
>+
>+	list_for_each_entry(vpu_buf, &inst->avail_src_bufs, list) {
>+		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
>+		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
>+		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
>+		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
>+		dma_addr_t rd_ptr = 0;
>+		dma_addr_t wr_ptr = 0;
>+		size_t remain_size = 0;
>+
>+		if (vpu_buf->consumed) {
>+			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
>+				vbuf->vb2_buf.index);
>+			continue;
>+		}
>+
>+		if (!src_buf) {
>+			dev_dbg(inst->dev->dev,
>+				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
>+				__func__, vbuf->vb2_buf.index);
>+			break;
>+		}
>+
>+		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
>+		if (ret) {
>+			/* Unable to acquire the mutex */
>+			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
>+				ret);
>+			return ret;
>+		}
>+
>+		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
>+
>+		if (remain_size < src_size) {
>+			dev_dbg(inst->dev->dev,
>+				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
>+				__func__, remain_size, src_size, vbuf->vb2_buf.index);
>+			break;
>+		}
>+
>+		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
>+		if (ret) {
>+			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
>+				vbuf->vb2_buf.index, ret);
>+			return ret;
>+		}
>+
>+		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
>+		if (ret) {
>+			dev_dbg(inst->dev->dev,
>+				"update_bitstream_buffer fail: %d for src buf (%u)\n",
>+				ret, vbuf->vb2_buf.index);
>+			break;
>+		}
>+
>+		vpu_buf->consumed = true;
>+
>+		/* Don't write buffers passed the last one while draining. */
>+		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
>+			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
>+			break;
>+		}
>+
>+		inst->queuing_num++;
>+		list_del_init(&vpu_buf->list);
>+		break;
>+	}
>+
>+	return ret;
>+}
>+
>+static void wave5_vpu_dec_feed_remaining(struct vpu_instance *inst)
>+{
>+	int ret = 0;
>+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
>+	u32 fail_res = 0;
>+
>+	mutex_lock(&inst->feed_lock);
>+	ret = fill_ringbuffer(inst);
>+	mutex_unlock(&inst->feed_lock);
>+	if (ret) {
>+		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
>+		return;
>+	}
>+
>+	ret = start_decode(inst, &fail_res);
>+	if (ret) {
>+		dev_err(inst->dev->dev,
>+			"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
>+			m2m_ctx, ret, fail_res);
>+	}
>+
>+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>+}
>+
> static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_frmsizeenum *fsize)
> {
> 	const struct vpu_format *vpu_fmt;
>@@ -794,11 +946,21 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
> 	}
>
> 	if (inst->state != VPU_INST_STATE_NONE) {
>+		struct vb2_v4l2_buffer *vbuf;
>+		struct vpu_src_buffer *vpu_buf;
>+
> 		/*
> 		 * Temporarily release the state_spinlock so that subsequent
> 		 * calls do not block on a mutex while inside this spinlock.
> 		 */
> 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
>+		vbuf = v4l2_m2m_last_src_buf(m2m_ctx);
>+		if (vbuf) {
>+			vpu_buf = wave5_to_vpu_src_buf(vbuf);
>+			if (!vpu_buf->consumed)
>+				wave5_vpu_dec_feed_remaining(inst);
>+		}
>+
> 		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
> 		if (ret)
> 			return ret;
>@@ -1116,115 +1278,6 @@ static int wave5_prepare_fb(struct vpu_instance *inst)
> 	return 0;
> }
>
>-static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
>-			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
>-{
>-	size_t size;
>-	size_t offset = wr_ptr - ring_buffer->daddr;
>-	int ret;
>-
>-	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
>-		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
>-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
>-		if (ret < 0)
>-			return ret;
>-
>-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
>-					     buffer_size - size);
>-		if (ret < 0)
>-			return ret;
>-	} else {
>-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
>-					     buffer_size);
>-		if (ret < 0)
>-			return ret;
>-	}
>-
>-	return 0;
>-}
>-
>-static int fill_ringbuffer(struct vpu_instance *inst)
>-{
>-	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
>-	struct v4l2_m2m_buffer *buf, *n;
>-	int ret;
>-
>-	if (m2m_ctx->last_src_buf)  {
>-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
>-
>-		if (vpu_buf->consumed) {
>-			dev_dbg(inst->dev->dev, "last src buffer already written\n");
>-			return 0;
>-		}
>-	}
>-
>-	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
>-		struct vb2_v4l2_buffer *vbuf = &buf->vb;
>-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
>-		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
>-		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
>-		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
>-		dma_addr_t rd_ptr = 0;
>-		dma_addr_t wr_ptr = 0;
>-		size_t remain_size = 0;
>-
>-		if (vpu_buf->consumed) {
>-			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
>-				vbuf->vb2_buf.index);
>-			continue;
>-		}
>-
>-		if (!src_buf) {
>-			dev_dbg(inst->dev->dev,
>-				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
>-				__func__, vbuf->vb2_buf.index);
>-			break;
>-		}
>-
>-		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
>-		if (ret) {
>-			/* Unable to acquire the mutex */
>-			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
>-				ret);
>-			return ret;
>-		}
>-
>-		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
>-
>-		if (remain_size < src_size) {
>-			dev_dbg(inst->dev->dev,
>-				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
>-				__func__, remain_size, src_size, vbuf->vb2_buf.index);
>-			break;
>-		}
>-
>-		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
>-		if (ret) {
>-			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
>-				vbuf->vb2_buf.index, ret);
>-			return ret;
>-		}
>-
>-		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
>-		if (ret) {
>-			dev_dbg(inst->dev->dev,
>-				"update_bitstream_buffer fail: %d for src buf (%u)\n",
>-				ret, vbuf->vb2_buf.index);
>-			break;
>-		}
>-
>-		vpu_buf->consumed = true;
>-
>-		/* Don't write buffers passed the last one while draining. */
>-		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
>-			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
>-			break;
>-		}
>-	}
>-
>-	return 0;
>-}
>-
> static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
> {
> 	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
>@@ -1236,6 +1289,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
> 	vbuf->sequence = inst->queued_src_buf_num++;
>
> 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
>+
>+	INIT_LIST_HEAD(&vpu_buf->list);
>+	mutex_lock(&inst->feed_lock);
>+	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
>+	mutex_unlock(&inst->feed_lock);
> }
>
> static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
>@@ -1287,10 +1345,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
> 		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> 		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
>
>-	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>+	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>+		if (inst->empty_queue)
>+			inst->empty_queue = false;
> 		wave5_vpu_dec_buf_queue_src(vb);
>-	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>+	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> 		wave5_vpu_dec_buf_queue_dst(vb);
>+	}
> }
>
> static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
>@@ -1369,6 +1430,13 @@ static int streamoff_output(struct vb2_queue *q)
> 	struct vb2_v4l2_buffer *buf;
> 	int ret;
> 	dma_addr_t new_rd_ptr;
>+	struct vpu_src_buffer *vpu_buf, *tmp;
>+
>+	inst->retry = false;
>+	inst->queuing_num = 0;
>+
>+	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list)
>+		list_del_init(&vpu_buf->list);
>
> 	while ((buf = v4l2_m2m_src_buf_remove(m2m_ctx))) {
> 		dev_dbg(inst->dev->dev, "%s: (Multiplanar) buf type %4u | index %4u\n",
>@@ -1445,6 +1513,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>
> 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> 	pm_runtime_resume_and_get(inst->dev->dev);
>+	inst->empty_queue = false;
>
> 	while (check_cmd) {
> 		struct queue_status_info q_status;
>@@ -1452,10 +1521,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>
> 		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
>
>-		if (q_status.report_queue_count == 0)
>-			break;
>-
>-		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
>+		if ((inst->state == VPU_INST_STATE_STOP || q_status.instance_queue_count == 0) &&
>+		    q_status.report_queue_count == 0)
> 			break;
>
> 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
>@@ -1548,13 +1615,24 @@ static void wave5_vpu_dec_device_run(void *priv)
> 	struct queue_status_info q_status;
> 	u32 fail_res = 0;
> 	int ret = 0;
>+	unsigned long flags;
>
> 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
> 	pm_runtime_resume_and_get(inst->dev->dev);
>-	ret = fill_ringbuffer(inst);
>-	if (ret) {
>-		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
>-		goto finish_job_and_return;
>+	if (!inst->retry) {
>+		mutex_lock(&inst->feed_lock);
>+		ret = fill_ringbuffer(inst);
>+		mutex_unlock(&inst->feed_lock);
>+		if (ret < 0) {
>+			dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
>+			goto finish_job_and_return;
>+		} else if (!inst->eos &&
>+			   inst->queuing_num == 0 &&
>+			   inst->state == VPU_INST_STATE_PIC_RUN) {
>+			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
>+			inst->empty_queue = true;
>+			goto finish_job_and_return;
>+		}
> 	}
>
> 	switch (inst->state) {
>@@ -1590,7 +1668,9 @@ static void wave5_vpu_dec_device_run(void *priv)
> 		 * we had a chance to switch, which leads to an invalid state
> 		 * change.
> 		 */
>+		spin_lock_irqsave(&inst->state_spinlock, flags);
> 		switch_state(inst, VPU_INST_STATE_PIC_RUN);
>+		spin_unlock_irqrestore(&inst->state_spinlock, flags);
>
> 		/*
> 		 * During DRC, the picture decoding remains pending, so just leave the job
>@@ -1605,12 +1685,14 @@ static void wave5_vpu_dec_device_run(void *priv)
> 		ret = wave5_prepare_fb(inst);
> 		if (ret) {
> 			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
>+			spin_lock_irqsave(&inst->state_spinlock, flags);
> 			switch_state(inst, VPU_INST_STATE_STOP);
>+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
> 			break;
> 		}
>
> 		if (q_status.instance_queue_count) {
>-			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
>+			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> 			return;
> 		}
>
>@@ -1621,11 +1703,17 @@ static void wave5_vpu_dec_device_run(void *priv)
> 			dev_err(inst->dev->dev,
> 				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
> 				m2m_ctx, ret, fail_res);
>-			break;
>+			goto finish_job_and_return;
> 		}
> 		/* Return so that we leave this job active */
>-		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
>-		return;
>+		if (fail_res == WAVE5_SYSERR_QUEUEING_FAIL) {
>+			inst->retry = true;
>+		} else {
>+			inst->retry = false;
>+			if (!inst->eos)
>+				inst->queuing_num--;
>+		}
>+		break;
> 	default:
> 		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
> 		break;
>@@ -1633,9 +1721,7 @@ static void wave5_vpu_dec_device_run(void *priv)
>
> finish_job_and_return:
> 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
>-	pm_runtime_mark_last_busy(inst->dev->dev);
>-	pm_runtime_put_autosuspend(inst->dev->dev);
>-	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>+	up(&inst->run_sem);
> }
>
> static void wave5_vpu_dec_job_abort(void *priv)
>@@ -1686,7 +1772,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
> 				"No capture buffer ready to decode!\n");
> 			break;
> 		} else if (!wave5_is_draining_or_eos(inst) &&
>-			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
>+			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
>+			    inst->empty_queue)) {
> 			dev_dbg(inst->dev->dev,
> 				"No bitstream data to decode!\n");
> 			break;
>@@ -1726,6 +1813,8 @@ static int wave5_vpu_open_dec(struct file *filp)
> 	inst->ops = &wave5_vpu_dec_inst_ops;
>
> 	spin_lock_init(&inst->state_spinlock);
>+	mutex_init(&inst->feed_lock);
>+	INIT_LIST_HEAD(&inst->avail_src_bufs);
>
> 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
> 	if (!inst->codec_info)
>@@ -1797,6 +1886,9 @@ static int wave5_vpu_open_dec(struct file *filp)
> 	if (inst->dev->product_code != WAVE515_CODE)
> 		wave5_vdi_allocate_sram(inst->dev);
>
>+	sema_init(&inst->run_sem, 1);
>+	inst->run_thread = kthread_run(run_thread, inst, "run thread");
>+
> 	ret = mutex_lock_interruptible(&dev->dev_lock);
> 	if (ret)
> 		goto cleanup_inst;
>diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>index 63a607d10433..a9bd96cbf9ac 100644
>--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>@@ -51,7 +51,7 @@ static void wave5_vpu_handle_irq(void *dev_id)
> 	u32 seq_done;
> 	u32 cmd_done;
> 	u32 irq_reason;
>-	struct vpu_instance *inst;
>+	struct vpu_instance *inst, *tmp;
> 	struct vpu_device *dev = dev_id;
>
> 	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
>@@ -60,8 +60,7 @@ static void wave5_vpu_handle_irq(void *dev_id)
> 	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
> 	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
>
>-	list_for_each_entry(inst, &dev->instances, list) {
>-
>+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
> 		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
> 		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
> 			if (dev->product_code == WAVE515_CODE &&
>diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
>index e16b990041c2..a5b1966530c0 100644
>--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
>+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
>@@ -247,6 +247,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>
> unlock_and_return:
> 	mutex_unlock(&vpu_dev->hw_lock);
>+	mutex_destroy(&inst->feed_lock);
> 	pm_runtime_put_sync(inst->dev->dev);
> 	return ret;
> }
>diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
>index 45615c15beca..7cdb5b5fe3e4 100644
>--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
>+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
>@@ -812,11 +812,17 @@ struct vpu_instance {
> 	bool cbcr_interleave;
> 	bool nv21;
> 	bool eos;
>+	bool retry;
>+	bool empty_queue;
>+	int queuing_num;
>+	struct mutex feed_lock; /* lock for feeding bitstream buffers */
> 	struct vpu_buf bitstream_vbuf;
> 	dma_addr_t last_rd_ptr;
> 	size_t remaining_consumed_bytes;
> 	bool needs_reallocation;
>
>+	struct semaphore run_sem;
>+	struct task_struct *run_thread;
> 	unsigned int min_src_buf_count;
> 	unsigned int rot_angle;
> 	unsigned int mirror_direction;
>-- 
>2.43.0
>
>
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

