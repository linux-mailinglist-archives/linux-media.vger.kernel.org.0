Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A244065B5
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 04:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhIJCbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 22:31:06 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55826 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229720AbhIJCbG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 22:31:06 -0400
X-UUID: 5e411f4b6eb547f0aa51d73d2212102a-20210910
X-UUID: 5e411f4b6eb547f0aa51d73d2212102a-20210910
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 507428610; Fri, 10 Sep 2021 10:29:53 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Sep 2021 10:29:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Sep 2021 10:29:51 +0800
Message-ID: <f47decf6d1fa0f1b375a531dc44736a0ca63b2d4.camel@mediatek.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
From:   moudy ho <moudy.ho@mediatek.com>
To:     Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        "Nicolas Boichat" <drinkcat@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= 
        <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        <randy.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Hsin-Yi Wang <hsinyi@google.com>
Date:   Fri, 10 Sep 2021 10:29:51 +0800
In-Reply-To: <CAAOTY_8GFP0utAVSw1JY6=y9hsJTbf8mtiKCnUmTcG2e9Zwdxg@mail.gmail.com>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
         <20210824100027.25989-4-moudy.ho@mediatek.com>
         <CAAOTY_8GFP0utAVSw1JY6=y9hsJTbf8mtiKCnUmTcG2e9Zwdxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-09-07 at 08:11 +0800, Chun-Kuang Hu wrote:
> Hi, Moudy:
> 
> Moudy Ho <moudy.ho@mediatek.com> 於 2021年8月24日 週二 下午6:02寫道：
> > 
> > This patch adds DT binding document for Media Data Path 3 (MDP3)
> > a unit in multimedia system used for scaling and color format
> > convert.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  57 +++++
> >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 207
> > ++++++++++++++++++
> >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
> >  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
> >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
> >  5 files changed, 471 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
> 
> I've compared ccorr driver in display [1] and ccorr in mdp [2], both
> are similar. So I would like both binding document are placed
> together. In display folder? In mdp folder? In SoC folder? I've no
> idea which one is better. At lease put together.
> 
> [1] 
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c?h=v5.14__;!!CTRNKA9wMg0ARbw!xOYd8SaiDSRvJBgpaQpLzMxqPOAstMX7cGXkhEnuYa1Wb3EMiiElNEPeycP_k2IQ$
>  
> [2] 
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210824100027.25989-6-moudy.ho@mediatek.com/__;!!CTRNKA9wMg0ARbw!xOYd8SaiDSRvJBgpaQpLzMxqPOAstMX7cGXkhEnuYa1Wb3EMiiElNEPeyTwjz4UU$
>  
> 
> Regards,
> Chun-Kuang.

Hi Chun-Kuang,

Thank you for your recommendation.
I will integrate the same component binding files in MDP and DISP, and
place them in the folder same with MMSYS instead.
(
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
)
The first version of RDMA, CCORR, AAL, COLOR and WDMA will be provided
by MDP and then DISP add it own property later.

Thanks & Regards,
Moudy Ho
> 
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > ccorr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > ccorr.yaml
> > new file mode 100644
> > index 000000000000..59fd68b46022
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > ccorr.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-ccorr.yaml*__;Iw!!CTRNKA9wMg0ARbw!xOYd8SaiDSRvJBgpaQpLzMxqPOAstMX7cGXkhEnuYa1Wb3EMiiElNEPeyW4MmXUY$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!xOYd8SaiDSRvJBgpaQpLzMxqPOAstMX7cGXkhEnuYa1Wb3EMiiElNEPeydwX0gSy$
> >  
> > +
> > +title: Mediatek Media Data Path 3 CCORR Device Tree Bindings
> > +
> > +maintainers:
> > +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> > +  - Moudy Ho <moudy.ho@mediatek.com>
> > +
> > +description: |
> > +  One of Media Data Path 3 (MDP3) components used to do color
> > correction with 3X3 matrix.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - mediatek,mt8183-mdp3-ccorr
> > +
> > +  mediatek,mdp3-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maxItems: 1
> > +    description: |
> > +      HW index to distinguish same functionality modules.
> > +
> > +  reg:
> > +    description: |
> > +      Physical base address and length of the function block
> > +      register space, the number aligns with the component
> > +      and its own subcomponent.
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: |
> > +      sub-system id corresponding to the global command engine
> > (GCE)
> > +      register address.
> > +      $ref: /schemas/mailbox/mtk-gce.txt
> > +
> > +  clocks:
> > +    minItems: 1
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gce/mt8183-gce.h>
> > +
> > +    mdp3_ccorr: mdp3_ccorr@1401c000 {
> > +      compatible = "mediatek,mt8183-mdp3-ccorr";
> > +      mediatek,mdp3-id = <0>;
> > +      reg = <0x1401c000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000
> > 0x1000>;
> > +      clocks = <&mmsys CLK_MM_MDP_CCORR>;
> > +    };

