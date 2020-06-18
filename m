Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A231FF219
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 14:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbgFRMky (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 08:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728017AbgFRMky (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 08:40:54 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F038C06174E
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 05:40:52 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id w16so6244336ejj.5
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=abF6OHbZnM7Q08OSXibHTxV15MlmdycHsIUv8D1tav8=;
        b=h1N4X47aPUwFQwS2Mc5NzhUIk+Bs+X6bsXwxwA2AzzEY+0YaOIwLv36kv2NTGtQKgk
         Io6/9xE4BPRlAhQEAlqdq1+Yw0CvLAcXYane9bTsjd5HKbUOChp/YES+P3hEi4ES2ndB
         uW/W6wCFtAAluYTlm8iFGgu5akQ7Jb3f+w2Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=abF6OHbZnM7Q08OSXibHTxV15MlmdycHsIUv8D1tav8=;
        b=pS9KW59g7anQH2aEz9316vitqHI6XHGl7A514z8Z4+ApprHbkNpgvZBI1ZE0kb3odh
         kyumCGfkVDMA7QrwzhBQTn24m1vWeGrLi0KJUfjK0ZmAiSXwHg4H56EiFE//1wg+az8f
         F2OHsrOhXnzyhcglPdZFcdhegEX6OGpy+8tR8GOSKwebs4KOP+9lwKJQvNcVtUdfpIL2
         KISk2lGfQ56A8C2rttlFhrRD2mnzH/aeT8YRdDwkgAu0tD4HU63GvUwNPHnareGd0AVZ
         9cGPqk2fY2t1y3AIkSA3rkdajIbv7G7OYe7wKeoSMZfOL7bCQbs4huWcF1ViKzZyXjBO
         E5oQ==
X-Gm-Message-State: AOAM532JdIbb2G+txyda4DTFfqWgdUkCSyYV5mQbCn5pYnd+3HEm5YdM
        5+lF+JEQhoe9VsH31XYU4nlRwWmAWiKPFA==
X-Google-Smtp-Source: ABdhPJyu80RRFCg1Q7G6cJV12Q3miN2jAwACC5ude3X0UENmTCHoy1r1E14iAWBDu5rYMXAulPj5eQ==
X-Received: by 2002:a17:906:ce47:: with SMTP id se7mr3696128ejb.149.1592484050966;
        Thu, 18 Jun 2020 05:40:50 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id cb6sm2063866edb.18.2020.06.18.05.40.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 05:40:50 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id u26so6587163wmn.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 05:40:50 -0700 (PDT)
X-Received: by 2002:a1c:4189:: with SMTP id o131mr3620052wma.183.1592483701237;
 Thu, 18 Jun 2020 05:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200403094033.8288-1-xia.jiang@mediatek.com> <20200403094033.8288-12-xia.jiang@mediatek.com>
 <20200521160046.GJ209565@chromium.org> <1592451616.15355.25.camel@mhfsdcap03>
In-Reply-To: <1592451616.15355.25.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 18 Jun 2020 14:34:50 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Axc7RKcY_p-368GC7awx=SRKDTxxjjCibPwSOQ2FXpsA@mail.gmail.com>
Message-ID: <CAAFQd5Axc7RKcY_p-368GC7awx=SRKDTxxjjCibPwSOQ2FXpsA@mail.gmail.com>
Subject: Re: [PATCH v8 11/14] media: dt-bindings: Add jpeg enc device tree
 node document
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        mojahsu@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
        =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= 
        <maoguang.meng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <yong.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 18, 2020 at 5:43 AM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> On Thu, 2020-05-21 at 16:00 +0000, Tomasz Figa wrote:
> > Hi Xia,
> >
> > On Fri, Apr 03, 2020 at 05:40:30PM +0800, Xia Jiang wrote:
> > > Add jpeg enc device tree node document
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > > ---
> > > v8: no changes
> > >
> > > v7: no changes
> > >
> > > v6: no changes
> > >
> > > v5: no changes
> > >
> > > v4: no changes
> > >
> > > v3: change compatible to SoC specific compatible
> > >
> > > v2: no changes
> > > ---
> > >  .../bindings/media/mediatek-jpeg-encoder.txt  | 37 +++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> > >
> >
> > Thank you for the patch. Please see my comments inline.
> Dear Tomasz,
>
> Sorry for missing this message. Replied below.
> >
> > > diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> > > new file mode 100644
> > > index 000000000000..fa8da699493b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> > > @@ -0,0 +1,37 @@
> > > +* MediaTek JPEG Encoder
> > > +
> > > +MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> > > +
> > > +Required properties:
> > > +- compatible : should be one of:
> > > +               "mediatek,mt2701-jpgenc"
> > > +               ...
> >
> > What does this "..." mean?
> "..." means that compatible name is not just "mediatek,mt2701-jpgenc",
> different project has different compatible name(for example the MT8173's
> compatible name may be "mediatek,mt8173-jpgenc").

The bindings need to list all the currently defined compatible strings
explicitly.

> >
> > > +               followed by "mediatek,mtk-jpgenc"
> > > +- reg : physical base address of the JPEG encoder registers and length of
> > > +  memory mapped region.
> > > +- interrupts : interrupt number to the interrupt controller.
> > > +- clocks: device clocks, see
> > > +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> > > +- clock-names: must contain "jpgenc". It is the clock of JPEG encoder.
> >
> > nit: In principle the clocks should be named after the function the clock
> > performs on the consumer side, i.e. the JPEG block in this case, I guess
> > here it's just a generic clock that does everything, but I guess it comes
> > from somewhere. Is it the AHB clock or something? In that case it would
> > normally be called "ahb".
> I have confirmed with hardware designer that the jpeg clock is not AHB
> clock,it follows subsys clock(because 2701 is the old IC,I didn't get
> the source name).It has the same source with venc clock.We can see that
> the clocks = <imgsys CLK_IMG_VENC>, Should I name it "venc" or the
> orignal "jpgenc"?

The clock name of the device-side bindings is the name of the input of
the device itself, no matter where the clock comes from in the SoC. I
guess if there is no specific purpose of this clock, "jpgenc" is as
good as any other name (e.g. "clock"), so feel free to keep it.

> >
> > > +- power-domains: a phandle to the power domain, see
> > > +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> > > +- mediatek,larb: must contain the local arbiters in the current SoCs, see
> > > +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > > +  for details.
> >
> > I believe this isn't necessary anymore, because larbs are added
> > automatically by the MTK IOMMU driver using device links. +CC Yong who
> > worked on that.
> Yes,I have confirmed with Yong that he will help me to modify this.Is it
> ok that I keep the orignal larb code?

I guess it depends on the order of landing the patches. If we intend
to land this series before the larb removal series, the binding should
stay as is. If the other way around, this should be removed. Please
coordinate with Yong.

Best regards,
Tomasz
