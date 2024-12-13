Return-Path: <linux-media+bounces-23400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5879F16BA
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 20:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C906F7A1020
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 19:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3997918E750;
	Fri, 13 Dec 2024 19:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B3Ep0V7t"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E32187555;
	Fri, 13 Dec 2024 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734119305; cv=none; b=Fn2vYydvtevkisYISVXjHMVheXkPbgMf4FhFCaSKl2jqezpAOonuxjI8E9RbzqAq/0YhBRkeyA0STPvH0FfxJNlzlN3OdQseiXuf76/XJgKvo72bRdi/e+I69h1RYX/DFm85ZUjPFQ7+Gl0qwNdGRtlHl5FotUIN8Drdd8OfjHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734119305; c=relaxed/simple;
	bh=EakHf7hZIS9qxIcszIU1hPU8ka7AIwSwFyw1ava5MnA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pxi7evxPoqEoZFwqIEo5ZAalhcB/N5kyQT+cTkBAB3ZG4g627FELDUlFc1zIHLc2Sed2gOZ7mrYe/6CVkpXfHWBROk5E+O2EtcbrdETs06zwYaFYHT5TNL7gDMJh4I3vp2PYWO2ndSrS5BJ+L/dXTERnFVidj5GiITtsyPI/KEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B3Ep0V7t; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734119299;
	bh=EakHf7hZIS9qxIcszIU1hPU8ka7AIwSwFyw1ava5MnA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=B3Ep0V7tTYzd42XYZVae4UW/vZsAD9I5pWhZeykZit9DRsdhJ7G9CKEiI6m5GxQIm
	 3RD2+43YdNTOBiDcfmKfhfvJlKuXf87eqw2CGWb4iWTn9Ffxa6rkhknjVAG8j4OdYk
	 S0bqBRGZrKCf4xduyISxnKxcqS7M9cmRWiDvCn815jsyjZ7qgHJuSNUReFCMpF+0N+
	 dio4lcdvD9fF6704tv8+FmDAlmfQ2iJfVAD1+ISGgNiyKIODoYQngfLA/r6iYwUieG
	 aCa/uFPNURIwEA1ZJUAP1v39xHmvtP/Mods72LcILHRgHQI7+mDf+VQc998QfayXqB
	 UHfnXL6IjJAww==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 312AB17E37EE;
	Fri, 13 Dec 2024 20:48:17 +0100 (CET)
Message-ID: <408e6fb2460a75a8fc9eca6bb753dfb21def1ac3.camel@collabora.com>
Subject: Re: [PATCH v1 3/5] media: chips-media: wave5: Improve performance
 of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 13 Dec 2024 14:48:15 -0500
In-Reply-To: <20241209053654.52-4-jackson.lee@chipsnmedia.com>
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
	 <20241209053654.52-4-jackson.lee@chipsnmedia.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 09 décembre 2024 à 14:36 +0900, Jackson.lee a écrit :
> The existing way for decoding frames was to wait until each frame was
> decoded after feeding a bitstream. As a result, performance was low
> and Wave5 could not achieve max pixel processing rate.
> 
> Update driver to use an asynchronous approach for decoding and feeding a
> bitstream in order to achieve full capabilities of the device.

That patch is just massive and difficult to review. It does important change to
the driver design, which require important threading review. I'm not sure I can
provide a good review without this change being better introduced and broken
down. Few things:

- Try and explain the threading changes in the commits, and perhaps 
  introduce the change in the cover letter
- Split the refactoring of the ring buffer handling in separate non-
  functional change patches
- Change the job_ready() logic and use the m2m thread instead of creating
  another one and wasting context switches

What needs a good theoretical review, is the handling of "abort()" flow. We had
a big struggle with that while helping with the up-streaming. That is more or
less why for time constraints reason we went for this sub-optimal method of
idling the HW between jobs. Don't read me wrong, I'm very happy so see work
being done on that.

In parallel, do you agree that 1/5 and 2/5 could be applied already ? If so, can
you send these two in their own serie, and please, add the missing Fixes: tag,
which are needed for backport purpose.

regards,
Nicolas

> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../platform/chips-media/wave5/wave5-helper.c |  20 +-
>  .../chips-media/wave5/wave5-vpu-dec.c         | 400 +++++++++++-------
>  .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
>  .../platform/chips-media/wave5/wave5-vpu.c    |  73 +++-
>  .../platform/chips-media/wave5/wave5-vpuapi.c |  24 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.h |  15 +-
>  6 files changed, 355 insertions(+), 185 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> index 2c9d8cbca6e4..83f30ad36e4f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> @@ -30,7 +30,6 @@ const char *state_to_str(enum vpu_instance_state state)
>  void wave5_cleanup_instance(struct vpu_instance *inst)
>  {
>  	int i;
> -

nit: I kind of liked that blank line, but its yours to decide what you like the
best.

>  	/*
>  	 * For Wave515 SRAM memory is allocated at
>  	 * wave5_vpu_dec_register_device() and freed at
> @@ -49,7 +48,9 @@ void wave5_cleanup_instance(struct vpu_instance *inst)
>  		v4l2_fh_del(&inst->v4l2_fh);
>  		v4l2_fh_exit(&inst->v4l2_fh);
>  	}
> -	list_del_init(&inst->list);
> +
> +	kfifo_free(&inst->irq_status);
> +	mutex_destroy(&inst->feed_lock);
>  	ida_free(&inst->dev->inst_ida, inst->id);
>  	kfree(inst->codec_info);
>  	kfree(inst);
> @@ -61,8 +62,22 @@ int wave5_vpu_release_device(struct file *filp,
>  {
>  	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
>  	int ret = 0;
> +	unsigned long flags;
> +
> +	if (inst->run_thread) {
> +		kthread_stop(inst->run_thread);
> +		up(&inst->run_sem);
> +		inst->run_thread = NULL;
> +	}
>  
>  	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> +	ret = mutex_lock_interruptible(&inst->dev->irq_lock);
> +	if (ret)
> +		return ret;
> +	spin_lock_irqsave(&inst->dev->irq_spinlock, flags);
> +	list_del_init(&inst->list);
> +	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
> +	mutex_unlock(&inst->dev->irq_lock);
>  	if (inst->state != VPU_INST_STATE_NONE) {
>  		u32 fail_res;
>  
> @@ -79,7 +94,6 @@ int wave5_vpu_release_device(struct file *filp,
>  	}
>  
>  	wave5_cleanup_instance(inst);
> -
>  	return ret;
>  }
>  
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index d3ff420c52ce..b0e1f94bdb30 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -6,6 +6,9 @@
>   */
>  
>  #include <linux/pm_runtime.h>
> +#include <linux/delay.h>
> +#include <linux/timer.h>
> +#include <linux/atomic.h>
>  #include "wave5-helper.h"
>  
>  #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
> @@ -101,6 +104,24 @@ static const struct vpu_format dec_fmt_list[FMT_TYPES][MAX_FMTS] = {
>  	}
>  };
>  
> +static int run_thread(void *data)
> +{
> +	struct vpu_instance *inst = (struct vpu_instance *)data;
> +	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> +
> +	while (!kthread_should_stop()) {
> +		if (down_interruptible(&inst->run_sem))
> +			continue;
> +
> +		if (kthread_should_stop())
> +			break;
> +
> +		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * Make sure that the state switch is allowed and add logging for debugging
>   * purposes
> @@ -230,7 +251,6 @@ static int start_decode(struct vpu_instance *inst, u32 *fail_res)
>  		switch_state(inst, VPU_INST_STATE_STOP);
>  
>  		dev_dbg(inst->dev->dev, "%s: pic run failed / finish job", __func__);
> -		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  	}
>  
>  	return ret;
> @@ -347,7 +367,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
>  	struct vb2_v4l2_buffer *dec_buf = NULL;
>  	struct vb2_v4l2_buffer *disp_buf = NULL;
>  	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
> -	struct queue_status_info q_status;
>  
>  	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
>  
> @@ -360,11 +379,22 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
>  
>  	dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &dec_info.rd_ptr,
>  		&dec_info.wr_ptr);
> -	wave5_handle_src_buffer(inst, dec_info.rd_ptr);
>  
>  	dev_dbg(inst->dev->dev, "%s: dec_info dec_idx %i disp_idx %i", __func__,
>  		dec_info.index_frame_decoded, dec_info.index_frame_display);
>  
> +	if (inst->std == W_AVC_DEC &&
> +	    dec_info.index_frame_decoded == DECODED_IDX_FLAG_SKIP &&
> +	    dec_info.index_frame_display == DISPLAY_IDX_FLAG_NO_FB) {
> +		struct vb2_v4l2_buffer *src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
> +
> +		if (src_buf)
> +			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +		return;
> +	}
> +
> +	wave5_handle_src_buffer(inst, dec_info.rd_ptr);
> +
>  	if (!vb2_is_streaming(dst_vq)) {
>  		dev_dbg(inst->dev->dev, "%s: capture is not streaming..", __func__);
>  		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> @@ -441,20 +471,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
>  		}
>  		spin_unlock_irqrestore(&inst->state_spinlock, flags);
>  	}
> -
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
> -		pm_runtime_put_autosuspend(inst->dev->dev);
> -		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> -	}
>  }
>  
>  static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> @@ -465,6 +481,142 @@ static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capab
>  	return 0;
>  }
>  
> +static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
> +			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
> +{
> +	size_t size;
> +	size_t offset = wr_ptr - ring_buffer->daddr;
> +	int ret;
> +
> +	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
> +		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
> +		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
> +					     buffer_size - size);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
> +					     buffer_size);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int fill_ringbuffer(struct vpu_instance *inst)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> +	struct vpu_src_buffer *vpu_buf;
> +	int ret = 0;
> +
> +	if (m2m_ctx->last_src_buf)  {
> +		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
> +
> +		if (vpu_buf->consumed) {
> +			dev_dbg(inst->dev->dev, "last src buffer already written\n");
> +			return 0;
> +		}
> +	}
> +
> +	list_for_each_entry(vpu_buf, &inst->avail_src_bufs, list) {
> +		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
> +		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
> +		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
> +		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
> +		dma_addr_t rd_ptr = 0;
> +		dma_addr_t wr_ptr = 0;
> +		size_t remain_size = 0;
> +
> +		if (vpu_buf->consumed) {
> +			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
> +				vbuf->vb2_buf.index);
> +			continue;
> +		}
> +
> +		if (!src_buf) {
> +			dev_dbg(inst->dev->dev,
> +				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
> +				__func__, vbuf->vb2_buf.index);
> +			break;
> +		}
> +
> +		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
> +		if (ret) {
> +			/* Unable to acquire the mutex */
> +			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
> +
> +		if (remain_size < src_size) {
> +			dev_dbg(inst->dev->dev,
> +				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
> +				__func__, remain_size, src_size, vbuf->vb2_buf.index);
> +			break;
> +		}
> +
> +		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
> +		if (ret) {
> +			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
> +				vbuf->vb2_buf.index, ret);
> +			return ret;
> +		}
> +
> +		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
> +		if (ret) {
> +			dev_dbg(inst->dev->dev,
> +				"update_bitstream_buffer fail: %d for src buf (%u)\n",
> +				ret, vbuf->vb2_buf.index);
> +			break;
> +		}
> +
> +		vpu_buf->consumed = true;
> +
> +		/* Don't write buffers passed the last one while draining. */
> +		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
> +			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
> +			break;
> +		}
> +
> +		inst->queuing_num++;
> +		list_del_init(&vpu_buf->list);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static void wave5_vpu_dec_feed_remaining(struct vpu_instance *inst)
> +{
> +	int ret = 0;
> +	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> +	u32 fail_res = 0;
> +
> +	mutex_lock(&inst->feed_lock);
> +	ret = fill_ringbuffer(inst);
> +	mutex_unlock(&inst->feed_lock);
> +	if (ret) {
> +		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
> +		return;
> +	}
> +
> +	ret = start_decode(inst, &fail_res);
> +	if (ret) {
> +		dev_err(inst->dev->dev,
> +			"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
> +			m2m_ctx, ret, fail_res);
> +	}
> +
> +	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +}
> +
>  static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_frmsizeenum *fsize)
>  {
>  	const struct vpu_format *vpu_fmt;
> @@ -794,11 +946,21 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
>  	}
>  
>  	if (inst->state != VPU_INST_STATE_NONE) {
> +		struct vb2_v4l2_buffer *vbuf;
> +		struct vpu_src_buffer *vpu_buf;
> +
>  		/*
>  		 * Temporarily release the state_spinlock so that subsequent
>  		 * calls do not block on a mutex while inside this spinlock.
>  		 */
>  		spin_unlock_irqrestore(&inst->state_spinlock, flags);
> +		vbuf = v4l2_m2m_last_src_buf(m2m_ctx);
> +		if (vbuf) {
> +			vpu_buf = wave5_to_vpu_src_buf(vbuf);
> +			if (!vpu_buf->consumed)
> +				wave5_vpu_dec_feed_remaining(inst);
> +		}
> +
>  		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
>  		if (ret)
>  			return ret;
> @@ -1116,115 +1278,6 @@ static int wave5_prepare_fb(struct vpu_instance *inst)
>  	return 0;
>  }
>  
> -static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
> -			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
> -{
> -	size_t size;
> -	size_t offset = wr_ptr - ring_buffer->daddr;
> -	int ret;
> -
> -	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
> -		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
> -		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
> -		if (ret < 0)
> -			return ret;
> -
> -		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
> -					     buffer_size - size);
> -		if (ret < 0)
> -			return ret;
> -	} else {
> -		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
> -					     buffer_size);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int fill_ringbuffer(struct vpu_instance *inst)
> -{
> -	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> -	struct v4l2_m2m_buffer *buf, *n;
> -	int ret;
> -
> -	if (m2m_ctx->last_src_buf)  {
> -		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
> -
> -		if (vpu_buf->consumed) {
> -			dev_dbg(inst->dev->dev, "last src buffer already written\n");
> -			return 0;
> -		}
> -	}
> -
> -	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
> -		struct vb2_v4l2_buffer *vbuf = &buf->vb;
> -		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
> -		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
> -		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
> -		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
> -		dma_addr_t rd_ptr = 0;
> -		dma_addr_t wr_ptr = 0;
> -		size_t remain_size = 0;
> -
> -		if (vpu_buf->consumed) {
> -			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
> -				vbuf->vb2_buf.index);
> -			continue;
> -		}
> -
> -		if (!src_buf) {
> -			dev_dbg(inst->dev->dev,
> -				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
> -				__func__, vbuf->vb2_buf.index);
> -			break;
> -		}
> -
> -		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
> -		if (ret) {
> -			/* Unable to acquire the mutex */
> -			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
> -				ret);
> -			return ret;
> -		}
> -
> -		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
> -
> -		if (remain_size < src_size) {
> -			dev_dbg(inst->dev->dev,
> -				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
> -				__func__, remain_size, src_size, vbuf->vb2_buf.index);
> -			break;
> -		}
> -
> -		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
> -		if (ret) {
> -			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
> -				vbuf->vb2_buf.index, ret);
> -			return ret;
> -		}
> -
> -		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
> -		if (ret) {
> -			dev_dbg(inst->dev->dev,
> -				"update_bitstream_buffer fail: %d for src buf (%u)\n",
> -				ret, vbuf->vb2_buf.index);
> -			break;
> -		}
> -
> -		vpu_buf->consumed = true;
> -
> -		/* Don't write buffers passed the last one while draining. */
> -		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
> -			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
> -			break;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
>  {
>  	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
> @@ -1236,6 +1289,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
>  	vbuf->sequence = inst->queued_src_buf_num++;
>  
>  	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
> +
> +	INIT_LIST_HEAD(&vpu_buf->list);
> +	mutex_lock(&inst->feed_lock);
> +	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
> +	mutex_unlock(&inst->feed_lock);
>  }
>  
>  static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
> @@ -1287,10 +1345,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
>  		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
>  		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
>  
> -	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		if (inst->empty_queue)
> +			inst->empty_queue = false;
>  		wave5_vpu_dec_buf_queue_src(vb);
> -	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>  		wave5_vpu_dec_buf_queue_dst(vb);
> +	}
>  }
>  
>  static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
> @@ -1369,6 +1430,13 @@ static int streamoff_output(struct vb2_queue *q)
>  	struct vb2_v4l2_buffer *buf;
>  	int ret;
>  	dma_addr_t new_rd_ptr;
> +	struct vpu_src_buffer *vpu_buf, *tmp;
> +
> +	inst->retry = false;
> +	inst->queuing_num = 0;
> +
> +	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list)
> +		list_del_init(&vpu_buf->list);
>  
>  	while ((buf = v4l2_m2m_src_buf_remove(m2m_ctx))) {
>  		dev_dbg(inst->dev->dev, "%s: (Multiplanar) buf type %4u | index %4u\n",
> @@ -1445,6 +1513,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>  
>  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
>  	pm_runtime_resume_and_get(inst->dev->dev);
> +	inst->empty_queue = false;
>  
>  	while (check_cmd) {
>  		struct queue_status_info q_status;
> @@ -1452,16 +1521,13 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>  
>  		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
>  
> -		if (q_status.report_queue_count == 0)
> -			break;
> -
> -		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
> +		if ((inst->state == VPU_INST_STATE_STOP || q_status.instance_queue_count == 0) &&
> +		    q_status.report_queue_count == 0)
>  			break;
>  
>  		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
>  			dev_dbg(inst->dev->dev, "Getting decoding results from fw, fail\n");
>  	}
> -
>  	v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
>  
>  	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -1548,13 +1614,24 @@ static void wave5_vpu_dec_device_run(void *priv)
>  	struct queue_status_info q_status;
>  	u32 fail_res = 0;
>  	int ret = 0;
> +	unsigned long flags;
>  
>  	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
>  	pm_runtime_resume_and_get(inst->dev->dev);
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
> +			   inst->queuing_num == 0 &&
> +			   inst->state == VPU_INST_STATE_PIC_RUN) {
> +			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
> +			inst->empty_queue = true;
> +			goto finish_job_and_return;
> +		}
>  	}
>  
>  	switch (inst->state) {
> @@ -1590,7 +1667,9 @@ static void wave5_vpu_dec_device_run(void *priv)
>  		 * we had a chance to switch, which leads to an invalid state
>  		 * change.
>  		 */
> +		spin_lock_irqsave(&inst->state_spinlock, flags);
>  		switch_state(inst, VPU_INST_STATE_PIC_RUN);
> +		spin_unlock_irqrestore(&inst->state_spinlock, flags);
>  
>  		/*
>  		 * During DRC, the picture decoding remains pending, so just leave the job
> @@ -1605,12 +1684,14 @@ static void wave5_vpu_dec_device_run(void *priv)
>  		ret = wave5_prepare_fb(inst);
>  		if (ret) {
>  			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
> +			spin_lock_irqsave(&inst->state_spinlock, flags);
>  			switch_state(inst, VPU_INST_STATE_STOP);
> +			spin_unlock_irqrestore(&inst->state_spinlock, flags);
>  			break;
>  		}
>  
>  		if (q_status.instance_queue_count) {
> -			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> +			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  			return;
>  		}
>  
> @@ -1621,21 +1702,27 @@ static void wave5_vpu_dec_device_run(void *priv)
>  			dev_err(inst->dev->dev,
>  				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
>  				m2m_ctx, ret, fail_res);
> -			break;
> +			goto finish_job_and_return;
>  		}
>  		/* Return so that we leave this job active */
> -		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> -		return;
> -	default:
> -		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
> +		if (fail_res == WAVE5_SYSERR_QUEUEING_FAIL) {
> +			inst->retry = true;
> +		} else {
> +			inst->retry = false;
> +			if (!inst->eos)
> +				inst->queuing_num--;
> +		}
>  		break;
> +	default:
> +		if (!v4l2_m2m_has_stopped(m2m_ctx))
> +			WARN(1, "Execution of a job in state %s illegal.\n",
> +			     state_to_str(inst->state));
> +		return;
>  	}
>  
>  finish_job_and_return:
> +	up(&inst->run_sem);
>  	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
> -	pm_runtime_mark_last_busy(inst->dev->dev);
> -	pm_runtime_put_autosuspend(inst->dev->dev);
> -	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  }
>  
>  static void wave5_vpu_dec_job_abort(void *priv)
> @@ -1647,10 +1734,7 @@ static void wave5_vpu_dec_job_abort(void *priv)
>  	if (ret)
>  		return;
>  
> -	ret = wave5_vpu_dec_set_eos_on_firmware(inst);
> -	if (ret)
> -		dev_warn(inst->dev->dev,
> -			 "Setting EOS for the bitstream, fail: %d\n", ret);
> +	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
>  }
>  
>  static int wave5_vpu_dec_job_ready(void *priv)
> @@ -1686,7 +1770,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
>  				"No capture buffer ready to decode!\n");
>  			break;
>  		} else if (!wave5_is_draining_or_eos(inst) &&
> -			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
> +			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
> +			    inst->empty_queue)) {
>  			dev_dbg(inst->dev->dev,
>  				"No bitstream data to decode!\n");
>  			break;
> @@ -1726,6 +1811,8 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	inst->ops = &wave5_vpu_dec_inst_ops;
>  
>  	spin_lock_init(&inst->state_spinlock);
> +	mutex_init(&inst->feed_lock);
> +	INIT_LIST_HEAD(&inst->avail_src_bufs);
>  
>  	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
>  	if (!inst->codec_info)
> @@ -1782,6 +1869,11 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>  
>  	init_completion(&inst->irq_done);
> +	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed to allocate fifo\n");
> +		goto cleanup_inst;
> +	}
>  
>  	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
>  	if (inst->id < 0) {
> @@ -1797,13 +1889,13 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	if (inst->dev->product_code != WAVE515_CODE)
>  		wave5_vdi_allocate_sram(inst->dev);
>  
> +	sema_init(&inst->run_sem, 1);
> +	inst->run_thread = kthread_run(run_thread, inst, "run thread");
> +
>  	ret = mutex_lock_interruptible(&dev->dev_lock);
>  	if (ret)
>  		goto cleanup_inst;
>  
> -	if (list_empty(&dev->instances))
> -		pm_runtime_use_autosuspend(inst->dev->dev);
> -
>  	list_add_tail(&inst->list, &dev->instances);
>  
>  	mutex_unlock(&dev->dev_lock);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 1e5fc5f8b856..7f1aa392805f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1760,6 +1760,11 @@ static int wave5_vpu_open_enc(struct file *filp)
>  	inst->frame_rate = 30;
>  
>  	init_completion(&inst->irq_done);
> +	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed to allocate fifo\n");
> +		goto cleanup_inst;
> +	}
>  
>  	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
>  	if (inst->id < 0) {
> @@ -1774,9 +1779,6 @@ static int wave5_vpu_open_enc(struct file *filp)
>  	if (ret)
>  		goto cleanup_inst;
>  
> -	if (list_empty(&dev->instances))
> -		pm_runtime_use_autosuspend(inst->dev->dev);
> -
>  	list_add_tail(&inst->list, &dev->instances);
>  
>  	mutex_unlock(&dev->dev_lock);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> index 63a607d10433..e1e4be482d36 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -51,17 +51,24 @@ static void wave5_vpu_handle_irq(void *dev_id)
>  	u32 seq_done;
>  	u32 cmd_done;
>  	u32 irq_reason;
> -	struct vpu_instance *inst;
> +	u32 irq_subreason;
> +	struct vpu_instance *inst, *tmp;
>  	struct vpu_device *dev = dev_id;
> +	int val;
> +	unsigned long flags;
>  
>  	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
>  	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
>  	cmd_done = wave5_vdi_read_register(dev, W5_RET_QUEUE_CMD_DONE_INST);
> +
> +	if (dev->irq < 0 && cmd_done > 0)
> +		wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST, 0);
> +
>  	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
>  	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
>  
> -	list_for_each_entry(inst, &dev->instances, list) {
> -
> +	spin_lock_irqsave(&dev->irq_spinlock, flags);
> +	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
>  		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
>  		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
>  			if (dev->product_code == WAVE515_CODE &&
> @@ -82,14 +89,22 @@ static void wave5_vpu_handle_irq(void *dev_id)
>  		    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
>  			if (cmd_done & BIT(inst->id)) {
>  				cmd_done &= ~BIT(inst->id);
> -				wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
> -							 cmd_done);
> -				inst->ops->finish_process(inst);
> +				if (dev->irq >= 0) {
> +					irq_subreason =
> +						wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
> +					if (!(irq_subreason & BIT(INT_WAVE5_DEC_PIC)))
> +						wave5_vdi_write_register(dev,
> +									 W5_RET_QUEUE_CMD_DONE_INST,
> +									 cmd_done);
> +				}
> +				val = BIT(INT_WAVE5_DEC_PIC);
> +				kfifo_in(&inst->irq_status, &val, sizeof(int));
>  			}
>  		}
> -
> -		wave5_vpu_clear_interrupt(inst, irq_reason);
>  	}
> +	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
> +
> +	up(&dev->irq_sem);
>  }
>  
>  static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
> @@ -121,6 +136,35 @@ static enum hrtimer_restart wave5_vpu_timer_callback(struct hrtimer *timer)
>  	return HRTIMER_RESTART;
>  }
>  
> +static int irq_thread(void *data)
> +{
> +	struct vpu_device *dev = (struct vpu_device *)data;
> +	struct vpu_instance *inst, *tmp;
> +	int irq_status, ret;
> +
> +	while (!kthread_should_stop()) {
> +		if (down_interruptible(&dev->irq_sem))
> +			continue;
> +
> +		if (kthread_should_stop())
> +			break;
> +
> +		mutex_lock(&dev->irq_lock);
> +		list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
> +			while (kfifo_len(&inst->irq_status)) {
> +				ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
> +				if (!ret)
> +					break;
> +
> +				inst->ops->finish_process(inst);
> +			}
> +		}
> +		mutex_unlock(&dev->irq_lock);
> +	}
> +
> +	return 0;
> +}
> +
>  static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
>  				   u32 *revision)
>  {
> @@ -224,6 +268,8 @@ static int wave5_vpu_probe(struct platform_device *pdev)
>  
>  	mutex_init(&dev->dev_lock);
>  	mutex_init(&dev->hw_lock);
> +	mutex_init(&dev->irq_lock);
> +	spin_lock_init(&dev->irq_spinlock);
>  	dev_set_drvdata(&pdev->dev, dev);
>  	dev->dev = &pdev->dev;
>  
> @@ -266,6 +312,9 @@ static int wave5_vpu_probe(struct platform_device *pdev)
>  	}
>  	dev->product = wave5_vpu_get_product_id(dev);
>  
> +	sema_init(&dev->irq_sem, 1);
> +	INIT_LIST_HEAD(&dev->instances);
> +	dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
>  	dev->irq = platform_get_irq(pdev, 0);
>  	if (dev->irq < 0) {
>  		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
> @@ -288,7 +337,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	INIT_LIST_HEAD(&dev->instances);
>  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
> @@ -351,6 +399,12 @@ static void wave5_vpu_remove(struct platform_device *pdev)
>  {
>  	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
>  
> +	if (dev->irq_thread) {
> +		kthread_stop(dev->irq_thread);
> +		up(&dev->irq_sem);
> +		dev->irq_thread = NULL;
> +	}
> +
>  	if (dev->irq < 0) {
>  		kthread_destroy_worker(dev->worker);
>  		hrtimer_cancel(&dev->hrtimer);
> @@ -361,6 +415,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
>  
>  	mutex_destroy(&dev->dev_lock);
>  	mutex_destroy(&dev->hw_lock);
> +	mutex_destroy(&dev->irq_lock);
>  	reset_control_assert(dev->resets);
>  	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
>  	wave5_vpu_enc_unregister_device(dev);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index e16b990041c2..9a28d0f770bc 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -197,8 +197,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  	int retry = 0;
>  	struct vpu_device *vpu_dev = inst->dev;
>  	int i;
> -	int inst_count = 0;
> -	struct vpu_instance *inst_elm;
>  
>  	*fail_res = 0;
>  	if (!inst->codec_info)
> @@ -223,6 +221,16 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
>  			ret = -ETIMEDOUT;
>  			goto unlock_and_return;
> +		} else if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING) {
> +			struct dec_output_info dec_info;
> +
> +			mutex_unlock(&vpu_dev->hw_lock);
> +			wave5_vpu_dec_get_output_info(inst, &dec_info);
> +			ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
> +			if (ret) {
> +				pm_runtime_put_sync(inst->dev->dev);
> +				return ret;
> +			}
>  		}
>  	} while (ret != 0);
>  
> @@ -240,11 +248,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
>  
> -	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> -		inst_count++;
> -	if (inst_count == 1)
> -		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> -
>  unlock_and_return:
>  	mutex_unlock(&vpu_dev->hw_lock);
>  	pm_runtime_put_sync(inst->dev->dev);
> @@ -710,8 +713,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
>  	int ret;
>  	int retry = 0;
>  	struct vpu_device *vpu_dev = inst->dev;
> -	int inst_count = 0;
> -	struct vpu_instance *inst_elm;
>  
>  	*fail_res = 0;
>  	if (!inst->codec_info)
> @@ -755,11 +756,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
>  
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
>  
> -	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> -		inst_count++;
> -	if (inst_count == 1)
> -		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> -
>  	mutex_unlock(&vpu_dev->hw_lock);
>  	pm_runtime_put_sync(inst->dev->dev);
>  
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index 45615c15beca..d26590141562 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -8,6 +8,7 @@
>  #ifndef VPUAPI_H_INCLUDED
>  #define VPUAPI_H_INCLUDED
>  
> +#include <linux/kfifo.h>
>  #include <linux/idr.h>
>  #include <linux/genalloc.h>
>  #include <media/v4l2-device.h>
> @@ -163,7 +164,7 @@ enum set_param_option {
>  
>  #define BUFFER_MARGIN				4096
>  
> -#define MAX_FIRMWARE_CALL_RETRY			10
> +#define MAX_FIRMWARE_CALL_RETRY			30
>  
>  #define VDI_LITTLE_ENDIAN	0x0
>  
> @@ -747,6 +748,7 @@ struct vpu_device {
>  	struct video_device *video_dev_enc;
>  	struct mutex dev_lock; /* lock for the src, dst v4l2 queues */
>  	struct mutex hw_lock; /* lock hw configurations */
> +	struct mutex irq_lock;
>  	int irq;
>  	enum product_id product;
>  	struct vpu_attr attr;
> @@ -764,7 +766,10 @@ struct vpu_device {
>  	struct kthread_worker *worker;
>  	int vpu_poll_interval;
>  	int num_clks;
> +	struct task_struct *irq_thread;
> +	struct semaphore irq_sem;
>  	struct reset_control *resets;
> +	spinlock_t irq_spinlock; /* protect instances list */
>  };
>  
>  struct vpu_instance;
> @@ -787,7 +792,7 @@ struct vpu_instance {
>  	enum v4l2_xfer_func xfer_func;
>  	enum v4l2_ycbcr_encoding ycbcr_enc;
>  	enum v4l2_quantization quantization;
> -
> +	struct kfifo irq_status;
>  	enum vpu_instance_state state;
>  	enum vpu_instance_type type;
>  	const struct vpu_instance_ops *ops;
> @@ -812,11 +817,17 @@ struct vpu_instance {
>  	bool cbcr_interleave;
>  	bool nv21;
>  	bool eos;
> +	bool retry;
> +	bool empty_queue;
> +	int queuing_num;
> +	struct mutex feed_lock; /* lock for feeding bitstream buffers */
>  	struct vpu_buf bitstream_vbuf;
>  	dma_addr_t last_rd_ptr;
>  	size_t remaining_consumed_bytes;
>  	bool needs_reallocation;
>  
> +	struct semaphore run_sem;
> +	struct task_struct *run_thread;
>  	unsigned int min_src_buf_count;
>  	unsigned int rot_angle;
>  	unsigned int mirror_direction;


