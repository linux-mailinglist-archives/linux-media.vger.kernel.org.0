Return-Path: <linux-media+bounces-24142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC19FDAB1
	for <lists+linux-media@lfdr.de>; Sat, 28 Dec 2024 14:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75A0B3A1351
	for <lists+linux-media@lfdr.de>; Sat, 28 Dec 2024 13:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9965915B551;
	Sat, 28 Dec 2024 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxF5Uk1F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E79C8DF;
	Sat, 28 Dec 2024 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735392825; cv=none; b=Vp2pqXxJZWl2dMhsYZ4wOjtWrbSWRhLFQEhER67htqrBbueOdvSSsdEXL6qjtxQZW+7sQNz+UeXuOcAZDR8ftwigyehG75ScIZ6fffAFLZN+gdX7KQgklur4WN6of7a6sDj15Q28KlEqccKU6ovXVhbX2JnfVLeBHMDvsCQysZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735392825; c=relaxed/simple;
	bh=lpzmd5qgYbWzXDpiz51Kh68H/esSJWBky5nNUUWLAF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1rUKFCOM16ap29TY/dX2oUWWprLngwKzBH7hrxoxdmb+mYmcH6fTGXcVRoN4Pweqlq8iRM69fPxZIybxIPCY/8bBihaYRDIbmWIiQZUqUg5DcUC6FlOl+cx3Lb2KiUYGschXFM6k67VWt9LbYsMdyHufkM2Nmr3NpVT+ttd1nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxF5Uk1F; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385de9f789cso5964870f8f.2;
        Sat, 28 Dec 2024 05:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735392821; x=1735997621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGqAPkuHxLCasbPRd/+RCIFy7P37ySBYkC1/IthMi0g=;
        b=RxF5Uk1FdVQkL2/c8qsu5o8DJ+vWJCzayCHLlurgKndmuO1Zzl0/8w7PAq2nqIc6o6
         67juW8FjO+AFA22D4PcMp900ZJUdJJzy1Ol816bseA9RIXDabWlAH/FvfiXVH4IqOAY3
         QHUGGEZwWEo3w8UkbQVeoU1ePyRlUiJf4jx+6+SQ95GtCxsL32mD7EUU20vxjZsPfdqF
         102xijqh1D+M72XBrhFadeUEZ+EEFhw+jxeLCRdjZG1i5UI42HM7ynvdhGoKQAh5/Sw7
         XJL6VBRbDy5R02okBZ135jLIOxb50hhIoF8IgAgDojATmScikW08wP0SkZ8PnEzHoAWO
         8Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735392821; x=1735997621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGqAPkuHxLCasbPRd/+RCIFy7P37ySBYkC1/IthMi0g=;
        b=LlmZ0ETox5E6yHkvovUTdyyU0AddqQJGmJQBuMkkv950UOFaU2GCePHeG/Zix5LPEV
         DSujz/zfpGVZ7jZfJMKmiqHv7yYTZNC9kx9pU1DINcVd7LBcwKSTBO+iPA/GJHW6gMdC
         syYzLbN6PHpO3nRtkZrc8WNHJE6NpXKarQ4AFxACoOQhk+dAV+CUDIms3sTU/rAs4/C3
         s1H2GjZNpcT3f5T9B8dB7By8I5Hr1bowrMj1YXS3K8bHnMNK1mKcGhEXK0CDLZkUo5vU
         z8D5065iCnDNSqOQAP9CccWEs7WkkaV0Geply0kHBrs/3nECJnzRaccUxgXN9dzz2z6K
         pvcw==
X-Forwarded-Encrypted: i=1; AJvYcCUxIybqG+ctmLIXb2uFh+F3j/cAyvhLqMCmobqw0yI6wnOBPWjI2jfO3wNf5Ory0m7spu+9jw7JklfJACu3Og==@vger.kernel.org, AJvYcCV3pFxVwB94eBeNl8jWdrinDq7OOejXfHH7vXKq8FnLSKsXFtJYLNoXeXsZtWB/h5emYiBK0UWJsbvGsJ4=@vger.kernel.org, AJvYcCWHAtUdmVFJCuVSgnuNM8awih9mN6DsUqCZ2wr1v452r0fv+TfwG6lhH65xbFINUKwgbZICPQu4BcdoLDEZ@vger.kernel.org, AJvYcCXqTnCC00k26zmvvsiyZKnJpqITng20WSh4o6cK99NiTqfOiElb5OmUD/3t0t6P9+iCS8esWiPta6DH@vger.kernel.org
X-Gm-Message-State: AOJu0YxHQq5XvUeU0vrvUjjFPb+aCq03t31wePyQuNOxeZjrAn+VDi+M
	cRQ8jcQwa8sklhJsQY9DET6OoZXwe5qzeEZN6ehK9eld2Lsfo35F
