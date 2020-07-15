Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF26221256
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 18:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbgGOQ3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 12:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGOQ3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 12:29:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09167C061755;
        Wed, 15 Jul 2020 09:29:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95092564;
        Wed, 15 Jul 2020 18:29:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594830548;
        bh=J0RmO1M1ihQJvW/q2HS1HUBA5UiJRDYlOCO40ivrSEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=owe9lWhyAxGIol67u3m6+OzIMITqa7IUxf6V+vB33ABRw2f+wURJr7dmS9lLqHJFd
         aBE5vdEQvPBId8ywbjMCtAGMweNKtXe1C5aCP1Gfyyf/H2VmL+Zi9x41lJkV+DTz1q
         GMJNQnSuXf49Gq9xxHJdOLXXTEHNcnplNZ2IoQds=
Date:   Wed, 15 Jul 2020 19:29:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     Rob Herring <robh@kernel.org>, hyunk@xilinx.com,
        hverkuil@xs4all.nl, mchehab@kernel.org, mark.rutland@arm.com,
        michals@xilinx.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, joe@perches.com, sandipk@xilinx.com,
        dineshk@xilinx.com
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: xilinx: Add Xilinx
 UHD-SDI Receiver Subsystem
Message-ID: <20200715162901.GE6144@pendragon.ideasonboard.com>
References: <20200618053304.14551-1-vishal.sagar@xilinx.com>
 <20200618053304.14551-3-vishal.sagar@xilinx.com>
 <20200713185447.GA531731@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200713185447.GA531731@bogus>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

Thank you for the patch.

On Mon, Jul 13, 2020 at 12:54:47PM -0600, Rob Herring wrote:
> On Thu, Jun 18, 2020 at 11:03:03AM +0530, Vishal Sagar wrote:
> > Add bindings documentation for Xilinx UHD-SDI Receiver Subsystem.
> > 
> > The Xilinx UHD-SDI Receiver Subsystem consists of SMPTE UHD-SDI (RX) IP
> > core, an SDI RX to Video Bridge IP core to convert SDI video to native
> > video and a Video In to AXI4-Stream IP core to convert native video to
> > AXI4-Stream.
> > 
> > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > ---
> > v3
> > - bpc instead of bpp
> > - removed bpc as required property (default to 10 bpc)
> > - add dt-bindings/media/xilinx-sdi.h
> > - made line-rate as u32 instead of string
> > - fixed reg
> > - fixed s/upto/up to/
> > 
> > v2
> > - Removed references to xlnx,video*
> > - Fixed as per Sakari Ailus and Rob Herring's comments
> > - Converted to yaml format
> > 
> >  .../bindings/media/xilinx/xlnx,sdirxss.yaml   | 132 ++++++++++++++++++
> >  include/dt-bindings/media/xilinx-sdi.h        |  20 +++
> >  2 files changed, 152 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml
> >  create mode 100644 include/dt-bindings/media/xilinx-sdi.h
> > 
> > diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml
> > new file mode 100644
> > index 000000000000..6cfc18ca435f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml
> > @@ -0,0 +1,132 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/xilinx/xlnx,sdirxss.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +

I think a single blank line is enough.

> > +title: Xilinx SMPTE UHD-SDI Receiver Subsystem
> > +
> > +maintainers:
> > +  - Vishal Sagar <vishal.sagar@xilinx.com>
> > +
> > +description: |
> > +  The SMPTE UHD-SDI Receiver (RX) Subsystem allows you to quickly create systems
> > +  based on SMPTE SDI protocols. It receives unaligned native SDI streams from
> > +  the SDI GT PHY and outputs an AXI4-Stream video stream, native video, or
> > +  native SDI using Xilinx transceivers as the physical layer.
> > +
> > +  The subsystem consists of
> > +  1 - SMPTE UHD-SDI Rx
> > +  2 - SDI Rx to Native Video Bridge
> > +  3 - Video In to AXI4-Stream Bridge
> > +
> > +  The subsystem can capture SDI streams in up to 12G mode 8 data streams and output
> > +  a dual pixel per clock RGB/YUV444,422/420 10/12 bits per component AXI4-Stream.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - xlnx,v-smpte-uhdsdi-rx-ss-2.0
> 
> Should be indented 2 more spaces.

Or you could simply use

