Return-Path: <linux-media+bounces-16695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C711295DDFB
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 15:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C06141C20D20
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 13:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93037156673;
	Sat, 24 Aug 2024 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gzLKychM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486CA155CAC
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724504811; cv=none; b=KwOCY2b63dOqtDmcpyY0XBAXLBLoOX/TDcyucnBFmOkekcfTX6zte5nv97hJop7zyMhSJs47pLZiKW5gtqi7WHm+TbpuLjO0epM931e2kwhoLo5OODt8YM7Apaxs6fumR3W/GOFLvWW+t2BT1S9Hz6HwVBNzSlN4b+Bm6ucV6os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724504811; c=relaxed/simple;
	bh=wrnM1voOU3SSd51aT/O2YkNRBMT8gKJoEn1hZbZR34g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpNEgdclIH+ht9FyghscKLkNbQcH0W8JjbtcSS20tS4k+T1XKhCWdTYLHt3P6iF7g9fJmzejLD9MeLPRoyK0gIOQmfvxY5otA0Fud042MQdKgXRuN3z2lwRlNKzfNG8Ox60gvry4g6Smzn655EMD16vmNsu18p6QTG3UpFsA9VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gzLKychM; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ef9714673so524084e87.0
        for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724504806; x=1725109606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ZBwjdM6bBW4UU8Z7XJo6wDIur9MFK0FamvdZTSIwYs=;
        b=gzLKychM38RExHtji40WA6DFL/+KMQXtFogNxhp9b59S2Ayle3XaUiTwI5z+p0wNfw
         NPpGDrJrkUqV6QWPK1M9ksjgfTdC4Gd6JV/tkqT06A+ptzGG0hVt9sFEGtnu2ixbnqBR
         mh2ek9zAzDJVO/SxcUy2ceJXhkMyKAqmq5KD1neJqyzCOZbHtw1pM/8tFKpZ36N9NPoP
         DTTcoQWjvBY8bnNfj68va5wSNqU6yXEcYIlj1/RhOx3a9H46i2oXaFf4W91Z/re8OkgD
         GDD5Paz1U4Gqyy3MGXgyoOQyqrbJVXYb0eR2SjVk3V7HIxtC37z1cgNHjwXTN6P+iSPG
         gYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724504806; x=1725109606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZBwjdM6bBW4UU8Z7XJo6wDIur9MFK0FamvdZTSIwYs=;
        b=k6WX88fq55Bp30AZPbcQtQHAdYxqxP4WV9N31LlxZgitJTgq07L7ysa8gLv9tKR85O
         c8K3o6OyGrnZ0pTHsta4NNFL6JMDwGjRQKnZcqja2dSFmfvNBA2kfZ2jVtF+he5pckzZ
         emyJpI1BTyha1b89pzzCpXFr5ICND9XfFSggscwATX6B3dJ4Ooahz+pWa1taIGy4Luxn
         tJe9IS4WqX/GEg3zPc5jaVxmOz3h+vSFmsGFgC/WXrwMglvkeLx8ARYZOWLJpY9say7s
         woxOri99djBwmOlRApRPdmoMFjP1WXx2MO/EtmAIxwfA2GMcdnxF19z33OU6z4iNi+V1
         DNgw==
X-Forwarded-Encrypted: i=1; AJvYcCXaRh1oSg//FMeXbAZir3/sKbHBbpqRTvbxtqd+mRpaG2ckDP0e6f9CUQjw1FYhx/ZV5zCFfpgd9mq5pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMo9cWbhg5cYMsZMA7V84fW+ux2KO0wMeb/PbuELdududu2gxi
	9obb4/KOUEt57JhNY5Rs7OEt5d2HPdACnLOznsXVd8kE2h9x0tLPiVvYytgKpSQ=
X-Google-Smtp-Source: AGHT+IHbYsk3rOf2oh7BSGSdeOYG06Tv+nuEo/kH5O1mfUCjCAqOUjubhhhcXxykgHwQJs8IJGJYpA==
X-Received: by 2002:a05:6512:3e09:b0:530:db20:1f0f with SMTP id 2adb3069b0e04-534387bba45mr2067333e87.4.1724504806019;
        Sat, 24 Aug 2024 06:06:46 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ecdc5d8sm859203e87.237.2024.08.24.06.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 06:06:45 -0700 (PDT)
