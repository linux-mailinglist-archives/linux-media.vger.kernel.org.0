Return-Path: <linux-media+bounces-26973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F7DA44915
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 18:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A653B1891427
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 17:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC76156F3A;
	Tue, 25 Feb 2025 17:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3ugw88k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEFE19A298
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740506164; cv=none; b=NlgQBwiPMXMSKTi9ntQGuwjuyNUtpaBAyjW5v9Ksg2UkkX4olHlx9FaAVJUCeSRr7DAQohg/KbKAkR05nETvOrhiqr+gQuRov0kAehyqi1oIT5QWTVmFyClfVNUgiIjpIO1IcUSTnaAmtdzbrzR0QrduM4ICp/Q1ZbRQezSlhL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740506164; c=relaxed/simple;
	bh=b/ooS1Ad+mxylo69elknPHxm7US/06Bay1TIDbV7Hjg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QDKXyQinlXbOOvsGkIltLGCNBAYGvs/dzkBsyzMn5x7DJ3AhVtLIa9qJ1FoN2bK29TXQZbT4T8NsTD4D9E/ypcPtXrWiiWOwxARmzR8MpVaI+5EEKAMwRmdfXEhOySs3FAFB81wfBxC3usG68fnlzzd+/vT2X3yQQd8Vgdz4U2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p3ugw88k; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso60090585e9.2
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 09:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740506161; x=1741110961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zIzULBXF+bbTwNqRPeEUQyCRtvqyPIkrxtC2g9UBH4Y=;
        b=p3ugw88kRwQ3/cxFXjjgSpf1QW60ofOrsz4lf5UjD1YCH7JJWpm7w97aydfSvqvLsR
         JLJp8xo8xLNmbFgvebovECWrsPRx2FFdI0wFIqHUC6EPo/cPoDErefzyDmIOBTVV9FeQ
         FMtQoFIfOkYpQtgPI5trquXmy1UELoXyFa+VYDJqGCrD5nx7u0mQuw2TsdPI50f2HMNb
         hZNf2RyvuJca7W1XyWcp/c+9BUbkI38Rk87DdH0buBf80GZqFP8FtWd4fdaq4LOV7IvO
         p6ryBUr7SAzR6YpMtg8eKA1gfMK8gcG1rQ5ViHeulDtbWgR6wAEZKWJ14aGwme9p81l5
         8AGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506161; x=1741110961;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zIzULBXF+bbTwNqRPeEUQyCRtvqyPIkrxtC2g9UBH4Y=;
        b=HciYkgctKeYw3e1NK2ZqwtPW33ydVTvwx4XhSOevcarZR6UY0qdge8hd2dYtxa/RfQ
         PjRGJTwWtz/BfdqjQ3dvOefIYN0/Tl8DqxrSAssh3KjtB+erUCyH2dTeY55czP50i85S
         y8L9Vmvm1ytnFJqKOZlhiRcQCm0ywCsw2Q6nULW+8dMpCipzODD3NJSkGF4t1xujvq+7
         MnOCnmzwuKP9uCSQNasshIagGWGYG9DjIUdMFBeFLglZ65f/ox5bIOmR+C2HZ6ySdu9K
         7YwjVtLbPCbfwpo6jmlX3tmzxQHLdrzzLm3ooG1yOndnsclp3/sXjxGnQs4CSXb4B+ic
         TQ1w==
X-Forwarded-Encrypted: i=1; AJvYcCVx57sgRSsVnTnHGmCwKDhCLwzjCSYs/VAXxvjSVmn+Cro/7N8Htqcr86MlNxePQ8mxKI0bG38UspDWBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJw7hctvzLcbLPygUC5lDxNI44+vg7BGQr1XKSf4vwe9fimdlY
	Z2nBcn2DX1vz8GjQMe8AU0EUNYibRr97VWg8MolzkBkh4yGbp/6lcvgrZyN4S0Q=
