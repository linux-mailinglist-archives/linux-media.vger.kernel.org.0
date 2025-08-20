Return-Path: <linux-media+bounces-40394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC84B2DB80
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 932511C225E0
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F012E6110;
	Wed, 20 Aug 2025 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKA/DOwp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3C72E0401
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 11:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690056; cv=none; b=ZATIKXSevMgXXREZzddKO9GrAL15fvRB5XsCnrBKjaR0bsRRzdhIi6adP9ocktnxko2mSwjCrTtlJ3SfI3is7DIo+Yf0AGOG8cqnaL2kb/jYGl8pN0hBZZLYdC4/WdLMXAx9dfCpmzuY7AYhvtBlyO6cYyO0h01UjJH5li55yWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690056; c=relaxed/simple;
	bh=LZ9lNwKnI9igWjqDhty8BMFySOw2pytmhPSOrssKm1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myj5xCgy/HhL16PIwDRxk/h+UVMIA2tyyVD6SK/k+yk89pi0DienIsmcQMk8Ay0VSFqXSxVM76QRB/YiCf0ZYYqsKGbZK5lxpYdCWhcSnDArSWJz+C2gNroIelwJtVvWc/Jayo3DJ700DV2i1aS8DAAg1iu7aUQHUiALM9HNmnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vKA/DOwp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1ac7c066so5138875e9.1
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 04:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755690053; x=1756294853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBsvg6YZ6d6Q45uqCriOUykxMP3lYx/MkdCJhYtl/R8=;
        b=vKA/DOwp1ZX/NVOTc2ENaLymncOv4vBvB08b5qVq6mF0zHLc3HxOI54MIz5Oyp/i+5
         8/NrMbB9hlkGOadiAbYLgIKaA17mgoRBlolxN1QpNW2QCoQR8grVS/TuH+2/rl8I53jP
         eJkbUGBTwO6izB9QVLaAPwW3zEUsVCb7dV7Bvq9y8fdyAnii37CSP71IsyCqWontGjLh
         u6DuOjV9HOVix5mxG+mpoB6AeCTq5+pBVcBXZQENo5XCsuHe/Rmg5mhl1Rv60cdNJuNs
         M+QFIJsRWUfeDj4RUfC7JPdIe4B/F1ZW3Z/1gd9MhUKLWoHAdfOa+IniVKMD8rCUKyU3
         RJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755690053; x=1756294853;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBsvg6YZ6d6Q45uqCriOUykxMP3lYx/MkdCJhYtl/R8=;
        b=Swdqz8Nz6zglJ/xx4qNVVLCHACc5kTTfV6+wdJUmXI7EW20FNLPJSUoL15LhHOuxXi
         WmdWnj8tXo85FbqXriWexWYfN6oe7KrS1szIgWBXjmQ5su0TB9BYDMUy/on+sctHIFVO
         PYVj6gtZcc27n5yC9gbMi+EoQp6iSX3vHZaPRgxiywGze/PdkNcBvke62r3e6XBfaTHL
         Fnv0NEjQOwH3OI1eeuj364z7NWAoNLSij97l9UB/DMJvp47DLa1J1BzD/pMz99lgxe4F
         Q/d3+FQFknllEmgktfKjy7aYGeLQKQqjYlMLN/lIhDA71T2PLK3JLncPjcpMjcUqcMhF
         27Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWPPv9LcmA2ugYaqLH7AtU+YbtxKOkHOKHJ4JHr5Jog04YMguzNxZl26vwnOTdlWam0hxskX8YmVRCyzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrfTLyLi2FFf46NHVlQWMaF7Uw1tVtozbCnkJwF4XvBboj1E1/
	qjlV4lAj/0DiJ9CvxVXU/cT0FQL27zXJq96riPZDyKQR6LLmt0Pcf6IvBUGpqyzx4pA=
X-Gm-Gg: ASbGncubNfCJHKg830OFFZaqFEnIo1Rr6u4nFK7kCayU8wOF9ZnqglDYxw6NKwQguLh
	TGuD2RXzsdN0221Tn0adaD5AYM62kn1JctHLR3hPUkrZel+vjg3LtZx+t7htrL/H1ixf0fCUfHS
	5HXxCg3xE2b6iXE1m7uGDqhehtGCWMBBZNe8nu802WyYtSw7S7jp/YzX+G0THORdvQW1K36WiLe
	wyLA/SGW5xFzZvAWw6rWy5DgQopVciEJwXcMOEucup3KE6IBgFTUXXEv7MGWc2nT5Juz3EF66wb
	Ur64D3lg0fjuAlEoLpN6hMnUVB3n/nSJZ1VcPMN5GRmjBkPwFIPtxI2fyV47xdupNQxkyUsK5bX
	Q8dl+QQQ/0M+vksJM7HJGhLvKipJdcBR6akqwMcnsVVMv5tKCfMI0dWdjNqETkMo=
X-Google-Smtp-Source: AGHT+IHXEFwMDm2kihqAnYayZR6gT+vK15GNCQ1aLgzVsq2r159WZVA/FhKSfLtVw38Kifu9RBCDaw==
X-Received: by 2002:a05:600c:c494:b0:459:e39e:e5a5 with SMTP id 5b1f17b1804b1-45b4743654emr22623065e9.5.1755690052559;
        Wed, 20 Aug 2025 04:40:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47cad57asm31636555e9.24.2025.08.20.04.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 04:40:52 -0700 (PDT)
Message-ID: <c000aaa8-209c-43d2-8f41-701cfdecbce2@linaro.org>
Date: Wed, 20 Aug 2025 12:40:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context
 initialization helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain this context until
> authentication and reset, while non-remoteproc subsystems (e.g., video,
> graphics) do not require it.
> 
> Unify the metadata loading process for both remoteproc and
> non-remoteproc subsystems by introducing a dedicated PAS context
> initialization function.

You've introduced what PAS is in the cover letter but you haven't done 
so in the commit log where you use it.

"Peripheral Authentication Service (PAS)" should be defined in this 
patch somewhere so we know what PAS means.

> 
> By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
> across subsystems and reduce the number of parameters passed to MDT
> loader functions, improving code clarity and maintainability.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
>   include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 96d5cf40a74c..33187d4f4aef 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>   		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>   }
>   
> +void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> +			    size_t mem_size, bool save_mdt_ctx)
> +{
> +	struct qcom_scm_pas_ctx *ctx;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return NULL;
> +
> +	ctx->dev = dev;
> +	ctx->peripheral = peripheral;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +	ctx->save_mdt_ctx = save_mdt_ctx;
> +	ctx->metadata = NULL;
> +
> +	if (save_mdt_ctx) {

You could check metadata != NULL and drop the bool ctx->save_mdt_ctx 
entirely.

---
bod

