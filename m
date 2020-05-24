Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD6D1DFC48
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 03:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388257AbgEXBqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 May 2020 21:46:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38664 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgEXBqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 May 2020 21:46:05 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11E8D24D;
        Sun, 24 May 2020 03:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590284762;
        bh=lexvNiAKMahPGqf8TgXMopluQH81OQtilrewhXRnGIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PbhT6joCK9bF1uSVlLTTBF35iXU6G4OSwsAOFUJsJWnIkoxr69gIdwpTMkO2Y3UJf
         1FcMXwKgPKSLbgOsFL2fxcwfuwAkky9GFqaVd8uLr8RZlfQ/HmtA8iTccy+xF8Y3+4
         qCrTVgeKvCpSYdyqwKazT8y1uFo7siJN5LbrBRys=
Date:   Sun, 24 May 2020 04:45:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vishal Sagar <vsagar@xilinx.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v12 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Message-ID: <20200524014548.GA6026@pendragon.ideasonboard.com>
References: <20200423153038.106453-1-vishal.sagar@xilinx.com>
 <20200423153038.106453-2-vishal.sagar@xilinx.com>
 <20200505142302.GA19432@pendragon.ideasonboard.com>
 <BY5PR02MB68679AA1B7CDDC16293EEC12A7A20@BY5PR02MB6867.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BY5PR02MB68679AA1B7CDDC16293EEC12A7A20@BY5PR02MB6867.namprd02.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

On Fri, May 08, 2020 at 01:52:36PM +0000, Vishal Sagar wrote:
> On Tuesday, May 5, 2020 7:53 PM, Laurent Pinchart wrote:
> > On Thu, Apr 23, 2020 at 09:00:37PM +0530, Vishal Sagar wrote:
> > > Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.
> > >
> > > The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller,
> > > a D-PHY in Rx mode and a Video Format Bridge.
> > >
> > > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > > Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > > ---
> > > v12
> > > - Moved to yaml format
> > > - Update CSI-2 and D-PHY
> > > - Mention that bindings for D-PHY not here
> > > - reset -> video-reset
> > >
> > > v11
> > > - Modify compatible string from 4.0 to 5.0
> > >
> > > v10
> > > - No changes
> > >
> > > v9
> > > - Fix xlnx,vfb description.
> > > - s/Optional/Required endpoint property.
> > > - Move data-lanes description from Ports to endpoint property section.
> > >
> > > v8
> > > - Added reset-gpios optional property to assert video_aresetn
> > >
> > > v7
> > > - Removed the control name from dt bindings
> > > - Updated the example dt node name to csi2rx
> > >
> > > v6
> > > - Added "control" after V4L2_CID_XILINX_MIPICSISS_ACT_LANES as
> > > suggested by Luca
> > > - Added reviewed by Rob Herring
> > >
> > > v5
> > > - Incorporated comments by Luca Cersoli
> > > - Removed DPHY clock from description and example
> > > - Removed bayer pattern from device tree MIPI CSI IP
> > >   doesn't deal with bayer pattern.
> > >
> > > v4
> > > - Added reviewed by Hyun Kwon
> > >
> > > v3
> > > - removed interrupt parent as suggested by Rob
> > > - removed dphy clock
> > > - moved vfb to optional properties
> > > - Added required and optional port properties section
> > > - Added endpoint property section
> > >
> > > v2
> > > - updated the compatible string to latest version supported
> > > - removed DPHY related parameters
> > > - added CSI v2.0 related property (including VCX for supporting upto 16
> > >   virtual channels).
> > > - modified csi-pxl-format from string to unsigned int type where the value
> > >   is as per the CSI specification
> > > - Defined port 0 and port 1 as sink and source ports.
> > > - Removed max-lanes property as suggested by Rob and Sakari
> > > .../bindings/media/xilinx/xlnx,csi2rxss.yaml  | 215 ++++++++++++++++++
> > >  1 file changed, 215 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> > > b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> > > new file mode 100644
> > > index 000000000000..365084e27f7e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yam
> > > +++ l
> > > @@ -0,0 +1,215 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/xilinx/xlnx,csi2rxss.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Xilinx MIPI CSI-2 Receiver Subsystem
> > > +
> > > +maintainers:
> > > +  - Vishal Sagar <vishal.sagar@xilinx.com>
> > > +
> > > +description: |
> > > +  The Xilinx MIPI CSI-2 Receiver Subsystem is used to capture MIPI CSI-2
> > > +  traffic from compliant camera sensors and send the output as AXI4 Stream
> > > +  video data for image processing.
> > > +  The subsystem consists of a MIPI D-PHY in slave mode which captures the
> > > +  data packets. This is passed along the MIPI CSI-2 Rx IP which extracts the
> > > +  packet data. The optional Video Format Bridge (VFB) converts this data to
> > > +  AXI4 Stream video data.
> > > +  For more details, please refer to PG232 Xilinx MIPI CSI-2 Receiver Subsystem.
> > > +  Please note that this bindings includes only the MIPI CSI-2 Rx controller
> > > +  and Video Format Bridge and not D-PHY.
> > 
> > How should the D-PHY be handled, when DPY_EN_REG_IF is set to true ?
> 
> It was suggested in v3 to have a separate D-PHY phy driver which would be initialized / configured from MIPI CSI-2 Rx driver.
> Currently with the D-PHY register interface enabled, we don't have to really configure anything but the following parameters
> 1 - init
> 2 - hs_settle
> 3 - hs_timeout (High Speed mode timeout)  
> 4 - esc_timeout  (Escape mode timeout)
> 5 - idelay tap
> 
> The D-PHY Rx can be enabled/disabled and has a soft reset bit.
> The HS and Escape mode timeout registers can be enabled with a default value via the Vivado IP GUI.
> 
> The above parameters would have to be passed to D-PHY driver as custom control via MIPI CSI-2 Rx driver
> as these depend on the sensor connected.
> Probably these can be a new common control in V4L2 framework for CSI Rx controllers.

It seems that in that case, regardless of whether we go for a separate
PHY driver or not, we will be able to extend the DT bindings, either
with a phys property, or with an additional reg entry. That should be
backward-compatible, so I'm not concerned.

> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +        - xlnx,mipi-csi2-rx-subsystem-5.0
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description: List of clock specifiers
> > > +    items:
> > > +      - description: AXI Lite clock
> > > +      - description: Video clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: lite_aclk
> > > +      - const: video_aclk
> > > +
> > > +  xlnx,csi-pxl-format:
> > > +    description: |
> > > +      This denotes the CSI Data type selected in hw design.
> > > +      Packets other than this data type (except for RAW8 and
> > > +      User defined data types) will be filtered out.
> > > +      Possible values are as below -
> > > +      0x1e - YUV4228B
> > > +      0x1f - YUV42210B
> > > +      0x20 - RGB444
> > > +      0x21 - RGB555
> > > +      0x22 - RGB565
> > > +      0x23 - RGB666
> > > +      0x24 - RGB888
> > > +      0x28 - RAW6
> > > +      0x29 - RAW7
> > > +      0x2a - RAW8
> > > +      0x2b - RAW10
> > > +      0x2c - RAW12
> > > +      0x2d - RAW14
> > > +      0x2e - RAW16
> > > +      0x2f - RAW20
> > > +    allOf:
> > > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > > +      - enum: [0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x28, 0x29,
> > > + 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f]
> > 
> > This could also be written
> > 
> >     allOf:
> >       - $ref: /schemas/types.yaml#/definitions/uint32
> >       - anyOf:
> >         - minimum: 0x1e
> >           maximum: 0x24
> >         - minimum: 0x28
> >           maximum: 0x2f
> > 
> > if you want to make it a bit more compact (in the number of values, not the
> > number of lines obviously), up to you.
> 
> Thanks for sharing this method. I will update this in next version.
> 
> > I will also quote the question (and your answer) from the previous
> > version:
> > 
> > > > Isn't this property required only when the VFB is present ?
> > >
> > > This will be present irrespective of VFB being enabled.
> > > With VFB, the data on the bus will be as per Xilinx UG934 which is similar to media bus formats.
> > >
> > > Without VFB, it will just be plain data as it comes in data packets.
> > > Refer to the Xilinx PG 232 "Pixel Packing When Video Format Bridge is Not Present"
> > >
> > > So the driver is currently made to load only in case VFB is enabled.
> > 
> > I understand that the driver doesn't support the case where the VFB is
> > disabled, but the DT bindings shouldn't care about that. The document of
> > v4.1 of the subsystem states that the width of the video_out port is then
> > selected under "CSI-2 Options TDATA width" (page 11). I however don't such
> > such an option described on pages 55 or 56, but there's an
> > AXIS_TDATA_WIDTH parameter on page 61.
> > 
> > Is the pixel format relevant when the VFB is disabled ?
> 
> When the VFB is disabled, all supported data types will be allowed i.e. no filtering will occur.
> But the data output will be in 32/64 bit TDATA width (no dependence on pixels per clock) and 
> will adhere to the "Recommended Memory Storage" section of the CSI spec.
> In this case data being sent on the bus won't compare to what media bus format documentation describes.

My understanding is that, in the case xlnx,vfb would be absent (not
supported in the driver yet), the xlnx,csi-pxl-format should not be set
? If that's correct, I'd like to capture that in the bindings already.
It could be expressed by dropping xlnx,csi-pxl-format from the required
section, and adding

if:
  required:
    - xlnx,vfb
then:
  required:
    - xlnx,csi-pxl-format
