Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 858085F6DFD
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 21:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbiJFTPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 15:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbiJFTPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 15:15:16 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6A29379F
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 12:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665083714; x=1696619714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zVh+A20dg7SCBK/cR4MPGUkhBu/gCcyjg1nv7njzWKE=;
  b=XaOkP9m0M0CdTJTNqSiZP8sjJjpxA39bBKCoYHaiaJHc9+7aRWhVVCv4
   3PWPNaJteTqQntoT7jIi19P3TK3rgYuX5oyIoMH44mw0NRUAoqpxhQXok
   MklgDYPcQ59KXBj3RtKBjIzfHk+uX8CVLnnXae3DTSWqtxwspeNDl+EbU
   FgdPQdiC/QnY1NSegPO4zI5pnUxJdkxVkDxxjEqyit+dSGA4ZnYpX3yf4
   51wh/a5KWlKH8KldGZIwEdC18kMYQ1SuelPh2hRJrvWFCiYOKJAuSP7Pe
   fHokkXuK6ICKeJDki+9vQ5QlO3aePWzEtcXmZqemJFkr7x44y+NSPzv3J
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="301143819"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="301143819"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 12:15:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="624847652"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="624847652"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 12:15:11 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E857520274;
        Thu,  6 Oct 2022 22:15:08 +0300 (EEST)
Date:   Thu, 6 Oct 2022 19:15:08 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v6 3/4] media: dt-bindings: media: i2c: Add ST VGXY61
 camera sensor binding
Message-ID: <Yz8pPJgqt9pcfSbp@paasikivi.fi.intel.com>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-4-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927083702.14138-4-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Tue, Sep 27, 2022 at 10:37:01AM +0200, Benjamin Mugnier wrote:
> Add device tree binding for the ST VGXY61 camera sensor, and update
> MAINTAINERS file.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  .../bindings/media/i2c/st,st-vgxy61.yaml      | 112 ++++++++++++++++++
>  MAINTAINERS                                   |   9 ++
>  2 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> new file mode 100644
> index 000000000000..652170367675
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2022 STMicroelectronics SA.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/st,st-vgxy61.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics VGxy61 HDR Global Shutter Sensor Family Device Tree Bindings
> +
> +maintainers:
> +  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +  - Sylvain Petinot <sylvain.petinot@foss.st.com>
> +
> +description: |-
> +  STMicroelectronics VGxy61 family has a CSI-2 output port. CSI-2 output is a
> +  quad lanes 800Mbps per lane.
> +  Supported formats are RAW8, RAW10, RAW12, RAW14 and RAW16.
> +  Following part number are supported
> +  - VG5661 and VG6661 are 1.6 Mpx (1464 x 1104) monochrome and color sensors.
> +  Maximum frame rate is 75 fps.
> +  - VG5761 and VG6761 are 2.3 Mpx (1944 x 1204) monochrome and color sensors.
> +  Maximum frame rate is 60 fps.
> +
> +properties:
> +  compatible:
> +    const: st,st-vgxy61
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  VCORE-supply:
> +    description:
> +      Sensor digital core supply. Must be 1.2 volts.
> +
> +  VDDIO-supply:
> +    description:
> +      Sensor digital IO supply. Must be 1.8 volts.
> +
> +  VANA-supply:
> +    description:
> +      Sensor analog supply. Must be 2.8 volts.
> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the reset pin, if any.
> +      This is an active low signal to the vgxy61.
> +
> +  st,strobe-gpios-polarity:
> +    description:
> +      Invert polarity of strobe GPIOs.
> +    type: boolean

This was probably intended to be left out of this version?

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            description:
> +              CSI lanes to use
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +          remote-endpoint: true
> +
> +        required:
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - clocks
> +  - VCORE-supply
> +  - VDDIO-supply
> +  - VANA-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        vgxy61: csi2tx@10 {
> +            compatible = "st,st-vgxy61";
> +            reg = <0x10>;
> +            clocks = <&clk_ext_camera>;
> +            VCORE-supply = <&v1v2>;
> +            VDDIO-supply = <&v1v8>;
> +            VANA-supply = <&v2v8>;
> +            reset-gpios = <&mfxgpio 18 GPIO_ACTIVE_LOW>;
> +            port {
> +                ep0: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    remote-endpoint = <&mipi_csi2_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a58f1fc6dd47..2e855bfdfeb7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19278,6 +19278,15 @@ S:	Maintained
>  F:	Documentation/hwmon/stpddc60.rst
>  F:	drivers/hwmon/pmbus/stpddc60.c
>  
> +ST VGXY61 DRIVER
> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> +F:	drivers/media/i2c/st-vgxy61.c
> +
>  ST VL53L0X ToF RANGER(I2C) IIO DRIVER
>  M:	Song Qiang <songqiang1304521@gmail.com>
>  L:	linux-iio@vger.kernel.org

-- 
Kind regards,

Sakari Ailus
