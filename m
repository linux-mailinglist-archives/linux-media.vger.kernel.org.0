Return-Path: <linux-media+bounces-529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD157EFCA1
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 01:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9F41C20B47
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 00:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC171A48;
	Sat, 18 Nov 2023 00:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uhz7XqG8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD6110C6
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 16:38:14 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo3709498a12.3
        for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 16:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700267893; x=1700872693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQf4cNwr3OWtrAW3jv3pETjipAWA+/tCzrUVBB66YE0=;
        b=Uhz7XqG8nCENjUeYkuNZcnflmxj6nPvIZ46i+NGtS11BrQ+FgB7iwQfFMfx5YaSamV
         shGOmmzpm3VR1oP9tBdaX8hzgxO055NyVwR7C2fWQHPa+NEWORcXkjJ+aClCfN0IMZ74
         cgaikX55OoyjPrTTYZprQJXTYnuK3jfjMXISLz1U1zNeBHsh/QS8bYXUHEjGR7U4VFkR
         BkkZozGEySFaV0IpRcnFonG6OTIpxzLz9jQcKvsDw5QtfzKm25o/ETjWTUxycVo6g1RD
         V/7ROj8RZkXUDRnST2oo8ve0WOpXgkKxCQwEcAWWmYP6f1EII4wUFJ8EnXG5dfB8+4KR
         d76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700267893; x=1700872693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQf4cNwr3OWtrAW3jv3pETjipAWA+/tCzrUVBB66YE0=;
        b=W2joKF01PvIKDkzL1PzVnzsIHktytEh8k/t5idQXh0ag78XtN1JJ1oOMcZABjVUrGt
         UzAeMrbdd/d0fJb+osYJe8DsMMA7geEDLkZyWH/MyDdZOuNphCgvkgMg0WbUS2x5p9KB
         vOZcwBs903nQaq/IqXCfOo1X4N/32QDmQblDOTBBFiay4TjgyIFNDVwz+xDRNGzsJ/Xs
         hsVPQvDioMFVMaUv0ll52o2ClEsosjXkiSzxVqhuVLshIBGKMH3P1FWguUZX65hOqm0n
         oWHMC6YaWItnmSlGZYOwXfvhesG+Smzte3E9YWodo2K9Y0j/7+TY/ul+VNSnO9LUNOwg
         qK4w==
X-Gm-Message-State: AOJu0YwuCaVOutN/J/3ebji+l+UZRIT1f1ydbSbLFnFeuOANLwDw3hSb
	isDGSV4ciaDQtdCMlXo6JZBF2w==
X-Google-Smtp-Source: AGHT+IHlKI9TtCAOc+iD/j9jxd8FBUb9QMgtygbvqzpfVmgmsMChJl3e8bAc5wvGi372DfO/i23YMA==
X-Received: by 2002:a17:906:11d0:b0:9dd:8b5b:7873 with SMTP id o16-20020a17090611d000b009dd8b5b7873mr540383eja.52.1700267892924;
        Fri, 17 Nov 2023 16:38:12 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id m8-20020a170906234800b009bf94de8971sm1326178eja.70.2023.11.17.16.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 16:38:12 -0800 (PST)
Message-ID: <9752f4ab-5e08-4d1b-9ed4-6aa280c87a36@linaro.org>
Date: Sat, 18 Nov 2023 01:38:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] media: qcom: camss: Add support for named
 power-domains
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231103-b4-camss-named-power-domains-v4-0-33a905359dbc@linaro.org>
 <20231103-b4-camss-named-power-domains-v4-5-33a905359dbc@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231103-b4-camss-named-power-domains-v4-5-33a905359dbc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3.11.2023 13:29, Bryan O'Donoghue wrote:
> Right now we use fixed indexes to assign power-domains, with a
> requirement for the TOP GDSC to come last in the list.
> 
> Adding support for named power-domains means the declaration in the dtsi
> can come in any order.
> 
> After this change we continue to support the old indexing - if a SoC
> resource declaration or the in-use dtb doesn't declare power-domain names
> we fall back to the default legacy indexing.
> 
> From this point on though new SoC additions should contain named
> power-domains, eventually we will drop support for legacy indexing.
> 
> Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
rg -l "&cc.* \{" arch/arm64/boot/dts/qcom # (the bus is named cci or cciN)

arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dts
arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts

the FP4 only has bus enablements (i.e. no attached sensors)
the number of working DB845c/RB3s is probably single-digit today

410c and rb5 are probably legit users.. part of me would like to
get rid of this messy old binding ASAP.. but then are there really
non-Bryans with these boards and the camera mezzs?

Konrad

