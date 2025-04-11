Return-Path: <linux-media+bounces-30025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E50A85EBC
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 15:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBA918C0904
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 13:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457D619F40F;
	Fri, 11 Apr 2025 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gL/1K5zF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C681B19CC3A
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377506; cv=none; b=JRzZKpK1B6ylA3i7734D8ErfYg+FMQ7JBVynb+tcsD0qmQDvqpeuwXFrKb9KWGDONcxUgUqtZ/d1uN0YmnWiFhTfZSA6sCH1v2x20SiqddKAsZf5b4qznoLIbKOwr1NpO9Cf/wqyDUim5VMj+jO24zq938Haq00cpA9SpZYgnAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377506; c=relaxed/simple;
	bh=BUjqMSGXFNAQCtSnMnZLc7ifXcyak1+IAzaJHHRD/+k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NE4lp7UyAsS4VDd5QBijOUjeSNoLWSZzBCE/nl+Y0dJv4tYhJg9V7wXJj4EXYuAIuNyARZ6GdERw5NwhW9nF6qRST9hlOfZe/fftA9vcrIcok7uZUv7aash/DOswSvGEMcz5mFqMl5whuLTmVMDFq84toHW2qFESo+6ENTTj6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gL/1K5zF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391342fc1f6so1506169f8f.1
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744377502; x=1744982302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAgS7d7mQW64Ugh4mepLGUIYDIVFQL72jfWiNoLCjqQ=;
        b=gL/1K5zFWzePesNp68srbCiau2LLI4vcxizrPT4LXwECcJhsBI/QUwILU3uPxdb9Yc
         Kla6HWVW4Z5xXW/0XllmLX0I2zThkH1+oU7AZh0I1FIjlNJFBAl1gKsuy4+AWCck8gg8
         VdQCdAIj7uyAvV1WBj9J4/g+thTHEZnWYWWoElUu08XNTZx22lb8Sg+/FzqDS3RNdr9y
         KQVJ8ORUHtY0FB8n0slT2v5tfX3HIe7S3ZyJrX3JFiZ2pi47CM8o3/YQs2oHF5FNarrY
         TxppeqL2dRGtHtYo8ReQ0B98/SKt1tBFoWdIQc/e5LG6ItXFVf99jxE1QAKVTrvhlkHC
         IUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377502; x=1744982302;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bAgS7d7mQW64Ugh4mepLGUIYDIVFQL72jfWiNoLCjqQ=;
        b=uxmoD9dCF32IUNp/AJQySKAEpjrqrgN7m1u608TohjV+KRM1cawX8R+1PXOIRjQ7dP
         jFGJm3PQD/g67HZJGC3id26OyzbmFxx3NQtUEsk8P1iZptVkrCmUpa68//OnqAlin4j0
         RmyAxlk+QnmKJBtIAwVp9Nfiau6RVm9eHgQuHznoCUwTqyRBCd1TL0vm79HpHZTvEzsn
         kPZ+hmUDlXaiqjpnYDZoeBn/yerYzM9h1gjPFFSI69Ct6MRJDR6NOCVYQPl9r37Dus32
         tcoAUttlXsDwOxBS8Cd2VRCXcc/1E2ohG55qn/5qXh/OC3uxIEuo/3jWRIdso8R1ZOwz
         dHtA==
X-Forwarded-Encrypted: i=1; AJvYcCVirzXESjXPCrLPspbghF4u97f0rlAdYeT/XdX4AfAkiHs1cdNJ0KaBI/NpAC6Mhgm8z7dEdendAPAM6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7rftyVeBtnFwYWJCPz1KOYgDFOfFI3ztqxDvkg9CmJVazdhq1
	3K6u12wWTT6ZUVJwXzjaVSVI0wHz0LCRA+nGhBKbjoLr+nXjVQMaAjfJ2H8NO+M=
X-Gm-Gg: ASbGncuCY5EIzIp0tSAeJPV18ARFZFUMF10gknW5ZDc4/JU9uGnAV8dpwp5aII/qgxb
	zEaUaBLJZ9YkYR1BtfEjC/G6LixKNNsCEwdwykGk4hJJpbJCBGjqXfSCvxaOVitFTsPStlsv7M2
	IRxk4UPaI6uChB0opuen+5Vfc8p7De/y8oe6iqBvn79ahcmwlFBlx86Ya9QezqvLPCjfAc7xTDE
	uGGQxIJuZzFIIlE70e3UHyPJNXXppjyhiuc/qCVvnhtPbeutAhPm+KOKKF0SQRTz0AFyUSEVs6i
	R4zyuWz9yNV2O2QOD5szHeymAK43hNoKA+0nXrBvmtVKAI/yvYwECeHW9u06QrytSfXd7bOfFPU
	yo9kBZxUBgt339woo8Q==
