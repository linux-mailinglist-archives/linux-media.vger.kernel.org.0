Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C891E7B2AD5
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 06:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjI2EAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 00:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjI2EAK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 00:00:10 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75AB2AC
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 21:00:07 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40572aeb673so109448945e9.0
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 21:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695960006; x=1696564806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4ozOJcdMu73UonWYu3Guqxdh+FY56w8y7+K9Ry3OHs=;
        b=xSJ9ofWLHi3BB8gvbyDk8UwaZNpItes5zrHxhccxlVuooqVMmbPLKSZL7PSSQer3/k
         yyWirqwd2TITsZ3ED+dRCyZxoSikSoCHy6hSiYzOzJzbp/M0+1tiOvI2kkAAFxzw6Kr0
         hCrtegHv/CYrPv2AwuPWErbGQaaNYHdudM4blE+MrK+bpWwu1S7VlNE2qiLwXPMqSutA
         /2FJMdCrwqGCeZcsofhRozmma0oj4NGkrs67CTP4U7iVCMCwvN/Teuwu8Ukg+AABisb6
         9hzBQ2QYolVP135/fEmBsz2K5eCHIeHAPyqt6l0Ch7bPX+jioeiulaFoyosrhojV4a9N
         Hdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695960006; x=1696564806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x4ozOJcdMu73UonWYu3Guqxdh+FY56w8y7+K9Ry3OHs=;
        b=NSpXWDMCgbC4ncjScbfmoy3maqm80WZgLjOQ5JPq5KDbQ8D5Q3N5yoNfwFE6ZRZIn4
         kVnhUq3G8vWPYZ3A2LocjNu7xGHeHKK+NyPYq2wLE4OZj/2mVTM9wEPSlHcfre75BSIP
         YNwYMD9W0o2u5qu3Tkm9vUbSuvIov3lOuPVjaEKF9bLDFRrLBpBN/FoFPnP4h5gkxs73
         /pejWKnAWQoWV3nuEMQ8vp8d+/TB3xeQpSOO6+PG9g0//xQHsYR/EQB0X2g1hsOQOxfx
         qI1PRCy2IWvrLuKXZxQ9Gr4saPeyBNOlOyJGFCx7fk/Xr+M5MECY+70oBOLKACRMK3du
         A/sQ==
X-Gm-Message-State: AOJu0YwyPbt4Y+MM2ibwI9D5IObdbFm0yFkZLZGxpxY3i9V06OuEb/wF
        nxRn5Was9RUP+xZM3GVvox61IA==
X-Google-Smtp-Source: AGHT+IHQ6iymJeshnzKwqTkv5k2s0q41LhTpOenBVGc42AXtYrqcr6dfpaeF3Rspa42aAvKDtkuKYg==
X-Received: by 2002:a7b:c397:0:b0:3fe:3004:1ffd with SMTP id s23-20020a7bc397000000b003fe30041ffdmr2677107wmj.4.1695960005734;
        Thu, 28 Sep 2023 21:00:05 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id n24-20020a1c7218000000b003fefb94ccc9sm532425wmc.11.2023.09.28.21.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 21:00:05 -0700 (PDT)
Message-ID: <5a8422d7-99a0-7c3b-d0ee-ec3f800ceb6b@linaro.org>
Date:   Fri, 29 Sep 2023 06:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64: dts: amlogic: Fix IR Controller register area for
 Meson-GX/AXG/G12 series SoCs
