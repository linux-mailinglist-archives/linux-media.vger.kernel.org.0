Return-Path: <linux-media+bounces-38560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43612B13BB8
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23D6189DBBD
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 13:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B17026A08D;
	Mon, 28 Jul 2025 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+HQha42"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BE226981E
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753710291; cv=none; b=B4Jjvr7oGX6hVQNFbMQUFWTxcpwHQwy7ifB3+jcgrbH+Cro4w8OVu0/wEedJP45/5lwQ6JgvjVRf5FjDm7SitOZ91yOZovOCOppSyPbCMdmHe/49fayH8IrLl9rrMP0p6wgFJec8QmpBrkXXfw83UdAU4wTuyj81OGPCTzQtl3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753710291; c=relaxed/simple;
	bh=7kEmjD7J1ByYEPN6gK5wIGaNyoEK7cRCpksvz+MpqDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhVWmsyBa73SG3sAnO/GqEBeJpeg/t6IU+mShQR72fOuv1k1HCqlpj4uES99GBFl9jF4TMdfPKo1Rw9V0rUCJJf1ErY35vRTwdcYnnL5wslJNMvORX/YN5wiVrcPNOltcRwV+1cUcJzrFhLWAa5OcVi1gCYCFC7iAmbcO1eCHIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+HQha42; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af66f444488so67409166b.0
        for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 06:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753710288; x=1754315088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RC668nCt8mHHP3FnT6kcpHmAaYm5QP6my+V/404SJa4=;
        b=R+HQha42Vqw9TWuBjg8AV52UGW5XNhAOixTpOalAjMsZ1H8AOGXtBbdmGPfU2nVyMk
         vZIrgBXOlszX0g13BEBsZwMq57KW3lv5xfGpfyI/9gAi22y+Ndv3JAQTC69L9K4GhtCU
         dTDCm7xvNxxPYBPzM6rmdZbPb2QV0CYygmHyTgHF79dKVQt+k9+gyW2KO9ibTRpMbW20
         F96ACUpEyOWqIekFz4PKrzDaA8POPUhzdmATL1LwlLwYuhpGUzac+o3VArx9KgZHubWu
         5/stw37OaFfXjf4cmNU3BGAYETCwgZDJ4SYbSay2wzGZoLbd77p6rc+/J2ekmPpVEzAY
         VTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710288; x=1754315088;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RC668nCt8mHHP3FnT6kcpHmAaYm5QP6my+V/404SJa4=;
        b=ijxWJW2S3MPWx08Ekecow83yYN5cxkFZEg6MizgwFGyLCA+80GZicpu/bnLGWRNhRw
         O+BXN+I/NzLFEQKWbzybEoEUtiBo11t8i4eNbEQUNAAH4OFzqFOKREkmrNGGFE4j3Ide
         QxKPWUJqXMrpO15AKczwtUynCJPAewi85111fxhmz7XG3H0KaRhNIb7RD3pnl4LRB9+t
         8EYLaXLMc2riZRtgpcAiLdMQwRV0G3jwvZIP3SP5xI4VFwpjU2xkUR54AKlHN/0T44Ge
         7EN/stN5xYWYFWd9tOLyeZfRVRV/w0G3iQ9zmiNgidbwPNun76LwhiXZiBeoY7lyc+l0
         zl4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbjRiYxkxCv+ZpP+1zBGDEGxvCvb2z0ReNlv9bqyzM05dJn0+UgqBMrxvsY2eRA9M8G7ic348rj46Y5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIpVWEtTz89ZEF1tS8UOYT9E2gZLAhm0aokuZpTNgE5BYJc4Fm
	N8yIMXL5hWQQtnjh+oXfmg7+5HT7W4jUqs0V0+1ubyaFwuRTZ1n9EliCgPvMaJtNIvQ=
X-Gm-Gg: ASbGncvWu2yjoKZvOdvJKIQ6RBc1GRGIsBIKmLX6+1k+zmOahm4Z4Z6LnbSyIU71/fG
	UFBLDf3yhLKJ52BzpMl4a9gV/IehWhu8CFnHS3vLI8Rs1i3wWClRpWIzTYsJFj6wqSsHi47Oirp
	5UsSXItLkiX+eWqMfeGFLQABVwl40jDI6M6XYq9u77k3eEwsHjTD87td73taIT2gZjjBHgXu48H
	LkWnjUfZ6hkhKrqVqdGjDULFVLyL5u0Z8ytv1gGVewWnd4lWEwY2f8OHu7ZZ8LQm0nSFUX/Z20x
	61LBYGpIWMOiiZkEI++dIxejlG4PyEbpXMOJWp2sJuCzwpreMglTKi3t8Igq4/jFHV9+8DEwJTb
	RzmZwi+TqKpbQPd4j4VcaudLgdCe0gnPT+bE5M4Qpwbi2c1aC42UAhw/oL7w24AI=
X-Google-Smtp-Source: AGHT+IELW+a3KhmjkLCdMZPX2WGb73CXN0xX5TnTiHq9x7ZvKzBuKTWC2hjTDdFNf3HgtVm9iVz32w==
X-Received: by 2002:a17:907:da5:b0:ae3:4f99:a5a5 with SMTP id a640c23a62f3a-af61c2aededmr1250106966b.6.1753710287770;
        Mon, 28 Jul 2025 06:44:47 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a6314asm425521366b.91.2025.07.28.06.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 06:44:46 -0700 (PDT)
