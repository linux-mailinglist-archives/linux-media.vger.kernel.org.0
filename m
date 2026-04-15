Return-Path: <linux-media+bounces-58783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBj6Ee8/32kxRAAAu9opvQ
	(envelope-from <linux-media+bounces-58783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:36:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A114016B6
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D864E30B764E
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 07:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA63D1A8F84;
	Wed, 15 Apr 2026 07:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6iwkGK0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA29B307AE3
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776238563; cv=none; b=S7sarYwVY/jwG0mtEIC3eswUPbYcgqJSxtgBc2eiINYhyJltzO1l5azL2r79zW3AgJb1RwYQuOaIZamEt5ksu6tBf43kigLJaUXTwPW65m/5o1X9K8jxZx74K+chR7iN58+UmHnkG3KTfXad84dRyFKrbeZaS2WSvADNb+UmT2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776238563; c=relaxed/simple;
	bh=tztQiF9AFq7P5qpbPimA9DqSoKcs+HcugZW1l/nqyWU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZkPUw/srEPUsevKuU1HxkHdJ8o53pIZeIuKJvVuwidzDe13EXH537JtIRbn+z26suxS9c+AWD+f64EXVgGAcudehWHHmHT43ChbelpqWnnBN4gIL4X25SYbGUYJZDXbolejx02nBwRn58uK4GRgj2Y04zKsWIUrb2SP/AcMlZHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6iwkGK0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b0046078so63196055e9.1
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 00:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776238560; x=1776843360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gdb9XYGr2HVOrPIaTOy7veH01B5O/TgjD3eQj9X645g=;
        b=w6iwkGK0ZjvFuyHt9dBPUcyUM68EbDKJbIT0bI14kq8phJZPhM9YmhlWndJXzH+TI3
         S0VHl876eB24QOlpFEzGZfVPoIecaYleKMsb1u8MeixEXucrlgZGhcfnGXqtIMrER0Jv
         L52H+rdQ0XMik5HaD8pE+ShjUqhgJkS9NZauyhJUtfNrI0QABehb4z75EHt0Q4s81IMp
         crvwjFBmQ32r10JbIlin8MhY9lvB98XoiVaJjZ9wrCTEL63sMK4mKb3fWnlz4oRU73p6
         gLCVzp5d0K19fILZL/tDKshgrmrBikAEjFp4LHpw/lXEmleS9QCi8nt1BWgTy0DI5EeS
         tQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776238560; x=1776843360;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gdb9XYGr2HVOrPIaTOy7veH01B5O/TgjD3eQj9X645g=;
        b=EIt9bIrRR3GrenMdsS/VA2o2E/yQ5hfke7WArrV+DIh6ZgnSnp7TyyFjYLOY7HlQf9
         Pb4PVVin3gm88gm0iaB1e4wHcglUFXPnR0A9TErAHU0N7aQKf0qIDp6+vg1e8IsGxXTr
         dJNCmjyQzxiTXH+/qTCre3uLgnpndrDQ9nW1Ffq5VhRVHbYIRLbBhvCpPpqyRlKTllJ8
         llxNVpqxpk+ZHh6WCwoWdKHZh6HzJSDRmR3XGc9/ENnFuhZWRItF3dyWsqr7fnHnsN37
         DPUcjG9W/pavv22tkyAEH55kKKB2Mjy3c9bCSwlRSzmjpuzBUJ3zED4W1binEe4lRIpd
         /b+w==
X-Gm-Message-State: AOJu0Yz0pkndGh72xugrUL58P6V4bpglPr94+b4a33BNDsjZp4OVprQ3
	7b7RJPwIvVUxd5NgKwYQb8Z1/9lTkeBiJSmkGJARwGOigHZ10W+8c6HrcksqE8fr7CU=
X-Gm-Gg: AeBDiet6bqzo9dzogHSf64g3/dd1cxsncVawAJTl5Ls9vUUwXErKPAHtj7g4PDdBy8P
	X/DZxmExfBsDyfzTZES/ONz/F3Wmk41bEEP9bxIZCEOSXtrvpXv3f5/BRAtlvVhbTY7GcCd2fD4
	l0yqcdjsoynbbhEeQKk0/lSEDm9492GhCVhvG/fhuv+jenN/9ULu5cadpv0IR/YOdr5qL/zPPz8
	3PubyWVepmbOzhIyH0zHKBsA30Qyy0IK0Jv1Sbq83WfnlzGWE5wEosho14x5bdFAqw+SIkGH3eg
	dNXkStsbDOrqC7xqrZGHdtx0uubvWNZEapYV9ZP3CfCsjXSO8ahH8tLvwrTOnT6a6xtERWMOZjK
	pZ/5EeLl60YZDkIcHGQZfrmJ8pSXqJzHXoHjG4oP04neaG6vDK6gutxxCTeJQitNdWKoSFp0mE3
	lbqG3LIuxiglOZV6eHHhBAC5tprY7yDfw22Dx28wZCIro9sqXbPHIiWPShBuczGxEDxmlwxqYFX
	krgTuaTrSCyXI4l2w==
X-Received: by 2002:a05:600c:8706:b0:488:b9c6:11ba with SMTP id 5b1f17b1804b1-488d6890cf9mr282323265e9.28.1776238559882;
        Wed, 15 Apr 2026 00:35:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1c29:ca2f:5699:2fdf? ([2a01:e0a:106d:1080:1c29:ca2f:5699:2fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488eddba112sm116771345e9.0.2026.04.15.00.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 00:35:59 -0700 (PDT)
Message-ID: <fd6e7780-12eb-4fb3-bd83-ccbfbc1c09e8@linaro.org>
Date: Wed, 15 Apr 2026 09:35:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 6/7] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-6-428c1ec2e3f3@linaro.org>
 <faa04229-1070-3a2f-94e6-a7e238fb8121@oss.qualcomm.com>
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
In-Reply-To: <faa04229-1070-3a2f-94e6-a7e238fb8121@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58783-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: B1A114016B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 4/15/26 08:39, Vishnu Reddy wrote:
> 
> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>> The 10bit pixel format can be only used when the decoder identifies the
>> stream as decoding into 10bit pixel format buffers, so update the
>> find_format helpers to filter the formats.
> 
> This series breaks the v4l2 compliance tests for the existing platforms.
> Decoder failed for below:
> VIDIOC_S_FMT: FAIL
> Cropping: FAIL
> Composing: FAIL
> Encoder streaming tests failed.
> Please check once.

Sure I'll run the test before posting v2.

Neil

> 
> Regards,
> Vishnu Reddy.
> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 41 ++++++++++++++++++++--
>>   2 files changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 5a489917580e..cd3509da4b75 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -18,6 +18,7 @@ struct iris_inst;
>>   #define REGISTER_BIT_DEPTH(luma, chroma)    ((luma) << 16 | (chroma))
>>   #define BIT_DEPTH_8                REGISTER_BIT_DEPTH(8, 8)
>> +#define BIT_DEPTH_10                REGISTER_BIT_DEPTH(10, 10)
>>   #define CODED_FRAMES_PROGRESSIVE        0x0
>>   #define DEFAULT_MAX_HOST_BUF_COUNT        64
>>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT    256
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index ca0518c27834..bfc13c1044c7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -105,6 +105,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>       if (i == size || fmt[i].type != type)
>>           return NULL;
>> +    if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>> +        if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
>> +            inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_8)
>> +            return NULL;
>> +
>> +        if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
>> +            inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
>> +            return NULL;
>> +    }
>> +
>>       return &fmt[i];
>>   }
>> @@ -113,6 +123,7 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>>   {
>>       const struct iris_fmt *fmt = NULL;
>>       unsigned int size = 0;
>> +    unsigned int i, k = 0;
>>       switch (type) {
>>       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> @@ -127,10 +138,36 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>>           return NULL;
>>       }
>> -    if (index >= size || fmt[index].type != type)
>> +    if (index >= size)
>>           return NULL;
>> -    return &fmt[index];
>> +    if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>> +        if (fmt[index].type != type)
>> +            return NULL;
>> +
>> +        return &fmt[index];
>> +    }
>> +
>> +    /* Loop over the valid capture formats and return the index */
>> +    for (i = 0; i < size; i++) {
>> +        if (fmt[i].type != type)
>> +            continue;
>> +
>> +        if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
>> +            inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
>> +            continue;
>> +
>> +        if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
>> +            inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
>> +            continue;
>> +
>> +        if (k == index)
>> +            return &fmt[i];
>> +
>> +        k++;
>> +    }
>> +
>> +    return NULL;
>>   }
>>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>>


