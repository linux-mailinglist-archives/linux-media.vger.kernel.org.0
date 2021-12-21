Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F141147C945
	for <lists+linux-media@lfdr.de>; Tue, 21 Dec 2021 23:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237988AbhLUWgp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 17:36:45 -0500
Received: from mga07.intel.com ([134.134.136.100]:22000 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237387AbhLUWgo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 17:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640126204; x=1671662204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7+zcXeJFEm2uxCbsmG6YEfjfiN3y+5NaQlSt8ITghWg=;
  b=LCGUCFvz00m1wdNVyVKFPq4PhCQ22gQ4FpA5kFJOO5XNgCIoouU+4M+3
   tAPMbDd9AwzQSdWntLQkECt+fXHu9PKysY04Npr4YXPYGa00Tkvo3Td/U
   vcvMI/QOUw3vk8MCsLUllaZb/65wmhOq3a6ooi8x827J1K2/CYEqTqjjs
   NJtKBWHKK9KPjJ19juEiT5TvOgEA/AoPVEUPi6q1NT1fzT6qtnkHlOMzY
   w9ItropC1Ou785HM5cBXjXuUCfzwMcHJtYVRamXfz50kQfE9byS97GEFJ
   KOPHFe5QJ/ZdcnHbxZqxvFShMPIU3p8zbUjfo2gOaeUAqN25N+2GhG61c
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="303874448"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="303874448"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 14:36:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="484563640"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 14:36:42 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 460842057F;
        Wed, 22 Dec 2021 00:36:40 +0200 (EET)
Date:   Wed, 22 Dec 2021 00:36:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <YcJW+EZhDkxk2u2w@paasikivi.fi.intel.com>
References: <20211219220948.28953-1-laurent.pinchart@ideasonboard.com>
 <20211219220948.28953-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211219220948.28953-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Dec 20, 2021 at 12:09:47AM +0200, Laurent Pinchart wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Add YAML devicetree binding for IMX296 CMOS image sensor. Let's also
> add MAINTAINERS entry for the binding and driver.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v4:
> 
> - Rename to sony,imx296.yaml
> - Add Laurent Pinchart as maintainer
> - Rename power supplies
> - Rename clock to INCK
> - Drop clock-frequency property
> - Reference OF graph DT schema
> - Mention reset GPIO pin name
> - Fix schema $id
> - Fix port
> ---
>  .../bindings/media/i2c/sony,imx296.yaml       | 95 +++++++++++++++++++
>  MAINTAINERS                                   |  8 ++
>  2 files changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
> new file mode 100644
> index 000000000000..e8f9a73bf2db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx296.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |-
> +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> +  sensor with square pixel array and 1.58 M effective pixels. This chip
> +  features a global shutter with variable charge-integration time. It is
> +  programmable through I2C and 4-wire interfaces. The sensor output is
> +  available via CSI-2 serial data output (1 Lane).
> +
> +properties:
> +  compatible:
> +    const: sony,imx296
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description: Input clock (37.125 MHz, 54 MHz or 74.25 MHz)
> +    items:
> +      - const: inck

As the driver only gets the frequency, should we require assigned-clock-*
stuff here?

Virtually all other sensors have a wide range of supported frequencies.

> +
> +  avdd-supply:
> +    description: Analog power supply (3.3V)
> +
> +  dvdd-supply:
> +    description: Digital power supply (1.2V)
> +
> +  ovdd-supply:
> +    description: Interface power supply (1.8V)
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - avdd-supply
> +  - dvdd-supply
> +  - ovdd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imx296: camera-sensor@1a {
> +            compatible = "sony,imx296";
> +            reg = <0x1a>;
> +
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&camera_rear_default>;
> +
> +            clocks = <&gcc 90>;
> +            clock-names = "inck";
> +
> +            avdd-supply = <&camera_vdda_3v3>;
> +            dvdd-supply = <&camera_vddd_1v2>;
> +            ovdd-supply = <&camera_vddo_1v8>;
> +
> +            reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                imx296_ep: endpoint {
> +                    remote-endpoint = <&csiphy0_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 43007f2d29e0..1b20f2b90aec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17752,6 +17752,14 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
>  F:	drivers/media/i2c/imx290.c
>  
> +SONY IMX296 SENSOR DRIVER
> +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
> +
>  SONY IMX319 SENSOR DRIVER
>  M:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org

-- 
Kind regards,

Sakari Ailus