else:
  properties:
    xlnx,csi-pxl-format: false

As you will have two conditions defined, they should be grouped with

allOf:
  - if:
      required:
        - xlnx,vfb
    then:
      required:
        - xlnx,csi-pxl-format
    else:
      properties:
        xlnx,csi-pxl-format: false

  - if:
      not:
        required:
          - xlnx,en-csi-v2-0
    then:
      properties:
        xlnx,en-vcx: false

> > > +
> > > +  xlnx,vfb:
> > > +    type: boolean
> > > +    description: Present when Video Format Bridge is enabled in IP
> > > + configuration
> > > +
> > > +  xlnx,en-csi-v2-0:
> > > +    type: boolean
> > > +    description: Present if CSI v2 is enabled in IP configuration.
> > > +
> > > +  xlnx,en-vcx:
> > > +    type: boolean
> > > +    description: |
> > > +      When present, there are maximum 16 virtual channels, else
> > > +      only 4. This is present only if xlnx,en-csi-v2-0 is present.
> > 
> > The last sentence should be removed, and replaced with
> > 
> > if:
> >   not:
> >     required:
> >       - xlnx,en-csi-v2-0
> > then:
> >   properties:
> >     xlnx,en-vcx: false
> > 
> > (to be placed after required: and before additionalProperties:).
> 
> Got it. Thanks for the tips on YAML.
> I will update this in next version.
> 
> > > +
> > > +  xlnx,en-active-lanes:
> > > +    type: boolean
> > > +    description: |
> > > +      Present if the number of active lanes can be re-configured at
> > > +      runtime in the Protocol Configuration Register. Otherwise all lanes,
> > > +      as set in IP configuration, are always active.
> > > +
> > > +  video-reset-gpios:
> > > +    description: Optional specifier for a GPIO that asserts video_aresetn.
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    type: object
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        type: object
> > > +        description: |
> > > +          Input / sink port node, single endpoint describing the
> > > +          CSI-2 transmitter.
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +          endpoint:
> > > +            type: object
> > > +
> > > +            properties:
> > > +
> > > +              data-lanes:
> > > +                description: |
> > > +                  This is required only in the sink port 0 endpoint which
> > > +                  connects to MIPI CSI-2 source like sensor.
> > > +                  The possible values are -
> > > +                  1       - For 1 lane enabled in IP.
> > > +                  1 2     - For 2 lanes enabled in IP.
> > > +                  1 2 3   - For 3 lanes enabled in IP.
> > > +                  1 2 3 4 - For 4 lanes enabled in IP.
> > > +                items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +                  - const: 3
> > > +                  - const: 4
> > > +
> > > +              remote-endpoint: true
> > > +
> > > +            required:
> > > +              - data-lanes
> > > +              - remote-endpoint
> > > +
> > > +            additionalProperties: false
> > > +
> > > +        additionalProperties: false
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: |
> > > +          Output / source port node, endpoint describing modules
> > > +          connected the CSI-2 receiver.
> > > +
> > > +        properties:
> > > +
> > > +          reg:
> > > +            const: 1
> > > +
> > > +          endpoint:
> > > +            type: object
> > > +
> > > +            properties:
> > > +
> > > +              remote-endpoint: true
> > > +
> > > +            required:
> > > +              - remote-endpoint
> > > +
> > > +            additionalProperties: false
> > > +
> > > +        additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +  - xlnx,csi-pxl-format
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    xcsi2rxss_1: csi2rx@a0020000 {
> > > +        compatible = "xlnx,mipi-csi2-rx-subsystem-5.0";
> > > +        reg = <0x0 0xa0020000 0x0 0x10000>;
> > > +        interrupt-parent = <&gic>;
> > > +        interrupts = <0 95 4>;
> > > +        xlnx,csi-pxl-format = <0x2a>;
> > > +        xlnx,vfb;
> > > +        xlnx,en-active-lanes;
> > > +        xlnx,en-csi-v2-0;
> > > +        xlnx,en-vcx;
> > > +        clock-names = "lite_aclk", "video_aclk";
> > > +        clocks = <&misc_clk_0>, <&misc_clk_1>;
> > > +        video-reset-gpios = <&gpio 86 GPIO_ACTIVE_LOW>;
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@0 {
> > > +                /* Sink port */
> > > +                reg = <0>;
> > > +                csiss_in: endpoint {
> > > +                    data-lanes = <1 2 3 4>;
> > > +                    /* MIPI CSI-2 Camera handle */
> > > +                    remote-endpoint = <&camera_out>;
> > > +                };
> > > +            };
> > > +            port@1 {
> > > +                /* Source port */
> > > +                reg = <1>;
> > > +                csiss_out: endpoint {
> > > +                    remote-endpoint = <&vproc_in>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };

-- 
Regards,

Laurent Pinchart
