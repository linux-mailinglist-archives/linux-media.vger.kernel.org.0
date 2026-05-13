Return-Path: <linux-media+bounces-61412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDqmHKhnBGpVIAIAu9opvQ
	(envelope-from <linux-media+bounces-61412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:59:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69919532A71
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8B7C302E863
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB993FFAD0;
	Wed, 13 May 2026 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aLCjoli8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCA39023D
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673563; cv=none; b=GNcMu5mL5NxrN2alK+0+kPtafZQ5AGcLfx01KQ/wD/B8rSSfaiU+gYoXqSsxTqS5EMFvdOOxRLiMAtT+LK1NAI6Okii/9WTcpKiRyI+NxHjtE+yxnK8JfGnBeWarGmS1yQ60ej6VvohRGiBW73VHdWkU475Ba7leQ91g6uIrBQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673563; c=relaxed/simple;
	bh=HsY5MIeA4hOcwSXUwi/tyCOWbILSHzAPQAce3C7wNKc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CQdIQA1jVFJ0gcDe8PlQLPIbafxezIyb+VHQRv3yR5+h5+dCLZ1inV9aCCYcI+hu+I1i7f0ydEVRw0EEWkc7o/cKh+MsnOcNnxhHkCiA41AUXI+AkutRwkXhZEa8sNH2wt0kH63QMNwmoDycZ4mRG6DI9tMEt7c7zU1FMJasUxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aLCjoli8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so64646435e9.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778673561; x=1779278361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ru5o97ykp5715LdAIbuApmVualUVsm7HDP8jRRU8bOk=;
        b=aLCjoli8HJr0h4+2yTM+do2Ec4GTf4yNDfrJY7F80rR1V8zFsoyzN6dBwrZ1TOE+dg
         KQr/0Zo95sWxj2GdWPD++PCQNtkZIbEwP804/mXsVAmqYODhuqFu8xP+7yHgka/jbcTk
         /WifHGxUoMftBddMfTGiVb0eAJQ1NeOoBYo0ppRwa1PZbmS8hGIElgG1v1K95XFb8OHg
         CGzqlu4vJQ51v3EQ/ghRSOJmkSuRURBvb5goJhRnB/7itxqQPPVkfaPPURoELXhbYFcY
         tpeuyowxLasND3cuulJmc6XToTQ/E6No2Ymm+qjQBEDsmqmLV5Dl3PDwbDH4+Fv9okim
         6GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673561; x=1779278361;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ru5o97ykp5715LdAIbuApmVualUVsm7HDP8jRRU8bOk=;
        b=bY3q80Zfmbfk86cfTVe0C3BxiDfp04ArMYRgiktXFS4L4sutMQoVWFSmgRrAlHMzzc
         UV2K5j0YGmTBLJc91ebsTDUvrMugdv6FU1CqkAq47ljEAYJX2d14Nh554bbWHmzRugSV
         Rvw5xbhRNCWHb7dax0ZHtk5VSKFd5SegH3VJAuRu/qxAGjYgy90uCRLIBcniA59t54aO
         MGcE7EwkjlIj6d9ApcjmAH9rKcMwIKCezGN8l2p0PsXW5O/VsHCO4kJt20avhlYC+98S
         2K3DXG1t/j4Z/5GPkshPt5g1uJzH9Voh68ZVJq4NlI7m60UOTpIQw4OXJBpK2p9OHA8R
         T6EA==
X-Forwarded-Encrypted: i=1; AFNElJ+8tevdDoYG5cJY+lDXu62L77M9MSpV3FsyzDMYKuL154BXanTVhJx+w9img+t3CLaH+rKRT2GS4Y12WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3rMzVTMdDdYAHKFGtGoG2lrwqV7Rz90/wpiqOJz9+WZyFqt8
	1cNln+xUQZLTTzsRVfCKPcxW8x1OYGZ9zAoZTrqy+T0NmUVkG6bYtpEOfC6V7XiAu0I=
X-Gm-Gg: Acq92OHG+dKIjfeP0dTu4v7RtlQa3f7kNxw1OhHHnXGz1JnU3ImBqhMDFRO2Z9JdUe3
	mddEXFDwkvyegcJ73RrR98DfEgT1xxLCAeJXtX4V5cFqdQGQ2bHAo6mAIdRLdzXmzg9cg13aIOr
	y5UTtUv/b7LIO+Mk2qlFPVXHnSUMjP61SRQuYxyB+hqmg5tKH8q6pPaHdsJ6LGry3jl5sYHpCvE
	4clMVaUfJw6V6Sj8q0nxxs3emgKy6dHbAMgXvAOShsBwwyqj3DaSzZ919E9jYwwMnt5HFeksyWI
	MVYkRMF1tweSnn8FJAoSC9Kvi03jXAyBIKAUfsEIeoT7fjKakEXbmE9iDEgHssP2lvAel1iTYpC
	Qi7CLbhhDKsmTq1hdQTsjZYu1k2jAwWtfZnAS+aRDSEGGQK9mI6AL8qHFn9js3nQN64sl0v70be
	QL9ThEIEv+VuobtRqtBVdaEVGlIm73vLJ6W9cLYWpGc7lnSCDv/7a0i3gPYwEYK7PoRrGEs/U+G
	q+m
X-Received: by 2002:a05:600c:1910:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48fc9a09cb7mr45810035e9.10.1778673560723;
        Wed, 13 May 2026 04:59:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce38328esm38190415e9.13.2026.05.13.04.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 04:59:20 -0700 (PDT)
Message-ID: <7e6f629f-209a-481c-aa1e-9a5e8415e0a1@linaro.org>
Date: Wed, 13 May 2026 13:59:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
 <yg7jatjy4ghl6m7mbldpdrqiv6vp7inyskaepsb7y2hsb3fadv@6m74ofi4jz36>
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
In-Reply-To: <yg7jatjy4ghl6m7mbldpdrqiv6vp7inyskaepsb7y2hsb3fadv@6m74ofi4jz36>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 69919532A71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61412-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:replyto,linaro.org:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 5/13/26 12:45, Dmitry Baryshkov wrote:
> On Mon, May 11, 2026 at 11:20:31AM +0200, Neil Armstrong wrote:
>> Add the necessary bits into the gen2 platforms tables and handlers
>> to allow decoding streams into 10bit pixel formats.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
>>   drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
>>   drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
>>   4 files changed, 30 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index 0541e02d7507..b6d815c01f1d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>   	pixmp_ip->width = width;
>>   	pixmp_ip->height = height;
>>   
>> +	if (subsc_params.bit_depth == BIT_DEPTH_8 &&
>> +	    pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
>> +	    pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
>> +		pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
>> +	else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
>> +		 pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
>> +		 pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
>> +		pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
> 
> Do we support decoding of 10-bit videos to NV12 buffers?

AFAIK no, I found no sign of that in the downstream driver but I may be wrong.

Neil

> 
>> +
>>   	switch (pixmp_op->pixelformat) {
>>   	case V4L2_PIX_FMT_P010:
>>   		pixmp_op->width = ALIGN(width, 128);
> 


