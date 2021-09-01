Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36E43FD778
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 12:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbhIAKR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 06:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbhIAKR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 06:17:26 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F44C061760
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 03:16:29 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x27so5329889lfu.5
        for <linux-media@vger.kernel.org>; Wed, 01 Sep 2021 03:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=729GdT2MAhx/jAkVDNeGvCJtX9tbrZQ8mIDJwfE61ws=;
        b=TsbNK53CZn8ef5BEtVqTZyY/QDW8Rq4bPoXqq311KEaLylPbm35GPM9rS4+xye8UcH
         lIILdVPttftswk9PX0ZAsCjLZtKtqLoNdXChK9JCKAJm8Y/XoCjVdQHOqPO75UOli1ey
         8KKDxOap/6WYDNgiMTqySf7cXWC/ufsRxAWdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=729GdT2MAhx/jAkVDNeGvCJtX9tbrZQ8mIDJwfE61ws=;
        b=lRdDxADO53Jom5XASUYMXV+WqUtsoopkhaNa8VAq86myJ4bezz+YEHr+sksqQnsSYz
         zz4/HdFOd8Ny6mIajlqflq1zTs8GaUTOrZWcNAoQ4ZlcdqEpcu1K6YjH3Jt1y37+Rcg5
         gy9WoB4OTmIl/fiEgFPyauODBP/25XSat2Y9zwrsQNXnHpsx2NOerC93MIbD/b566MaD
         IIUy+J/ohaG5IHLyh8HDDde9XEIyG/V23ZgenPSJF0pJJp2Ye8nmVrSB46svhvvbXewh
         Xnm0W/dYxqkaGlFQ0Y+q4KVgrH1AiP5zEwFrvIeMPCiL3tvpmun2knZ7EWRJS13X6pdN
         Ktsw==
X-Gm-Message-State: AOAM531xzLJEN7ZS2/r8Zdf78H+Ux99GHN2q9N0U7sYGc9TVTXVoApO9
        Fn/kXoUcsgjHr5/KrsZeXaflK2UDUQZ2iDKz/nVtQw==
X-Google-Smtp-Source: ABdhPJzaTQkdiTWOurV0MnyL5l8QjDiVDjzLfxezvLdsHxF6QsQIIMyf5M3YfDpHJWqLL0lbsbOs8FiJmtRBVKXRcv0=
X-Received: by 2002:a05:6512:318a:: with SMTP id i10mr3805568lfe.444.1630491388108;
 Wed, 01 Sep 2021 03:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210824100027.25989-1-moudy.ho@mediatek.com> <20210824100027.25989-4-moudy.ho@mediatek.com>
 <YSU0TrfFCsaI1TqV@robh.at.kernel.org> <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
 <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com> <39cec599a65eeb142cb7e729f954098a25652b2b.camel@mediatek.com>
In-Reply-To: <39cec599a65eeb142cb7e729f954098a25652b2b.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 1 Sep 2021 18:16:16 +0800
Message-ID: <CAGXv+5GtDNwKpXEnont+UshVrSugQnTPyNF7VF3dVzTX9ruNdw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
To:     moudy ho <moudy.ho@mediatek.com>
Cc:     Rob Herring <robh@kernel.org>,
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
        Devicetree List <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, menghui.lin@mediatek.com,
        Sj Huang <sj.huang@mediatek.com>, ben.lok@mediatek.com,
        Randy Wu <randy.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Hsin-Yi Wang <hsinyi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 1, 2021 at 5:04 PM moudy ho <moudy.ho@mediatek.com> wrote:
>
> On Mon, 2021-08-30 at 10:05 -0500, Rob Herring wrote:
> > On Mon, Aug 30, 2021 at 2:58 AM moudy ho <moudy.ho@mediatek.com>
> > wrote:
> > >
> > > On Tue, 2021-08-24 at 13:02 -0500, Rob Herring wrote:
> > > > On Tue, Aug 24, 2021 at 06:00:25PM +0800, Moudy Ho wrote:
> > > > > This patch adds DT binding document for Media Data Path 3
> > > > > (MDP3)
> > > > > a unit in multimedia system used for scaling and color format
> > > > > convert.
> > > > >
> > > > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > > > ---
> > > > >  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  57 +++++
> > > > >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 207
> > > > > ++++++++++++++++++
> > > > >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
> > > > >  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
> > > > >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
> > > > >  5 files changed, 471 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > ccorr.yaml
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > ccorr.yaml
> > > > > b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > ccorr.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..59fd68b46022
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > ccorr.yaml
> > > > > @@ -0,0 +1,57 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id:
> > > > >
> https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-ccorr.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipusfH8hi$
> > > > >
> > > > > +$schema:
> > > > >
> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipi-OInix$
> > > > >
> > > > > +
> > > > > +title: Mediatek Media Data Path 3 CCORR Device Tree Bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> > > > > +  - Moudy Ho <moudy.ho@mediatek.com>
> > > > > +
> > > > > +description: |
> > > > > +  One of Media Data Path 3 (MDP3) components used to do color
> > > > > correction with 3X3 matrix.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - enum:
> > > > > +        - mediatek,mt8183-mdp3-ccorr
> > > > > +
> > > > > +  mediatek,mdp3-id:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    maxItems: 1
> > > > > +    description: |
> > > > > +      HW index to distinguish same functionality modules.
> > > >
> > > > If we wanted h/w indexes in DT, we'd have a standard property.
> > > > Why
> > > > do
> > > > you need this?
> > > >
> > >
> > > I'm sorry not quite sure what HW indexes means (something like
> > > aliases?)
> >
> > It means whatever you said in your description.
> >
> > And no, I'm not suggesting you use aliases.
>
> Sorry for the inaccuracy described here, the comment i mentioned before
> should be "standard property" instead of "HW index".
>
> > > It was originally used to mark multiple identical modules in the
> > > MDP
> > > data path algorithm, so that appropriate paths can be dynamically
> > > dispatched.
> >
> > If they are identical, then why do you need to distinguish them in
> > DT?
> > If there's some difference you need to know about such as connections
> > to other blocks, then describe that. Another common example is
> > needing
> > to know what bits/registers to access in a syscon phandle. For that,
> > make the register offset or bits be args to the phandle property.
> >
> > Rob
>
> Integrating the previous discussion, maybe I can revise the description
> to the following:
>     description: |
>       There may be multiple blocks with the same function but different
>       addresses in MDP3. In order to distinguish the connection with
>       other blocks, a unique ID is needed to dynamically use one or
>       more identical blocks to implement multiple pipelines.

With display pipelines it is common to describe the pipeline with an OF
graph. With the pipeline drawn out, you also get ways to derive identifiers
for otherwise identical blocks, such as from port IDs.

See Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
and arch/arm/boot/dts/sun9i-a80.dtsi for such an example.


ChenYu