X-Google-Smtp-Source: AGHT+IHTemPYNTUynUWh83jsKhT4widmDCcaayD2CGUwpmZyqG/QggCO0fOH8ooS57JxWfPnFAgDDA==
X-Received: by 2002:a05:6000:2507:b0:390:e311:a8c7 with SMTP id ffacd0b85a97d-39ea51ecbecmr2515462f8f.5.1744377501994;
        Fri, 11 Apr 2025 06:18:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae978023sm2004192f8f.47.2025.04.11.06.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 06:18:21 -0700 (PDT)
Message-ID: <9bc74360-a74c-47f4-b8ad-3153bf47ea06@linaro.org>
Date: Fri, 11 Apr 2025 15:18:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v5 1/8] media: qcom: iris: move sm8250 to gen1 catalog
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
 <VyOGKudgZHGHSwAUc_c_syksKTaFJrgQwY5885fB812reMOnISG0ito3a9NquHCtVt9W2gENP3ioyZ7e0ne_Fw==@protonmail.internalid>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
 <a7f41eaa-74d0-42f6-ba80-afa62a521b7e@linaro.org>
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
In-Reply-To: <a7f41eaa-74d0-42f6-ba80-afa62a521b7e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/04/2025 13:50, Bryan O'Donoghue wrote:
> On 10/04/2025 17:30, Neil Armstrong wrote:
>> Re-organize the platform support core into a gen1 catalog C file
>> declaring common platform structure and include platform headers
>> containing platform specific entries and iris_platform_data
>> structure.
>>
>> The goal is to share most of the structure while having
>> clear and separate per-SoC catalog files.
>>
>> The organization is based on the current drm/msm dpu1 catalog
>> entries.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |  2 +-
>>   .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++++++++++++++++
>>   ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 ++-------------------
>>   3 files changed, 89 insertions(+), 76 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 35390534534e93f4617c1036a05ca0921567ba1d..7e7bc5ca81e0f0119846ccaff7f79fd17b8298ca 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -25,7 +25,7 @@ qcom-iris-objs += \
>>                iris_vpu_common.o \
>>
>>   ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
>> -qcom-iris-objs += iris_platform_sm8250.o
>> +qcom-iris-objs += iris_catalog_gen1.o
>>   endif
>>
>>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
>> diff --git a/drivers/media/platform/qcom/iris/iris_catalog_gen1.c b/drivers/media/platform/qcom/iris/iris_catalog_gen1.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c4590f8996431eb5103d45f01c6bee2b38b848c2
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_catalog_gen1.c
>> @@ -0,0 +1,83 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "iris_core.h"
>> +#include "iris_ctrls.h"
>> +#include "iris_platform_common.h"
>> +#include "iris_resources.h"
>> +#include "iris_hfi_gen1.h"
>> +#include "iris_hfi_gen1_defines.h"
>> +#include "iris_vpu_common.h"
> 
> Any reason why these aren't alphabetised ?

Copied as-is, I guess the order can be important, especially the iris_core must be first.

Neil

