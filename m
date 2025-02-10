Return-Path: <linux-media+bounces-25876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D65EA2E679
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB632165939
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 08:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F991C2439;
	Mon, 10 Feb 2025 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVBA3wW+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81DC1C1F21;
	Mon, 10 Feb 2025 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176172; cv=none; b=lFiIIKcxrwhNp7XEGj6n0frJC82BxdGMebw4qmRFjnjN4STiT4p63XQcODO9vnAcF8c/PgbhrBbt24mQOP5lc+TxuYIueOqcmSbRFNLXVXx5zoDW9TzNhTmCWY1vDC0tQahG7ZpctlIPobDb1PQqiwQOYzrFbKiaQswiVoRhq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176172; c=relaxed/simple;
	bh=/Fp+B0JWQF2ROKHaiimvWG3bYLsZclFhzmKfyv5OYkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0DSajsIgWakqb51VjxDlFrpbxVjuKsTfn9jWVoKWiKefJuQpfjpL61AOEzCUG7DYB+82WpfnmQt/X8cCiKvVjSXmGWKJuB7qu2GxCkWUb0TLVmjF9JISwLw/xZjSiCQk0rWyoMn+w6kQRXcUtiBd4nRwXZreuXZ//wQHiSn7d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVBA3wW+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81DBC4CEE6;
	Mon, 10 Feb 2025 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739176171;
	bh=/Fp+B0JWQF2ROKHaiimvWG3bYLsZclFhzmKfyv5OYkw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bVBA3wW++dNGMP58Z9cllv1LGzIMObFRMWyxLw1axpn1j/g0uTxIFfszhARWqtzv1
	 7who+w45hCHXtnChuBY3H9W8/VOoUIoPEaTPVnau/7gaunbfArjk98RmCkqzyw6/d3
	 jH8zZKL9ryzDrXaDNnhLkK8kQf6zWY5qbY3k0M3UwSa9Yk9xizk7bGC/cvqnItBXQZ
	 rvaxJiE484VrMw4LVDI4kmckMQA7EnJ2z7e1Db8RS+m5sAgl0yyobHF1BA0tMNgO1q
	 deb9Bj1zMmLP+El5rJE+a5lKgPfCFVk1IIPbG72jT2ZEczCy4/PjBuzAD0TJ+JszNc
	 Pl1K+9YbQdXXg==
Message-ID: <c2ff273a-bac5-4fa3-8339-ab722c9e63bf@kernel.org>
Date: Mon, 10 Feb 2025 09:29:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: dt-bindings: i2c: add DW9719/DW9718S VCM
 binding
To: Val Packett <val@packett.cool>
Cc: Daniel Scally <djrscally@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250210082035.8670-1-val@packett.cool>
 <20250210082035.8670-2-val@packett.cool>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250210082035.8670-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2025 09:19, Val Packett wrote:
> Add DT bindings for the dw9719 voice coil motor driver, which is getting
> devicetree compatibles added along with DW9718S support.
> 
> Also mention the binding file in the corresponding MAINTAINERS entry.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  .../bindings/media/i2c/dongwoon,dw9719.yaml   | 110 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> new file mode 100644
> index 000000000000..88161038223f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9719.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dongwoon Anatech DW9719 Voice Coil Motor (VCM) DAC
> +
> +maintainers:
> +  - Daniel Scally <djrscally@gmail.com>
> +
> +description: |-
> +  The Dongwoon DW9719/DW9718S is a single 10-bit digital-to-analog converter
> +  with 100 mA output current sink capability, designed for linear control of
> +  voice coil motors (VCM) in camera lenses. This chip provides a Smart Actuator
> +  Control (SAC) mode intended for driving voice coil lenses in camera modules.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dongwoon,dw9719
> +      - dongwoon,dw9718s

Keep alphabetical order.

> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: VDD power supply
> +
> +  dongwoon,sac-mode:
> +    description: |
> +      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
> +      SAC1-SAC6 (Smart Actuator Control).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0    # Direct mode
> +      - 1    # LSC mode
> +      - 2    # SAC1 mode (operation time# 0.32 x Tvib)
> +      - 3    # SAC2 mode (operation time# 0.48 x Tvib)
> +      - 4    # SAC3 mode (operation time# 0.72 x Tvib)
> +      - 5    # SAC4 mode (operation time# 1.20 x Tvib)
> +      - 6    # SAC5 mode (operation time# 1.64 x Tvib)
> +      - 7    # SAC6 mode (operation time# 1.88 x Tvib)
> +    default: 4
> +
> +  dongwoon,vcm-freq:
> +    description:
> +      The switching frequency for the voice coil motor.

Frequency is in Hertz, so use proper property unit suffix. BTW, you
cannot add incorrect properties post-factum based on already accepted
ACPI driver. This would be nice bypass of review, right?

> +    $ref: /schemas/types.yaml#/definitions/uint32

Drop.

minimum/maximum constraints

> +

No reset/powerdown gpios in the hardware?

Missing required block.

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: dongwoon,dw9718s
> +    then:
> +      properties:
> +        dongwoon,vcm-freq:
> +          default: 0
> +          enum:
> +            - 0    # 5.00 MHz
> +            - 1    # 3.33 MHz
> +            - 2    # 2.50 MHz
> +            - 3    # 2.00 MHz
> +            - 4    # 1.67 MHz
> +            - 5    # 1.43 MHz
> +            - 6    # 1.25 MHz
> +            - 7    # 1.11 MHz
> +            - 8    # 1.00 MHz
> +            - 9    # 0.91 MHz
> +            - 10   # 0.83 MHz
> +            - 11   # 0.77 MHz
> +            - 12   # 0.71 MHz
> +            - 13   # 0.67 MHz
> +            - 14   # 0.63 MHz
> +            - 15   # 0.59 MHz
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: dongwoon,dw9719
> +    then:
> +      properties:
> +        dongwoon,vcm-freq:
> +          default: 0x60

Why no constraints? Why suddenly hex?
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply

required always follows properties.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

Drop stray blank line

> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        vcm_rear: camera-lens@c {
> +            compatible = "dongwoon,dw9718s";
> +            reg = <0x0c>;
> +
> +            vdd-supply = <&pm8937_l17>;

Missing properties, make the example complete.

> +        };
> +    };
> +
> +...



Best regards,
Krzysztof

