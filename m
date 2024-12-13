Return-Path: <linux-media+bounces-23401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA49F16C5
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 20:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A70797A1E06
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 19:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA9718FC85;
	Fri, 13 Dec 2024 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X+FL0xXD"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346E17AE1C;
	Fri, 13 Dec 2024 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734119437; cv=none; b=FU9BuX7y9k0ebRA/SAKOITs/OMGNyJyXjyuzb7LeVRfr0olHZhbJQUBkM4qG1WS1OqlBKOnHcWugVTMKlVu/1+vH9gJ6UC6KcsCqGQi9SfVc3ookedYJIFHfuGz5H8bXDC8MHrUAau2hobGXtxaL75bs+zBFY5EBIUb7r+V1yhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734119437; c=relaxed/simple;
	bh=Vs67HdxnLLni7iZnN9n0cASh68idehz9RTM40XzIJ6A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kx0+Mc+ZkEqygvwB9RM0Gpy73GIf+L4znjlvQlok8A/Xc09brDGQzzggycnXdFuhv22KerY0LL9e3U+nItFQwFqXTBMbGo21eUeX6raHk9xVxz7fg4XWrcuMLg4GcUodWxBMTYrc13bd5n0g4HN7Byj7pj7BceQG1YyYK4T6844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X+FL0xXD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734119433;
	bh=Vs67HdxnLLni7iZnN9n0cASh68idehz9RTM40XzIJ6A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=X+FL0xXDiV+BgTy5nhB0S497xEMVQx5VVDMJ9n53IOP52jm9ukySRWC0noi7y37eX
	 2CegRtYWs1sRg99ZZzuCMaPUt6NCO/b6I4xvfFtzoGtzbTv5DiRX6mVxeopgsZB+VN
	 E0LVRwPP4FglLl6sJfG9V3p2M7WKbHMwzBfFdnANSwqS9hqEKTRvZwS74zQhnsiSC1
	 0ithym+3GsKPp9OyvDfZiOQA+nSPYv1EPIYOS9Mh4Cr7ApK/kCHbNWtGue2OLqBddP
	 zIRRXXq+wKYNK+tZgN4s3cpKHO1NMfMBojcA9A1k5kPjw29y6opm87C4sixUl3pKhf
	 FIbdFNRaGuqwA==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A0F717E37F3;
	Fri, 13 Dec 2024 20:50:31 +0100 (CET)
Message-ID: <ffc49cd8740472cc968e9e4f8ed0784a7a0eb9ac.camel@collabora.com>
Subject: Re: [PATCH v1 4/5] media: chips-media: wave5: Fix hang after seeking
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 13 Dec 2024 14:50:29 -0500
In-Reply-To: <20241209053654.52-5-jackson.lee@chipsnmedia.com>
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
	 <20241209053654.52-5-jackson.lee@chipsnmedia.com>
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
> While seeking, driver calls flush command. Before flush command is sent to
> VPU, driver should handle display buffer flags and should get all decoded
> information from VPU if VCORE is running.
> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Looks reasonable to me, can this patch be apply before 3/5 and merged already ?
Also, can that be added a Fixes that ? Its is otherwise from this serie stand
point:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../platform/chips-media/wave5/wave5-vpu-dec.c  | 17 ++++++++++++++++-
>  .../platform/chips-media/wave5/wave5-vpuapi.c   | 10 ++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index b0e1f94bdb30..ce3fc47dc9d8 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1431,6 +1431,16 @@ static int streamoff_output(struct vb2_queue *q)
>  	int ret;
>  	dma_addr_t new_rd_ptr;
>  	struct vpu_src_buffer *vpu_buf, *tmp;
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
>  	inst->retry = false;
>  	inst->queuing_num = 0;
> @@ -1444,6 +1454,11 @@ static int streamoff_output(struct vb2_queue *q)
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
> @@ -1526,7 +1541,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>  			break;
>  
>  		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
> -			dev_dbg(inst->dev->dev, "Getting decoding results from fw, fail\n");
> +			dev_dbg(inst->dev->dev, "there is no output info\n");
>  	}
>  	v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
>  
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index 9a28d0f770bc..bcb8e6a37843 100644
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


