Return-Path: <linux-media+bounces-15201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA09380D4
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 12:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAFDE1C2124F
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 10:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A2184D2C;
	Sat, 20 Jul 2024 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="CuQhzWg7"
X-Original-To: linux-media@vger.kernel.org
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0912030B;
	Sat, 20 Jul 2024 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721472707; cv=none; b=E7EGf/nzfG4s5i9DEKhKjgdwO3OONe8x5h8it2UBLp2OOytjkA5Fr0vSQFE51Zb4tdiHsiQiDbcVgZFstQiTfajP0ElVNSQn9v126Ma/h5SvLnNjhZES/cVXd4KjNfu+haWie9lHuPCHpmSxKRx3YPT3yigkYZZa1A9O6hBPgxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721472707; c=relaxed/simple;
	bh=bjMYb4foP2Gd3ezZyUdM3Qw1b32Bs1ieql7ODvDwN+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ro6CCnCRVBZ+rU82Dll63HR3TmnNYQixZV0fAB9ZIGgYyukxQAySmTGQPS+Dwvkk1bye8IsxLi8piQLSG/4Ge9hL2dnzcR+4h9R+8jg/dTgJbZ7Dv7Oj6odmufWoUvrDjagDmbWRkptBNFZcUto6ewiMZWh630IWDKJDqSRA2cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=CuQhzWg7; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Received: from mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:1115:0:640:1385:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 0529D610BD;
	Sat, 20 Jul 2024 13:44:10 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 4iIPWxEGkGk0-FfI6ubyd;
	Sat, 20 Jul 2024 13:44:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1721472249; bh=d+h+UU22HqHfMDmo3Xu6T6q9MntFpOpEsMe8DGuLIhI=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=CuQhzWg7vpYy3l6oKNnNot63qdinAXTBN5weZju2M1Yax4M3Rlw9jz8zku/qyggQh
	 1AIjT8NdTxfUxtbmiUhaMnAxIxJ18nNcTsfuZqsCtfyS5Nk3FBS0mQeO6yJeJg9lj9
	 Zsz4IPUhYHrlsog45VQq/iiPrfNkNLuNa7X7b4x4=
Authentication-Results: mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Message-ID: <c926b73e-9ee7-4c4f-9c06-761929425468@yandex.com>
Date: Sat, 20 Jul 2024 12:44:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: media: Document bindings for HDMI RX
 Controller
To: Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-3-shreeya.patel@collabora.com>
Content-Language: en-US
From: Johan Jonker <jbx6244@yandex.com>
In-Reply-To: <20240719124032.26852-3-shreeya.patel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/19/24 14:40, Shreeya Patel wrote:
> Document bindings for the Synopsys DesignWare HDMI RX Controller.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> ---
> 
> Changes in v4 :-
>   - No change
> 
> Changes in v3 :-
>   - Rename hdmirx_cma to hdmi_receiver_cma
>   - Add a Reviewed-by tag
> 
> Changes in v2 :-
>   - Add a description for the hardware
>   - Rename resets, vo1 grf and HPD properties
>   - Add a proper description for grf and vo1-grf phandles
>   - Rename the HDMI Input node name to hdmi-receiver
>   - Improve the subject line
>   - Include gpio header file in example to fix dt_binding_check failure
> 
>  .../bindings/media/snps,dw-hdmi-rx.yaml       | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> new file mode 100644
> index 000000000000..96ae1e2d2816
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Device Tree bindings for Synopsys DesignWare HDMI RX Controller
> +
> +---
> +$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare HDMI RX Controller
> +
> +maintainers:
> +  - Shreeya Patel <shreeya.patel@collabora.com>
> +
> +description:
> +  Synopsys DesignWare HDMI Input Controller preset on RK3588 SoCs
> +  allowing devices to receive and decode high-resolution video streams
> +  from external sources like media players, cameras, laptops, etc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: rockchip,rk3588-hdmirx-ctrler

> +      - const: snps,dw-hdmi-rx

1: Compatible strings must be SoC orientated.
2: In Linux there's no priority in which string will probed first. 
What's the point of having a fallback string when there's no common code, but instead only the first string is used?

+static const struct of_device_id hdmirx_id[] = {
+	{ .compatible = "rockchip,rk3588-hdmirx-ctrler" },
+	{ },
+};

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: cec
> +      - const: hdmi
> +      - const: dma
> +
> +  clocks:
> +    maxItems: 7
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: audio
> +      - const: cr_para
> +      - const: pclk
> +      - const: ref
> +      - const: hclk_s_hdmirx
> +      - const: hclk_vo1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: apb
> +      - const: ref
> +      - const: biu
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  hpd-gpios:
> +    description: GPIO specifier for HPD.
> +    maxItems: 1
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the general register file
> +      containing HDMIRX PHY status bits.
> +
> +  rockchip,vo1-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the Video Output GRF register
> +      to enable EDID transfer through SDAIN and SCLIN.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - pinctrl-0
> +  - hpd-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +    hdmi_receiver: hdmi-receiver@fdee0000 {
> +      compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
> +      reg = <0xfdee0000 0x6000>;
> +      interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
> +      interrupt-names = "cec", "hdmi", "dma";
> +      clocks = <&cru ACLK_HDMIRX>,
> +               <&cru CLK_HDMIRX_AUD>,
> +               <&cru CLK_CR_PARA>,
> +               <&cru PCLK_HDMIRX>,
> +               <&cru CLK_HDMIRX_REF>,
> +               <&cru PCLK_S_HDMIRX>,
> +               <&cru HCLK_VO1>;
> +      clock-names = "aclk",
> +                    "audio",
> +                    "cr_para",
> +                    "pclk",
> +                    "ref",
> +                    "hclk_s_hdmirx",
> +                    "hclk_vo1";
> +      power-domains = <&power RK3588_PD_VO1>;
> +      resets = <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
> +               <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
> +      reset-names = "axi", "apb", "ref", "biu";
> +      memory-region = <&hdmi_receiver_cma>;
> +      pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
> +      pinctrl-names = "default";
> +      hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
> +    };

