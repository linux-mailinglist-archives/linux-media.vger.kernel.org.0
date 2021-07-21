Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84ECB3D0D62
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 13:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238636AbhGUKlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 06:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236804AbhGUKV0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 06:21:26 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EDCC061762;
        Wed, 21 Jul 2021 04:01:42 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id s23so2393437oiw.12;
        Wed, 21 Jul 2021 04:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XWPf/+CJJGxtNs51Z0OKBEat1OtXBiGmD0zndSXh3DA=;
        b=Cq78ZM2u9FWWJoAkNw6CuDQt8f/b1sxs2pKtSJSVr5Y222SFhH1B+0lkHtPHbrt1Z1
         qCpmTfPc0XHpwy9boBmSDloREXojuK9ebif3G+qrTGKlndHNj1bX/nqLNQh1iPB5zNnt
         gJDD1ucMjHDaD7zmvnmxwbQLMbt2jFZdysuUFqKTjQbfYTQRJaJuyOAf9R6k9CVS0iWw
         3F1s1mlofU1dB2O4c1BD2ucybggNQYH1jdbv4gA9NepuNVNz360DBeUAi6CKa5TVv2Fx
         oAzYiVoJ1lpPe2jN7ZNXp9xGfmiEjGSQXAo0qIA1ihCSK2eqpbVmfVQ0IbKeV7txUTm7
         8mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XWPf/+CJJGxtNs51Z0OKBEat1OtXBiGmD0zndSXh3DA=;
        b=QXbpS07on6cVhGeGzBB8ELGjbSL7B/4ZIWxJslaLjFCfQTCfiI1JHxY62jcjPbLEMl
         mX1ryAo6YCKnO+jM4b1Y7HSjp5y70Et36Pu1bSwBQtsp0JUA6hiLIrdsuPktoKCLiQlO
         kQ/GiwBHMYTo/Ldg7D6uws/yp/jKY5oIBWZdZskBq672RPq9Ubm+T28/cmQ36GwwR5Sz
         B+V5PwlAeECtZEv/dOMN1o6a6eQo3OhZVuHCYYyU/5vn+fk2/tPGQCfqYlQC7H/qn3Wb
         vqIsvmJv4kRzqxiFkjX/aZr1N7h7NZPLiXs1yDGyaERNVItPOxmnSPBpD1l2eU/2piqH
         iKyg==
X-Gm-Message-State: AOAM531xUR+QoFGefDZrh42wXGSiJKq1f1NqmR+T1jbIMy8DHMJ3i8Hr
        +BwQB8PAtLxzn5kTenI+Cd4rGPsJd89AslERf/8=
X-Google-Smtp-Source: ABdhPJyfKuFt2xk1BaDSAtm7kABppX4tSQuEHbEDuUON4kUr0V8u7jRiOSYTeAdKIw53117/WT7ehq1B7c3uwJSagzs=
X-Received: by 2002:aca:c6c9:: with SMTP id w192mr23797287oif.47.1626865302269;
 Wed, 21 Jul 2021 04:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210719074640.25058-1-moudy.ho@mediatek.com> <20210719074640.25058-3-moudy.ho@mediatek.com>
In-Reply-To: <20210719074640.25058-3-moudy.ho@mediatek.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Wed, 21 Jul 2021 13:01:30 +0200
Message-ID: <CAFqH_52sJC=Ey6VUMLgAiFz0x0z+9=Y6r-Ueg8U=4kBdAnXNNw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dts: arm64: mt8183: Add Mediatek MDP3 nodes
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

Hi Moudy Ho,

Thank you for your patch.

Missatge de Moudy Ho <moudy.ho@mediatek.com> del dia dl., 19 de jul.
2021 a les 9:47:
>
> Add device nodes for Media Data Path 3 (MDP3) modules.
>
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
> Depend on:
>    [1] https://lore.kernel.org/patchwork/patch/1164746/
>    [2] https://patchwork.kernel.org/patch/11703299/
>    [3] https://patchwork.kernel.org/patch/11283773/

I think all these patches are old, some of them already landed in
other forms, like the first one. I don't think these dependencies are
still valid, so please review and remove them if they are not needed.


> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 114 +++++++++++++++++++++++
>  1 file changed, 114 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c5e822b6b77a..30920d6ce7d2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1127,6 +1127,112 @@
>                         mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>                 };
>
> +               mdp3_rdma0: mdp3_rdma0@14001000 {
> +                       compatible = "mediatek,mt8183-mdp3",
> +                                    "mediatek,mt8183-mdp3-rdma";
> +                       mediatek,scp = <&scp>;
> +                       mediatek,mdp3-id = <0>;
> +                       mdp3-comps = "mediatek,mt8183-mdp3-dl", "mediatek,mt8183-mdp3-dl",
> +                                    "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-mdp3-exto";
> +                       mdp3-comp-ids = <0 1 0 1>;
> +                       reg = <0 0x14001000 0 0x1000>,
> +                             <0 0x14000000 0 0x1000>,
> +                             <0 0x15020000 0 0x1000>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
> +                                                 <&gce SUBSYS_1400XXXX 0 0x1000>,
> +                                                 <&gce SUBSYS_1502XXXX 0 0x1000>;
> +                       power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +                                <&mmsys CLK_MM_MDP_RSZ1>,
> +                                <&mmsys CLK_MM_MDP_DL_TXCK>,
> +                                <&mmsys CLK_MM_MDP_DL_RX>,
> +                                <&mmsys CLK_MM_IPU_DL_TXCK>,
> +                                <&mmsys CLK_MM_IPU_DL_RX>;
> +                       iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> +                       mediatek,mmsys = <&mmsys>;
> +                       mediatek,mm-mutex = <&mutex>;
> +                       mediatek,mailbox-gce = <&gce>;
> +                       mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
> +                                <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
> +                                <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
> +                                <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
> +                       mdp3-rsz0 = <&mdp3_rsz0>; /* debug only */
> +                       mdp3-rsz1 = <&mdp3_rsz1>; /* debug only */
> +                       mdp3-wrot0 = <&mdp3_wrot0>; /* debug only */
> +                       mdp3-wdma0 = <&mdp3_wdma>; /* debug only */
> +                       mdp3-ccorr0 = <&mdp3_ccorr>; /* debug only */
> +                       gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> +                                    <&gce 0x14010000 SUBSYS_1401XXXX>,
> +                                    <&gce 0x14020000 SUBSYS_1402XXXX>,
> +                                    <&gce 0x15020000 SUBSYS_1502XXXX>;
> +                       mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
> +                                             <CMDQ_EVENT_MDP_RDMA0_EOF>,
> +                                             <CMDQ_EVENT_MDP_RSZ0_SOF>,
> +                                             <CMDQ_EVENT_MDP_RSZ1_SOF>,
> +                                             <CMDQ_EVENT_MDP_TDSHP_SOF>,
> +                                             <CMDQ_EVENT_MDP_WROT0_SOF>,
> +                                             <CMDQ_EVENT_MDP_WROT0_EOF>,
> +                                             <CMDQ_EVENT_MDP_WDMA0_SOF>,
> +                                             <CMDQ_EVENT_MDP_WDMA0_EOF>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
> +                                             <CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
> +                                             <CMDQ_EVENT_WPE_A_DONE>,
> +                                             <CMDQ_EVENT_SPE_B_DONE>;
> +               };
> +
> +               mdp3_rsz0: mdp3_rsz0@14003000 {
> +                       compatible = "mediatek,mt8183-mdp3-rsz";
> +                       mediatek,mdp3-id = <0>;
> +                       reg = <0 0x14003000 0 0x1000>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
> +                       clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> +               };
> +
> +               mdp3_rsz1: mdp3_rsz1@14004000 {
> +                       compatible = "mediatek,mt8183-mdp3-rsz";
> +                       mediatek,mdp3-id = <1>;
> +                       reg = <0 0x14004000 0 0x1000>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
> +                       clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> +               };
> +
> +               mdp3_wrot0: mdp3_wrot0@14005000 {
> +                       compatible = "mediatek,mt8183-mdp3-wrot";
> +                       mediatek,mdp3-id = <0>;
> +                       mdp3-comps = "mediatek,mt8183-mdp3-path";
> +                       mdp3-comp-ids = <0>;
> +                       reg = <0 0x14005000 0 0x1000>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
> +                       power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_MDP_WROT0>;
> +                       iommus = <&iommu M4U_PORT_MDP_WROT0>;
> +               };
> +
> +               mdp3_wdma: mdp3_wdma@14006000 {
> +                       compatible = "mediatek,mt8183-mdp3-wdma";
> +                       mediatek,mdp3-id = <0>;
> +                       mdp3-comps = "mediatek,mt8183-mdp3-path";
> +                       mdp3-comp-ids = <1>;
> +                       reg = <0 0x14006000 0 0x1000>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
> +                       power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_MDP_WDMA0>;
> +                       iommus = <&iommu M4U_PORT_MDP_WDMA0>;
> +               };
> +
>                 ovl0: ovl@14008000 {
>                         compatible = "mediatek,mt8183-disp-ovl";
>                         reg = <0 0x14008000 0 0x1000>;
> @@ -1272,6 +1378,14 @@
>                         clock-names = "apb", "smi", "gals0", "gals1";
>                 };
>
> +               mdp3_ccorr: mdp3_ccorr@1401c000 {
> +                       compatible = "mediatek,mt8183-mdp3-ccorr";
> +                       mediatek,mdp3-id = <0>;
> +                       reg = <0 0x1401c000 0 0x1000>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
> +                       clocks = <&mmsys CLK_MM_MDP_CCORR>;
> +               };
> +
>                 imgsys: syscon@15020000 {
>                         compatible = "mediatek,mt8183-imgsys", "syscon";
>                         reg = <0 0x15020000 0 0x1000>;
> --
> 2.18.0
>
