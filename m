Return-Path: <linux-media+bounces-41522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 924ACB3F686
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02E8918858FE
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC22E3398A;
	Tue,  2 Sep 2025 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKtcjt7m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DD82E173B
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797717; cv=none; b=C4SSHML4z6fBX9H5lijtvzxa5ave+Y11wl40j1JwBQlygtaoHnWiZrqGYet1hfVU9ZN3u22NeJoyxkmh6cyuKU5hOacf99lwMITZee03al+j2YUoLxUkm1388eO5vtsjFJorByQs0Cgob8zAb4mzWUf5epKMFe1uu5/qqEsmyww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797717; c=relaxed/simple;
	bh=Zs0tnsobZsI7c6E+p8g2dq4ldUmHOG1ffZ+rqR8/kjY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PlSRUzZWE8m7TaYkEzk9kd4m8YsABjznnm4vBL7QU3V5JVeIptR2ShApvsz3dq7Oa3hlPAy526ZbbeDF9ys2rbzS9pXqYCtLCKiA+vfniKoCsA/JsYZjBW6NZ9KwUY77CUlmj8ngyd2kWDaNyYaFSfJOaHad2PqTiDcKALyxnv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKtcjt7m; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b869d35a0so16757005e9.1
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 00:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756797713; x=1757402513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhIsRNkHrJPoyw9ZoNQ4n+bjWo3DQU+o2Umvo1l1HW0=;
        b=IKtcjt7mGHUVQU6Y7hcEcw14ffHPy0T2X2HufV9JLRx8fySVJPdwJKI3wjA6s7JBz3
         ovHjezFKwgOaU5qdrwFIxYjBKznbAv9+nXjkg7W/E6r6sDQHy+6vMf/l7vUsRPNn46QJ
         YDe00C1KTVjORW8m/uLOPkHfMjIts+57FbwXJLxn1ngyRgf6Y3tdrC3/iixp9z8gsT5b
         u0N+68l9jmhs4dKI0rhVhmNiIxrYZIorJCol7YIi2cWYUol/juiHBvrAomGDZyZ7bqTw
         BoZ388GOF+ODgOSjrx402CbW9BHWeEUhzSsbSb2FQSe6JeP6yPhVeO+kFM9NoAoups5z
         4rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797713; x=1757402513;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LhIsRNkHrJPoyw9ZoNQ4n+bjWo3DQU+o2Umvo1l1HW0=;
        b=r/PvBzt5oT6keFP8g/WU+2ijo80Yizo0VkwWgkWuf78OgpN0tItOG1uBJ/WsK4+vFv
         LUCK9fSLWlahdGnvhreXmMeoywYZrA6ycv0IlgtwD9ki89+EHlgVCyxpovyO0ZxXcdYV
         ZqYDeQoiUQ0S0YNuRswYpZfVSVXfy4go8gXKHDZxp4YLER+mICZOkF4P/OEH+WuR8Csn
         16DxijKBLMPtcqzHDnqe80EcM+iOtUa0seE84Vc2MkD5snvFyZgTdZkVMM6yWitOuEHh
         nvkrWsLcq7qZO/XHBiTlgCIS0KYd0rduRt0vUv90Qz/p7wsNB+T/BH3GN+FFsDtMQ+GC
         VjLQ==
X-Gm-Message-State: AOJu0YyP3RRMZhJ1sapZPcU7lTSidtECgTELuUY8uSXu7c97fq8ClQqV
	2E8UbKCqrO3KEnFjR9LM9pdg+UL7aJljwjtUZRqiTZsiv1A1jazx2ZV5Uc93Wt9bdyw=
X-Gm-Gg: ASbGnctTX5Tupu79UVHUWcXXb+D307wwp5XEPVz2klLm2pdcaB0QW/ngQU84D81WoAa
	pbt6TNSMtNMm0Tu31ZH6sGMpu28w1e2bqCH54ci+gc0fBq/EiKtqnyKasYNtexCFyTutxTdQcdk
	SWO8Ymc8r0pkRai1qkt4WtsSiPFZrI6j3A9ZjE+4W+hdG15massUHB46W4A/vCagjZpZa16pX6+
	vRK38dzEqlp1u5vjFgkiKeTugmiItiAKaKHv5ytrhnZ4i88NshXtMSyWSN/DQ4VqXenMmSKJhKh
	Omo9ujfSLGtCU8W+v+yKXOiie85f3SYRzxhYv3Lgc/+G8huZXofirsXfUo/NJlFIku4IJhXIpX/
	w9VTksJ2sUSnItylf0tmBQ5hNaV2i7XpyweqVyul6mszIwMp3qv9vKo419UzX8d6B33456yJzOh
	YGL3mp7cUz5q+or8tjkvYQ
