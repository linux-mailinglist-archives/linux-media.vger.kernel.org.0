Return-Path: <linux-media+bounces-17688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5378C96DA2C
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 15:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 355441C2482A
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E24C19D8BD;
	Thu,  5 Sep 2024 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FzorSRGw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1779E19D07C
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725542592; cv=none; b=JJeqKbPTZ/rTES9WSeVxLS6vXGT1qaFnBqJebsrg/jlFj6id5fpTlL0ta363HQsLTArWiV9QV/LGsHAFw84273v3uE+e1TTCCDtK4Kml9ZTXWGz1xDTlqPSp4dEnms7otL4yJx3MMZ5v9nRC33LS8NKdrDzh9ginSRrx4sYXAc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725542592; c=relaxed/simple;
	bh=Mj9PU2QoHoSbYwrwzSY+6yfEp8iTEUw/FcslPVouPrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GS+bGCRSgasNjaiEmbRASv5Y5JVxFflUuBn8tzLGCxDJNvOEDIlPUGwhFQxmYpmUE9/BxtsnxjE30uE5lKVdFSHPYHPWXrXQM//AqcEmLyeIP1XolP5Fworkk3Dbmc93gWEo2g2rMR9urRPSTYIDv2UZKimyOHJLADsaToDIC7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FzorSRGw; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53655b9bbcdso117978e87.2
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725542587; x=1726147387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElqSKy6HqJaZaBqUzYzWj29H5ual70iLjInHlVaSsmA=;
        b=FzorSRGwKlHGuGfTxStZI/gNpjyxcPzpaAfYhZROOgAVxXcieP2YKrEVYST4LwMuD8
         CaPQRasYJke5gaR3VT9yOMfhdLmDaON6wwyeR6sXtXIQyIBHWstCVgyeG5cpPMXsmUk3
         o5pJ209Zw0z4TBfdwzQ4ITpPSCCGf3+0ZQrF9tVsmTgMSWKJzLuq+xN+fQfrgdME5FJc
         VZU586RaSkzpyDbz+h3E1C9QKelooE1Ma5G9LSXHNX8h2K8KHQ9JWTVJp2jJ6gHbeMgb
         RUEs0sjGTifedQkTCtDFqcV2djuBqUx+pTZqCWShQFWnrWBblC8n8rMICjlwZlWLi8oS
         jAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725542587; x=1726147387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElqSKy6HqJaZaBqUzYzWj29H5ual70iLjInHlVaSsmA=;
        b=lEjFx4xrMUtUgYnFAUmd+THYAM8hfEUNEs/9pfAmv2ZVk6Z6LzfmMNhjblJc5LaqcI
         b+zsJdCmDg2Uwt13Eqk7PcRSWE/Y5b9at/dh3JuEbNlknlttjk47F8gOxPfU+iPO2UGQ
         4SWy+bqh2quuZ4FTlir0rHhuT8h8hCfW1WoadbAqWjQfyC9qhvtl91V15VohWpUYMJHr
         NNsMHlAjgEIsUKqAoiFT+rnqa3r7Zd77fnW2WoYE1Ti7nCEHOptDL3Unh/cCjqZwaCOE
         Au/XRpNrRii8esnLQnYhBd4nRi64FMElvwtobC2/4pBLS4smLwARa0E/uQ2AwGCqUm19
         /8ug==
X-Gm-Message-State: AOJu0YzQf82Z5vWxveqo1+CUapPrNuTNlKejFink+zWA8ooqUiUrkPz1
	lP5xekN8oV21l1hlg/OnlvcRFXBY7YESmlxLD9YlSpAaZs4PB+f4My3ccX/NQnk=
X-Google-Smtp-Source: AGHT+IFx/1F+XLeJtujWit9fVqWsYRGForXMY4umebpznCJSmeQWso4k1SK2ndlau8h13AmsmywkeA==
X-Received: by 2002:a05:6512:3511:b0:535:6033:265f with SMTP id 2adb3069b0e04-53560332dc8mr5106071e87.58.1725542587049;
        Thu, 05 Sep 2024 06:23:07 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a61fbad9dsm136611466b.31.2024.09.05.06.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 06:23:06 -0700 (PDT)
