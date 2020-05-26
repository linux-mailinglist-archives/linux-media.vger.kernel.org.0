Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE381C5936
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 16:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730438AbgEEOXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 10:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729159AbgEEOXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 10:23:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BF1C061A0F;
        Tue,  5 May 2020 07:23:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3496542;
        Tue,  5 May 2020 16:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588688588;
        bh=o9XBryszfLjcdNfnhm4K72ACxPUcF32BHIiyzpCtRXk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a5OhINFDijEKPh7+LwVYminuwVz8mCfmN73Sa5/NUlFUUhUwWJbnjGNpxN+FEt73z
         5Bg9kqVCfx4iMAhMZTLt4AOgdA2o9tvKaF1L7j15UPyO3l+mkLk4r8fSfF7/Jdl9HT
         d9P2XqQllLIFPXkOkTA/SkXok2px8JT68AWw0aRk=
Date:   Tue, 5 May 2020 17:23:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, hans.verkuil@cisco.com,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v12 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Message-ID: <20200505142302.GA19432@pendragon.ideasonboard.com>
References: <20200423153038.106453-1-vishal.sagar@xilinx.com>
 <20200423153038.106453-2-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200423153038.106453-2-vishal.sagar@xilinx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

Thank you for the patch.

On Thu, Apr 23, 2020 at 09:00:37PM +0530, Vishal Sagar wrote:
> Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.
> 
> The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller, a
> D-PHY in Rx mode and a Video Format Bridge.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> v12
> - Moved to yaml format
> - Update CSI-2 and D-PHY
> - Mention that bindings for D-PHY not here
> - reset -> video-reset
> 
> v11
> - Modify compatible string from 4.0 to 5.0
> 
> v10
> - No changes
> 
> v9
> - Fix xlnx,vfb description.
> - s/Optional/Required endpoint property.
> - Move data-lanes description from Ports to endpoint property section.
> 
> v8
> - Added reset-gpios optional property to assert video_aresetn
> 
> v7
> - Removed the control name from dt bindings
> - Updated the example dt node name to csi2rx
> 
> v6
> - Added "control" after V4L2_CID_XILINX_MIPICSISS_ACT_LANES as suggested by Luca
> - Added reviewed by Rob Herring
> 
> v5
> - Incorporated comments by Luca Cersoli
> - Removed DPHY clock from description and example
> - Removed bayer pattern from device tree MIPI CSI IP
>   doesn't deal with bayer pattern.
> 
> v4
> - Added reviewed by Hyun Kwon
> 
> v3
> - removed interrupt parent as suggested by Rob
> - removed dphy clock
> - moved vfb to optional properties
> - Added required and optional port properties section
> - Added endpoint property section
> 
> v2
> - updated the compatible string to latest version supported
> - removed DPHY related parameters
> - added CSI v2.0 related property (including VCX for supporting upto 16
>   virtual channels).
> - modified csi-pxl-format from string to unsigned int type where the value
>   is as per the CSI specification
> - Defined port 0 and port 1 as sink and source ports.
> - Removed max-lanes property as suggested by Rob and Sakari
>  .../bindings/media/xilinx/xlnx,csi2rxss.yaml  | 215 ++++++++++++++++++
>  1 file changed, 215 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> new file mode 100644
> index 000000000000..365084e27f7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> @@ -0,0 +1,215 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/xilinx/xlnx,csi2rxss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx MIPI CSI-2 Receiver Subsystem
> +
> +maintainers:
> +  - Vishal Sagar <vishal.sagar@xilinx.com>
> +
> +description: |
> +  The Xilinx MIPI CSI-2 Receiver Subsystem is used to capture MIPI CSI-2
> +  traffic from compliant camera sensors and send the output as AXI4 Stream
> +  video data for image processing.
> +  The subsystem consists of a MIPI D-PHY in slave mode which captures the
> +  data packets. This is passed along the MIPI CSI-2 Rx IP which extracts the
> +  packet data. The optional Video Format Bridge (VFB) converts this data to
> +  AXI4 Stream video data.
> +  For more details, please refer to PG232 Xilinx MIPI CSI-2 Receiver Subsystem.
> +  Please note that this bindings includes only the MIPI CSI-2 Rx controller
> +  and Video Format Bridge and not D-PHY.

