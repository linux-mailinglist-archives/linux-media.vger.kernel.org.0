Return-Path: <linux-media+bounces-40751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2ADB3161E
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 13:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 889A1A24BA8
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 11:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120502E8B74;
	Fri, 22 Aug 2025 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BHtOQyOP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1780E20330
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755860940; cv=none; b=JTqPeCfqyPOst186nVTCY3ZCvCWk+7cradsHvt0KWakAR2eTUooG8gcBNt1wQaKOyYSJ+7VN58tuf5Cp6kspul6+//Ci08tiu0rYzSzpysFXcEzcJolK/QuGkV0YnSYb1PZGA3Mk8tcTfYarBH4JV7HdQUR78qnuGdV+CnTuRc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755860940; c=relaxed/simple;
	bh=OT3HSae7R65W4PAndKvu7iADgArEJirDbvmmcXLhdeE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RLzEg0nedVU+esYHPBW70Ke1r4pegqJJ+HLdgzqysf/+EbyOB4taA5fGsT59EjTOFFSl4COgsjaVHcA506Bc6Sc19KhcdRY0xE7oAKQZKg608vxE0A6owDazy3YzcWX7Wrz+iXdwrWbz/mykS99tGYk8Lu/MLTk2iiPxFNbn+sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BHtOQyOP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e413a219so1339083f8f.3
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755860936; x=1756465736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3DVCW96rCgg3n/nWKKS7K0ME3L8qhV8+wGLF4ed4gE=;
        b=BHtOQyOPo/heTSX88n4wlli9WcykxH6fAWK4KiiUkoPRjB80aaOr9rf+RBwQsVYNsm
         YLTT1vIvMFzn5oH5jiM6pLaSxEiVFKYlV3Ma/Lp2XhsE/x96EGauRJNOJeHmAg9poMlk
         1a05xQFxx4HAjbsJK89t8La2UmtuKCc5rYhLlQH9437Wf9r/E0doa6c9GPFf50Za3Tn3
         wbzeYGUPc95LvAWIXj+8Wy+aUmbHtwR08HLqGqQruW8COuYSYix0004foSUZMOmc/x05
         I2G5RYMffTs24b8rlxzzmnU4LC8vP/A5xfpiW8cZ2ZNoGrVnRR4eGvdXSUAeVpk2bqxN
         RcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755860936; x=1756465736;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O3DVCW96rCgg3n/nWKKS7K0ME3L8qhV8+wGLF4ed4gE=;
        b=oW3F3naaxq3PDl2wzLJD1v5jE+yz5Kdbve5yvurhp2qErSMQ1h0CTAPaxqyxfdHuiU
         0tN58Zn+KjEjq/ruf8gzJAMFROAQrms9LCbzb57Iq2brdYPqIDidElQ/Yu+WBPtGOI3J
         bRpAVL+CfPgsLo9xM0OK0mlvftcOWIEgO+9TFBIusn/kpnlW3RPLjp3Jn2ZyXhWvUNBY
         ImzUAIgb5GcIpRWyWU4a4OBfaXtYa+n3p9GdCpUmveqSrhlDpfEciorz0q5qsjXjvE1Y
         vT6X870MNGSxG2yY1dT+wIO8H+e3irXiSWQ+PFBPs52mnf3hkDUhe4xM/4HB2DhN6ukQ
         W9nw==
X-Gm-Message-State: AOJu0YxDvMQ8L3OlDneqDGh5L6vc6FKujMlFbMcm+KqfJLP6knAYkrKZ
	TJTjn4l+vdsjEEkBD29XF6z5qmx2IAqtDxEvJ8YkBFD0CTmU3pSpZHOkQI0Q3nDj1QU=
X-Gm-Gg: ASbGnctVU4JhwZJaqMTkudkL14SbID3+IeP2lV9cE6znhCntwvHcNr5Z0mjnNCv25Vw
	lnjN37/2sFgzCk0zrOubaMc9B/l838GgZmkO8GbiK225r509GBns2WsPOCl71UYQhf9XHsF3b9w
	Xo2gc/UJ1o11Ai7t7wVASCGi5o3TRcjrZio0uDWcquhMdc9WJm9NwfhXqig+4RJUDUVYlsEKqfV
	nzKUflEY9dEoaTICjndpo1HBxHopFaWNFKkmPCUdIluRPvWrGjaTNbbkL+LRakH00S9g+muaDxY
	Ypu0U7+9EPrKl2YRp+M1+UFd9MFowDH2JdyYLLi+wMHqtB9hBLPJSvEn2d0lgt3vBh0J4KNWl3g
	EznIZufKZPgBowqm8BrZCnCpmlhxjqhFYZJFISWioasiuphLfnWFzWwzl3iKEmnVskuEn4RaQor
	g=
