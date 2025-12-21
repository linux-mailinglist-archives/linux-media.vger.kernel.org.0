Return-Path: <linux-media+bounces-49264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE2DCD41BA
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 16:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AF31300ACCE
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 15:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E52E2FF14D;
	Sun, 21 Dec 2025 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRZKb4q1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF97182B8;
	Sun, 21 Dec 2025 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766329720; cv=none; b=E+TjQoUfe7rtR7HfuYpnBB/jNjiNB8VXHlmKBqyfECKGSvHYDqRnhfiqQx146PJP6tva7B1Ne5QQ0aKEKlrdAq6KKL3OlUmLUhp5k8IB0WX5dXn/Y13MQQzi2v49i/mqTeDAkdKNbIuNNNGDpcO4KKCLszKBf5lUH+uyVtmOCIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766329720; c=relaxed/simple;
	bh=O2k0WnkR1uOO+xM6WBR4+/d7YxlzKr5AiOiObfCkSZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyn1luBsQM7dd3bfCvU1ne8/vsKoYWuqLQXKZ0CGqowl1UXR37mzGi+npBBMgQhNSdq7CwJ94N/hhXCl6oPBsnFJrAaueZfNobD+9MpV5kWYv/ICem6R4kab24LBXOcFjkV2LdgOBHs5W5nS6Mpw7n5ohgU1qYVGWCMYPC1XeK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRZKb4q1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CB2C4CEFB;
	Sun, 21 Dec 2025 15:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766329719;
	bh=O2k0WnkR1uOO+xM6WBR4+/d7YxlzKr5AiOiObfCkSZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRZKb4q1AMLSLSN3y7B1P3+dufVNu7eop08WoSAcjEL4jIg5I0L0fFAFSCHQ3E+uc
	 +4tq8W6UGZrcMyBhIZS0Ba8yjWwdnFzIbaQgieQM2RKRW+Z2rJ6GCXh1tt01DgkjLX
	 /cvEH/1D6zA2CIdGQj0n3OlFXgPp+6Xb+RBMrEO+2hTD+A3hjO6IqdV0rV6Kix6EuR
	 OIBOHwegyUNcNZIXy+Wqmxs11l2DOprwOl29DXRbv5wBOxouOnOMYihhKzIhRr1xV0
	 0ayHdNwXWJrGo9Jy9obdqzoOy9PyqqRvTAJaQo5vnlc7s5nwMBt+ytKWOrhZaG7Pu3
	 mbCwx4NzNqZmg==
Date: Sun, 21 Dec 2025 16:08:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pavel@kernel.org, sakari.ailus@linux.intel.com, 
	mehdi.djait@linux.intel.com, laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: dt-bindings: ti,omap3isp: Convert to DT
 schema
Message-ID: <20251221-futuristic-masked-platypus-dfdac4@quoll>
References: <cover.1766123192.git.alex.t.tran@gmail.com>
 <3c5a55cc5873e8d16bd25c5968a0d8b36e180325.1766123192.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3c5a55cc5873e8d16bd25c5968a0d8b36e180325.1766123192.git.alex.t.tran@gmail.com>

On Sat, Dec 20, 2025 at 02:03:25PM -0800, Alex Tran wrote:


Thank you for your patch. There is something to discuss/improve.
	

> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Sakari Ailus <sakari.ailus@iki.fi>
> +
> +description:
> +  The OMAP 3 ISP is an image signal processor present in OMAP 3 SoCs.
> +
> +properties:
> +  compatible:
> +    const: ti,omap3-isp
> +
> +  reg:
> +    items:
> +      - description: Core ISP registers up to the end of the SBL block
> +      - description: CSI PHYs and receivers registers
> +
> +  interrupts:
> +    maxItems: 1
> +    description: the ISP interrupt specifier

Drop description, obvious.

> +
> +  iommus:
> +    maxItems: 1
> +    description: phandle and IOMMU specifier for the IOMMU that serves the ISP

Ditto

> +
> +  syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to System Control Module
> +          - description: register offset to Complex I/O or CSI-PHY register
> +    description:
> +      Phandle and register offset to the Complex I/O or CSI-PHY register
> +
> +  ti,phy-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description:
> +      0 - OMAP3ISP_PHY_TYPE_COMPLEX_IO (e.g. OMAP 3430)
> +      1 - OMAP3ISP_PHY_TYPE_CSIPHY (e.g. OMAP 3630)
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The ISP provides two external clocks, cam_xclka and cam_xclkb,
> +      at indices 0 and 1 respectively.
> +
> +  vdd-csiphy1-supply:
> +    description: Voltage supply of the CSI-2 PHY 1
> +
> +  vdd-csiphy2-supply:
> +    description: Voltage supply of the CSI-2 PHY 2
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Parallel (CCDC) interface
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: |
> +          CSIPHY1 interface:
> +            OMAP 3630: CSI2C / CCP2B
> +            OMAP 3430: CSI1 (CSIb)
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              lane-polarities:
> +                description: |
> +                  The lane polarity (required on CSI-2):
> +                    0 - not inverted
> +                    1 - inverted

You do not need to describe standard properties. Are the values
different than what video-interfaces define?

Same everywhere else. Look at other bindings how these properties should
be defined/written.

> +                minItems: 2
> +                maxItems: 3
> +                items:
> +                  enum: [0, 1]
> +
> +              data-lanes:
> +                description: Data lanes (required on CSI-2)
> +                minItems: 1
> +                maxItems: 2
> +                items:
> +                  minimum: 1
> +                  maximum: 3
> +
> +              clock-lanes:
> +                description: The clock lane (required on CSI-2)
> +                maxItems: 1
> +                items:
> +                  minimum: 1
> +                  maximum: 3
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: |
> +          CSIPHY2 interface:
> +            OMAP 3630: CSI2A / CCP2B
> +            OMAP 3430: CSI2 (CSIa)
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              lane-polarities:
> +                description: |
> +                  The lane polarity (required on CSI-2):
> +                    0 - not inverted
> +                    1 - inverted
> +                minItems: 2
> +                maxItems: 3
> +                items:
> +                  enum: [0, 1]
> +
> +              data-lanes:
> +                description: Data lanes (required on CSI-2)
> +                minItems: 1
> +                maxItems: 2
> +                items:
> +                  minimum: 1
> +                  maximum: 3
> +
> +              clock-lanes:
> +                description: The clock lane (required on CSI-2)
> +                maxItems: 1
> +                items:
> +                  minimum: 1
> +                  maximum: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - iommus
> +  - syscon
> +  - ti,phy-type
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/media/omap3-isp.h>
> +
> +    isp@480bc000 {
> +        compatible = "ti,omap3-isp";
> +        reg = <0x480bc000 0x12fc>,
> +              <0x480bd800 0x0600>;
> +        interrupts = <24>;
> +        iommus = <&mmu_isp>;
> +        syscon = <&scm_conf 0x2f0>;
> +        ti,phy-type = <OMAP3ISP_PHY_TYPE_CSIPHY>;
> +        #clock-cells = <1>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;

Make example complete, please.


Best regards,
Krzysztof


