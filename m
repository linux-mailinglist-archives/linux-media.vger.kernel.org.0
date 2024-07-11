Return-Path: <linux-media+bounces-14925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848C92E826
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 14:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B86FB285C13
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5CF15B132;
	Thu, 11 Jul 2024 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWuobwHA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030F615B145
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700368; cv=none; b=pJeFYouuQ3Mv84TVaiiuvZNd603B7FitdAZag7YlgV6nonKsciGGg7+t8QAHrQy1nAu1Yl4R8WsitFxxlPkXD8usM+E5QRxgJB3s3EU2u2d2hFF1nme8pQcdoeF/3OD5pwzG8CoCw2Prx136es5jS9EGYSTwykAuVv6L1boU3Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700368; c=relaxed/simple;
	bh=ShoApCPFJ8OT++92dM4/QSOnjbYm8rOtDQtsUkF0IDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7WtafAB/Dq6MuOhr3UlgCawoqBP9pgemWPRSESmy9CotHCshTiAdPUXfAgpVHfSppLVtIJxKqQca7dsKuG9hl50yQAa45ESdz2MY6YSH2Sm+Rf9T8g4oJhx6GP16iWlwvxxWlXsmSIJVTEZN8585GmlYe2yJ18DcueSwj3GNbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWuobwHA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ea0f18500so860207e87.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720700363; x=1721305163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+9tg0Li/AqyrMmzIO9QGRt9whheokHUzC6WmLohbNQ=;
        b=qWuobwHAB/UQxev8J6cFDYyE4w7/ImR98tP/glecydPVFUpcIJF3dwe3aKBWm9dYMo
         itgldbEvkShKCjZihHUMlNJg24fYf/4y4ZXQlVNM8wjDIhD+d2GYmE0A5XVa1Ex9kRgW
         OzdKaEoRTHcyhkT7HuTrOX5EaVm9zn9WPAbwDYFwqLokv8vi69ahQqD5rmgy+zej1gf/
         qVWxOqURCTRUpm80qNKsJJWdCrmXyC0Wrlq/clxF7sHM1E+P8k6GSIMQRKIaJnR+MEwM
         micVf+Uequzf/p9ey/Nq1xolMnzwlSijW3fesrMdeRJUQFG2VTM1HlWFQ4RG36do3+BE
         n2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720700363; x=1721305163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+9tg0Li/AqyrMmzIO9QGRt9whheokHUzC6WmLohbNQ=;
        b=j+7O5UDghWXP/SO1jQ0SCfl+DKwWEMu4BhXsv/HQrt38iRq2nRc8QVQ4d4hlJCxQ5c
         /g8R5UopMQBzh7JJK95QLEZRn1Vx7G709vhEK3OTpP2SwXaGgKwSXduVkYyry+YJ9rS6
         hvh20qPI+WmSXczthHJCo3qAuRKtY+h+i65MHJxr6c/d4CdGEpFlfvIm1ocLi3IB5X6O
         nJS0ynZM3RiGXVdAsxSgRuPyLYdcuwsFMMWl3SVTKm4lMHAHKWLCgtNkq2UZYfAjPj2N
         rS4C/3i+l+1CAEI79mVps5j8yjNH37ohMXXG/dtjUmpxCRO89ydUOADz8mvw82wZnVMC
         AKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVswRLku/CVTRqxy1zNMajgVA/bVf2qQXc4rkZfuCtqAYdd8TT1NSptYe0/DILraZLSEnmCx32geU0cWfJ2ES+LPGpzhQkXYpNcmcE=
X-Gm-Message-State: AOJu0YwMH6cjwD3CEBn0g8xx1Rxy42SsUIuiU66PbmgJ9vHhgFoNlS26
	du600I0KfY9zth+TdYpHtmD1tUjJDHqxWeq9qSjYr/4kPhacRHI47Tg8XWShvkE=
X-Google-Smtp-Source: AGHT+IH8XJ9x1TRFe6JiT4Wf3t1Tb6DvI9x+xL3YAtfaHFGDRg1d0VfdwZDgWq5WbIZ0C/RWbk2mjg==
X-Received: by 2002:a05:6512:15a0:b0:52c:d750:bd19 with SMTP id 2adb3069b0e04-52eb998fc7cmr6784566e87.8.1720700363175;
        Thu, 11 Jul 2024 05:19:23 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42651531f1fsm250412815e9.0.2024.07.11.05.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 05:19:22 -0700 (PDT)
Message-ID: <96f14a07-0b82-45b4-8c72-edeb1e2e52af@linaro.org>
Date: Thu, 11 Jul 2024 13:19:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: venus: hfi_cmds: struct
 hfi_session_release_buffer_pkt: Replace 1-element array with flexible array
To: Kees Cook <kees@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710230728.work.977-kees@kernel.org>
 <20240710230914.3156277-1-kees@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240710230914.3156277-1-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2024 00:09, Kees Cook wrote:
> Replace the deprecated[1] use of a 1-element array in
> struct hfi_session_release_buffer_pkt with a modern flexible array.
> 
> No binary differences are present after this conversion.
> 
> Link: https://github.com/KSPP/linux/issues/79 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 20acd412ee7b..42825f07939d 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
>   	u32 extradata_size;
>   	u32 response_req;
>   	u32 num_buffers;
> -	u32 buffer_info[1];
> +	u32 buffer_info[];
>   };
>   
>   struct hfi_session_release_resources_pkt {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