X-Google-Smtp-Source: AGHT+IGCVe9bfrzPpi2RuGVqVugcIjq7Pad1nS2JNmjT8LBzTfwmXherE8yXAAufyte/ynJR0prSWg==
X-Received: by 2002:adf:a115:0:b0:3c6:2010:ffcd with SMTP id ffacd0b85a97d-3c62011038fmr1026778f8f.45.1755860936268;
        Fri, 22 Aug 2025 04:08:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3dd7:7361:c101:6a77? ([2a01:e0a:3d9:2080:3dd7:7361:c101:6a77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c61843c8fcsm1901354f8f.22.2025.08.22.04.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 04:08:55 -0700 (PDT)
Message-ID: <0662da96-8987-45ae-ab06-c60003ef26e3@linaro.org>
Date: Fri, 22 Aug 2025 13:08:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <9584a286-7d8a-48b0-a65c-7a37ced78ac6@linaro.org>
 <38d56655-cfea-ef3d-46ff-a77d81e35297@quicinc.com>
 <19f844ee-da08-4497-a4f7-c90d45554534@linaro.org>
 <cdce193e-c055-6599-16e5-83e33123099e@quicinc.com>
 <92f50738-571c-479c-9be8-b72c32fd8b70@linaro.org>
 <25d44811-953c-1145-73b9-967909fc3983@quicinc.com>
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
In-Reply-To: <25d44811-953c-1145-73b9-967909fc3983@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/08/2025 12:09, Vikash Garodia wrote:
> 
> On 8/22/2025 1:47 PM, Neil Armstrong wrote:
>> [  157.299604] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00>
>> SetProperty(HFI_PROP_MAX_GOP_FRAMES) --> 0x0000003b
>> [  157.311341] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00>
>> Disabling ONE_SLICE mode, tiling:0 numTile:1 CP:0 SliceDelivery:0 MultiSliceMode:0
>> [  157.325847] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00>
>> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 9563648 vs FW HFI macro
>> size = 7953920 vs FW golden buffer size = 5833728
>> [  157.344542] qcom-iris aa00000.video-codec: <VFW_H:CmdDec:265e:a723e008:00>
>> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1_NON_COMV, Driver macro size = 299008 vs FW
>> HFI macro size = 299264 vs FW golden buffer size = 299264
>> [  157.363944] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00>
>> venc_c2Start(3860): Send HFI_CMD_START error response for port 1
>> [  157.376855] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00>
>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>> [  157.389836] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00>
>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>> [  157.402827] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00>
>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>> [  157.415816] qcom-iris aa00000.video-codec: <VFW_E:CmdDec:265e:a723e008:00>
>> VenusVencCodecEmptyThisBuffer(6732): ETB received in wrong state!
>> [  157.428832] qcom-iris aa00000.video-codec: session error received 0x1000005:
>> unknown
>> [  157.436848] qcom-iris aa00000.video-codec: session error received 0x1000005:
>> unknown
> 
> Thank you for the logs, the issue is due to driver non_comv macro size (299008)
> is less than firmware requirement (299264). Please try below fix, if that works
> for SM8650
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 558dba37dbfbc..3247ad736a17c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -967,7 +967,8 @@ static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
>          if (inst->codec == V4L2_PIX_FMT_HEVC) {
>                  lcu_size = 32;
>                  return hfi_buffer_non_comv_enc(width, height, num_vpp_pipes,
> -                                              lcu_size, HFI_CODEC_ENCODE_HEVC);
> +                                              lcu_size, HFI_CODEC_ENCODE_HEVC) +
> +                                              SIZE_ONE_SLICE_BUF;
>          }
> 
>          return hfi_buffer_non_comv_enc(width, height, num_vpp_pipes,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 1ff1b07ecbaa8..94668c5b3d15f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -41,6 +41,7 @@ struct iris_inst;
> #define SIZE_SLIST_BUF_H265 (BIT(10))
> #define H265_DISPLAY_BUF_SIZE (3072)
> #define H265_NUM_FRM_INFO (48)
> +#define SIZE_ONE_SLICE_BUF 256
> 
> #define VP9_NUM_FRAME_INFO_BUF 32
> #define VP9_NUM_PROBABILITY_TABLE_BUF (VP9_NUM_FRAME_INFO_BUF + 4)

Works like a charm !

Do you want me to add it to the iri33 buffer size patch I'm preparing ?

Thanks,
Neil

> 
> Regards,
> Vikash


