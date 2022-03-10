Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07FDC4D4CF6
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 16:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241596AbiCJPji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 10:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240471AbiCJPjg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 10:39:36 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F97AE98DD
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 07:38:34 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id bg10so12975351ejb.4
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 07:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TsZgoOa2WNZhBuECeS74fS9Pbts81/sTYpwx9AN90QE=;
        b=gEJ4J88AfuWxg7xXbEHf6P/gk0taKkvYSAeY2fwuHpbVmmHwi137SX5r9d7rxvsGBH
         Qlzw6C5rDn8XWVeR5Ti27P6Hi+VYySim7vNvGVlGPiQ7za20NRQdtx+AwZsSlkXnoI2N
         u4S9xnn9xQ6u8GWngVP8g/pfIOIG3NYvK/+tNKD+WPOybikz02SQLOzjYrYi0fwSx3Rv
         9oadMjNc8eSXq2PJnw9k2elGbb0Fr4BAy1ANKMi8pIZWowt7AiVhFJbEcJbB0zuplbsG
         Zrne1eU04zWOelOYtSLNAmPH0n+DX2wKR5W2ZFB3wNUokxa681sXAB40oMAgkVWvNNH4
         nQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TsZgoOa2WNZhBuECeS74fS9Pbts81/sTYpwx9AN90QE=;
        b=oRPJKzsXslYWcGc4IUFSa3oulTGl+FfmA7+8+hPnr7nw6KbMieTjvQrtYhmIRiXZ9D
         1AuKMIQcWWm+mAxDyMQfdluov3r0qTec57D+6KUt8x9vfSvS+WOdheSoW22y8Q5emlaK
         nDjlovcoG24Nya8M7f+8AJUppJbxeJv3OgDdVeaGp2Ee2zhPOOSyhq+ASrug7jc8VrAX
         uXeDJBjRFJOHjCG3UYgxiQjFApdBUvKxFh8DSJTE43Arj6Zs8q9khs10AQPZejBnYcqi
         /Qv3XJwJvE0Bh6Ke3OjXC5mmptY2u8v6U4gmsps38VUlLdSWm+aSBeh3nH5/UYX8mWlo
         H1/w==
X-Gm-Message-State: AOAM533z1ndMXa2W3xaugjQE5lpQopc3GYpdsQaFTL2VKhKb/UYMeJhP
        Fq8riuZdRfdolJZfgvEPSzDUlCWBZu48tPQPLp80kCx5nAd8Og==
X-Google-Smtp-Source: ABdhPJzCEz3z7U7f+Xpcv/tDVHR/ZHlfVOEtYQ70e9xETqxodhUeOZn3OtBNS2KSdrVODkRPUd+K7BoTXdWNQ24WMY4=
X-Received: by 2002:a17:906:9b96:b0:6db:572c:7c33 with SMTP id
 dd22-20020a1709069b9600b006db572c7c33mr4769170ejc.175.1646926712928; Thu, 10
 Mar 2022 07:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20220310133255.1946530-1-benjamin.mugnier@foss.st.com> <20220310133255.1946530-2-benjamin.mugnier@foss.st.com>
In-Reply-To: <20220310133255.1946530-2-benjamin.mugnier@foss.st.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 10 Mar 2022 15:38:16 +0000
Message-ID: <CAPY8ntBBrdYBUHk1qzy6Z3xAZbaP5jtnS6CGM=RoyhzrLhJm+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Add ST VGXY61 camera
 sensor binding
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        alain.volmat@foss.st.com, hugues.fruchet@foss.st.com,
        sylvain.petinot@foss.st.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin

cc Laurent and Sakari as maintainers of video-interfaces.yaml

On Thu, 10 Mar 2022 at 13:37, Benjamin Mugnier
<benjamin.mugnier@foss.st.com> wrote:
>
> Add device tree binding for the ST VGXY61 camera sensor, and update
> MAINTAINERS file.
>
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  .../bindings/media/i2c/st,st-vgxy61.yaml      | 134 ++++++++++++++++++
>  MAINTAINERS                                   |  10 ++
>  2 files changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> new file mode 100644
> index 000000000000..8740ed2623e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> @@ -0,0 +1,134 @@
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
> +  clock-names:
> +    description:
> +      Input clock for the sensor.
> +    items:
> +      - const: xclk
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
> +  invert-gpios-polarity:
> +    description:
> +      If gpios polarity should be inversed

s/inversed/inverted

> +    type: boolean
> +
> +  slave-mode:
> +    description:
> +      If the sensor operates in slave mode
> +    type: boolean

This is one I've been meaning to raise for a while.
Is DT the correct place to be configuring hardware sync options for
image sensors? (There may be the linguistic discussions over master /
slave terminology too).
We also have IMX477 and a number of other sensors that support
external sync control of some form.

As I see it, there are nominally 3 settings - disabled (reduces EMC
noise), generate syncs, and receive syncs.
For test purposes it would be useful to be able to switch between
generate and receive modes at runtime, so that would make it a control
instead of being fixed in DT.

If it should be configured in DT, then how does ACPI need to handle it?

If DT is the correct place to define the role, should it be in
video-interfaces.yaml as an optional property, instead of being a
sensor specific binding?

Sorry, more questions rather than answers.

  Dave

> +    #TODO check all this or copy from elsewhere
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
> +          clock-lane:
> +            description:
> +              Clock lane index
> +            maxItems: 1
> +
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
> +          - clock-lane
> +          - data-lanes
> +          - remote-endpoint
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - VCORE-supply
> +  - VDDIO-supply
> +  - VANA-supply
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
> +            status = "okay";
> +            clocks = <&clk_ext_camera>;
> +            clock-names = "xclk";
> +            VCORE-supply = <&v1v2>;
> +            VDDIO-supply = <&v1v8>;
> +            VANA-supply = <&v2v8>;
> +            reset-gpios = <&mfxgpio 18 GPIO_ACTIVE_LOW>;
> +            port {
> +                ep0: endpoint {
> +                    clock-lane = <0>;
> +                    data-lanes = <1 2 3 4>;
> +                    remote-endpoint = <&mipi_csi2_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83d27b57016f..f358d15f68a0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18297,6 +18297,16 @@ S:     Maintained
>  F:     Documentation/hwmon/stpddc60.rst
>  F:     drivers/hwmon/pmbus/stpddc60.c
>
> +ST VGXY61 DRIVER
> +M:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +M:     Sylvain Petinot <sylvain.petinot@foss.st.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +T:     git git://linuxtv.org/media_tree.git
> +F:     Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.txt
> +F:     drivers/media/i2c/st-vgxy61.c
> +
> +
>  ST VL53L0X ToF RANGER(I2C) IIO DRIVER
>  M:     Song Qiang <songqiang1304521@gmail.com>
>  L:     linux-iio@vger.kernel.org
> --
> 2.25.1
>
