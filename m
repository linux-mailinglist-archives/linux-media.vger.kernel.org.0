Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4021CCCC
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 18:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbfENQTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 12:19:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:49988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbfENQTw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 12:19:52 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A97320675;
        Tue, 14 May 2019 16:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557850790;
        bh=qzOY5O00XWu9ltpfoa6ZpPJ9ETaX0rvyq0x+5T3QeMY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LDdzJZZR0zPqXRSts4eVzoabG9u/04+N8xqmoyKWmbf9bfLaGGtz9FglclolDmYnc
         VZhBS8SikBU3vD2X6G3UwTY7OpwuBaiBqtgnyNhSEMA8zvk1JmOurOmilkncQnUGQp
         2XB0b0giGzlXj8r7kDAJSWMdrI7q6UUb+SC/5rR4=
Received: by mail-qt1-f173.google.com with SMTP id o7so19707724qtp.4;
        Tue, 14 May 2019 09:19:50 -0700 (PDT)
X-Gm-Message-State: APjAAAUheto7O8hskH/P/q72BYGdzGPbcUXAFpX7BCYCP83MQfxm7TT0
        zJPUMLgN9DgjB3MTtyqRfnksOVwyLbuHOsQ/8A==
X-Google-Smtp-Source: APXvYqy/kSHQj4PRwOSVHrR1mu6BOErL78nzm6ufh9vWL2uISjxCvFbdDDvbMa+HOHIkfJYRZbIMBn1G+SPJCs366Qo=
X-Received: by 2002:ac8:610f:: with SMTP id a15mr29576466qtm.257.1557850789752;
 Tue, 14 May 2019 09:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-2-frederic.chen@mediatek.com> <20190430011506.GA8514@bogus>
 <1557238925.11663.21.camel@mtksdccf07>
In-Reply-To: <1557238925.11663.21.camel@mtksdccf07>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 14 May 2019 11:19:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKGW9WqyNgqKD0MxsqxYHKZ+VNV5A2p+neGqwmKmiODOQ@mail.gmail.com>
Message-ID: <CAL_JsqKGW9WqyNgqKD0MxsqxYHKZ+VNV5A2p+neGqwmKmiODOQ@mail.gmail.com>
Subject: Re: [RFC PATCH V1 1/6] dt-bindings: mt8183: Add binding for DIP
 shared memory
To:     Frederic Chen <frederic.chen@mediatek.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        yuzhao@chromium.org, zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com,
        Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        devicetree@vger.kernel.org, shik@chromium.org,
        suleiman@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 7, 2019 at 9:22 AM Frederic Chen <frederic.chen@mediatek.com> wrote:
>
> Dear Rob,
>
> I appreciate your comments.
>
> On Mon, 2019-04-29 at 20:15 -0500, Rob Herring wrote:
> > On Wed, Apr 17, 2019 at 06:45:06PM +0800, Frederic Chen wrote:
> > > This patch adds the binding for describing the shared memory
> > > used to exchange configuration and tuning data between the
> > > co-processor and Digital Image Processing (DIP) unit of the
> > > camera ISP system on Mediatek SoCs.
> > >
> > > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > > ---
> > >  .../mediatek,reserve-memory-dip_smem.txt      | 45 +++++++++++++++++++
> > >  1 file changed, 45 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > > new file mode 100644
> > > index 000000000000..64c001b476b9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > > @@ -0,0 +1,45 @@
> > > +Mediatek DIP Shared Memory binding
> > > +
> > > +This binding describes the shared memory, which serves the purpose of
> > > +describing the shared memory region used to exchange data between Digital
> > > +Image Processing (DIP) and co-processor in Mediatek SoCs.
> > > +
> > > +The co-processor doesn't have the iommu so we need to use the physical
> > > +address to access the shared buffer in the firmware.
> > > +
> > > +The Digital Image Processing (DIP) can access memory through mt8183 IOMMU so
> > > +it can use dma address to access the memory region.
> > > +(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
> > > +
> > > +
> > > +Required properties:
> > > +
> > > +- compatible: must be "mediatek,reserve-memory-dip_smem"
> >
> > Don't use '_'.
>
> I got it. I will use "mediatek,reserve-memory-dip-smem" instead in next
> version of the patch
>
> >
> > > +
> > > +- reg: required for static allocation (see reserved-memory.txt for
> > > +  the detailed usage)
> > > +
> > > +- alloc-range: required for dynamic allocation. The range must
> > > +  between 0x00000400 and 0x100000000 due to the co-processer's
> > > +  addressing limitation
> >
> > Generally, you should pick either static or dynamic allocation for a
> > given binding. Static if there's some address restriction or sharing,
> > dynamic if not.
> >
> > Sounds like static in this case.
> >
>
> DIP reserved memory has address restriction so it is the static case. I
> would like to remove the dynamic allocation part and modify the
> description as following:
>
> - reg: required for DIP. The range must be between 0x00000400 and
>   0x100000000 due to the co-processor's addressing limitation.
>   The size must be 26MB. Please see reserved-memory.txt for the
>   detailed usage.

You can use dma-ranges to define addressing translations and
restrictions like this. That will in turn set the device's dma-mask to
ensure allocations are done in a region that is addressable.

But if you have a known, fixed size, then a carve out with
reserved-memory is fine.

Rob
