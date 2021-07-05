Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF4C3BB8A1
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 10:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhGEIMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 04:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhGEIMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 04:12:06 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D538C061760
        for <linux-media@vger.kernel.org>; Mon,  5 Jul 2021 01:09:30 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id y8so2553331iop.13
        for <linux-media@vger.kernel.org>; Mon, 05 Jul 2021 01:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ZBH9ykzeoMrqSlrgZpvseA7xgJC3UHZbKlTJSyxYYE=;
        b=vMJVUcrQnNHyGr1e2E/BBoCJ6Ml9vmYjG8w3y4ezQrmHEogj/M4Ky5n/R11b3OUHP+
         GA0To8jdS+EcmI5/P9/WIwMSOKXzdcpQ56ciPZXsLuzhCebjrvgAjKMVj0ZSx/Rh9bv+
         oXlnbv/La5iOfvDexZJU47ZVPg07ff2LAUCfOgs6Y1t84ZdmUZwHHXcFdMnDGr08ohIi
         jAg4g2iJ6DEwZqa8bdRZInOXHa9ciiu9rr19zEl8/2xix+m5y77dPZvww9IhHTwvkUIg
         fume5Bf4qhsquNTGV8+6wI8MJW55gP3FMqs1E+rG3ZTrB4s3NzG7t1aErBKD70HBEFdZ
         dY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZBH9ykzeoMrqSlrgZpvseA7xgJC3UHZbKlTJSyxYYE=;
        b=D2ZI7Dr11yEr6BE3pIp/t/ye15qBB1ohHwRSEuu1UvmSbJ2jtomBIq9spdVT5wQVV6
         U7CSrLv7lsfROCdWEE/+xPaehyXmNWNOWMaflbqfFTgU2ygyePwVlaok4pOBqpG53fO7
         o1+Qbm7WlA2eEKobmhRh9PsnqyEMdIiqqolHGXIv6v3flQwBcGZe5Y0yWHXWiMBDNvMT
         7/fkIAl1XDppjVMcDI5ZKKGACBWMsexiWDaS9rjClSTPuqnvPbGz0nkLAOEhRg8PxczU
         gOUDZAuvgL4ijo1l6mbVsBxAtuc02h9sT326t8R8ZuhtpIw5E+W69c8VaPNl2B/ICgLr
         69lg==
X-Gm-Message-State: AOAM5314qhe3NLxkQ8jsg6br9Toe+VTL4vuKltB/Xyxqog26E2BsyzgJ
        KLTwUUIvtcVHqh1eO1pHbcUOkUpWb2TftV5kXNRoBw==
X-Google-Smtp-Source: ABdhPJwhLvFCwfzhhvvHGLbA3HvWk2qBShYvoOt9KTiT7lVNLd4KXAYWkrfEYA95oI9qjWhL1m8bENMubRJRcwBEMEc=
X-Received: by 2002:a5e:a612:: with SMTP id q18mr10954029ioi.76.1625472569703;
 Mon, 05 Jul 2021 01:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
 <1624428350-1424-2-git-send-email-kyrie.wu@mediatek.com> <CA+Px+wW6PrYihYo8F2Op8XPfVHMmO7ODRQrF75DQxc4gRM-qfg@mail.gmail.com>
 <1625039759.22769.3.camel@mhfsdcap03>
In-Reply-To: <1625039759.22769.3.camel@mhfsdcap03>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 5 Jul 2021 16:09:18 +0800
Message-ID: <CA+Px+wUXK2t42S0HgcOj7_kbkSskHGris5LBquTS3d+hi8kCaQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtk-jpeg: Add binding for MT8195 JPG
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 30, 2021 at 3:56 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> Mt8195 has two hardwares, "mediatek,mt8195-jpgenc0" for hw0 and
> "mediatek,mt8195-jpgenc1" for HW1. These two nodes will register
> hardware interrupt, initialize clock, power domain, remap register base
> addr and other operations. But the device node is not registered.
> "mediatek,mt8195-jpgenc" will register the device node to represent jpeg
> encode device. Then the component framework is used to manage the above
> two hardwares.
Please don't top-posting.  Inline your replies so that people can
easily follow the discussion.

I still don't quite understand why it needs to introduce 2 compatible
strings.  If hw0 and hw1 are different from interrupts, clocks, power
domain, and etc, couldn't you use the same compatible string (e.g.
"mt8195-jpgenc") and provide them different DT attributes?

> On Fri, 2021-06-25 at 17:18 +0800, Tzung-Bi Shih wrote:
> > On Wed, Jun 23, 2021 at 2:06 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> > >  Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt | 3 +++
> > >  1 file changed, 3 insertions(+)
> > Note: the patch won't apply after [1].
> >
> > [1]: https://lore.kernel.org/patchwork/patch/1445298/
> >
> > >  Required properties:
> > >  - compatible : "mediatek,mt2701-jpgenc"
> > > +- compatible : "mediatek,mt8195-jpgenc"
> > > +- compatible : "mediatek,mt8195-jpgenc0"
> > > +- compatible : "mediatek,mt8195-jpgenc1"
> > Why it needs 3 compatible strings?
