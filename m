Return-Path: <linux-media+bounces-30005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BEDA8563E
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 10:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0451BA3F8A
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 08:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A9F293B53;
	Fri, 11 Apr 2025 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OWSzlRK5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6B026F47E
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359114; cv=none; b=O0vBHrJemG/NMCvNa+niuR6M0vbXQOeKII8KYGAReO5cugXPrYBEyq3eFo4XtcY5DJ7dt2pg40sBCqN1/9JQTJRNvUI1zPiD+5em5zyYFK4c2VIZD8ADPqYBq/PFotRAOvI44JRLRf2NvAOsEMhxED3cKKMLxApWypVkh3sTGmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359114; c=relaxed/simple;
	bh=mCKEaVrkoDmpHuz9hMWrEF65etNfK4pwUfdozCFV62w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=friK6cLH70XRkSmoPcAaTQXSgIrVDhNhYOiRsmArtiwL0I4fRDpels11TFNUOF9TkgIMp2W/LnkXDTSDZYxBwDTXEbHbtYkPLeBTgTv7dOiGZVxkTq9V/6rrYVdqLaW2JW8NeSMK1wX1EgEzbGVlgJxp4WjfDcR3g6pw0mIDZvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OWSzlRK5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ede096d73so12338975e9.2
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 01:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744359110; x=1744963910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPbOvPeLOTfUoVvIdnRsRuAr8SgUvtCBtEqF1R+grFI=;
        b=OWSzlRK5W91Dyz7ClHCZvgVCMlzdbEhYVchjvy78+F8BRswNZhXtUX8f0N82INO2rx
         3p6LDcA6Nh/kcxPUTvsWGb/Qt9c9CW/RTmu7vh6Ct9vb6d2t6iKY/PIiafGRCoP2Z8r5
         IgSZ5K6ayfUGXrg4oiBXZTs8sReYQAwDUxKYhDrSHrhvJCCqkM8TSoRcgYMr1xlpmVno
         Z+jQJf0+mpud8jn18lSvIaw878W1GuzjUQTj13Gd4phqgMlQ48xHn2yDKDekLe7DKMvZ
         ORP8LqjEybmQ42vZWxoKvV1XTU87rXSR2WEDt7g+f+A4SuXwu0rrvKFmQaxY5nsI0gTe
         dZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744359110; x=1744963910;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vPbOvPeLOTfUoVvIdnRsRuAr8SgUvtCBtEqF1R+grFI=;
        b=VIUUHJ+iFRSDNpDt0Pz66uO6VKCyppfzVfAoPmDpRjXQzJ45ynKQ5afQx+TFR+n7mw
         UtngLIoRuL4QAXCXf1GlWIcZkwu1oIC/G9wQbrPNsbgjmGVfcXKB7OVOfRqh3O8pji83
         a4WPEqC4lnhXvpGjmIa4HDDdCGj2zHByOcgW80gxdVs7mTy5RlBzBGADOaLCKbcNuc4z
         sYu5a5eDu5NBcRatg4O32GgQLd1AYLimfjUm/8iHVQw6SG9a3vFrF3l4RFrzYevArTn1
         6igFd6rtLICdvEUCleuis0Cw/lW0Edv3gNXhE0EUCaiYrjPiCJEGs09RmFCuaz9kRU1m
         zIDw==
X-Forwarded-Encrypted: i=1; AJvYcCUAGpFDf4FVum2/mAdEjZWeKNYr/vhr0MJdQUd/OvDBzBEXgncDcrzCiIEVVo6u5w5BC0eFPCmFSjjzNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywY075Qci3LmeZ+zDjUJ4EwP2vCvyTq1p0ae2y0FPeHiEXrcL9
	5pyeyheTrnACqQ+aM11A2uJpxixNPAfugxl48kreLIrXifRs1K3a2tTVbCGylPAwJleEol070qM
	d
X-Gm-Gg: ASbGncsjge5ov8riveg4zmWwqXfRClftIh9KS/IqTXH1S7ynIgKMpO8I1JDRy2+e08X
	aUkatHEiCfu5SefHAtP5EjncLwovgM3RBj4V/bU34rYxFL4jmcn6l1BPZ+XftEtDnk4pAjOb1oL
	xJ6lLc5ThyOFWvFr7ZDmZbrUS3mADVq3TYB9FfpojVpr8BXYpOwKwDHB0qEY9+6VUpa39mVVcSi
	i89s8+yLBqWfmK+0Sy2V/zhExvRj1D8AYB2xQlSdqIZJ0d7PoVpSTFcjRtWqT/bNyPZwY1VF72t
	FriSkVEABzjwcudirim1JkuNvbodN96ZmG9yTTMRJ6gimqNLOccmCC4yxLd4KNwRU6z21Xi1EDw
	t00egFaP9pcYE6qZ2mA==
X-Google-Smtp-Source: AGHT+IGmimpynF/UTRN8wonhbEzI59SJrdEgK0HAKS14/gm64RhqMsKIhV5fS3cTa1svUhD9S3PmHA==
X-Received: by 2002:a05:600c:4f90:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-43f3a95a006mr12293105e9.19.1744359109727;
        Fri, 11 Apr 2025 01:11:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572c4esm77226965e9.26.2025.04.11.01.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:11:49 -0700 (PDT)
