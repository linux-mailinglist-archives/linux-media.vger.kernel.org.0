Return-Path: <linux-media+bounces-29252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC823A794C7
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A6BF3A8D66
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 18:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00561A38E1;
	Wed,  2 Apr 2025 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c8u0WCi0"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F21E89C;
	Wed,  2 Apr 2025 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743616988; cv=none; b=JwoopT989LpGP8mqgHwhmhE8hWGSvWv0501gqrAMaj7WPEaJJwnsUuQNFL3yYQnWKcw3eUZ3+HSh2EW/MqFtQTebCOZTVbUYMLnDSI3rwkYarmy76nRRmNfj2pvEsMZfmEf507F/kfeYE7LOrzvhnNbyBCwbwSYNkFj44tTopdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743616988; c=relaxed/simple;
	bh=LKRSe2x3upuTCVNxoARHZzw4bnaBsRRT8upBa9mYbig=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gf4ySgSWn1yLRjMVM951hdpm8GZnelQLmE4hYnTfmU2hDHtiRgCaMnDLzOgHWNCf4he3GZAZWdWIEdlWMwHXA2TE+/WcrJMdlHYt47TPtTXu7AOdyP6oifa+5BjXHn39jIKleCTdPX0GsNMRLuHd6vr6Z0yx7CXRKA+cBlYwIeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c8u0WCi0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743616983;
	bh=LKRSe2x3upuTCVNxoARHZzw4bnaBsRRT8upBa9mYbig=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=c8u0WCi0ezEVWlApy/1PnxWeXROLFfRIltwQVmSY+S1gRAq4JdCM90Otq8YijtQuo
	 G53I7fXxrJHNaNmcuSMUj1v7uzTZSfOWqvrTOVFPRaI1ae8ZDMxrtUiOHE3b1Ycilm
	 sGPNQpdzxqvLA27O2AUaHOo+jhwmn870tj7dohmHpcMjC2Qldr81693nrXV7m7a0rU
	 0omR155GV2oXeJddjnhXl4PLUHzMHqYvKMwvacsRML2VsKMjz9Dl71aSyKIGLJcBEO
	 QDv0K9A/ntsj4ZXcT4c05wbZyddm2KA/uZTtsZaggOn4hlkshuELhyZ8BniXcDnp+t
	 VqQvR+34wRQjg==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DFC617E0FC1;
	Wed,  2 Apr 2025 20:03:01 +0200 (CEST)
Message-ID: <25a338e0be5395d2cf2170cc432b5a72efb5d089.camel@collabora.com>
Subject: Re: [RESEND PATCH v0 1/3] media: chips-media: wave5: Improve
 performance of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Wed, 02 Apr 2025 14:02:59 -0400
In-Reply-To: <20250319035034.111-2-jackson.lee@chipsnmedia.com>
References: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
	 <20250319035034.111-2-jackson.lee@chipsnmedia.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mercredi 19 mars 2025 à 12:50 +0900, Jackson.lee a écrit :
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> The existing way for decoding frames was to wait until each frame was

Suggestion:
  The current decoding method was to...

> decoded after feeding a bitstream. As a result, performance was low
> and Wave5 could not achieve max pixel processing rate.
> 
> Update driver to use an asynchronous approach for decoding and feeding a
  Update the driver ..

> bitstream in order to achieve full capabilities of the device.

This second part lacks the technical design choices needed for your
reviewer ;-P I did read the patch once, and am under the impression
that your approach is to not finish the job anymore. 

> 
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../chips-media/wave5/wave5-vpu-dec.c         | 344 ++++++++++--------
>  .../chips-media/wave5/wave5-vpu-enc.c         |   3 -
>  .../platform/chips-media/wave5/wave5-vpuapi.c |  25 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.h |   5 +-
>  4 files changed, 211 insertions(+), 166 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index fd71f0c43ac3..cc47da509703 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -230,12 +230,147 @@ static int start_decode(struct vpu_instance *inst, u32 *fail_res)
>  		switch_state(inst, VPU_INST_STATE_STOP);
>  
>  		dev_dbg(inst->dev->dev, "%s: pic run failed / finish job", __func__);
> -		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  	}
>  
>  	return ret;
>  }
>  
> +static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
> +			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
> +{

It seems that from now on this needs to be called with the feed_lock,
so add:

	 lockdep_assert_held(&inst->feed_lock);

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
> +					     buffer_size - size);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
> +					     buffer_size);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