Message-ID: <b1e1ff88-5bba-4424-bc85-38caa85b831f@linaro.org>
Date: Sat, 24 Aug 2024 16:06:44 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: vfe: Move common code into vfe
 core
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-10-quic_depengs@quicinc.com>
 <0611458d-b508-4e52-bafe-7f5612c63b72@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <0611458d-b508-4e52-bafe-7f5612c63b72@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 8/15/24 03:09, Bryan O'Donoghue wrote:
> On 12/08/2024 15:41, Depeng Shao wrote:
>> Some v4l2 buffer related logic functions can be moved to vfe core as
>> common code, then the vfe driver of different hw version can reuse them,
>> this also can avoid adding duplicate code for new version supporting.
>>
>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> ---
>>    .../media/platform/qcom/camss/camss-vfe-17x.c | 112 +-------
>>    .../media/platform/qcom/camss/camss-vfe-4-1.c |   9 -
>>    .../media/platform/qcom/camss/camss-vfe-4-7.c |  11 -
>>    .../media/platform/qcom/camss/camss-vfe-4-8.c |  11 -
>>    .../media/platform/qcom/camss/camss-vfe-480.c | 258 +----------------
>>    drivers/media/platform/qcom/camss/camss-vfe.c | 264 ++++++++++++++++++
>>    drivers/media/platform/qcom/camss/camss-vfe.h |  58 +++-
>>    7 files changed, 340 insertions(+), 383 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
>> index 380c99321030..e5ee7e717b3b 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
>> @@ -14,8 +14,6 @@
>>    #include "camss.h"
>>    #include "camss-vfe.h"
>>    
>> -#define VFE_HW_VERSION				(0x000)
>> -
>>    #define VFE_GLOBAL_RESET_CMD			(0x018)
>>    #define		GLOBAL_RESET_CMD_CORE		BIT(0)
>>    #define		GLOBAL_RESET_CMD_CAMIF		BIT(1)
>> @@ -176,20 +174,6 @@
>>    #define VFE_BUS_WM_FRAME_INC(n)			(0x2258 + (n) * 0x100)
>>    #define VFE_BUS_WM_BURST_LIMIT(n)		(0x225c + (n) * 0x100)
>>    
>> -static u32 vfe_hw_version(struct vfe_device *vfe)
>> -{
>> -	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
>> -
>> -	u32 gen = (hw_version >> 28) & 0xF;
>> -	u32 rev = (hw_version >> 16) & 0xFFF;
>> -	u32 step = hw_version & 0xFFFF;
>> -
>> -	dev_dbg(vfe->camss->dev, "VFE HW Version = %u.%u.%u\n",
>> -		gen, rev, step);
>> -
>> -	return hw_version;
>> -}
>> -
>>    static inline void vfe_reg_set(struct vfe_device *vfe, u32 reg, u32 set_bits)
>>    {
>>    	u32 bits = readl_relaxed(vfe->base + reg);
>> @@ -438,62 +422,6 @@ static int vfe_get_output(struct vfe_line *line)
>>    	return -EINVAL;
>>    }
>>    
>> -static int vfe_enable_output(struct vfe_line *line)
>> -{
>> -	struct vfe_device *vfe = to_vfe(line);
>> -	struct vfe_output *output = &line->output;
>> -	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
>> -	struct media_entity *sensor;
>> -	unsigned long flags;
>> -	unsigned int frame_skip = 0;
>> -	unsigned int i;
>> -
>> -	sensor = camss_find_sensor(&line->subdev.entity);
>> -	if (sensor) {
>> -		struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
>> -
>> -		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
>> -		/* Max frame skip is 29 frames */
>> -		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
>> -			frame_skip = VFE_FRAME_DROP_VAL - 1;
>> -	}
>> -
>> -	spin_lock_irqsave(&vfe->output_lock, flags);
>> -
>> -	ops->reg_update_clear(vfe, line->id);
>> -
>> -	if (output->state > VFE_OUTPUT_RESERVED) {
>> -		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
>> -			output->state);
>> -		spin_unlock_irqrestore(&vfe->output_lock, flags);
>> -		return -EINVAL;
>> -	}
>> -
>> -	WARN_ON(output->gen2.active_num);
>> -
>> -	output->state = VFE_OUTPUT_ON;
>> -
>> -	output->sequence = 0;
>> -	output->wait_reg_update = 0;
>> -	reinit_completion(&output->reg_update);
>> -
>> -	vfe_wm_start(vfe, output->wm_idx[0], line);
>> -
>> -	for (i = 0; i < 2; i++) {
>> -		output->buf[i] = vfe_buf_get_pending(output);
>> -		if (!output->buf[i])
>> -			break;
>> -		output->gen2.active_num++;
>> -		vfe_wm_update(vfe, output->wm_idx[0], output->buf[i]->addr[0], line);
>> -	}
>> -
>> -	ops->reg_update(vfe, line->id);
>> -
>> -	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> -
>> -	return 0;
>> -}
>> -
>>    /*
>>     * vfe_enable - Enable streaming on VFE line
>>     * @line: VFE line
>> @@ -518,7 +446,7 @@ static int vfe_enable(struct vfe_line *line)
>>    	if (ret < 0)
>>    		goto error_get_output;
>>    
>> -	ret = vfe_enable_output(line);
>> +	ret = vfe_enable_output_v2(line);
>>    	if (ret < 0)
>>    		goto error_enable_output;
>>    
>> @@ -627,40 +555,6 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
>>    	spin_unlock_irqrestore(&vfe->output_lock, flags);
>>    }
>>    
>> -/*
>> - * vfe_queue_buffer - Add empty buffer
>> - * @vid: Video device structure
>> - * @buf: Buffer to be enqueued
>> - *
>> - * Add an empty buffer - depending on the current number of buffers it will be
>> - * put in pending buffer queue or directly given to the hardware to be filled.
>> - *
>> - * Return 0 on success or a negative error code otherwise
>> - */
>> -static int vfe_queue_buffer(struct camss_video *vid,
>> -			    struct camss_buffer *buf)
>> -{
>> -	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
>> -	struct vfe_device *vfe = to_vfe(line);
>> -	struct vfe_output *output;
>> -	unsigned long flags;
>> -
>> -	output = &line->output;
>> -
>> -	spin_lock_irqsave(&vfe->output_lock, flags);
>> -
>> -	if (output->state == VFE_OUTPUT_ON && output->gen2.active_num < 2) {
>> -		output->buf[output->gen2.active_num++] = buf;
>> -		vfe_wm_update(vfe, output->wm_idx[0], buf->addr[0], line);
>> -	} else {
>> -		vfe_buf_add_pending(output, buf);
>> -	}
>> -
>> -	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> -
>> -	return 0;
>> -}
>> -
>>    static const struct vfe_isr_ops vfe_isr_ops_170 = {
>>    	.reset_ack = vfe_isr_reset_ack,
>>    	.halt_ack = vfe_isr_halt_ack,
>> @@ -671,7 +565,7 @@ static const struct vfe_isr_ops vfe_isr_ops_170 = {
>>    };
>>    
>>    static const struct camss_video_ops vfe_video_ops_170 = {
>> -	.queue_buffer = vfe_queue_buffer,
>> +	.queue_buffer = vfe_queue_buffer_v2,
>>    	.flush_buffers = vfe_flush_buffers,
>>    };
>>    
>> @@ -695,5 +589,7 @@ const struct vfe_hw_ops vfe_ops_170 = {
>>    	.vfe_enable = vfe_enable,
>>    	.vfe_halt = vfe_halt,
>>    	.violation_read = vfe_violation_read,
>> +	.vfe_wm_start = vfe_wm_start,
>>    	.vfe_wm_stop = vfe_wm_stop,
>> +	.vfe_wm_update = vfe_wm_update,
>>    };
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
>> index 1bd3a6ef1d04..6930799f77c2 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
>> @@ -210,15 +210,6 @@
>>    #define MSM_VFE_VFE0_UB_SIZE 1023
>>    #define MSM_VFE_VFE0_UB_SIZE_RDI (MSM_VFE_VFE0_UB_SIZE / 3)
>>    
>> -static u32 vfe_hw_version(struct vfe_device *vfe)
>> -{
>> -	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
>> -
>> -	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
>> -
>> -	return hw_version;
>> -}
>> -
>>    static u16 vfe_get_ub_size(u8 vfe_id)
>>    {
>>    	if (vfe_id == 0)
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
>> index ce0719106bd3..76729607db02 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
>> @@ -18,8 +18,6 @@
>>    #include "camss-vfe-gen1.h"
>>    
>>    
>> -#define VFE_0_HW_VERSION		0x000
>> -
>>    #define VFE_0_GLOBAL_RESET_CMD		0x018
>>    #define VFE_0_GLOBAL_RESET_CMD_CORE	BIT(0)
>>    #define VFE_0_GLOBAL_RESET_CMD_CAMIF	BIT(1)
>> @@ -254,15 +252,6 @@
>>    #define MSM_VFE_VFE1_UB_SIZE 1535
>>    #define MSM_VFE_VFE1_UB_SIZE_RDI (MSM_VFE_VFE1_UB_SIZE / 3)
>>    
>> -static u32 vfe_hw_version(struct vfe_device *vfe)
>> -{
>> -	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
>> -
>> -	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
>> -
>> -	return hw_version;
>> -}
>> -
>>    static u16 vfe_get_ub_size(u8 vfe_id)
>>    {
>>    	if (vfe_id == 0)
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
>> index 6b59c8107a3c..b2f7d855d8dd 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
>> @@ -17,8 +17,6 @@
>>    #include "camss-vfe.h"
>>    #include "camss-vfe-gen1.h"
>>    
>> -#define VFE_0_HW_VERSION		0x000
>> -
>>    #define VFE_0_GLOBAL_RESET_CMD		0x018
>>    #define VFE_0_GLOBAL_RESET_CMD_CORE	BIT(0)
>>    #define VFE_0_GLOBAL_RESET_CMD_CAMIF	BIT(1)
>> @@ -247,15 +245,6 @@
>>    #define MSM_VFE_VFE1_UB_SIZE 1535
>>    #define MSM_VFE_VFE1_UB_SIZE_RDI (MSM_VFE_VFE1_UB_SIZE / 3)
>>    
>> -static u32 vfe_hw_version(struct vfe_device *vfe)
>> -{
>> -	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
>> -
>> -	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
>> -
>> -	return hw_version;
>> -}
>> -
>>    static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
>>    {
>>    	u32 bits = readl_relaxed(vfe->base + reg);
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
>> index dc2735476c82..e6d3b27de323 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
>> @@ -15,8 +15,6 @@
>>    #include "camss.h"
>>    #include "camss-vfe.h"
>>    
>> -#define VFE_HW_VERSION			(0x00)
>> -
>>    #define VFE_GLOBAL_RESET_CMD		(vfe_is_lite(vfe) ? 0x0c : 0x1c)
>>    #define	    GLOBAL_RESET_HW_AND_REG	(vfe_is_lite(vfe) ? BIT(1) : BIT(0))
>>    
>> @@ -92,19 +90,6 @@ static inline int bus_irq_mask_0_comp_done(struct vfe_device *vfe, int n)
>>    
>>    #define MAX_VFE_OUTPUT_LINES	4
>>    
>> -static u32 vfe_hw_version(struct vfe_device *vfe)
>> -{
>> -	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
>> -
>> -	u32 gen = (hw_version >> 28) & 0xF;
>> -	u32 rev = (hw_version >> 16) & 0xFFF;
>> -	u32 step = hw_version & 0xFFFF;
>> -
>> -	dev_dbg(vfe->camss->dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
>> -
>> -	return hw_version;
>> -}
>> -
>>    static void vfe_global_reset(struct vfe_device *vfe)
>>    {
>>    	writel_relaxed(IRQ_MASK_0_RESET_ACK, vfe->base + VFE_IRQ_MASK(0));
>> @@ -167,18 +152,16 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>>    	vfe->reg_update &= ~REG_UPDATE_RDI(vfe, line_id);
>>    }
>>    
>> -static void vfe_enable_irq_common(struct vfe_device *vfe)
>> -{
>> -	/* enable reset ack IRQ and top BUS status IRQ */
>> -	writel_relaxed(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
>> -		       vfe->base + VFE_IRQ_MASK(0));
>> -}
>> -
>> -static void vfe_enable_lines_irq(struct vfe_device *vfe)
>> +static void vfe_enable_irq(struct vfe_device *vfe)
>>    {
>>    	int i;
>>    	u32 bus_irq_mask = 0;
>>    
>> +	if (!vfe->stream_count)
>> +		/* enable reset ack IRQ and top BUS status IRQ */
>> +		writel(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
>> +		       vfe->base + VFE_IRQ_MASK(0));
>> +
>>    	for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
>>    		/* Enable IRQ for newly added lines, but also keep already running lines's IRQ */
>>    		if (vfe->line[i].output.state == VFE_OUTPUT_RESERVED ||
>> @@ -188,11 +171,10 @@ static void vfe_enable_lines_irq(struct vfe_device *vfe)
>>    			}
>>    	}
>>    
>> -	writel_relaxed(bus_irq_mask, vfe->base + VFE_BUS_IRQ_MASK(0));
>> +	writel(bus_irq_mask, vfe->base + VFE_BUS_IRQ_MASK(0));
>>    }
>>    
>>    static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id);
>> -static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm);
>>    
>>    /*
>>     * vfe_isr - VFE module interrupt handler
>> @@ -226,7 +208,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>>    				vfe_isr_reg_update(vfe, i);
>>    
>>    			if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i)))
>> -				vfe_isr_wm_done(vfe, i);
>> +				vfe_buf_done(vfe, i);
>>    		}
>>    	}
>>    
>> @@ -245,132 +227,6 @@ static int vfe_halt(struct vfe_device *vfe)
>>    	return 0;
>>    }
>>    
>> -static int vfe_get_output(struct vfe_line *line)
>> -{
>> -	struct vfe_device *vfe = to_vfe(line);
>> -	struct vfe_output *output;
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&vfe->output_lock, flags);
>> -
>> -	output = &line->output;
>> -	if (output->state > VFE_OUTPUT_RESERVED) {
>> -		dev_err(vfe->camss->dev, "Output is running\n");
>> -		goto error;
>> -	}
>> -
>> -	output->wm_num = 1;
>> -
>> -	/* Correspondence between VFE line number and WM number.
>> -	 * line 0 -> RDI 0, line 1 -> RDI1, line 2 -> RDI2, line 3 -> PIX/RDI3
>> -	 * Note this 1:1 mapping will not work for PIX streams.
>> -	 */
>> -	output->wm_idx[0] = line->id;
>> -	vfe->wm_output_map[line->id] = line->id;
>> -
>> -	output->drop_update_idx = 0;
>> -
>> -	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> -
>> -	return 0;
>> -
>> -error:
>> -	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> -	output->state = VFE_OUTPUT_OFF;
>> -
>> -	return -EINVAL;
>> -}
>> -
>> -static int vfe_enable_output(struct vfe_line *line)
>> -{
>> -	struct vfe_device *vfe = to_vfe(line);
>> -	struct vfe_output *output = &line->output;
>> -	unsigned long flags;
>> -	unsigned int i;
>> -
>> -	spin_lock_irqsave(&vfe->output_lock, flags);
>> -
>> -	vfe_reg_update_clear(vfe, line->id);
>> -
>> -	if (output->state > VFE_OUTPUT_RESERVED) {
>> -		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
>> -			output->state);
>> -		spin_unlock_irqrestore(&vfe->output_lock, flags);
>> -		return -EINVAL;
>> -	}
>> -
>> -	WARN_ON(output->gen2.active_num);
>> -
>> -	output->state = VFE_OUTPUT_ON;
>> -
>> -	output->sequence = 0;
>> -	output->wait_reg_update = 0;
>> -	reinit_completion(&output->reg_update);
>> -
>> -	vfe_wm_start(vfe, output->wm_idx[0], line);
>> -
>> -	for (i = 0; i < 2; i++) {
>> -		output->buf[i] = vfe_buf_get_pending(output);
>> -		if (!output->buf[i])
>> -			break;
>> -		output->gen2.active_num++;
>> -		vfe_wm_update(vfe, output->wm_idx[0], output->buf[i]->addr[0], line);
>> -	}
>> -
>> -	vfe_reg_update(vfe, line->id);
>> -
>> -	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> -
>> -	return 0;
>> -}
>> -
>> -/*
>> - * vfe_enable - Enable streaming on VFE line
>> - * @line: VFE line
>> - *
>> - * Return 0 on success or a negative error code otherwise
>> - */
>> -static int vfe_enable(struct vfe_line *line)
>> -{
>> -	struct vfe_device *vfe = to_vfe(line);
>> -	int ret;
>> -
>> -	mutex_lock(&vfe->stream_lock);
>> -
>> -	if (!vfe->stream_count)
>> -		vfe_enable_irq_common(vfe);
>> -
>> -	vfe->stream_count++;
>> -
>> -	vfe_enable_lines_irq(vfe);
>> -
>> -	mutex_unlock(&vfe->stream_lock);
>> -
>> -	ret = vfe_get_output(line);
>> -	if (ret < 0)
>> -		goto error_get_output;
>> -
>> -	ret = vfe_enable_output(line);
>> -	if (ret < 0)
>> -		goto error_enable_output;
>> -
>> -	vfe->was_streaming = 1;
>> -
>> -	return 0;
>> -
>> -error_enable_output:
>> -	vfe_put_output(line);
>> -
>> -error_get_output:
>> -	mutex_lock(&vfe->stream_lock);
>> -
>> -	vfe->stream_count--;
>> -
>> -	mutex_unlock(&vfe->stream_lock);
>> -
>> -	return ret;
>> -}
>> -
>>    /*
>>     * vfe_isr_reg_update - Process reg update interrupt
>>     * @vfe: VFE Device
>> @@ -394,97 +250,8 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
>>    	spin_unlock_irqrestore(&vfe->output_lock, flags);
>>    }
>>    
>> -/*
>> - * vfe_isr_wm_done - Process write master done interrupt
>> - * @vfe: VFE Device
>> - * @wm: Write master id
>> - */
>> -static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
>> -{
>> -	struct vfe_line *line = &vfe->line[vfe->wm_output_map[wm]];
>> -	struct camss_buffer *ready_buf;
>> -	struct vfe_output *output;
>> -	unsigned long flags;
>> -	u32 index;
>> -	u64 ts = ktime_get_ns();
>> -
>> -	spin_lock_irqsave(&vfe->output_lock, flags);
>> -
>> -	if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
>> -		dev_err_ratelimited(vfe->camss->dev,
>> -				    "Received wm done for unmapped index\n");
>> -		goto out_unlock;
>> -	}
>> -	output = &vfe->line[vfe->wm_output_map[wm]].output;
>> -
>> -	ready_buf = output->buf[0];
>> -	if (!ready_buf) {
>> -		dev_err_ratelimited(vfe->camss->dev,
>> -				    "Missing ready buf %d!\n", output->state);
>> -		goto out_unlock;
>> -	}
>> -
>> -	ready_buf->vb.vb2_buf.timestamp = ts;
>> -	ready_buf->vb.sequence = output->sequence++;
>> -
>> -	index = 0;
>> -	output->buf[0] = output->buf[1];
>> -	if (output->buf[0])
>> -		index = 1;
>> -
>> -	output->buf[index] = vfe_buf_get_pending(output);
>> -
>> -	if (output->buf[index])
>> -		vfe_wm_update(vfe, output->wm_idx[0], output->buf[index]->addr[0], line);
>> -	else
>> -		output->gen2.active_num--;
>> -
>> -	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> -
>> -	vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>> -
>> -	return;
>> -
>> -out_unlock:
>> -	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> -}
>> -
>> -/*
>> - * vfe_queue_buffer - Add empty buffer
>> - * @vid: Video device structure
>> - * @buf: Buffer to be enqueued
>> - *
>> - * Add an empty buffer - depending on the current number of buffers it will be
>> - * put in pending buffer queue or directly given to the hardware to be filled.
>> - *
>> - * Return 0 on success or a negative error code otherwise
>> - */
>> -static int vfe_queue_buffer(struct camss_video *vid,
>> -			    struct camss_buffer *buf)
>> -{
>> -	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
>> -	struct vfe_device *vfe = to_vfe(line);
>> -	struct vfe_output *output;
>> -	unsigned long flags;
>> -
>> -	output = &line->output;
>> -
>> -	spin_lock_irqsave(&vfe->output_lock, flags);
>> -
>> -	if (output->state == VFE_OUTPUT_ON && output->gen2.active_num < 2) {
>> -		output->buf[output->gen2.active_num++] = buf;
>> -		vfe_wm_update(vfe, output->wm_idx[0], buf->addr[0], line);
>> -	} else {
>> -		vfe_buf_add_pending(output, buf);
>> -	}
>> -
>> -	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> -
>> -	return 0;
>> -}
>> -
>>    static const struct camss_video_ops vfe_video_ops_480 = {
>> -	.queue_buffer = vfe_queue_buffer,
>> +	.queue_buffer = vfe_queue_buffer_v2,
>>    	.flush_buffers = vfe_flush_buffers,
>>    };
>>    
>> @@ -494,6 +261,7 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>>    }
>>    
>>    const struct vfe_hw_ops vfe_ops_480 = {
>> +	.enable_irq = vfe_enable_irq,
>>    	.global_reset = vfe_global_reset,
>>    	.hw_version = vfe_hw_version,
>>    	.isr = vfe_isr,
>> @@ -501,7 +269,11 @@ const struct vfe_hw_ops vfe_ops_480 = {
>>    	.pm_domain_on = vfe_pm_domain_on,
>>    	.subdev_init = vfe_subdev_init,
>>    	.vfe_disable = vfe_disable,
>> -	.vfe_enable = vfe_enable,
>> +	.vfe_enable = vfe_enable_v2,
>>    	.vfe_halt = vfe_halt,
>> +	.vfe_wm_start = vfe_wm_start,
>>    	.vfe_wm_stop = vfe_wm_stop,
>> +	.vfe_wm_update = vfe_wm_update,
>> +	.reg_update = vfe_reg_update,
>> +	.reg_update_clear = vfe_reg_update_clear,
>>    };
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 83c5a36d071f..f6650694f47e 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -32,6 +32,11 @@
>>    
>>    #define SCALER_RATIO_MAX 16
>>    
>> +#define VFE_HW_VERSION		0x0
>> +#define		HW_VERSION_STEPPING	0
>> +#define		HW_VERSION_REVISION	16
>> +#define		HW_VERSION_GENERATION	28
>> +
>>    static const struct camss_format_info formats_rdi_8x16[] = {
>>    	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
>>    	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
>> @@ -402,6 +407,265 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>>    	return 0;
>>    }
>>    
>> +/*
>> + * vfe_hw_version - Process write master done interrupt
>> + * @vfe: VFE Device
>> + *
>> + * Return vfe hw version
>> + */
>> +u32 vfe_hw_version(struct vfe_device *vfe)
>> +{
>> +	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
>> +
>> +	u32 gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
>> +	u32 rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
>> +	u32 step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
>> +
>> +	dev_info(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
>> +		 vfe->id, gen, rev, step);
>> +
>> +	return hw_version;
>> +}
>> +
>> +/*
>> + * vfe_buf_done - Process write master done interrupt
>> + * @vfe: VFE Device
>> + * @wm: Write master id
>> + */
>> +void vfe_buf_done(struct vfe_device *vfe, int wm)
>> +{
>> +	struct vfe_line *line = &vfe->line[vfe->wm_output_map[wm]];
>> +	struct camss_buffer *ready_buf;
>> +	struct vfe_output *output;
>> +	unsigned long flags;
>> +	u32 index;
>> +	u64 ts = ktime_get_ns();
>> +
>> +	spin_lock_irqsave(&vfe->output_lock, flags);
>> +
>> +	if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
>> +		dev_err_ratelimited(vfe->camss->dev,
>> +				    "Received wm done for unmapped index\n");
>> +		goto out_unlock;
>> +	}
>> +	output = &vfe->line[vfe->wm_output_map[wm]].output;
>> +
>> +	ready_buf = output->buf[0];
>> +	if (!ready_buf) {
>> +		dev_err_ratelimited(vfe->camss->dev,
>> +				    "Missing ready buf %d!\n", output->state);
>> +		goto out_unlock;
>> +	}
>> +
>> +	ready_buf->vb.vb2_buf.timestamp = ts;
>> +	ready_buf->vb.sequence = output->sequence++;
>> +
>> +	index = 0;
>> +	output->buf[0] = output->buf[1];
>> +	if (output->buf[0])
>> +		index = 1;
>> +
>> +	output->buf[index] = vfe_buf_get_pending(output);
>> +
>> +	if (output->buf[index]) {
>> +		vfe->res->hw_ops->vfe_wm_update(vfe, output->wm_idx[0],
>> +						output->buf[index]->addr[0],
>> +						line);
>> +		vfe->res->hw_ops->reg_update(vfe, line->id);
>> +	} else
>> +		output->gen2.active_num--;
>> +
>> +	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> +
>> +	vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>> +
>> +	return;
>> +
>> +out_unlock:
>> +	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> +}
>> +
>> +int vfe_enable_output_v2(struct vfe_line *line)
>> +{
>> +	struct vfe_device *vfe = to_vfe(line);
>> +	struct vfe_output *output = &line->output;
>> +	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
>> +	struct media_entity *sensor;
>> +	unsigned long flags;
>> +	unsigned int frame_skip = 0;
>> +	unsigned int i;
>> +
>> +	sensor = camss_find_sensor(&line->subdev.entity);
>> +	if (sensor) {
>> +		struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
>> +
>> +		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
>> +		/* Max frame skip is 29 frames */
>> +		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
>> +			frame_skip = VFE_FRAME_DROP_VAL - 1;
>> +	}
>> +
>> +	spin_lock_irqsave(&vfe->output_lock, flags);
>> +
>> +	ops->reg_update_clear(vfe, line->id);
>> +
>> +	if (output->state > VFE_OUTPUT_RESERVED) {
>> +		dev_err(vfe->camss->dev,
>> +			"Output is not in reserved state %d\n",
>> +			output->state);
>> +		spin_unlock_irqrestore(&vfe->output_lock, flags);
>> +		return -EINVAL;
>> +	}
>> +
>> +	WARN_ON(output->gen2.active_num);
>> +
>> +	output->state = VFE_OUTPUT_ON;
>> +
>> +	output->sequence = 0;
>> +	output->wait_reg_update = 0;
>> +	reinit_completion(&output->reg_update);
>> +
>> +	ops->vfe_wm_start(vfe, output->wm_idx[0], line);
>> +
>> +	for (i = 0; i < 2; i++) {
>> +		output->buf[i] = vfe_buf_get_pending(output);
>> +		if (!output->buf[i])
>> +			break;
>> +		output->gen2.active_num++;
>> +		ops->vfe_wm_update(vfe, output->wm_idx[0],
>> +				   output->buf[i]->addr[0], line);
>> +		ops->reg_update(vfe, line->id);
>> +	}
>> +
>> +	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * vfe_queue_buffer_v2 - Add empty buffer
>> + * @vid: Video device structure
>> + * @buf: Buffer to be enqueued
>> + *
>> + * Add an empty buffer - depending on the current number of buffers it will be
>> + * put in pending buffer queue or directly given to the hardware to be filled.
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +int vfe_queue_buffer_v2(struct camss_video *vid,
>> +			struct camss_buffer *buf)
>> +{
>> +	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
>> +	struct vfe_device *vfe = to_vfe(line);
>> +	struct vfe_output *output;
>> +	unsigned long flags;
>> +
>> +	output = &line->output;
>> +
>> +	spin_lock_irqsave(&vfe->output_lock, flags);
>> +
>> +	if (output->state == VFE_OUTPUT_ON &&
>> +		output->gen2.active_num < 2) {
>> +		output->buf[output->gen2.active_num++] = buf;
>> +		vfe->res->hw_ops->vfe_wm_update(vfe, output->wm_idx[0],
>> +						buf->addr[0], line);
>> +		vfe->res->hw_ops->reg_update(vfe, line->id);
>> +	} else {
>> +		vfe_buf_add_pending(output, buf);
>> +	}
>> +
>> +	spin_unlock_irqrestore(&vfe->output_lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * vfe_enable_v2 - Enable streaming on VFE line
>> + * @line: VFE line
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +int vfe_enable_v2(struct vfe_line *line)
>> +{
>> +	struct vfe_device *vfe = to_vfe(line);
>> +	int ret;
>> +
>> +	mutex_lock(&vfe->stream_lock);
>> +
>> +	if (vfe->res->hw_ops->enable_irq)
>> +		vfe->res->hw_ops->enable_irq(vfe);
> 
> Right so generally speaking I don't believe we should have any null
> function pointers.
> 
> We just mandate that to be comitted, an impelmentation must provide a
> dummy but, in this case when do we ever want a dummy function anyway
> surely enable_irq() is a fundamental operation that is core to the logic.

Why? What could be a justification here?

The image capturing media pipeline for all recent Qualcomm SoCs, including
this one in the series for SM8550, can be set up and enabled without
touching VFE interrupts at all.

It might be extremely confusing to see in the code that some not ever
requested interrupts are enabled/disabled, and then to discover that just
some stubs around VFE interrupts are added. And it's the case especially
in this new vfe_enable_v2() function, which I believe is intended for
CAMSS support on new platforms.

What's worse, since these VFE interrupts are not needed on the modern
platforms, it will require to add a proposed dummy "return 0" function
into any CAMSS support for new platforms forever. I believe it'd be better
to clearly say that it's a legacy to have an obligatory support of VFE
interrupts.

> Also a style nit-pick if you get a hw_ops pointer you don't have to jump
> through so -> many -> indirection -> hoops.
> 
> Code will look neater that way.
> 
> I'll go through the vfe_enable() stuff in more detail on your next drop.
> 
> Please ensure again with the hw_version() that you have equivalent logic
> before and after => no behaviour change similarly with vfe_enable() and
> friends.
> 
> The objective is to remove code duplication, not to change logical
> behaviors at all, no matter how seemingly trival that change might be ->
> hw_version 0xsomenumber instea of 0xX, 0xY 0xZ
> 
> It probably sounds dogmatic but, its safer that way.
> 

--
Best wishes,
Vladimir