Message-ID: <8005927b-8a2a-4e7b-b317-8db29501510c@linaro.org>
Date: Fri, 11 Apr 2025 10:11:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v5 8/8] media: platform: qcom/iris: add sm8650 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-8-44a431574c25@linaro.org>
 <919203d2-cae2-4ed8-8144-8303d185d773@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <919203d2-cae2-4ed8-8144-8303d185d773@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/04/2025 21:20, Bryan O'Donoghue wrote:
> On 10/04/2025 17:30, Neil Armstrong wrote:
>> Add support for the SM8650 platform by re-using the SM8550
>> definitions and using the vpu33 ops.
>>
>> The SM8650/vpu33 requires more reset lines, but the H.264
>> decoder capabilities are identical.
>>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../media/platform/qcom/iris/iris_catalog_gen2.c   |  1 +
>>   .../media/platform/qcom/iris/iris_catalog_sm8650.h | 68 ++++++++++++++++++++++
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>>   4 files changed, 74 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_catalog_gen2.c b/drivers/media/platform/qcom/iris/iris_catalog_gen2.c
>> index c3f8ad004cb7f9317859b2594640c7138dbb6534..ad559351f1125d266dedac7eb6e91cda90bbae72 100644
>> --- a/drivers/media/platform/qcom/iris/iris_catalog_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_catalog_gen2.c
>> @@ -186,3 +186,4 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
>>   /* platforms catalogs */
>>   #include "iris_catalog_sm8550.h"
>> +#include "iris_catalog_sm8650.h"
>> diff --git a/drivers/media/platform/qcom/iris/iris_catalog_sm8650.h b/drivers/media/platform/qcom/iris/iris_catalog_sm8650.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..be8737dd4f3d9ec20a457d50076be1b4d841787c
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_catalog_sm8650.h
>> @@ -0,0 +1,68 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _IRIS_CATALOG_SM8650_H
>> +#define _IRIS_CATALOG_SM8650_H
>> +
>> +#define VIDEO_ARCH_LX 1
>> +
>> +static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
>> +
>> +static const char * const sm8650_controller_reset_table[] = { "xo" };
>> +
>> +struct iris_platform_data sm8650_data = {
>> +    .get_instance = iris_hfi_gen2_get_instance,
>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +    .vpu_ops = &iris_vpu33_ops,
>> +    .set_preset_registers = iris_set_sm8550_preset_registers,
>> +    .icc_tbl = sm8550_icc_table,
>> +    .icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>> +    .clk_rst_tbl = sm8650_clk_reset_table,
>> +    .clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
>> +    .controller_rst_tbl = sm8650_controller_reset_table,
>> +    .controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
>> +    .bw_tbl_dec = sm8550_bw_table_dec,
>> +    .bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>> +    .pmdomain_tbl = sm8550_pmdomain_table,
>> +    .pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>> +    .opp_pd_tbl = sm8550_opp_pd_table,
>> +    .opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>> +    .clk_tbl = sm8550_clk_table,
>> +    .clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>> +    /* Upper bound of DMA address range */
>> +    .dma_mask = 0xe0000000 - 1,
>> +    .fwname = "qcom/vpu/vpu33_p4.mbn",
>> +    .pas_id = IRIS_PAS_ID,
>> +    .inst_caps = &platform_inst_cap_sm8550,
>> +    .inst_fw_caps = inst_fw_cap_sm8550,
>> +    .inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
>> +    .tz_cp_config_data = &tz_cp_config_sm8550,
>> +    .core_arch = VIDEO_ARCH_LX,
>> +    .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>> +    .ubwc_config = &ubwc_config_sm8550,
>> +    .num_vpp_pipe = 4,
>> +    .max_session_count = 16,
>> +    .max_core_mbpf = ((8192 * 4352) / 256) * 2,
>> +    .input_config_params =
>> +        sm8550_vdec_input_config_params,
>> +    .input_config_params_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_params),
>> +    .output_config_params =
>> +        sm8550_vdec_output_config_params,
>> +    .output_config_params_size =
>> +        ARRAY_SIZE(sm8550_vdec_output_config_params),
>> +    .dec_input_prop = sm8550_vdec_subscribe_input_properties,
>> +    .dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>> +    .dec_output_prop = sm8550_vdec_subscribe_output_properties,
>> +    .dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
>> +
>> +    .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>> +    .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> +    .dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>> +    .dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>> +};
>> +
>> +#endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -35,6 +35,7 @@ enum pipe_type {
>>   extern struct iris_platform_data sm8250_data;
>>   extern struct iris_platform_data sm8550_data;
>> +extern struct iris_platform_data sm8650_data;
>>   enum platform_clk_type {
>>       IRIS_AXI_CLK,
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e..7cd8650fbe9c09598670530103e3d5edf32953e7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -345,6 +345,10 @@ static const struct of_device_id iris_dt_match[] = {
>>               .data = &sm8250_data,
>>           },
>>   #endif
>> +    {
>> +        .compatible = "qcom,sm8650-iris",
>> +        .data = &sm8650_data,
>> +    },
>>       { },
>>   };
>>   MODULE_DEVICE_TABLE(of, iris_dt_match);
>>
> 
> This LGTM one thing is I think you should convert the sm8250 stuff into a corresponding iris_catalog_gen1.c

This is done in patch 1

Neil

> 
> Would be grateful if you could add that patch to a V6.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


