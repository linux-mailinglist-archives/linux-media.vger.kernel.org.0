Return-Path: <linux-media+bounces-30017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8696CA85CA6
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 14:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 386131B86E1E
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 12:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBD429B23F;
	Fri, 11 Apr 2025 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lz+qo4Gn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04AA29B20D
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373444; cv=none; b=Jj9AEdq3CZBSSFSO9xuIywh+1BBsdDuoIirpNmhJtfAkj5wNnQKiFRmJuhT/YmA9POsoPlgT7IiGMriK0SMa4NJgxrYnwZe42HgjStCFyXRKl8GJztqjHa4+BUceo/tklzfGJsYxTzOUUjH1SmCquBMD2jlEAL2yI1fmjpWAbBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373444; c=relaxed/simple;
	bh=dGHld92vUVbOFD/u6AtKaP9uEUe1RGPsRpaLDsrOO/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HTU0XKWr5U5L+A/NNXb2bEX0LMFNrCHN4LaWpcniYfNW2U/GMMaD8mVyzbvwZ2TIJu65idr9vOMAsz8AtX9UCLINXBxnrI9QUoKJ/+6I8Nsxg0lEAmp5iUz8oZxuQEEVmDnIHp3quP3LWIT+cZnXY4Z3uigv1+4LuzU/sG30W1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lz+qo4Gn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so20906485e9.1
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 05:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744373441; x=1744978241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5LlnegqhXWYoYcLoLagqAZu+k870W60Ciw5agd+TQE=;
        b=lz+qo4Gn3kxsri5qolrG9V6egeFebKxqHNRtcxRp6fWCmzfW4FAoajq3UGpmgRgng/
         2DLUO1O+zTnXVHC9JjkzCEeQpRhlYw3itR8bft4dkKpWMmAz5AaFF5xIg/zdGdLYyO/+
         IXKIZY9G0XYS8Gvkn7uXeWkGRY+2c11haossZo4tfkwEACVhjFgOZFgclUCwDf/aKERp
         bXTwwmq+Ivnhqj0vk7BWK8q6NuQqxglmoQdel0fvH24TrKVUDpN7/5oV0ejnadY/thc2
         eFxrf9dgSXSui6Jnu1CCSVm6YB+dzUf/oJbMsaYtwga/yjf8dBWU0qdS7X8KY1t7r5ZU
         I+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744373441; x=1744978241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5LlnegqhXWYoYcLoLagqAZu+k870W60Ciw5agd+TQE=;
        b=hHwEF6VjJbdniY0+Y4bwBnvTv7T+Em7Gy+/4vAflWzh50cDSAbY6Oli0zRpJBQMhDg
         k2jE5nyltrm+6XBd1Encrc4S9EW80H7/j/cJAWw2HNCF2+YNkH+6nM4lR4x1vd3N4I9n
         f4kbZzm04fJKlf8veSWc9jJ8nmsKJFXNa4bKxaKVe6Poz0Bj2HWG+Y5W18UKUhe6xXf8
         vvR0pJmxJxOyYTQRJWhW0Ykbnr4dGRGHenOL3D/zLXMuVHmacWNeEMug7wCWY3tDl+0T
         LaD77wVVBd9u1pogWr4Z5AKsDu3GiwYz3O3/sV5Y5POPpptl91R6Ep+rhjTIMWiaHJUu
         MP6w==
X-Forwarded-Encrypted: i=1; AJvYcCUhzt9sGXrGaFrCs9SktQOCZQLmXFvZ4dIKp+WLvn4JdbvKaR59wNXbVQNk9gSkTtLcX/L1bZA7Mw4rOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+a0hWOef5BhZ2CPDljyIA71xU2bhVk5Zpbvk7Uulk6KVMSzV
	LVaGqdojst+Fic5G6dvfJiFPB1icNXSpXlULJS2/pIZ4FU1YlfgDG6WDPF7HdR0=
X-Gm-Gg: ASbGncv0pprY2zY2g1zClX8qnEn0UvjMB0HhmTyDa7Wqk3X/6OX7/4loOZ8kZcXc1pd
	0CtdFxHlumzhMmoGQPM8xuHzGaDeH8m+9Tnskyhd5mvOw6UngzH+hVg1rTYEjWgPueaKwYExhxh
	bVmUZCRSpAaNRN6w3GjmOHO1puzEY9zagiicRM2MGrarTaCHeG+18gw3P/jl9/2eXCzpxK63kgY
	4SRn0yMy5i1n6UJVo0/r/m6biQK1jO+581R8ZybYf7IapBvlGWsxK4XdNRJmbazTjeJCxohrEEf
	BYFSwIbW6cIww4qq419l6ERCRI39fkqdxbGJ4291vBCAd8glKOGzNYkMjlhE0d0eP1RLeLVRKk0
	G4EFemw==
X-Google-Smtp-Source: AGHT+IHlOq8/ca5REmCpBpkFoqbdN5SzfkW5Ay4uvrR7nOsyWNcTGKb621SxyZxe+WjLiuuz2iXeFA==
X-Received: by 2002:a05:600c:4f50:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-43f2eb51034mr62138375e9.10.1744373441065;
        Fri, 11 Apr 2025 05:10:41 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c817dsm80436805e9.23.2025.04.11.05.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:10:40 -0700 (PDT)
Message-ID: <811cd70e-dc27-4ce0-b7da-296fa5926f90@linaro.org>
Date: Fri, 11 Apr 2025 13:10:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] media: iris: Skip destroying internal buffer if not
 dequeued
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> Firmware might hold the DPB buffers for reference in case of sequence
> change, so skip destroying buffers for which QUEUED flag is not removed.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index e5c5a564fcb8..75fe63cc2327 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -396,6 +396,13 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>   	for (i = 0; i < len; i++) {
>   		buffers = &inst->buffers[internal_buf_type[i]];
>   		list_for_each_entry_safe(buf, next, &buffers->list, list) {
> +			/*
> +			 * skip destroying internal(DPB) buffer if firmware
> +			 * did not return it.
> +			 */
> +			if (buf->attr & BUF_ATTR_QUEUED)
> +				continue;
> +
>   			ret = iris_destroy_internal_buffer(inst, buf);
>   			if (ret)
>   				return ret;
> 

iris_destroy_internal_buffers() is called from

- iris_vdec_streamon_output
- iris_venc_streamon_output
- iris_close

So if we skip releasing the buffer here, when will the memory be released ?

Particularly the kfree() in iris_destroy_internal_buffer() ?

iris_close -> iris_destroy_internal_buffers ! -> iris_destroy_buffer

Is a leak right ?

---
bod

