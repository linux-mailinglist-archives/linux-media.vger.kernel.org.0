Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B833A1FF5C
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 08:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfEPGMq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 02:12:46 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33943 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfEPGMq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 02:12:46 -0400
Received: by mail-lf1-f68.google.com with SMTP id v18so1669672lfi.1
        for <linux-media@vger.kernel.org>; Wed, 15 May 2019 23:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m8h2qGhJXexlZb92JzkwEQ/P4hBp4dKDlpHUHiZAB0o=;
        b=g8xowfc0K6UdPYmn3ArPMZFjU7qfFh4F/4ON1m7lE6SOJovSSFXHVv1UiavBfVCG2l
         q7pZYKU88gyD/qOVszluU3b1hMqu8rFRTHgCTMho+jGXuZ9JcaBdoFQYvTKEVsLZZM1P
         cvUqkCuERqLxmtBXW/rghMJ0t316OS8OAaFL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m8h2qGhJXexlZb92JzkwEQ/P4hBp4dKDlpHUHiZAB0o=;
        b=BEREVnaTqiDpAKM2O7fa+gPO8xTRF8AXlwOtCV5p11BnjUUVJaRUKZ+8EObGnK8qo7
         WBVZ5juqaphacp146TdLtQmlVPgL7XqDXnV+0WHqC70cUVwqznfbZiIc499UMHnGOH6i
         6Z7IEf0KAABpndv06D9+l+2wGKqO3192/V9Q/ZrdYzkSqa2tUQzQM4sd1iHGaSGBjfqy
         Lg2z9PlzIB9Y44CRpI12eYFbCaiX1dS5hWLYuw1juNhAd3i1HPPLTrrUgC/DTYUTFm+0
         Uf5PMqhRS02HaZCpX4SalFwD7xZfLtjgy0LAGZuPKKYZxSY5PuwlRQxc8NrFSXIwB8P4
         NlrA==
X-Gm-Message-State: APjAAAXet2+ochR3TPFWNkJNAsxfoNyOZcLLN7uZUReMeYm/NfKdzCtd
        7Tt7fwLb4I0DZqoJSBX/vWIYsaGAGMw=
X-Google-Smtp-Source: APXvYqxU9HUXLqXv+SXE8jHJ2E1CmoFtjrzyn42Ig0c6d+5Qapy2p7hwtkHXXO4v4KCxTf4Wn4YatQ==
X-Received: by 2002:ac2:424b:: with SMTP id m11mr8543792lfl.71.1557987163429;
        Wed, 15 May 2019 23:12:43 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id j69sm792415ljb.72.2019.05.15.23.12.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 23:12:42 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id y10so1669272lfl.3
        for <linux-media@vger.kernel.org>; Wed, 15 May 2019 23:12:42 -0700 (PDT)
X-Received: by 2002:ac2:4899:: with SMTP id x25mr18443319lfc.44.1557987161731;
 Wed, 15 May 2019 23:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-2-frederic.chen@mediatek.com> <20190430011506.GA8514@bogus>
 <1557238925.11663.21.camel@mtksdccf07> <CAL_JsqKGW9WqyNgqKD0MxsqxYHKZ+VNV5A2p+neGqwmKmiODOQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKGW9WqyNgqKD0MxsqxYHKZ+VNV5A2p+neGqwmKmiODOQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 16 May 2019 15:12:30 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BVWjcxp9Tia9Pmgn_54bc9n5Vs1s__G7YWHiezfVVYpA@mail.gmail.com>
Message-ID: <CAAFQd5BVWjcxp9Tia9Pmgn_54bc9n5Vs1s__G7YWHiezfVVYpA@mail.gmail.com>
Subject: Re: [RFC PATCH V1 1/6] dt-bindings: mt8183: Add binding for DIP
 shared memory
To:     Rob Herring <robh@kernel.org>
Cc:     Frederic Chen <frederic.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        yuzhao@chromium.org, zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= 
        <holmes.chiou@mediatek.com>,
        Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        devicetree@vger.kernel.org, Shik Chen <shik@chromium.org>,
        suleiman@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 15, 2019 at 1:19 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, May 7, 2019 at 9:22 AM Frederic Chen <frederic.chen@mediatek.com> wrote:
> >
> > Dear Rob,
> >
> > I appreciate your comments.
> >
> > On Mon, 2019-04-29 at 20:15 -0500, Rob Herring wrote:
> > > On Wed, Apr 17, 2019 at 06:45:06PM +0800, Frederic Chen wrote:
> > > > This patch adds the binding for describing the shared memory
> > > > used to exchange configuration and tuning data between the
> > > > co-processor and Digital Image Processing (DIP) unit of the
> > > > camera ISP system on Mediatek SoCs.
> > > >
> > > > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > > > ---
> > > >  .../mediatek,reserve-memory-dip_smem.txt      | 45 +++++++++++++++++++
> > > >  1 file changed, 45 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > > > new file mode 100644
> > > > index 000000000000..64c001b476b9
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > > > @@ -0,0 +1,45 @@
> > > > +Mediatek DIP Shared Memory binding
> > > > +
> > > > +This binding describes the shared memory, which serves the purpose of
> > > > +describing the shared memory region used to exchange data between Digital
> > > > +Image Processing (DIP) and co-processor in Mediatek SoCs.
> > > > +
> > > > +The co-processor doesn't have the iommu so we need to use the physical
> > > > +address to access the shared buffer in the firmware.
> > > > +
> > > > +The Digital Image Processing (DIP) can access memory through mt8183 IOMMU so
> > > > +it can use dma address to access the memory region.
> > > > +(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
> > > > +
> > > > +
> > > > +Required properties:
> > > > +
> > > > +- compatible: must be "mediatek,reserve-memory-dip_smem"
> > >
> > > Don't use '_'.
> >
> > I got it. I will use "mediatek,reserve-memory-dip-smem" instead in next
> > version of the patch
> >
> > >
> > > > +
> > > > +- reg: required for static allocation (see reserved-memory.txt for
> > > > +  the detailed usage)
> > > > +
> > > > +- alloc-range: required for dynamic allocation. The range must
> > > > +  between 0x00000400 and 0x100000000 due to the co-processer's
> > > > +  addressing limitation
> > >
> > > Generally, you should pick either static or dynamic allocation for a
> > > given binding. Static if there's some address restriction or sharing,
> > > dynamic if not.
> > >
> > > Sounds like static in this case.
> > >
> >
> > DIP reserved memory has address restriction so it is the static case. I
> > would like to remove the dynamic allocation part and modify the
> > description as following:
> >
> > - reg: required for DIP. The range must be between 0x00000400 and
> >   0x100000000 due to the co-processor's addressing limitation.
> >   The size must be 26MB. Please see reserved-memory.txt for the
> >   detailed usage.
>
> You can use dma-ranges to define addressing translations and
> restrictions like this. That will in turn set the device's dma-mask to
> ensure allocations are done in a region that is addressable.
>
> But if you have a known, fixed size, then a carve out with
> reserved-memory is fine.

There is also another aspect here. The coprocessor that we're
allocating the memory for is behind an MPU that must be programmed
completely in one go and locked for security reasons to ensure that
the coprocessor itself doesn't rewrite the MPU settings. That means
that we need to have all the allocations completed before booting that
coprocessor.

To be honest, I'd adopt a completely different design here.

We're going to have a driver for that coprocessor (SCP) and IMHO any
shared memory areas should belong to it. Then, any specific drivers
talking to the firmware running on SCP should ask the SCP driver to
allocate some memory from its fixed pool. WDYT?

Best regards,
Tomasz