X-Gm-Gg: ASbGncsvwhtr42c9HUWxNfpG6LUkK14lq7xd/Dws3kWIFuraxyKgQPyIooITD3MmzbL
	AXHIh7cbEDtlaGTzJchtLFXaPREGoAfhrV0ilXu4s9QLJiFXvTvOunxOhGiiXFIGScTi7Wz16uW
	tqp52WXo4ot7Y/8T06zZlYDD20v68nof2IT4iVUw4nCu/02vHIs/d68cPoEwqdRIi280MjrOoZX
	TTwYujH0KaasIK2/OzD6RbjcuqKdeLLZlmrMHjKYMTEqXvrWMGf5FtfDNX2B1zbeaEyyJRZkUxl
	xREqIULQ+Bzz1uAB0CcTTEyA3wK3A8LbOnfyldNNPPhUfbE6Q7k7t9iThi/P42zgiqXm7yc+Phl
	WXAw=
X-Google-Smtp-Source: AGHT+IH6zoThgkSBx1ZNJS3UPqjCHY1lGopyJ1QAejqoE18RfjZNHa/WB6jk+a/lD238lrMpXIwSLQ==
X-Received: by 2002:a05:6000:4028:b0:38f:4cdc:5d21 with SMTP id ffacd0b85a97d-390cc60a5afmr3965491f8f.24.1740506160987;
        Tue, 25 Feb 2025 09:56:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:23a1:f1ec:7a08:3a2b? ([2a01:e0a:982:cbb0:23a1:f1ec:7a08:3a2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd88297esm3041983f8f.44.2025.02.25.09.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 09:56:00 -0800 (PST)
Message-ID: <fe25be80-9b5a-436f-9f50-7adf059d8726@linaro.org>
Date: Tue, 25 Feb 2025 18:55:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/4] media: platform: qcom/iris: add reset_controller &
 power_off_controller to vpu_ops
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-2-128ef05d9665@linaro.org>
 <ityd34gfiyt6fvyuopnh3bi3edc5t2ubop4i72d54xyhhz3ixf@n6rnt5mwgw4b>
 <48f339f5-09f8-4498-83f2-4e2d773c3e23@linaro.org>
 <CAA8EJppFCF9Mf_LXr4EMV94rVw9qHJQFKtfXwuqTmtHQA=2gnA@mail.gmail.com>
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
In-Reply-To: <CAA8EJppFCF9Mf_LXr4EMV94rVw9qHJQFKtfXwuqTmtHQA=2gnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/02/2025 11:41, Dmitry Baryshkov wrote:
> On Tue, 25 Feb 2025 at 12:04, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On 25/02/2025 11:02, Dmitry Baryshkov wrote:
>>> On Tue, Feb 25, 2025 at 10:05:10AM +0100, Neil Armstrong wrote:
>>>> In order to support the SM8650 iris33 hardware, we need to provide specific
>>>> reset and constoller power off sequences via the vpu_ops callbacks.
>>>>
>>>> Add those callbacks, and use the current helpers for currently supported
>>>> platforms.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/media/platform/qcom/iris/iris_vpu2.c       |  2 ++
>>>>    drivers/media/platform/qcom/iris/iris_vpu3.c       |  2 ++
>>>>    drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++----
>>>>    drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 ++++
>>>>    4 files changed, 18 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
>>>> index 8f502aed43ce2fa6a272a2ce14ff1ca54d3e63a2..093e2068ec35e902f6c7bb3a487a679f9eada39a 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
>>>> @@ -33,6 +33,8 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
>>>>    }
>>>>
>>>>    const struct vpu_ops iris_vpu2_ops = {
>>>> +    .reset_controller = iris_vpu_reset_controller,
>>>>       .power_off_hw = iris_vpu_power_off_hw,
>>>> +    .power_off_controller = iris_vpu_power_off_controller,
>>>>       .calc_freq = iris_vpu2_calc_freq,
>>>>    };
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
>>>> index b484638e6105a69319232f667ee7ae95e3853698..95f362633c95b101ecfda6480c4c0b73416bd00c 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vpu3.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
>>>> @@ -117,6 +117,8 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
>>>>    }
>>>>
>>>>    const struct vpu_ops iris_vpu3_ops = {
>>>> +    .reset_controller = iris_vpu_reset_controller,
>>>>       .power_off_hw = iris_vpu3_power_off_hardware,
>>>> +    .power_off_controller = iris_vpu_power_off_controller,
>>>>       .calc_freq = iris_vpu3_calculate_frequency,
>>>>    };
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>>> index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..ec8b10d836d0993bcd722a2bafbb577b85f41fc9 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>>> @@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
>>>>       return -EAGAIN;
>>>>    }
>>>>
>>>> -static int iris_vpu_power_off_controller(struct iris_core *core)
>>>> +int iris_vpu_power_off_controller(struct iris_core *core)
>>>>    {
>>>>       u32 val = 0;
>>>>       int ret;
>>>> @@ -264,23 +264,29 @@ void iris_vpu_power_off(struct iris_core *core)
>>>>    {
>>>>       dev_pm_opp_set_rate(core->dev, 0);
>>>>       core->iris_platform_data->vpu_ops->power_off_hw(core);
>>>> -    iris_vpu_power_off_controller(core);
>>>> +    core->iris_platform_data->vpu_ops->power_off_controller(core);
>>>>       iris_unset_icc_bw(core);
>>>>
>>>>       if (!iris_vpu_watchdog(core, core->intr_status))
>>>>               disable_irq_nosync(core->irq);
>>>>    }
>>>>
>>>> -static int iris_vpu_power_on_controller(struct iris_core *core)
>>>> +int iris_vpu_reset_controller(struct iris_core *core)
>>>
>>> If these functions are platform-specific, please rename them
>>> accordingly, like iris_vpu2_3_foo() or just iris_vpu2_foo().
>>
>> They are not, this is the whole point.
> 
> I think they are, you are adding them to the platform-specific ops. In
> the end, they are not applicable to 3.3.

Vpu 3.3 is added on the next patch, with specific callbacks
for 3.3, this very patch has no functional change, it still uses
the same "common" reset and controller power off for vpu2 and vpu3.

This very patch is a preparation for vpu33, using common helpers
in vpu_ops is already done in the vpu2 support, I simply extend
the same logic here.

Neil

> 
>>
>> Neil
>>
>>>
>>>>    {
>>>>       u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>>>> +
>>>> +    return reset_control_bulk_reset(rst_tbl_size, core->resets);
>>>> +}
>>>> +
>>>> +static int iris_vpu_power_on_controller(struct iris_core *core)
>>>> +{
>>>>       int ret;
>>>>
>>>>       ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>>>>       if (ret)
>>>>               return ret;
>>>>
>>>> -    ret = reset_control_bulk_reset(rst_tbl_size, core->resets);
>>>> +    ret = core->iris_platform_data->vpu_ops->reset_controller(core);
>>>>       if (ret)
>>>>               goto err_disable_power;
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>>>> index 63fa1fa5a4989e48aebdb6c7619c140000c0b44c..c948d8b5aee87ccf1fd53c5518a27294232d8fb8 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>>>> @@ -12,7 +12,9 @@ extern const struct vpu_ops iris_vpu2_ops;
>>>>    extern const struct vpu_ops iris_vpu3_ops;
>>>>
>>>>    struct vpu_ops {
>>>> +    int (*reset_controller)(struct iris_core *core);
>>>>       void (*power_off_hw)(struct iris_core *core);
>>>> +    int (*power_off_controller)(struct iris_core *core);
>>>>       u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>>>>    };
>>>>
>>>> @@ -21,7 +23,9 @@ void iris_vpu_raise_interrupt(struct iris_core *core);
>>>>    void iris_vpu_clear_interrupt(struct iris_core *core);
>>>>    int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>>>>    int iris_vpu_prepare_pc(struct iris_core *core);
>>>> +int iris_vpu_reset_controller(struct iris_core *core);
>>>>    int iris_vpu_power_on(struct iris_core *core);
>>>> +int iris_vpu_power_off_controller(struct iris_core *core);
>>>>    void iris_vpu_power_off_hw(struct iris_core *core);
>>>>    void iris_vpu_power_off(struct iris_core *core);
>>>>
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>
> 
> 


