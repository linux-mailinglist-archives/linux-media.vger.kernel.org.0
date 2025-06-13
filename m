Return-Path: <linux-media+bounces-34763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FE2AD8F60
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EA6218895A6
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621212E11D8;
	Fri, 13 Jun 2025 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lX1GG0WR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3E23B7A3
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824287; cv=none; b=daRjFP8vnEjzXbPBxQQH/qwNnonbjQe/D0l5v8JNrAG6JUgW3pT2tVhAUE2gwpKBft9oTZjNSwqJKo7A6kaa86FQXxtgw7tQlNg6Dp8yV8hr4NrpA8TisdCt2ja+Cxn+/x4hKYKBPY1MCEOZuP3C9xA1br3esTQkgNwD5ljIIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824287; c=relaxed/simple;
	bh=aTwKC5PaaUbql60OMbbUf8hgpstxdX0AQSH1TroF0gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvXJ4uWqKidrkMaOh+ZcGiz0QZ34+mcEHjesHKjtE+YFz8gKCyfx2pm+/rBBeIcqL2jTWTqnM8A+B9VZ/u6dRHJeQ/ftONK0N/QH1RSlGyqYTkxCj81WkPJhb0prev5R8/9Pj8O+npMBZGE19lgIyJu1ppyy0qL0drzE69aMXzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lX1GG0WR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so1340772f8f.1
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749824284; x=1750429084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSjG8m5KkDiBMnjvl7kRN1iOIpYhfix87VyRx8+5CRk=;
        b=lX1GG0WRvBgg0rcP2xALzM8xCeAuC2fxNMYN3Yhyg1dxnLoVtdaavHjN1NOx85MNsV
         d76ci8uutnsxvLbdFgvjxzgrA0kmGWE8dtlJnlw62nX6cO/6AS0tpkWq1CN8yzBlhhOx
         lr1bZI1lFquZycO/sBiPI4ZvCByQlMJp3ndrroIPM4+XSqzNfrUAD7fAamrnSePanN4S
         tlTYm6BCJyyFu6QDrYiTKgdS2OsrH51Bau1qqivVOtIWT+v5aXBGsQUNC/TqQsvg6SP4
         30CX/p32E2ZWnWH72IWCM1JVvuaqel8Lxeya4poph4h3/0TjhA5nS57LH8t0GI6jlEMr
         NlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824284; x=1750429084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSjG8m5KkDiBMnjvl7kRN1iOIpYhfix87VyRx8+5CRk=;
        b=OaPrW+nCBkTgIF4NyHIbljulupku7LBkYeu9D6A8FjJgoAcT2m/eRCGbiLsbq9UL/g
         yu6dUWXj+gtCRhKiiXfWG1JeajaQmJX6v1s3flFnJu5MYcX8MgZDc+0dBtxMYWT4GcUZ
         7WechIAYi6gMOC3gfHK19VFdVTo/S7QpXbzV2LH8OvKVF6lACJSzmIMurmhhIqVSdQf3
         WKSfA/2eyA/wLDMhtV5u16pgVNkAPn/ESbaKDXkgXGYT17SUj4dTKdQJLS0IRsqBneIS
         M0dHpXd4wpSMyrF8ix/aqabsL4oKNjt1sXcmbnHR79szU3Qoqm04oANwvdXE4ubop+/A
         fYlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6GMyn96UrCtqI93aoLCn0EvhvjRuV8vIN4wEQL0tnn3j798crJNzXYUS4BViEnf73gHSiQPU4Mulgww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG43zdnFYXriLHgHwhaSQ1X8Tmrl03nWa5NLxFipkI2Y71lSqQ
	l6y5IdJ/VGpXXSqw+V/OcQ9SMoOw01pzDOafWOK4z27DKLElTrd1nEe7yUSxUdWjQ5E=
X-Gm-Gg: ASbGnct+Juk/4l4unZICYU0oqMsJXyjbCh0umSZWPIHZ4U18Viw44uQesyxt7QVNSv7
	EWG7PF2+LQLOHDyG6Sn+t0c7ZzEuArvki7Vqu1Yb1ItUxfEvdpMSr8mfk9831Okm+LE8B3SEKOS
	KZlOwHYt+lpFauTnmwm1Vykmw8NTXTx0lCIYyApuVQvHoJKnuobgXfMDvJcf2cDH2fWsNr3IKAw
	vvDSMt4RKGeiWUyh3HutTDCl6NNvJ7oTRWUDMtgnnxj4cuzgs+qoL79xOd+lvNRqOCmh7yRglR6
	R3m4EWMT3aK7B3oFTDay/Iko7D5nJVBNxS6bt4eNDnZt/8cI6KTIQowYW92vmBpcgC02ylTCAEV
	tdlF67Q9mHlSprnswavFryzP+BNA=