How should the D-PHY be handled, when DPY_EN_REG_IF is set to true ?

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - xlnx,mipi-csi2-rx-subsystem-5.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: List of clock specifiers
> +    items:
> +      - description: AXI Lite clock
> +      - description: Video clock
> +
> +  clock-names:
> +    items:
> +      - const: lite_aclk
> +      - const: video_aclk
> +
> +  xlnx,csi-pxl-format:
> +    description: |
> +      This denotes the CSI Data type selected in hw design.
> +      Packets other than this data type (except for RAW8 and
> +      User defined data types) will be filtered out.
> +      Possible values are as below -
> +      0x1e - YUV4228B
> +      0x1f - YUV42210B
> +      0x20 - RGB444
> +      0x21 - RGB555
> +      0x22 - RGB565
> +      0x23 - RGB666
> +      0x24 - RGB888
> +      0x28 - RAW6
> +      0x29 - RAW7
> +      0x2a - RAW8
> +      0x2b - RAW10
> +      0x2c - RAW12
> +      0x2d - RAW14
> +      0x2e - RAW16
> +      0x2f - RAW20
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f]

This could also be written

    allOf:
      - $ref: /schemas/types.yaml#/definitions/uint32
      - anyOf:
        - minimum: 0x1e
          maximum: 0x24
        - minimum: 0x28
          maximum: 0x2f

if you want to make it a bit more compact (in the number of values, not
the number of lines obviously), up to you.

I will also quote the question (and your answer) from the previous
version:

> > Isn't this property required only when the VFB is present ?
>
> This will be present irrespective of VFB being enabled.
> With VFB, the data on the bus will be as per Xilinx UG934 which is similar to media bus formats.
>
> Without VFB, it will just be plain data as it comes in data packets. Refer to the Xilinx PG 232
> "Pixel Packing When Video Format Bridge is Not Present"
>
> So the driver is currently made to load only in case VFB is enabled.

I understand that the driver doesn't support the case where the VFB is
disabled, but the DT bindings shouldn't care about that. The document of
v4.1 of the subsystem states that the width of the video_out port is
then selected under "CSI-2 Options TDATA width" (page 11). I however
don't such such an option described on pages 55 or 56, but there's an
AXIS_TDATA_WIDTH parameter on page 61.

Is the pixel format relevant when the VFB is disabled ?

> +
> +  xlnx,vfb:
> +    type: boolean
> +    description: Present when Video Format Bridge is enabled in IP configuration
> +
> +  xlnx,en-csi-v2-0:
> +    type: boolean
> +    description: Present if CSI v2 is enabled in IP configuration.
> +
> +  xlnx,en-vcx:
> +    type: boolean
> +    description: |
> +      When present, there are maximum 16 virtual channels, else
> +      only 4. This is present only if xlnx,en-csi-v2-0 is present.

The last sentence should be removed, and replaced with

if:
  not:
    required:
      - xlnx,en-csi-v2-0
then:
  properties:
    xlnx,en-vcx: false

(to be placed after required: and before additionalProperties:).

> +
> +  xlnx,en-active-lanes:
> +    type: boolean
> +    description: |
> +      Present if the number of active lanes can be re-configured at
> +      runtime in the Protocol Configuration Register. Otherwise all lanes,
> +      as set in IP configuration, are always active.
> +
> +  video-reset-gpios:
> +    description: Optional specifier for a GPIO that asserts video_aresetn.
> +    maxItems: 1
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Input / sink port node, single endpoint describing the
> +          CSI-2 transmitter.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +
> +              data-lanes:
> +                description: |
> +                  This is required only in the sink port 0 endpoint which
> +                  connects to MIPI CSI-2 source like sensor.
> +                  The possible values are -
> +                  1       - For 1 lane enabled in IP.
> +                  1 2     - For 2 lanes enabled in IP.
> +                  1 2 3   - For 3 lanes enabled in IP.
> +                  1 2 3 4 - For 4 lanes enabled in IP.
> +                items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Output / source port node, endpoint describing modules
> +          connected the CSI-2 receiver.
> +
> +        properties:
> +
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - xlnx,csi-pxl-format
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    xcsi2rxss_1: csi2rx@a0020000 {
> +        compatible = "xlnx,mipi-csi2-rx-subsystem-5.0";
> +        reg = <0x0 0xa0020000 0x0 0x10000>;
> +        interrupt-parent = <&gic>;
> +        interrupts = <0 95 4>;
> +        xlnx,csi-pxl-format = <0x2a>;
> +        xlnx,vfb;
> +        xlnx,en-active-lanes;
> +        xlnx,en-csi-v2-0;
> +        xlnx,en-vcx;
> +        clock-names = "lite_aclk", "video_aclk";
> +        clocks = <&misc_clk_0>, <&misc_clk_1>;
> +        video-reset-gpios = <&gpio 86 GPIO_ACTIVE_LOW>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                /* Sink port */
> +                reg = <0>;
> +                csiss_in: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    /* MIPI CSI-2 Camera handle */
> +                    remote-endpoint = <&camera_out>;
> +                };
> +            };
> +            port@1 {
> +                /* Source port */
> +                reg = <1>;
> +                csiss_out: endpoint {
> +                    remote-endpoint = <&vproc_in>;
> +                };
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart
