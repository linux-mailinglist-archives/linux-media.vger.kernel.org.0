Return-Path: <linux-media+bounces-20690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B240B9B8FE3
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 12:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D90FB21244
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 11:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA87518594A;
	Fri,  1 Nov 2024 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8STDRVf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDAE2A1B2;
	Fri,  1 Nov 2024 11:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730458945; cv=none; b=dCVLCvkMOSXyW8ID07u0EMoGkbfSvfUeSqEyGSa7qnYtLcRUdaCBiNXFsGe9qi6Qdf2BRJW4tyak7XldAQ8c9sLEqjC+aDmtJbW7lHSSYSMDbv+UciCkmVYvFFX/Qa15SQ0KOoxOBaPKVfRh+IxLrh5T6+CZB/u5RR73diCbYkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730458945; c=relaxed/simple;
	bh=TofF4oGit+kVNFhJTdorwKxx+vOtPtL+bvcmp2ULECU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O/BN7ajHxVaIwyUlC6Suj/sqIfJsWH5da6lZN3UHQvWrf9ywXTWR6pi9I+KtdQrkcOOINEKypw40GbOPZwuDeVOqU6Mt7B3fiHrUX8ERV8BRT8InNogu6B7lP1yNHs3p8AWPidw0V2h6tsZUz4KIGC6JAsZAU6XyHgzOlhFgfPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8STDRVf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so2184543e87.1;
        Fri, 01 Nov 2024 04:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730458941; x=1731063741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kihzc34kXx/NFKsEmVBQvaMpJykR7yHUggsrDFyErHg=;
        b=F8STDRVfZQdmi3rpC8jF744MvOIyOg2xyRwdNCmyv7cE5cbSoGfSIOTqiiW+ZldEru
         oHPZ2PB9jzrM63/0wffmzPlmEvTxtYNe7yRJCmcmrbwWUaLvsZul+iEqROydUuKL7REp
         wEOhgURyfhkLlannpMGRAG6pOZ9Q+ASQoUDdhYfWQLPIeRRtFnIhRkL0QomjNwYRS9q9
         L8j2bkUH3FDtb/HP2MI03hFxmb0EJmDDnhuoypkDhpWnM0SmH2AfNUEj425S35RboKKA
         +5evY5kd4V4FFIapWiCeoXK6aSB1Pe8kUEOh2JCnHwchSaZ/PRi90WqTwpL4bF8ZUnLA
         m95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730458941; x=1731063741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kihzc34kXx/NFKsEmVBQvaMpJykR7yHUggsrDFyErHg=;
        b=Udx2bQrk50QRTDsSxqbpA4gxELnm3v1LgQQkISMn7/X8BDNhIi8pxRAFlggA97nP5c
         FnZpPg2PEmORyMOr6CSAZfshI30jTwkouyCgTr8FsGQFFOhyr17CXkqaRWBafFaooyb/
         /UWDSDo+JJ1AUo8CUkO8XbCGbIRlMQxy5cjVYEMAhRyaotMTvbmg4drgt/DYf/hcnfyH
         cpzthQeOdbjuvmRyMg7UM2acFV8FQoEbJlmczskVUA46mR5xJfUoTxqR0eG1IDW5nOnF
         9xvLG91fdmyv9UgMa28Kyg+oORIQnOtgPtBbTnjQHhXSpW5b4THAzmbF54qYd2xKgXoK
         rK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUXTWHRLA0MF/vBlTjj/91uEc3Bp+pSSlZYDh3E1r7P7hcDz6TWeOvMaACycfs9ApwJy4jf9dQdcd0Y+4=@vger.kernel.org, AJvYcCVuZtU0gzQ37yZ6s4GyDWV5SN5QMvH1nAk3mAI9hjMcGBqw5eAtT1VvVI4NBi+lo9KcE1eBbddGlmIzoFto@vger.kernel.org, AJvYcCW38eAvvGbGNS0HdTDlnzQkW6E8WJAc8zBL5zPqD2VUk3EOSZ6q5JJmIE1dPRKfCb1r5deLKSjhDpHx17Ml@vger.kernel.org
X-Gm-Message-State: AOJu0YyCDqnYyHLv3AyLeEP9yuk6GDJIqxYwyr/8EBTJEGXaYKP+TWiE
	8nCwfZkc2K1UrokrBw3qJyI7iGl3P1ilUwBoknzfV0quRi2A1NaH
X-Google-Smtp-Source: AGHT+IG7gqlfm/DA2MelrdUrZW2vdNjxw9dwV2mm8qKhoGeD/IF/bobhYVNyPgEOeew+aDvXlM1agg==
X-Received: by 2002:a05:6512:3b2b:b0:52e:f99e:5dd1 with SMTP id 2adb3069b0e04-53b3491cd1emr11826340e87.47.1730458940826;
        Fri, 01 Nov 2024 04:02:20 -0700 (PDT)
Received: from [192.168.1.19] (79-100-30-28.ip.btc-net.bg. [79.100.30.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4141sm4730507f8f.28.2024.11.01.04.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 04:02:20 -0700 (PDT)
Message-ID: <71f68515-235f-4e6d-a401-f2745763f9cc@gmail.com>
Date: Fri, 1 Nov 2024 13:02:18 +0200
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
 quic_vgarodia@quicinc.com, bryan.odonoghue@linaro.org, shijie.qin@nxp.com,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: chenridong@huawei.com
References: <20241101094050.2421038-1-ruanjinjie@huawei.com>
 <20241101094050.2421038-4-ruanjinjie@huawei.com>
Content-Language: en-US, bg-BG
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <20241101094050.2421038-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1.11.24 г. 11:40 ч., Jinjie Ruan wrote:
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

Acked-by: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>

-- 
regards,
Stan

