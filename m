Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F4F402197
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 02:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbhIGAMa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 20:12:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:50620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230038AbhIGAMa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Sep 2021 20:12:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D70A3610A3;
        Tue,  7 Sep 2021 00:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630973484;
        bh=ifuFv3gkwVp/7X92auvTBV/kMkrnWgnIGVHcpN8lm0I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AM3AUOWWKR28dFKWdTcf/89GeoJVjrNAtBqiyFOtqiB409ug0JnZmbUcPvJ7xhYUd
         QZDE4EudShOca7/OYAMpDzIt9lGCn21USSPAPsP6DSvZxIl3C2d4x0AJMDe3+1AZKk
         Zl7ywAr3Yi89qXKFezX/+6uoKa7btOLQfU0UPeFqmkYo0mXvL3jXb8Csu3lPiHtRjp
         AcJWCTCqASGDC1KiBIScIbP4jtggGOZaCLPc8t3bHsE5GwttxhYAFzIxT1htE77Ezv
         lwIUIy7uAjcc2kei2CKz5n2k6zNh0J+ib+kn2U/FTfyVfqYWrLkWZPh9MxAkB2CCBT
         y3lKhC9ZXZTXQ==
Received: by mail-ej1-f43.google.com with SMTP id t19so16199307ejr.8;
        Mon, 06 Sep 2021 17:11:24 -0700 (PDT)
X-Gm-Message-State: AOAM531hcNKKQpD4as62q2eqIcMk8k7HsAW2lS59PPhrjt4ULphkpBiZ
        1r9B8IUoHaQK7v9FzF3oDVaNnc1v5vgwOMeSig==
X-Google-Smtp-Source: ABdhPJxU1SiAb4YPZCljleFW/HiLB8RDcADm34x/la6BDgQKmR7J0vZffdCpPHyLfu1ItECgjPKdWvfhwUZmzYWI37M=
X-Received: by 2002:a17:906:26c4:: with SMTP id u4mr15571504ejc.511.1630973483408;
 Mon, 06 Sep 2021 17:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210824100027.25989-1-moudy.ho@mediatek.com> <20210824100027.25989-4-moudy.ho@mediatek.com>
In-Reply-To: <20210824100027.25989-4-moudy.ho@mediatek.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Tue, 7 Sep 2021 08:11:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8GFP0utAVSw1JY6=y9hsJTbf8mtiKCnUmTcG2e9Zwdxg@mail.gmail.com>
Message-ID: <CAAOTY_8GFP0utAVSw1JY6=y9hsJTbf8mtiKCnUmTcG2e9Zwdxg@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
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
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, menghui.lin@mediatek.com,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        ben.lok@mediatek.com, randy.wu@mediatek.com,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Hsin-Yi Wang <hsinyi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Moudy:

Moudy Ho <moudy.ho@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=8824=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  57 +++++
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 207 ++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
>  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
>  5 files changed, 471 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3=
-ccorr.yaml

I've compared ccorr driver in display [1] and ccorr in mdp [2], both
are similar. So I would like both binding document are placed
together. In display folder? In mdp folder? In SoC folder? I've no
idea which one is better. At lease put together.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c?h=3Dv5.14
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/2021082410002=
7.25989-6-moudy.ho@mediatek.com/

Regards,
Chun-Kuang.

>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3=
-rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3=
-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3=
-wdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3=
-wrot.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.=
yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
> new file mode 100644
> index 000000000000..59fd68b46022
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-ccorr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Media Data Path 3 CCORR Device Tree Bindings
> +
> +maintainers:
> +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description: |
> +  One of Media Data Path 3 (MDP3) components used to do color correction=
 with 3X3 matrix.
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
> +    description: |
> +      HW index to distinguish same functionality modules.
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
> +      compatible =3D "mediatek,mt8183-mdp3-ccorr";
> +      mediatek,mdp3-id =3D <0>;
> +      reg =3D <0x1401c000 0x1000>;
> +      mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
> +      clocks =3D <&mmsys CLK_MM_MDP_CCORR>;
> +    };