properties:
  compatible:
    const: xlnx,v-smpte-uhdsdi-rx-ss-2.0

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: List of clock specifiers
> 
> Drop. That's every 'clocks' property.
> 
> > +    items:
> > +      - description: AXI4-Lite clock
> > +      - description: SMPTE UHD-SDI Rx core clock
> > +      - description: Video clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: s_axi_aclk
> > +      - const: sdi_rx_clk
> > +      - const: video_out_clk
> > +
> > +  xlnx,bpc:
> > +    description: Bits per component supported. Can be 10 or 12 bits per component only.
> > +    allOf:
> 
> You can drop the 'allOf' now.
> 
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +      - enum: [10, 12]
> 
> Seems like this should be a standard property?

Rob, if my understanding is correct, this tells for how many bits per
component the IP core has been synthesized. I think it qualifies as a
vendor property, as how to express constraints on supported formats (for
IP cores that can be synthesized with different options) is highly
vendor-specific.

Vishal, I think the question I asked in the review of v2 fell through
the cracks. Is the documentation for the new IP core version available ?
Should this property only be allowed for the new version, given that in
v2.0 the BPC is fixed to 10 ?

> > +
> > +  xlnx,line-rate:
> > +    description: |
> > +      The maximum mode supported by the design. Possible values are as below
> > +      0 - XSDI_STD_3G      -  3G mode
> > +      1 - XSDI_STD_6G      -  6G mode
> > +      2 - XSDI_STD_12G_8DS - 12G mode with 8 data streams
> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +      - enum: [0, 1, 2]
> 
> Standard?

For this one, I'm not sure. There's little support for SDI in the
kernel, and I'm sure we'll get this wrong the first time. I'd rather try
not to over-standardize properties before we have more examples.

> > +
> > +  xlnx,include-edh:
> > +    type: boolean
> > +    description: |
> > +      This is present when the Error Detection and Handling processor is
> > +      enabled in design.
> > +
> > +  ports:
> > +    type: object
> > +    description: |
> > +      Generally the SDI port is connected to a device like SDI Broadcast camera
> > +      which is independently controlled. Hence port@0 is a source port which can be
> > +      connected to downstream IP which can work with AXI4 Stream data.
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: Source port
> > +        properties:
> > +          reg:
> > +            const: 0
> > +          endpoint:
> > +            type: object
> > +            properties:
> > +              remote-endpoint: true
> > +            required:
> > +              - remote-endpoint
> > +            additionalProperties: false
> > +        additionalProperties: false

Same here, I explained in the review of v2 that we should have an input
port.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - xlnx,line-rate
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/media/xilinx-sdi.h>
> > +    uhdsdirxss: v-smpte-uhdsdi-rxss@80000000 {

The label is not used, you can drop it.

> > +      compatible = "xlnx,v-smpte-uhdsdi-rx-ss-2.0";
> > +      interrupt-parent = <&gic>;
> > +      interrupts = <0 89 4>;
> > +      reg = <0x80000000 0x10000>;
> > +      xlnx,include-edh;
> > +      xlnx,line-rate = <XSDI_STD_12G_8DS>;
> > +      clocks = <&clk_1>, <&si570_1>, <&clk_2>;
> > +      clock-names = "s_axi_aclk", "sdi_rx_clk", "video_out_clk";
> > +      xlnx,bpc = <10>;

I would group the xlnx,* properties after the standard properties.

> > +
> > +      ports {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        port@0 {
> > +          reg = <0>;
> > +          sdirx_out: endpoint {
> > +            remote-endpoint = <&vcap_sdirx_in>;
> > +          };
> > +        };
> > +      };
> > +    };
> > +...
> > diff --git a/include/dt-bindings/media/xilinx-sdi.h b/include/dt-bindings/media/xilinx-sdi.h
> > new file mode 100644
> > index 000000000000..11938fade041
> > --- /dev/null
> > +++ b/include/dt-bindings/media/xilinx-sdi.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Xilinx SDI device tree bindings
> > + *
> > + * Copyright (C) 2020 Xilinx, Inc.
> > + *
> > + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> > + */
> > +
> > +#ifndef __DT_BINDINGS_MEDIA_XILINX_SDI_H__
> > +#define __DT_BINDINGS_MEDIA_XILINX_SDI_H__
> > +
> > +/*
> > + * SDI Configurations
> > + */
> > +#define XSDI_STD_3G		0
> > +#define XSDI_STD_6G		1
> > +#define XSDI_STD_12G_8DS	2
> > +
> > +#endif /* __DT_BINDINGS_MEDIA_XILINX_SDI_H__ */

-- 
Regards,

Laurent Pinchart
