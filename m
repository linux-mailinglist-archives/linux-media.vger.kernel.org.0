Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F301C6F26
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 13:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgEFLVo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 07:21:44 -0400
Received: from mga09.intel.com ([134.134.136.24]:18441 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725824AbgEFLVn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 07:21:43 -0400
IronPort-SDR: u7WjnHpzUI9yj5LXyc230cAoR96P/KmIts9jyS/aK257fEPQKIaUoOJaL+yswxQe7CGWmXhEvl
 kZl9kU8sPxUg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 04:21:43 -0700
IronPort-SDR: t6fBvg1qD9timBapcEHbs/9FlgJYCTMxVzSSsZrrxSppL5QxxscvZ9SAIBneDJ6A073f7Ni0gz
 slXsh7Mvorxg==
X-IronPort-AV: E=Sophos;i="5.73,358,1583222400"; 
   d="scan'208";a="407210944"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 04:21:38 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 89C1F20885; Wed,  6 May 2020 14:21:36 +0300 (EEST)
Date:   Wed, 6 May 2020 14:21:36 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org,
        matrix.zhu@aliyun.com, tfiga@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200506112136.GV9190@paasikivi.fi.intel.com>
References: <20200430080924.1140-1-dongchun.zhu@mediatek.com>
 <20200430080924.1140-2-dongchun.zhu@mediatek.com>
 <20200505070451.GS9190@paasikivi.fi.intel.com>
 <1588688238.8804.150.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588688238.8804.150.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Tue, May 05, 2020 at 10:17:18PM +0800, Dongchun Zhu wrote:
> Hi Sakari,
> 
> Thanks for the review.
> 
> On Tue, 2020-05-05 at 10:04 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> > 
> > On Thu, Apr 30, 2020 at 04:09:23PM +0800, Dongchun Zhu wrote:
> > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > > 
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   7 +
> > >  2 files changed, 155 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > new file mode 100644
> > > index 0000000..2be4bd2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > @@ -0,0 +1,148 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +# Copyright (c) 2020 MediaTek Inc.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > +
> > > +description: |-
> > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > +  sensor output is available via CSI-2 serial data output.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ovti,ov02a10
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: top mux camtg clock
> > > +      - description: devider clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: eclk
> > > +      - const: freq_mux
> > > +
> > > +  clock-frequency:
> > > +    description:
> > > +      Frequency of the eclk clock in Hertz.
> > > +
> > > +  dovdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as interface power supply.
> > > +
> > > +  avdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as analog power supply.
> > > +
> > > +  dvdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as digital power supply.
> > > +
> > > +  powerdown-gpios:
> > > +    description:
> > > +      The phandle and specifier for the GPIO that controls sensor powerdown.
> > > +
> > > +  reset-gpios:
> > > +    description:
> > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > +
> > > +  rotation:
> > > +    description:
> > > +      Definition of the sensor's placement, valid values are 0 and 180.
> > > +    allOf:
> > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > +      - enum:
> > > +          - 0    # Sensor Mounted Upright
> > > +          - 180  # Sensor Mounted Upside Down
> > > +
> > > +  ovti,mipi-tx-speed:
> > > +    description:
> > > +      Indication of MIPI transmission speed select.
> > 
> > What exactly does this signify? And how do you come up with the number?
> > 
> 
> Apologies for not addressing this number clear.
> 
> From the datasheet, P1:0xA1 register represents TX_SPEED_AREA_SEL with
> the default val: 0x03.
> The description of this RW register is as below:
> Bit[2:0]: MIPI transmission speed select.
> 
> Thus the enum should be definited as [ 0, 1, 2, 3, 4, 5, 6, 7 ].
> This would be fixed in next release.
> 
> In the meantime, as the default val of P1:0xA1 is 0x03, we hope to keep
> that value if there is no setting for this private property in DT.
> The caller in driver would be updated like this in next release.
> if (ov02a10->mipi_clock_tx_speed)
> 	ret = i2c_smbus_write_byte_data(...,...);

How did you pick the value in the example? And why do you believe it is
specific to a platform, and not e.g. a sensor mode?

> 
> > > +    allOf:
> > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > +      - enum: [ 3, 4 ]
> > > +
> > > +  # See ../video-interfaces.txt for details
> > > +  port:
> > > +    type: object
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +        additionalProperties: false
> > > +
> > > +        properties:
> > > +          remote-endpoint: true
> > > +          link-frequencies: true
> > > +
> > > +    required:
> > > +      - endpoint
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - clock-frequency
> > > +  - dovdd-supply
> > > +  - avdd-supply
> > > +  - dvdd-supply
> > > +  - powerdown-gpios
> > > +  - reset-gpios
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/mt8183-clk.h>
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    i2c {
> > > +        clock-frequency = <400000>;
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        ov02a10: camera-sensor@3d {
> > > +            compatible = "ovti,ov02a10";
> > > +            reg = <0x3d>;
> > > +            pinctrl-names = "default";
> > > +            pinctrl-0 = <&clk_24m_cam>;
> > > +
> > > +            clocks = <&topckgen CLK_TOP_MUX_CAMTG>,
> > > +                     <&topckgen CLK_TOP_UNIVP_192M_D8>;
> > > +            clock-names = "eclk", "freq_mux";
> > > +            clock-frequency = <24000000>;
> > > +
> > > +            rotation = <180>;
> > > +            ovti,mipi-tx-speed = <3>;
> > > +
> > > +            dovdd-supply = <&mt6358_vcamio_reg>;
> > > +            avdd-supply = <&mt6358_vcama1_reg>;
> > > +            dvdd-supply = <&mt6358_vcn18_reg>;
> > > +            powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> > > +            reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> > > +
> > > +            port {
> > > +                wcam_out: endpoint {
> > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > +                    link-frequencies = /bits/ 64 <390000000>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index e64e5db..63a2335 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12389,6 +12389,13 @@ M:	Harald Welte <laforge@gnumonks.org>
> > >  S:	Maintained
> > >  F:	drivers/char/pcmcia/cm4040_cs.*
> > >  
> > > +OMNIVISION OV02A10 SENSOR DRIVER
> > > +M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > +L:	linux-media@vger.kernel.org
> > > +S:	Maintained
> > > +T:	git git://linuxtv.org/media_tree.git
> > > +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > +
> > >  OMNIVISION OV13858 SENSOR DRIVER
> > >  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> > >  L:	linux-media@vger.kernel.org
> > 
> 

-- 
Regards,

Sakari Ailus
