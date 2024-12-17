Return-Path: <linux-media+bounces-23592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B139F4D15
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 15:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1B3E188CD24
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30651F4E26;
	Tue, 17 Dec 2024 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="isrVkE50"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCBE1F4709;
	Tue, 17 Dec 2024 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734444307; cv=none; b=gis6qUC16u2wH3/rdItSuoNFCXC4xmX6gvRV9n2GZL+0H44+Y+9Afq5AacgY3eYa+GTnoZtAEhhKPomBDzdYJCNoXAuR9dPyRFsf7j+S+nuLObEl2uROehoh6LFfWl5ZHllE9Nxmmj9lPVauhJrMoCB1oJjsLPXVa5EY+C3z9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734444307; c=relaxed/simple;
	bh=0IQtuLtlqtIgOJFLrSRa3D7bWW297TOeEPKWROJG688=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nxcTaLgBjt2G8FQ5ZK+NnTU2twdteqUpulz+Nq7e0ceGv4T3nhca+/wxnFnidJim+n/cbU+irLyElOwDYfrD8CMJDt0CLmHsLSeZ60mw4d8+6zkvUT27ovEtGa4u4CFKs5KN4UsJts2I3vWSCx0iqk8jV2366UA+Vt2PtJenF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=isrVkE50; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734444303;
	bh=0IQtuLtlqtIgOJFLrSRa3D7bWW297TOeEPKWROJG688=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=isrVkE504BS7T5T9Otgu56L4GWJY0t836YOJ6J9tr4ewwbnmN663FVEH8occ66Ia6
	 qyo1x+bfsqQYKwJVqN3KbeYL8qsXQYGpxaQ0JpDaE3rQ0++gKP5lT0UgDVLaiTjHwD
	 Yv+0S9bM6GV0FtfW0UJbgy2H7B4QdkIn1JoEM0n7CaguZAUSk+EJj8M4nQW4rIiZsV
	 bO8GpuXlM5s+WdpfL+7/0MqNYAf597pWqow3CU1Ti2c/qsmzPNgN/4mD8CblVX3lOu
	 mT+mkx/lkzMsSfUfAxTnPTVFAM3Ljv+1KRG/g5qX5X7c3aLUeQhdCgwLqdveI2mnmV
	 hi5/GD/6CJVZw==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EF9717E376F;
	Tue, 17 Dec 2024 15:05:02 +0100 (CET)
Message-ID: <8d39ca4fd9dee36bd5ee1b8184018e8867195bd8.camel@collabora.com>
Subject: Re: [PATCH v2 3/4] media: chips-media: wave5: Fix hang after seeking
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Tue, 17 Dec 2024 09:05:00 -0500
In-Reply-To: <20241217045125.58-4-jackson.lee@chipsnmedia.com>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
	 <20241217045125.58-4-jackson.lee@chipsnmedia.com>
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

Le mardi 17 décembre 2024 à 13:51 +0900, Jackson.lee a écrit :
> While seeking, driver calls flush command. Before flush command is sent to
> VPU, driver should handle display buffer flags and should get all decoded
> information from VPU if VCORE is running.
> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

This one too please.

> ---
>  .../platform/chips-media/wave5/wave5-vpu-dec.c  | 17 ++++++++++++++++-
>  .../platform/chips-media/wave5/wave5-vpuapi.c   | 10 ++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index d3ff420c52ce..882d5539630f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1369,6 +1369,16 @@ static int streamoff_output(struct vb2_queue *q)
>  	struct vb2_v4l2_buffer *buf;
>  	int ret;
>  	dma_addr_t new_rd_ptr;
> +	struct dec_output_info dec_info;
> +	unsigned int i;
> +
> +	for (i = 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
> +		ret = wave5_vpu_dec_set_disp_flag(inst, i);
> +		if (ret)
> +			dev_dbg(inst->dev->dev,
> +				"%s: Setting display flag of buf index: %u, fail: %d\n",
> +				__func__, i, ret);
> +	}
>  
>  	while ((buf = v4l2_m2m_src_buf_remove(m2m_ctx))) {
>  		dev_dbg(inst->dev->dev, "%s: (Multiplanar) buf type %4u | index %4u\n",
> @@ -1376,6 +1386,11 @@ static int streamoff_output(struct vb2_queue *q)
>  		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
>  	}
>  
> +	while (wave5_vpu_dec_get_output_info(inst, &dec_info) == 0) {
> +		if (dec_info.index_frame_display >= 0)
> +			wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display);
> +	}
> +
>  	ret = wave5_vpu_flush_instance(inst);
>  	if (ret)
>  		return ret;
> @@ -1459,7 +1474,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>  			break;
>  
>  		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
> -			dev_dbg(inst->dev->dev, "Getting decoding results from fw, fail\n");
> +			dev_dbg(inst->dev->dev, "there is no output info\n");
>  	}
>  
>  	v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index e16b990041c2..e5e879a13e8b 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -75,6 +75,16 @@ int wave5_vpu_flush_instance(struct vpu_instance *inst)
>  				 inst->type == VPU_INST_TYPE_DEC ? "DECODER" : "ENCODER", inst->id);
>  			mutex_unlock(&inst->dev->hw_lock);
>  			return -ETIMEDOUT;
> +		} else if (ret == -EBUSY) {
> +			struct dec_output_info dec_info;
> +
> +			mutex_unlock(&inst->dev->hw_lock);
> +			wave5_vpu_dec_get_output_info(inst, &dec_info);
> +			ret = mutex_lock_interruptible(&inst->dev->hw_lock);
> +			if (ret)
> +				return ret;
> +			if (dec_info.index_frame_display > 0)
> +				wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display);
>  		}
>  	} while (ret != 0);
>  	mutex_unlock(&inst->dev->hw_lock);


