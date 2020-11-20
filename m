Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270552BAC0D
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 15:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgKTOla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 09:41:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:37994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728101AbgKTOla (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 09:41:30 -0500
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96C2E2224C;
        Fri, 20 Nov 2020 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605883288;
        bh=b/YWRyX56j7FDPk4DdWkFfkE6RMcpeOtAxNoTGyioAY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cvdWgjeTWVMOmPhv7KY7amb66POkkRpZTjmAhi2LTllpQi/nsTrGb/YfFIO8ML44/
         avHhz5OHYUL/Pib8ORRnvv7W9WByrY9EbVZ3/Mab/4zXlOEgnShUMlL9tAROeoDZvS
         funk6czUWlnT3Q+b48TRS0+YNMnzPm51gBF3gwdA=
Received: by mail-wm1-f53.google.com with SMTP id h21so10012342wmb.2;
        Fri, 20 Nov 2020 06:41:28 -0800 (PST)
X-Gm-Message-State: AOAM532+6Em+4yX5pO3F0/gWYGpfjaWdy60pLngOt84GUDRMzEIeLbc1
        0V+LrFaZA3Px9mgumM3YsDlOMOYf0ajMQaB+Ng==
X-Google-Smtp-Source: ABdhPJwA6H/+9fmsOwR+XvVs/fKx83Hf3URWrw1amGJQDiSnt4qQUaFSvMdHY7NrwwfG7uCgGvO3MVGl8mu6S4RiVL0=
X-Received: by 2002:a1c:e182:: with SMTP id y124mr9880971wmg.145.1605883286540;
 Fri, 20 Nov 2020 06:41:26 -0800 (PST)
MIME-Version: 1.0
References: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com> <1605839346-10648-2-git-send-email-daoyuan.huang@mediatek.com>
In-Reply-To: <1605839346-10648-2-git-send-email-daoyuan.huang@mediatek.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Fri, 20 Nov 2020 22:41:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9SGD4jmWQW-LvWjzJ4z0itupw9qei=JhXTmBWAia-xOQ@mail.gmail.com>
Message-ID: <CAAOTY_9SGD4jmWQW-LvWjzJ4z0itupw9qei=JhXTmBWAia-xOQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
To:     Daoyuan Huang <daoyuan.huang@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        menghui.lin@mediatek.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        linux-media@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, pihsun@chromium.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        randy.wu@mediatek.com,
        srv_heupstream <srv_heupstream@mediatek.com>,
        acourbot@chromium.org, linux-kernel <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, ben.lok@mediatek.com,
        moudy.ho@mediatek.com, Rob Landley <rob@landley.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Daoyuan:

Daoyuan Huang <daoyuan.huang@mediatek.com> =E6=96=BC 2020=E5=B9=B411=E6=9C=
=8820=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:41=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> From: daoyuan huang <daoyuan.huang@mediatek.com>
>
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
>
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8183-mdp3.txt   | 208 ++++++++++++++++++
>  1 file changed, 208 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt81=
83-mdp3.txt
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3=
.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
> new file mode 100644
> index 000000000000..d4db908b8b53
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
> @@ -0,0 +1,208 @@
> +* Mediatek Media Data Path 3
> +
> +Media Data Path 3 (MDP3) is used for scaling and color space conversion.
> +
> +Required properties (controller node):
> +- compatible: "mediatek,mt8183-mdp3"
> +- mediatek,scp: the node of system control processor (SCP), using the
> +  remoteproc & rpmsg framework, see
> +  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
> +- mediatek,mmsys: the node of mux(multiplexer) controller for HW connect=
ions.
> +- mediatek,mm-mutex: the node of sof(start of frame) signal controller.
> +- mediatek,mailbox-gce: the node of global command engine (GCE), used to
> +  read/write registers with critical time limitation, see
> +  Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
> +- mboxes: mailbox number used to communicate with GCE.
> +- gce-subsys: sub-system id corresponding to the register address.

This is already defined in mediatek,gce-client-reg, so remove this.

> +- gce-event-names: in use event name list, used to correspond to event I=
Ds.
> +- gce-events: in use event IDs list, all IDs are defined in
> +  'dt-bindings/gce/mt8183-gce.h'.
> +
> +Required properties (all function blocks, child node):
> +- compatible: Should be one of
> +        "mediatek,mt8183-mdp-rdma"  - read DMA
> +        "mediatek,mt8183-mdp-rsz"   - resizer
> +        "mediatek,mt8183-mdp-wdma"  - write DMA
> +        "mediatek,mt8183-mdp-wrot"  - write DMA with rotation
> +        "mediatek,mt8183-mdp-ccorr" - color correction with 3X3 matrix
> +- reg: Physical base address and length of the function block register s=
pace.
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details=
.
> +- power-domains: A phandle to the power domain, see
> +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> +- mediatek,mdp-id: HW index to distinguish same functionality modules.
> +
> +Required properties (DMA function blocks, child node):
> +- compatible: Should be one of
> +        "mediatek,mt8183-mdp-rdma"
> +        "mediatek,mt8183-mdp-wdma"
> +        "mediatek,mt8183-mdp-wrot"
> +- mdp-comps(wdma & wrot only):
> +        "mediatek,mt8183-mdp-path"  - MDP output path selection, create =
a
> +                                      component for path connectedness o=
f HW
> +                                      pipe control; Align with mdp_comp_=
of_ids[]
> +                                      in mtk-mdp3-comp.c.
> +- mdp-comp-ids(wdma & wrot only): Index of the output paths, the number =
aligns
> +  with mdp_comp_matches[] in mtk-mdp3-comp.c.
> +- iommus: should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.t=
xt for
> +  details.
> +- mediatek,larb: Must contain the local arbiters in the current Socs, se=
e
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb=
.txt for
> +  details.
> +
> +Required properties (input path selection node):
> +- compatible:
> +        "mediatek,mt8183-mmsys"     - For MDP input/output source select=
ion.

mmsys is defined in mediatek,mmsys.txt [1], so move this there.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt?h=3Dv5.1=
0-rc4

> +- mdp-comps:
> +        "mediatek,mt8183-mdp-dl"    - MDP direct link input path selecti=
on,
> +                                      create a component for path connec=
tedness
> +                                      of HW pipe control; Align with
> +                                      mdp_comp_of_ids[] in mtk-mdp3-comp=
.c.
> +- mdp-comp-ids: Index of the input paths, the number aligns with
> +  mdp_comp_matches[] in mtk-mdp3-comp.c.
> +- reg: Physical base address and length of the function block register s=
pace.
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details=
.
> +
> +Required properties (ISP PASS2 (DIP) module path selection node):
> +- compatible:
> +        "mediatek,mt8183-imgsys"    - For ISP PASS2 (DIP) modules frame =
sync
> +                                      control with MDP.

imgsys is defined in mediatek,imgsys.txt [2], so move this there.

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt?h=3Dv5.=
10-rc4

> +- mdp-comps:
> +        "mediatek,mt8183-mdp-imgi"  - Input DMA of ISP PASS2 (DIP) modul=
e for
> +                                      raw image input.
> +        "mediatek,mt8183-mdp-exto"  - Output DMA of ISP PASS2 (DIP) modu=
le for
> +                                      yuv image output.
> +- mdp-comp-ids: Index of the modules, the number aligns with mdp_comp_ma=
tches[]
> +  in mtk-mdp3-comp.c.
> +- reg: Physical base address and length of the function block register s=
pace.
> +- mediatek,mdp-id: HW index to distinguish same functionality modules.
> +
> +Example:
> +               mmsys: syscon@14000000 {
> +                       compatible =3D "mediatek,mt8183-mmsys", "syscon";
> +                       mdp-comps =3D "mediatek,mt8183-mdp-dl",
> +                                   "mediatek,mt8183-mdp-dl";
> +                       mdp-comp-ids =3D <0 1>;
> +                       reg =3D <0 0x14000000 0 0x1000>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX=
 0 0x1000>;
> +                       #clock-cells =3D <1>;
> +                       clocks =3D <&mmsys CLK_MM_MDP_DL_TXCK>,
> +                                <&mmsys CLK_MM_MDP_DL_RX>,
> +                                <&mmsys CLK_MM_IPU_DL_TXCK>,
> +                                <&mmsys CLK_MM_IPU_DL_RX>;
> +               };
> +
> +               mdp_rdma0: mdp-rdma0@14001000 {
> +                       compatible =3D "mediatek,mt8183-mdp-rdma",
> +                                    "mediatek,mt8183-mdp3";
> +                       mediatek,scp =3D <&scp>;
> +                       mediatek,mdp-id =3D <0>;
> +                       reg =3D <0 0x14001000 0 0x1000>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX=
 0x1000 0x1000>;
> +                       power-domains =3D <&scpsys MT8183_POWER_DOMAIN_DI=
SP>;
> +                       clocks =3D <&mmsys CLK_MM_MDP_RDMA0>,
> +                                <&mmsys CLK_MM_MDP_RSZ1>;

Why place CLK_MM_MDP_RSZ1 in mdp_rdma0 device?

> +                       iommus =3D <&iommu M4U_PORT_MDP_RDMA0>;
> +                       mediatek,larb =3D <&larb0>;
> +                       mediatek,mmsys =3D <&mmsys>;
> +                       mediatek,mm-mutex =3D <&mutex>;
> +                       mediatek,imgsys =3D <&imgsys>;
> +                       mediatek,mailbox-gce =3D <&gce>;
> +                       mboxes =3D <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
> +                                <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
> +                                <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
> +                                <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
> +                       gce-subsys =3D <&gce 0x14000000 SUBSYS_1400XXXX>,
> +                                    <&gce 0x14010000 SUBSYS_1401XXXX>,
> +                                    <&gce 0x14020000 SUBSYS_1402XXXX>,
> +                                    <&gce 0x15020000 SUBSYS_1502XXXX>;
> +                       mediatek,gce-events =3D <CMDQ_EVENT_MDP_RDMA0_SOF=
>,
> +                                             <CMDQ_EVENT_MDP_RDMA0_EOF>,
> +                                             <CMDQ_EVENT_MDP_RSZ0_SOF>,

mdp_rsz0 send CMDQ_EVENT_MDP_RSZ0_SOF to gce, so move
CMDQ_EVENT_MDP_RSZ0_SOF to mdp_rsz0.

> +                                             <CMDQ_EVENT_MDP_RSZ1_SOF>,
> +                                             <CMDQ_EVENT_MDP_TDSHP_SOF>,
> +                                             <CMDQ_EVENT_MDP_WROT0_SOF>,
> +                                             <CMDQ_EVENT_MDP_WROT0_EOF>,
> +                                             <CMDQ_EVENT_MDP_WDMA0_SOF>,
> +                                             <CMDQ_EVENT_MDP_WDMA0_EOF>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_0>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_1>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_2>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_3>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_4>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_5>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_6>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_7>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_8>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_9>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_10>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_11>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_12>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_13>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_=
P2_14>,
> +                                             <CMDQ_EVENT_WPE_A_DONE>,

warp send CMDQ_EVENT_WPE_A_DONE to gce, so move CMDQ_EVENT_WPE_A_DONE
to warp device.

Regards,
Chun-Kuang.

> +                                             <CMDQ_EVENT_SPE_B_DONE>;
> +               };
> +
> +               mdp_rsz0: mdp-rsz0@14003000 {
> +                       compatible =3D "mediatek,mt8183-mdp-rsz";
> +                       mediatek,mdp-id =3D <0>;
> +                       reg =3D <0 0x14003000 0 0x1000>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX=
 0x3000 0x1000>;
> +                       clocks =3D <&mmsys CLK_MM_MDP_RSZ0>;
> +               };
> +
> +               mdp_rsz1: mdp-rsz1@14004000 {
> +                       compatible =3D "mediatek,mt8183-mdp-rsz";
> +                       mediatek,mdp-id =3D <1>;
> +                       reg =3D <0 0x14004000 0 0x1000>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX=
 0x4000 0x1000>;
> +                       clocks =3D <&mmsys CLK_MM_MDP_RSZ1>;
> +               };
> +
> +               mdp_wrot0: mdp-wrot0@14005000 {
> +                       compatible =3D "mediatek,mt8183-mdp-wrot";
> +                       mediatek,mdp-id =3D <0>;
> +                       mdp-comps =3D "mediatek,mt8183-mdp-path";
> +                       mdp-comp-ids =3D <0>;
> +                       reg =3D <0 0x14005000 0 0x1000>;
> +                       power-domains =3D <&scpsys MT8183_POWER_DOMAIN_DI=
SP>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX=
 0x5000 0x1000>;
> +                       clocks =3D <&mmsys CLK_MM_MDP_WROT0>;
> +                       iommus =3D <&iommu M4U_PORT_MDP_WROT0>;
> +                       mediatek,larb =3D <&larb0>;
> +               };
> +
> +               mdp_wdma: mdp-wdma@14006000 {
> +                       compatible =3D "mediatek,mt8183-mdp-wdma";
> +                       mediatek,mdp-id =3D <0>;
> +                       mdp-comps =3D "mediatek,mt8183-mdp-path";
> +                       mdp-comp-ids =3D <1>;
> +                       reg =3D <0 0x14006000 0 0x1000>;
> +                       power-domains =3D <&scpsys MT8183_POWER_DOMAIN_DI=
SP>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX=
 0x6000 0x1000>;
> +                       clocks =3D <&mmsys CLK_MM_MDP_WDMA0>;
> +                       iommus =3D <&iommu M4U_PORT_MDP_WDMA0>;
> +                       mediatek,larb =3D <&larb0>;
> +               };
> +
> +               mdp_ccorr: mdp-ccorr@1401c000 {
> +                       compatible =3D "mediatek,mt8183-mdp-ccorr";
> +                       mediatek,mdp-id =3D <0>;
> +                       reg =3D <0 0x1401c000 0 0x1000>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX=
 0xc000 0x1000>;
> +                       clocks =3D <&mmsys CLK_MM_MDP_CCORR>;
> +               };
> +
> +               imgsys: syscon@15020000 {
> +                       compatible =3D "mediatek,mt8183-imgsys", "syscon"=
;
> +                       mediatek,mdp-id =3D <0>;
> +                       mdp-comps =3D "mediatek,mt8183-mdp-imgi",
> +                                   "mediatek,mt8183-mdp-exto";
> +                       mdp-comp-ids =3D <0 1>;
> +                       reg =3D <0 0x15020000 0 0x1000>;
> +                       mediatek,gce-client-reg =3D <&gce SUBSYS_1502XXXX=
 0 0x1000>;
> +                       #clock-cells =3D <1>;
> +               };
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
