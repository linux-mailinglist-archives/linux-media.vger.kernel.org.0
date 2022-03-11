Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17394D622D
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 14:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348821AbiCKNOu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 08:14:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348820AbiCKNOt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 08:14:49 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AB21C1EED
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 05:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647004426; x=1678540426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=giZ7IIMZ/GZXM+3ttowFGvT3pPSzWAlrMhg8Vf7c8so=;
  b=AK/DtCONhKAAg/izVqEx3wBNMnodM8Fge9+T8XXaa+H1MF12z3lqHfEU
   8ZnRaiqmkbepTwqdqGc8+a8nzzrxNsuFxpyimz/p8cLjIHFsPIgwQeb4Y
   91exs8kpqpOJ0+UT4T1TYTHWpl9v+zRx9+xlB/4K2erBNekdDdw+IKQzw
   fWIo+P1/RngeFjduUuq78jcjrU/Sv9Yra7sYLMHMxGNtn+InuZhe68ivq
   tIlcWKTsXDAOsThEoRHyZRD8GWgTXaQJesYw7YkEyRRyuxRmFzdA6kGGD
   oepZYr5uN8t9FQNv76TAtPkv5bLYcw3iO1dCtkkGtG7LJsvfijHtn0nz1
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255518687"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="255518687"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:13:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="781860586"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:13:43 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 8C0EC2036B;
        Fri, 11 Mar 2022 15:13:11 +0200 (EET)
Date:   Fri, 11 Mar 2022 15:13:11 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        alain.volmat@foss.st.com, hugues.fruchet@foss.st.com,
        sylvain.petinot@foss.st.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Add ST VGXY61 camera
 sensor binding
Message-ID: <YitK59bd7D0jF0qd@paasikivi.fi.intel.com>
References: <20220310133255.1946530-1-benjamin.mugnier@foss.st.com>
 <20220310133255.1946530-2-benjamin.mugnier@foss.st.com>
 <CAPY8ntBBrdYBUHk1qzy6Z3xAZbaP5jtnS6CGM=RoyhzrLhJm+A@mail.gmail.com>
 <20abde54-4a26-98fe-f0fb-de51ad1be6c8@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20abde54-4a26-98fe-f0fb-de51ad1be6c8@foss.st.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, Mar 11, 2022 at 12:25:38PM +0100, Benjamin Mugnier wrote:
> Hi Dave,
> 
> Thank you for your review.
> 
> On 10/03/2022 16:38, Dave Stevenson wrote:
> > Hi Benjamin
> > 
> > cc Laurent and Sakari as maintainers of video-interfaces.yaml
> > 
> > On Thu, 10 Mar 2022 at 13:37, Benjamin Mugnier
> > <benjamin.mugnier@foss.st.com> wrote:
> >>
> >> Add device tree binding for the ST VGXY61 camera sensor, and update
> >> MAINTAINERS file.
> >>
> >> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >> ---
> >>  .../bindings/media/i2c/st,st-vgxy61.yaml      | 134 ++++++++++++++++++
> >>  MAINTAINERS                                   |  10 ++
> >>  2 files changed, 144 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> >> new file mode 100644
> >> index 000000000000..8740ed2623e4
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> >> @@ -0,0 +1,134 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +# Copyright (c) 2022 STMicroelectronics SA.
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/i2c/st,st-vgxy61.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: STMicroelectronics VGxy61 HDR Global Shutter Sensor Family Device Tree Bindings
> >> +
> >> +maintainers:
> >> +  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >> +  - Sylvain Petinot <sylvain.petinot@foss.st.com>
> >> +
> >> +description: |-
> >> +  STMicroelectronics VGxy61 family has a CSI-2 output port. CSI-2 output is a
> >> +  quad lanes 800Mbps per lane.
> >> +  Supported formats are RAW8, RAW10, RAW12, RAW14 and RAW16.
> >> +  Following part number are supported
> >> +  - VG5661 and VG6661 are 1.6 Mpx (1464 x 1104) monochrome and color sensors.
> >> +  Maximum frame rate is 75 fps.
> >> +  - VG5761 and VG6761 are 2.3 Mpx (1944 x 1204) monochrome and color sensors.
> >> +  Maximum frame rate is 60 fps.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: st,st-vgxy61
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +    description:
> >> +      Input clock for the sensor.
> >> +    items:
> >> +      - const: xclk

Do you need this if you have a single clock?

Also see Documentation/driver-api/media/camera-sensor.rst .

