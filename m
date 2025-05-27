Return-Path: <linux-media+bounces-33455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48170AC4EA7
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06704189C597
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 12:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAE3268FFB;
	Tue, 27 May 2025 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTjlI23q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA22A26868E
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 12:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748348773; cv=none; b=H/xo2Z5yjpZdYoUFnHxv1xT84qZjxoC+/CYl/BVQZd2uzZeMnQVK12qKKPh7onkefkaBQf4ZksnGEsow5gckEY+SvtwjBWN3+pEOqY5gu2fQ/0UdyIcyQEXDv+sK0okZI1LTIui5o9mVAR4yBBlnLbLSjQ+k3d56cbEaO5VvePE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748348773; c=relaxed/simple;
	bh=fM0vRwBMxorOIhQNnNbmUaQmnFKU/onoNSRD3Seu0ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czbyNF5B3AIUYcOcnJOpKZjljiUrhqvRxSR70kPx6IAeR/0Fp5HzszpwA8j8PpSHtgEa4/P7EyPlH4IvTSURwMotlORwXPaSzSgtJKFDLJAH4dxjoIrkuIvwAcNu3NgYz6ioZBJGnnsKmdzYRo/75S/yfCLN/8Mhwgjll3H0QSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTjlI23q; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a366843fa6so2058896f8f.1
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748348770; x=1748953570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nlX5wgZ807rg2otTHb6eiNJdskenA3vuBmoIAlMxE3c=;
        b=jTjlI23qO6hQF4tNDqEkeFY9N7grLR7rJzJlPJTyEFwquJA3eBQWzmd9jzb1f4TE8w
         3nZ+ruHS482IO8msWdnC4rlcn8uQ9sLi3O/vvL71uTgykJyX61xEU4L6poPe0FvlShgz
         JaEHSiGGYYcwKbS7hIanR1vOYCOHavcMsdo2nwhM4SOohbTRFgROzALJCdCaUhbHW3FE
         XpZ/MFBowRe8+zI1FW5Lku2tEwI0iSuzvYqZ9VuPHVdt9d80FjS6TzqRnSd9/Zne4NK8
         r5XOOboOeHdRVWJWvQfCtFn9hQktjhj2dEuNj/XvdJ/amD67RT8n83uMEvPEMH1nQA5+
         ZcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748348770; x=1748953570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlX5wgZ807rg2otTHb6eiNJdskenA3vuBmoIAlMxE3c=;
        b=Jaz5U7GleRto687zWVM0k3ol4NYkuvakPBWfq2GOGlPSegBeEcraNVlIHW/tWPjL5T
         w6gmpvl+iD/EAiZFGRf41y6xcevC5a0i1fENvkTFkxXqrHoXXtWGpEY3VIRAbJ9/+0/w
         96d7mln2ObKeJnQ6z/PloIRP0dM6/tJ2g2z8YDqWkAsuKE05I/x4Z6BOtP6Ngjr3nS9p
         GELS/lLuCbtqFlTOGtuZAA+xPIZ7GFa43F5+WOfHJzZ6R1PyV3Cjm43+KL1Uo2rNlkHD
         uM2cm1L8s5n073F9ZtgvzMnz9sWEV5bMhosLud7cmX4z8vXyFmLaYf4U+czE6Hu3Yy36
         G2vw==
X-Forwarded-Encrypted: i=1; AJvYcCWWg24Lq6xUwzeNm1QUGUvM9dzfUpLuHIYAQXytYrfU/fz2PMe5moG1dYx599bbl+pqH0tBy1Tz4mjgaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvGpX5o7E7rsE74QFVRhjEceROE4yUkdEnFnEmL3zLscTNZuuE
	dt8fi38Km5IKZZ3G9rL8mTP1/JMWenv5APJhOX1N7s+OBaAulIvlAB7S+gwe07QlMSTHzoXkjGj
	QQbe2IrI=
X-Gm-Gg: ASbGncsF+Yp79816ntX+sRA7flN8lTCFqto7NK1oy6A/AS/Ub3ikczEylRuGgZxw5Rt
	msh0N15dDGH7w39p7u8C1HY6FQ70KXsblA8fwKl7bhLXwEWOtarBCXBHBN+yPgGaqTR3LnccIo7
	iTS/Mj8oWg6YhMVkyt6x84hE1qSF0U12ngy5JS0YjuXmsfeEPwT1afpRXyNm2LGs5ZczQxQ+h63
	tiRytPg7/rd7d5UWeTqOOpUUQRforejYDT3l948imG+FtMLKnQENIQOOT9/WFWxV6qe+oU+wWAc
	s3mb6rsf5zdTMz+N03CzHy9GZh7PH+PztZuXRU4xhfuX1Zl8ktN2W1U/SOVLlkQjErkWBlP+2MP
	+s6RzoicEfR8Pz3B6
X-Google-Smtp-Source: AGHT+IGSXfGdKP76E+voScAgxzkXTjTLIJ5G7H9dlDZ79GKUItZtXNtAfGBIwcxqnJ3965Y7OhGq9w==
X-Received: by 2002:a05:6000:18aa:b0:3a4:c909:ce2b with SMTP id ffacd0b85a97d-3a4cb47e859mr11143560f8f.54.1748348770176;
        Tue, 27 May 2025 05:26:10 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d6c9faffsm6782308f8f.74.2025.05.27.05.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:26:09 -0700 (PDT)
Message-ID: <83b0b7e1-6b5f-41e8-94b1-3073c47e9840@linaro.org>
Date: Tue, 27 May 2025 13:26:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,x1e80100-camss: Tighten the
 property regex pattern
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
 <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2025 21:41, Vladimir Zapolskiy wrote:
> There are 4 CSIPHY ports on X1E80100, it'd be preferred to tinker a too
> loose the regexp, which covers all these port names.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 113565cf2a99..680f3f514132 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -133,7 +133,7 @@ properties:
>         CSI input ports.
>   
>       patternProperties:
> -      "^port@[0-3]+$":
> +      "^port@[0-3]$":
>           $ref: /schemas/graph.yaml#/$defs/port-base
>           unevaluatedProperties: false
>   
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

