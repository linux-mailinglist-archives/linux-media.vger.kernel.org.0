Return-Path: <linux-media+bounces-31632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86FAA7717
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 18:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71AA73AAB3D
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF3D2580C4;
	Fri,  2 May 2025 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UOzNlvQK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165A925D203
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202809; cv=none; b=D4HLtiBVotUK6RgTDBzBhPMBvSY8pjkUXNdKTOwTHHNj/5JEzACFx2ok4C9PphFn7omI+E7IjqQB7sQS9WJtkM6bQVPoUlLtJL3rOYvpsZSnwjtgJ+oDf/PH+9xJU5QvXrAvcR4exFUBkeWQQUeV787xp8ynP5xKyVz35jTVp7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202809; c=relaxed/simple;
	bh=3EjapqU+jeTaOQ/Z8/xEhQVRbPLYwk7rw/gB+eafJ+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4EmRFJh7gHcvWYimLmSdw4oYODNfs8ShhRpvHrcAnuH2FJSxTP311dKeNdhYlPAWE2YAXw54fPVUrDKuAb0hWsuGOXIFvwOSRzNS+/3cKpN9QptiKdYD9AIsXbLLvTbWtXkCCL3WCdr0tDnPR8kisWLjaJSwxRa/ef+I2klpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UOzNlvQK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso14206735e9.0
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 09:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746202805; x=1746807605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/bz9fn1ApK8ehph3J3EWQJlOEkbeXH0IsSy7vj7uAo=;
        b=UOzNlvQK6EQQdCcXpcWTbDPQQgfrI7dZfCSxX3OgKJJpmTEkcFnK4YPLVo+4H9gZfd
         QsgrEx5ZwEUpo2OIC4J4htyyD/KSwamS0s1PorXa0ukd4K7tR3dv7ih+F+ZNATGyvGl4
         2udlan8EWKJReejqKvmM+cG1eaGbCBEmnhATlDv92ApR543E0IBxcWcYLGqaNr+6h8am
         YOY/kFcA8zV14H7pHcij/ypFeup7tGfWi5qgtf3QqKD7rWpximN8Ruw8j6VTYoC6cGrs
         MUPj3GM02DCFDpTslLpZeSOGKY2IxGNPs1/BIT8IEMEXL+mEKPMuHT2s0/Kl+XW5baRP
         zCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202805; x=1746807605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/bz9fn1ApK8ehph3J3EWQJlOEkbeXH0IsSy7vj7uAo=;
        b=Z2FicJGy++XeajQAMI3vkxiG1MeuQL9A1lFCspBY3qMnwvUx4xVI5CIyDkOU5i9SGE
         C0DbgOaef07pDdILiFKEOQS8n+YBmcWmRX1h1FbO6M9fLs28bjouu1a3lSaR9RSQPE6t
         yH4nP+gHYfY4gUXA6CGuF3bDV8Q4wmmwgxVdoWWrBz+YRAbp3/qZSso7EvtGJrRbNT0G
         rmgAzu4EQIDTg3vQZ0Gu7PTHVfT7BRukEwotjDmuXu11WJNp+LxZsl0h+PLZMzGwZFYi
         FuPQdb4cv7nb+kQYSXyA/GXHKj4DHiT30WzJc4VueahgdiP1EaeqZ7cDVKHVGNPjFcsC
         Yj4w==
X-Forwarded-Encrypted: i=1; AJvYcCUHckERqkJcXTazw7p3eMgmNJcscif8fIWA4yLPB2S/OGre9SjMf+0+rrqlCjk0qTWQpUsLP3F7C3O8pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdxBLBHHqWOwmdSscIC8bYIdGJb4xVQGhZ50cwYhCaCc7l/ENm
	/fnngCyn8Nb55/y74vgnpuX+kDswCNi7E9vqq/o5L1wM62OGmpqRAIFQnovyZNk=
X-Gm-Gg: ASbGncsZ2HQQ/nS4y9ly7KhABBNgpO/tXyAs5t9hDVauWElisuLxF5G9oRJqBFaCiHi
	fLPh+x2QA40fItxczhDUF27m1CU82DvAIk2u54DYeu6kQygPfwviauDd0+aHWHAosTu2g+Yx9cU
	10CtPFVLcKDjBJsZffyPzNZ9kDhtAEUHuhx4PDLKyZfwo8qe1i6wNZ7XHSRv1u14Z3+owPnq798
	ypFAos5Z4FUCFHpXyMbTq7KI/S69cnE2doQal5vTit6cpOD0VNKOG2dl9VuqroG4C78/NRg8LxV
	AeGPDJW3KZ8bc0JqLzuvRs1PpXKnZFJSPkEsn51oRQHZg5nZpDoGDIN+UAJJfJhL3E/Ps5rIkvd
	VeaqgKg==
X-Google-Smtp-Source: AGHT+IHxteQF1bGkHCKmd6Y1/yMn23d0yEys+sIe42jqect0CeKlrVJkCO/XXn6oUIOdI381iLRBwg==
X-Received: by 2002:a05:600c:8711:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-441bb88d42emr29490745e9.12.1746202805361;
        Fri, 02 May 2025 09:20:05 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a31576sm48340455e9.37.2025.05.02.09.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:20:04 -0700 (PDT)
Message-ID: <68aa8c09-233e-4997-b2f8-7db4cd411351@linaro.org>
Date: Fri, 2 May 2025 17:20:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/23] media: iris: Add a comment to explain usage of
 MBPS
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-18-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-18-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Add a comment to explain usage of MBPS and define a macro for 8K
> resolution for better readability
> 
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 2 ++
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ++--
>   drivers/media/platform/qcom/iris/iris_platform_sm8250.c | 2 +-
>   3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 1dab276431c7..3e0ae87526a0 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -21,6 +21,7 @@ struct iris_inst;
>   #define DEFAULT_MAX_HOST_BUF_COUNT		64
>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
>   #define DEFAULT_FPS				30
> +#define NUM_MBS_8K				((8192 * 4352) / 256)
>   
>   enum stage_type {
>   	STAGE_1 = 1,
> @@ -172,6 +173,7 @@ struct iris_platform_data {
>   	struct ubwc_config_data *ubwc_config;
>   	u32 num_vpp_pipe;
>   	u32 max_session_count;
> +	/* max number of macroblocks per frame supported */
>   	u32 max_core_mbpf;
>   	const u32 *input_config_params;
>   	unsigned int input_config_params_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 1e69ba15db0f..deb7037e8e86 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -248,7 +248,7 @@ struct iris_platform_data sm8550_data = {
>   	.ubwc_config = &ubwc_config_sm8550,
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
> -	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
>   	.input_config_params =
>   		sm8550_vdec_input_config_params,
>   	.input_config_params_size =
> @@ -308,7 +308,7 @@ struct iris_platform_data sm8650_data = {
>   	.ubwc_config = &ubwc_config_sm8550,
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
> -	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
>   	.input_config_params =
>   		sm8550_vdec_input_config_params,
>   	.input_config_params_size =
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 543fa2661539..8183e4e95fa4 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -127,7 +127,7 @@ struct iris_platform_data sm8250_data = {
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
> -	.max_core_mbpf = (8192 * 4352) / 256,
> +	.max_core_mbpf = NUM_MBS_8K,
>   	.input_config_params =
>   		sm8250_vdec_input_config_param_default,
>   	.input_config_params_size =
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

