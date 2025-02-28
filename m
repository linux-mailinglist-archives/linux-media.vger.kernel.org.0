Return-Path: <linux-media+bounces-27237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8E3A49AC3
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 14:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43D7F3BBDAE
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 13:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027452702B3;
	Fri, 28 Feb 2025 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aseIQjU8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E43E2702A5
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750026; cv=none; b=mNuepjoCSHJHKiTIr/xAVmDxIMYh+tvjCZzP5LPGud9CcsJKrT9fcCpGL3yqOprQbzKzdxgZ5+2CDCO82V6TyUMWRPo2RvpgUfe0QpfgpQ1fFmFYhd/gO3gggtOdXGaEAVraCNTMU1VdC5e4gzLu3l5WAXyaXghWMA0wGz2DBeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750026; c=relaxed/simple;
	bh=gR5Zcj55/8D20OW9iA3dUJGgaV1eNgfm+uM9z/HrrnI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jnnHyF+AT07IFPUtm79++5uJ7Aks8d+tND48JzE68KB8EqDG13cyLj8kL/j99DSYCMeMvacbpQGnfWIKwtW0rbGDd4dA6IN5nWZT0hd7qQkk+aHJ/JDWEr9jcqDlAWFvhoT6Ej5Jakjh/12gAMxFqjXT8Z1dUI9HJZRDJ5xSXAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aseIQjU8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390dd3403fdso1834811f8f.0
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 05:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740750022; x=1741354822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKntXOyyKX1EgN1KaBe/IN13YUSES8wtnxl9xP2rut4=;
        b=aseIQjU8Rq5bLI9qYHl4x7Id3AXXYcRX0CIT+P5nBV4MkmnQ8arZVfZP3iYzTDoNTj
         2ulMhJAgOnb5dOJZrF4UTJ0KnpJABwnatooV4jGBjupEo6ZphhqaZvCdbDBr3mzp3VKZ
         34pyTtSwCyGBwoamCMfvPh4X83D8AllEwnFYPpPKuVNJ++rAY19QUa7Kfm5IW45Evgzt
         Yv1DGkNJ/h0s245+CsR+022PFB8/9Zk4xnA6+hCr9z6xbRz7acU2dCy0a2PHSgudSvM2
         qCi7nlGpnRzrpbEcwt6nkuYBKMPNNiMxuQ7/hCHoRYP0gixxp30gvKCQw7/H/8VlZSt2
         FyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740750022; x=1741354822;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uKntXOyyKX1EgN1KaBe/IN13YUSES8wtnxl9xP2rut4=;
        b=KGsZ/yT9lEBQaQAju7DZt5mqUzt6FTWCU4tLjRVAC47Wm/WpvQjAD6GIhW6Aph8Qj2
         EXmz5qmyHDTlUYUEhjSzvcMpSQu5nD+jo4dacm4B4uD6O5qmU/Pbn2WPZemuFzGhu09K
         Oo00GnIX9IuIc0maoXOVFrs/dY0uve4u/UtSvFoHOkstvUV4+//abIj+oLV0YKtoYRss
         Kgpz2rPzUalvldfPftWO5zAkgWiOVI+QApFmy38yLJe20KkRGV6tCETVmz3/1pBEw3pO
         VUucyXgb1it/uRjoJhWT/TT5ZPi4Ng1P7Ie7GGglcJdxgoxWGkV78JDFgEk38CQIpq1H
         6bXg==
X-Forwarded-Encrypted: i=1; AJvYcCXsxCqOpkuwI53qzlNFxsTGya0SQre4BzY/Zos1wfgQZDCA0IJq7TVsxE6eY84rjFIgMjCdB206pZW3Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5rP0drsgCPszmPPLTZoxqIGAAsPUb22Ja3DEhbxHZLZqbZAlA
	gcx4gfM0gtfC0v7XVXIG6KEWjsWy81M+sjTrs4eB8VTE/8o34r6tlydWw9c5iOw=
