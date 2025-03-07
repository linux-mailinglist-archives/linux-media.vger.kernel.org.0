Return-Path: <linux-media+bounces-27795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9F0A56209
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 08:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73D34175C1C
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 07:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259CC1A9B4C;
	Fri,  7 Mar 2025 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ga9J963q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD7E1A4E98;
	Fri,  7 Mar 2025 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741333918; cv=none; b=gF8/fLVUlsYl+qBgeWjezkxuNOeU4f9u47vDh7C0FZnvGx+Y8MFBuHGXaL2/oNWxHu/EwEIVZR0SYq5RAOXYkRsK+rlFqvS0B7iVItpnrRKS2N7FaB44+R1vci2Avu04m0L6WwqG4y4O5ntqfiEAf659FbM65frWb+8HlCiIt08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741333918; c=relaxed/simple;
	bh=ieDYzfj//1cDvOJNqapCIuJLLqt1QzcZn23Zs1tsHJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhwylaFTEXihuSmJElX1tbFOIysjDpXMgnRU4ZZgUUui7i2hu67PUh4Fc9HydlpTXOe7gPluO2ld2YmIoCXypnSPz7lPB++PYpaC9A0fDAYq0N1T+u3XLYu7baJ+hfcBatkGG3SgWD52XBKAIA8V29dZyKvXZ81bF+A3KPcVX7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ga9J963q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BCAC4CEE2;
	Fri,  7 Mar 2025 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741333917;
	bh=ieDYzfj//1cDvOJNqapCIuJLLqt1QzcZn23Zs1tsHJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ga9J963q3jHOvwg8Bwp0RNJuOWzcccUyRJWI2xTjYAg5QED3WlCMzuoONL6CE4NrB
	 RifjplPbC03fT8ktbrWoyz249WfmVfgjRf3O6UrugHTkXn4sixProkryssCrhdQQaj
	 8pKZLeYqnwDxdhgyaCyqdM6MNoIo/iexGkKUHjYp81LfeILY6TGNMXar+Tytzwb4dR
	 bX2ikQ8Y6wSJpiOCLZ1M8IuOfU71Cq1GV4F6Unfiza/aWF3U+smLBCRHIYplZoc8l7
	 IS/GauBEpOHoIXSulE7RUTkl2/MUcNBUQIj+OEuVarAgNPfq9mWkGRvQ8CNo3K7kyE
	 36uHSDM3ikbDw==
Date: Fri, 7 Mar 2025 08:51:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Message-ID: <20250307-pink-dalmatian-of-kindness-f87ad2@krzk-bin>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
 <20250306-v6-8-topic-rk3568-vicap-v5-3-f02152534f3c@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-3-f02152534f3c@wolfvision.net>

On Thu, Mar 06, 2025 at 05:56:04PM +0100, Michael Riesch wrote:
> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

subject: only one media prefix, the first

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 169 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 170 insertions(+)
> 

...

> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: DCLK
> +      - description: ICLK
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: dclk
> +      - const: iclk
> +
> +  rockchip,cif-clk-delaynum:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 127
> +    description:
> +      Delay the DVP path clock input to align the sampling phase, only valid
> +      in dual edge sampling mode. Delay is zero by default and can be adjusted
> +      optionally.

default: 0

> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: ARST
> +      - description: HRST
> +      - description: DRST
> +      - description: PRST
> +      - description: IRST
> +
> +  reset-names:
> +    items:
> +      - const: arst
> +      - const: hrst
> +      - const: drst
> +      - const: prst
> +      - const: irst
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to general register file used for video input block control.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The digital video port (DVP, a parallel video interface).
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum: [5, 6]
> +
> +            required:
> +              - bus-type
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Internal port connected to a MIPI CSI-2 host.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false

Hm, does it actually work? graph/port does not allow any other
properties. You should use graph/port-base and probably still narrow
lanes for both of port@0 and port@1.


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    parent {

soc {

> +        #address-cells = <2>;
> +        #size-cells = <2>;

Best regards,
Krzysztof


