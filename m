Return-Path: <linux-media+bounces-59196-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHhxEawq52mo4wEAu9opvQ
	(envelope-from <linux-media+bounces-59196-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 09:43:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E65437CCA
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 09:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39746301CF91
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 07:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D643876AF;
	Tue, 21 Apr 2026 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="izj3t8ub"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBD038736E
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757332; cv=none; b=PTUS+FisVF5ljx5dtfixdn/xJj4H3a3ZkLpY6O0NtPTW8aGEOcHBU6ZecyIglXfyOl7zKJq/xveNK6WgFydpgh0xd5PA/UkjZ2p5L6wAGr3x93BqhdtQxse7ZAqAGVy4g20d/jFphm6TsIMbif+n15UKXFBvXQjLAX4v3SHfrP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757332; c=relaxed/simple;
	bh=UvnTEEmYIW0clWg+KwaAzdRLkBaZFw4CHylwgMNbXJw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fTVZImxDk19jWn0IuKjGPRNtq9cUyHdTxqB1lXbsFYUpVz0Hwo4cAZxd46swRG6wJ4nLZwQSaQ9occIf4hDER2d8Iyo/5Ygp/gUEGktlINtu6KIQWUKHwFwgQKDYv07hUUypwYCjKAWW2PgX1HOXzBJrWNyrxnZqQNH1Cbt2FlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=izj3t8ub; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ad135063so31852095e9.0
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 00:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776757330; x=1777362130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpmxhxJ0rPUFobV5Y1b2QksjzwTcqv+nw4np/ZmTUUk=;
        b=izj3t8ubQkDeG1GFOZYAmC1QyzQ6E0occPWzgFoRcV4bJENkYUVb5vQRf9rQGiOTsJ
         MlFkD2QQzM3glTtPRpzTLZSjH0p7CVfptID4PR2Z7JoumBGSoJgu1twVCcs1WtJav1bV
         BcWzmqj4M59nNhJlwAe6qmJVTKxl7Z8OeHaX/vLLmu3YMo3X94ph7ihG6EbIR7A1JNFt
         xE++J1L3w9ZIKowyWBtv8TGIR9k43rV8PG+lp5Vy1Qvvoht/E/wjxRO5/QN3D36Z+e1W
         0c377G1eGcL0IEBKLaWWCIIJTc1BFv2wnn1Vk+npgc4p6Q2k01BSnbIpozjLH1BLTT50
         U9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757330; x=1777362130;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpmxhxJ0rPUFobV5Y1b2QksjzwTcqv+nw4np/ZmTUUk=;
        b=glQvkWz7A18XImxcsXTSZ/OivyroZx98mL06EgrYeuIg3+DSGOwv5KYHHBoMjaxNmp
         Kbuc8mmUD6fBYZFo6QBRbzPgiuEJ5d9d1U67sp/SZn3cBB5XrOhZPHpea17jBpOkaxfH
         yN0pAywvJL8FSsfuEo9Vjb7pk+cKhkoDkVMmjcMPLtzSm8TvCLAZ0lN/Pf8QDjgD1zoI
         ShKnMV+c+x7CQV5BrH4SxgwVB5Kv85H8OfFD0l6eKwpddINm6qnK/kgawnKD4SujSdt8
         7n/2ysbWWYQCruYU5BHO1hs8i5W7CkZ6BSJGM6J5frVohqx8vIB06gAnkd5VOViw2krG
         oNEg==
X-Gm-Message-State: AOJu0YzYXKINwvPHZe1dd+j4zuBAE93/AEbWAIMEVQnklT00hUX7gh7d
	GFf06Z2P3ND7LTO5mMQWk/Cd4G/3jmCQEnVEEAWDKKWRD3/F/HLnbRuhjNmTsqVxdR4=
X-Gm-Gg: AeBDietBh/WiDZ3qSR0PTibY3ed6c7vy4D3zYZd58yfqUF5MqDzioSbG0hL2BLvBtam
	mUjXfQJW7b+Vyzrv021fpDAbROepFGjdN1+Dkzr8OoTSHU1+e8uchQT+JrY3n0tpoa7vcjlF0tn
	U1LCyfr/a3NSJVVgSPOgQcTc12B0Ead/p69OGq8EXiqXlJtTOLADGREEwRWxhdR/BUBOOE2V2d9
	OH9WywF6gcdKujYzF2jyCHQfd+5b/8lSmq/NoKItLC7db420loxtZ4nqZKabSTk3VQsDugtD9nE
	pq5LDrDLVY7BTxAJZG5dD5DMMuBDTJABCRY0UWqX4RKS5PPpHzxaqbabXPAo5jX6YcJMSB9PnXi
	cpaHSEmZlbQT4pbftlOgY0in4GTVIi2ZKPDEHQ+/9vu9nV6sbdFL+C/VpkmR3a70Cp3ksPVy5q5
	JEWobgX/D9vwGLmRdwQMT5tFG9FKchadK8xaibloJRTtA3AMzCH8RMSSW3t/YP7Y2yLMj+hbXvL
	eeKOWFEtA+aVn0=
X-Received: by 2002:a05:600c:628c:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48a52d48985mr62371505e9.3.1776757329604;
        Tue, 21 Apr 2026 00:42:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8cb:a891:9d12:1873? ([2a01:e0a:106d:1080:8cb:a891:9d12:1873])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bba6276sm68877325e9.0.2026.04.21.00.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 00:42:09 -0700 (PDT)
Message-ID: <23d27bbc-3491-4baf-bf05-be5ef4619aa7@linaro.org>
Date: Tue, 21 Apr 2026 09:42:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 2/7] media: qcom: iris: gen2: add support for 10bit
 decoding
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-2-428c1ec2e3f3@linaro.org>
 <d27e1500-ac4a-01ac-084e-bb53aa1f63b0@oss.qualcomm.com>
 <dbc98f63-b851-4470-be38-aeb83c719759@linaro.org>
 <f336e049-eb6c-5784-b831-fffcc162ffe0@oss.qualcomm.com>
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
In-Reply-To: <f336e049-eb6c-5784-b831-fffcc162ffe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59196-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:replyto,linaro.org:email,linaro.org:dkim,linaro.org:mid];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: A0E65437CCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 07:24, Dikshita Agarwal wrote:
> 
> 
> On 4/17/2026 1:33 PM, Neil Armstrong wrote:
>> On 4/17/26 09:22, Dikshita Agarwal wrote:
>>>
>>>
>>> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>>>> Add the necessary plumbing into the HFi Gen2 to signal the decoder
>>>> the right 10bit pixel format and stride when in compressed mode.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71
>>>> +++++++++++++++++++++-
>>>>    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>>    drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>>>>    3 files changed, 72 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> index 30bfd90d423b..8e547e390fa3 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct
>>>> iris_inst *inst, u32 plane)
>>>>          if (inst->domain == DECODER) {
>>>>            pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>>> -            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>>> +        switch (pixelformat) {
>>>> +        case V4L2_PIX_FMT_NV12:
>>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12;
>>>> +            break;
>>>> +        case V4L2_PIX_FMT_QC08C:
>>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
>>>> +            break;
>>>> +        case V4L2_PIX_FMT_P010:
>>>> +            hfi_colorformat = HFI_COLOR_FMT_P010;
>>>> +            break;
>>>> +        case V4L2_PIX_FMT_QC10C:
>>>> +            hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
>>>> +            break;
>>>> +        };
>>>>        } else {
>>>>            pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>>>            hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>>> @@ -517,7 +529,8 @@ static int
>>>> iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>>        stride_uv = stride_y;
>>>>        scanline_uv = scanline_y / 2;
>>>>    -    if (pixelformat != V4L2_PIX_FMT_NV12)
>>>> +    if (pixelformat != V4L2_PIX_FMT_NV12 &&
>>>> +        pixelformat != V4L2_PIX_FMT_P010)
>>>>            return 0;
>>>>          payload[0] = stride_y << 16 | scanline_y;
>>>> @@ -532,6 +545,57 @@ static int
>>>> iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>>                              sizeof(u64));
>>>>    }
>>>>    +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst
>>>> *inst, u32 plane)
>>>> +{
>>>> +    u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
>>>> +    u32 stride_y, scanline_y, stride_uv, scanline_uv;
>>>> +    u32 port = iris_hfi_gen2_get_port(inst, plane);
>>>> +    u32 pixelformat, width, height;
>>>> +    u32 payload[4];
>>>> +
>>>> +    pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>>> +    width = inst->fmt_dst->fmt.pix_mp.width;
>>>> +    height = inst->fmt_dst->fmt.pix_mp.height;
>>>
>>> This HFI is only applicable to AV1, you might see some corruption due to
>>> this. Please check.
>>
>> This is what I saw looking at donwstream, but I had not implemented this
>> initially
>> but I got some corruption with some different width/height, which was
>> solved adding
>> this command.
> 
> Even with your implementation, this API would only ever be triggered for
> QC08C and QC10C formats, which I don’t believe are currently being tested
> with your series. Since HFI defines this as AV1D‑specific, invoking it for
> other codecs is unlikely to help and would be incorrect.
> 
> Pls re-check.

I actually did test QC08C and QC10C with dma-buf drm import, and it works fine
with this API.

Neil

> 
> Thanks,
> Dikshita
>> I guess this in-firmware calculations are not exactly the same the DRM
>> driver expects.
>>
>> Honestly I think it's preferable to sync the stride/scanlines calculations
>> between the
>> driver and the firmware.
>> For example I used the same "ALIGN(width, 192)" for the v2 iris patchset
>> which was wrong
>> because ALIGN only works on Power Of Two number but it still worked because
>> this HFI
>> HFI_PROP_UBWC_STRIDE_SCANLINE command was called with the wrong aligned width.
>>
>> Neil
>>
>>>
>>> Thanks,
>>> Dikshita
>>


