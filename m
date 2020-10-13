Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3F728D200
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 18:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389028AbgJMQQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 12:16:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:28501 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388977AbgJMQQG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 12:16:06 -0400
IronPort-SDR: zsXEK22i8M88r3vYXew4WCwZ2zNRG42hbLYNtIJVXj4zxDc+iJyAAIA2tCkfl7zSjtY70OJYGk
 you6m4kcApBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="166001882"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="166001882"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 09:16:04 -0700
IronPort-SDR: P3pra1uRpxYPtBTXwU/6kSV67ZZh495TU4HBDvMbMFkPzSqVB/b5K5gaCfSa+Lj7m+Kiv6+CW9
 WRbIqYDE7xqQ==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="345318759"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 09:16:01 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8D832205E8; Tue, 13 Oct 2020 19:15:59 +0300 (EEST)
Date:   Tue, 13 Oct 2020 19:15:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bogdan Togorean <bogdan.togorean@analog.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: dt-bindings: media: i2c: Add bindings for
 ADDI9036
Message-ID: <20201013161559.GD13341@paasikivi.fi.intel.com>
References: <20201009113014.71531-1-bogdan.togorean@analog.com>
 <20201009113014.71531-2-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009113014.71531-2-bogdan.togorean@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bogdan,

On Fri, Oct 09, 2020 at 02:29:55PM +0300, Bogdan Togorean wrote:
> Add YAML device tree bindings for Analog Devices Inc. ADDI9036 CCD TOF
> front-end.
> 
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> ---
> v3: drop I2C reg description
>     specify maxItems on reset-gpios property
> ---
>  .../bindings/media/i2c/adi,addi9036.yaml      | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> new file mode 100644
> index 000000000000..067b08ad8f53
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/adi,addi9036.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADDI9036 VGA CCD Time of Flight Sensor
> +
> +maintainers:
> +  - Bogdan Togorean <bogdan.togorean@analog.com>
> +
> +description: |-
> +  The ADDI9036 is a complete, 45 MHz, front-end solution for charge coupled
> +  device (CCD) time of flight (TOF) imaging applications. It is programmable
> +  through I2C interface. Image data is sent through MIPI CSI-2 2 lanes and
> +  can output two RAW12 packed data streams. One is IR and the other is Depth.
> +  Each data stream is on a separate or same MIPI Virtual Channel, depending
> +  on configuration and each have 640x480 resolution.
> +
> +properties:
> +  compatible:
> +    const: adi,addi9036
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: |-
> +      Reference to the GPIO connected to the RST/SYNC pin, if any.
> +      Must be released (set high) after all supplies are applied.
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          data-lanes:
> +            description: |-
> +              The sensor supports two-lane operation.
> +              For two-lane operation the property must be set to <1 2>.
> +            items:
> +              - const: 1
> +              - const: 2

If, as we discussed, the hardware does not support one lane operation (or
other lane configurations I presume), you don't need data-lanes property.

> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        addi9036: addi9036_tof@64 {
> +            compatible = "adi,addi9036";
> +            reg = <0x64>;
> +
> +            reset-gpios = <&gpio 41 1>;
> +
> +            port {
> +                addi9036_ep: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.28.0
> 

-- 
Sakari Ailus
