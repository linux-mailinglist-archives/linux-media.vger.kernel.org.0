Return-Path: <linux-media+bounces-44634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75486BE0C54
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 23:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 94C024EA94F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 21:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6D92EBB81;
	Wed, 15 Oct 2025 21:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="JPgB6con"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85223A8F7;
	Wed, 15 Oct 2025 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760562836; cv=none; b=Zb2MiI3iNJT0ccIPwE7rk/gRdZiynxrfoPpu8I2fIjo5N7D2do8JWTSgjEqBHi8PJHk1ygslAjNRrMaeNIrps9m726qUklgK1cD+iKQxFp1j9bCFUcO2wdJftS4W+0zD1r6kt3DqomcTn3c8C2bvMlqbdqHh2uneWJk8XMkr48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760562836; c=relaxed/simple;
	bh=4XmHJ079a2h1wGTRiFHriP96Hqw0FxRr5bJ3Vh4dCyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TATX1Q6ER/GbfnIx59ew0Ax5K2DhhqkMyfYtmfS1Zw9RRE+4j0WcQoGnLn3nAkzvzj8L/UVz6XsWPkrzMuBFUfd8tus4jfz7mamUFRjSqrnwvE/bhdioi0GltV/hsdSlHlFNyZPEAMQuShjs9CHHnpZpuwBm3d6ek9U+tM30H8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=JPgB6con; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id E6A3953407E6;
	Wed, 15 Oct 2025 23:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1760562824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QTRadbU1imjNcdmYmT7D4HPtx0lxXk7YgNafAlMlAZ8=;
	b=JPgB6conl0/zfCNWbPmP197UlO5v6y/Wzzxg+3iZDoc3zIlABLAXXvn8owYKc+jS6hcIPw
	CGppPCvzPawPyVJBxva7gfmMPGMX7RXlprPrzIp7YLaTQ/ueltC43Vge8A+mHHtzf+MRJt
	ZkSgujePrUIpuDcUAMTB4QvDS4aEZro=
Message-ID: <59bf8b02-71f5-45e0-aa2d-d80b6cfe9c55@ixit.cz>
Date: Wed, 15 Oct 2025 23:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: media: Convert ti,tvp5150.txt to yaml
 format.
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251014185515.2354668-1-Frank.Li@nxp.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20251014185515.2354668-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

LGTM

Reviewed-by: David Heidelberg <david@ixit.cz>

