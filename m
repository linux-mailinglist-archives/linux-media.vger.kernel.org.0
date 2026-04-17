Return-Path: <linux-media+bounces-58970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DhbNp/q4WmKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:09:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFBB41869D
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D500F31619B6
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBF0397E69;
	Fri, 17 Apr 2026 08:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h318rwtT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60A3399373
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413037; cv=none; b=Yf/P/12ExEj6B89quD2yNpsXHRCs/QQqeocefALgMK9bWDzwXdtk1KkZ58dD7ZWdx7RCpPzeuE9WPY47SnywFby5bXK6gLLXO+r7lzazpqyN9UHNF2Qm6qetM0cmhzKQmgkWURb63hmFUi6mVkSV7uEVZktC5e7sj5h5dSAcVFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413037; c=relaxed/simple;
	bh=dVf0tDRfYV0EzjitgKHGt/ACv6OrCSUpDY8gGVmdRyE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qxZldShAFc/tg8LLKB47pg6QLUli3GFSTTXmbQV4fFI+JSDgE052pGMZsg/KoIZ3GCJN8n6Q2ovAfGvVG+hYNdkVDHNgAVakjVTADgO6Lw5Yj3zi/tmqW0lr0Gw49+YmXzWoW/9avefwNlBAM7X7d4vyDQJX+7rH3skjE1c0Qm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h318rwtT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d64313c39so312376f8f.3
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776413030; x=1777017830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XE6xfSRuXBnGz4oHPzb9Vsu04Db0wF2janEZQn/5PfE=;
        b=h318rwtTmepgFUKyZ7xccdbndwCLdWiZq/nG9kiDSQsVerghhyK+2XQAJZjw0cHK3U
         2ZHnrsaNvwFaIcEouwvcJwi+cqBUty8rAjCEZjHPNvnIUDkh9ikfosDhrqxbz3IUxJ/+
         XhE0SYGDmHsB0/grHlBtfjV8RWtozx27nbFPrPSh5XDj1sI4awT+eRNLtlSWMdcuPZr1
         7mmzn89NQD3mWDv6Pz/cF3fUn/FZGIi0CHO8EVN6okaEG4RlAr9p/VphaeMC/vYZSSJP
         IVMsEyIKxc1Gc+eFXKfvbYMMx3f2NjHSNzbTAmjvtrwd2qGtyYZbydsLwtuPeZOMKl3y
         i2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776413030; x=1777017830;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XE6xfSRuXBnGz4oHPzb9Vsu04Db0wF2janEZQn/5PfE=;
        b=PmC1TuvccGJc/AhDcSkEBukhY8/TOxbWNgmOEeMmsMZlWDNPfx1NMKE8JdmKAB1oTi
         lc9htFj9hwz+JoA1OuweiAkj9N1BeyI/V2lHz4ygTEUjJIP0jyjUQhkbtkLHR/cdVoA7
         QEmlMiwHO99/S0v00aGpbqzNycftNzkAhQ2SoPNhWmYxUc0m5aJzfCxeNCRVWZcmZLp7
         AUNuGMvv6q7iQ7bfIWt31EhI8RY+MPDKDSaRyEcXfCdnvaPWsjNYMi1CXamEQdQZntix
         gfsFP7aDRkuVwU4CZksN+nAR8aO03jrTofh+wiHI05c3c7JS0sQ1KIjw1m5ZPbTPJdTD
         qrFg==
X-Gm-Message-State: AOJu0YyZsJcSGs8kqxxKnFEMqJxAkQ+vjz1XOOevcEIjcrgDZ/0iGVQK
	FQtkCHTqx9u2np0MjImG2QwHGp4SIzhkYmnadXMHhcGPMqssYuc9jy94sqdNRe6aS5E=
X-Gm-Gg: AeBDievYXtaw2jWqd4hSrJQPJJ4BZNr8u7/YQa2kgrunHcD/YgXfblP+rXRpdqDbnkl
	uQSd+247+De6cv4JAH0kfWqzRMF3F2HcKc3Z1lTEKxmaUUmTAFg0g23lhrQmu7RvE9VJcBQP0sI
	WtYv6qaVnoUrKLMrDCicZcvC8E0ZmzOOY53X2j4prqmeJHrEW5U/US5vJcHPmVzq6N3trDwQAAK
	2o5kpHrleFGABCMfR7I+e0euwuOo8TFUI3BhX/vN2t12Zwi5r/nqiXbu6ClZk6dtQFuqviKiiYm
	bNogwffVPV7iyAJxVFQD7E2i6B+XqNlj5RIN3o7B0kX6UnakEV0HdNBvaGOAsrC5dq2PrDT5iKy
	HDVD2OfaML/yf83iY+GQQtxFCfMzyRKUToW6m0B8j0QXpKAi/ThJsCWNp/ItIw+y34Nlrf9QwBU
	gwRLb7/Lr+lPRwceMopJr9b5Ug67yh4Q94RbjdB8K6ABMc8ArLT2bgmvWNwELYrydvoHMbRfES7
	gHHjFJU45D4zsmhUCsRosTdfA==
X-Received: by 2002:a05:6000:184b:b0:43f:e231:6721 with SMTP id ffacd0b85a97d-43fe3db2c4emr2537875f8f.2.1776413030314;
        Fri, 17 Apr 2026 01:03:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b416:50ee:20e:8775? ([2a01:e0a:106d:1080:b416:50ee:20e:8775])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4dc24cfsm2599457f8f.16.2026.04.17.01.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 01:03:49 -0700 (PDT)
Message-ID: <d9da4660-6d42-432c-beaa-e5842ee55172@linaro.org>
Date: Fri, 17 Apr 2026 10:03:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 3/7] media: qcom: iris: add helpers for 8bit and 10bit
 formats
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-3-428c1ec2e3f3@linaro.org>
 <7ca67466-51d7-0003-47c6-9d0e6518745e@oss.qualcomm.com>
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
In-Reply-To: <7ca67466-51d7-0003-47c6-9d0e6518745e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58970-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 6DFBB41869D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 09:23, Dikshita Agarwal wrote:
> 
> 
> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>> To simplify code checking for pixel formats, add helpers to
>> check for 8bit and 10bit formats.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
>>   drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
>> index 26f51a0ccd04..c75dcb8e671e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_utils.c
>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
>> @@ -40,6 +40,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
>>   		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C;
>>   }
>>   
>> +bool iris_fmt_is_8bit(__u32 pixelformat)
>> +{
>> +	return pixelformat == V4L2_PIX_FMT_NV12 ||
>> +		pixelformat == V4L2_PIX_FMT_QC08C;
>> +}
>> +
>> +bool iris_fmt_is_10bit(__u32 pixelformat)
>> +{
>> +	return pixelformat == V4L2_PIX_FMT_P010 ||
>> +		pixelformat == V4L2_PIX_FMT_QC10C;
>> +}
> 
> A similar check is required in the current first patch of the series. So
> you can move this patch earlier in the series?

Ack

> 
> Thanks,
> Dikshita
> 


