Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544B14B37EA
	for <lists+linux-media@lfdr.de>; Sat, 12 Feb 2022 21:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbiBLUdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Feb 2022 15:33:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbiBLUdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Feb 2022 15:33:52 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6336C606E4;
        Sat, 12 Feb 2022 12:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644698028; x=1676234028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EBrd0ZO3+EMKbYddHerk/GJ5xlH80dDNsJJiNwg6+dU=;
  b=idlFO4Yroh84WlO/2zH9TsQvYilBE3mnRNefk2zYMq9We1zKL+q5pSO2
   JVPhtysSYTeQ0Hx3f9GuLNqOB0+606OrlDoGhT15DdrMm7+5UmkQDZ9A6
   lBvB3rdvfpXVjRPoYgCmL6O5BOxQLHCC4Bly/MjyQrTuarZ1hMNYWRnoi
   oOOyiJzvK0VzGClW7dGWg+k/KINpxvqN7af4R03UeQY3XAWH0ENPTKb0l
   YFqTEWC467mubK1XQO9qk9MNaU89aT20JeF52qzmCOANPuwdxOTmSsAe2
   5CpmfR9hYQF3/sVP2VZIBm8vzKAE4phTTkN1LbJY73FcOctviY9jcYKE7
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10256"; a="249849156"
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; 
   d="scan'208";a="249849156"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2022 12:33:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; 
   d="scan'208";a="537937575"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2022 12:33:46 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0ED4D20452;
        Sat, 12 Feb 2022 22:33:44 +0200 (EET)
Date:   Sat, 12 Feb 2022 22:33:44 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: media: i2c: Add MT9M114
 camera sensor binding
Message-ID: <YggZqM81nCJcv4vZ@paasikivi.fi.intel.com>
References: <20220207012055.15158-1-laurent.pinchart@ideasonboard.com>
 <20220207012055.15158-2-laurent.pinchart@ideasonboard.com>
 <YgKfdR72TNavj68v@paasikivi.fi.intel.com>
 <YgK6xAgAVHUSsQND@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgK6xAgAVHUSsQND@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Feb 08, 2022 at 08:47:32PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tue, Feb 08, 2022 at 06:51:01PM +0200, Sakari Ailus wrote:
> > On Mon, Feb 07, 2022 at 03:20:54AM +0200, Laurent Pinchart wrote:
> > > Add device tree binding for the onsemi MT9M114 CMOS camera sensor.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > > 
> > > - Use graph schema
> > > - Drop unneeded properties
> > > - Rename ON Semiconductor to onsemi
> > > ---
> > >  .../bindings/media/i2c/onnn,mt9m114.yaml      | 110 ++++++++++++++++++
> > >  MAINTAINERS                                   |   7 ++
> > >  2 files changed, 117 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > new file mode 100644
> > > index 000000000000..55b67833f9a1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > @@ -0,0 +1,110 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: onsemi 1/6-inch 720p CMOS Digital Image Sensor
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > +
> > > +description: |-
> > > +  The onsemi MT9M114 is a 1/6-inch 720p (1.26 Mp) CMOS digital image sensor
> > > +  with an active pixel-array size of 1296H x 976V. It is programmable through
> > > +  an I2C interface and outputs image data over a 8-bit parallel or 1-lane MIPI
> > > +  CSI-2 connection.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: onnn,mt9m114
> > > +
> > > +  reg:
> > > +    description: I2C device address
> > > +    enum:
> > > +      - 0x48
> > > +      - 0x5d
> > > +
> > > +  clocks:
> > > +    description: EXTCLK clock signal
> > > +    maxItems: 1
> > > +
> > > +  vdd-supply:
> > > +    description:
> > > +      Core digital voltage supply, 1.8V
> > > +
> > > +  vddio-supply:
> > > +    description:
> > > +      I/O digital voltage supply, 1.8V or 2.8V
> > > +
> > > +  vaa-supply:
> > > +    description:
> > > +      Analog voltage supply, 2.8V
> > > +
> > > +  reset-gpios:
> > > +    description: |-
> > > +      Reference to the GPIO connected to the RESET_BAR pin, if any (active
> > > +      low).
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        additionalProperties: false
> > > +
> > > +        properties:
> > > +          bus-type:
> > > +            enum: [4, 5, 6]
> > 
> > With bus-type 5, shouldn't you have the parallel interface sync signal
> > polarity properties? Possibly also others if the hardware supports them.
> 
> As far as I can tell, the hardware has fixed polarities for all signals.
> Both hsync and vsync (called LINE_VALID and FRAME_VALID here) are active
> high.

Right, then you won't need these.

What about the link-frequencies property?

> 
> > > +
> > > +          remote-endpoint: true
> > > +
> > > +          # The number and mapping of lanes (for CSI-2), and the bus width and
> > > +          # signal polarities (for parallel and BT.656) are fixed and must not
> > > +          # be specified.
> > > +
> > > +        required:
> > > +          - bus-type
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - vdd-supply
> > > +  - vddio-supply
> > > +  - vaa-supply
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    i2c0 {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        sensor@48 {
> > > +            compatible = "onnn,mt9m114";
> > > +            reg = <0x48>;
> > > +
> > > +            clocks = <&clk24m 0>;
> > > +
> > > +            reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
> > > +
> > > +            vddio-supply = <&reg_cam_1v8>;
> > > +            vdd-supply = <&reg_cam_1v8>;
> > > +            vaa-supply = <&reg_2p8v>;
> > > +
> > > +            port {
> > > +                endpoint {
> > > +                    bus-type = <4>;
> > > +                    remote-endpoint = <&mipi_csi_in>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index f41088418aae..e9919a359c12 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -13096,6 +13096,13 @@ T:	git git://linuxtv.org/media_tree.git
> > >  F:	drivers/media/i2c/mt9m032.c
> > >  F:	include/media/i2c/mt9m032.h
> > >  
> > > +MT9M114 ONSEMI SENSOR DRIVER
> > > +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > +L:	linux-media@vger.kernel.org
> > > +S:	Maintained
> > > +T:	git git://linuxtv.org/media_tree.git
> > > +F:	Documentation/devicetree/bindings/media/i2c.onnn,mt9m114.yaml
> > > +
> > >  MT9P031 APTINA CAMERA SENSOR
> > >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >  L:	linux-media@vger.kernel.org
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
