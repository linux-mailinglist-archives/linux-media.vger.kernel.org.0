Return-Path: <linux-media+bounces-22757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D2D9E621D
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 01:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB86316879C
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 00:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F2B199BC;
	Fri,  6 Dec 2024 00:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvR0lFNd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228277464
	for <linux-media@vger.kernel.org>; Fri,  6 Dec 2024 00:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733444490; cv=none; b=OAkfQlohMFKtXoehEGzUvcKcL4XMJQZVRVy3JNQy1hzXvd0hoPHPach41vrxpfrJSAlZP+cH+vyHUge7oWFLcZFXkxghONBHZUnxo9qnnbavdC+FIzGe5zQZG30EErjpzpuD1HK43CO15Zv3e1fGprfPKybSfJ8l/ScSUDZevII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733444490; c=relaxed/simple;
	bh=ECFPlpYx6xTXivoepudOakBW955sadKB6u8Jl+brS2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQm6J3J2Ae/DE0yWTB0xnsQF2W4f/LvOcaXNo5xOMUNetjodbYDB87bWBLKSMV4AflQDo1/a8ZBMd4idY76yjRDWEunDmdH8dtnvXRtO+JzT8WOGjkZzw5noQv5XfH8eQeB22nXCsed1HWvrUj7qr7a44SxqV5I/HRN1CuWGvkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvR0lFNd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e25c5d75so889818f8f.1
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 16:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733444486; x=1734049286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iluXuUMeyOtUOSmbmFOhlAadIgL8iqOWZsl/pbKsiiU=;
        b=CvR0lFNdKd35z2F1dCnTp3pqQa05tWI8AlIP7Tfv9NRJGk4s+J7OAtwCkdn2YfYgoY
         wErxx62BoO+ZDNzn3qnui32djJ8NbO5Q6rvrLVq5H56qbOWmUSBD8t0Gp5he+/fIUJ3b
         MDKbC6iD4VMtxjSmzQ5Ctgyx8C2O/5JemBALinH1LovEdPlcQpZzA2dSCyUzDDa030dO
         JACxC6yzEyoGoRf49QZ6b3Bc4OIYp6MnJeX23J+1O09B8eue5qES2SgyvAWDy+euj+s+
         193rEwEmns21bPChnuV6gCHqfpngGm9s4vXH6E2iA3Va3rX6qyV6/dKUI/x8bisfiTQv
         +MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733444486; x=1734049286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iluXuUMeyOtUOSmbmFOhlAadIgL8iqOWZsl/pbKsiiU=;
        b=pV8L9/PR3HpOlAHlqsT0rCdv9PgDyCXf6TOvA9kjruC3zTy0jo73neBUB2TKAILzgU
         M14EuD4EvkQ6hOQbwDhMLoakx0EpSB6fENXlPAd9u10podUf0QuSMYps+6NRp35Hfgu8
         kkFkWhh3tbz2niWQ7EDteh9ynWGo++0nM9v7YCc3Vr3kJ5iIHlbXMBQ3ahp793922taF
         Sk5sCIzgNEHOFvHGMc6QZ5o+qoiD+/eh9JAdwSwxq/TK2M8k8NYAOfqUhQ0IugHzW2dY
         V+yfHW2QnpRfu+DAEUAiuTkq8uqFkY0ILm7teeMWdp6/L2BYHUbfSJOS4OCpf54HF+jH
         tmDA==
X-Forwarded-Encrypted: i=1; AJvYcCX+g83Mw2q4smU1xifGicGEpE5PnEgbF8JHGoGXxOM7NIY/YkoRWJtgxg2aALX06lqdbXXtLwis8qEuLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjwLwz+vPelnzhtTUT42eFSW3UEVhma72epMe/RQloVWCngxzo
	Z4LV8NEp2wTsYEdUucEP/fbz3+g1Cnb4K0skNg4cJ/m0O5vkJFeSt73JacZOOtM=
X-Gm-Gg: ASbGncvMvcYM5UNGT77dxGMkH0aDyr0E6rVzv2QjJQj11l33zhwUOpnzoLz+pc29q1F
	MuCB2NkmAoWu9gKnEyab5PJgev1UPBvEfjEn3lbeDfTsGqfAv7PN7iUs6XBHkr61TAF+VCTNx4C
	c021S+WSF+H9qLusjnVoVF1j5BFmunHrkmHmYAA4DBC87gU5scA+0TciYaqgnqtOIWu4rDU/uvq
	A5EOM8pVQm67WWbKBIOoptTQ+wRLCq8naBdUCj1QKENuQly9RsZOAoC3RxJj7E=
X-Google-Smtp-Source: AGHT+IHHgaIuslDJ05D+6hCUGtryGORItnAkhst5F4QETKpbtAasAT/SV3liDYCmlprOqkATMFDkhw==
X-Received: by 2002:a05:6000:401e:b0:385:dc45:ea06 with SMTP id ffacd0b85a97d-3862b35104bmr666619f8f.13.1733444486436;
        Thu, 05 Dec 2024 16:21:26 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5273199sm76779865e9.14.2024.12.05.16.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 16:21:26 -0800 (PST)
Message-ID: <636ef629-2298-44cd-9e0c-d009379a72a6@linaro.org>
Date: Fri, 6 Dec 2024 00:21:25 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] media: qcom: camss: Add default case in
 vfe_src_pad_code
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-13-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241205155538.250743-13-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 15:55, Depeng Shao wrote:
> Add a default case in vfe_src_pad_code to get rid of a compile
> warning if a new hw enum is added.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 58e24a043e81..1c9b6569fbe5 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -404,6 +404,10 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   			return sink_code;
>   		}
>   		break;
> +	default:
> +		WARN(1, "Unsupported HW version: %x\n",
> +		     vfe->camss->res->version);
> +		break;
>   	}
>   	return 0;
>   }

Please re-order your patches here.

Generic fixes in a series to enable silicon are _fine_ but such fixes 
should come before the silicon enabling portion of the series.

So this patch should come before "[PATCH 11/16] dt-bindings: media: 
camss: Add qcom,sm8550-camss binding"

---
bod

