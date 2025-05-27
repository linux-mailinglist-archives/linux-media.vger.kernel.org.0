Return-Path: <linux-media+bounces-33454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C5AC4E90
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85832189C043
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 12:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E4F1DEFDA;
	Tue, 27 May 2025 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dyP5NI3y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B021E520F
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 12:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748348268; cv=none; b=Hf6fYa8N41s7DKtDnv9Tmz3OG43QnFpajuF01wZKutHHARJRuPuSeIg2HDyIeZ7MhsU7D+YLOg3mNf8BlKHTJNP3SJKwOLv6dI2A/20nROeq7si8kt0bsYassnkWd1Hq9hmG7UCKjGjjQ4+pJRQIYmX7er5UWlKXCYJl6MCRLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748348268; c=relaxed/simple;
	bh=Ylm9TZJ9JkndLpjMw52ERgTwWR226WeENwt4n1DE02o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=P0BlmNgco6DTpA59N8DrHzTB9X4DVsucDbLtdk3PVmrBJJdHJYuJPBZZGU32XoC57bzJoc0wZFlPL+VSZM1kpFfxrmV6VTtgTEK12kA6zbr5THZhg1UpLRqqhrSEnpBYtQyRQyKE6WBcFAndYXjuomUbgAemSzkhDUaJELanIVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dyP5NI3y; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55328ae0473so95344e87.3
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748348264; x=1748953064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UU3gcdYYcPnZcFhSfcjGqd1s2zKjYa70cKw5uOmkCvo=;
        b=dyP5NI3y3fcEvJaivVYiK6RFXsv0TC+rfMOGtJfiilGPObqL5j42PLrze7re5kj78I
         SQP+lLqeYbq0xEPSgp3SHa4QTcvPblopDpR7b9L7eAZSHqy11uwKIdDHl1xwrtKZMPeK
         5LdoUatKDT5lJKqaVQBoTve9wi+GwF6lkr9kiHaG1mc1+mq4hYPonyGDiV2aL+PTiSid
         D9NnETvUgqWylTdW/T6SuEo29ixyRYqrrLr4g4vCwvH9dHcb8FaKAP/CIT2HOUQpVTPR
         4G6F2YSJ/ZhIpRA9EW6Q+b+Qq95pcZFX3vtItYtZIIiE+QK3Q2+IgN9zhxmrs0FxmYWJ
         lr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748348264; x=1748953064;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UU3gcdYYcPnZcFhSfcjGqd1s2zKjYa70cKw5uOmkCvo=;
        b=cQUVEFwds6LfTXhztB5+Jv/9toS/VNUp4xlrYfDlvkh0gcMaL1p/aLBJpT3AbKIBhC
         pbnDParVQd4zE0cZq5s8dnprpAJYXRi/pwobNgZVwI/r0dOtu8tBg7BU9co7cDDMsivH
         ZGbQ5aYzuct6TnFcHLJzaNPfRwyj9d73NgYVYkFKrBwpPAyFYC9JtStx3vt/Hrd7WcBy
         XA8RcqUvRYWoy1SIBUfs9rVMSa0ofGcmd1k/vGExjxJYLf2zh0j2Rx2q0N2PqIUghqbN
         MACKPmo+5kEBI+1GWWXaLf4W/1qBzJ3uHk0p9c0y6yLoW79iC7DeXqLef9ZUt8SbHgJv
         PEhg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2vIcpGS0NbWnc+nZIcZcz9/m75UFLy8XVv0OWlY8rQqX8DVI6HNENNhP9TAFIsh9cWOLrZCVFHfnvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL3OhzkGASig1OIjL2k2vnjDrdLuTg6mPqPcck6Nv4yTcDpQ4A
	y5CibR021JmbAmrI5W+8nPvijhQmlTJt+6IDtOxtjRDPZEsLC254/4j67vYp7dV5fos=
X-Gm-Gg: ASbGncukRbjAOaibnYRBPx4kBkkW5MoTzGwQRWzUqXV+22/POxqA4G6uNTIrTMS4Gmg
	2T6MwqWc7Tufd5s/YVzF/r79ZXFCbkkhGhYGAjlROgNSP4ztrXNUrb0htu3GFBlVRBSY6mEBU8V
	kq8CNiBTNIWW3divsse0G+9GLy3AN+tRsK3FXlIn8hTINJE6TV5uzkoNfCvqBc8BAJ3Hw55Z789
	aRsFHIVWl9DtZgzFIN9qBXGlRdiE4EpQ44Z1C8rF7g3ZPU/Q0xKiG8KdS/03PnQ691B5wZE8zxP
	lif6AI4Rb+5BGIa/CNmhyuaW1bx0ZarW+aVlzl1m25p36UDv/eAcBi6DZhgHOfhUT84=
X-Google-Smtp-Source: AGHT+IF0yMInE3RYqpl2vNeTub6vt1aTbzbYIVRNV0IdfEePqEXTaxqSLxxOXpwZobi0Wf7bZQrPQQ==
X-Received: by 2002:a05:6512:2c8c:b0:552:2081:bdc0 with SMTP id 2adb3069b0e04-5522081bf9cmr1050281e87.6.1748348263804;
        Tue, 27 May 2025 05:17:43 -0700 (PDT)
Received: from [192.168.1.106] ([91.247.148.4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532662f751sm461418e87.54.2025.05.27.05.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:17:43 -0700 (PDT)
Message-ID: <538a65e9-85ac-4ae7-a567-97343122c547@linaro.org>
Date: Tue, 27 May 2025 15:17:35 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,x1e80100-camss: Tighten the
 property regex pattern
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
 <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 5/2/25 23:41, Vladimir Zapolskiy wrote:
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

I kindly ask to review this trivial change.

--
Best wishes,
Vladimir