X-Gm-Gg: ASbGnct/GZqrCvW8dtjp8jJaQXL8spRg0FBGAVJ2s3C6IsR/jm+LiIhAx1SSY4BhF7b
	3wy63X4KFB8KBuEVpCbmpZbtd8vUYX/Q8NaNGD3MDZ9Ms+tYCI3OqWHtHbQxp9omB9cc4bPvCza
	azGve262GmJZjRdBsA9qW+yF8auFTa/99US8wPYlI761Zhw90vOIS9QiDQSE3krjsHpyEe7ZRyt
	FoU66o8LLnRVxcfqPMFAsakoIjC+/RlqLrGKwAclKCpeqik9udWiYafqlM+3H3iwbzAAlXsng==
X-Google-Smtp-Source: AGHT+IHM8j1PH8EZy4GV+extmbmALyusaNgkpayRkYfRnQKStltS1QaoxKfvEx0dKXojXNCBt+7Apg==
X-Received: by 2002:adf:ab09:0:b0:38a:4184:1520 with SMTP id ffacd0b85a97d-38a418416bdmr8493579f8f.27.1735392821060;
        Sat, 28 Dec 2024 05:33:41 -0800 (PST)
Received: from [192.168.100.6] ([87.97.240.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847714sm25131265f8f.54.2024.12.28.05.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 05:33:40 -0800 (PST)
Message-ID: <504ff336-3b11-4331-b2b6-86289b17ffd3@gmail.com>
Date: Sat, 28 Dec 2024 15:33:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] media: venus: Add support for static video
 encoder/decoder declarations
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-1-ef7e5f85f302@linaro.org>
Content-Language: en-US, bg-BG
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-1-ef7e5f85f302@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bryan,

Thank for your work !

On 9.12.24 г. 13:52 ч., Bryan O'Donoghue wrote:
> Add resource structure data and probe() logic to support static
> declarations of encoder and decoder.
> 
> Right now we rely on video encoder/decoder selection happening in the dtb
> but, this goes against the remit of device tree which is supposed to
> describe hardware, not select functional logic in Linux drivers.
> 
> Provide two strings in the venus resource structure enc_nodename and
> dec_nodename.
> 
> When set the venus driver will create an OF entry in-memory consistent
> with:
> 
> dec_nodename {
>      compat = "video-decoder";
> };
> 
> and/or
> 
> enc_nodename {
>      compat = "video-encoder";
> };
> 
> This will allow us to reuse the existing driver scheme of relying on compat
> names maintaining compatibility with old dtb files.
> 
> dec_nodename can be "video-decoder" or "video0"
> enc_nodename can be "video-encoder" or "video1"
> 
> This change relies on of_changeset() API as a result select OF_DYNAMIC will
> be added to venus/Kconfig
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/Kconfig |  1 +
>   drivers/media/platform/qcom/venus/core.c  | 94 ++++++++++++++++++++++++++++++-
>   drivers/media/platform/qcom/venus/core.h  |  4 ++
>   3 files changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
> index bfd50e8f34219db8a1de7960d7ea93b20db2982a..bc2e410b29cb415a36540a4f98709eae44f4ec35 100644
> --- a/drivers/media/platform/qcom/venus/Kconfig
> +++ b/drivers/media/platform/qcom/venus/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_QCOM_VENUS
>   	depends on V4L_MEM2MEM_DRIVERS
>   	depends on VIDEO_DEV && QCOM_SMEM
>   	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +	select OF_DYNAMIC if ARCH_QCOM
>   	select QCOM_MDT_LOADER if ARCH_QCOM
>   	select QCOM_SCM
>   	select VIDEOBUF2_DMA_CONTIG
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 4e26b18790537885a77d66c1917a4e7a146eaf57..88dfa9f240dc6d18a7f58dc06b1bf10274b7121e 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -286,6 +286,89 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
>   	return ret;
>   }
>   
> +#if defined(CONFIG_OF_DYNAMIC)
> +static int venus_add_video_core(struct venus_core *core, const char *node_name,
> +				const char *compat)
> +{
> +	struct of_changeset *ocs = core->ocs;
> +	struct device *dev = core->dev;
> +	struct device_node *np, *enp;
> +	int ret;
> +
> +	if (!node_name)
> +		return 0;
> +
> +	enp = of_find_node_by_name(dev->of_node, node_name);
> +	if (enp) {
> +		of_node_put(enp);
> +		return 0;
> +	}
> +
> +	np = of_changeset_create_node(ocs, dev->of_node, node_name);
> +	if (!np) {
> +		dev_err(dev, "Unable to create new node\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = of_changeset_add_prop_string(ocs, np, "compatible", compat);
> +	if (ret)
> +		dev_err(dev, "unable to add %s\n", compat);
> +
> +	of_node_put(np);
> +
> +	return ret;
> +}
> +
> +static int venus_add_dynamic_nodes(struct venus_core *core)
> +{
> +	struct device *dev = core->dev;
> +	int ret;
> +
> +	core->ocs = kmalloc(sizeof(*core->ocs), GFP_KERNEL);
> +	if (!core->ocs)
> +		return -ENOMEM;
> +
> +	of_changeset_init(core->ocs);
> +
> +	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder");
> +	if (ret)
> +		goto err;
> +
> +	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder");
> +	if (ret)
> +		goto err;
> +
> +	ret = of_changeset_apply(core->ocs);
> +	if (ret) {
> +		dev_err(dev, "applying changeset fail ret %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	of_changeset_destroy(core->ocs);
> +	kfree(core->ocs);
> +	core->ocs = NULL;
> +	return ret;
> +}
> +
> +static void venus_remove_dynamic_nodes(struct venus_core *core)
> +{
> +	if (core->ocs) {
> +		of_changeset_revert(core->ocs);
> +		of_changeset_destroy(core->ocs);
> +		kfree(core->ocs);
> +	}
> +}
> +#else
> +static int venus_add_dynamic_nodes(struct venus_core *core)
> +{
> +	return 0;
> +}
> +
> +static void venus_remove_dynamic_nodes(struct venus_core *core) {}
> +#endif
> +
>   static int venus_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -365,9 +448,14 @@ static int venus_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_runtime_disable;
>   
> +	if (core->res->dec_nodename || core->res->enc_nodename) {
> +		if (venus_add_dynamic_nodes(core))

It'd be good to pass the error code to the upper layer.

> +			goto err_runtime_disable;
> +	}
> +
>   	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>   	if (ret)
> -		goto err_runtime_disable;
> +		goto err_remove_dynamic_nodes;
>   
>   	ret = venus_firmware_init(core);
>   	if (ret)
> @@ -411,6 +499,8 @@ static int venus_probe(struct platform_device *pdev)
>   	venus_firmware_deinit(core);
>   err_of_depopulate:
>   	of_platform_depopulate(dev);
> +err_remove_dynamic_nodes:
> +	venus_remove_dynamic_nodes(core);
>   err_runtime_disable:
>   	pm_runtime_put_noidle(dev);
>   	pm_runtime_disable(dev);
> @@ -443,6 +533,8 @@ static void venus_remove(struct platform_device *pdev)
>   
>   	venus_firmware_deinit(core);
>   
> +	venus_remove_dynamic_nodes(core);
> +
>   	pm_runtime_put_sync(dev);
>   	pm_runtime_disable(dev);
>   
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 27784fd7082c321222b23ca4b2902a04c49e19ca..306231b4f7d0201175974b4a42574f30d23e08f0 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -90,6 +90,8 @@ struct venus_resources {
>   	u32 cp_nonpixel_start;
>   	u32 cp_nonpixel_size;
>   	const char *fwname;
> +	const char *enc_nodename;
> +	const char *dec_nodename;
>   };
>   
>   enum venus_fmt {
> @@ -171,6 +173,7 @@ struct venus_format {
>    * @root:	debugfs root directory
>    * @venus_ver:	the venus firmware version
>    * @dump_core:	a flag indicating that a core dump is required
> + * @ocs:	OF changeset pointer
>    */
>   struct venus_core {
>   	void __iomem *base;
> @@ -235,6 +238,7 @@ struct venus_core {
>   		u32 rev;
>   	} venus_ver;
>   	unsigned long dump_core;
> +	struct of_changeset *ocs;
>   };
>   
>   struct vdec_controls {
> 

-- 
regards,
Stan