I have a pretty strong preference in seeing code being moved around in
seperate patch documented as "non functional changes". This way I know
I don't have to review again that code.

> +
> +static int fill_ringbuffer(struct vpu_instance *inst)
> +{

Same, I don't want to have to do back and fourth to check if you
changed anything. Also, after the refactoring, the lockdeup assert can
be added in the new patch, which makes the introduction of the new lock
very obvious.

> +	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> +	struct vpu_src_buffer *vpu_buf;
> +	int ret = 0;
> +
> +	if (m2m_ctx->last_src_buf)  {
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

Might want to fix that comment in a separate patch, perhaps even remove
that ?

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

I don't think the error handling is correct. What will happen with the
job ?

> +	}
> +
> +	ret = start_decode(inst, &fail_res);

I'm a little worried seeing this called outside of device_run()
context.

> +	if (ret) {
> +		dev_err(inst->dev->dev,
> +			"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
> +			m2m_ctx, ret, fail_res);
> +	}
> +
> +	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);



> +}
> +
>  static void flag_last_buffer_done(struct vpu_instance *inst)
>  {
>  	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> @@ -347,7 +482,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
>  	struct vb2_v4l2_buffer *dec_buf = NULL;
>  	struct vb2_v4l2_buffer *disp_buf = NULL;
>  	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
> -	struct queue_status_info q_status;
>  
>  	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
>  
> @@ -441,20 +575,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
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

This removal is why I believe some seek stress testing are needed. I'll
try and find some tests file I crafted last year.

>  }
>  
>  static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> @@ -794,11 +914,21 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
>  	}
>  
>  	if (inst->state != VPU_INST_STATE_NONE) {
> +		struct vb2_v4l2_buffer *vbuf;
> +		struct vpu_src_buffer *vpu_buf;
> +
>  		/*
>  		 * Temporarily release the state_spinlock so that subsequent
>  		 * calls do not block on a mutex while inside this spinlock.
>  		 */
>  		spin_unlock_irqrestore(&inst->state_spinlock, flags);
> +		vbuf = v4l2_m2m_last_src_buf(m2m_ctx);
> +		if (vbuf) {
> +			vpu_buf = wave5_to_vpu_src_buf(vbuf);
> +			if (!vpu_buf->consumed)
> +				wave5_vpu_dec_feed_remaining(inst);
> +		}
> +

Do you really need to add all these checks ? Shouldn't you just
"feed_remaining()" and move on ? I also don't think its a good idea to
call v4l2_m2m_job_finish() in code that can run concurrently with the
device_run() function. This should only happen if you are certain the
VPU instance is stopped already.


>  		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
>  		if (ret)
>  			return ret;
> @@ -1116,115 +1246,6 @@ static int wave5_prepare_fb(struct vpu_instance *inst)
>  	return 0;
>  }
>  
> -static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
> -			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
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
> -					     buffer_size - size);
> -		if (ret < 0)
> -			return ret;
> -	} else {
> -		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
> -					     buffer_size);
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
> -	if (m2m_ctx->last_src_buf)  {
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
>  static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
>  {
>  	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
> @@ -1236,6 +1257,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
>  	vbuf->sequence = inst->queued_src_buf_num++;
>  
>  	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
> +
> +	INIT_LIST_HEAD(&vpu_buf->list);
> +	mutex_lock(&inst->feed_lock);
> +	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
> +	mutex_unlock(&inst->feed_lock);

This lack documentation, you didn't even mention the introduction of a
new src buf list in the commit message.

>  }
>  
>  static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
> @@ -1362,7 +1388,6 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
>  				goto return_buffers;
>  			}
>  		}
> -
>  	}
>  	pm_runtime_mark_last_busy(inst->dev->dev);
>  	pm_runtime_put_autosuspend(inst->dev->dev);
> @@ -1385,6 +1410,13 @@ static int streamoff_output(struct vb2_queue *q)
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
> @@ -1481,10 +1513,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>  
>  		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
>  
> -		if (q_status.report_queue_count == 0)
> -			break;
> -
> -		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
> +		if ((inst->state == VPU_INST_STATE_STOP || q_status.instance_queue_count == 0) &&

State should be read with appropriate locking.

> +		    q_status.report_queue_count == 0)
>  			break;

