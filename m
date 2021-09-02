Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0283FF7E7
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 01:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345734AbhIBXda (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 19:33:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:41806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345458AbhIBXdU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 19:33:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7848610A1;
        Thu,  2 Sep 2021 23:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630625541;
        bh=GA+AjqeSDCMykVukDLkZcSq4WcK7pD/aBcJsuedYksc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=s/+04C7t67KD1oG/KwSDWU00s5MUQy4g4uRK3IHnaWC07ifQquiLbK2upmY3IHvAo
         e/q2VuygnBfxNMPkYWu7v9l8qa9/uDTGCri4M+4nOQ080OOnpb+w9RfG7hC+A7VAdO
         PN5Lz35UHLEP5BVOI5RGoc1hYJ2oUVh/Abips89rgJasyvrhxd9kdp1/i9ULEMVGvv
         dNuaaNVrpe/HvaA42AykZaA1YyMwp5h0n02UtJd1BREnqpbJuD8Lo9XchkBN5171sM
         NgLasAowEdufp+Asaegop1S9jL7aXwOByYL62n4JE92DVDGX1caI116UxuXcWzid7G
         BpQpq7TmQADig==
Received: by mail-ed1-f52.google.com with SMTP id q3so5363565edt.5;
        Thu, 02 Sep 2021 16:32:21 -0700 (PDT)
X-Gm-Message-State: AOAM531pmf+b6cnWRl5wAykcwmqLikYJGyUb6EHnF7HkvXmwOTPr3Isv
        D4Zn2g/EZZRC6Qb71uLnTN/HpKRa2xNrqUDY1A==
X-Google-Smtp-Source: ABdhPJycLgYARkg/m3hOc4WHpsXYKVG0oQ2LR7ICSZMV1BjFzJrqx7nH9R3KSEgDZ135ljqbSAxTS7LGdqw0PpvXpm4=
X-Received: by 2002:aa7:d351:: with SMTP id m17mr863165edr.72.1630625540273;
 Thu, 02 Sep 2021 16:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210824100027.25989-1-moudy.ho@mediatek.com> <20210824100027.25989-4-moudy.ho@mediatek.com>
 <YSU0TrfFCsaI1TqV@robh.at.kernel.org> <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
 <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
In-Reply-To: <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Fri, 3 Sep 2021 07:32:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ztP2c3qeF4cGBujdBWwdNrk-k14EPjD_yukH73L11qw@mail.gmail.com>
Message-ID: <CAAOTY_9ztP2c3qeF4cGBujdBWwdNrk-k14EPjD_yukH73L11qw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
To:     Rob Herring <robh@kernel.org>
Cc:     moudy ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, menghui.lin@mediatek.com,
        Sj Huang <sj.huang@mediatek.com>, ben.lok@mediatek.com,
        randy.wu@mediatek.com,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Hsin-Yi Wang <hsinyi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Rob:

Rob Herring <robh@kernel.org> =E6=96=BC 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:06=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Aug 30, 2021 at 2:58 AM moudy ho <moudy.ho@mediatek.com> wrote:
> >
> > On Tue, 2021-08-24 at 13:02 -0500, Rob Herring wrote:
> > > On Tue, Aug 24, 2021 at 06:00:25PM +0800, Moudy Ho wrote:
> > > > This patch adds DT binding document for Media Data Path 3 (MDP3)
> > > > a unit in multimedia system used for scaling and color format
> > > > convert.
> > > >
> > > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > > ---
> > > >  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  57 +++++
> > > >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 207
> > > > ++++++++++++++++++
> > > >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
> > > >  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
> > > >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
> > > >  5 files changed, 471 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > ccorr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > ccorr.yaml
> > > > new file mode 100644
> > > > index 000000000000..59fd68b46022
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > ccorr.yaml
> > > > @@ -0,0 +1,57 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id:
> > > > https://urldefense.com/v3/__http://devicetree.org/schemas/media/med=
iatek,mdp3-ccorr.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXd=
gy3_VCQg8MdsJP7n8TlxbGyajipusfH8hi$
> > > >
> > > > +$schema:
> > > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core=
.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n=
8TlxbGyajipi-OInix$
> > > >
> > > > +
> > > > +title: Mediatek Media Data Path 3 CCORR Device Tree Bindings
> > > > +
> > > > +maintainers:
> > > > +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> > > > +  - Moudy Ho <moudy.ho@mediatek.com>
> > > > +
> > > > +description: |
> > > > +  One of Media Data Path 3 (MDP3) components used to do color
> > > > correction with 3X3 matrix.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +        - mediatek,mt8183-mdp3-ccorr
> > > > +
> > > > +  mediatek,mdp3-id:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    maxItems: 1
> > > > +    description: |
> > > > +      HW index to distinguish same functionality modules.
> > >
> > > If we wanted h/w indexes in DT, we'd have a standard property. Why
> > > do
> > > you need this?
> > >
> > I'm sorry not quite sure what HW indexes means (something like
> > aliases?)
>
> It means whatever you said in your description.
>
> And no, I'm not suggesting you use aliases.

Because mediatek drm driver has the same problem with mdp driver, and
it has already use the aliases [1]. No matter what is the conclusion
for mdp driver, I think mediatek drm driver should align to this
conclusion. If the conclusion is to remove aliases, should I modify
the dts which has already upstreamed? Should mediatek drm driver be
backward-compatible with down stream dts which use aliases?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/mediatek/mt8173.dtsi?h=3Dv5.14

Regards,
Chun-Kuang.

>
> > It was originally used to mark multiple identical modules in the MDP
> > data path algorithm, so that appropriate paths can be dynamically
> > dispatched.
>
> If they are identical, then why do you need to distinguish them in DT?
> If there's some difference you need to know about such as connections
> to other blocks, then describe that. Another common example is needing
> to know what bits/registers to access in a syscon phandle. For that,
> make the register offset or bits be args to the phandle property.
>
> Rob
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
