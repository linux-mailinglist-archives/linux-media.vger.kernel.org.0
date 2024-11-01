Return-Path: <linux-media+bounces-20685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FC59B8E79
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 11:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 679F31F25A02
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E251D555;
	Fri,  1 Nov 2024 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FlIy/8L0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A711581EE
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455202; cv=none; b=tHJ2YVJP/70rYUTwOtDCQxRiOSseRbdgx5/v0T70rPNF3Z3ZcQp8Goog4YkWKcNMZFYTpbFWiYlIugSFJ+Je0eEUrzg2Ar/5iYJjpPccGtE6jEXc56Srk5gY8XGUjmUizP82a5gB+qm1C6YYlv1jm2pJtbvdIyHvIlxIrB9NKYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455202; c=relaxed/simple;
	bh=ZkIHuit9XH/WbkdUw4J0iAuXlse9CJHtPB9iDLM0soo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOI91napgTL8az4u/tQGBLgXIBQz8rNv7x8MOk7N3TxXdmrMl4ey2sBRDSQqAbw3jR8wIQOOkyeZY4bVmKmjuOi57ge0SxokVSB/yx+kTWfrdsHcSpMe+cISi2S7VYdIIjUmnIYHxcwdmvrYWP/fiy1BcEl3ar4oC6QFXrbFAnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FlIy/8L0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d47b38336so1369061f8f.3
        for <linux-media@vger.kernel.org>; Fri, 01 Nov 2024 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730455198; x=1731059998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kCMYxsENI5KzW+rkth2c1UykDj87pqP/pFjISR1rPF0=;
        b=FlIy/8L0sfKqvUXy3lvLzupC8nboS0ldmM0VdAMLYCYe+CkMzxceUqMuNNrifBpTDh
         BQoW+BTg+f8Ic6KuCg6gUBqLzDO+v/krXH3Glmf6prBtauSGuN+JO0vb7kTXq5Jgxp33
         KzUtLIie66NGhuD+1AP46+GnKaDLcr7WXLbn9X3pu6KZBeV0gkG4OnBYNPi2zb7ySjST
         3VS4NiR1yUJjvM32Px5v2rzJjXud9z7a48wn3jMvlP8uwKUYFo688+AV+R0k6qwnGdBC
         AmF0EBs2xzlT7r4+75AN+K9cg4ZwUOdgfCfRCMJFxeVEJOd0mW99GKr96qxzDD/HfbPj
         ozWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455198; x=1731059998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCMYxsENI5KzW+rkth2c1UykDj87pqP/pFjISR1rPF0=;
        b=hpNTTPv427Yg9S4qITIhUTXAFwfWhVjlNdzRoZb2Xw3zELocZLCvNn+wcB34D41Tqm
         ZbN+cAp6YwcbzYAREfPA+HXfp9+v8z9dY/RwcnR4qdvcfva0WxREqvkZ9wCgptsUx9oM
         2nmKwWSOAsHyorVcYcTabMh5nrA5zQ9Q7UYNplWx/b463n6q8Giwu7HPwJDl9h5mkMPM
         hISUASH+55wAFlJH9cfV13ZMMB6EGhuX31xiQKvouF2ljKrqkCTToGNit11MvsrP3CrN
         jWhpotKef7FWVMZmKjHLN8h5ekCCTS+3Q+DffgoifylTBlmX6mUmmUBKD+KJV2DufPNz
         xitw==
X-Forwarded-Encrypted: i=1; AJvYcCVwsWS9rcHGoPkBzj7sz7u2elkJVrEmrQt9eYoJ2LnDDcVCfAIPpl9vzg7U+gY54Zj1W2QE2Fbj0L57Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3CTpfykMPCZkn8tYSQ5RfmR4rAEturzERGAwrP/gsL1z3o5NY
	BVIDCpZISwJvLd2zKWQwBl2SJKnQyc0r+x3pk2HVpoB/9gukZBeDW6PIucyAe2k=
X-Google-Smtp-Source: AGHT+IHPedYLVwzy/bVIibNk6iPvacu9rvmCe3Ib1wQ1oV/5dOpF8xEpg5pq4bozzuGmgbu3MZNKhw==
X-Received: by 2002:a5d:6a51:0:b0:37d:5301:6edb with SMTP id ffacd0b85a97d-38061221e7bmr14762555f8f.57.1730455198581;
        Fri, 01 Nov 2024 02:59:58 -0700 (PDT)
Received: from [192.168.0.17] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c11898easm4569503f8f.117.2024.11.01.02.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 02:59:58 -0700 (PDT)
Message-ID: <a7975bd0-8593-4ecc-91d4-cbf2113037f4@linaro.org>
Date: Fri, 1 Nov 2024 09:59:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: venus: Fix pm_runtime_set_suspended() with
 runtime pm enabled
To: Jinjie Ruan <ruanjinjie@huawei.com>, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, ming.qian@nxp.com, eagle.zhou@nxp.com,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
 shijie.qin@nxp.com, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: chenridong@huawei.com
References: <20241101094050.2421038-1-ruanjinjie@huawei.com>
 <20241101094050.2421038-4-ruanjinjie@huawei.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241101094050.2421038-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2024 09:40, Jinjie Ruan wrote:
> It is not valid to call pm_runtime_set_suspended() for devices
> with runtime PM enabled because it returns -EAGAIN if it is enabled
> already and working. So, call pm_runtime_disable() before to fix it.
> 
> Cc: stable@vger.kernel.org
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Add Cc stable.
> ---
>   drivers/media/platform/qcom/venus/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 84e95a46dfc9..cabcf710c046 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -412,8 +412,8 @@ static int venus_probe(struct platform_device *pdev)
>   	of_platform_depopulate(dev);
>   err_runtime_disable:
>   	pm_runtime_put_noidle(dev);
> -	pm_runtime_set_suspended(dev);
>   	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
>   	hfi_destroy(core);
>   err_core_deinit:
>   	hfi_core_deinit(core, false);

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

