Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23CA21E03A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 20:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgGMSyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 14:54:51 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39343 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgGMSyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 14:54:50 -0400
Received: by mail-io1-f65.google.com with SMTP id f23so14653280iof.6;
        Mon, 13 Jul 2020 11:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GpjldxV+7Jj2vT+IvkGpTu9C3cb82+6pyMRNKhGFrns=;
        b=dIXpME/JD8rpfMSCteagWjef8EaBjoer3sikstmxe0GIvEqRDniB2X8tJ1YRwrIa8w
         pFQAC8qCwCVR6aWW6iI6cBs7BARt8F9lcoD+D4qIQGEtIN0nkc++GcZ+G0a3+7NaPqTx
         mFAsgQUOCotmbLLeCmttG9tuOFJhiT/KmogdKCjpigWLOBk7cSGua3EQB3FRshr9nmDm
         aRHI7qSQg+B25HOAAau7CoDa/sHUQIHXE0ZiFs00/DDw7jIZZ25QQNVRW1MJ/K1Wq9NT
         3RYs3QjDT2wJFc15qY0EM2955x9apDL+M9Y7wIohxpMX6fJ2pm9Fi6HZSAByNr+wtArC
         hHUA==
X-Gm-Message-State: AOAM5302zkMiyOGIbbYwTW233MxDEJ1rbo/RQEqMJ0c17BHpj+g8gnV/
        eXJj+ukseuWQanbQfxpKXQ==
X-Google-Smtp-Source: ABdhPJwfBTESnW9A9BK0215CPEqL1tvb5pOJfUAQ5J+a1D83Ui/ogMwIHTrR/fSKXGi3VJ9a15EbAg==
X-Received: by 2002:a6b:ba8b:: with SMTP id k133mr1207385iof.204.1594666489080;
        Mon, 13 Jul 2020 11:54:49 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a24sm8109070ioe.46.2020.07.13.11.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:54:48 -0700 (PDT)
Received: (nullmailer pid 536032 invoked by uid 1000);
        Mon, 13 Jul 2020 18:54:47 -0000
Date:   Mon, 13 Jul 2020 12:54:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     hyunk@xilinx.com, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, mchehab@kernel.org, mark.rutland@arm.com,
        michals@xilinx.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, joe@perches.com, sandipk@xilinx.com,
        dineshk@xilinx.com
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: xilinx: Add Xilinx
 UHD-SDI Receiver Subsystem
Message-ID: <20200713185447.GA531731@bogus>
References: <20200618053304.14551-1-vishal.sagar@xilinx.com>
 <20200618053304.14551-3-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618053304.14551-3-vishal.sagar@xilinx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 18, 2020 at 11:03:03AM +0530, Vishal Sagar wrote:
> Add bindings documentation for Xilinx UHD-SDI Receiver Subsystem.
> 
> The Xilinx UHD-SDI Receiver Subsystem consists of SMPTE UHD-SDI (RX) IP
> core, an SDI RX to Video Bridge IP core to convert SDI video to native
> video and a Video In to AXI4-Stream IP core to convert native video to
> AXI4-Stream.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> ---
> v3
> - bpc instead of bpp
> - removed bpc as required property (default to 10 bpc)
> - add dt-bindings/media/xilinx-sdi.h
> - made line-rate as u32 instead of string
> - fixed reg
> - fixed s/upto/up to/
> 
> v2
> - Removed references to xlnx,video*
> - Fixed as per Sakari Ailus and Rob Herring's comments
> - Converted to yaml format
> 
>  .../bindings/media/xilinx/xlnx,sdirxss.yaml   | 132 ++++++++++++++++++
>  include/dt-bindings/media/xilinx-sdi.h        |  20 +++
>  2 files changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml
>  create mode 100644 include/dt-bindings/media/xilinx-sdi.h
> 
> diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml
> new file mode 100644
> index 000000000000..6cfc18ca435f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/xilinx/xlnx,sdirxss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +
> +title: Xilinx SMPTE UHD-SDI Receiver Subsystem
> +
> +maintainers:
> +  - Vishal Sagar <vishal.sagar@xilinx.com>
> +
> +description: |
> +  The SMPTE UHD-SDI Receiver (RX) Subsystem allows you to quickly create systems
> +  based on SMPTE SDI protocols. It receives unaligned native SDI streams from
> +  the SDI GT PHY and outputs an AXI4-Stream video stream, native video, or
> +  native SDI using Xilinx transceivers as the physical layer.
> +
> +  The subsystem consists of
> +  1 - SMPTE UHD-SDI Rx
> +  2 - SDI Rx to Native Video Bridge
> +  3 - Video In to AXI4-Stream Bridge
> +
> +  The subsystem can capture SDI streams in up to 12G mode 8 data streams and output
> +  a dual pixel per clock RGB/YUV444,422/420 10/12 bits per component AXI4-Stream.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - xlnx,v-smpte-uhdsdi-rx-ss-2.0

