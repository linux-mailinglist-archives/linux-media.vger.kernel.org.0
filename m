Return-Path: <linux-media+bounces-42966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7BDB933D7
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 22:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABEE717F20A
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 20:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE67426158B;
	Mon, 22 Sep 2025 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfxP7Pvv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6DB1E833D;
	Mon, 22 Sep 2025 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758573235; cv=none; b=aJGnKdAHwxiRLO6S/pO/IXMBDb7HbUmtpu3EEIWO9ebQhrdJXcCxBX70pTrlNrTZtR62Wkln/gpqQv+1J/g5kcSpynqGVpJnFATEPe0A7La0UZatPW0pXXv6ZHiwck+6Vk45paDI/NFIoImF3JIpO4EkOrHTK3xVk4JfE41gQKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758573235; c=relaxed/simple;
	bh=BQxZlqkbMQpNLXVzsCQCyONqf9JUCxYeIXzDA691YH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSEK2+IHgCf10PreGcPUjaASFAw7GtvfstSH79szqN6fjxjm9pn4o+357NbcKCTF2kAATgUKNXOyEJFrYdzlemppw3G3PXF3HERvj3556gej+h5VFwNbw4ngRd6iilwsbHgrXW7S2LgAHhrQZwAmVzBKBZhUAfOwMgCrqdRQiy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfxP7Pvv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A11C4CEF0;
	Mon, 22 Sep 2025 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758573234;
	bh=BQxZlqkbMQpNLXVzsCQCyONqf9JUCxYeIXzDA691YH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfxP7PvvPDjqhbZVcosBquL3rnK0NwMA0H3r24O2/ZTFn64MWFQ3PZwB62UlkbZNX
	 jxomcC3l6k97qjvXiew1Lkah6XaN4Sq0xvU2qP/JWTJ7q4Xk8AG7nLh7+r0fAokMTw
	 /Rlit71KxbPbUhChMVe8QOCJs0hjqgcR7cpTOy/glr6QL/a7mg5srm2eU4xwADPWgd
	 G5QfS43/zkUlsMzJ6wp1u1Z7ydXpwvRukQrxB6M2f4fYPGBlyizigSO92YBVRPdLxy
	 MHOyjNvI7Dr1ECurrMdyDjQhIMziwRy4tN1aqkCEYIuATYHiERNk481XnO/rs+S8Z+
	 jP8x6l/rBJ3jA==
Date: Mon, 22 Sep 2025 15:33:52 -0500
From: Rob Herring <robh@kernel.org>
To: Philippe Baetens <philippebaetens@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: ams,mira220: Add mira220
 image sensor
Message-ID: <20250922203352.GA1278145-robh@kernel.org>
References: <20250920-mira220-v4-0-921b2e83a352@gmail.com>
 <20250920-mira220-v4-1-921b2e83a352@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920-mira220-v4-1-921b2e83a352@gmail.com>

On Sat, Sep 20, 2025 at 09:47:58PM +0200, Philippe Baetens wrote:
> Mira220 is a global shutter NIR-enhanced image sensor made by AMS.
> Driver is submitted in the next patch of this series and verified on
> a raspberry pi.
> 
> Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/ams,mira220.yaml | 108 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 ++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> new file mode 100644
> index 000000000..ae4613d0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ams 2.2 MP NIR enhanced global shutter image sensor

s/ams/AMS/

> +
> +maintainers:
> +  - Philippe Baetens <philippebaetens@gmail.com>
> +
> +description: |-

Don't need '|' if no formatting to preserve.

> +  2.2 MP NIR enhanced global shutter image sensor designed for 2D and 3D
> +  consumer and industrial machine vision applications.

Is this a paragraph or just a odd line break? If a paragraph, add a 
blank line in between and use '>' modifier.

> +  Due to its small size, configurability and high sensitivity both
> +  in visual as well as NIR, the Mira220 is well suited for 2D and
> +  3D applications, which include Active Stereo Vision,
> +  Structured Light Vision for Robotics and AR/VR.

Wrap at 80 char.

> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ams,mira220
> +
> +  reg:
> +    description: I2C device address

Drop. That's every device.

> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  vdig-supply:
> +    description:
> +      Digital I/O voltage supply, 1.35 volts
> +
> +  vana-supply:
> +    description:
> +      Analog1 voltage supply, 2.8 volts
> +
> +  vddl-supply:
> +    description:
> +      Digital core voltage supply, 1.8 volts
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +    description:
> +      Video output port
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            anyOf:

Don't need 'anyOf' with a single entry.

> +              - items:
> +                  - const: 1
> +                  - const: 2
> +
> +          clock-noncontinuous: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vdig-supply
> +  - vana-supply
> +  - vddl-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mira220: camera-sensor@54 {
> +            compatible = "ams,mira220";
> +            reg = <0x54>;
> +            clocks = <&cam1_clk>;
> +            vana-supply = <&cam1_reg>;	/* 2.5v */
> +            vdig-supply = <&cam_dummy_reg>;	/* 1.8v */
> +            vddl-supply = <&cam_dummy_reg>;	/* 1.35v */
> +            port {
> +                mira220_ep: endpoint {
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <750000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477c..c179b931b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1350,6 +1350,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
>  F:	drivers/iio/light/as73211.c
>  
> +AMS MIRA220 DRIVER
> +M:	Philippe Baetens <philippebaetens@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> +F:	drivers/media/i2c/mira220.c
> +
>  AMT (Automatic Multicast Tunneling)
>  M:	Taehee Yoo <ap420073@gmail.com>
>  L:	netdev@vger.kernel.org
> 
> -- 
> 2.43.0
> 