Message-ID: <d3679f2f-f177-494e-b68d-2a67b423d0cb@linaro.org>
Date: Thu, 5 Sep 2024 14:23:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/29] media: iris: implement power management
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-10-c5fdbbe65e70@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240827-iris_v3-v3-10-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> Implement runtime power management for iris including
> platform specific power on/off sequence.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

> +int iris_hfi_pm_suspend(struct iris_core *core)
> +{
> +	int ret;
> +
> +	if (!mutex_is_locked(&core->lock))
> +		return -EINVAL;
> +
> +	if (core->state != IRIS_CORE_INIT)
> +		return -EINVAL;

Reiterating a previous point

Are these checks realistic or defensive coding ?
> +
> +	if (!core->power_enabled) {
> +		dev_err(core->dev, "power not enabled\n");
> +		return 0;
> +	}

Similarly is this a real check an error that can happen and if so how ?

> +
> +	ret = iris_vpu_prepare_pc(core);
> +	if (ret) {
> +		dev_err(core->dev, "prepare pc ret %d\n", ret);
> +		pm_runtime_mark_last_busy(core->dev);
> +		return -EAGAIN;
> +	}
> +
> +	ret = iris_set_hw_state(core, false);
> +	if (ret)
> +		return ret;
> +
> +	iris_power_off(core);
> +
> +	return 0;
> +}
> +
> +int iris_hfi_pm_resume(struct iris_core *core)
> +{
> +	const struct iris_hfi_command_ops *ops;
> +	int ret;
> +
> +	ops = core->hfi_ops;
> +
> +	ret = iris_power_on(core);
> +	if (ret)
> +		goto error;
> +
> +	ret = iris_set_hw_state(core, true);
> +	if (ret)
> +		goto err_power_off;
> +
> +	ret = iris_vpu_boot_firmware(core);
> +	if (ret)
> +		goto err_suspend_hw;
> +
> +	ret = ops->sys_interframe_powercollapse(core);
> +	if (ret)
> +		goto err_suspend_hw;
> +
> +	return 0;
> +
> +err_suspend_hw:
> +	iris_set_hw_state(core, false);
> +err_power_off:
> +	iris_power_off(core);
> +error:
> +	dev_err(core->dev, "failed to resume\n");
> +
> +	return -EBUSY;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index c3d5b899cf60..e050b1ae90fe 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -46,6 +46,7 @@ struct iris_hfi_command_ops {
>   	int (*sys_init)(struct iris_core *core);
>   	int (*sys_image_version)(struct iris_core *core);
>   	int (*sys_interframe_powercollapse)(struct iris_core *core);
> +	int (*sys_pc_prep)(struct iris_core *core);
>   };
>   
>   struct iris_hfi_response_ops {
> @@ -53,6 +54,8 @@ struct iris_hfi_response_ops {
>   };
>   
>   int iris_hfi_core_init(struct iris_core *core);
> +int iris_hfi_pm_suspend(struct iris_core *core);
> +int iris_hfi_pm_resume(struct iris_core *core);
>   
>   irqreturn_t iris_hfi_isr(int irq, void *data);
>   irqreturn_t iris_hfi_isr_handler(int irq, void *data);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 8f045ef56163..e778ae33b953 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -56,10 +56,21 @@ static int iris_hfi_gen1_sys_interframe_powercollapse(struct iris_core *core)
>   	return ret;
>   }
>   
> +static int iris_hfi_gen1_sys_pc_prep(struct iris_core *core)
> +{
> +	struct hfi_sys_pc_prep_pkt pkt;
> +
> +	pkt.hdr.size = sizeof(struct hfi_sys_pc_prep_pkt);
> +	pkt.hdr.pkt_type = HFI_CMD_SYS_PC_PREP;
> +
> +	return iris_hfi_queue_cmd_write_locked(core, &pkt, pkt.hdr.size);
> +}
> +
>   static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
>   	.sys_init = iris_hfi_gen1_sys_init,
>   	.sys_image_version = iris_hfi_gen1_sys_image_version,
>   	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
> +	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
>   };
>   
>   void iris_hfi_gen1_command_ops_init(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 5c07d6a29863..991d5a5dc792 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -12,6 +12,7 @@
>   #define HFI_ERR_NONE					0x0
>   
>   #define HFI_CMD_SYS_INIT				0x10001
> +#define HFI_CMD_SYS_PC_PREP				0x10002
>   #define HFI_CMD_SYS_SET_PROPERTY			0x10005
>   #define HFI_CMD_SYS_GET_PROPERTY			0x10006
>   
> @@ -48,6 +49,10 @@ struct hfi_sys_get_property_pkt {
>   	u32 data;
>   };
>   
> +struct hfi_sys_pc_prep_pkt {
> +	struct hfi_pkt_hdr hdr;
> +};
> +
>   struct hfi_msg_event_notify_pkt {
>   	struct hfi_pkt_hdr hdr;
>   	u32 event_id;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 807266858d93..0871c0bdea90 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -66,10 +66,30 @@ static int iris_hfi_gen2_sys_interframe_powercollapse(struct iris_core *core)
>   	return ret;
>   }
>   
> +static int iris_hfi_gen2_sys_pc_prep(struct iris_core *core)
> +{
> +	struct iris_hfi_header *hdr;
> +	u32 packet_size;
> +	int ret;
> +
> +	packet_size = sizeof(*hdr) + sizeof(struct iris_hfi_packet);
> +	hdr = kzalloc(packet_size, GFP_KERNEL);
> +	if (!hdr)
> +		return -ENOMEM;
> +
> +	iris_hfi_gen2_packet_sys_pc_prep(core, hdr);
> +	ret = iris_hfi_queue_cmd_write_locked(core, hdr, hdr->size);
> +
> +	kfree(hdr);
> +
> +	return ret;
> +}
> +
>   static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>   	.sys_init = iris_hfi_gen2_sys_init,
>   	.sys_image_version = iris_hfi_gen2_sys_image_version,
>   	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
> +	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
>   };
>   
>   void iris_hfi_gen2_command_ops_init(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 3e3e4ddfe21f..4104479c7251 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -12,6 +12,7 @@
>   
>   #define HFI_CMD_BEGIN				0x01000000
>   #define HFI_CMD_INIT				0x01000001
> +#define HFI_CMD_POWER_COLLAPSE			0x01000002
>   #define HFI_CMD_END				0x01FFFFFF
>   
>   #define HFI_PROP_BEGIN				0x03000000
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 8266eae5ff94..9ea26328a300 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -162,3 +162,16 @@ void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
>   				    &payload,
>   				    sizeof(u32));
>   }
> +
> +void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr)
> +{
> +	iris_hfi_gen2_create_header(hdr, 0 /*session_id*/, core->header_id++);
> +
> +	iris_hfi_gen2_create_packet(hdr,
> +				    HFI_CMD_POWER_COLLAPSE,
> +				    HFI_HOST_FLAGS_NONE,
> +				    HFI_PAYLOAD_NONE,
> +				    HFI_PORT_NONE,
> +				    core->packet_id++,
> +				    NULL, 0);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> index eba109efeb76..163295783b7d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> @@ -65,5 +65,6 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct iris_hfi_header *hdr);
>   void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
>   						       struct iris_hfi_header *hdr);
> +void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr);
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index b24d4640fea9..3a511d5e5cfc 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -3,6 +3,8 @@
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
> +#include <linux/pm_runtime.h>
> +
>   #include "iris_core.h"
>   #include "iris_hfi_queue.h"
>   #include "iris_vpu_common.h"
> @@ -145,13 +147,27 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
>   {
>   	int ret;
>   
> +	ret = pm_runtime_resume_and_get(core->dev);
> +	if (ret < 0)
> +		goto exit;
> +
>   	mutex_lock(&core->lock);
>   	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);
> -	if (ret)
> +	if (ret) {
>   		dev_err(core->dev, "iris_hfi_queue_cmd_write_locked failed with %d\n", ret);
> -
> +		mutex_unlock(&core->lock);
> +		goto exit;
> +	}
>   	mutex_unlock(&core->lock);
>   
> +	pm_runtime_mark_last_busy(core->dev);
> +	pm_runtime_put_autosuspend(core->dev);
> +
> +	return 0;
> +
> +exit:
> +	pm_runtime_put_sync(core->dev);
> +
>   	return ret;
>   }
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 4577977f9f8c..899a696a931d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -8,6 +8,7 @@
>   
>   #define IRIS_PAS_ID				9
>   #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
> +#define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
>   
>   extern struct iris_platform_data sm8550_data;
>   extern struct iris_platform_data sm8250_data;
> @@ -40,10 +41,22 @@ struct ubwc_config_data {
>   	u32	bank_spreading;
>   };
>   
> +struct iris_core_power {
> +	u64 clk_freq;
> +	u64 icc_bw;
> +};
> +
> +enum platform_pm_domain_type {
> +	IRIS_CTRL_POWER_DOMAIN,
> +	IRIS_HW_POWER_DOMAIN,
> +};
> +
>   struct iris_platform_data {
>   	void (*init_hfi_command_ops)(struct iris_core *core);
>   	void (*init_hfi_response_ops)(struct iris_core *core);
>   	struct iris_inst *(*get_instance)(void);
> +	const struct vpu_ops *vpu_ops;
> +	void (*set_preset_registers)(struct iris_core *core);
>   	const struct icc_info *icc_tbl;
>   	unsigned int icc_tbl_size;
>   	const char * const *pmdomain_tbl;
> @@ -61,6 +74,7 @@ struct iris_platform_data {
>   	u32 core_arch;
>   	u32 hw_response_timeout;
>   	struct ubwc_config_data *ubwc_config;
> +	u32 num_vpp_pipe;
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index b83665a9c5a2..1adbafa373a5 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -7,6 +7,12 @@
>   #include "iris_platform_common.h"
>   #include "iris_resources.h"
>   #include "iris_hfi_gen1.h"
> +#include "iris_vpu_common.h"
> +
> +static void iris_set_sm8250_preset_registers(struct iris_core *core)
> +{
> +	writel(0x0, core->reg_base + 0xB0088);
> +}
>   
>   static const struct icc_info sm8250_icc_table[] = {
>   	{ "cpu-cfg",    1000, 1000     },
> @@ -36,6 +42,8 @@ struct iris_platform_data sm8250_data = {
>   	.get_instance = iris_hfi_gen1_get_instance,
>   	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8250_preset_registers,
>   	.icc_tbl = sm8250_icc_table,
>   	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>   	.clk_rst_tbl = sm8250_clk_reset_table,
> @@ -51,4 +59,5 @@ struct iris_platform_data sm8250_data = {
>   	.pas_id = IRIS_PAS_ID,
>   	.tz_cp_config_data = &tz_cp_config_sm8250,
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 4,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index 91bfc0fa0989..950ccdccde31 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -7,9 +7,15 @@
>   #include "iris_hfi_gen2.h"
>   #include "iris_platform_common.h"
>   #include "iris_resources.h"
> +#include "iris_vpu_common.h"
>   
>   #define VIDEO_ARCH_LX 1
>   
> +static void iris_set_sm8550_preset_registers(struct iris_core *core)
> +{
> +	writel(0x0, core->reg_base + 0xB0088);
> +}
> +
>   static const struct icc_info sm8550_icc_table[] = {
>   	{ "cpu-cfg",    1000, 1000     },
>   	{ "video-mem",  1000, 15000000 },
> @@ -48,6 +54,8 @@ struct iris_platform_data sm8550_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.vpu_ops = &iris_vpu3_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
>   	.icc_tbl = sm8550_icc_table,
>   	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>   	.clk_rst_tbl = sm8550_clk_reset_table,
> @@ -65,4 +73,5 @@ struct iris_platform_data sm8550_data = {
>   	.core_arch = VIDEO_ARCH_LX,
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>   	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 4,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
> new file mode 100644
> index 000000000000..e697c27c8a8a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_power.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_power.h"
> +#include "iris_vpu_common.h"
> +
> +void iris_power_off(struct iris_core *core)
> +{
> +	if (!core->power_enabled)
> +		return;

<snip>

> +
> +int iris_power_on(struct iris_core *core)
> +{
> +	int ret;
> +
> +	if (core->power_enabled)
> +		return 0;

When do you call either of these functions without the state already 
being known ?

You're guarding against reentrancy - but are these functions reentrant 
in your logic ?

If not then the checks are redundant.

> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_power.h b/drivers/media/platform/qcom/iris/iris_power.h
> new file mode 100644
> index 000000000000..ff9b6be3b086
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_power.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _IRIS_POWER_H_
> +#define _IRIS_POWER_H_
> +
> +struct iris_core;
> +
> +int iris_power_on(struct iris_core *core);
> +void iris_power_off(struct iris_core *core);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ecf1a50be63b..3222e9116551 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/module.h>
> +#include <linux/pm_runtime.h>
>   
>   #include "iris_core.h"
>   #include "iris_vidc.h"
> @@ -111,17 +112,25 @@ static int iris_probe(struct platform_device *pdev)
>   	if (core->irq < 0)
>   		return core->irq;
>   
> +	pm_runtime_set_autosuspend_delay(core->dev, AUTOSUSPEND_DELAY_VALUE);
> +	pm_runtime_use_autosuspend(core->dev);
> +	ret = devm_pm_runtime_enable(core->dev);
> +	if (ret) {
> +		dev_err(core->dev, "failed to enable runtime pm\n");
> +		goto err_runtime_disable;
> +	}
> +
>   	ret = iris_init_isr(core);
>   	if (ret) {
>   		dev_err_probe(core->dev, ret, "Failed to init isr\n");
> -		return ret;
> +		goto err_runtime_disable;
>   	}
>   
>   	core->iris_platform_data = of_device_get_match_data(core->dev);
>   	if (!core->iris_platform_data) {
>   		ret = -ENODEV;
>   		dev_err_probe(core->dev, ret, "init platform failed\n");
> -		return ret;
> +		goto err_runtime_disable;
>   	}
>   
>   	iris_init_ops(core);
> @@ -131,12 +140,12 @@ static int iris_probe(struct platform_device *pdev)
>   	ret = iris_init_resources(core);
>   	if (ret) {
>   		dev_err_probe(core->dev, ret, "init resource failed\n");
> -		return ret;
> +		goto err_runtime_disable;
>   	}
>   
>   	ret = v4l2_device_register(dev, &core->v4l2_dev);
>   	if (ret)
> -		return ret;
> +		goto err_runtime_disable;
>   
>   	ret = iris_register_video_device(core);
>   	if (ret)
> @@ -159,10 +168,58 @@ static int iris_probe(struct platform_device *pdev)
>   	video_unregister_device(core->vdev_dec);
>   err_v4l2_unreg:
>   	v4l2_device_unregister(&core->v4l2_dev);
> +err_runtime_disable:
> +	pm_runtime_set_suspended(core->dev);
> +
> +	return ret;
> +}
> +
> +static int iris_pm_suspend(struct device *dev)
> +{
> +	struct iris_core *core;
> +	int ret;
> +
> +	if (!dev || !dev->driver)
> +		return 0;

Why/when/how ?

:g/Zap redundant checks///g

---
bod