X-Google-Smtp-Source: AGHT+IHgIwugHqnvtIi4+qhS3vmv9CqO/XI5P70aJX2HvgCdP1meWFSB7vF7JhpyFHFtwGarm/Hjfg==
X-Received: by 2002:a05:600c:4f08:b0:45b:8866:510e with SMTP id 5b1f17b1804b1-45b886652abmr64800635e9.25.1756797713178;
        Tue, 02 Sep 2025 00:21:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939? ([2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b73cf86f4sm243554985e9.6.2025.09.02.00.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 00:21:52 -0700 (PDT)
Message-ID: <6428c9b2-7690-46ba-87fa-7b782ba7a1ac@linaro.org>
Date: Tue, 2 Sep 2025 09:21:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] media: iris: add VPU33 specific encoding buffer
 calculation
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250901-topic-sm8x50-iris-encoder-v3-hevc-debug-v2-1-c65406bbdf68@linaro.org>
 <19f83c54-bff7-5316-1255-f64dbf487c35@quicinc.com>
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
In-Reply-To: <19f83c54-bff7-5316-1255-f64dbf487c35@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2025 07:31, Vikash Garodia wrote:
> 
> On 9/1/2025 1:25 PM, Neil Armstrong wrote:
>> The VPU33 found in the SM8650 Platform requires some slighly different
>> buffer calculation for encoding to allow working with the latest
>> firwware uploaded on linux-firmware at [1].
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=ece445af91bbee49bf0d8b23c2b99b596ae6eac7
>>
>> Suggested-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> [2] https://lore.kernel.org/all/20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com/
>> ---
>> Changes in v2:
>> - Removed calculation fix for hevc encoding, as it was added in common code
>> - Link to v1: https://lore.kernel.org/r/20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-v1-1-633d904ff7d3@linaro.org
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c     |   2 +-
>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
>>   .../platform/qcom/iris/iris_platform_common.h      |   2 +
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |   4 +
>>   .../platform/qcom/iris/iris_platform_sm8250.c      |   2 +
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 110 ++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   3 +-
>>   7 files changed, 118 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index 8891a297d384b018b3cc8313ad6416db6317798b..c0900038e7defccf7de3cb60e17c71e36a0e8ead 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -284,7 +284,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
>>   {
>>   	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>>   
>> -	buffers->size = iris_vpu_buf_size(inst, buffer_type);
>> +	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
>>   	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>>   }
>>   
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index 29cf392ca2566da286ea3e928ce4a22c2e970cc8..e1788c266bb1080921f17248fd5ee60156b3143d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -911,7 +911,7 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst, u32 plane)
>>   
>>   	if (iris_split_mode_enabled(inst)) {
>>   		bufsz.type = HFI_BUFFER_OUTPUT;
>> -		bufsz.size = iris_vpu_buf_size(inst, BUF_DPB);
>> +		bufsz.size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, BUF_DPB);
>>   
>>   		ret = hfi_gen1_set_property(inst, ptype, &bufsz, sizeof(bufsz));
>>   		if (ret)
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 96fa7b1bb592441e85664da408ea4ba42c9a15b5..7057c4cd1a9ebefa02c855014e5f19993da58e38 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -7,6 +7,7 @@
>>   #define __IRIS_PLATFORM_COMMON_H__
>>   
>>   #include <linux/bits.h>
>> +#include "iris_buffer.h"
>>   
>>   struct iris_core;
>>   struct iris_inst;
>> @@ -189,6 +190,7 @@ struct iris_platform_data {
>>   	void (*init_hfi_command_ops)(struct iris_core *core);
>>   	void (*init_hfi_response_ops)(struct iris_core *core);
>>   	struct iris_inst *(*get_instance)(void);
>> +	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>   	const struct vpu_ops *vpu_ops;
>>   	void (*set_preset_registers)(struct iris_core *core);
>>   	const struct icc_info *icc_tbl;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index cf4b92f534b272a0a1ac2a0e7bb9316501374332..78a04e76de7c00703b84bd3c1c6e9a884ee7cebe 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -8,6 +8,7 @@
>>   #include "iris_hfi_gen2.h"
>>   #include "iris_hfi_gen2_defines.h"
>>   #include "iris_platform_common.h"
>> +#include "iris_vpu_buffer.h"
>>   #include "iris_vpu_common.h"
>>   
>>   #include "iris_platform_qcs8300.h"
>> @@ -738,6 +739,7 @@ struct iris_platform_data sm8550_data = {
>>   	.get_instance = iris_hfi_gen2_get_instance,
>>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>>   	.vpu_ops = &iris_vpu3_ops,
>>   	.set_preset_registers = iris_set_sm8550_preset_registers,
>>   	.icc_tbl = sm8550_icc_table,
>> @@ -827,6 +829,7 @@ struct iris_platform_data sm8650_data = {
>>   	.get_instance = iris_hfi_gen2_get_instance,
>>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu33x_buf_size,
> 
> Pls keep it as vpu33, instead of 33x, as 33 is the variant of 3x. Accordingly at
> other places as well in this patch.

Ok will use vpu33.

Thx,
Neil

> 
> Regards,
> Vikash
> 
>>   	.vpu_ops = &iris_vpu33_ops,
>>   	.set_preset_registers = iris_set_sm8550_preset_registers,
>>   	.icc_tbl = sm8550_icc_table,
>> @@ -916,6 +919,7 @@ struct iris_platform_data qcs8300_data = {
>>   	.get_instance = iris_hfi_gen2_get_instance,
>>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>>   	.vpu_ops = &iris_vpu3_ops,
>>   	.set_preset_registers = iris_set_sm8550_preset_registers,
>>   	.icc_tbl = sm8550_icc_table,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> index 978d0130d43b5f6febb65430a9bbe3932e8f24df..16486284f8acccf6a95a27f6003e885226e28f4d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> @@ -9,6 +9,7 @@
>>   #include "iris_resources.h"
>>   #include "iris_hfi_gen1.h"
>>   #include "iris_hfi_gen1_defines.h"
>> +#include "iris_vpu_buffer.h"
>>   #include "iris_vpu_common.h"
>>   
>>   #define BITRATE_MIN		32000
>> @@ -317,6 +318,7 @@ struct iris_platform_data sm8250_data = {
>>   	.get_instance = iris_hfi_gen1_get_instance,
>>   	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>>   	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>>   	.vpu_ops = &iris_vpu2_ops,
>>   	.set_preset_registers = iris_set_sm8250_preset_registers,
>>   	.icc_tbl = sm8250_icc_table,
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 34a9094201ccd11d30a776f284ede8248d8017a9..9cb7701722c3644ef4c369fa58490ac83258ea7e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -867,6 +867,34 @@ u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>>   		      (((((max_t(u32, (frame_width_coded),
>>   				 (frame_height_coded)) + 3) >> 2) << 5) + 256) * 16)), 256);
>>   }
>> +static inline
>> +u32 size_vpss_line_buf_vpu33x(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>> +			      u32 frame_width_coded)
>> +{
>> +	u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0;
>> +	u32 vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0;
>> +	u32 size_left = 0, size_top = 0;
>> +
>> +	vpss_4tap_top = (max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3;
>> +	vpss_4tap_top >>= 2;
>> +	vpss_4tap_top <<= 4;
>> +	vpss_4tap_top += 256;
>> +	vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
>> +	vpss_div2_top = max_t(u32, frame_width_coded, frame_height_coded) + 3;
>> +	vpss_div2_top >>= 2;
>> +	vpss_div2_top <<= 4;
>> +	vpss_div2_top += 256;
>> +	vpss_div2_left = (max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3;
>> +	vpss_div2_left >>= 2;
>> +	vpss_div2_left <<= 5;
>> +	vpss_div2_left += 64;
>> +	vpss_top_lb = (frame_width_coded + 1) << 3;
>> +	vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
>> +	size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
>> +	size_top = (vpss_4tap_top + vpss_div2_top) * 2;
>> +
>> +	return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb, DMA_ALIGNMENT);
>> +}
>>   
>>   static inline
>>   u32 size_top_line_buf_first_stg_sao(u32 frame_width_coded)
>> @@ -977,8 +1005,8 @@ static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
>>   }
>>   
>>   static inline
>> -u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
>> -			u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
>> +u32 hfi_buffer_line_enc_base(u32 frame_width, u32 frame_height, bool is_ten_bit,
>> +			     u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
>>   {
>>   	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
>>   	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
>> @@ -1018,10 +1046,38 @@ u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
>>   		line_buff_recon_pix_size +
>>   		size_left_linebuff_ctrl_fe(frame_height_coded, num_vpp_pipes_enc) +
>>   		size_line_buf_sde(frame_width_coded) +
>> -		size_vpss_line_buf(num_vpp_pipes_enc, frame_height_coded, frame_width_coded) +
>>   		size_top_line_buf_first_stg_sao(frame_width_coded);
>>   }
>>   
>> +static inline
>> +u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
>> +			u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
>> +{
>> +	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
>> +	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
>> +	u32 frame_height_coded = height_in_lcus * (lcu_size);
>> +	u32 frame_width_coded = width_in_lcus * (lcu_size);
>> +
>> +	return hfi_buffer_line_enc_base(frame_width, frame_height, is_ten_bit,
>> +					num_vpp_pipes_enc, lcu_size, standard) +
>> +		size_vpss_line_buf(num_vpp_pipes_enc, frame_height_coded, frame_width_coded);
>> +}
>> +
>> +static inline
>> +u32 hfi_buffer_line_enc_vpu33x(u32 frame_width, u32 frame_height, bool is_ten_bit,
>> +			       u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
>> +{
>> +	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
>> +	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
>> +	u32 frame_height_coded = height_in_lcus * (lcu_size);
>> +	u32 frame_width_coded = width_in_lcus * (lcu_size);
>> +
>> +	return hfi_buffer_line_enc_base(frame_width, frame_height, is_ten_bit,
>> +					num_vpp_pipes_enc, lcu_size, standard) +
>> +		size_vpss_line_buf_vpu33x(num_vpp_pipes_enc, frame_height_coded,
>> +					  frame_width_coded);
>> +}
>> +
>>   static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
>>   {
>>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
>> @@ -1040,6 +1096,24 @@ static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
>>   				   lcu_size, HFI_CODEC_ENCODE_AVC);
>>   }
>>   
>> +static u32 iris_vpu33x_enc_line_size(struct iris_inst *inst)
>> +{
>> +	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
>> +	struct v4l2_format *f = inst->fmt_dst;
>> +	u32 height = f->fmt.pix_mp.height;
>> +	u32 width = f->fmt.pix_mp.width;
>> +	u32 lcu_size = 16;
>> +
>> +	if (inst->codec == V4L2_PIX_FMT_HEVC) {
>> +		lcu_size = 32;
>> +		return hfi_buffer_line_enc_vpu33x(width, height, 0, num_vpp_pipes,
>> +						  lcu_size, HFI_CODEC_ENCODE_HEVC);
>> +	}
>> +
>> +	return hfi_buffer_line_enc_vpu33x(width, height, 0, num_vpp_pipes,
>> +					  lcu_size, HFI_CODEC_ENCODE_AVC);
>> +}
>> +
>>   static inline
>>   u32 hfi_buffer_dpb_enc(u32 frame_width, u32 frame_height, bool is_ten_bit)
>>   {
>> @@ -1387,7 +1461,7 @@ struct iris_vpu_buf_type_handle {
>>   	u32 (*handle)(struct iris_inst *inst);
>>   };
>>   
>> -int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>> +u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>>   {
>>   	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
>>   	u32 size = 0, buf_type_handle_size = 0, i;
>> @@ -1431,6 +1505,34 @@ int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>>   	return size;
>>   }
>>   
>> +u32 iris_vpu33x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>> +{
>> +	u32 size = 0, i;
>> +
>> +	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
>> +		{BUF_BIN,         iris_vpu_enc_bin_size         },
>> +		{BUF_COMV,        iris_vpu_enc_comv_size        },
>> +		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size    },
>> +		{BUF_LINE,        iris_vpu33x_enc_line_size     },
>> +		{BUF_ARP,         iris_vpu_enc_arp_size         },
>> +		{BUF_VPSS,        iris_vpu_enc_vpss_size        },
>> +		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size    },
>> +		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size    },
>> +	};
>> +
>> +	if (inst->domain == DECODER)
>> +		return iris_vpu_buf_size(inst, buffer_type);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(enc_internal_buf_type_handle); i++) {
>> +		if (enc_internal_buf_type_handle[i].type == buffer_type) {
>> +			size = enc_internal_buf_type_handle[i].handle(inst);
>> +			break;
>> +		}
>> +	}
>> +
>> +	return size;
>> +}
>> +
>>   static u32 internal_buffer_count(struct iris_inst *inst,
>>   				 enum iris_buffer_type buffer_type)
>>   {
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> index 94668c5b3d15fb6e10d0b5ed6ed704cadb5a6534..e4fd1fcf2dbf25e69d55599a8fd4ad775f9e6575 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> @@ -146,7 +146,8 @@ static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
>>   	return DIV_ROUND_UP(frame_width, 64) * DIV_ROUND_UP(frame_height, 64) * 128;
>>   }
>>   
>> -int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>> +u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>> +u32 iris_vpu33x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>   int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>   
>>   #endif
>>
>> ---
>> base-commit: 58717ecfffd642c1e0950dee4a247dd6cdfeb31e
>> change-id: 20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-10173f4838e3
>>
>> Best regards,


