Return-Path: <linux-media+bounces-23433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9E9F23A9
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 13:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8599218863DA
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 12:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D780180A80;
	Sun, 15 Dec 2024 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="q2uUHQiA"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF59145A18;
	Sun, 15 Dec 2024 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734265138; cv=pass; b=E30jxptl5jqxNLmPXlf+D6jqqYHAKUVaCJ+BNJA3nmsuun7Lr5Aeeb8goOzqDJZ6szoTKW88mBB69lm83uWJDY9CJY8SN+5r4ZRmCesZokJ9ii9vAbGaAtYg5py9ZTkJ5cqoiD3JUUT7HjbCPnT22Mq7Wtaq6Gmxg+Io1YuyPz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734265138; c=relaxed/simple;
	bh=/L0OJLp/mBN6viX5c/npVe2gaNYnTN/UU/pILXkCo2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggLzVTnDvOZrNvX1D1Fk7GpoiZBZ9MrGwpUw7qjCTzb0Uv9quBDlzK1Pmualiz68ACLer6mYrh6bqo54XD4Jgy3GheDGjQOgiQxQ650Up729L89QCdY6jJiRhpItzmyzfkKrhkZH265kXirNYvMM+/4q5+3ZblwTK/sjCiYIPfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=q2uUHQiA; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4YB2DN11ZnzybN;
	Sun, 15 Dec 2024 14:18:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1734265126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNkUVDCZhDaEmA6yIBIe4bMQKnUcOVR08f2igvbWkbk=;
	b=q2uUHQiAoXW3hESINEMrWO1ktTOA1ljeykfiuIWAB6uaLVSHv9NWk6jkgFkJiL+vgpjAva
	hecH1U2LgHA5duHJ/Vl/S3WdJzggwitK62FkR4HAzobWyxoaivq17OLhMzHYhltlpljmVZ
	WZSlMLiLPOetPgEch88+myjDv6l/uBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1734265126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNkUVDCZhDaEmA6yIBIe4bMQKnUcOVR08f2igvbWkbk=;
	b=sVtVx9r8BjV7s7SelVuMQyX0JbRI8W0We5vuO8mghd5K4m+Sok2OvIg5hLVfKvEFTyY8Y6
	hiPHLNCOtBPYtbWSKkXBihWDatrs20pz9iuGEg8a/hayNnRgoFEssyg5xkvMSkKzX3yHf8
	UQhKQat+qWAclCLg4dyi8mrUqT+gBRg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1734265126; a=rsa-sha256; cv=none;
	b=MfJKE/lQoqP6UcKfO1WDXMpt4oQU3e4iaIa91DSFZoLmR45/AdCS+hgBuOidI+MStglFM6
	jZ7mr/Mz3rsU2cu4O4vrnKnKWEkqAuQEQbb4z8LKToWFNQhQhwJUMMV76fEoOvvd5PqmVt
	2B+UHHpKSmO4vUrEv0R8D3Y6AgUkdAg=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B67FC634C94;
	Sun, 15 Dec 2024 14:18:42 +0200 (EET)
Date: Sun, 15 Dec 2024 12:18:42 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 02/15] dt-bindings: media: add description of stm32 csi
Message-ID: <Z17JItE-98IIrnMv@valkosipuli.retiisi.eu>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
 <20241212-csi_dcmipp_mp25-v4-2-fbeb55a05ed7@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-2-fbeb55a05ed7@foss.st.com>

Hi Alain,

On Thu, Dec 12, 2024 at 10:17:26AM +0100, Alain Volmat wrote:
> Add the stm32 csi controller description.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> v2:
>   - rename into st,stm32mp25-csi.yaml to match compatible
>   - correct port / data-lanes (remove useless lines &
>     use data-lanes 1 and 2 instead of 0 and 1)
>   - correct commit log
> ---
>  .../bindings/media/st,stm32mp25-csi.yaml           | 125 +++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> new file mode 100644
> index 000000000000..33bedfe41924
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/st,stm32mp25-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 CSI controller
> +
> +description:
> +  The STM32 CSI controller allows connecting a CSI based
> +  camera to the DCMIPP camera pipeline.

CSI-2 I presume?

You should also document it here it has D-PHY...

> +
> +maintainers:
> +  - Alain Volmat <alain.volmat@foss.st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: txesc
> +      - const: csi2phy
> +
> +  resets:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Digital core power supply (0.91V)
> +
> +  vdda18-supply:
> +    description: System analog power supply (1.8V)
> +
> +  access-controllers:
> +    minItems: 1
> +    maxItems: 2
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                items:
> +                  - const: 1
> +                  - const: 2
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port node
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +    csi@48020000 {
> +        compatible = "st,stm32mp25-csi";
> +        reg = <0x48020000 0x2000>;
> +        interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> +        resets = <&rcc CSI_R>;
> +        clocks = <&rcc CK_KER_CSI>, <&rcc CK_KER_CSITXESC>, <&rcc CK_KER_CSIPHY>;
> +        clock-names = "pclk", "txesc", "csi2phy";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                endpoint {
> +                    remote-endpoint = <&imx335_ep>;
> +                    data-lanes = <1 2>;
> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;

...and drop bus-type property.

> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                endpoint {
> +                    remote-endpoint = <&dcmipp_0>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 

-- 
Kind regards,

Sakari Ailus

