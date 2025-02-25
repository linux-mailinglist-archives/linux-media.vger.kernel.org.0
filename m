Return-Path: <linux-media+bounces-26975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CFFA449C9
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 19:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EC15188E6B7
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 18:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64887199E88;
	Tue, 25 Feb 2025 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtQZQqDc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA64A19993B
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 18:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507008; cv=none; b=gflLA6o4mFIehlvtNZ5npC3963kMKzlAYcyphnvfayNWGUBnby/RlaoP8UBiHcEcAydneS3ZcbCuVPTIq8mGszXXoKknI9iSDwzUGvHwv9A0LYHqLMl8aM6hR62c7xAst5gVRwL02xLyIAIbc5xIZiAHGkMntZvPouJrWjxlGKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507008; c=relaxed/simple;
	bh=IPOW/Xa0C7FlB4rWR6dyQJOoV9MMe8n/+M+w+qWHUyY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ikqfjH1A9oHuph9z29eWak/JaBOOdP+zGUOmvapfzZzddoRxw4okH+UGVTwQ4u+6fdsssAiESBnASJB1ahE18B/B6uDDzHhVmuJmaootioNBe3M8RuMXzgOvbXWvXJfRnLum1JUiTLInwa1SnqhynHItgz6dZ3vEnBfTvKzdssY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtQZQqDc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4399d14334aso52106035e9.0
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740507005; x=1741111805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3m550PSRz6NVOdlWvaXYxNxGWIBcY7rsAuQYil9gvUg=;
        b=TtQZQqDcbghTEN7PVK3L7yxmbDOiPWHjSvwFh7pDpcubklHTtWPWMvp+M/M4OwY9zI
         JVgFmE2svWxiraBQmnaCizZz59hALlWQfqqnsMiwrH1wfPK9omJ5TZRktZrvfu9TuQYF
         YmBoOp7jYbPVB8MGhC0TyorEi6I3jDVVd+6KZxV5qYprS3LUuhO2ssP6/HA6YlMI1TZq
         sk5z3hAY7vSLP3HDUInSGxtJv4w0z8V6AG06k+v5dfkj6vEux5WHFtmPbph5aT6PO0bh
         BE+0+Myjq8yC6nUCgB6wrO+fhi0R2ArWPFQBCEjnRU7h37lctrnbCuwpH6H1IeDnhobs
         9WxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740507005; x=1741111805;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3m550PSRz6NVOdlWvaXYxNxGWIBcY7rsAuQYil9gvUg=;
        b=L0o7AOUgaihbnJK9CSHD7Uzmo2KceKBYCg7YW2kOJYI9jUtsACXTS3tToiZvsL9dP8
         AbWj3WqxhN128V/iq9K1eagTs6tBWH6WDuLhZ8qpkB/oSIA94LLt8MtE8kshjov/JQ/+
         TZWDT0364PEbuFALdM1mscEJYUyhggwwCIluopHiK1vtYNacT4iV2yjNW3wE8G13/bMq
         uLlPe6eUcv/KaoVdRx6zn9lGX9fmoRkeVE0mj2WqtFrUf2DA683RnUom+IMfJ2A/OS5D
         54lnlvrhMCZ+zAD8gBHPjULw8/BTLBdQS28jyobRVS3lOjsZAMZDjSBOEJmHhMjyo/v4
         CQRg==
X-Forwarded-Encrypted: i=1; AJvYcCUUMQczU+/I0j/ZAA1jmw48XqJqYaku9mBeiQbQN2obY+yomkuDrCfNkOsio3fLCHQFAj01bi7HN14RJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCR4GwM9GKYkSKge5CsutbWhDYiJ4dGCBD5IZQunfUm0reUBQ8
	U64I8mYUiFNEEykPMnFACZJuGLHtYzZFitFTQcVvKoqrfayW4/YP0UQaCPpzNOU=
X-Gm-Gg: ASbGncuC3RYt8wxb4KDsE6H/jwqtb7oXMawbd89aKFxuc3FCLOOQp9+ZLsKRtD1lGF3
	735/yC6wJuRZO2fUjyp2B9y9EWOU1HJTg1CKaEnQSIlLMHdbQ5/B2hwhi26fQQ6TpCm3ieHdgi6
	mNQvS+Ai82WIsLgc59ZURIvT4Ihw8JoopfwOi+xGuRP6n9BmuRniyAVGYu3hMGmtg+vGCp+GPPF
	fllMXE6n+5WMeWEQ2YbPhJtTvpfUjJpAtz4yGiz85tYl6SFltgbOjbS+5Z/EtHwIlSQDgibVXjD
	dZnN7pLp+DnfbIEnDXjIeVSv3bqxRSikbmZxgaTdKhb9TkBr3aYJdZmlOdjmaobrquSehibXj5C
	bs18=