This loop have nothing to wait on anymore. It just actively pool on the
HW. I noticed your third patch, but if this is what you address there,
squash it somehow, this would break bisects.

The goal of that code was to ensure that this code will never run
concurrently to finish_decode() once out of that while loop. I don't
think you break that, but that will cause possibly high CPU load.

>  
>  		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
> @@ -1577,13 +1607,23 @@ static void wave5_vpu_dec_device_run(void *priv)
>  	struct queue_status_info q_status;
>  	u32 fail_res = 0;
>  	int ret = 0;
> +	unsigned long flags;
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
> +			   inst->queuing_num == 0 &&
> +			   inst->state == VPU_INST_STATE_PIC_RUN) {
> +			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
> +			goto finish_job_and_return;
> +		}

There is quite some overlap between that local src buffer queue and all
the code that depends on v4l2_m2m_num_src_bufs_ready(). Are you sure
you aren't re-implementing something ? Also, this code belong to the
PIC_RUN case in the below switch.

>  	}
>  
>  	switch (inst->state) {
> @@ -1619,7 +1659,9 @@ static void wave5_vpu_dec_device_run(void *priv)
>  		 * we had a chance to switch, which leads to an invalid state
>  		 * change.
>  		 */
> +		spin_lock_irqsave(&inst->state_spinlock, flags);
>  		switch_state(inst, VPU_INST_STATE_PIC_RUN);
> +		spin_unlock_irqrestore(&inst->state_spinlock, flags);

Should be its own patch, and fixed everywhere. Add missing lockdep
assert (if there is a spinlock version of it).

>  
>  		/*
>  		 * During DRC, the picture decoding remains pending, so just leave the job
> @@ -1634,12 +1676,14 @@ static void wave5_vpu_dec_device_run(void *priv)
>  		ret = wave5_prepare_fb(inst);
>  		if (ret) {
>  			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
> +			spin_lock_irqsave(&inst->state_spinlock, flags);
>  			switch_state(inst, VPU_INST_STATE_STOP);
> +			spin_unlock_irqrestore(&inst->state_spinlock, flags);

Same, this is separate fix.

>  			break;
>  		}
>  
>  		if (q_status.instance_queue_count) {
> -			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> +			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  			return;
>  		}
>  
> @@ -1650,14 +1694,22 @@ static void wave5_vpu_dec_device_run(void *priv)
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
>  		}
> -		/* Return so that we leave this job active */
> -		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> -		return;
> -	default:
> -		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
>  		break;
> +	default:
> +		if (!v4l2_m2m_has_stopped(m2m_ctx))
> +			WARN(1, "Execution of a job in state %s illegal.\n",
> +			     state_to_str(inst->state));
> +		return;
>  	}
>  
>  finish_job_and_return:
> @@ -1676,10 +1728,7 @@ static void wave5_vpu_dec_job_abort(void *priv)
>  	if (ret)
>  		return;
>  
> -	ret = wave5_vpu_dec_set_eos_on_firmware(inst);
> -	if (ret)
> -		dev_warn(inst->dev->dev,
> -			 "Setting EOS for the bitstream, fail: %d\n", ret);
> +	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
>  }
>  
>  static int wave5_vpu_dec_job_ready(void *priv)
> @@ -1755,6 +1804,8 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	inst->ops = &wave5_vpu_dec_inst_ops;
>  
>  	spin_lock_init(&inst->state_spinlock);
> +	mutex_init(&inst->feed_lock);
> +	INIT_LIST_HEAD(&inst->avail_src_bufs);
>  
>  	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
>  	if (!inst->codec_info)
> @@ -1830,9 +1881,6 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	if (ret)
>  		goto cleanup_inst;
>  
> -	if (list_empty(&dev->instances))
> -		pm_runtime_use_autosuspend(inst->dev->dev);
> -
>  	list_add_tail(&inst->list, &dev->instances);
>  
>  	mutex_unlock(&dev->dev_lock);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 1e5fc5f8b856..cf20f774ed1b 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1774,9 +1774,6 @@ static int wave5_vpu_open_enc(struct file *filp)
>  	if (ret)
>  		goto cleanup_inst;
>  
> -	if (list_empty(&dev->instances))
> -		pm_runtime_use_autosuspend(inst->dev->dev);
> -
>  	list_add_tail(&inst->list, &dev->instances);
>  
>  	mutex_unlock(&dev->dev_lock);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index e5e879a13e8b..c1737fac6edd 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  	int retry = 0;
>  	struct vpu_device *vpu_dev = inst->dev;
>  	int i;
> -	int inst_count = 0;
> -	struct vpu_instance *inst_elm;
>  
>  	*fail_res = 0;
>  	if (!inst->codec_info)
> @@ -233,6 +231,16 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
>  			ret = -ETIMEDOUT;
>  			goto unlock_and_return;
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

