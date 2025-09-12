Return-Path: <linux-media+bounces-42452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 475CBB55159
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 16:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09D703A1696
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B4C329F11;
	Fri, 12 Sep 2025 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsvX46yj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9D5324B14
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687005; cv=none; b=SP2LpbpjILuR12DVHwfUmvOwTq6gLezg7xoJrrLYEU1GU/nEYdHBLjGSYryHWaPd0smAOr2MRhk1mYyd6B9AltxhlXVL0i25JhBK3rruDLh3x24dOrzQUET4tizLiir4JW6Zs6jMnYh/oPm2hslNIC9ePSkqB/8buze/E8juQvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687005; c=relaxed/simple;
	bh=unhgIN6U+zpitqxvR0gDATDfv301/LFJXEAxIROoZKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVg8n7kQclQ8bdgYFz9z2lb4gIXcxMsTv61yLwgdipX8uiZWq+CpFznNXA5qhuDzLfyZJ0dXKrDmuhiw8YQi0ZU8VbotZxAMhuRAIcz8d5JgYVedGPRJTctsuw2pzfcKuVhRaEHhjoM7N9NR8JgAMQgiSMcmLG4mH7cp8elMz8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsvX46yj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45de287cc11so17011925e9.1
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757687001; x=1758291801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ug4rvDJVrD/KFt1LWLn8j4wXGstlIATd7OgVTytDCs=;
        b=bsvX46yjVssnuPus1LkFdNw75J27YW2pphTF9IbX6pHY2uYDIJKXxxXlKMnKpGyPke
         pgKRAMtSNku6i2Mvs9B3qr08aS3XKsEt0J0Mn4Qk1p3WNJpJm5AXVGLySwHhptKePYBF
         MFcfjXOgLegeC+ftlwnUa1/XXDSBB+aogSzK/h8ZEAeyr0eUDyXI7AoF5LjG8f8VAVTW
         4HwZN/jrZ9lHTWaJRAIk7EcugflXYFqDyuHoqSX7SYQlPCOhmqjNrjc8FW2ynNQYOtNm
         lW1sLNQXuMwmVKoKDDs6Ue8/VrDbufxyib9QimqWJIizwu/DW1DVVUlxRcX6V80jpHQy
         Ybfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687001; x=1758291801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ug4rvDJVrD/KFt1LWLn8j4wXGstlIATd7OgVTytDCs=;
        b=YINCgr376Ls13iFsWkLOgVq7zgksTk3NBX9glzYbJuIb2bxZmdY4MSKdaRZ48czL18
         oEXeYYEQs+jmfo7BRL+gUX1yx+9bFXj09wa8LElJzUXbI+Jr3dLh87rEQjBP64EwqxY4
         117Yl85t87dbzJsV0QnkoN1TU2wSWnOBw9tOn9wCJ2BlHu6E3ygpAXzAg0UT7tG8acN3
         xklxRcdMqG4t3+MyARf5bcz01jQ+g4pOhIpQdlZ74rixlV+TS0u4gVscd9SFEbXtANQJ
         IkY9hb7jtJ9ZCvNk+VoqdepJcju6o7iNPwm5mK5DNeOwUsTNQ0eNVL/AMz3nuYEQsWhZ
         rMOA==
X-Forwarded-Encrypted: i=1; AJvYcCWH1/iIaDcOfyNuvbLNZ0RHWI5/G7xiM3XtuqAkgPJqPfgPUNM0A9rbPLc0weDW+rn7gfvrpQe1dlPYdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFrtiNs04e6Kjwhkgxj/omtI1T8mqLcd8TKCT6l7TZBUag1htB
	BlDcNEmlQpVQZ8z61/57jTdKnJ4u5tNzUHRJI2Y7Yr9PA9K0qQ4SBc5c
X-Gm-Gg: ASbGncugohb9321Cg6KaoHFlzvq5C7HhA0ciHOlZrbS+S2J8HBxUGjf/exf/lgk+yVI
	LV7OpERRNGmYeY8x7xQt0EgE/rF0XwwDXbKNTdwP6pAAgUqNp5OgHLSv3ri1JR6Q1pIK+d7cB74
	5hsajWuL0tgmJ7O0HMEhT5UktFTN81WDHXRHZJCkkFLLzHvcyA24ctLGS5coqfYZ9AKhjSXEP3l
	rhj4EduKWmobLwGsRe6GULpkKBkUuOehQIK0gvatGFCnRis32DkVGjEBTMdZtCDo5MkFQxcJj7h
	OHZyJVcfjsEH56YiYcXY2OSFfI8yft8ktltLoEVEISmovZH7hBTTKMl43EtY2VSzLHeFIXjdLtM
	uGQnblw7xH25CZWw8Co8EgN6syKa++7uBYh5+2mv4qA==