On 14/10/2025 20:55, Frank Li wrote:
> Convert ti,tvp5150.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   .../bindings/media/i2c/ti,tvp5150.txt         | 157 ------------------
>   .../bindings/media/i2c/ti,tvp5150.yaml        | 133 +++++++++++++++
>   2 files changed, 133 insertions(+), 157 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
> deleted file mode 100644
> index 94b908ace53c8..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
> +++ /dev/null
> @@ -1,157 +0,0 @@
> -* Texas Instruments TVP5150 and TVP5151 video decoders
> -
> -The TVP5150 and TVP5151 are video decoders that convert baseband NTSC and PAL
> -(and also SECAM in the TVP5151 case) video signals to either 8-bit 4:2:2 YUV
> -with discrete syncs or 8-bit ITU-R BT.656 with embedded syncs output formats.
> -
> -Required Properties:
> -====================
> -- compatible:	Value must be "ti,tvp5150".
> -- reg:		I2C slave address.
> -
> -Optional Properties:
> -====================
> -- pdn-gpios:	Phandle for the GPIO connected to the PDN pin, if any.
> -- reset-gpios:	Phandle for the GPIO connected to the RESETB pin, if any.
> -
> -The device node must contain one 'port' child node per device physical input
> -and output port, in accordance with the video interface bindings defined in
> -Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
> -are numbered as follows
> -
> -	  Name		Type		Port
> -	--------------------------------------
> -	  AIP1A		sink		0
> -	  AIP1B		sink		1
> -	  Y-OUT		src		2
> -
> -The device node must contain at least one sink port and the src port. Each input
> -port must be linked to an endpoint defined in [1]. The port/connector layout is
> -as follows
> -
> -tvp-5150 port@0 (AIP1A)
> -	endpoint@0 -----------> Comp0-Con  port
> -	endpoint@1 ------+----> Svideo-Con port
> -tvp-5150 port@1 (AIP1B)  |
> -	endpoint@1 ------+
> -	endpoint@0 -----------> Comp1-Con  port
> -tvp-5150 port@2
> -	endpoint (video bitstream output at YOUT[0-7] parallel bus)
> -
> -Required Endpoint Properties for parallel synchronization on output port:
> -=========================================================================
> -
> -- hsync-active:		Active state of the HSYNC signal. Must be <1> (HIGH).
> -- vsync-active:		Active state of the VSYNC signal. Must be <1> (HIGH).
> -- field-even-active:	Field signal level during the even field data
> -			transmission. Must be <0>.
> -
> -Note: Do not specify any of these properties if you want to use the embedded
> -      BT.656 synchronization.
> -
> -Optional Connector Properties:
> -==============================
> -
> -- sdtv-standards: Set the possible signals to which the hardware tries to lock
> -                  instead of using the autodetection mechanism. Please look at
> -                  [1] for more information.
> -
> -[1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml.
> -
> -Example - three input sources:
> -#include <dt-bindings/display/sdtv-standards.h>
> -
> -comp_connector_0 {
> -	compatible = "composite-video-connector";
> -	label = "Composite0";
> -	sdtv-standards = <SDTV_STD_PAL_M>; /* limit to pal-m signals */
> -
> -	port {
> -		composite0_to_tvp5150: endpoint {
> -			remote-endpoint = <&tvp5150_to_composite0>;
> -		};
> -	};
> -};
> -
> -comp_connector_1 {
> -	compatible = "composite-video-connector";
> -	label = "Composite1";
> -	sdtv-standards = <SDTV_STD_NTSC_M>; /* limit to ntsc-m signals */
> -
> -	port {
> -		composite1_to_tvp5150: endpoint {
> -			remote-endpoint = <&tvp5150_to_composite1>;
> -		};
> -	};
> -};
> -
> -svideo_connector {
> -	compatible = "svideo-connector";
> -	label = "S-Video";
> -
> -	port {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		svideo_luma_to_tvp5150: endpoint@0 {
> -			reg = <0>;
> -			remote-endpoint = <&tvp5150_to_svideo_luma>;
> -		};
> -
> -		svideo_chroma_to_tvp5150: endpoint@1 {
> -			reg = <1>;
> -			remote-endpoint = <&tvp5150_to_svideo_chroma>;
> -		};
> -	};
> -};
> -
> -&i2c2 {
> -	tvp5150@5c {
> -		compatible = "ti,tvp5150";
> -		reg = <0x5c>;
> -		pdn-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
> -		reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			reg = <0>;
> -
> -			tvp5150_to_composite0: endpoint@0 {
> -				reg = <0>;
> -				remote-endpoint = <&composite0_to_tvp5150>;
> -			};
> -
> -			tvp5150_to_svideo_luma: endpoint@1 {
> -				reg = <1>;
> -				remote-endpoint = <&svideo_luma_to_tvp5150>;
> -			};
> -		};
> -
> -		port@1 {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			reg = <1>;
> -
> -			tvp5150_to_composite1: endpoint@0 {
> -				reg = <0>;
> -                                remote-endpoint = <&composite1_to_tvp5150>;
> -			};
> -
> -			tvp5150_to_svideo_chroma: endpoint@1 {
> -				reg = <1>;
> -				remote-endpoint = <&svideo_chroma_to_tvp5150>;
> -			};
> -		};
> -
> -		port@2 {
> -			reg = <2>;
> -
> -			tvp5150_1: endpoint {
> -				remote-endpoint = <&ccdc_ep>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml b/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml
> new file mode 100644
> index 0000000000000..4869ba7ca0763
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ti,tvp5150.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TVP5150 and TVP5151 video decoders
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  The TVP5150 and TVP5151 are video decoders that convert baseband NTSC and PAL
> +  (and also SECAM in the TVP5151 case) video signals to either 8-bit 4:2:2 YUV
> +  with discrete syncs or 8-bit ITU-R BT.656 with embedded syncs output formats.
> +
> +properties:
> +  compatible:
> +    const: ti,tvp5150
> +
> +  reg:
> +    maxItems: 1
> +
> +  pdn-gpios:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  port@0:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description:
> +      sink port node, AIP1A
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +  port@1:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description:
> +      sink port node, AIP1B
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +  port@2:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description:
> +      source port node, Y-OUT
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - port@2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/display/sdtv-standards.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        bridge@5c {
> +            compatible = "ti,tvp5150";
> +            reg = <0x5c>;
> +            pdn-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
> +            reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +
> +                endpoint@0 {
> +                    reg = <0>;
> +                     remote-endpoint = <&composite0_to_tvp5150>;
> +                };
> +
> +                endpoint@1 {
> +                   reg = <1>;
> +                   remote-endpoint = <&svideo_luma_to_tvp5150>;
> +                };
> +            };
> +
> +            port@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +
> +                endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&composite1_to_tvp5150>;
> +                };
> +
> +                endpoint@1 {
> +                    reg = <1>;
> +                    remote-endpoint = <&svideo_chroma_to_tvp5150>;
> +                };
> +            };
> +
> +            port@2 {
> +                reg = <2>;
> +
> +                endpoint {
> +                    remote-endpoint = <&ccdc_ep>;
> +                };
> +            };
> +        };
> +    };

-- 
David Heidelberg


