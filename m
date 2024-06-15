Return-Path: <linux-media+bounces-13297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 510989096C7
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 10:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04DBA1F22C64
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 08:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552B318638;
	Sat, 15 Jun 2024 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="y0fF29Kl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8708418044
	for <linux-media@vger.kernel.org>; Sat, 15 Jun 2024 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.172.40.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718439105; cv=none; b=ZCcj/Io07Yq7H4R+r4hkzCROEIpDwhHwKeV9d25GOynz27fUBMIWTj3teHoatnSFMBFXteFc5V/wQ23jjVdIKQLrpQOMS5gbUVMOdNkXkIaAPFicOkW3Mg1T5+AAYRyQAGuZjG4KB7ipg+jpV+EJ3kjViJyJrKIra3p6RUM8qbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718439105; c=relaxed/simple;
	bh=VLOfu2sHlSblRVxS7M24YOwUMCWmyAxHORa4eJ1jtGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIjgB4iB6mvcHLeKJHT3rXvfU2Ig68b4rLj4KerVUmGfRCO1uKr4z7OxLGLPxv1fGg/VCd+USwSQliSB0bVsREQumuJioiOeiWvw6bW5nE4SRQx4lx3E/D6BeYCuD3ogmlGNr97uB9vFLpKv6blmRRaCI0w/ZJCn32KkVkyB9jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=y0fF29Kl; arc=none smtp.client-ip=167.172.40.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1718439068;
 bh=KD9XMEsUfvBdMg6V4GnJ0Xmth7fRvLlwhgghB2MFr/I=;
 b=y0fF29KlmtPU2HFDuFwRWA4MhxHmNZxGVUD/h5xkUSYQC1AHBRVFTqCjt5avCPyhtrAe6BYnG
 Fxj0B9vKfIC6vnQtvKf4D1BT5tfmbSGwMJnGErYk3xtmM9N2oyCx5BqpKM2LjMg9qeQPPyFJsyj
 L0zFvwFR95a60P7FEJ0wOYgCsO7XAQ6R1Fs3qHN+MxLZ91tKKrRqvAHagXzRBGRtdJSQUDF0jDV
 bHpkYl1CZkiLTJeLhCIVOjIaGbemeTWsJHgB+zNgJSz6970n6xlnHlCIww/CwERqJbkOsfwRwcR
 Yzc1z7cKv018sN4XvgzIPDndgdrLxU4Lrd/doa8FVxeA==
Message-ID: <442bbb41-40ed-4e6c-b854-02b636f09fc3@kwiboo.se>
Date: Sat, 15 Jun 2024 10:11:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: dt-bindings: rockchip: Document RK3588 Video
 Decoder 2 bindings
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, Dragan Simic
 <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>, Cristian
 Ciocaltea <cristian.ciocaltea@collabora.com>, Diederik de Haas
 <didi.debian@cknow.org>, Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-3-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20240615015734.1612108-3-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 666d4c9a01f41f7e8a2106cd

Hi Detlev,

On 2024-06-15 03:56, Detlev Casanova wrote:
> Document the Rockchip RK3588 Video Decoder 2 bindings.

Why the need for a new schema file and not just extending existing
rockchip,vdec.yaml with a new compatible and the new clock?

> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../bindings/media/rockchip,vdec2.yaml        | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec2.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec2.yaml
> new file mode 100644
> index 000000000000..e54891b46986
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec2.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,vdec2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Video Decoder 2 (VDec2)
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description: |-
> +  The Rockchip rk3588 has a stateless Video Decoder that can decodes H.264,
> +  HEVC, VP9 and AVS2 streams.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3588-vdec2

I fail to see the need to call this vdec2 instead of established vdec.

Suggest this is changed to rockchip,rk3588-vdec.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The Video decoder AXI interface clock
> +      - description: The Video decoder AHB interface clock
> +      - description: The Video decoder core clock
> +      - description: The Video decoder CABAC clock
> +      - description: The Video decoder HEVC CABAC clock
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +      - const: core
> +      - const: cabac
> +      - const: hevc_cabac
> +
> +  assigned-clocks: true
> +
> +  assigned-clock-rates: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +
> +    vdec2: video-codec@fdc38100 {
> +        compatible = "rockchip,rk3588-vdec2";
> +        reg = <0x0 0xfdc38100 0x0 0x500>;
> +        interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
> +                 <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
> +        clock-names = "axi", "ahc", "core",
> +                      "cabac", "hevc_cabac";
> +        assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
> +                          <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
> +        assigned-clock-rates = <800000000>, <600000000>,
> +                               <600000000>, <1000000000>;
> +        power-domains = <&power RK3588_PD_RKVDEC0>;

iommus and resets seem to be missing?

Regards,
Jonas

> +    };
> +
> +...