X-Google-Smtp-Source: AGHT+IEQOs72bIBXrsiS458ymoQD153556cpVKnNOnYOAJYaQGiGf0BHCe8kPApkXdi9HARfK+NF0g==
X-Received: by 2002:a05:600c:3ca3:b0:439:6a7b:7697 with SMTP id 5b1f17b1804b1-43ab8fe183fmr5704225e9.14.1740507004910;
        Tue, 25 Feb 2025 10:10:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:23a1:f1ec:7a08:3a2b? ([2a01:e0a:982:cbb0:23a1:f1ec:7a08:3a2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce60asm152102555e9.7.2025.02.25.10.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 10:10:04 -0800 (PST)
Message-ID: <9cf6e092-db2d-4d49-90c3-d8a62658b2f8@linaro.org>
Date: Tue, 25 Feb 2025 19:10:00 +0100
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
 <fe25be80-9b5a-436f-9f50-7adf059d8726@linaro.org>
 <5mnho424mrrj2fwrtbdzjtkgvhlmoxcy5ba2rjjn4hvrgbmco7@7q6ezfbgi6m4>
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
In-Reply-To: <5mnho424mrrj2fwrtbdzjtkgvhlmoxcy5ba2rjjn4hvrgbmco7@7q6ezfbgi6m4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/02/2025 19:06, Dmitry Baryshkov wrote:
> On Tue, Feb 25, 2025 at 06:55:58PM +0100, neil.armstrong@linaro.org wrote:
>> On 25/02/2025 11:41, Dmitry Baryshkov wrote:
>>> On Tue, 25 Feb 2025 at 12:04, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>
>>>> On 25/02/2025 11:02, Dmitry Baryshkov wrote:
>>>>> On Tue, Feb 25, 2025 at 10:05:10AM +0100, Neil Armstrong wrote:
>>>>>> In order to support the SM8650 iris33 hardware, we need to provide specific
>>>>>> reset and constoller power off sequences via the vpu_ops callbacks.
>>>>>>
>>>>>> Add those callbacks, and use the current helpers for currently supported
>>>>>> platforms.
>>>>>>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>>     drivers/media/platform/qcom/iris/iris_vpu2.c       |  2 ++
>>>>>>     drivers/media/platform/qcom/iris/iris_vpu3.c       |  2 ++
>>>>>>     drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++----
>>>>>>     drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 ++++
>>>>>>     4 files changed, 18 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
>>>>>> index 8f502aed43ce2fa6a272a2ce14ff1ca54d3e63a2..093e2068ec35e902f6c7bb3a487a679f9eada39a 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
>>>>>> @@ -33,6 +33,8 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
>>>>>>     }
>>>>>>
>>>>>>     const struct vpu_ops iris_vpu2_ops = {
>>>>>> +    .reset_controller = iris_vpu_reset_controller,
>>>>>>        .power_off_hw = iris_vpu_power_off_hw,
>>>>>> +    .power_off_controller = iris_vpu_power_off_controller,
>>>>>>        .calc_freq = iris_vpu2_calc_freq,
>>>>>>     };
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
>>>>>> index b484638e6105a69319232f667ee7ae95e3853698..95f362633c95b101ecfda6480c4c0b73416bd00c 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_vpu3.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
>>>>>> @@ -117,6 +117,8 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
>>>>>>     }
>>>>>>
>>>>>>     const struct vpu_ops iris_vpu3_ops = {
>>>>>> +    .reset_controller = iris_vpu_reset_controller,
>>>>>>        .power_off_hw = iris_vpu3_power_off_hardware,
>>>>>> +    .power_off_controller = iris_vpu_power_off_controller,
>>>>>>        .calc_freq = iris_vpu3_calculate_frequency,
>>>>>>     };
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>>>>> index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..ec8b10d836d0993bcd722a2bafbb577b85f41fc9 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>>>>> @@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
>>>>>>        return -EAGAIN;
>>>>>>     }
>>>>>>
>>>>>> -static int iris_vpu_power_off_controller(struct iris_core *core)
>>>>>> +int iris_vpu_power_off_controller(struct iris_core *core)
>>>>>>     {
>>>>>>        u32 val = 0;
>>>>>>        int ret;
>>>>>> @@ -264,23 +264,29 @@ void iris_vpu_power_off(struct iris_core *core)
>>>>>>     {
>>>>>>        dev_pm_opp_set_rate(core->dev, 0);
>>>>>>        core->iris_platform_data->vpu_ops->power_off_hw(core);
>>>>>> -    iris_vpu_power_off_controller(core);
>>>>>> +    core->iris_platform_data->vpu_ops->power_off_controller(core);
>>>>>>        iris_unset_icc_bw(core);
>>>>>>
>>>>>>        if (!iris_vpu_watchdog(core, core->intr_status))
>>>>>>                disable_irq_nosync(core->irq);
>>>>>>     }
>>>>>>
>>>>>> -static int iris_vpu_power_on_controller(struct iris_core *core)
>>>>>> +int iris_vpu_reset_controller(struct iris_core *core)
>>>>>
>>>>> If these functions are platform-specific, please rename them
>>>>> accordingly, like iris_vpu2_3_foo() or just iris_vpu2_foo().
>>>>
>>>> They are not, this is the whole point.
>>>
>>> I think they are, you are adding them to the platform-specific ops. In
>>> the end, they are not applicable to 3.3.
>>
>> Vpu 3.3 is added on the next patch, with specific callbacks
>> for 3.3, this very patch has no functional change, it still uses
>> the same "common" reset and controller power off for vpu2 and vpu3.
>>
>> This very patch is a preparation for vpu33, using common helpers
>> in vpu_ops is already done in the vpu2 support, I simply extend
>> the same logic here.
> 
> I'd really expect that iris_vpu_foo() functions apply to every platform.
> These functions are now being used for VPU2 and VPU3 only. Thus I assume
> that they are platform specific and should have platform-specific
> prefix.

Thanks for your advice, but I followed the code and naming style of
the current merged driver, perhaps Dikshita will give some suggestions
on how the naming should be done in this case.

Neil

> 
>>
>> Neil
>>
>>>
>>>>
>>>> Neil
>>>>
>>>>>
>>>>>>     {
>>>>>>        u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>>>>>> +
>>>>>> +    return reset_control_bulk_reset(rst_tbl_size, core->resets);
>>>>>> +}
>>>>>> +
>>>>>> +static int iris_vpu_power_on_controller(struct iris_core *core)
>>>>>> +{
>>>>>>        int ret;
>>>>>>
>>>>>>        ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>>>>>>        if (ret)
>>>>>>                return ret;
>>>>>>
>>>>>> -    ret = reset_control_bulk_reset(rst_tbl_size, core->resets);
>>>>>> +    ret = core->iris_platform_data->vpu_ops->reset_controller(core);
>>>>>>        if (ret)
>>>>>>                goto err_disable_power;
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>>>>>> index 63fa1fa5a4989e48aebdb6c7619c140000c0b44c..c948d8b5aee87ccf1fd53c5518a27294232d8fb8 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>>>>>> @@ -12,7 +12,9 @@ extern const struct vpu_ops iris_vpu2_ops;
>>>>>>     extern const struct vpu_ops iris_vpu3_ops;
>>>>>>
>>>>>>     struct vpu_ops {
>>>>>> +    int (*reset_controller)(struct iris_core *core);
>>>>>>        void (*power_off_hw)(struct iris_core *core);
>>>>>> +    int (*power_off_controller)(struct iris_core *core);
>>>>>>        u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>>>>>>     };
>>>>>>
>>>>>> @@ -21,7 +23,9 @@ void iris_vpu_raise_interrupt(struct iris_core *core);
>>>>>>     void iris_vpu_clear_interrupt(struct iris_core *core);
>>>>>>     int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>>>>>>     int iris_vpu_prepare_pc(struct iris_core *core);
>>>>>> +int iris_vpu_reset_controller(struct iris_core *core);
>>>>>>     int iris_vpu_power_on(struct iris_core *core);
>>>>>> +int iris_vpu_power_off_controller(struct iris_core *core);
>>>>>>     void iris_vpu_power_off_hw(struct iris_core *core);
>>>>>>     void iris_vpu_power_off(struct iris_core *core);
>>>>>>
>>>>>>
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 


