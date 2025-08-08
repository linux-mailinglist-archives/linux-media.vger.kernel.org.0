Return-Path: <linux-media+bounces-39106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D112B1E563
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F164E17A266
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA1326C3A0;
	Fri,  8 Aug 2025 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JJg83/Zu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E51C8603
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644296; cv=none; b=C20wbyuFKXszhaCIZ6LnCNjaV+nRREIOyCxzm7+TOXhkYgZY699S2xhU0ZWCfD/YUgLD+NrUwby6c4Par9/8C9ttb/cvSUdyeS/r1FdCXhmYv79EO0V0JPmm7bJsuGXg+s17ZuOPHaTS2p7m/LRoQ3a2URRrdFkUrKcUH2YTsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644296; c=relaxed/simple;
	bh=yO5R5g4RRRQ9fylhV15S4TlG43LV0nzy1cjPY86UEqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFHoDSofYJLb6PyhCBTYNbDoamDcYvmFSKcAdA7DhPtZ/IgP5W00VMcOOkYV+qi5u1BxG/jcnxtPj4WaO78Vquo3uRFh5koilma+CCZyY2SpK0SRXRoy+VWlgq3fPiFfcbvrt+zQTt/QVcKI0ww/y6l7xIRgAyki0eQWLBdK7z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JJg83/Zu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b783ea502eso1459872f8f.1
        for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754644291; x=1755249091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQHZz2yokMkgkwlKNquoPo8xw5GL1brCMiREVSCGCgU=;
        b=JJg83/Zu1uZJYskpUVR9qjcGv6WphJLWnmEyrMtPPOUSHWJ0wv9N4tWLV8uCWx4quX
         RgK9bA8oaHhfj89/HDePBmCzFG8OeG131mBhtT/0i6FutIZKvN+RvZNp7dCCG8dOxo0e
         JPHP4ebN/+JgBKt4m6hTLgDmAJry+n+ft+DZ0Zup6TV/Q4V5QtZmLjblG9MixK9nFTS4
         5PoXsyTkZZ3fv+FtqEKkvQ5mw/iCWoyqDM86qGDlQeFqXW/evSyUz2epNRfmVFJKdhWX
         bpC1HiH924dmKpsFgHTJc60GRepFOCSAw3r12EYJnjVG9hbFxWTnqCaEupb58l+XXD4b
         CIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754644291; x=1755249091;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQHZz2yokMkgkwlKNquoPo8xw5GL1brCMiREVSCGCgU=;
        b=lRKNBMIrjxRiK/Km9bJJQnaGg/539kyXTg5OaJQnTKzVNcZeLC9s55JQxAm9yJwPlq
         JQvuOGT37rtYocxP/HXdKyc3dBsARRUrwIOHDj0ZSr6VDQiITlEimJMDa2W7VQyAF1DG
         rA/d1N23S9eAGjOA9A2Q/cCrfPEZIVSweqkzjE3WgYZ+ubK3ZKLHNP067oxd/9LCxWBX
         i8fg+e8v/znXoN3aWAqtTsxxqkPzTheUey9B5oKW//ZNHxDxnDBP+OLlfuNZ5L7yG9Ep
         jOms7GSc4sUtNQ9Rx6ZNGnhJm+9zf9gWRvsK0t5bQU5Fs+t6hxalnexOrN9nOr3h3QFZ
         uYpA==
X-Forwarded-Encrypted: i=1; AJvYcCWC7sVbfVr4HAJ0A4wN4aIEV5neE2524s92GMiZrmyT42ExNLXLWLjjsY/XksCSQlxQULmyMfCAWD3aGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHXLVoy0g8uaSyEHjDnwltT3rZR703PFMyNn0rPrHG1MWrAnHC
	SxfABrAbvdSQPzVGcIGNf/34cnkK3gBiJBYSTkbvSMx+Fg9cJ18yIIYiDky62tLwe94=
X-Gm-Gg: ASbGncspB3KcKxU1C90j8FnPuADw+O6Vg8JToMKikVEgC+KszX5p44GirkKJnHxRmGI
	SUOFT2qrbR+DUtE5ZkGuin3T9aNNFvAuwWvdIfNYS2wYsNQLFxw3/STJdwMr0fsp5K9suefy8kS
	sfdAov7K17H+Iq7Xz+PyNS0cG6rH68OTW6RapbnOLsS5u5pQWS8eBuFY6O+FjpqOl2VRqeXNwny
	NcyqL9KE4ymCN88vg9FjcbqoV/ZeWjTIQcs53IcdedPgfVEr6UldEFysFu2g9XF8uHAfpGg5mnA
	dbHkqoDsnE+/bQVojqFCuSYjeJh3khkUEXJ1yKn8hMkLhFGUJ9aOzpNERe82i/6R7Xc3J7Co6Rt
	k67womcFzP3zOb+1LPqlz9kHZvctgrbE/neHukOfqaf1T66+sIeZHoWPBs6qs24Q=
X-Google-Smtp-Source: AGHT+IHDbCe6jjj6r9hyHFmBI+bqB412fjCUIPMbbqAd89xsBc/7FSoiXU2imCpUAZvEXTUCmX66eA==
X-Received: by 2002:a05:6000:40e1:b0:3b7:8842:89f5 with SMTP id ffacd0b85a97d-3b8f97bbfa9mr5683297f8f.1.1754644291208;
        Fri, 08 Aug 2025 02:11:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b501f22dsm165801695e9.0.2025.08.08.02.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:11:30 -0700 (PDT)
Message-ID: <343c1606-75c5-4b2a-9d45-160a6a8fe255@linaro.org>
Date: Fri, 8 Aug 2025 10:11:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/8] media: venus: core: Sort dt_match alphabetically.
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <20250808085300.1403570-6-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250808085300.1403570-6-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2025 09:52, Jorge Ramirez-Ortiz wrote:
> From: Jorge Ramirez-Ortiz <jorge@foundries.io>
> 
> Correctly sort the array of venus_dt_match entries.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> ---
>   drivers/media/platform/qcom/venus/core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index adc38fbc9d79..9604a7eed49d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1074,11 +1074,11 @@ static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>   	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
> +	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> +	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>   	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>   	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>   	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> -	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> -	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>   	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
>   	{ }
>   };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

