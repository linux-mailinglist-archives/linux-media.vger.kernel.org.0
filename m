Return-Path: <linux-media+bounces-36132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB94AEBE2C
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 19:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E16411C4799E
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA072E54D5;
	Fri, 27 Jun 2025 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qh8R7gRo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477D62EA72A
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043842; cv=none; b=gIgXPmFAA+/SCKUVYa7geRyvitt0WAYsvwhxLVLK9t4VEEAfSDGYAT/pw41dHYnyILtDB0S0DkID7+MyeX3lgyFe7cMnCnMS3SOVNw3mFtZxEBBlT4/mIZpNn6mVom5Hc6RRX9mL/CpLUq1pNYM1lQXJbRPKvW1Ds/OjCMaOHpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043842; c=relaxed/simple;
	bh=HSdDzpGEZh0Z+ObhrUewY7ZjXhceaEJ5COoUxc2cJis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tf/vUP1z0zGCjJbg56LNUib1Q6JBMEwAYN+klWbfSX2XSF7p9xsl6FEh83HUGhlYAWaKNVwsHkQZ8GpM7Lqe5i67ump0Hm7ehAYVSHEoOoAXGXUiY679F80AL3giCxbUheJjJJskfCpk5uG0CQNWkTNjyWi7JygyzVJHsiQV3Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qh8R7gRo; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so1692139f8f.2
        for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751043838; x=1751648638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0lM+9jotmOVOM1lf7WJ8vyAHMjEM1wCcsIwWRjnqrk=;
        b=qh8R7gRoLMJtn8znL8iuP+5EtC9hEvibIe+YPvnaIgeM5vpRLRGSCJP2Lht2b6slpc
         jsMZbc80LDgYL7ZNF03OxgRqYkiyR1lRWhIEuLRzYd0ILxrI1XH96aKWrMI0LAj61Ivn
         kOU3M6HY4j+wVp308CByEa0ZGhSjI8WqGvnErI1QqVNWWHmK7pU8dkpcYTHjR37az02y
         TVOZZ8mV0hs3k5fMOyVi6IpBP5aIdQxTcW3+u+kYsMWHQOE82i57+A88CO3ZtBszmPhY
         YDTCMvHOgM4OCy9baWXN9xgEankQYFFIo6BrYxyaxbuWmHsGMQsvcLXnOG/vvRNrYmlW
         YAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751043838; x=1751648638;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0lM+9jotmOVOM1lf7WJ8vyAHMjEM1wCcsIwWRjnqrk=;
        b=du2jx1rBFKmGBr4UAQWuNPorm4G4rpSm4wLa9+CiRJCogvDUrun3Y3m/UMYzezwHX3
         vDtnoOWPTrx+uIDWjl5OkWndnWlPeyiSMhDD0uNaE2Vempgoml77kiY0hkPt4x1JEkWV
         t33wlyC//DPCQw0zU2gzFDi3IQPochWyUqWiD4lIN6F+QKkOrJZxHzwTEunCDCJHA8oA
         tFI0HfhQwpKXbNr5VSLaz5Nal1/mbbK7Cm46PCuiGQEyJMAuEmHajYuJgpVYx0ENIVj4
         eTUsT8M1M71/zVaJI23sFT/3aiSNGCVjxh/BvRV1bzqZjY7EVlQRXmf15dzpIaH6DFES
         x4RQ==
X-Gm-Message-State: AOJu0Yykj+L+DfgRKnvBwhwpbO5pQxAIZULBhR2Sv+I5yHFn5qic6aAi
	C9+ZySi+hPsbdwRN7Wgz7A3zABvzubBOvM0m77j/nTcr882On/bXIRPjBPSsEc7sAi8=
