Return-Path: <linux-media+bounces-29558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA64A7E944
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 20:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8C21188FC31
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 18:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284EC214A7C;
	Mon,  7 Apr 2025 18:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UaAlCC/s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C21217663
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744048874; cv=none; b=q1u/6eyB0VuGhJJ4R6LvT2l4EmqxP8NqClYZ6Z6OEzXy2dJU8VxkxDmX7EBfG8+KeRRbK4mnJWr4eGGIuPGIRFnnc6dn/ZWcIHaBMApD2M9JxUtRamZ9jXKNPG3UpnIn+yLHLd5AIvqUEXzs/KEmMKrF6Fxa3Ny8LbiqP45aXP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744048874; c=relaxed/simple;
	bh=/sCS8P3oFfkM8Y2joQwtk/+GhkDfttep80wMIA9Oi6I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TryvryR37/L3Y4FwEiBKOreDPmWF5OtjANgk0CgvWKkF1uEFJvTZGhwFGVrT+ZxSnSgkHGtSWWly55hIz7xSa7g+eoE9lMa8XIi2RvVeAWTQy2MkbjvkakIfoTrYpM3Yy/Zaexcr8NdtNztnCxHe32/Fm+eRb9x9ElCYiDnRh/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UaAlCC/s; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3914a5def6bso2764493f8f.1
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 11:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744048871; x=1744653671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQN6XEoSUCzS4EezoIiiguwwZ733hElp98GvikZveLg=;
        b=UaAlCC/ssZRpuNqnybDl1wxtEI3s4qVn/UvY8jRV7ExlXN+0QFhpLs41mGwToOvvnI
         NbtBUXIlHKMxeMVaa86iOzapveOJ3xvyuxuRM87ZrpWvkOGlKTz6l7XMLXJo6kwXsMmx
         ufSH20gDsA7Ga5Iw7yrp71qtKJ0+xmB0YePw9JD0SoTeGi/8RY0AcAdtvl/B/YH/vq1n
         w5ueJNP6B7KnvH5nkRev5W7+Bnxl88vuDarQsEiJ0GJOVeGp0aIN7vF1PGdVhUYzCWN7
         pwAFQXFeWCL0XH6mX+CL0Re9PGKxKx9tvBJoJO03CdC9HAXLy7i14jl6Gbma5YBcqSyf
         rYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744048871; x=1744653671;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dQN6XEoSUCzS4EezoIiiguwwZ733hElp98GvikZveLg=;
        b=uY0Gx/et/kSb9oW1oX3H9tS5jj9b2Wf2gaDd8sG2aoY40zdyYfXPtNhe0MXUV05m/I
         i9zL6iP0HQOESNu/oOKVFD8gknrr7Aj1O4M36Aa/f5y5cAVf//RAx3pG+bGpMIwVGdNh
         j+VdLpFMYf2Cn9t455EoZuUkODULpytlVmqR8HT8MUqhr/EsVctSxpNiIZZejsCu5PIa
         1gMuU3Pl1z9MBnP+Uns+Q21k5hSXAivPAPNPRPiWaqA59Idcmh1zGXwrzZSRdnYsuH5d
         1YWgqNx/Mx5KlMAygpk0BLInnCUycSugV0xSX/63yX6gDqEhHglWDiwM8SNCEJzT/qVJ
         lRgA==
X-Gm-Message-State: AOJu0YytKV3aaJj3ZV88ocdzMUL1FLtZnOS9W5BBAzLSX1hq42SMPjQ0
	WvLJiPyf79VxTR1BRBBdOyUk/GqzR5Lj00nYlUHDeJYtTw4xTfmL1WKvSFA/EAA=
X-Gm-Gg: ASbGncu0Tjw6x+yI/Ukv9Q9/GSnhu6GcVPogrgfCRa9bPAs/UXNFUq+fNVo1Hwewt+Y
	RnKu9ov17O6VQD1U0dy1qniBV0ac+tZYcNgjce4UZ2v57A4tcDBTTBpE4Uz6qCAj/1JAtnY7aSh
	qTxgM4ju80xpSooe+aZtDt1ZqRaeiTy/ixZ1RYU+mhECbBvG6w6gHOI0J+GWG+XurF3n205RZzn
	Qe1aGtXovA/n0u8vt8TRo4uk++59MgqM+LYUTaNmGOCH1Nuhh7ZfphwD7bQTvGbWbZpTgAw8uhX
	98s0AO/z9MdQH8EouafNnszXMbbYHRPncIXhZsHCFoGQavmmcK3yACzh0+A76ZdifhShq12ecOi
	Bsn++KJcgxfTHFBG4SYZZ0A==
X-Google-Smtp-Source: AGHT+IFF2Y1FxHLGIXFsVRY7QrXVRey4g/u9EJsx9mznd/SmL2dCJdrLW+gsYJud45OzuRqxEedf1A==
X-Received: by 2002:a05:6000:1a8d:b0:391:487f:282a with SMTP id ffacd0b85a97d-39cba93cdd3mr11366157f8f.50.1744048870736;
        Mon, 07 Apr 2025 11:01:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f2a4:b974:cba3:a605? ([2a01:e0a:3d9:2080:f2a4:b974:cba3:a605])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b6321sm12508357f8f.44.2025.04.07.11.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 11:01:10 -0700 (PDT)
Message-ID: <f0821547-8f0e-4235-b196-1c8a680fa5c0@linaro.org>
Date: Mon, 7 Apr 2025 20:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 5/5] media: platform: qcom/iris: add sm8650 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
 <6zCwYEsWlyaz8z8Elw573sfjWDZBB46nc0IA4Eu_-pKdy3O1WzYh2sr0jdSPRr0uBHqfgMaK3WC5d9sN6-O6cA==@protonmail.internalid>
 <20250407-topic-sm8x50-iris-v10-v3-5-63569f6d04aa@linaro.org>
 <ecb193d1-2bf1-4d99-b9c6-9b5cde1e936e@linaro.org>
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
In-Reply-To: <ecb193d1-2bf1-4d99-b9c6-9b5cde1e936e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/04/2025 17:52, Bryan O'Donoghue wrote:
> On 07/04/2025 16:24, Neil Armstrong wrote:
>> Add support for the SM8650 platform by re-using the SM8550
>> definitions and using the vpu33 ops.
>>
>> The SM8650/vpu33 requires more reset lines, but the H.284
> 
> h264.
> 
>> decoder capabilities are identical.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   .../platform/qcom/iris/iris_platform_sm8550.c      | 64 ++++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>>   3 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -35,6 +35,7 @@ enum pipe_type {
>>
>>   extern struct iris_platform_data sm8250_data;
>>   extern struct iris_platform_data sm8550_data;
>> +extern struct iris_platform_data sm8650_data;
>>
>>   enum platform_clk_type {
>>       IRIS_AXI_CLK,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> index 35d278996c430f2856d0fe59586930061a271c3e..d0f8fa960d53367023e41bc5807ba3f8beae2efc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -144,6 +144,10 @@ static const struct icc_info sm8550_icc_table[] = {
>>
>>   static const char * const sm8550_clk_reset_table[] = { "bus" };
>>
>> +static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
>> +
>> +static const char * const sm8650_controller_reset_table[] = { "xo" };
> 
> 
> At the risk of asking a stupid question, where are these resets in your dts ?
> 
> You're missing core here ?
> 
> 20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org

This one if for sm8550, this very patch is adding support for sm8650 which needs core & xo in addition to bus

Neil

> 
> ---
> bod


