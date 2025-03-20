Return-Path: <linux-media+bounces-28542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFDFA6B012
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 22:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5E73BCEE7
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 21:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEC422A1EF;
	Thu, 20 Mar 2025 21:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LcDeJcgR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878C2222B6
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 21:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742506993; cv=none; b=bQs5xxR4dUAqVi0s8tS3INlwAt0w2uzB8gN5/vjf7kvmUqzCL4OPSdvZLQYOjvbyPYA3SmVPvHAE/L/8coAikYU3ALIiBw/1sJG16OdYNKrm73s6ekBPkZyK89rjSDHl9nmHo3584jXQBRxpJYcTq1ZWmYKJduI86aoG+/gcUBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742506993; c=relaxed/simple;
	bh=mOnDqgj0BSZmK+Rt4jod6O1D9Yk05JHk1R77dSq+p8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZOal5U2zKlRko16ozbz+O4xGD6RJd2SMZ76fm9geumgVe70BvkfLek3r49pDX0UYkwsyR6K7ICTn6ZfBIZJVjhBmCzoPAgpD0eUaW4wlcTjGTQBCtXCH5yBJwROb+0HEyX0IpzBF/VRx3jigJ1yEqTtFU+bhC1pAhtnKlBTrWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LcDeJcgR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso7482705e9.0
        for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 14:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742506988; x=1743111788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HOP7UU/BixFyu9/NC0nZ1KUzXLkUEuMKRRqPCxM5rYI=;
        b=LcDeJcgRK/37MHc62RdAnHClLMYusE5uKEMsicsMNd5mLfpjBaBmpHKP72M/iNu9Xt
         C/8uhLWqJ1D4kvhcS1PDswtXVe7YlWTV7eT2GbVD5MhuX3zYq6i808HZjf6z9JZ7XAn/
         YE8YDJHKnNSiw8VE5jaZ39pnrYDfLWR0XYilRJXFNirwU+B1WwHelz/v6hB1g+Pq4MKm
         38pcP9IrrKmwH2FnIZS7RFTm3170ySP6IDBjmHCUkIDK8TKwzxvT9RqGDQAwSHsNxq39
         C7cP6+8dLoLxqbB3b1h3AuDayyZ5PoZPjgFQIjtGO6yacCCQC5ZZzT+k3Fn/yafddI+d
         kktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742506988; x=1743111788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HOP7UU/BixFyu9/NC0nZ1KUzXLkUEuMKRRqPCxM5rYI=;
        b=MVUpDCm/FDOyE+lJBzB3MRQgl78j3KKMmALOCtKLvpIcfEWQsdkYlJJyVIiNkeAl1c
         0rzs8L13eJHmqJ1RZXJPcXc70hVoeWPp05M9oufPPPOMS5vlshdXGZABuNhCh0n0x1oO
         848lAphNTIvfVmHRpaIa6TCD+E2DCbrqpHbcH0WfsBQvKRiogbtvDXnOAyGmoOExfarv
         4HGUw6/+ZxM6rSNlcmgV7iJa6Ikhi+K4FRoHulHUEtq3bWl4htfKQGiCy/j5D0qS6k9q
         wTQf5dPCcTCQ6yvE+70bpO3K69aBg7/KCdlb5WU0l6lIkagRWswoCr5WlRdP6LGs6t3M
         L8Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVqNhOHt3tniukBDsEsin6BrWmrwP/Xk2/KGkACb/C3XgkPV3ojC6QH0wXFlbJS1e5oSMouByn82sAM1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WfVaGJNkQl7dUOOoxwhaInHoICJw4/b6NHdZoy/TxJkxmraY
	zv61B9Xi3TTdp3k/M2ABk5vaVWu7v8YGr7RL3PQLm/jsUlIHWsYByU7lwUdmgqQ=
X-Gm-Gg: ASbGncvKvmRUyLfXzWmSMd9n7U22AtfhDKiH8g2wi+5fFAHoQ2dM+NKQ4tGDbenwJ+n
	OvHhuW4rU2a8UHfmarNjnTqYp+Y19EPIXoLykWtmh20pufc6VsRfKIvzerrvsLJpfFwRiaOFbZI
	rvid2YmGnArLDMILWiZDPyLGVNgCxkfSd0a5iOttpglZq4P/vp3gxqIxUQie52o2ypEMCK2Rd9U
	6pwJ78R4DvT1vhD7P0mZlWdZr35rMOQDSC7mrLfLpxZBwIpa6L2SoI9DvzpK+T+I0x24jQNogtG
	tQt3HSHmeb+i4JReeSeAZ42HPFIb7svvCKG6wdfCeOtTdP/hopBoESl67xC1g+AClpIN9FdVeS/
	TTA7kYPvFgQ==
X-Google-Smtp-Source: AGHT+IG2v9hD+qLxQZ7dB2qhp9psuK3BMaWVUIJWRBgogDgcd+kbFyDF5hYm0wlh8L7Kn30Jqwwm2Q==
X-Received: by 2002:a05:600c:1d85:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43d50a218bcmr7262695e9.19.1742506988494;
        Thu, 20 Mar 2025 14:43:08 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4453227dsm61164645e9.40.2025.03.20.14.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 14:43:08 -0700 (PDT)
Message-ID: <fa4a62c8-8373-4dd7-ad4c-e8668d142e67@linaro.org>
Date: Thu, 20 Mar 2025 21:43:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 sumit.garg@oss.qualcomm.com
References: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
 <uD9su4uJAo1PBanhrBSliY8k1KZvid_UHJJu8OYLgugkOMHBgQaYSpv93UpTrJoAzgsUMH-HomFg78fes-aqQA==@protonmail.internalid>
 <20250320-dtbinding-v2-1-8d8eaa4e76cc@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250320-dtbinding-v2-1-8d8eaa4e76cc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2025 02:54, Vikash Garodia wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> SA8775p platform. SA8775p and SM8550 are irisv3 with same core and
> bindings, hence SA8775p is made fallback to SM8550.
> QCS8300 is a downscaled version of irisv3 and have different hardware
> capabilities. SM8650 is an irisv3 with different (higher) number of
> reset lines compared to SM8550. QCS8300 is yet to come in future
> posting, while SM8650 is posted as
> https://lore.kernel.org/all/20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org/
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index e424ea84c211f473a799481fd5463a16580187ed..6a89e9e3808758cfdbf6a51dfb9fc6559864253a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -19,7 +19,12 @@ allOf:
> 
>   properties:
>     compatible:
> -    const: qcom,sm8550-iris
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,sa8775p-iris
> +          - const: qcom,sm8550-iris
> +      - const: qcom,sm8550-iris
> 
>     power-domains:
>       maxItems: 4
> 
> --
> 2.34.1
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

