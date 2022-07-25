Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7575B5802B8
	for <lists+linux-media@lfdr.de>; Mon, 25 Jul 2022 18:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236097AbiGYQcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jul 2022 12:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbiGYQcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jul 2022 12:32:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74219192BE
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 09:32:20 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a23so16523258lfm.10
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=zwZY6X82dfmJAnPeF/543yFoWYLt1Gv+miG51a8O22U=;
        b=XqWWIfNGdNrCMrr708mX/AiOlm89+pSsgkiw68yz/sr2h5wwtX9TtNRYeSV8r/+ato
         NMJIYc8uMXHPgLz/hFSYuVzb0kaG0hi+JsrKbW8pqh2AbdvfLR1MTdtzJConCrgpYrJe
         tp0J8bPjIfahm5H6qpO4t521nr+5GdaOwQgcaTwd4HxvuH4uCj2e6wHcFLeaZbPF/6eZ
         bpSrmmJ08XitHRwyba/I1ywmqzL4Zon7yQi+aRbsKUJsvV/szXNQn5GxtmLTWRCyXnZ5
         l9GlUedTAP9jBF6tt2TspYrwLo7jWvMDqwZnRxr1DqXR8zOBUpFmDAb/sQxLk8ADdjnm
         WeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zwZY6X82dfmJAnPeF/543yFoWYLt1Gv+miG51a8O22U=;
        b=sG1DcI80JsRgHmlZmfrqspvTn6sLi4s1GNF7KOA54zsqIXsuW6krbKIA84uQENn62/
         NzHrgoSzgQ2nNsrFI5R2Uo1zar4FWV8uXnhLnXKtjELjAp7k8cWpWLx4M/5+V6BdtyNy
         AEKn/MkL+deGa+nsRIwyx9Cw2ETNCUDr+GnhVU+xymIEyGmqR+u1ieKLhUWACPEzkvdJ
         FxoWEjkTzhDFlHbBqCLQRpVTshcNJVSi0YshjmJ+GVA8SZnEpZigBVuQH5sc5xHT5DDk
         TVuksco0zKJ3TujZ8eRoZoEksadSPgAErf/kOOu4YIIhyMw6MD2mmLWOlgqMSTrF77pj
         XfwA==
X-Gm-Message-State: AJIora8YJ7/AbcpKgMHVAI3dmCkcdUxe62+YfakYqDDruWTQaqCnoVIt
        1JwBG07TIaCCf4GNPtyWYZdirA==
X-Google-Smtp-Source: AGRyM1seBt8XbPbgtD0Ok/a7aF3Z7uOFexdivos6yxqErhHZreedg5ZO3Y1QCkz14lxzT/wh//90pg==
X-Received: by 2002:ac2:4e12:0:b0:489:ddbe:83c5 with SMTP id e18-20020ac24e12000000b00489ddbe83c5mr5398208lfr.371.1658766738799;
        Mon, 25 Jul 2022 09:32:18 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id b6-20020a196446000000b00488d0e38283sm2721731lfj.153.2022.07.25.09.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:32:18 -0700 (PDT)
Message-ID: <677c9314-593e-3512-539a-fd74f634c470@linaro.org>
Date:   Mon, 25 Jul 2022 18:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [v5 4/4] arm64: dts: meson: Add MagicBox M16S support
Content-Language: en-US
To:     Zhang Ning <zhangn1985@qq.com>, martin.blumenstingl@googlemail.com,
        narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        sean@mess.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_9D885D188E51B537DB904A774CEC35E4180A@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_9D885D188E51B537DB904A774CEC35E4180A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/07/2022 01:17, Zhang Ning wrote:
> MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
> with spec:
> 
>  - Amlogic S912-H (S912 with dolby and dts)
>  - 2G ddr3
>  - 16G emmc
>  - Marvell sd8897 BT/wifi module
>  - 100M ethernet
>  - IR reciever
>  - 4K HDMI
>  - AV out
>  - Rest hole
>  - 5V2A power input
>  - white LED
> 
> it's q201_v1 according u-boot log.
> and it's almost same as Q201 reference design.
> 
> add a simple dts to support this Tv box.
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 40 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 8773211df50e..e0907fb41829 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-magicbox-m16s.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> new file mode 100644
> index 000000000000..69e72687ac9c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Zhang Ning <zhangn1985@qq.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxm.dtsi"
> +#include "meson-gx-p23x-q20x.dtsi"
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
> +	model = "MagicBox M16S";
> +
> +	gpio-keys-polled {

Just gpio-keys (or even "keys").

> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Address/size cells are not correct.

> +		poll-interval = <100>;
> +
> +		button-power {
> +			label = "power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};

Missing blank line.

> +&ethmac {


Best regards,
Krzysztof
