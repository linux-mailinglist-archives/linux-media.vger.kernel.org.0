Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E604C4302EA
	for <lists+linux-media@lfdr.de>; Sat, 16 Oct 2021 16:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235901AbhJPOVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Oct 2021 10:21:16 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:37492 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244348AbhJPOVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Oct 2021 10:21:12 -0400
Received: by mail-oi1-f175.google.com with SMTP id o83so17525332oif.4;
        Sat, 16 Oct 2021 07:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aOytoN8C+U3Rn90b6LRYZACEMLn+/RQ2njWL4ku1AlA=;
        b=4JfezNqalfqkCWJzPkN1jYu37+V6CCCoNrmC3rFH+O95/2dXpNkE1nHsfmKV1rzBnm
         dNxBcfIwrDrLv2vCV9bn0SbMMnow2kPReYKCfg9dV/bzja/3MbeJBQtnPfWAkHNnEu13
         Ke0BgjH5Gdeddz/JQGCXLtgb1vFR4p8HpM2u+RUQcghLUAbwluOAT4/AbHJCwu3nfCM/
         6oDIWY1tzxv957yQfPlP55RFAaL7zWPdiqYNGJ1338LyQrmOYHSbh7bMHgsGYmgnoXlk
         6kwf43AvSU5jCoSdBMIngPx9dbasyMpj7weQeDHi78QPCJVPDTf2eJ5T9i9pg9LAYfkz
         lxUA==
X-Gm-Message-State: AOAM533ii0UaRF5j++Fe0QzTBFB5fkras5QJH2R6TGfT5C+CdFKACBPK
        aM/hMjoBWx+X51ltQDYnLQ==
X-Google-Smtp-Source: ABdhPJwH6z7wFjfPNxSwD8xSpolT6ZSFgxQdba+N0JtbkHE6D3GikZ06PyB//4Q7ixNJhIi/SWdbHA==
X-Received: by 2002:a05:6808:301e:: with SMTP id ay30mr177018oib.75.1634393940896;
        Sat, 16 Oct 2021 07:19:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 65sm1874803otd.81.2021.10.16.07.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 07:19:00 -0700 (PDT)
Received: (nullmailer pid 3872759 invoked by uid 1000);
        Sat, 16 Oct 2021 14:18:58 -0000
Date:   Sat, 16 Oct 2021 09:18:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Moudy Ho <moudy.ho@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, drinkcat@chromium.org, acourbot@chromium.org,
        pihsun@chromium.org, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, allen-kh.cheng@mediatek.com,
        randy.wu@mediatek.com, srv_heupstream@mediatek.com,
        hsinyi@google.com
Subject: Re: [PATCH v8 5/7] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
Message-ID: <YWrfUo73+UegMKYP@robh.at.kernel.org>
References: <20211015123832.17914-1-moudy.ho@mediatek.com>
 <20211015123832.17914-6-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015123832.17914-6-moudy.ho@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 15, 2021 at 08:38:30PM +0800, Moudy Ho wrote:
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,ccorr.yaml |  59 +++++
>  .../bindings/arm/mediatek/mediatek,rdma.yaml  | 211 ++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,wdma.yaml  |  70 ++++++

These belong in a functional directory, not 'arm'.

>  .../bindings/media/mediatek,mdp3-rsz.yaml     |  68 ++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |  70 ++++++
>  5 files changed, 478 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
> new file mode 100644
> index 000000000000..40ea7955efc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,ccorr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek color correction
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description: |
> +  Mediatek color correction with 3X3 matrix.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - mediatek,mt8183-mdp3-ccorr
> +
> +  mediatek,mdp3-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1

maxItems is for an array, but you said this is a uint32.

> +    description: |
> +      There may be multiple blocks with the same function but
> +      different addresses in MDP3.
> +      In order to distinguish the connection with other blocks,
> +      a unique ID is needed to dynamically use one or more identical
> +      blocks to implement multiple pipelines.

They aren't identical if you need to distinguish them. We should 
describe the difference rather than make up device indices. Why is this 
needed?

For connections between components, use the graph binding.

> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The register of client driver can be configured by gce with 4 arguments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each GCE subsys id is mapping to a client defined in the header
> +      include/dt-bindings/gce/<chip>-gce.h.
> +
> +  clocks:
> +    minItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gce/mt8183-gce.h>
> +
> +    mdp3_ccorr: mdp3_ccorr@1401c000 {
> +      compatible = "mediatek,mt8183-mdp3-ccorr";
> +      mediatek,mdp3-id = <0>;
> +      reg = <0x1401c000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
> +      clocks = <&mmsys CLK_MM_MDP_CCORR>;
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml
> new file mode 100644
> index 000000000000..ad0e56923494
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml
> @@ -0,0 +1,211 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,rdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Read Direct Memory Access
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description: |
> +  Mediatek Read Direct Memory Access(RDMA) component used to do read DMA.
> +  It contains one line buffer to store the sufficient pixel data, and
> +  must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +  The 1st RDMA is also used to be a controller node in Media Data Path 3(MDP3)
> +  that containing MMSYS, MUTEX, GCE and SCP settings.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8183-mdp3

This looks less specific than this:

> +          - const: mediatek,mt8183-mdp3-rdma

Which is the wrong order. But why the 2 values to begin with?

> +      - items:
> +          - const: mediatek,mt8183-mdp3-rdma
> +
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description: |
> +      The node of system control processor (SCP), using
> +      the remoteproc & rpmsg framework.
> +      $ref: /schemas/remoteproc/mtk,scp.yaml
> +
> +  mediatek,mdp3-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +    description: |
> +      There may be multiple blocks with the same function but
> +      different addresses in MDP3.
> +      In order to distinguish the connection with other blocks,
> +      a unique ID is needed to dynamically use one or more identical
> +      blocks to implement multiple pipelines.
> +
> +  mdp3-comps:

vendor prefix needed.

> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    items:
> +      - enum:
> +          # MDP direct-link input path selection, create a
> +          # component for path connectedness of HW pipe control
> +          - mediatek,mt8183-mdp3-dl1
> +      - enum:
> +          - mediatek,mt8183-mdp3-dl2
> +      - enum:
> +          # MDP direct-link output path selection, create a
> +          # component for path connectedness of HW pipe control
> +          - mediatek,mt8183-mdp3-path1
> +      - enum:
> +          - mediatek,mt8183-mdp3-path2
> +      - enum:
> +          # Input DMA of ISP PASS2 (DIP) module for raw image input
> +          - mediatek,mt8183-mdp3-imgi
> +      - enum:
> +          # Output DMA of ISP PASS2 (DIP) module for YUV image output
> +          - mediatek,mt8183-mdp3-exto
> +    description: |
> +      MTK sub-system of direct-link or DIP
> +
> +  mdp3-comp-ids:
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

An array of only 1 item is a 'uint32'

> +    description: |
> +      Pipeline ID of MDP sub-system.

Needs a better description and possibly constraints. Any value 0-2^32 is 
valid?

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 5
> +    description: |
> +      1st: basic HW address
> +      2nd: mediatek,mt8183-mdp-dl1, mediatek,mt8183-mdp-dl2
> +      3rd: mediatek,mt8183-mdp-path1
> +      4th: mediatek,mt8183-mdp-path2
> +      5th: mediatek,mt8183-mdp3-imgi, mediatek,mt8183-mdp3-exto

This is better expressed as:

items:
  - description: ...
  - description: ...
  - description: ...
  - description: ...
  - description: ...

> +
> +  mediatek,gce-client-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The register of client driver can be configured by gce with 4 arguments

So 'maxItems: 4'?

> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each GCE subsys id is mapping to a client defined in the header
> +      include/dt-bindings/gce/<chip>-gce.h.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 6
> +    description: |
> +      1st: RDMA0 clock
> +      2nd: RSZ1 clock
> +      3rd: direck-link TX clock in MDP side
> +      4th: direck-link RX clock in MDP side
> +      5th: direck-link TX clock in ISP side
> +      6th: direck-link RX clock in ISP side

Again, use 'items'.

> +
> +  iommus:
> +    maxItems: 1
> +
> +  mediatek,mmsys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1

Not an array.

> +    description: |

Don't need '|' when there is no formatting to maintain.

> +      The node of mux(multiplexer) controller for HW connections.
> +
> +  mediatek,mm-mutex:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description: |
> +      The node of sof(start of frame) signal controller.
> +
> +  mediatek,mailbox-gce:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      The node of global command engine (GCE), used to read/write
> +      registers with critical time limitation.
> +
> +  mboxes:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type. This is where you need to define how many and what 
each one is if more than 1.

> +
> +  gce-subsys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      sub-system id corresponding to the global command engine (GCE)
> +      register address.
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mediatek,mt8183-mdp3
> +
> +then:
> +  required:
> +    - mediatek,scp
> +    - mediatek,mmsys
> +    - mediatek,mm-mutex
> +    - mediatek,mailbox-gce
> +    - mboxes
> +    - gce-subsys
> +
> +required:
> +  - compatible
> +  - mediatek,mdp3-id
> +  - reg
> +  - clocks
> +  - mediatek,gce-client-reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gce/mt8183-gce.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +    #include <dt-bindings/memory/mt8183-larb-port.h>
> +
> +    mdp3_rdma0: mdp3_rdma0@14001000 {
> +      compatible = "mediatek,mt8183-mdp3",
> +                   "mediatek,mt8183-mdp3-rdma";
> +      mediatek,scp = <&scp>;
> +      mediatek,mdp3-id = <0>;
> +      mdp3-comps = "mediatek,mt8183-mdp3-dl1", "mediatek,mt8183-mdp3-dl2",
> +                   "mediatek,mt8183-mdp3-path1", "mediatek,mt8183-mdp3-path2",
> +                   "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-mdp3-exto";
> +      mdp3-comp-ids = <0 1 0 1 0 1>;
> +      reg = <0x14001000 0x1000>,
> +            <0x14000000 0x1000>,
> +            <0x14005000 0x1000>,
> +            <0x14006000 0x1000>,
> +            <0x15020000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
> +                                <&gce SUBSYS_1400XXXX 0 0x1000>,
> +                                <&gce SUBSYS_1400XXXX 0x5000 0x1000>,
> +                                <&gce SUBSYS_1400XXXX 0x6000 0x1000>,
> +                                <&gce SUBSYS_1502XXXX 0 0x1000>;
> +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +      clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +               <&mmsys CLK_MM_MDP_RSZ1>,
> +               <&mmsys CLK_MM_MDP_DL_TXCK>,
> +               <&mmsys CLK_MM_MDP_DL_RX>,
> +               <&mmsys CLK_MM_IPU_DL_TXCK>,
> +               <&mmsys CLK_MM_IPU_DL_RX>;
> +      iommus = <&iommu>;
> +      mediatek,mmsys = <&mmsys>;
> +      mediatek,mm-mutex = <&mutex>;
> +      mediatek,mailbox-gce = <&gce>;
> +      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
> +               <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
> +               <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
> +               <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
> +      gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> +                   <&gce 0x14010000 SUBSYS_1401XXXX>,
> +                   <&gce 0x14020000 SUBSYS_1402XXXX>,
> +                   <&gce 0x15020000 SUBSYS_1502XXXX>;
> +    };
> \ No newline at end of file

Fix this.

Similar comments on the rest...

Rob

