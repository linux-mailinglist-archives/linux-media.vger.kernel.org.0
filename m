Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E196C95DC3
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 13:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729670AbfHTLs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 07:48:56 -0400
Received: from mga11.intel.com ([192.55.52.93]:6862 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729421AbfHTLs4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 07:48:56 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Aug 2019 04:48:55 -0700
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; 
   d="scan'208";a="189841322"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Aug 2019 04:48:51 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 6A86820928; Tue, 20 Aug 2019 14:48:49 +0300 (EEST)
Date:   Tue, 20 Aug 2019 14:48:49 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
Message-ID: <20190820114849.GD5123@paasikivi.fi.intel.com>
References: <cover.b695c63cf668192aff5574a3005d483c601e77f6.1566300265.git-series.maxime.ripard@bootlin.com>
 <f490b35e62c5fd15174b5241ce1653e991c8fc9e.1566300265.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f490b35e62c5fd15174b5241ce1653e991c8fc9e.1566300265.git-series.maxime.ripard@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Tue, Aug 20, 2019 at 01:24:32PM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
> used in later (A10s, A13, A20, R8 and GR8) SoCs.
> 
> On some SoCs, like the A10, there's multiple instances of that controller,
> with one instance supporting more channels and having an ISP.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 107 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> new file mode 100644
> index 000000000000..9000bca344f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +description: |-
> +  The Allwinner A10 and later has a CMOS Sensor Interface to retrieve
> +  frames from a parallel or BT656 sensor.
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun7i-a20-csi0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The CSI interface clock
> +      - description: The CSI module clock
> +      - description: The CSI ISP clock
> +      - description: The CSI DRAM clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: isp
> +      - const: ram
> +
> +  resets:
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        properties:
> +          bus-width:
> +            const: 8
> +            description: Number of data lines actively used.

Are other values supported? If not, you could omit this.

> +
> +          data-active: true
> +          hsync-active: true
> +          pclk-sample: true
> +          remote-endpoint: true
> +          vsync-active: true
> +
> +        required:
> +          - bus-width
> +          - data-active
> +          - hsync-active
> +          - pclk-sample
> +          - remote-endpoint
> +          - vsync-active

Some of these are not allowed in the Bt.656 mode (vsync-active and
hsync-active) while they're required in Bt.601 mode. Is there a way to tell
that in YAML-based bindings?

Similarly, video-interfaces.txt should be referenced from here, shouldn't
it?

> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun7i-a20-ccu.h>
> +    #include <dt-bindings/reset/sun4i-a10-ccu.h>
> +
> +    csi0: csi@1c09000 {
> +        compatible = "allwinner,sun7i-a20-csi0";
> +        reg = <0x01c09000 0x1000>;
> +        interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
> +                 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> +        clock-names = "bus", "mod", "isp", "ram";
> +        resets = <&ccu RST_CSI0>;
> +
> +        port {
> +            csi_from_ov5640: endpoint {
> +                remote-endpoint = <&ov5640_to_csi>;
> +                bus-width = <8>;
> +                hsync-active = <1>; /* Active high */
> +                vsync-active = <0>; /* Active low */
> +                data-active = <1>;  /* Active high */
> +                pclk-sample = <1>;  /* Rising */
> +            };
> +        };
> +    };
> +
> +...

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
