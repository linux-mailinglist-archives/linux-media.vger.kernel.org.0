Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C11F3D0D61
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 13:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236618AbhGUKkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 06:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236999AbhGUKUv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 06:20:51 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899D4C061574;
        Wed, 21 Jul 2021 04:01:28 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id o72-20020a9d224e0000b02904bb9756274cso1675178ota.6;
        Wed, 21 Jul 2021 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ExML9+fEBI10aSrxy/EHKvysF1ldKGsrQnkHGe2/3Hs=;
        b=mcYDd7q4MPKRvhhUSEl6uBrfTY4+5MlBwKgJJwVt6iYT7RPdFxMHqpReLVZl2xZHok
         gEybm30aFnN3WzXfSKin93t3cga9RKh/ZXewJm/D5IXVcNPpnOxXmjSKN5wLeH6eoC30
         XZ5vF7MZIcyhZPNbu/606Pw5cMv5T6QY/bs6u7/lZOnwTeNujpkreAQSynWeFFJdRrbp
         YAMyUI4f0NNq+JIdYQCXE/dpGtCQ+uCeHRq6fcBfKtGJgKWV08lYvEB3o/Wc2+8snj8a
         Cts+vejGz9enSy7VwFZYGgOaSYaj5lFGpNoEjMyYqA0THPIjyJ1H5PhOSPCNbD7/efW+
         wSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ExML9+fEBI10aSrxy/EHKvysF1ldKGsrQnkHGe2/3Hs=;
        b=BwBzIzTJlu4SETEcgm89oaspSX2IZRnG9n+cQPeDWu0NGIhZDg6ujLf/I118MROM20
         cd4n8bJm0vNhANAW1Ix9RaXJLRq+nrM52tTjFZPCD6CRYRMcGLT7U5kzjxmKkPvW8MzL
         RcRzq1NbtmHV51O8mZYbZACA9+BbahgGzpOur3TynNIz+KOBPQlRrr7L+o/5L5rz2Wog
         EthNbTq4xvWuYh8GvEvi3h0Cd1IbPgYX3riLtR9DNqxZU2Z02ye/s4AztL6+u1XMbC/J
         tS1fETBA8dtBCrQvPV7OrIh53eAQo2PzIaueCjl2iSQnwSjCj93hp9KDFG3mkf4v0ba5
         OKFA==
X-Gm-Message-State: AOAM532QNG1eQZywIx94HJqiuuBASKekUjMQqNWMUkf84O7f4nb6cZDR
        OcaknEKSgflIiocgHjtklXljjInixhyReoOL8pk=
X-Google-Smtp-Source: ABdhPJzIJKXKN9UZAxYQZdS/4aplpCDWKVQRcaK1JCvsKm/8/K8wocfH9pJqp4qu3cO68F9wnvSEbn/tankuP4lpy5M=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr26420832otb.281.1626865287956;
 Wed, 21 Jul 2021 04:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210719074640.25058-1-moudy.ho@mediatek.com> <20210719074640.25058-2-moudy.ho@mediatek.com>
In-Reply-To: <20210719074640.25058-2-moudy.ho@mediatek.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Wed, 21 Jul 2021 13:01:16 +0200
Message-ID: <CAFqH_52LtKo6QXSDxuNfD7JxNAbMvyt2Ja==CKj6b7BAymnWWg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
To:     Moudy Ho <moudy.ho@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
        srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Moudy,

Thank you for your patch.

Missatge de Moudy Ho <moudy.ho@mediatek.com> del dia dl., 19 de jul.
2021 a les 9:47:
>
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
>
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek-mdp3.yaml         | 274 ++++++++++++++++++
>  1 file changed, 274 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp3.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp3.yaml b/Documentation/devicetree/bindings/media/mediatek-mdp3.yaml
> new file mode 100644
> index 000000000000..e3e10f0544ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-mdp3.yaml

The name of the file should be in the format vendor,compatible. In
this case is a bit complicated as there are different compatibles but
at least i'd use a generic name, i.e "mediatek,mtk-mdp3"

> @@ -0,0 +1,274 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#

Remember to also change the name here.


> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Media Data Path 3 Device Tree Bindings
> +
> +maintainers:
> +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description: |
> +  Media Data Path 3 (MDP3) is used for scaling and color space conversion.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +          # controller node
> +          - mediatek,mt8183-mdp3
> +        - enum:
> +          - mediatek,mt8183-mdp3-rdma
> +
> +      - items:
> +        - enum:
> +          # read DMA
> +          - mediatek,mt8183-mdp3-rdma
> +          # frame resizer
> +          - mediatek,mt8183-mdp3-rsz
> +          # write DMA
> +          - mediatek,mt8183-mdp3-wdma
> +          # write DMA with frame rotation
> +          - mediatek,mt8183-mdp3-wrot
> +          # color correction with 3X3 matrix
> +          - mediatek,mt8183-mdp3-ccorr
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
> +      HW index to distinguish same functionality modules.
> +
> +  mdp3-comps:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description: |
> +      Subcomponent, the number aligns with
> +      mdp_sub_comp_dt_ids[] in mtk-mdp3-comp.c.
> +
> +  mdp3-comp-ids:
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      Index of the modules, the number list in
> +      mdp_comp_matches[] in mtk-mdp3-comp.c.
> +
> +  reg:
> +    description: |
> +      Physical base address and length of the function block
> +      register space, the number aligns with the component
> +      and its own subcomponent.
> +
> +  mediatek,gce-client-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      sub-system id corresponding to the global command engine (GCE)
> +      register address.
> +      $ref: /schemas/mailbox/mtk-gce.txt
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 6
> +
> +  iommus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Should point to the respective IOMMU block with master
> +      port as argument.
> +      $ref: /schemas/iommu/mediatek,iommu.yaml
> +
> +  mediatek,mmsys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
> +    description: |
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
> +      $ref: /schemas/mailbox/mtk-gce.txt
> +
> +  mboxes:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      $ref: /schemas/mailbox/mailbox.txt
> +
> +  gce-subsys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      sub-system id corresponding to the global command engine (GCE)
> +      register address.
> +      $ref: /schemas/mailbox/mtk-gce.txt
> +
> +  mediatek,gce-events:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      In use event IDs list, all IDs are defined in
> +      'dt-bindings/gce/mt8183-gce.h'.
> +      $ref: /schemas/mailbox/mtk-gce.txt
> +
> +if:
> +  properties:
> +    compatible:
> +      items:
> +        - enum:
> +          - mediatek,mt8183-mdp3
> +        - enum:
> +          - mediatek,mt8183-mdp3-rdma
> +
> +then:
> +  required:
> +    - mediatek,scp
> +    - mediatek,mmsys
> +    - mediatek,mm-mutex
> +    - mediatek,gce-events
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
> +      mdp3-comps = "mediatek,mt8183-mdp3-dl", "mediatek,mt8183-mdp3-dl1",
> +                   "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-mdp3-exto";
> +      mdp3-comp-ids = <0 1 0 1>;
> +      reg = <0x14001000 0x1000>,
> +            <0x14000000 0x1000>,
> +            <0x15020000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
> +                                <&gce SUBSYS_1400XXXX 0 0x1000>,
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
> +      mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
> +                            <CMDQ_EVENT_MDP_RDMA0_EOF>,
> +                            <CMDQ_EVENT_MDP_RSZ0_SOF>,
> +                            <CMDQ_EVENT_MDP_RSZ1_SOF>,
> +                            <CMDQ_EVENT_MDP_TDSHP_SOF>,
> +                            <CMDQ_EVENT_MDP_WROT0_SOF>,
> +                            <CMDQ_EVENT_MDP_WROT0_EOF>,
> +                            <CMDQ_EVENT_MDP_WDMA0_SOF>,
> +                            <CMDQ_EVENT_MDP_WDMA0_EOF>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
> +                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
> +                            <CMDQ_EVENT_WPE_A_DONE>,
> +                            <CMDQ_EVENT_SPE_B_DONE>;
> +    };
> +
> +    mdp3_rsz0: mdp3_rsz0@14003000 {
> +      compatible = "mediatek,mt8183-mdp3-rsz";
> +      mediatek,mdp3-id = <0>;
> +      reg = <0x14003000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
> +      clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> +    };
> +
> +    mdp3_rsz1: mdp3_rsz1@14004000 {
> +      compatible = "mediatek,mt8183-mdp3-rsz";
> +      mediatek,mdp3-id = <1>;
> +      reg = <0x14004000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
> +      clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> +    };
> +
> +    mdp3_wrot0: mdp3_wrot0@14005000 {
> +      compatible = "mediatek,mt8183-mdp3-wrot";
> +      mediatek,mdp3-id = <0>;
> +      mdp3-comps = "mediatek,mt8183-mdp3-path";
> +      mdp3-comp-ids = <0>;
> +      reg = <0x14005000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
> +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +      clocks = <&mmsys CLK_MM_MDP_WROT0>;
> +      iommus = <&iommu>;
> +    };
> +
> +    mdp3_wdma: mdp3_wdma@14006000 {
> +      compatible = "mediatek,mt8183-mdp3-wdma";
> +      mediatek,mdp3-id = <0>;
> +      mdp3-comps = "mediatek,mt8183-mdp3-path";
> +      mdp3-comp-ids = <1>;
> +      reg = <0x14006000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
> +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +      clocks = <&mmsys CLK_MM_MDP_WDMA0>;
> +      iommus = <&iommu>;
> +    };
> +
> +    mdp3_ccorr: mdp3_ccorr@1401c000 {
> +      compatible = "mediatek,mt8183-mdp3-ccorr";
> +      mediatek,mdp3-id = <0>;
> +      reg = <0x1401c000 0x1000>;
> +      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
> +      clocks = <&mmsys CLK_MM_MDP_CCORR>;
> +    };
> +
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
