Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5D501E4381
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 15:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387682AbgE0NYB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 09:24:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387581AbgE0NYB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 09:24:01 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B06ABA3C;
        Wed, 27 May 2020 15:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590585837;
        bh=ccL7lFOWmVadayKZJr9QvwOk55pxnfp1u48HZhwkuJI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DjC09TBYc1PyHkWoCy6U8PtP7goKkQi9hQCHLOoMv/h9KQg8WmobggFOPe1n6BfT/
         Aq80hrS9f8pfzHL6m4fGAu1xSTTJz9xbsdgOvcf8knIx33B4gk7YyVD0TKFc6ElD+5
         jKwF35aTuGTi9kHBXPRBTz9NAcsifcrd/+YDcxNg=
Date:   Wed, 27 May 2020 16:23:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vishal Sagar <vsagar@xilinx.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v13 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Message-ID: <20200527132344.GC6171@pendragon.ideasonboard.com>
References: <20200512151947.120348-1-vishal.sagar@xilinx.com>
 <20200512151947.120348-2-vishal.sagar@xilinx.com>
 <20200524020214.GB6026@pendragon.ideasonboard.com>
 <DM6PR02MB68762DFB8F24E485B9B302B6A7B10@DM6PR02MB6876.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM6PR02MB68762DFB8F24E485B9B302B6A7B10@DM6PR02MB6876.namprd02.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

On Wed, May 27, 2020 at 11:53:01AM +0000, Vishal Sagar wrote:
> On Sunday, May 24, 2020 7:32 AM, Laurent Pinchart wrote:
> > On Tue, May 12, 2020 at 08:49:46PM +0530, Vishal Sagar wrote:
> > > Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.
> > >
> > > The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller,
> > > a D-PHY in Rx mode and a Video Format Bridge.
> > >
> > > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > > Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > v13
> > > - Based on Laurent's suggestions
> > > - Fixed the datatypes values as minimum and maximum
> > > - condition added for en-vcx property
> > >
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
> > > .../bindings/media/xilinx/xlnx,csi2rxss.yaml  | 226 ++++++++++++++++++
> > >  1 file changed, 226 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> > > b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> > > new file mode 100644
> > > index 000000000000..b0885f461785
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yam
> > > +++ l
> > > @@ -0,0 +1,226 @@
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
> > > +  The Xilinx MIPI CSI-2 Receiver Subsystem is used to capture MIPI
> > > +CSI-2
> > > +  traffic from compliant camera sensors and send the output as AXI4
> > > +Stream
> > > +  video data for image processing.
> > > +  The subsystem consists of a MIPI D-PHY in slave mode which captures
> > > +the
> > > +  data packets. This is passed along the MIPI CSI-2 Rx IP which
> > > +extracts the
> > > +  packet data. The optional Video Format Bridge (VFB) converts this
> > > +data to
> > > +  AXI4 Stream video data.
> > > +  For more details, please refer to PG232 Xilinx MIPI CSI-2 Receiver
> > Subsystem.
> > > +  Please note that this bindings includes only the MIPI CSI-2 Rx
> > > +controller
> > > +  and Video Format Bridge and not D-PHY.
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
> > > +      - anyOf:
> > > +        - minimum: 0x1e
> > > +        - maximum: 0x24
> > > +        - minimum: 0x28
> > > +        - maximum: 0x2f
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
> > > +      When present, there are maximum 16 virtual channels, else only 4.
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
> > > +if:
> > > +  not:
> > > +    required:
> > > +      - xlnx,en-csi-v2-0
> > > +then:
> > > +  properties:
> > > +    xlnx,en-vcx: false
> > 
> > As I've just commented on v12, I think we should condition the xlnx,csi-pxl-
> > format property to xlnx,vfb being set. xlnx,csi-pxl-format should be removed
> > from the required properties above, and the following conditions added:
> > 
> > allOf:
> >   - if:
> >       required:
> >         - xlnx,vfb
> >     then:
> >       required:
> >         - xlnx,csi-pxl-format
> >     else:
> >       properties:
> >         xlnx,csi-pxl-format: false
> > 
> >   - if:
> >       not:
> >         required:
> >           - xlnx,en-csi-v2-0
> >     then:
> >       properties:
> >         xlnx,en-vcx: false
> > 
> > The 'allOf' is needed as you can't have two 'if' constructs at the top level.
> > 
> Thanks for sharing the explanation for this.
> Can you please share where I can get this info?

The json-schema specification is available at
https://json-schema.org/specification.html. allOf is defined in
https://json-schema.org/draft/2019-09/json-schema-core.html#allOf.

JSON schemas are expressed in JSON format, and YAML is a (more readable)
superset syntax of JSON. A YAML document contains lists and objects:

- this
- is
- a
- list

object:
  can: have
  properties:
    that: can
    be: other
    objects

An object is similar to a Python dictionary, it can't have multiple
entries with the same key. So having

if:
  required:
    - xlnx,vfb
then:
  required:
    - xlnx,csi-pxl-format
else:
  properties:
    xlnx,csi-pxl-format: false

if:
  not:
    required:
      - xlnx,en-csi-v2-0
then:
  properties:
    xlnx,en-vcx: false

at the top level is not valid, the same way that

properties:
  reg:
    maxItems: 1
  reg:
    maxItems: 1

wouldn't be valid. The allOf object has a value that is a list of
schemas:

allOf:
  - schema1
  - schema2
  - schema3

and in this case, we use it with a if...then...else for each of the
schemas. As documented in the spec, "An instance validates successfully
against [allOf] if it validates successfully against all schemas defined
by [allOf]'s value".

allOf is also used to include sub-schemas, as explained in
Documentation/devicetree/bindings/example-schema.yaml.

  vendor,int-property:
    description: Vendor specific properties must have a description
    # 'allOf' is the json-schema way of subclassing a schema. Here the base
    # type schema is referenced and then additional constraints on the values
    # are added.
    allOf:
      - $ref: /schemas/types.yaml#/definitions/uint32
      - enum: [2, 4, 6, 8, 10]

If this was written

  vendor,int-property:
    $ref: /schemas/types.yaml#/definitions/uint32
    enum: [2, 4, 6, 8, 10]

we would have an issue (among other problems) if
/schemas/types.yaml#/definitions/uint32 contained an enum, as there
would be two enum properties for vendor,int-property.

> > Please however let me know if my understanding is wrong and xlnx,csi-pxl-
> > format is needed even when xlnx,vfb is not set. In that case please ignore this
> > change (but please add the ... below).
> 
> Ok. I will add ... in the end.
> 
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
> > 
> > YAML files usually end with
> > 
> > ...
> > 
> > on the last line to mark the end of file.
> > 
> 
> Ok I will add this to the end of the file.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
