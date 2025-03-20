Return-Path: <linux-media+bounces-28541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 297E6A6AFDF
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 22:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 445E71896BD4
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 21:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B97C1EB9E3;
	Thu, 20 Mar 2025 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGT31qBd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148F81EC01E
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 21:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742506461; cv=none; b=jPS+R0hcUkDrB/K5SiRdflZqlWN1YK5QxLwGCwJO+cyiwmKQMHehvYb6uhFPjQMYe5NhlmmcN7CBby0HgUQiwyK/t7qGzKwY5HDW6mMa+9cmqNVVnEB2q3vVPky/8E2hcrbmSPzt8Q9xVOgq/BVzpihBs+xr+yo4oXDieuOwYoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742506461; c=relaxed/simple;
	bh=mOnDqgj0BSZmK+Rt4jod6O1D9Yk05JHk1R77dSq+p8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KX3z0rq7RKRqkP4XYqp+6u8E6W3lnhU0hl8GS2PeKTCYLFQmHT1CH8m7jCD54fqxujfwTdGSrrX1smOkJ30nHGtun3n2r1Uqm0yqif69o6Pqfopt4wy8bueE2toUFwA3x0kQvOBh7HLqgPiwLFRRQpoN1tfIvJ89zyi/HH6GpX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cGT31qBd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so6584645e9.1
        for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 14:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742506458; x=1743111258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HOP7UU/BixFyu9/NC0nZ1KUzXLkUEuMKRRqPCxM5rYI=;
        b=cGT31qBdK2VlXckzYhgSbUwqq6j4Q4utLzzwfhz+8PtriJH2ViChHswg+UFsVF5Yjr
         SHLrFkjei4URpXCT9LcD9zXov2fLgLONAHLBioclh0axjjSz8F03V6Ju/uKCShFO4qjC
         E0/euujhohMkqsFbK5kREZMTc1WYIrIO7HfueeNTguSceBAIYTbp8MYKp9N72HeUFC/h
         TAUr2huD1MTE/ylGFPlvhoYgCRTmEys9xOaz+2t3hf44mhzpL2zPKhFM0NteW1l1edGI
         14rNwfX5b0T4rCEx7jyI9noi1nm7nkdEclZQWakxsdl2y9cGWjAKvqUMZPSECg5dT+/K
         hQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742506458; x=1743111258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HOP7UU/BixFyu9/NC0nZ1KUzXLkUEuMKRRqPCxM5rYI=;
        b=WfoAncBTXku/6cx9XmJYuBKZXShKDfar/UtS6chfKnyqPC52GAH+ZEXQmfbboh67h+
         1TXEycOTrZVvHLSyRnfSXxT6pTYnR1DkRavptNMl9UwIEG8GseZAhlaRiOzMwMXCUklq
         BmHfU479EfUVnnM3hg1/woaF7VuI1aX8pU11FXVSthe0e36of3P0bc0OmHdNMGjkTUr4
         Qo8ijRYAQKbXv1QQGiQlYj+kc829mwhW14aj/4HCgEi/2E07BF7P5xiQwjWabQeR95Lb
         XA6kLh4d+TLAwlK1colciHji5CeXrfVq8uui5+D8hFJYRjzKYWcLbhoyxBPH2TFY/wTm
         kPpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdZDourV1U+HL83X2kQaRciM6rlPnosygDXgI3RXURgjMeGiEJM9GIoh/sdC6WMCq+EnHaD0WCjZ77PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmA7GS0EAW36NfTxZfvgh6LGLchmSG/rmTgSyYo/DV2T6WLHlG
	RqI219Gv2rfeYRaujoI8Rpj2coeYbsJGnRG83sz0CSVgsYIIUaFyVn7eam9lddc=
X-Gm-Gg: ASbGnctCwwkfv2gh2JMaodI5NIiQbTFOD7FQgYaO5xMjSv4ljDmiAvQ7BFCCkSp/wIU
	sadKhg8FPLUD4H9renRJn/gUgFbq1DuUe3g6OjesVEJMjfU2gYmZJ/4jmnOGjzl/cP/WYEryuqP
	/eorcJR5nlw4jBKn4TasL0t8QA85J0RS06qeebiPCWaoNJ90HNdaCfdZj/MMAznAocwLZkR/gfx
	NngB1YCeLUy7zZsOu8au1eszY2M6kyEVifEAqDrTtf9SmVdeO0Z+lZc01dvKd0vZv/+OHcfzQOD
	pbv6o8rUOkM+yf93+80eCeocQaKUkua9C6QABzUeI8SWQbZ0DciZWNvVQGWYpu7CqHKDcSAnU4w
	Sy8fYpfCseg==
X-Google-Smtp-Source: AGHT+IHQR7pkacXemvapFQy9AD+rGlE3cMkaNllM4VM3ccQmOQ8FA68ceqVMTtWLDwQnmI2/UxzSmg==
X-Received: by 2002:a05:600c:3c9b:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43d50a31ffamr5334675e9.20.1742506458138;
        Thu, 20 Mar 2025 14:34:18 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995766sm625994f8f.1.2025.03.20.14.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 14:34:17 -0700 (PDT)
Message-ID: <49512bee-906c-4587-853a-b36da7a4407d@linaro.org>
Date: Thu, 20 Mar 2025 21:34:16 +0000
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