X-Gm-Gg: ASbGncsgQ/VxQhl2uUuIV02ysKoGrUfr63F7A0zbE0JTDyApKjAj6S0u8dmfbTcUU1o
	AV6qpB+ePbnjdFPcuJAllNDP1Nba5zvN5mzCUZ0ME3odtJZS9ion2Ptj5US1AEZ9pJyp+c+pWxA
	JuqwkwIuIfyYSTmT1z68o4qZBEDBck1MRShDPijsB9PRlhJ7ubd6lyegfjTvuGPXze8hIECRFEV
	CVNrsuj6+hBXJfMmgnqIkBE540MgrWq6sVL+EdWl2KJWk2W/K7Dn5Q1IaRAcF2QUeYgzBrPAYwU
	gPUZH5TY2+sFFArsfMLkOQgwoaNU27rD3QVYzm4TLVHPwhZqjteoJU2SkP/DhJ5ZRZ9WV46AAgY
	42peEsllVLZYaT+1KYbtzb/2FYVM=
X-Google-Smtp-Source: AGHT+IEQnYHLVvvRdo07ECuZNx96gkoirCSuaogNuBRIDfH0KzcTC9kqZQWgGcTR8Zpls8/g0XN7fg==
X-Received: by 2002:a05:6000:481c:b0:3a6:f2a7:d0bb with SMTP id ffacd0b85a97d-3a90d0d6cd6mr3642010f8f.12.1751043838332;
        Fri, 27 Jun 2025 10:03:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm57074825e9.27.2025.06.27.10.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:03:57 -0700 (PDT)
Message-ID: <ebdbb517-ffa2-422a-989e-a4f19ab0163a@linaro.org>
Date: Fri, 27 Jun 2025 18:03:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: iris: use np_dev as preferred DMA device in
 HFI queue management
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-3-51e18c0ffbce@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250627-video_cb-v3-3-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 16:48, Vikash Garodia wrote:
> Update HFI interface queues to use np_dev(preferred non-pixel device)
> for DMA memory allocation and deallocation if available. This allows
> platforms with separate DMA domain for non-pixel to use the appropriate
> device handle when managing HFI queues and SFR regions.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index fac7df0c4d1aec647aeca275ab19651c9ba23733..a31ebe947f525f0d7c09f8b786939d01b62532c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -247,24 +247,27 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
>   int iris_hfi_queues_init(struct iris_core *core)
>   {
>   	struct iris_hfi_queue_table_header *q_tbl_hdr;
> +	struct device *dev;
>   	u32 queue_size;
>   
> +	dev = core->np_dev ? core->np_dev : core->dev;
> +

dev = core->dev;
if (core->np_dev)
     dev = core->np_dev;

Is much easier to read.

>   	/* Iris hardware requires 4K queue alignment */
>   	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
> -	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
> +	core->iface_q_table_vaddr = dma_alloc_attrs(dev, queue_size,
>   						    &core->iface_q_table_daddr,
>   						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>   	if (!core->iface_q_table_vaddr) {
> -		dev_err(core->dev, "queues alloc and map failed\n");
> +		dev_err(dev, "queues alloc and map failed\n");
>   		return -ENOMEM;
>   	}
>   
> -	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
> +	core->sfr_vaddr = dma_alloc_attrs(dev, SFR_SIZE,
>   					  &core->sfr_daddr,
>   					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>   	if (!core->sfr_vaddr) {
> -		dev_err(core->dev, "sfr alloc and map failed\n");
> -		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
> +		dev_err(dev, "sfr alloc and map failed\n");
> +		dma_free_attrs(dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
>   			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
>   		return -ENOMEM;
>   	}
> @@ -292,6 +295,7 @@ int iris_hfi_queues_init(struct iris_core *core)
>   
>   void iris_hfi_queues_deinit(struct iris_core *core)
>   {
> +	struct device *dev;
>   	u32 queue_size;
>   
>   	if (!core->iface_q_table_vaddr)
> @@ -301,7 +305,9 @@ void iris_hfi_queues_deinit(struct iris_core *core)
>   	iris_hfi_queue_deinit(&core->message_queue);
>   	iris_hfi_queue_deinit(&core->command_queue);
>   
> -	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
> +	dev = core->np_dev ? core->np_dev : core->dev;

and again

> +
> +	dma_free_attrs(dev, SFR_SIZE, core->sfr_vaddr,
>   		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
>   
>   	core->sfr_vaddr = NULL;
> @@ -310,7 +316,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
>   	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
>   		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
>   
> -	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
> +	dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
>   		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
>   
>   	core->iface_q_table_vaddr = NULL;
> 
Other than that.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