Please try and simplify all the branches. Something like:

			if (ret == 0)
				break;
	
			if (*fail_res != WAVE5_SYSERR_VPU_STILL_RUNNING) {
					dev_warn(inst->dev->dev, "dec_finish_seq timed out\n");
					goto unlock_and_return;
			}

			if (retry++ >= MAX_FIRMWARE_CALL_RETRY) {
					ret = -ETIMEDOUT;
					goto unlock_and_return;
			}

			mutex_unlock(&vpu_dev->hw_lock);
			wave5_vpu_dec_get_output_info(inst, &dec_info);
			ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
			if (ret) {
				pm_runtime_put_sync(inst->dev->dev);
				return ret;
			}

My impression on that change is that it is independent and could be introduced separately.

>  		}
>  	} while (ret != 0);
>  
> @@ -249,11 +257,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  	}
>  
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
> -
> -	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> -		inst_count++;
> -	if (inst_count == 1)
> -		pm_runtime_dont_use_autosuspend(vpu_dev->dev);

This seems like some other fix, that should be in its own commit.

> +	mutex_destroy(&inst->feed_lock);
>  
>  unlock_and_return:
>  	mutex_unlock(&vpu_dev->hw_lock);
> @@ -720,8 +724,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
>  	int ret;
>  	int retry = 0;
>  	struct vpu_device *vpu_dev = inst->dev;
> -	int inst_count = 0;
> -	struct vpu_instance *inst_elm;
>  
>  	*fail_res = 0;
>  	if (!inst->codec_info)
> @@ -765,11 +767,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
>  
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
>  
> -	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> -		inst_count++;
> -	if (inst_count == 1)
> -		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> -

Same.

>  	mutex_unlock(&vpu_dev->hw_lock);
>  	pm_runtime_put_sync(inst->dev->dev);
>  
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index 45615c15beca..6ca1ddc67c64 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -163,7 +163,7 @@ enum set_param_option {
>  
>  #define BUFFER_MARGIN				4096
>  
> -#define MAX_FIRMWARE_CALL_RETRY			10
> +#define MAX_FIRMWARE_CALL_RETRY			30

I thought 10s was already very long, am I right this means it can get
stuck for 30s now ?

>  
>  #define VDI_LITTLE_ENDIAN	0x0
>  
> @@ -812,6 +812,9 @@ struct vpu_instance {
>  	bool cbcr_interleave;
>  	bool nv21;
>  	bool eos;
> +	bool retry;
> +	int queuing_num;

Some comment would be helpful. What does "retry" stand for, and how is
queing_num different from v4l2_m2m_num_src_bufs_ready() ?

> +	struct mutex feed_lock; /* lock for feeding bitstream buffers */
>  	struct vpu_buf bitstream_vbuf;
>  	dma_addr_t last_rd_ptr;
>  	size_t remaining_consumed_bytes;

-- 
Nicolas Dufresne
Principal Engineer at Collabora

