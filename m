Return-Path: <linux-media+bounces-42675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A9B7FF84
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 16:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3788624CF9
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65475285C80;
	Wed, 17 Sep 2025 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltyK/UcQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD35621B9C9
	for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118846; cv=none; b=Qfg1wI2uz4yKBb0lGWWV4UX/J7LyqofyayC1tYj7o3w27re/sAqZ8BrOd3Kd5jUhziZuNuztemZfCNcbdLB0wqngthyr70zLTgI3mssonxO49jbHj2llSdaJb4jYkyfeBRFjiHYzvkTGwKNpYzLkMo41LIFwqhTSfQADNuVRvow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118846; c=relaxed/simple;
	bh=7tyu4GJKF9jfMUGs6khpicxMq2EWEgv3/XUYIqCVjms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjeDbbqARDTGnd/PzsH3fc0nYcY3KK3iQM/PZe0b1lwmTBCWtX5jewIkGBBBNaShaHoNqo1vLrEmkhbJwDfPgISpxmaNoq49+SCFLUNXkJAlL77PtWR+VrTvU1xmRWFpxsIvj9XLOGLPM23x5uCY3TrZJmQ3dYtQiJFJnOWjh94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltyK/UcQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ec4d6ba12eso1499080f8f.1
        for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758118843; x=1758723643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCrL7wxnMl0L/XqccWsWX7taz8R7Z22xZ9qyTaEV5wU=;
        b=ltyK/UcQvqRKGSj/gBQlc8JU+uAzJlLKYo1BraTD4AgGmYDjs8SP7SonVAW1E+SWM0
         cKIrJJBLbhUYNSU24KQwc4Tlx+XMa/rEwv+IEuvIAJsQ9Ik0O7Omv+V00XY4LR0n7y7D
         vaPnmPVrP9yUPDjOEYM9vDvBBiglR/SJc76O2u8GcWfd/roD9lpj9CWGVGWHNwaSJH7K
         wL7KUpTQQzZfcpMM8dnOtn5ofn4BhP1TxzlCyUVqwS35giAbbUw393OYPJ3Me66Bmtde
         5/0qx6IA8wZA6F3Zxyje4PVAh2+lvwyRwFsYhw34PzEWl5PtM/mpyD6o3WOn30UKcFdE
         VJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758118843; x=1758723643;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCrL7wxnMl0L/XqccWsWX7taz8R7Z22xZ9qyTaEV5wU=;
        b=jWmbxOqU5ns3N7N7OlBvOYR9s4ZmQVA9pSnsmh1H6bBuaF10MFBSoFflEYez9ipDPT
         qTmzaMdgt08PqN/gmuQZ0jR3tbeOcPWBOgi71DYEq0WJlPxkbnjNPafMSotTDDXtoyDs
         FonYPdVxgiaK22nRedpx3p2b/PJq2gLBFfgCKtwwFW/zZtEgkP8pPt1yTtvcZl1CAD9L
         t0J8kw/4aRqbXc8xbXrI1eY1WG7JaztYlOg/AKTytENu1hAb914Iwib6OthS1HmquFBT
         yTRAP1eqIjtyHgAe6VJR0B3N2niZcUqIJTQJ4D+hIKUNi1YaB9ca89wVOnA1+no1glFg
         pjGw==
X-Gm-Message-State: AOJu0YzldH8s+NyNryM29MRkh64bqsgrG6r1skfQywKMOfKyVLu7B0TP
	K5aWccettRyMDy3Op7JyH7ziVpiBfo1D5Sbo2gzL1VU3QrLF5w+9lnh7dj7jnhkQn1k=
X-Gm-Gg: ASbGncsX47VRODRT8Bulr8iCvmt3hawPYCLfPfNjfQ6ztzYwODYfyOrkKw9yFVuUq2A
	Q+tL74LRjunBUQ+nAJfepeIrIC83Skr/edBTYJUIRfAgp7Eg2HQD/nsx0ZJykHW4JOFRXBIxr+V
	2hTx7RGkAe4XYbYeuwjnLZtl3+NeCCyvyHWJy9NBrb/4yoyMxOjW6+FFu2b1J38aGoM/nU057Bm
	sFYtO/GXyIPpaDTCMssQLuqcl2zxE4KBsMKsopTzP1wo2efRw25WUkvhxCktxG53lFsNEZFOlVa
	fJkewkD/ASxQgZdz6g1iL/3wjjCFtII6PcCJAnH2TrweSGmcMsYaDWYMxZ4oFYzEACoH2Y3Mq3J
	Tf6HixXgOi4oUgYFgayQq3WJVMvfgrh7XtEOEhYWAyf3VuurKKuYr8jLwmk3qYpBMDABwme0x2i
	+tcFlAPZsnkPXvY9YZqFuB
X-Google-Smtp-Source: AGHT+IHEtV11s8uvtBLrJw8cjrZiY8F5DmYwYUXY/HIpzKvSZ9vbcJvZoOTcnaZt2GP4VtSI3q41dA==
X-Received: by 2002:a05:6000:2511:b0:3e9:b7a5:5dd6 with SMTP id ffacd0b85a97d-3ecdfa3f4f6mr1925882f8f.40.1758118843125;
        Wed, 17 Sep 2025 07:20:43 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139e87614sm39965525e9.23.2025.09.17.07.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 07:20:42 -0700 (PDT)
Message-ID: <5810c9a2-634e-4abe-86f4-f8e1e349622c@linaro.org>
Date: Wed, 17 Sep 2025 15:20:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: vfe: Fix BPL alignment for QCM2290
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 vladimir.zapolskiy@linaro.org
References: <20250917124312.675996-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250917124312.675996-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2025 13:43, Loic Poulain wrote:
> VFE-340 requires 8-byte alignment instead of 16-byte. This adjustment
> prevents image corruption/misaligment when padding is needed.
> 
> Example: For SRGGB10_1X10/3280x2464, aligned BPL was 4112 instead of 4104
> 
> Fixes: 9e89149a19ed ("media: qcom: camss: add support for QCM2290 camss")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index ee08dbbddf88..dff8d0a1e8c2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1989,7 +1989,6 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	int ret = 8;
>   
>   	switch (vfe->camss->res->version) {
> -	case CAMSS_2290:
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

