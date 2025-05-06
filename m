Return-Path: <linux-media+bounces-31827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1182AABDB9
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E9D520577
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18219262FE4;
	Tue,  6 May 2025 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWg5RX3+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C159C18C034
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521380; cv=none; b=p2SrLKITwWzc/f+xnxNYSHEMW4V8qwnQ1dwQnEW7lysBMUgrW2ISgNRz+Fopq9GG7NCIh/KdUJ0EHAVUzoQ6+tSvYMgKwqpMWX/BjE0dkFN+jityV6dN7fuE0XlSlJfR+N+swTfhG8btyQe/Aod9hVfMmvIzohh/7rJZPbHNUFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521380; c=relaxed/simple;
	bh=lapmL4XXkzLQwfKJEVQM/oIUTraZNom4wMSXP3hH9uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kp9xPHwFwYv/idvZ9jacZoFjovrYlFepZ1R1tuyLAZksaTRcIQQ/CQ3/anP6PUYbOmG1ZCoOKeIpDB5OzJnV9YyU1i8KKsE+iRKYudgykeSthA1Mop/FBoJRd9j/CK4F/UMBtX1f/3Ayhe1qn8/vJVwDt8r5oz2CJHq/lG+HOPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWg5RX3+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so3460052f8f.3
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746521376; x=1747126176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzGxTtDXLvBAN5ePbGP8uftxdGujZZRHKT0sgRE5gW0=;
        b=UWg5RX3+/ofjzPe82pF+tInZ9rE7olINfnxUmIlR5V/6RsWFFy/xKYyscCBcrvIxY/
         vClYJhrQLXELlU9c5I4zgDT14zUQA/TO4ucA1UQfM/H27BRdf1dE3K1+DVc0EbDN6dHg
         whgDNRTufVGn2eAEwUkD5H6L+S95MdzJuNi4DYP+5Y9PHZJshdadoQSkkT8acc415KQh
         A4qdc6mXlj4zodltO8fDMRUb9aBS9NuYpiy/tqw+pFOjRgJtNIz9585jErPpOnp6ct/o
         +nSuaAIA3YHYjP4uyl5qG5V+0aHua40RuptfTgU++ju0DrhZ4r53Niloa+ZaU70dY1+l
         qGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521376; x=1747126176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzGxTtDXLvBAN5ePbGP8uftxdGujZZRHKT0sgRE5gW0=;
        b=rtaISlbKqGRl7+E9oxnxcfz3NodcjxH8Icjc6HQZqqm5FsSUpfx1SWbogmQVnA7gxa
         Gmgkv4X94sBBaMOdVZNl4mL8KiYZ8uCwyrd6TNAf4F/H4IyhEE9wo7b3lCWAITkuglWD
         NCzE8d5sQ+j+Cpfllcp1jotwm+CRi4wmJbXYR4elOhVNAPjOKRveOeF0V62Pv8FBXdKd
         lhNcN1MKWGDgWpvYGLZSweGozROsXFsvc9AsFSiX4zJaEG2NCWSPtdDxu65h+pxVbJEX
         NZQTJP5TmJ5Q2P8vrHQFmcjnz3tHwLppSRdvjmpSvymHvZUAakPdVYf75NtTtJhXzrf5
         yz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQPOlRsc/hShOuVT8BIT8vCL2kjGmd3ijxaaLDIETFs4F36Y/vGjcXcX/CMcaM0mN6bMTshbHWwVb2jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrHro6RY49p9pvA1Y6TAy3xftyBtwU11jVSLqopetSPUI1dSxp
	nt6ueUcqCH+/E1PI5kcv9RGh0jHRNpmN4kulU+vslQ0fmbV1971mZbWVIyE0Hd8yAJFOoveubZs
	bAAo=
X-Gm-Gg: ASbGnctErVW3nZWWrefw9FW9wQI2gtNXLumA0YwdYB18DOl+Z1p/4gu+7SgsqZM9Qy5
	zjds6sDaSsdU8AAFJGDBiXASvCeinOJ6YQovY2NWFSieR4+x3RyDxt9rjecFRf4+YxMEMbmHIrz
	3iFQwOt09Uvpxf6ud5eB7NgvbXzgcGJo3wY8FOEEvmOvIE0pmRIcwpOJQHHNnjvYeRN+4mxdixH
	EaJcRIwz7CaVCsAmeuujCOrjIEm8qyiXyKmmNyMoq026XAk3KS/qjbub1+Wa+vmrMk0r2et5Y5i
	VZQF3Ic+IFAz3DqwQ3PstLkPgcGJo33gaSQ4wOnwPQdsPfsl5C3T4gx2x2Soo3AnuYhGwpwTAuQ
	5sjDvqA==
X-Google-Smtp-Source: AGHT+IHarR+7EjkTMAiam6eveCDdf5OEEIkCQCGW6Awa5AYCZ7FsFMiuBPIymOFLGLSvzGdXLPnzMQ==
X-Received: by 2002:a05:6000:40c9:b0:3a0:8ac0:bbbb with SMTP id ffacd0b85a97d-3a0ac1ff350mr1718113f8f.46.1746521376087;
        Tue, 06 May 2025 01:49:36 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0d15sm13183115f8f.13.2025.05.06.01.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 01:49:35 -0700 (PDT)
Message-ID: <3bd7e192-a8cc-4f64-b11e-d07499ba4696@linaro.org>
Date: Tue, 6 May 2025 09:49:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: media: qcom,x1e80100-camss: Remove
 clock-lanes port property
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
 <20250502204142.2064496-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502204142.2064496-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2025 21:41, Vladimir Zapolskiy wrote:
> Since clock lanes under CSIPHY are hard-wired and non-selectable,
> it makes sense to remove this port property.
> 
> The change follows the same logic as found in commit 336136e197e2
> ("media: dt-bindings: media: camss: Remove clock-lane property").
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2e7455bd75ec..c101e42f22ac 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -146,9 +146,6 @@ properties:
>               unevaluatedProperties: false
>   
>               properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                 data-lanes:
>                   minItems: 1
>                   maxItems: 4
> @@ -159,7 +156,6 @@ properties:
>                     - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>   
>               required:
> -              - clock-lanes
>                 - data-lanes
>   
>   required:
> @@ -362,7 +358,6 @@ examples:
>                   port@0 {
>                       reg = <0>;
>                       csiphy_ep0: endpoint {
> -                        clock-lanes = <7>;
>                           data-lanes = <0 1>;
>                           remote-endpoint = <&sensor_ep>;
>                       };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

