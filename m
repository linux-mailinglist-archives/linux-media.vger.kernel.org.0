Return-Path: <linux-media+bounces-32744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60372ABB6D2
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 10:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5518F1898831
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 08:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252C52698BF;
	Mon, 19 May 2025 08:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXVvLU8w"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A277A31;
	Mon, 19 May 2025 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642237; cv=none; b=ukP11w5Di9dRqk3Sbbea2wCEgZsbU1opnHnhXlWbHpJqtIwYknc6MEOD4qTjWYq32PXU4Acobw4I/bbc1L8NWquu/eILwA3aTFxLXNvXDCtUruT+sHxllKEoTUgGeK/qaHdBA04lle2ZgQQceo8nf7kxMbrKHBpXK0QmWGHMoPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642237; c=relaxed/simple;
	bh=YhHucTbG2eUBFPlS1a/JrdQuTRlGHANsway1CBoAGII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWLZJ9nMVJC9Ucyek2sJB0ciLaaYQYt7s8M6CYc19L9lQYI2G4TeT6BUNoDIcNIl/uIytwnH9KLvdNETn0vKMOhXGVNWE/4LhfoUhq82JrEsjY0eqrvtSu8S2iPXO2QgxLnTa0dtDhLyIySsZk4x5f6LLlsuY1u1/mHWb6REPGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXVvLU8w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1DBC4CEE4;
	Mon, 19 May 2025 08:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747642236;
	bh=YhHucTbG2eUBFPlS1a/JrdQuTRlGHANsway1CBoAGII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXVvLU8wR9xtpCsyqffYZGBHL9P576ldjFHHsYkB02iuRcuU1wIau6WK6tAKc1Jbc
	 dwW6ONMRvBnSV1Y6nA6DgNmmdqkjaEsH7MUAMRe4kHq/Y/l6cARbALXmEvwE+621cc
	 DWYtVQFAV/CWs+cw2vSP9guVsYrJHOhl1K61RNRGN3N873oqpxEadh1XEdy/8Ve2yl
	 W70sQ60FEtdheEqROrzfiJoyhoFpo3+h9lHZ8q34f+ciKd3+oLgdjvkWEv+38V82j6
	 KOQ1uTyoOtKSxOOLDkMb6YWsypgx2dhYc7D5FH+ElDH5V96ckzwukukkDNW2gYSalR
	 2rHi5N9/nR/0Q==
Date: Mon, 19 May 2025 10:10:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Markus Elfring <Markus.Elfring@web.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Collabora Kernel Team <kernel@collabora.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v7 05/14] media: dt-bindings: add rockchip rk3568 mipi
 csi-2 receiver
Message-ID: <20250519-amazing-loutish-kudu-af8f47@kuoka>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
 <20240220-rk3568-vicap-v7-5-7581fd96a33a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v7-5-7581fd96a33a@collabora.com>

On Wed, May 14, 2025 at 05:41:06PM GMT, Michael Riesch wrote:
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum: [1, 4]
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - bus-type
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port connected to a RK3568 VICAP port.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - phys
> +  - ports
> +  - power-domains
> +  - resets

If there is going to be a new version, please order this the same as in
properties. Or rather order properties, because this looks alphabetical
and properties do not.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi: csi@fdfb0000 {
> +            compatible = "rockchip,rk3568-mipi-csi";
> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
> +            clocks = <&cru PCLK_CSI2HOST1>;
> +            phys = <&csi_dphy>;
> +            power-domains = <&power RK3568_PD_VI>;
> +            resets = <&cru SRST_P_CSI2HOST1>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                csi_in: port@0 {
> +                    reg = <0>;

Make it complete. Missing endpoint with bus-type and data lanes.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


