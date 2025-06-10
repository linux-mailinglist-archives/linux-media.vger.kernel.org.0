Return-Path: <linux-media+bounces-34418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C549AD34B1
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1061B163047
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B04628030F;
	Tue, 10 Jun 2025 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fg6WGMlc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E12428DEFD
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554092; cv=none; b=IkDHL0F+Nfn8RQRSobpdO4aa1v/MXISPILyy+EJMlxnYz7RUQvNlmMRs62+O1RDvCGwI1+IPTfpvCWwd1Kz8gr94hYG1hkqYRe1VlRdlKsfObUpdBiCONmLiT7jNksKyL/hsHoOhROKEvblt7BpLNLAWVekHyjzUBWocJYIIVbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554092; c=relaxed/simple;
	bh=qerf7R7x3MmKFRml/liVP9QCkPFqOO3yGP2nvsx19hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjiGVBvkxJhNyb+pW5IVA1kbHJqcDhmpSu9t9hHymxTe2bjgsBDI8hzxyVnOohbnVoL8wwEw4PkYChl+98ZcYrugBgHuVsVfP0w588XUnUFt5mNEeVOPagvDM9NqxywdHKSIR07SkO106d59u5mJuw3aSqYEakGrQlt+Ib3DNU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fg6WGMlc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so32090175e9.2
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749554089; x=1750158889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u9YfwqU8RsJJfZWtSE6GdaClk0k0kVRiBuWkos8aGMg=;
        b=fg6WGMlcM0m+5c6G1Kv6zmSR+TpdcR4Ym1giOsALt1H6IwKzouI+nbkCF6xccqPj0r
         KrC/tUMlA7cR+neOg7no3ByFhdEBI2NVwesFaov10Lqf+W6hDT0v95RqlrdfXbD2KijQ
         DSaiUU3jr3/5aJ6C/rDVCrCVWFwnQy5n3JKnsaQo57BvGM4L323efnOvmG6jB0M9LtR9
         FDYNTNYAyNzvx/Trfz1XkdSeitonMXwfsgqHm2FxoG3A4FdQ7YbUiQ5nqFmmK9eZlvp8
         k4QEUHG1MY+aiezb/WxIsfewLUSIPTMtORrskbBioNzlrR1bD0VCxDeWHxhrYXJfm/g3
         NhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554089; x=1750158889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9YfwqU8RsJJfZWtSE6GdaClk0k0kVRiBuWkos8aGMg=;
        b=PJKgP6E1bdJGFkdUufiuvCcLO5QeDBGqDThyKecXHAaTc09oOL6TURCT/C0AQ4nf1q
         JUdDvt0ryfB9qTGOnakgvCibetP7ak+tooU3zAdmoo+EPwLZV0o8o8n9uxuu1eQzKUu2
         ss2S1SPRipfJ3KsLK6gwV/nkv3VucsOURlngQWbxGM6E/vATykizjm7ciDEk6USqYny1
         hhc+ea2lwcxBigbQCdABd4sfJ4jDk5JzgsF9FWypP5fyx50sKtjiysy9sC84uzJVkueZ
         6CVG1lKV5p1NYb5msrsbiFoY5vchJSECWcs1VBWJBdTDWlSOz/KwL/JAINR19ZzXTC20
         GDZg==
X-Forwarded-Encrypted: i=1; AJvYcCVgviBuDygWfhS9PqX9Hf6wZyLjq+LdaKXvrwFbZ6RFpB65/q/gZLImN2PBjeUK6gjHNWN4tw/Y/C0ISw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK49/A7FZaPR02LJulZ89SwS8+X8qo6kiEa5gOJTQwiD2a4kIj
	xMJmA+jjzfdQgBRu55TyHjNsx80Cvd+wTeHS2s0Bf7rU4JOs173aoOB2XcE0UgsmiLg=
X-Gm-Gg: ASbGncucK/T7e5dTmIRmvNxzP+QcBLY0XMZ8/2JurfKw1+wuC5COYlsCjeXIT2TPd5/
	Z6oFWTcZZpPUdmUhFc/m+aHxtjTjD/qyvv5NIvedwratfq66F14ih6KTgZm97KqABMaNapFci1I
	q+/NRmZTiOktE1/D86oWeoyWrSoNGJb+e1fXmjhuuLlFv9gRsV7PAIV+bexVIGNpW37rAh0XyiW
	TxbqPQ/LoG9nwsjdqn7CIojUbGBagv85jtXrkDGFQBufmvKegnhnP9yfhQ5fa9w6yU51zrBMqOA
	vUDbinbHtgw3SNkY355oECw2OAmX3gpCk8YIDZmhty3c2j66Eq6HYlEAaiHpCwJZ3XdeBWv3Q0R
	Kgukqe+tUGxmEz3Trh+TtjmoU0ko=
X-Google-Smtp-Source: AGHT+IG64JuaWmpv5wfb7cvgoK83Q0NILojodK9xatw1h8mZUrS3UNG5bUBkgBBPrquvsC5B84JHZA==
X-Received: by 2002:a05:600c:1f94:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-4531dde6b67mr22418225e9.6.1749554088664;
        Tue, 10 Jun 2025 04:14:48 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45311490f44sm61809845e9.30.2025.06.10.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 04:14:48 -0700 (PDT)
Message-ID: <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
Date: Tue, 10 Jun 2025 12:14:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 09:33, Vladimir Zapolskiy wrote:
> Sort the entries of interconnect and interconnect-names lists in
> alphabetical order.
> 
> Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/
> 
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index c101e42f22ac..7d4e6ef57bf8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -100,8 +100,8 @@ properties:
>       items:
>         - const: ahb
>         - const: hf_mnoc
> -      - const: sf_mnoc
>         - const: sf_icp_mnoc
> +      - const: sf_mnoc
>   
>     iommus:
>       maxItems: 8
> @@ -321,15 +321,15 @@ examples:
>                                &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>                               <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
>                                &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> -                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> -                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>                               <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>                                &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>   
>               interconnect-names = "ahb",
>                                    "hf_mnoc",
> -                                 "sf_mnoc",
> -                                 "sf_icp_mnoc";
> +                                 "sf_icp_mnoc",
> +                                 "sf_mnoc";
>   
>               iommus = <&apps_smmu 0x800 0x60>,
>                        <&apps_smmu 0x860 0x60>,

How is this a Fixes: ?

---
bod

