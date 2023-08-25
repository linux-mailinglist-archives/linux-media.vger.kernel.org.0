Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B77677886EC
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 14:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243303AbjHYMRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Aug 2023 08:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244843AbjHYMRh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Aug 2023 08:17:37 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46E72729
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 05:17:05 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401b5516104so6994665e9.2
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 05:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692965801; x=1693570601;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7W3K6QieOMlEGkELlxavl+PcEL/5xKZFRwCQWMzW5I=;
        b=lGawyDxFUMgbdHeE2koQ5KcxJuXV/iJw3TTRgxmLIObGXulXUhEPJnx0xecUBKAJpA
         Ca2dYbsYwIp9vv86H6MagZ6wXjHjswkjzgzLDeS3SixoIgzYXyrIdc/ulKk2rf652GVp
         TIgSzL0crZ0qhhHXYUQbPPt/5xAKnOCHCtyFU/etBkFFkz5lk2BaWZe3W52Gi+oAdFx8
         06Ws3MZra2x4CxbZSUqyfhCc+b22wJ09FXGpxZUXGBmhF8qJLTDEYUwuf7z0QJDQEMHd
         cvCOVP09pbZXRK6HCJRDNaLg/miI8lvLEw0lxcRxe1HTyN1CHYDMpRaNNnVFEPCHGckQ
         vPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692965801; x=1693570601;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o7W3K6QieOMlEGkELlxavl+PcEL/5xKZFRwCQWMzW5I=;
        b=Bwn8WAni87rTbbAtGJt/Lu1ICrNLJ1yDL0HY9G3M2H/xQE3D7i1bwRw/GQLA9cE1dd
         UxPyUDYaNuAa+eIWvS+P3rafLMYL7UmtQ7ouoUGdE8Kgj38hIwC8RkP32xLluWiUgFVg
         P1n5oFvElunBznH1zu6pm1r8MU4yw0w8hsW6K6/G0RSVFJ4XOqYnTDgR9sRSXKDdT3g1
         bXrvi+BKM/8rpyASzv+2SyXv+mJWqCTMibp/xglH1NuO0//yDn0akBcB3ldiItLjuv+B
         LRuiOYqSGiweu4M82nSbJpQKDTPLAl9ydP8cW42eiSrM/vWcYs5JCnwhd8TxfJhJZ6TE
         DgNA==
X-Gm-Message-State: AOJu0YwDuLsSS+2lnxcbdnogVGkAEkQKbwDBRM3Zz6sGybQrCBq262Hc
        M4fO7wmCG5INxzwUpdXd+BCxxe3Ye5dTo/6MANk6VQ==
X-Google-Smtp-Source: AGHT+IFatSYfdQ8wgd9jKCT40sM9oeeY/ZuR3qwKdKNIQTZvKeZ8tkb1COEsYjFTJOuKxzoqMamt/Q==
X-Received: by 2002:a1c:7508:0:b0:3fb:a102:6d7a with SMTP id o8-20020a1c7508000000b003fba1026d7amr13978738wmc.28.1692965800627;
        Fri, 25 Aug 2023 05:16:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4e1:71e1:b02b:811e? ([2a01:e0a:982:cbb0:4e1:71e1:b02b:811e])
        by smtp.gmail.com with ESMTPSA id u2-20020a05600c00c200b003fe2a40d287sm2061684wmm.1.2023.08.25.05.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 05:16:40 -0700 (PDT)
Message-ID: <32873c1f-6c8a-425e-8965-a6f727d1408a@linaro.org>
Date:   Fri, 25 Aug 2023 14:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
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
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-4-zelong.dong@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20230825115310.39993-4-zelong.dong@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2023 13:53, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the IR controller device of Meson-S4 SoC family.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts    |  6 ++++++
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi         | 15 +++++++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 8ffbcb2b1ac5..c1f322c73982 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -28,3 +28,9 @@ memory@0 {
>   &uart_B {
>   	status = "okay";
>   };
> +
> +&ir {
> +	status = "okay";
> +	pinctrl-0 = <&remote_pins>;
> +	pinctrl-names = "default";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index f24460186d3d..5a3abcc08ee5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -106,6 +106,14 @@ gpio: bank@4000 {
>   					#gpio-cells = <2>;
>   					gpio-ranges = <&periphs_pinctrl 0 0 82>;
>   				};
> +
> +				remote_pins: remote-pin {
> +					mux {
> +						groups = "remote_in";
> +						function = "remote_in";
> +						bias-disable;
> +					};
> +				};
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> @@ -133,6 +141,13 @@ reset: reset-controller@2000 {
>   				reg = <0x0 0x2000 0x0 0x98>;
>   				#reset-cells = <1>;
>   			};
> +
> +			ir: ir@84040 {
> +				compatible = "amlogic,meson-s4-ir";
> +				reg = <0x0 0x84040 0x0 0x30>;
> +				interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
> +			};
>   		};
>   	};
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
