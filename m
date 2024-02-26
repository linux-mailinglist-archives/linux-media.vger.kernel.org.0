Return-Path: <linux-media+bounces-5916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F868673F7
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 12:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D16C8286606
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 11:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FE05A7B4;
	Mon, 26 Feb 2024 11:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="PbDOzeXo"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C7A249F9;
	Mon, 26 Feb 2024 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708948475; cv=pass; b=m3fr8pg/pLCHLV8jhE5+tr/uA6T/nMadGkpU7CFW3M+zsHzaAJRY2WltOw2qj0xogWoYqV2+ey77uKGxGH22d09SIl2wU2UkeBvRKJ6V+O4y3DF5KV0eiWzczYR8+6lQeAVduqKuIu8/aHdw1jMlNstEzvR3FKi7iisr1tFGnJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708948475; c=relaxed/simple;
	bh=P2nBjIZ8Qk9BLeXDaUReVS3IAhuCOfkOnwJNXC8P3Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ez7VvQ2DVZkMVGCm8wfj3PUl4yPo634TDRPk8eHHpkb9cra3vGnUPzJ8ni7l9b+qtm6zhoby7w0Uf2g4ivlDXp6jayat8TkYWpkcIPkC6Y6ds5+O5pnuHVgbOeF/8GmkFuh7n/V2OBuoejeDImRkFqs1qbZ7KIiuU681qBZnGs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=PbDOzeXo; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TjzYW2m3Lz49Psw;
	Mon, 26 Feb 2024 13:54:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1708948464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jzvy2SvKDmvv4WetelVqs47ATPl2lFOOSOxgQnJjjpA=;
	b=PbDOzeXouZ2AcWWUg83/ia1tRZWe9oxDxtat5ClEu/d7l7MNU7urvjmT7QeSNil8KCnRDh
	7n6SuSQyEdfYhxFZyZ8vL+kVAMtuUSqlRDSPG0x9JlPhttO9MCUwwuGAUKDdIf02k0fhDs
	K+s1P1mXo0WCfBD6ShzZVxIzXUX/W7chHfkyczq0B3LtPxHy6bMglFJlfTiPua50JaarTm
	27wQD1eS7sdhdGGu4SIQUVw7FExesVPxt0utlIly0dD1ixqhESqhGP85bSsFIaE6vYLvWg
	bI4hh+NbI3fpYMMDUtAaI6zOzC5t3BWqv+aNwnqs8a2dpy0lkVfUfABX2lpBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1708948464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jzvy2SvKDmvv4WetelVqs47ATPl2lFOOSOxgQnJjjpA=;
	b=agPwmz3VwyrSGyTuRJk1Nxy0wO/4WASn2UOqttVEXMpYHaDQCisLl7S8TcHteD0uIUpOJ1
	1Wyjpnd5znr2Kvu7dDd4K8f7//Mdf7UZ6FGXUEWvAe9c+WN2eCHF6wwaXVmyj6OJlOKmKV
	V6tVTGHesbxN1YS9wvDBI9S9fjTyMxE1rG3jgBOJBb2IEMNG4L7/nQgvpAA1tFfoaiEQIp
	MvM6pu8vihk8IAl88jZOcfUWgnOkMosxEfx5XTDA0u9AwQ5toSngATnWDC7pDr9svHY5Ja
	UI9eaqQLyf2jbN+5i1+jxLzUMg1cPxsrg6i2c49kEIq4nC33eP9N1GxCDzu4gQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1708948464; a=rsa-sha256;
	cv=none;
	b=awCHdMVw2e253Vz+PZOmX0ZfklcotmJUaJN7XO5YR0NcSV2XZl2oOLcpPS+WKhGP1OigFn
	SOkmW6ZhV5B/hOIZLku5hPms22vWvKbsHN6ujDX/8eGlUxc7ebDLPFqr8/S6f/5BctG2GK
	G9BRjQXGQO1wuNoXa8LgnjCBbT3S+4ZcKdz611J7cx/Xcz6MI9KkpxBkd4x+3pB5umBhnS
	GVSvzRQlbqvfJVuXR2h5gkNqz5dBn3yv+9IKKKvOPJS4CRUIgiCCOVOzw645kj5OJqIKsU
	uLRvk/QTzOfJWoR0Mzu/3PJMvueEmcaAouFtZ/KTp2/yAOSw6OOEoSMUPdXh0w==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2D3F5634C93;
	Mon, 26 Feb 2024 13:54:22 +0200 (EET)
Date: Mon, 26 Feb 2024 11:54:22 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <Zdx77nyiQn4zya3h@valkosipuli.retiisi.eu>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214141906.245685-3-dan.scally@ideasonboard.com>

Hi Dan,

On Wed, Feb 14, 2024 at 02:19:03PM +0000, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
> 
> 	- Added clocks information
> 	- Fixed the warnings raised by Rob
> 
>  .../bindings/media/arm,mali-c55.yaml          | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> new file mode 100644
> index 000000000000..30038cfec3a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali-C55 Image Signal Processor
> +
> +maintainers:
> +  - Daniel Scally <dan.scally@ideasonboard.com>
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +
> +properties:
> +  compatible:
> +    const: arm,mali-c55
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ISP video clock
> +      - description: ISP AXI clock
> +      - description: ISP AHB-lite clock
> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +      - const: aclk
> +      - const: hclk
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mali_c55: isp@400000 {
> +      compatible = "arm,mali-c55";
> +      reg = <0x400000 0x200000>;
> +      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
> +      clock-names = "vclk", "aclk", "hclk";
> +      interrupts = <0>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          isp_in: endpoint {
> +              remote-endpoint = <&mipi_out>;

I suppose this is a CSI-2 interface with D-PHY?

How many lanes do you have and is lane remapping / polarity inversion
supported?

This should be reflected in bindings.

> +          };
> +        };
> +      };
> +    };
> +...

-- 
Regards,

Sakari Ailus

