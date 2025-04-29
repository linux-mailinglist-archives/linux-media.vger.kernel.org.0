Return-Path: <linux-media+bounces-31307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E97AA0BFB
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 14:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B84C464981
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19772C3769;
	Tue, 29 Apr 2025 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j4QVCJ9y"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A62701C4;
	Tue, 29 Apr 2025 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745930851; cv=none; b=ZazK8zbyprimvED7XqvtIUjOuFqHuomX8krRYztUwOuWzi75XNKJzGAOGmTPmnJPgjBDKcsQSmz1BgQ27oifsrmllOhXENSUXa82F8ogRCAJlfm6gM1vkKvH+Yy54Xrc7PKRykfU8hM6EOqKRyOAS9n6U1PMxG1Tbvel2h6Nusw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745930851; c=relaxed/simple;
	bh=ALFfqZTCZO2PHhqc2/0fWGwaOyZ3IOtl8aSKr66hINk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UqMKAyY6mnyDtiFu4tbX7szlPpulSCZx/UCm4yFoGELaRqD+a+A7XejpfCkcImfFJHH52C2b9V9omXSahHbTcdDoUnFzyPZRPN/pbrXXA88fCdjdP1HI3mvYq56pGJJIlnKwseXo9SPQOu1GC+q70jedvHeRrimBylBtt+fviVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j4QVCJ9y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745930846;
	bh=ALFfqZTCZO2PHhqc2/0fWGwaOyZ3IOtl8aSKr66hINk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=j4QVCJ9yzrE7ilsBqngIg3T+X/OaF94eCN0h1X09Aw/BEemEc870WphrS7RRiFOcl
	 +sdGJ7cM75J6r5ybCBa/0bgu8hVs4KNy8SWq5L+HTDamlIFMANL7Fye196tO3J2G6v
	 3A3XFsE9Ucm5Rebet3h2PZq2iOi+VWkC0Zj06Eadr2+6laLa7yJPNKrruIx3yVj46+
	 Cv8bzighjtu1XuYQQI79L+dzYnFRgEou3JEVjrJ5gdXtnu0rOeb63kL5lFq4BAN3N9
	 cXE0rBcSi/a0Py8yZk2wDuMRC6uyALWlu0MH77V0jh3P68uieQdrwlhRuU528FDCt6
	 zk5uvfKZoaIig==
Received: from [IPv6:2606:6d00:15:9913::5ac] (unknown [IPv6:2606:6d00:15:9913::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 714DA17E0649;
	Tue, 29 Apr 2025 14:47:24 +0200 (CEST)
Message-ID: <dc9b20aecc8740896b2b3e7352b8e0d73d43fed2.camel@collabora.com>
Subject: Re: [PATCH v2 01/23] media: iris: Skip destroying internal buffer
 if not dequeued
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, Vikash Garodia	
 <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Stefan Schmidt
 <stefan.schmidt@linaro.org>, Hans Verkuil	 <hverkuil@xs4all.nl>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio	 <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov	
 <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
	20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org, 
	20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org
Date: Tue, 29 Apr 2025 08:47:22 -0400
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-1-3a6013ecb8a5@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
	 <20250428-qcom-iris-hevc-vp9-v2-1-3a6013ecb8a5@quicinc.com>
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

Not mine to review, but wanted to highlight some best practices,

comment below...

Le lundi 28 avril 2025 à 14:58 +0530, Dikshita Agarwal a écrit :
> Firmware might hold the DPB buffers for reference in case of sequence
> change, so skip destroying buffers for which QUEUED flag is not removed.
> Also, make sure that all buffers are released during streamoff.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 37 +++++++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_buffer.h |  3 ++-
>  drivers/media/platform/qcom/iris/iris_vdec.c   |  4 +--
>  drivers/media/platform/qcom/iris/iris_vidc.c   |  6 +++--
>  4 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index e5c5a564fcb8..606d76b10be2 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -376,7 +376,7 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
>  	return 0;
>  }
>  
> -int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
> +int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)

Its always tempting to just glue a boolean at the end of a parameter
list. But this has huge downside in code readability, see below...

>  {
>  	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
>  	struct iris_buffer *buf, *next;
> @@ -396,6 +396,14 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>  	for (i = 0; i < len; i++) {
>  		buffers = &inst->buffers[internal_buf_type[i]];
>  		list_for_each_entry_safe(buf, next, &buffers->list, list) {
> +			/*
> +			 * during stream on, skip destroying internal(DPB) buffer
> +			 * if firmware did not return it.
> +			 * during close, destroy all buffers irrespectively.
> +			 */
> +			if (!force && buf->attr & BUF_ATTR_QUEUED)
> +				continue;
> +
>  			ret = iris_destroy_internal_buffer(inst, buf);
>  			if (ret)
>  				return ret;
> @@ -446,6 +454,33 @@ static int iris_release_input_internal_buffers(struct iris_inst *inst)
>  	return 0;
>  }
>  
> +void iris_get_num_queued_internal_buffers(struct iris_inst *inst, u32 plane)
> +{
> +	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
> +	struct iris_buffer *buf, *next;
> +	struct iris_buffers *buffers;
> +	const u32 *internal_buf_type;
> +	u32 internal_buffer_count, i;
> +	u32 count = 0;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(plane)) {
> +		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
> +		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
> +	} else {
> +		internal_buf_type = platform_data->dec_op_int_buf_tbl;
> +		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
> +	}
> +
> +	for (i = 0; i < internal_buffer_count; i++) {
> +		buffers = &inst->buffers[internal_buf_type[i]];
> +		list_for_each_entry_safe(buf, next, &buffers->list, list)
> +			count++;
> +		if (count)
> +			dev_err(inst->core->dev, "%d buffer of type %d not released",
> +				count, internal_buf_type[i]);
> +	}
> +}
> +
>  int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
>  {
>  	struct iris_buffers *buffers = &inst->buffers[BUF_PERSIST];
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index c36b6347b077..03a32b91cf21 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -106,7 +106,8 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
>  int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
>  int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
>  int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
> -int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane);
> +int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force);
> +void iris_get_num_queued_internal_buffers(struct iris_inst *inst, u32 plane);
>  int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
>  int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
>  int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 4143acedfc57..2c1a7162d2da 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -408,7 +408,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>  
>  	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  
> -	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, false);
>  	if (ret)
>  		return ret;
>  
> @@ -496,7 +496,7 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
>  
>  	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>  
> -	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, false);

If I was reviewing some changes (or even debugging) this specific C
file, I would not be able to understanding what this "false" means. I
would have to spend extra time, opening the declaration, going back and
forth, and breaking the flow.

An alternative approach is to keep the boolean parameter in a static
function (c local), and then add two function wrappers that have
explicit names.

regards,
Nicolas

>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index ca0f4e310f77..56531a7f0dfe 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -233,8 +233,10 @@ int iris_close(struct file *filp)
>  	iris_session_close(inst);
>  	iris_inst_change_state(inst, IRIS_INST_DEINIT);
>  	iris_v4l2_fh_deinit(inst);
> -	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> -	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, true);
> +	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, true);
> +	iris_get_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	iris_get_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>  	iris_remove_session(inst);
>  	mutex_unlock(&inst->lock);
>  	mutex_destroy(&inst->ctx_q_lock);

-- 
Nicolas Dufresne
Principal Engineer at Collabora