X-Google-Smtp-Source: AGHT+IE5UXOItxjbn0zFICANNc5GuRpVNR7hiqiKPBU9+i1k2C8vaMc+CHm3lHcY/3oRsKpLL3Rr0Q==
X-Received: by 2002:a05:600c:468a:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-45f2126253emr34464315e9.8.1757687000920;
        Fri, 12 Sep 2025 07:23:20 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5a2esm67200825e9.13.2025.09.12.07.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:23:18 -0700 (PDT)
Message-ID: <30468c15-16bf-4c20-bef3-35d58b9a31b1@gmail.com>
Date: Fri, 12 Sep 2025 16:23:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/38] arm64: dts: mediatek: mt8395-kontron-i1200: Fix
 MT6360 regulator nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> All of the MT6360 regulator nodes were wrong and would not probe
> because the regulator names are supposed to be lower case, but
> they are upper case in this devicetree.
> 
> Change all nodes to be lower case to get working regulators.
> 
> Fixes: 94aaf79a6af5 ("arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> index 4985b65925a9..d16f545cbbb2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> @@ -352,7 +352,7 @@ regulator {
>   			LDO_VIN2-supply = <&vsys>;
>   			LDO_VIN3-supply = <&vsys>;
>   
> -			mt6360_buck1: BUCK1 {
> +			mt6360_buck1: buck1 {
>   				regulator-name = "emi_vdd2";
>   				regulator-min-microvolt = <600000>;
>   				regulator-max-microvolt = <1800000>;
> @@ -362,7 +362,7 @@ MT6360_OPMODE_LP
>   				regulator-always-on;
>   			};
>   
> -			mt6360_buck2: BUCK2 {
> +			mt6360_buck2: buck2 {
>   				regulator-name = "emi_vddq";
>   				regulator-min-microvolt = <300000>;
>   				regulator-max-microvolt = <1300000>;
> @@ -372,7 +372,7 @@ MT6360_OPMODE_LP
>   				regulator-always-on;
>   			};
>   
> -			mt6360_ldo1: LDO1 {
> +			mt6360_ldo1: ldo1 {
>   				regulator-name = "mt6360_ldo1"; /* Test point */
>   				regulator-min-microvolt = <1200000>;
>   				regulator-max-microvolt = <3600000>;
> @@ -380,7 +380,7 @@ mt6360_ldo1: LDO1 {
>   							   MT6360_OPMODE_LP>;
>   			};
>   
> -			mt6360_ldo2: LDO2 {
> +			mt6360_ldo2: ldo2 {
>   				regulator-name = "panel1_p1v8";
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;
> @@ -388,7 +388,7 @@ mt6360_ldo2: LDO2 {
>   							   MT6360_OPMODE_LP>;
>   			};
>   
> -			mt6360_ldo3: LDO3 {
> +			mt6360_ldo3: ldo3 {
>   				regulator-name = "vmc_pmu";
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <3300000>;
> @@ -396,7 +396,7 @@ mt6360_ldo3: LDO3 {
>   							   MT6360_OPMODE_LP>;
>   			};
>   
> -			mt6360_ldo5: LDO5 {
> +			mt6360_ldo5: ldo5 {
>   				regulator-name = "vmch_pmu";
>   				regulator-min-microvolt = <3300000>;
>   				regulator-max-microvolt = <3300000>;
> @@ -404,7 +404,7 @@ mt6360_ldo5: LDO5 {
>   							   MT6360_OPMODE_LP>;
>   			};
>   
> -			mt6360_ldo6: LDO6 {
> +			mt6360_ldo6: ldo6 {
>   				regulator-name = "mt6360_ldo6"; /* Test point */
>   				regulator-min-microvolt = <500000>;
>   				regulator-max-microvolt = <2100000>;
> @@ -412,7 +412,7 @@ mt6360_ldo6: LDO6 {
>   							   MT6360_OPMODE_LP>;
>   			};
>   
> -			mt6360_ldo7: LDO7 {
> +			mt6360_ldo7: ldo7 {
>   				regulator-name = "emi_vmddr_en";
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;


