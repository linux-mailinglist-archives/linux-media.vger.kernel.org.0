Return-Path: <linux-media+bounces-1802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC40D80850A
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 10:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1A1283FF0
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 09:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD513528A;
	Thu,  7 Dec 2023 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vyr2VsSw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692FAD6D;
	Thu,  7 Dec 2023 01:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701943033; x=1733479033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jej5Ld6eP+dZtZXHnQ9Z9Uwwzz3coTmf8kqkVZReWjo=;
  b=Vyr2VsSwZ0Cd7pqSH8SPQ4w9kQSN95ljimoEOkaCDMx1QwF2RmptKPP5
   Yj0jx5PzB8cYpyas/WZu1b8y9/3PQiJBADPY8dVWB4wVri2QLbkkryRyr
   NoO0GK5OJKxt9wKPauCw0cx8iOrkEqzzoym5fC7P6nr3aDdOTotmAPhVD
   0gnD9DYWE1g1SldyaVaAzK0QnoUXg8nfnQ6+dGZDdymzNFng/07y4RFvM
   hPf4SsgmPLpth7FIE4B+mQWPQ9C1SkI30tSdXL9IJkzVJvQS6i7rmAN46
   wXpPpaa4KX9pqXK4ARFEIxkpZaWwO/f3QaHFI1P6NdzSIzX1LkT+PiQdb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1311668"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1311668"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 01:57:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800684471"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="800684471"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 01:57:08 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2F4B311FB50;
	Thu,  7 Dec 2023 11:57:06 +0200 (EET)
Date: Thu, 7 Dec 2023 09:57:06 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	devicetree@vger.kernel.org, Lee Jackson <lee.jackson@arducam.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/2] media: dt-bindings: Add OmniVision OV64A40
Message-ID: <ZXGW8iyoQpIXUa1E@kekkonen.localdomain>
References: <20231206155900.123904-1-jacopo.mondi@ideasonboard.com>
 <20231206155900.123904-2-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206155900.123904-2-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

On Wed, Dec 06, 2023 at 04:58:59PM +0100, Jacopo Mondi wrote:
> Add bindings for OmniVision OV64A40.
> 
> Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/media/i2c/ovti,ov64a40.yaml      | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> new file mode 100644
> index 000000000000..e6c9d540a2dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov64a40.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV64A40 Image Sensor
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,ov64a40
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog voltage supply, 2.8 volts
> +
> +  dvdd-supply:
> +    description: Digital core voltage supply, 1.1 volts
> +
> +  dovdd-supply:
> +    description: Digital I/O voltage supply, 1.8 volts
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        additionalProperties: false
> +
> +        properties:
> +          bus-type:
> +            enum:
> +              - 1 # MIPI CSI-2 C-PHY
> +              - 4 # MIPI CSI-2 D-PHY
> +          data-lanes: true
> +          link-frequencies: true
> +          clock-noncontinuous: true
> +          remote-endpoint: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/gpio/gpio.h>
> +
> +      i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          camera@36 {
> +              compatible = "ovti,ov64a40";
> +              reg = <0x36>;
> +              clocks = <&camera_clk>;
> +              dovdd-supply = <&vgen4_reg>;
> +              avdd-supply = <&vgen3_reg>;
> +              dvdd-supply = <&vgen2_reg>;
> +              powerdown-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
> +              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +              rotation = <180>;
> +              orientation = <2>;
> +
> +              port {
> +                  endpoint {
> +                      remote-endpoint = <&mipi_csi2_in>;
> +                      bus-type = <4>;
> +                      data-lanes = <1 2 3 4>;

This is missing link-frequencies.

> +                  };
> +              };
> +          };
> +      };
> +
> +...

-- 
Regards,

Sakari Ailus

