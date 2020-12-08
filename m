Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E08E32D3711
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 00:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731808AbgLHXmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 18:42:18 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46824 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgLHXmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 18:42:11 -0500
Received: by mail-ot1-f68.google.com with SMTP id w3so431307otp.13;
        Tue, 08 Dec 2020 15:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mCzrahJfQzjNGyApJxp330Y639Yd1mbxLODK6PjseoQ=;
        b=Wrpj1V1N3Vx0P6AMGEWIVjhs3g7Aq8QQXAvfnpPScUH5A8Dm5TQDcEgBxD4JWgpQ/6
         zgidSaxXnfpHUW0sAHQ5gTzHdv2XnII0Ncdju1x3IOFoIM0FOT1SGbfl8Sgk9z9Mzsaz
         Vj3BnkycNioaD+Ol4LOqIRMLAACzmuewoR53m25iofGncksVFqzO+cGn2R/oDHGKT5Ce
         pHtx06JJvLbpdrq33TBRbP/LOEjumG1nzoCeaGkLuLckNJv+vi9pKBSUi/sQX8xblDJs
         fg/OSJZI4GJ2ULPfKVXArFRQmd25iMdt9NZaJW56xmL08XzQ6ZWX6oncRArXFPChJgDc
         w+zg==
X-Gm-Message-State: AOAM533oGeAo4MDTFk7jqoBcRD85Mc7C0uvR8DtVPfcIM4OhLJt2uL6N
        VgcNCm4cOuML0oS6yfj2xQ==
X-Google-Smtp-Source: ABdhPJyWhVNI/C53Lkge1VqK7cYq8nLg5rgXAvJRTD/JdewfYLumeU4nJgeCLYUAEw0d3qtY0FuK2g==
X-Received: by 2002:a9d:73d1:: with SMTP id m17mr420711otk.187.1607470889716;
        Tue, 08 Dec 2020 15:41:29 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p4sm79330oib.24.2020.12.08.15.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 15:41:28 -0800 (PST)
Received: (nullmailer pid 3334104 invoked by uid 1000);
        Tue, 08 Dec 2020 23:41:27 -0000
Date:   Tue, 8 Dec 2020 17:41:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wendy Liang <wendy.liang@xilinx.com>
Cc:     michal.simek@xilinx.com, arnd@arndb.de, gregkh@linuxfoundation.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com,
        rajan.vaja@xilinx.com, tejas.patel@xilinx.com,
        manish.narani@xilinx.com, ravi.patel@xilinx.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/9] dt-binding: soc: xilinx: ai-engine: Add AI engine
 binding
Message-ID: <20201208234127.GA3303888@robh.at.kernel.org>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
 <1606722505-16194-2-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606722505-16194-2-git-send-email-wendy.liang@xilinx.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 29, 2020 at 11:48:17PM -0800, Wendy Liang wrote:
> Xilinx AI engine array can be partitioned statically for different
> applications. In the device tree, there will be device node for the AI
> engine device, and device nodes for the statically configured AI engine
> partitions. Each of the statically configured partition has a partition
> ID in the system.
>
> Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> ---
>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 +++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> new file mode 100644
> index 0000000..1de5623
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/xilinx/xlnx,ai-engine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx AI Engine
> +
> +maintainers:
> +  - Wendy Liang <wendy.liang@xilinx.com>
> +
> +description: |+

You don't need '|' unless there's formatting to preserve.

> +  The Xilinx AI Engine is a tile processor with many cores (up to 400) that
> +  can run in parallel. The data routing between cores is configured through
> +  internal switches, and shim tiles interface with external interconnect, such
> +  as memory or PL.
> +
> +properties:
> +  compatible:
> +    const: xlnx,ai-engine-v1.0

This is soft logic? If not, don't use version numbers.

> +
> +  reg:
> +    description: |
> +      Physical base address and length of the device registers.

That's every 'reg' property. Drop.

> +      The AI engine address space assigned to Linux is defined by Xilinx
> +      platform design tool.
> +
> +  '#address-cells':
> +    enum: [2]

const: 2

> +    description: |
> +      size of cell to describe AI engine range of tiles address.
> +      It is the location of the starting tile of the range.
> +      As the AI engine tiles are 2D array, the location of a tile
> +      is presented as (column, row), the address cell is 2.
> +
> +  '#size-cells':
> +    enum: [2]
> +    description: |
> +      size of cell to describe AI engine range of tiles size.
> +      As the AI engine tiles are 2D array, the size cell is 2.
> +
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    description: |
> +      Should be "interrupt1", "interrupt2" or "interrupt3".

Really, not useful names. If you do have names, they should be a schema, 
not freeform text.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +  - power-domains
> +  - interrupt-parent

Generally, never required because it could be in the parent node.

> +  - interrupts
> +  - interrupt-names
> +
> +patternProperties:
> +  "^aie_partition@[0-9]+$":

aie-partition@

The unit-address is just the 1st cell of reg (the row)? Or needs to be 
row and column, in which case you'd want something like '@0,0'. Also, 
unit-address values are typically hex, not decimal.

> +    type: object
> +    description: |
> +      AI engine partition which is a group of column based tiles of the AI
> +      engine device. Each AI engine partition is isolated from the other
> +      AI engine partitions. An AI engine partition is defined by Xilinx
> +      platform design tools. Each partition has a SHIM row and core tiles rows.
> +      A SHIM row contains SHIM tiles which are the interface to external
> +      components. AXI master can access AI engine registers, push data to and
> +      fetch data from AI engine through the SHIM tiles. Core tiles are the
> +      compute tiles.
> +
> +    properties:
> +      reg:
> +        description: |
> +          It describes the group of tiles of the AI engine partition. It needs
> +          to include the SHIM row. The format is defined by the parent AI engine
> +          device node's '#address-cells' and '#size-cells' properties. e.g. a v1
> +          AI engine device has 2D tiles array, the first row is SHIM row. A
> +          partition which has 50 columns and 8 rows of core tiles and 1 row of
> +          SHIM tiles will be presented as <0 0 50 9>.

You should be able to write some constraints like max row and column 
values?

> +
> +      label:
> +        maxItems: 1

'label' is not an array. Why do you need label?

> +
> +      xlnx,partition-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          AI engine partition ID, which is defined by Xilinx platform design
> +          tool to identify the AI engine partition in the system.

I find the use of 'reg' a bit odd here. Maybe using 'reg' for partition 
would make more sense? Which is more closely associated with how you 
address the partition?

> +
> +    required:
> +      - reg
> +      - xlnx,partition-id
> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      ai_engine: ai-engine@20000000000 {
> +        compatible = "xlnx,ai-engine-v1.0";
> +        reg = <0x200 0x0 0x1 0x0>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        power-domains = <&versal_firmware 0x18224072>;
> +        interrupt-parent = <&gic>;
> +        interrupts = <0x0 0x94 0x4>,
> +                     <0x0 0x95 0x4>,
> +                     <0x0 0x96 0x4>;
> +        interrupt-names = "interrupt1", "interrupt2", "interrupt3";
> +
> +        aie_partition0: aie_partition@0 {
> +                /* 50 columns and 8 core tile rows + 1 SHIM row */
> +                reg = <0 0 50 9>;
> +                xlnx,partition-id = <1>;
> +        };
> +      };
> +    };
> -- 
> 2.7.4
> 
