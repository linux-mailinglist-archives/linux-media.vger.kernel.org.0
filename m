Return-Path: <linux-media+bounces-31049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCA9A9C5A4
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5227D1897154
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F3423E32D;
	Fri, 25 Apr 2025 10:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipegAZ2x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9563F22DFF3;
	Fri, 25 Apr 2025 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577252; cv=none; b=fK6Wx2R0RYF6ru3mOJ0v21/aHMBrXf5aGeIUQbnCBlObYnrXBCLoPz/hY1094LIR5ZUjbs0cU5xDI4q+mJgKVMdZ9uihoaDgBexUvMRIwrHJb/HBs3tk2rNMHL18U+Wue4nSqF2kQKNIup1Z2nf9jql4zAYmrfvJsBOvEOACN/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577252; c=relaxed/simple;
	bh=uyFgX1thZtZy0gZITfym58nsNt2FbqK17baf70eu8Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZ9M5rD5GI3C0XnsbmV3F8wk7pHtC7ie+90z6bRFXOa7EH6z8LHmCehEltyEk8G1Cg/Y9ztNuyK5TpMfjk2z8todmJTZS92+X8tyfvGhfxBKcgJYctcLBpuyk1rTtZBjyOWjbcYJhhtion+tRyB+XS6VjQJKu0In8RA4JDkmmt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipegAZ2x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA21C4CEE4;
	Fri, 25 Apr 2025 10:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745577252;
	bh=uyFgX1thZtZy0gZITfym58nsNt2FbqK17baf70eu8Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipegAZ2xqG1iA1qTJfNblSXX6AhY/KFbgfxHsV9TPWjtBZRDv5wEn+a9ypBQSHSWC
	 EXmlGjQh8mfl+U16pbdyzwsSoIxxZ9YoC7cnf6gxFfrOT8gREkW6XSKpXjk1HMJnDj
	 ehHFeRhLdSIHQ3RoF0T8Z7vs9DP+0op/KfGjrjwHwW2l4q310Gs3AYw8PMT+iBxbKG
	 SVv9lIVS7beNvMKN93pJotL+gkYNhqNQ91OX1rWNBolHlPJULRXyuMPbRTDt2pd4xO
	 rg6K5zBaYDrnyZs5o5cArdrVZ/Z337BUopXWXYJCFDwIzui78ZQtyIVSH9FAF0OIdw
	 JyikCxIaW9Tqg==
Date: Fri, 25 Apr 2025 12:34:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, sebastian.fricke@collabora.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com, marex@denx.de, jackson.lee@chipsnmedia.com, 
	lafley.kim@chipsnmedia.com
Subject: Re: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Message-ID: <20250425-romantic-truthful-dove-3ef949@kuoka>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <20250422093119.595-3-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422093119.595-3-nas.chung@chipsnmedia.com>

On Tue, Apr 22, 2025 at 06:31:13PM GMT, Nas Chung wrote:
> Add documents for the Wave6 video codec on NXP i.MX SoCs.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../bindings/media/cnm,wave633c.yaml          | 165 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/cnm,wave633c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/cnm,wave633c.yaml b/Documentation/devicetree/bindings/media/cnm,wave633c.yaml
> new file mode 100644
> index 000000000000..5bb572e8ca18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/cnm,wave633c.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/cnm,wave633c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chips&Media Wave6 Series multi-standard codec IP.

Drop full stop

> +
> +maintainers:
> +  - Nas Chung <nas.chung@chipsnmedia.com>
> +  - Jackson Lee <jackson.lee@chipsnmedia.com>
> +
> +description:
> +  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
> +  On NXP i.MX SoCs, Wave6 codec IP functionality is split between

... this and ...

> +  the VPU control region and the VPU core region.
> +  The VPU control region manages shared resources such as firmware memory,
> +  while the VPU core region provides encoding and decoding
> +  capabilities. The VPU core cannot operate independently without
> +  the VPU control region.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nxp,imx95-vpu
> +      - const: cnm,wave633c

... your drivers seem to use soc specific compatible, so I do not see
value in generic compatible. It would have to be good enough alone for
drivers, but it is not.

> +
> +  clocks:
> +    items:
> +      - description: VPU clock
> +      - description: VPU associated block clock
> +
> +  clock-names:
> +    items:
> +      - const: vpu
> +      - const: vpublk_wave
> +
> +  power-domains:
> +    maxItems: 1
> +    description: Main VPU power domain

Drop description

> +
> +  "#address-cells": true

instead const

> +
> +  "#size-cells": true

const

> +
> +  ranges: true
> +
> +patternProperties:
> +  "^video-core@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      compatible:
> +        items:

Drop items and keep just enum

> +          - enum:
> +              - nxp,imx95-vpu-core

So this is another proof that cnm,wave633c is wrong. How cnm,wave633c
can come with nxp,imx95-vpu-core child?

> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +
> +    additionalProperties: false

Put this immediately after type:object

> +
> +  "^video-controller@[0-9a-f]+$":
> +    type: object

Same here goes additionalProps.

> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - nxp,imx95-vpu-ctrl
> +
> +      reg:
> +        maxItems: 1
> +
> +      memory-region:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +        description: Performance power domain
> +
> +      '#cooling-cells':

Keep consistent quotes, either ' or "

> +        const: 2
> +
> +      sram:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description: phandle of the SRAM memory region node.
> +
> +    required:
> +      - compatible
> +      - reg
> +      - memory-region
> +      - power-domains
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - clocks
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      vpu: video-codec {

Why this device does not have MMIO? Sorry, but makes little sense and if
you posted and tested your entire DTS you would see why.

Can we see the entire DTS?

Best regards,
Krzysztof