X-Gm-Gg: ASbGncuPl20r7fmoTvo1iLNovWINXKmWx/pNjpTAE3hK0aEZAWfIKo1nmpxeg2R0tkJ
	0yK4GLo4XmtSBNK4BVIh0iVu9pQcEebiVCKeH8lz+RxGD+Hccmx3Hj27p4WjChbxh7j5huP4NZz
	ipI9N9J0aLveU+3FjupqorjxKhE8DncaQkWKwh+Q++PqtvrUfdX52Eyj/NA7h6Z+ZdC/fnZu5i2
	Ym52nCkQRaGnt0HNMX8LkEeww4WhIgssahOwa38EKP2ESp/FWo60sMgg+7GVRak7oOC+6F9UI0i
	W/tN2cv6J0gsrlar+7HAgpdtN4Cv7DjM8dywIcCGHkC4amuqXsyxy79rOtJDGHUyQJhMmdyxBR5
	6FSE=
X-Google-Smtp-Source: AGHT+IH2AoUaVKBBbSu/5QBUPn8F/0QDpvD2thkPQYzxgTpnVQSYe88rqF8a7Bop0kR5KF9ctv3D4Q==
X-Received: by 2002:a5d:5848:0:b0:390:d7e5:e8b2 with SMTP id ffacd0b85a97d-390ec7ceca1mr2541466f8f.17.1740750022327;
        Fri, 28 Feb 2025 05:40:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c728:ed22:3bb8:f351? ([2a01:e0a:982:cbb0:c728:ed22:3bb8:f351])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a5b96sm5266269f8f.29.2025.02.28.05.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 05:40:21 -0800 (PST)
Message-ID: <5089b69f-1f56-4a57-9c9a-37fc4357611b@linaro.org>
Date: Fri, 28 Feb 2025 14:40:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/4] media: platform: qcom/iris: add sm8650 support
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-4-128ef05d9665@linaro.org>
 <10f54cb9-8939-b8ce-22c2-b633732f8879@quicinc.com>
 <40b185dc-4d89-44ba-ad58-0b89339d5d11@linaro.org>
 <c734f628-b439-45f0-d8de-931151327f10@quicinc.com>
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
In-Reply-To: <c734f628-b439-45f0-d8de-931151327f10@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/02/2025 14:35, Vikash Garodia wrote:
> 
> 
> On 2/28/2025 6:05 PM, Neil Armstrong wrote:
>> On 28/02/2025 13:15, Dikshita Agarwal wrote:
>>>
>>>
>>> On 2/25/2025 2:35 PM, Neil Armstrong wrote:
>>>> Add support for the SM8650 platform by re-using the SM8550
>>>> definitions and using the vpu33 ops.
>>>>
>>>> The SM8650/vpu33 requires more reset lines, but the H.284
>>>> decoder capabilities are identical.
>>>>
>>> As you also noted, only delta between SM8550 and SM8650 is reset lines,
>>> rest all configurations are same. Could you think of a better way to reuse
>>> SM8550 platform data for SM8650.
>>
>> It depends on how you plan to keep compat in long term, while it's very
>> similar for H.264 decoding, it differs for other codecs.
>>
>> So we would indeed have common stuff for now, but when introducing
>> now codecs we would need separate definitions.
> SM8550 and SM8650 have same capabilities for other video codecs as well.

Ok it's not obvious when looking at downstream, so
I guess we can share the same platform file for both platforms ?
or add a common code with only the iris_platform_data in each soc code ?