Should be indented 2 more spaces.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: List of clock specifiers

Drop. That's every 'clocks' property.

> +    items:
> +      - description: AXI4-Lite clock
> +      - description: SMPTE UHD-SDI Rx core clock
> +      - description: Video clock
> +
> +  clock-names:
> +    items:
> +      - const: s_axi_aclk
> +      - const: sdi_rx_clk
> +      - const: video_out_clk
> +
> +  xlnx,bpc:
> +    description: Bits per component supported. Can be 10 or 12 bits per component only.
> +    allOf:

You can drop the 'allOf' now.

> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum: [10, 12]

Seems like this should be a standard property?

> +
> +  xlnx,line-rate:
> +    description: |
> +      The maximum mode supported by the design. Possible values are as below
> +      0 - XSDI_STD_3G      -  3G mode
> +      1 - XSDI_STD_6G      -  6G mode
> +      2 - XSDI_STD_12G_8DS - 12G mode with 8 data streams
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum: [0, 1, 2]

Standard?

> +
> +  xlnx,include-edh:
> +    type: boolean
> +    description: |
> +      This is present when the Error Detection and Handling processor is
> +      enabled in design.
> +
> +  ports:
> +    type: object
> +    description: |
> +      Generally the SDI port is connected to a device like SDI Broadcast camera
> +      which is independently controlled. Hence port@0 is a source port which can be
> +      connected to downstream IP which can work with AXI4 Stream data.
> +    properties:
> +      port@0:
> +        type: object
> +        description: Source port
> +        properties:
> +          reg:
> +            const: 0
> +          endpoint:
> +            type: object
> +            properties:
> +              remote-endpoint: true
> +            required:
> +              - remote-endpoint
> +            additionalProperties: false
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - xlnx,line-rate
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/media/xilinx-sdi.h>
> +    uhdsdirxss: v-smpte-uhdsdi-rxss@80000000 {
> +      compatible = "xlnx,v-smpte-uhdsdi-rx-ss-2.0";
> +      interrupt-parent = <&gic>;
> +      interrupts = <0 89 4>;
> +      reg = <0x80000000 0x10000>;
> +      xlnx,include-edh;
> +      xlnx,line-rate = <XSDI_STD_12G_8DS>;
> +      clocks = <&clk_1>, <&si570_1>, <&clk_2>;
> +      clock-names = "s_axi_aclk", "sdi_rx_clk", "video_out_clk";
> +      xlnx,bpc = <10>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        port@0 {
> +          reg = <0>;
> +          sdirx_out: endpoint {
> +            remote-endpoint = <&vcap_sdirx_in>;
> +          };
> +        };
> +      };
> +    };
> +...
> diff --git a/include/dt-bindings/media/xilinx-sdi.h b/include/dt-bindings/media/xilinx-sdi.h
> new file mode 100644
> index 000000000000..11938fade041
> --- /dev/null
> +++ b/include/dt-bindings/media/xilinx-sdi.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Xilinx SDI device tree bindings
> + *
> + * Copyright (C) 2020 Xilinx, Inc.
> + *
> + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_XILINX_SDI_H__
> +#define __DT_BINDINGS_MEDIA_XILINX_SDI_H__
> +
> +/*
> + * SDI Configurations
> + */
> +#define XSDI_STD_3G		0
> +#define XSDI_STD_6G		1
> +#define XSDI_STD_12G_8DS	2
> +
> +#endif /* __DT_BINDINGS_MEDIA_XILINX_SDI_H__ */
> -- 
> 2.21.0
> 