Content-Language: en-GB
To:     zelong dong <zelong.dong@amlogic.com>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230922080546.26442-1-zelong.dong@amlogic.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230922080546.26442-1-zelong.dong@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le 22/09/2023 à 10:05, zelong dong a écrit :
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Amloic Meson-6 SoC only has one IR Controller, since then, there are 2 IR
> Controllers in every SoCs, one is Legacy IR Controller (same as Meson-6's one),
> the new one is Multi-Format IR Controller (abbreviated "MF-IR",
> which supports more than one IR Protocol). MF-IR was updated several times,
> so different SoCs could be got different register sizes.
> 
> There are all IR Controller register areas from upstream's SoCs:
>                                Legacy IR             MF-IR
> Meson-6                  | <0xc8100480 0x20> |       NULL        |
> Meson-8/8B/8M2           | <0xc8100480 0x20> | <0xc8100580 0x30> |
> Meson-GXBB               | <0xc8100480 0x20> | <0xc8100580 0x44> |
> Meson-GXM/GXL  	         | <0xc8100480 0x20> | <0xc8100580 0x54> |
> Meson-AXG/G12A/G12B/SM1  | <0xff808000 0x20> | <0xff808040 0x58> |
> 
> About Meson-IR driver, MF-IR was supported from Meson-8, which was distinguished
> by compatible string (of_device_is_compatible(node, "amlogic,meson6-ir")),
> and only one register (macro 'IR_DEC_REG2') was added because controller worked
> in raw decoder mode, later registers are unused, so we recommend that register
> size should be 0x24 if MF-IR is in use.
> 
> There are 2 ways to fix.
> 
> MF-IR is in use:
>    Meson-8/8B/8M2/GXBB/GXM/GXL: <0xc8100580 0x24>
>    Meson-AXG/G12A/G12B/SM1:     <0xff808040 0x24>
> 
> Legacy IR is in use:
>    Meson-8/8B/8M2/GXBB/GXM/GXL: <0xc8100480 0x20>
>    Meson-AXG/G12A/G12B/SM1:     <0xff808000 0x20>

This is slighly confusing, so you mean since Meson-8 there's 2 IR controllers
which have the same register mapping, and both works with the "amlogic,meson6-ir" compatible ?

So why should we switch to the MF-IR address ? what does it exactly change ?

If we want to be clean:
- both should be added, legacy IR with current address + reg size change
- a new compatible should be added for the MF IR, with "amlogic,meson6-ir" as fallback to take in account they are compatible
- a new node should be added for the MR IR
- DTs should be switch to the MF IR label instead of the legacy IR

With this we would be able to take advantage of the MR IF functionalities while keeping driver functionnal
with old DTs and new DTs with old kernels.

Thanks,
Neil

> 
> Fixes: 2bfe8412c5388a ("arm64: dts: meson-g12a: Add IR nodes")
> Fixes: 7bd46a79aad549 ("ARM64: dts: meson-axg: enable IR controller")
> Fixes: c58d77855f0069 ("ARM64: dts: meson-gxbb: Add Infrared Remote Controller decoder")
> Link: https://lore.kernel.org/all/20160820095424.636-5-martin.blumenstingl@googlemail.com/
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 4 ++--
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 768d0ed78dbe..dd8c58e74322 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1705,9 +1705,9 @@ pwm_AO_ab: pwm@7000 {
>   				status = "disabled";
>   			};
>   
> -			ir: ir@8000 {
> +			ir: ir@8040 {
>   				compatible = "amlogic,meson-gxbb-ir";
> -				reg = <0x0 0x8000 0x0 0x20>;
> +				reg = <0x0 0x8040 0x0 0x24>;
>   				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
>   				status = "disabled";
>   			};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index ff68b911b729..e12cea5fa889 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2084,9 +2084,9 @@ pwm_AO_ab: pwm@7000 {
>   				status = "disabled";
>   			};
>   
> -			ir: ir@8000 {
> +			ir: ir@8040 {
>   				compatible = "amlogic,meson-gxbb-ir";
> -				reg = <0x0 0x8000 0x0 0x20>;
> +				reg = <0x0 0x8040 0x0 0x24>;
>   				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
>   				status = "disabled";
>   			};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 2673f0dbafe7..0c04e34a0923 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -506,7 +506,7 @@ pwm_AO_ab: pwm@550 {
>   
>   			ir: ir@580 {
>   				compatible = "amlogic,meson-gx-ir", "amlogic,meson-gxbb-ir";
> -				reg = <0x0 0x00580 0x0 0x40>;
> +				reg = <0x0 0x00580 0x0 0x24>;
>   				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
>   				status = "disabled";
>   			};