Message-ID: <5ac76f1e-21d1-4265-8afe-b4b7209cfc5a@linaro.org>
Date: Mon, 28 Jul 2025 14:44:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] media: qcom: camss: Rename camss-csid-780.c to
 camss-csid-gen3.c
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-2-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 18:19, Vikram Sharma wrote:
> Rename the file camss-csid-780.c to camss-csid-gen3.c to enable
> reuse of CSID logic across multiple SoCs.
> 
> The SA8775P SoC includes CSID 690, which is functionally very
> similar to CSID 780, with only minor differences in register
> bitfields. This rename prepares the codebase for supporting
> additional SoCs without duplicating CSID logic.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile             |  2 +-
>   .../qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} |  8 +++++---
>   .../qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} |  9 +++++----
>   drivers/media/platform/qcom/camss/camss-csid.h         |  2 +-
>   drivers/media/platform/qcom/camss/camss.c              | 10 +++++-----
>   5 files changed, 17 insertions(+), 14 deletions(-)
>   rename drivers/media/platform/qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} (98%)
>   rename drivers/media/platform/qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} (84%)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index d26a9c24a430..ee869e69521a 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -8,7 +8,7 @@ qcom-camss-objs += \
>   		camss-csid-4-7.o \
>   		camss-csid-680.o \
>   		camss-csid-gen2.o \
> -		camss-csid-780.o \
> +		camss-csid-gen3.o \
>   		camss-csiphy-2ph-1-0.o \
>   		camss-csiphy-3ph-1-0.o \
>   		camss-csiphy.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> similarity index 98%
> rename from drivers/media/platform/qcom/camss/camss-csid-780.c
> rename to drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 4c720d177731..0941152ec301 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-780.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -4,6 +4,8 @@
>    *
>    * Copyright (c) 2024 Qualcomm Technologies, Inc.
>    */
> +
> +

Dead newlines.

>   #include <linux/completion.h>
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
> @@ -13,7 +15,7 @@
>   
>   #include "camss.h"
>   #include "camss-csid.h"
> -#include "camss-csid-780.h"
> +#include "camss-csid-gen3.h"
>   
>   #define CSID_IO_PATH_CFG0(csid)		(0x4 * (csid))
>   #define		OUTPUT_IFE_EN			0x100
> @@ -259,7 +261,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>   
>   			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
>   				/*
> -				 * For Titan 780, bus done and RUP IRQ have been moved to
> +				 * For Titan Gen3, bus done and RUP IRQ have been moved to
>   				 * CSID from VFE. Once CSID received bus done, need notify
>   				 * VFE of this event. Trigger VFE to handle bus done process.
>   				 */
> @@ -325,7 +327,7 @@ static void csid_subdev_init(struct csid_device *csid)
>   	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
>   }
>   
> -const struct csid_hw_ops csid_ops_780 = {
> +const struct csid_hw_ops csid_ops_gen3 = {
>   	.configure_stream = csid_configure_stream,
>   	.configure_testgen_pattern = csid_configure_testgen_pattern,
>   	.hw_version = csid_hw_version,
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.h b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
> similarity index 84%
> rename from drivers/media/platform/qcom/camss/camss-csid-780.h
> rename to drivers/media/platform/qcom/camss/camss-csid-gen3.h
> index a990c66a60ff..e6298042ae74 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-780.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
> @@ -1,13 +1,13 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
> - * camss-csid-780.h
> + * camss-csid-gen3.h
>    *
>    * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 3
>    *
>    * Copyright (c) 2024 Qualcomm Technologies, Inc.
>    */
> -#ifndef __QC_MSM_CAMSS_CSID_780_H__
> -#define __QC_MSM_CAMSS_CSID_780_H__
> +#ifndef __QC_MSM_CAMSS_CSID_GEN3_H__
> +#define __QC_MSM_CAMSS_CSID_GEN3_H__
>   
>   #define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
>   #define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
> @@ -18,8 +18,9 @@
>   #define DECODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
>   #define DECODE_FORMAT_PAYLOAD_ONLY		0xf
>   
> +
another dead newline

>   #define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
>   #define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
>   #define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
>   
> -#endif /* __QC_MSM_CAMSS_CSID_780_H__ */
> +#endif /* __QC_MSM_CAMSS_CSID_GEN3_H__ */
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 9dc826d8c8f6..62273ca9f199 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -215,7 +215,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
>   extern const struct csid_hw_ops csid_ops_4_7;
>   extern const struct csid_hw_ops csid_ops_680;
>   extern const struct csid_hw_ops csid_ops_gen2;
> -extern const struct csid_hw_ops csid_ops_780;
> +extern const struct csid_hw_ops csid_ops_gen3;
>   
>   /*
>    * csid_is_lite - Check if CSID is CSID lite.
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 06f42875702f..1431e08dc04a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2285,7 +2285,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   		.csid = {
>   			.is_lite = false,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.hw_ops = &csid_ops_780,
> +			.hw_ops = &csid_ops_gen3,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -2300,7 +2300,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   		.csid = {
>   			.is_lite = false,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.hw_ops = &csid_ops_780,
> +			.hw_ops = &csid_ops_gen3,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -2315,7 +2315,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   		.csid = {
>   			.is_lite = false,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.hw_ops = &csid_ops_780,
> +			.hw_ops = &csid_ops_gen3,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -2330,7 +2330,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.hw_ops = &csid_ops_780,
> +			.hw_ops = &csid_ops_gen3,
>   			.formats = &csid_formats_gen2
>   		}
>   	},
> @@ -2345,7 +2345,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   		.csid = {
>   			.is_lite = true,
>   			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.hw_ops = &csid_ops_780,
> +			.hw_ops = &csid_ops_gen3,
>   			.formats = &csid_formats_gen2
>   		}
>   	}

I can fix those newlines, no need for a v4.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

