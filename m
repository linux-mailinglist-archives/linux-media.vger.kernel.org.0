Return-Path: <linux-media+bounces-42124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D054B50284
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 18:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08EFE3B73E1
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01230352FE7;
	Tue,  9 Sep 2025 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gj/NCaLx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41613223337;
	Tue,  9 Sep 2025 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757435162; cv=none; b=D/aBkx+zoLI1Nx7D9oKNSxrDueuEu4AYB6QeE7qimYCDkufzFyI4yKYs6PHkmgvTw+/ER20MU9oaFqi291esV4NE6QPVhZsnL3GlvwHrzpeG9t3/fz7IMZ3hkYQDlttdPLpLnUTTyEm4WOXacPummaF0sXS2hagRNkA17I6ITww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757435162; c=relaxed/simple;
	bh=vfzDmUMBXFEXny9F+Q1BKzqeDg/juItm7mo3ihXETqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esYC6Yfu3RKT8qugdSj3lwdL65Qx3jOelZr7Cfv3jKUClFqPgwTcXS1IQbH0Ug33qUEdLeX5wNbUTYeXf9HEwX0zvynLftrs64Rjl1dQbP9todViFSJkI0xlQOlmMc4OAHY+7hT8/RDy7h8VwosjT8EdqIIeCV0fNalTJ3C6rfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gj/NCaLx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8ABC4CEF8;
	Tue,  9 Sep 2025 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757435161;
	bh=vfzDmUMBXFEXny9F+Q1BKzqeDg/juItm7mo3ihXETqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gj/NCaLx7Ci5Nrx3m8Qf0cGJZZp75UjNxcnZIoP8nSRYWwPJOvqRotzfOsP9OKj6f
	 60pNDV648NMVSJ51qbitr7AfgNT022kvjT0C05+NAoI+JRDzpmL8Z/1H0xKMLPPaLr
	 qBDyEA6I3r36yIAYFGs8e61NuttAp/FG+mxwEUwe1oqS5hH3KO6fHXBUUNYmvaeOcD
	 lhDe9F7Flz6XNeMQUy/dHv8B+NZRH1X6dQycKZQZyjh7q3KJPrX8OBl7oEtQsNSOgE
	 epjVKtUJy2LNDGUTbSzyJacqQqJhNSRM3CybLPgLExFHy4/BG56vhj2Dqbpzj4xLIs
	 31Zg4kW986h4g==
Date: Tue, 9 Sep 2025 11:26:00 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20250909162600.GA3311232-robh@kernel.org>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-22-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906135345.241229-22-clamor95@gmail.com>

On Sat, Sep 06, 2025 at 04:53:42PM +0300, Svyatoslav Ryhel wrote:
> Document CSI HW block found in Tegra20 and Tegra30 SoC.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 104 ++++++++++++++++
>  .../display/tegra/nvidia,tegra30-csi.yaml     | 115 ++++++++++++++++++
>  2 files changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> new file mode 100644
> index 000000000000..1a2858a5893c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra20 CSI controller
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra20-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  avdd-dsi-csi-supply:
> +    description: DSI/CSI power supply. Must supply 1.2 V.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#nvidia,mipi-calibrate-cells":
> +    description: The number of cells in a MIPI calibration specifier.
> +      Should be 1. The single cell specifies an id of the pads that
> +      need to be calibrated for a given device.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 1

This property goes in the provider. Is the parent node the provider? You 
don't really need any of it if it's all one block.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^channel@[0-1]$":
> +    type: object
> +    description: channel 0 represents CSI-A and 1 represents CSI-B
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1

Instead:

maximum: 1


> +
> +      nvidia,mipi-calibrate:
> +        description: Should contain a phandle and a specifier specifying
> +          which pads are used by this DSI output and need to be
> +          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI.
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Is DSI applicable here?

> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: port receiving the video stream from the sensor
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes: true

Drop. No need unless you have some constraints like number of lanes?

> +
> +            required:
> +              - data-lanes
> +
> +        required:
> +          - endpoint

Drop.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: port sending the video stream to the VI
> +
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +# see nvidia,tegra20-vi.yaml for an example
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
> new file mode 100644
> index 000000000000..ea5ebd2f3c65
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra30-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra30 CSI controller
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra30-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: module clock
> +      - description: PAD A clock
> +      - description: PAD B clock
> +
> +  clock-names:
> +    items:
> +      - const: csi
> +      - const: csia-pad
> +      - const: csib-pad

Looks like clocks are the only difference? I think these 2 schemas can 
be merged.

> +
> +  avdd-dsi-csi-supply:
> +    description: DSI/CSI power supply. Must supply 1.2 V.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#nvidia,mipi-calibrate-cells":
> +    description: The number of cells in a MIPI calibration specifier.
> +      Should be 1. The single cell specifies an id of the pads that
> +      need to be calibrated for a given device.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^channel@[0-1]$":
> +    type: object
> +    description: channel 0 represents CSI-A and 1 represents CSI-B
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      nvidia,mipi-calibrate:
> +        description: Should contain a phandle and a specifier specifying
> +          which pads are used by this DSI output and need to be
> +          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI-A and
> +          3 is for DSI-B
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: port receiving the video stream from the sensor
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes: true
> +
> +            required:
> +              - data-lanes
> +
> +        required:
> +          - endpoint
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: port sending the video stream to the VI
> +
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +# see nvidia,tegra20-vi.yaml for an example
> -- 
> 2.48.1
> 

