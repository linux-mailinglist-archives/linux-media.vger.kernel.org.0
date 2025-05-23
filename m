Return-Path: <linux-media+bounces-33288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F503AC28FC
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 19:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 423A716C606
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8772989BF;
	Fri, 23 May 2025 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C5MLamiO"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317F329825E;
	Fri, 23 May 2025 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022206; cv=none; b=nRyiW5/xbZ+NZZqgeyqL9aiSCwNb9/MyZ1b/EB0YfoU3ZLsrn/SBAf9EB71ODFLvCxdM1J7iVX6vR8i/wtSmp/KiTt6flDORdw5bi2GcJNIg47BhKeM/Mw5WqAPBCG6v0rtjHQKoE57yUxzwIxUpt2Amaka/UiKxNcrX/ppVMv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022206; c=relaxed/simple;
	bh=ohZrA9l2leGvS6JiVMuN53KdcIKYQ3g+eMb0WsAyUbA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ARbRXW9ELsg6KGkLh5ODtILZxa7IqV2m6SauJ0t45RRymS6ogeZfEuRq1cUhHRVdMmEzjS1vSYfRW/0Pe/l5NA/rrATRthtmcRJR/Vc2jlOKS+kB14k4Ui48loWGH5LWYq3g5IepOKOU4tDSUIrRyapbKYvvX70Qk3imp0y6VRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C5MLamiO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748022202;
	bh=ohZrA9l2leGvS6JiVMuN53KdcIKYQ3g+eMb0WsAyUbA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=C5MLamiOFfx4VsE+d+ojlRdP9Fvs8J/VoFarfl60PICFFjYTKSk2YNZLMY7v408ep
	 0kmhbBm9rSpT2j+knYGPixmXgUxpAulmELQxCu5RViyIeCAJOtGs/pmoK48npTD2r/
	 EJN8QAz3/JWRbej4nGxqyw3b5fT3HOXP/P1jWHPjOui9g6pOqQ1JNJYUY/sT/oJ0R0
	 uabSNhKwr2Q/Y48TaZAqIgp4/RzX0ssADkqyLP2PjIMqVhgesF84LJCRHllWNVOe03
	 5XAX8KG63yThw9tHbwqt8xd+R1i+oH0wkKmyuA2X9mpXObFWxEDrpd5NiELAIV3Yg6
	 edTPdDh3+4zSw==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB31017E1135;
	Fri, 23 May 2025 19:43:20 +0200 (CEST)
Message-ID: <f94e84af0a6ea09fd111f5a1ec9b0fadc9f6d4de.camel@collabora.com>
Subject: Re: [PATCH v2 6/7] media: chips-media: wave5: Reduce high CPU load
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 23 May 2025 13:43:19 -0400
In-Reply-To: <20250522072606.51-7-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
	 <20250522072606.51-7-jackson.lee@chipsnmedia.com>
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
> Since applying changes for performance improvement of decoder,
> there was a problem related to high CPU load.
> CPU load was more than 4 times when comparing CPU load.
> The root cause was the device_run was called many times even if
> there was no bitstream which should be queued.

You should squash this.

Nicolas

> 
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../media/platform/chips-media/wave5/wave5-vpu-dec.c | 12 +++++++++---
>  .../media/platform/chips-media/wave5/wave5-vpuapi.h  |  1 +
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-
> media/wave5/wave5-vpu-dec.c
> index 719c5527eb7f..421a9e1a6f15 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1280,10 +1280,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
>  		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
>  		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
>  
> -	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		if (inst->empty_queue)
> +			inst->empty_queue = false;
>  		wave5_vpu_dec_buf_queue_src(vb);
> -	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>  		wave5_vpu_dec_buf_queue_dst(vb);
> +	}
>  }
>  
>  static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
> @@ -1474,6 +1477,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>  
>  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
>  	pm_runtime_resume_and_get(inst->dev->dev);
> +	inst->empty_queue = false;
>  
>  	while (check_cmd) {
>  		struct queue_status_info q_status;
> @@ -1592,6 +1596,7 @@ static void wave5_vpu_dec_device_run(void *priv)
>  				inst->queuing_num == 0 &&
>  				inst->state == VPU_INST_STATE_PIC_RUN) {
>  			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
> +			inst->empty_queue = true;
>  			goto finish_job_and_return;
>  		}
>  	}
> @@ -1737,7 +1742,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
>  				"No capture buffer ready to decode!\n");
>  			break;
>  		} else if (!wave5_is_draining_or_eos(inst) &&
> -			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
> +			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
> +			    inst->empty_queue)) {
>  			dev_dbg(inst->dev->dev,
>  				"No bitstream data to decode!\n");
>  			break;
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-
> vpuapi.h
> index fd0aef0bac4e..f2596af08cdf 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -821,6 +821,7 @@ struct vpu_instance {
>  	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSERR_QUEUEING_FAIL*/
>  	int queuing_num; /* check if there is input buffer or not */
>  	struct mutex feed_lock; /* lock for feeding bitstream buffers */
> +	bool empty_queue;
>  	struct vpu_buf bitstream_vbuf;
>  	dma_addr_t last_rd_ptr;
>  	size_t remaining_consumed_bytes;