> >> +
> >> +  VCORE-supply:
> >> +    description:
> >> +      Sensor digital core supply. Must be 1.2 volts.
> >> +
> >> +  VDDIO-supply:
> >> +    description:
> >> +      Sensor digital IO supply. Must be 1.8 volts.
> >> +
> >> +  VANA-supply:
> >> +    description:
> >> +      Sensor analog supply. Must be 2.8 volts.
> >> +
> >> +  reset-gpios:
> >> +    description:
> >> +      Reference to the GPIO connected to the reset pin, if any.
> >> +      This is an active low signal to the vgxy61.
> >> +
> >> +  invert-gpios-polarity:
> >> +    description:
> >> +      If gpios polarity should be inversed
> > 
> > s/inversed/inverted
> > 
> 
> Ok.
> 
> >> +    type: boolean
> >> +
> >> +  slave-mode:
> >> +    description:
> >> +      If the sensor operates in slave mode
> >> +    type: boolean
> > 
> > This is one I've been meaning to raise for a while.
> > Is DT the correct place to be configuring hardware sync options for
> > image sensors? (There may be the linguistic discussions over master /
> > slave terminology too).
> > We also have IMX477 and a number of other sensors that support
> > external sync control of some form.
> > 
> > As I see it, there are nominally 3 settings - disabled (reduces EMC
> > noise), generate syncs, and receive syncs.
> > For test purposes it would be useful to be able to switch between
> > generate and receive modes at runtime, so that would make it a control
> > instead of being fixed in DT.
> > 
> > If it should be configured in DT, then how does ACPI need to handle it?
> > 
> > If DT is the correct place to define the role, should it be in
> > video-interfaces.yaml as an optional property, instead of being a
> > sensor specific binding?
> > 
> > Sorry, more questions rather than answers.
> > 
> >   Dave
> 
> Maybe I can provide additional info on this sensor to help find an
> answer. The "slave mode" has 2 settings: enabled or disabled. If disabled
> you are in master mode ('generate sync' and 'disabled' modes Dave
> mentionned, they are the same here), and if enabled you are in slave mode
> ('receive sync'). As you said he master sends frame sync signals to the
> slave each frame acquired, this allows both sensors to synchronize
> themselves.
> 
> I put this in the device tree as we only use it for 3D stereocam boards
> which already have 2 sensors on them, meaning this is hardware specific.
> I don't have any use case where we manually wire 2 sensors on 2 separate
> boards. One good point you mentioned is that I may not always want run
> this board in master/slaver, and both sensors could run on master mode
> without interacting with each other, thus justifying a dedicated v4l2
> control.
> 
> Any ideas on how to name it instead of "slave mode" for coherency between
> sensors?

How is this wired? The slave-mode property documentation explicitly refers
to synchronisation signals that do not exists in CSI-2.

> 
> 
> Regard,
> 
> Benjamin
> 
> > 
> >> +    #TODO check all this or copy from elsewhere
> 
> Just noticed this and will remove it.
> 
> >> +  port:
> >> +    $ref: /schemas/graph.yaml#/$defs/port-base
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      endpoint:
> >> +        $ref: /schemas/media/video-interfaces.yaml#
> >> +        unevaluatedProperties: false
> >> +
> >> +        properties:
> >> +          clock-lane:
> >> +            description:
> >> +              Clock lane index
> >> +            maxItems: 1

Does the device support lane reordering? If not, please drop.

> >> +
> >> +          data-lanes:
> >> +            description:
> >> +              CSI lanes to use
> >> +            items:
> >> +              - const: 1
> >> +              - const: 2
> >> +              - const: 3
> >> +              - const: 4

Which lane configurations does the device support? If it's four lanes only,
then you can drop this property, too.

> >> +
> >> +          remote-endpoint: true
> >> +
> >> +        required:
> >> +          - clock-lane
> >> +          - data-lanes
> >> +          - remote-endpoint

Listing remote-endpoint here isn't needed as this comes from the schema.

> >> +
> >> +required:
> >> +  - compatible
> >> +  - clocks
> >> +  - clock-names
> >> +  - VCORE-supply
> >> +  - VDDIO-supply
> >> +  - VANA-supply
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/gpio/gpio.h>
> >> +    i2c {
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +        vgxy61: csi2tx@10 {
> >> +            compatible = "st,st-vgxy61";
> >> +            reg = <0x10>;
> >> +            status = "okay";
> >> +            clocks = <&clk_ext_camera>;
> >> +            clock-names = "xclk";
> >> +            VCORE-supply = <&v1v2>;
> >> +            VDDIO-supply = <&v1v8>;
> >> +            VANA-supply = <&v2v8>;
> >> +            reset-gpios = <&mfxgpio 18 GPIO_ACTIVE_LOW>;
> >> +            port {
> >> +                ep0: endpoint {
> >> +                    clock-lane = <0>;
> >> +                    data-lanes = <1 2 3 4>;
> >> +                    remote-endpoint = <&mipi_csi2_out>;
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> >> +...
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 83d27b57016f..f358d15f68a0 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -18297,6 +18297,16 @@ S:     Maintained
> >>  F:     Documentation/hwmon/stpddc60.rst
> >>  F:     drivers/hwmon/pmbus/stpddc60.c
> >>
> >> +ST VGXY61 DRIVER
> >> +M:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >> +M:     Sylvain Petinot <sylvain.petinot@foss.st.com>
> >> +L:     linux-media@vger.kernel.org
> >> +S:     Maintained
> >> +T:     git git://linuxtv.org/media_tree.git
> >> +F:     Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.txt
> >> +F:     drivers/media/i2c/st-vgxy61.c
> >> +

Extra newline.

> >> +
> >>  ST VL53L0X ToF RANGER(I2C) IIO DRIVER
> >>  M:     Song Qiang <songqiang1304521@gmail.com>
> >>  L:     linux-iio@vger.kernel.org
> >> --
> >> 2.25.1
> >>

-- 
Kind regards,

Sakari Ailus