X-Google-Smtp-Source: AGHT+IFb59DRBOBZxt1eIWkuQvOPb9HQtPCBxxONhagyQy6CCefSZghXRNl30sztPBB5ldHVrafwgw==
X-Received: by 2002:a05:6000:1889:b0:3a4:ea1f:3534 with SMTP id ffacd0b85a97d-3a5686e4504mr2762355f8f.5.1749824283601;
        Fri, 13 Jun 2025 07:18:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a543d9sm2495305f8f.5.2025.06.13.07.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:18:03 -0700 (PDT)
Message-ID: <c8c31c62-ffb8-4b15-b3f1-6ecfec7a7c1a@linaro.org>
Date: Fri, 13 Jun 2025 15:18:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] media: venus: vdec: ar50_lite video core support
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-4-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250613140402.3619465-4-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 15:04, Jorge Ramirez-Ortiz wrote:
> The AR50_LITE is a streamlined variant of the AR50 video core, designed
> for power and cost-efficient platforms.
> 
> It supports hardware-accelerated decoding of H.264, HEVC, and VP9
> formats.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c      | 11 ++-
>   drivers/media/platform/qcom/venus/core.h      |  5 +-
>   drivers/media/platform/qcom/venus/firmware.c  |  8 +-
>   drivers/media/platform/qcom/venus/helpers.c   | 81 +++++++++++++++++++
>   drivers/media/platform/qcom/venus/helpers.h   |  2 +
>   .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
>   drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++--
>   .../media/platform/qcom/venus/pm_helpers.c    |  1 +
>   drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
>   9 files changed, 123 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152..736ef53d988d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
>   
>   static void venus_assign_register_offsets(struct venus_core *core)
>   {
> -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> -		core->vbif_base = core->base + VBIF_BASE;
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {

Is there a property that IS_IRIS_2_1 || IS_AR50_LITE that we could use 
instead of expanding this IS_THING list ?


>   		core->cpu_base = core->base + CPU_BASE_V6;
>   		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
>   		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
>   		core->wrapper_base = core->base + WRAPPER_BASE_V6;
>   		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
> -		core->aon_base = core->base + AON_BASE_V6;
> +		if (IS_AR50_LITE(core)) {
> +			core->vbif_base = NULL;
> +			core->aon_base = NULL;
> +		} else {
> +			core->vbif_base = core->base + VBIF_BASE;
> +			core->aon_base = core->base + AON_BASE_V6;
> +		}
>   	} else {
>   		core->vbif_base = core->base + VBIF_BASE;
>   		core->cpu_base = core->base + CPU_BASE;
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index b412e0c5515a..122441f9600a 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -382,6 +382,7 @@ enum venus_inst_modes {
>    * @lock:	instance lock
>    * @core:	a reference to the core struct
>    * @clk_data:	clock data per core ID
> + * @eosbufs:	a lit of EOS buffers
>    * @dpbbufs:	a list of decoded picture buffers
>    * @internalbufs:	a list of internal bufferes
>    * @registeredbufs:	a list of registered capture bufferes
> @@ -450,6 +451,7 @@ struct venus_inst {
>   	struct mutex lock;
>   	struct venus_core *core;
>   	struct clock_data clk_data;
> +	struct list_head eosbufs;
>   	struct list_head dpbbufs;
>   	struct list_head internalbufs;
>   	struct list_head registeredbufs;
> @@ -520,7 +522,8 @@ struct venus_inst {
>   #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
>   #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
>   #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
> -#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
> +#define IS_V6(core)     (((core)->res->hfi_version == HFI_VERSION_6XX) || \
> +			 ((core)->res->hfi_version == HFI_VERSION_6XX_LITE))
>   
>   #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
>   #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 66a18830e66d..f8dcef0426ac 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
>   	u32 fw_size = core->fw.mapped_mem_size;
>   	void __iomem *wrapper_base;
>   
> -	if (IS_IRIS2_1(core))
> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core))

For example here.

>   		wrapper_base = core->wrapper_tz_base;
>   	else
>   		wrapper_base = core->wrapper_base;
> @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
>   	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
>   	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
>   
> -	if (IS_IRIS2_1(core)) {
> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>   		/* Bring XTSS out of reset */
>   		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
>   	} else {
> @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>   	if (resume) {
>   		venus_reset_cpu(core);
>   	} else {
> -		if (IS_IRIS2_1(core))
> +		if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
>   			writel(WRAPPER_XTSS_SW_RESET_BIT,
>   			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>   		else
> @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>   	void __iomem *wrapper_base = core->wrapper_base;
>   	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
>   
> -	if (IS_IRIS2_1(core)) {
> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>   		/* Assert the reset to XTSS */
>   		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>   		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 8295542e1a7c..ae89369c6a07 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -230,6 +230,80 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
>   }
>   EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
>   
> +static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
> +{
> +	list_del_init(&buf->list);
> +	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
> +		       buf->attrs);
> +	kfree(buf);
> +}
> +
> +int venus_helper_free_eos_bufs(struct venus_inst *inst)
> +{
> +	struct intbuf *buf, *n;
> +
> +	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
> +		free_eos_buf(inst, buf);
> +	}
> +
> +	if (list_empty(&inst->eosbufs))
> +		INIT_LIST_HEAD(&inst->eosbufs);
> +
> +	return 0;
> +
> +}
> +EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);

These EOS buf things look like they are not specific to ar50, could you 
add these in a preceding patch to this ?

> +
> +int venus_helper_alloc_eos_buf(struct venus_inst *inst,
> +			       struct hfi_frame_data *data)
> +{
> +	struct venus_core *core = inst->core;
> +	struct device *dev = core->dev;
> +	struct intbuf *buf;
> +	int ret = 0;
> +
> +	memset(data, 0, sizeof(*data));
> +
> +	data->buffer_type = HFI_BUFFER_INPUT;
> +	data->flags = HFI_BUFFERFLAG_EOS;
> +
> +	if (IS_AR50_LITE(inst->core)) {
> +		/* We must send valid sizes and addresses */
> +		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +		if (!buf) {
> +			ret = -ENOMEM;
> +			goto fail;
> +		}
> +
> +		buf->type = HFI_BUFFER_INPUT;
> +		buf->size = SZ_4K;
> +		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> +		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
> +					  buf->attrs);
> +		if (!buf->va) {
> +			ret = -ENOMEM;
> +			goto fail;
> +		}
> +
> +		list_add_tail(&buf->list, &inst->eosbufs);
> +
> +		data->alloc_len = buf->size;
> +		data->device_addr = buf->da;
> +
> +	} else if (IS_V6(inst->core) &&
> +		   is_fw_rev_or_older(inst->core, 1, 0, 87)) {
> +		data->device_addr = 0;
> +	} else {
> +		data->device_addr = 0xdeadb000;
> +	}
> +
> +	return 0;
> +fail:
> +	kfree(buf);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(venus_helper_alloc_eos_buf);

I think the series would be nicer if the EOS buf decomposition stuff 
went into a patch that preceded this one, and then you add the 
IS_AR50_LITE() in the next patch progressively.

> +
>   static int intbufs_set_buffer(struct venus_inst *inst, u32 type)
>   {
>   	struct venus_core *core = inst->core;
> @@ -630,6 +704,13 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
>   	if (!hfi_plat || !hfi_plat->bufreq)
>   		return -EINVAL;
>   
> +	/* Firmware buffer requirements for internal buffers only */
> +	if (IS_AR50_LITE(inst->core))
> +		if ((buftype != HFI_BUFFER_INPUT) &&
> +		    (buftype != HFI_BUFFER_OUTPUT) &&
> +		    (buftype != HFI_BUFFER_OUTPUT2))
> +			return -EINVAL;
> +
>   	params.version = version;
>   	params.num_vpp_pipes = inst->core->res->num_vpp_pipes;
>   
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index 358e4f39c9c0..bf55fe3b8747 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -58,6 +58,8 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
>   bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt);
>   int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
>   int venus_helper_free_dpb_bufs(struct venus_inst *inst);
> +int venus_helper_alloc_eos_buf(struct venus_inst *inst, struct hfi_frame_data *data);
> +int venus_helper_free_eos_bufs(struct venus_inst *inst);
>   int venus_helper_intbufs_alloc(struct venus_inst *inst);
>   int venus_helper_intbufs_free(struct venus_inst *inst);
>   int venus_helper_intbufs_realloc(struct venus_inst *inst);
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index f44059f19505..128ddf8e3cd5 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -397,13 +397,16 @@
>   #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
>   #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
>   	(((ver) == HFI_VERSION_4XX ||		\
> -	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
> +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> +	? 0x6 : 0x1000001)
>   #define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
>   	(((ver) == HFI_VERSION_4XX ||		\
> -	(ver) == HFI_VERSION_6XX) ? 0x7 : 0x1000005)
> +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> +	? 0x7 : 0x1000005)
>   #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
>   	(((ver) == HFI_VERSION_4XX ||		\
> -	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
> +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> +	? 0x8 : 0x1000006)
>   #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
>   	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
>   #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
> @@ -561,6 +564,7 @@ enum hfi_version {
>   	HFI_VERSION_3XX,
>   	HFI_VERSION_4XX,
>   	HFI_VERSION_6XX,
> +	HFI_VERSION_6XX_LITE,
>   };
>   
>   struct hfi_buffer_info {
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index b5f2ea879950..302776bf8fe6 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -497,7 +497,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
>   	if (count >= max_tries)
>   		ret = -ETIMEDOUT;
>   
> -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core)) {
>   		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
>   		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
>   	}
> @@ -565,6 +565,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
>   	u32 mask_val;
>   	int ret;
>   
> +	if (IS_AR50_LITE(hdev->core))
> +		return 0;
> +
>   	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
>   		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
>   
> @@ -1134,7 +1137,8 @@ static irqreturn_t venus_isr(struct venus_core *core)
>   	wrapper_base = hdev->core->wrapper_base;
>   
>   	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
> -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> +
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>   		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
>   		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
>   		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
> @@ -1146,7 +1150,7 @@ static irqreturn_t venus_isr(struct venus_core *core)
>   			hdev->irq_status = status;
>   	}
>   	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
> -	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
> +	if (!(IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)))
>   		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
>   
>   	return IRQ_WAKE_THREAD;
> @@ -1531,7 +1535,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
>   	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
>   	u32 ctrl_status, cpu_status;
>   
> -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
>   		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
>   	else
>   		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> @@ -1551,7 +1555,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
>   	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
>   	u32 ctrl_status, cpu_status;
>   
> -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
>   		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
>   	else
>   		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 409aa9bd0b5d..5d9dfe3fd043 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -1168,6 +1168,7 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
>   		return &pm_ops_v3;
>   	case HFI_VERSION_4XX:
>   	case HFI_VERSION_6XX:
> +	case HFI_VERSION_6XX_LITE:
>   		return &pm_ops_v4;
>   	}
>   
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 99ce5fd41577..87c7901b280e 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -550,7 +550,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>   {
>   	struct venus_inst *inst = to_inst(file);
>   	struct vb2_queue *dst_vq;
> -	struct hfi_frame_data fdata = {0};
> +	struct hfi_frame_data fdata;
>   	int ret;
>   
>   	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
> @@ -561,18 +561,15 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>   
>   	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
>   		/*
> -		 * Implement V4L2_DEC_CMD_STOP by enqueue an empty buffer on
> +		 * Implement V4L2_DEC_CMD_STOP by enqueue a buffer on
>   		 * decoder input to signal EOS.
>   		 */
>   		if (!(inst->streamon_out && inst->streamon_cap))
>   			goto unlock;
>   
> -		fdata.buffer_type = HFI_BUFFER_INPUT;
> -		fdata.flags |= HFI_BUFFERFLAG_EOS;
> -		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> -			fdata.device_addr = 0;
> -		else
> -			fdata.device_addr = 0xdeadb000;
> +		ret = venus_helper_alloc_eos_buf(inst, &fdata);
> +		if (ret)
> +			goto unlock;
>   
>   		ret = hfi_session_process_buf(inst, &fdata);
>   
> @@ -1332,6 +1329,7 @@ static void vdec_session_release(struct venus_inst *inst)
>   		hfi_session_abort(inst);
>   
>   	venus_helper_free_dpb_bufs(inst);
> +	venus_helper_free_eos_bufs(inst);
>   	venus_pm_load_scale(inst);
>   	INIT_LIST_HEAD(&inst->registeredbufs);
>   	mutex_unlock(&inst->lock);
> @@ -1682,6 +1680,7 @@ static int vdec_open(struct file *file)
>   	if (!inst)
>   		return -ENOMEM;
>   
> +	INIT_LIST_HEAD(&inst->eosbufs);
>   	INIT_LIST_HEAD(&inst->dpbbufs);
>   	INIT_LIST_HEAD(&inst->registeredbufs);
>   	INIT_LIST_HEAD(&inst->internalbufs);
Otherwise LGTM.

---
bod