> 
> Please do so unless there's some technical reason to have in this order.
> 
>> +
>> +/* Common SM8250 & variants */
>> +static struct platform_inst_fw_cap inst_fw_cap_sm8250[] = {
>> +    {
>> +        .cap_id = PIPE,
>> +        .min = PIPE_1,
>> +        .max = PIPE_4,
>> +        .step_or_mask = 1,
>> +        .value = PIPE_4,
>> +        .hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
>> +        .set = iris_set_pipe,
>> +    },
>> +    {
>> +        .cap_id = STAGE,
>> +        .min = STAGE_1,
>> +        .max = STAGE_2,
>> +        .step_or_mask = 1,
>> +        .value = STAGE_2,
>> +        .hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
>> +        .set = iris_set_stage,
>> +    },
>> +    {
>> +        .cap_id = DEBLOCK,
>> +        .min = 0,
>> +        .max = 1,
>> +        .step_or_mask = 1,
>> +        .value = 0,
>> +        .hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
>> +        .set = iris_set_u32,
>> +    },
>> +};
>> +
>> +static struct platform_inst_caps platform_inst_cap_sm8250 = {
>> +    .min_frame_width = 128,
>> +    .max_frame_width = 8192,
>> +    .min_frame_height = 128,
>> +    .max_frame_height = 8192,
>> +    .max_mbpf = 138240,
>> +    .mb_cycles_vsp = 25,
>> +    .mb_cycles_vpp = 200,
>> +};
>> +
>> +static struct tz_cp_config tz_cp_config_sm8250 = {
>> +    .cp_start = 0,
>> +    .cp_size = 0x25800000,
>> +    .cp_nonpixel_start = 0x01000000,
>> +    .cp_nonpixel_size = 0x24800000,
>> +};
>> +
>> +static const u32 sm8250_vdec_input_config_param_default[] = {
>> +    HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
>> +    HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
>> +    HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
>> +    HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
>> +    HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
>> +    HFI_PROPERTY_PARAM_FRAME_SIZE,
>> +    HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
>> +    HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
>> +};
>> +
>> +static const u32 sm8250_dec_ip_int_buf_tbl[] = {
>> +    BUF_BIN,
>> +    BUF_SCRATCH_1,
>> +};
>> +
>> +static const u32 sm8250_dec_op_int_buf_tbl[] = {
>> +    BUF_DPB,
>> +};
>> +
>> +/* platforms catalogs */
>> +#include "iris_catalog_sm8250.h"
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_catalog_sm8250.h
>> similarity index 59%
>> rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> rename to drivers/media/platform/qcom/iris/iris_catalog_sm8250.h
>> index 5c86fd7b7b6fd36dc2d57a1705d915308b4c0f92..4d2df669b3e1df2ef2b0d2f88fc5f309b27546db 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> +++ b/drivers/media/platform/qcom/iris/iris_catalog_sm8250.h
>> @@ -1,55 +1,10 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>
>> -#include "iris_core.h"
>> -#include "iris_ctrls.h"
>> -#include "iris_platform_common.h"
>> -#include "iris_resources.h"
>> -#include "iris_hfi_gen1.h"
>> -#include "iris_hfi_gen1_defines.h"
>> -#include "iris_vpu_common.h"
>> -
>> -static struct platform_inst_fw_cap inst_fw_cap_sm8250[] = {
>> -    {
>> -        .cap_id = PIPE,
>> -        .min = PIPE_1,
>> -        .max = PIPE_4,
>> -        .step_or_mask = 1,
>> -        .value = PIPE_4,
>> -        .hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
>> -        .set = iris_set_pipe,
>> -    },
>> -    {
>> -        .cap_id = STAGE,
>> -        .min = STAGE_1,
>> -        .max = STAGE_2,
>> -        .step_or_mask = 1,
>> -        .value = STAGE_2,
>> -        .hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
>> -        .set = iris_set_stage,
>> -    },
>> -    {
>> -        .cap_id = DEBLOCK,
>> -        .min = 0,
>> -        .max = 1,
>> -        .step_or_mask = 1,
>> -        .value = 0,
>> -        .hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
>> -        .set = iris_set_u32,
>> -    },
>> -};
>> -
>> -static struct platform_inst_caps platform_inst_cap_sm8250 = {
>> -    .min_frame_width = 128,
>> -    .max_frame_width = 8192,
>> -    .min_frame_height = 128,
>> -    .max_frame_height = 8192,
>> -    .max_mbpf = 138240,
>> -    .mb_cycles_vsp = 25,
>> -    .mb_cycles_vpp = 200,
>> -};
>> +#ifndef _IRIS_CATALOG_SM8250_H
>> +#define _IRIS_CATALOG_SM8250_H
> 
> __IRIS_CATALOG_SM8250_H__ as with other header guards.
> 
>>
>>   static void iris_set_sm8250_preset_registers(struct iris_core *core)
>>   {
>> @@ -80,33 +35,6 @@ static const struct platform_clk_data sm8250_clk_table[] = {
>>       {IRIS_HW_CLK,   "vcodec0_core" },
>>   };
>>
>> -static struct tz_cp_config tz_cp_config_sm8250 = {
>> -    .cp_start = 0,
>> -    .cp_size = 0x25800000,
>> -    .cp_nonpixel_start = 0x01000000,
>> -    .cp_nonpixel_size = 0x24800000,
>> -};
>> -
>> -static const u32 sm8250_vdec_input_config_param_default[] = {
>> -    HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
>> -    HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
>> -    HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
>> -    HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
>> -    HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
>> -    HFI_PROPERTY_PARAM_FRAME_SIZE,
>> -    HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
>> -    HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
>> -};
>> -
>> -static const u32 sm8250_dec_ip_int_buf_tbl[] = {
>> -    BUF_BIN,
>> -    BUF_SCRATCH_1,
>> -};
>> -
>> -static const u32 sm8250_dec_op_int_buf_tbl[] = {
>> -    BUF_DPB,
>> -};
>> -
>>   struct iris_platform_data sm8250_data = {
>>       .get_instance = iris_hfi_gen1_get_instance,
>>       .init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>> @@ -147,3 +75,5 @@ struct iris_platform_data sm8250_data = {
>>       .dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
>>       .dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
>>   };
>> +
>> +#endif
>>
>> -- 
>> 2.34.1
>>
>>
> Once done.
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