Neil
> 
> Regards,
> Vikash
>>
>> Neil
>>
>>>
>>> Thanks,
>>> Dikshita
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/media/platform/qcom/iris/Makefile          |   1 +
>>>>    .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>>>    .../platform/qcom/iris/iris_platform_sm8650.c      | 266 +++++++++++++++++++++
>>>>    drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>>>>    4 files changed, 272 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/Makefile
>>>> b/drivers/media/platform/qcom/iris/Makefile
>>>> index
>>>> 6b64c9988505afd9707c704449d60bb53209229f..4caba81a95b806b9fa4937d9c7973031dea43d0e 100644
>>>> --- a/drivers/media/platform/qcom/iris/Makefile
>>>> +++ b/drivers/media/platform/qcom/iris/Makefile
>>>> @@ -11,6 +11,7 @@ qcom-iris-objs += \
>>>>                 iris_hfi_gen2_response.o \
>>>>                 iris_hfi_queue.o \
>>>>                 iris_platform_sm8550.o \
>>>> +             iris_platform_sm8650.o \
>>>>                 iris_power.o \
>>>>                 iris_probe.o \
>>>>                 iris_resources.o \
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> index
>>>> f6b15d2805fb2004699709bb12cd7ce9b052180c..75e266a6b718acb8518079c2125dfb30435cbf2b 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> @@ -35,6 +35,7 @@ enum pipe_type {
>>>>      extern struct iris_platform_data sm8250_data;
>>>>    extern struct iris_platform_data sm8550_data;
>>>> +extern struct iris_platform_data sm8650_data;
>>>>      enum platform_clk_type {
>>>>        IRIS_AXI_CLK,
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8650.c
>>>> b/drivers/media/platform/qcom/iris/iris_platform_sm8650.c
>>>> new file mode 100644
>>>> index
>>>> 0000000000000000000000000000000000000000..823e349dead2606129e52d6d2d674cb2550eaf17
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8650.c
>>>> @@ -0,0 +1,266 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>>>> reserved.
>>>> + */
>>>> +
>>>> +#include "iris_core.h"
>>>> +#include "iris_ctrls.h"
>>>> +#include "iris_hfi_gen2.h"
>>>> +#include "iris_hfi_gen2_defines.h"
>>>> +#include "iris_platform_common.h"
>>>> +#include "iris_vpu_common.h"
>>>> +
>>>> +#define VIDEO_ARCH_LX 1
>>>> +
>>>> +static struct platform_inst_fw_cap inst_fw_cap_sm8650[] = {
>>>> +    {
>>>> +        .cap_id = PROFILE,
>>>> +        .min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
>>>> +        .max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
>>>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
>>>> +        .value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>> +        .hfi_id = HFI_PROP_PROFILE,
>>>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>>> +        .set = iris_set_u32_enum,
>>>> +    },
>>>> +    {
>>>> +        .cap_id = LEVEL,
>>>> +        .min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
>>>> +        .max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
>>>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
>>>> +        .value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
>>>> +        .hfi_id = HFI_PROP_LEVEL,
>>>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>>> +        .set = iris_set_u32_enum,
>>>> +    },
>>>> +    {
>>>> +        .cap_id = INPUT_BUF_HOST_MAX_COUNT,
>>>> +        .min = DEFAULT_MAX_HOST_BUF_COUNT,
>>>> +        .max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
>>>> +        .step_or_mask = 1,
>>>> +        .value = DEFAULT_MAX_HOST_BUF_COUNT,
>>>> +        .hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
>>>> +        .flags = CAP_FLAG_INPUT_PORT,
>>>> +        .set = iris_set_u32,
>>>> +    },
>>>> +    {
>>>> +        .cap_id = STAGE,
>>>> +        .min = STAGE_1,
>>>> +        .max = STAGE_2,
>>>> +        .step_or_mask = 1,
>>>> +        .value = STAGE_2,
>>>> +        .hfi_id = HFI_PROP_STAGE,
>>>> +        .set = iris_set_stage,
>>>> +    },
>>>> +    {
>>>> +        .cap_id = PIPE,
>>>> +        .min = PIPE_1,
>>>> +        .max = PIPE_4,
>>>> +        .step_or_mask = 1,
>>>> +        .value = PIPE_4,
>>>> +        .hfi_id = HFI_PROP_PIPE,
>>>> +        .set = iris_set_pipe,
>>>> +    },
>>>> +    {
>>>> +        .cap_id = POC,
>>>> +        .min = 0,
>>>> +        .max = 2,
>>>> +        .step_or_mask = 1,
>>>> +        .value = 1,
>>>> +        .hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
>>>> +    },
>>>> +    {
>>>> +        .cap_id = CODED_FRAMES,
>>>> +        .min = CODED_FRAMES_PROGRESSIVE,
>>>> +        .max = CODED_FRAMES_PROGRESSIVE,
>>>> +        .step_or_mask = 0,
>>>> +        .value = CODED_FRAMES_PROGRESSIVE,
>>>> +        .hfi_id = HFI_PROP_CODED_FRAMES,
>>>> +    },
>>>> +    {
>>>> +        .cap_id = BIT_DEPTH,
>>>> +        .min = BIT_DEPTH_8,
>>>> +        .max = BIT_DEPTH_8,
>>>> +        .step_or_mask = 1,
>>>> +        .value = BIT_DEPTH_8,
>>>> +        .hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
>>>> +    },
>>>> +    {
>>>> +        .cap_id = RAP_FRAME,
>>>> +        .min = 0,
>>>> +        .max = 1,
>>>> +        .step_or_mask = 1,
>>>> +        .value = 1,
>>>> +        .hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
>>>> +        .flags = CAP_FLAG_INPUT_PORT,
>>>> +        .set = iris_set_u32,
>>>> +    },
>>>> +};
>>>> +
>>>> +static struct platform_inst_caps platform_inst_cap_sm8650 = {
>>>> +    .min_frame_width = 96,
>>>> +    .max_frame_width = 8192,
>>>> +    .min_frame_height = 96,
>>>> +    .max_frame_height = 8192,
>>>> +    .max_mbpf = (8192 * 4352) / 256,
>>>> +    .mb_cycles_vpp = 200,
>>>> +    .mb_cycles_fw = 489583,
>>>> +    .mb_cycles_fw_vpp = 66234,
>>>> +    .num_comv = 0,
>>>> +};
>>>> +
>>>> +static void iris_set_sm8650_preset_registers(struct iris_core *core)
>>>> +{
>>>> +    writel(0x0, core->reg_base + 0xB0088);
>>>> +}
>>>> +
>>>> +static const struct icc_info sm8650_icc_table[] = {
>>>> +    { "cpu-cfg",    1000, 1000     },
>>>> +    { "video-mem",  1000, 15000000 },
>>>> +};
>>>> +
>>>> +static const char * const sm8650_clk_reset_table[] = { "bus", "xo", "core" };
>>>> +
>>>> +static const struct bw_info sm8650_bw_table_dec[] = {
>>>> +    { ((4096 * 2160) / 256) * 60, 1608000 },
>>>> +    { ((4096 * 2160) / 256) * 30,  826000 },
>>>> +    { ((1920 * 1080) / 256) * 60,  567000 },
>>>> +    { ((1920 * 1080) / 256) * 30,  294000 },
>>>> +};
>>>> +
>>>> +static const char * const sm8650_pmdomain_table[] = { "venus", "vcodec0" };
>>>> +
>>>> +static const char * const sm8650_opp_pd_table[] = { "mxc", "mmcx" };
>>>> +
>>>> +static const struct platform_clk_data sm8650_clk_table[] = {
>>>> +    {IRIS_AXI_CLK,  "iface"        },
>>>> +    {IRIS_CTRL_CLK, "core"         },
>>>> +    {IRIS_HW_CLK,   "vcodec0_core" },
>>>> +};
>>>> +
>>>> +static struct ubwc_config_data ubwc_config_sm8650 = {
>>>> +    .max_channels = 8,
>>>> +    .mal_length = 32,
>>>> +    .highest_bank_bit = 16,
>>>> +    .bank_swzl_level = 0,
>>>> +    .bank_swz2_level = 1,
>>>> +    .bank_swz3_level = 1,
>>>> +    .bank_spreading = 1,
>>>> +};
>>>> +
>>>> +static struct tz_cp_config tz_cp_config_sm8650 = {
>>>> +    .cp_start = 0,
>>>> +    .cp_size = 0x25800000,
>>>> +    .cp_nonpixel_start = 0x01000000,
>>>> +    .cp_nonpixel_size = 0x24800000,
>>>> +};
>>>> +
>>>> +static const u32 sm8650_vdec_input_config_params[] = {
>>>> +    HFI_PROP_BITSTREAM_RESOLUTION,
>>>> +    HFI_PROP_CROP_OFFSETS,
>>>> +    HFI_PROP_CODED_FRAMES,
>>>> +    HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
>>>> +    HFI_PROP_PIC_ORDER_CNT_TYPE,
>>>> +    HFI_PROP_PROFILE,
>>>> +    HFI_PROP_LEVEL,
>>>> +    HFI_PROP_SIGNAL_COLOR_INFO,
>>>> +};
>>>> +
>>>> +static const u32 sm8650_vdec_output_config_params[] = {
>>>> +    HFI_PROP_COLOR_FORMAT,
>>>> +    HFI_PROP_LINEAR_STRIDE_SCANLINE,
>>>> +};
>>>> +
>>>> +static const u32 sm8650_vdec_subscribe_input_properties[] = {
>>>> +    HFI_PROP_NO_OUTPUT,
>>>> +};
>>>> +
>>>> +static const u32 sm8650_vdec_subscribe_output_properties[] = {
>>>> +    HFI_PROP_PICTURE_TYPE,
>>>> +    HFI_PROP_CABAC_SESSION,
>>>> +};
>>>> +
>>>> +static const u32 sm8650_dec_ip_int_buf_tbl[] = {
>>>> +    BUF_BIN,
>>>> +    BUF_COMV,
>>>> +    BUF_NON_COMV,
>>>> +    BUF_LINE,
>>>> +};
>>>> +
>>>> +static const u32 sm8650_dec_op_int_buf_tbl[] = {
>>>> +    BUF_DPB,
>>>> +};
>>>> +
>>>> +struct iris_platform_data sm8650_data = {
>>>> +    .get_instance = iris_hfi_gen2_get_instance,
>>>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>>> +    .vpu_ops = &iris_vpu33_ops,
>>>> +    .set_preset_registers = iris_set_sm8650_preset_registers,
>>>> +    .icc_tbl = sm8650_icc_table,
>>>> +    .icc_tbl_size = ARRAY_SIZE(sm8650_icc_table),
>>>> +    .clk_rst_tbl = sm8650_clk_reset_table,
>>>> +    .clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
>>>> +    .bw_tbl_dec = sm8650_bw_table_dec,
>>>> +    .bw_tbl_dec_size = ARRAY_SIZE(sm8650_bw_table_dec),
>>>> +    .pmdomain_tbl = sm8650_pmdomain_table,
>>>> +    .pmdomain_tbl_size = ARRAY_SIZE(sm8650_pmdomain_table),
>>>> +    .opp_pd_tbl = sm8650_opp_pd_table,
>>>> +    .opp_pd_tbl_size = ARRAY_SIZE(sm8650_opp_pd_table),
>>>> +    .clk_tbl = sm8650_clk_table,
>>>> +    .clk_tbl_size = ARRAY_SIZE(sm8650_clk_table),
>>>> +    /* Upper bound of DMA address range */
>>>> +    .dma_mask = 0xe0000000 - 1,
>>>> +    .fwname = "qcom/vpu/vpu33_p4.mbn",
>>>> +    .pas_id = IRIS_PAS_ID,
>>>> +    .inst_caps = &platform_inst_cap_sm8650,
>>>> +    .inst_fw_caps = inst_fw_cap_sm8650,
>>>> +    .inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8650),
>>>> +    .tz_cp_config_data = &tz_cp_config_sm8650,
>>>> +    .core_arch = VIDEO_ARCH_LX,
>>>> +    .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>>> +    .ubwc_config = &ubwc_config_sm8650,
>>>> +    .num_vpp_pipe = 4,
>>>> +    .max_session_count = 16,
>>>> +    .max_core_mbpf = ((8192 * 4352) / 256) * 2,
>>>> +    .input_config_params =
>>>> +        sm8650_vdec_input_config_params,
>>>> +    .input_config_params_size =
>>>> +        ARRAY_SIZE(sm8650_vdec_input_config_params),
>>>> +    .output_config_params =
>>>> +        sm8650_vdec_output_config_params,
>>>> +    .output_config_params_size =
>>>> +        ARRAY_SIZE(sm8650_vdec_output_config_params),
>>>> +    .dec_input_prop = sm8650_vdec_subscribe_input_properties,
>>>> +    .dec_input_prop_size = ARRAY_SIZE(sm8650_vdec_subscribe_input_properties),
>>>> +    .dec_output_prop = sm8650_vdec_subscribe_output_properties,
>>>> +    .dec_output_prop_size =
>>>> ARRAY_SIZE(sm8650_vdec_subscribe_output_properties),
>>>> +
>>>> +    .dec_ip_int_buf_tbl = sm8650_dec_ip_int_buf_tbl,
>>>> +    .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8650_dec_ip_int_buf_tbl),
>>>> +    .dec_op_int_buf_tbl = sm8650_dec_op_int_buf_tbl,
>>>> +    .dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8650_dec_op_int_buf_tbl),
>>>> +};
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c
>>>> b/drivers/media/platform/qcom/iris/iris_probe.c
>>>> index
>>>> aca442dcc153830e6252d1dca87afb38c0b9eb8f..8e6cc1dc529608696e81f2764e90ea3864030125 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>>> @@ -330,6 +330,10 @@ static const struct of_device_id iris_dt_match[] = {
>>>>                .data = &sm8250_data,
>>>>            },
>>>>    #endif
>>>> +    {
>>>> +        .compatible = "qcom,sm8650-iris",
>>>> +        .data = &sm8650_data,
>>>> +    },
>>>>        { },
>>>>    };
>>>>    MODULE_DEVICE_TABLE(of, iris_dt_match);
>>>>
>>


