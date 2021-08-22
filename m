Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DE43F3FC3
	for <lists+linux-media@lfdr.de>; Sun, 22 Aug 2021 16:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhHVOd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 10:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbhHVOd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 10:33:26 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C182BC061756
        for <linux-media@vger.kernel.org>; Sun, 22 Aug 2021 07:32:44 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id mf2so12592203ejb.9
        for <linux-media@vger.kernel.org>; Sun, 22 Aug 2021 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vg4WCN3mkUp7qTb1jC4H7HoR8bVBq2cRQ0LNC0/9UWg=;
        b=ARWJ7A13oKc6fIxvw1k6Tm3IRISZ4Wl5pRZGhmInO+/UuRhfXxmF4UlzkQq6B9PNd0
         3PbIuOwy4cG1+RlEY8Lmu5vYXOV5RWJmfjS7A+kKcKk75gYQ1fDNfHMyWr42KbESHSpy
         /DCZOECf5bc0aT0KIHganVfoCgkWEq94J9NsBr3eIYkBsRVkfPnb2RpwVgBuuwhCnV4g
         +NnbEzb83r2TRzwKZk4qSx8gVgeRpH+ZYAqBFZk/hlTuiiK/ir3OtEQ5sZ47+icwDPKc
         oReth/2/pskOUmmLo5yDUF4GlOpSQTOXgiS+ZPZcT11jisTUj4DV2P+sjWE3mAfcKFX8
         HaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vg4WCN3mkUp7qTb1jC4H7HoR8bVBq2cRQ0LNC0/9UWg=;
        b=caQgzsiVv8X8gaBO4hFq1ljdPDgPehslnLrpRkBaZMXIq8QoiCmWqvUNyT1fHyzl+7
         qNv6YUtdQLYRMOVInz1v2X4r/YZUS2/aY9Q/3oqqvlGmOoTXFBMumjomQrSHIYiiVErE
         y3cnxsrRPMXSNCGPr5X/t4+VPDGKi6v7xXHAcFkny4bcaxpZklk9GAdn0dcG4BZmi6Q2
         a5eZPhHMXSc7BK/uPGt5GXosMO5cDexCT2pz10SO02mcBXMwDk7c1MQrv5gyliQhd9rG
         wFTKQswcSXYBsg35RSBUYMjrql/h/1ikmC8URJ2NZm5vIGQmc8OQq+XvKCC6jrcmMA0V
         mK7A==
X-Gm-Message-State: AOAM532VLD3MykdarMMZml2HSZ+3zJKN6aEdNdEdhF3qdBOdW+/eJTe/
        vVGSKlev7ZOH+KTlFzicXdJ4lHWp+M5EAmr1BuBeZg==
X-Google-Smtp-Source: ABdhPJw5LCjDQ9tRbHA/p3KiLXSnjc2x8oAhJStrqYw99HufdNCAiPBvAvvFJ1Z/wM2OjbFxyQQwDSve9mRXAa+1qmw=
X-Received: by 2002:a17:906:2ad5:: with SMTP id m21mr31110981eje.88.1629642763303;
 Sun, 22 Aug 2021 07:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
 <CAAEAJfCTrKj9AFExN-L-TKww4E=us1VVh8LHtZ8Q0j_eaCD4Eg@mail.gmail.com> <1629446378.18871.27.camel@mhfsdcap03>
In-Reply-To: <1629446378.18871.27.camel@mhfsdcap03>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 22 Aug 2021 11:32:32 -0300
Message-ID: <CAAEAJfCdvj4drV+YSbvyR30b0+50RpJcOYdEoNODTdrAoL6+vA@mail.gmail.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
To:     "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        George Sun <george.sun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 20 Aug 2021 at 04:59, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Ezequiel,
>
> Thanks for your detail feedback.
>
> On Thu, 2021-08-19 at 11:10 -0300, Ezequiel Garcia wrote:
> > On Thu, 19 Aug 2021 at 04:13, yunfei.dong@mediatek.com
> > <yunfei.dong@mediatek.com> wrote:
> > >
> > > Hi Ezequiel,
> > >
> > > Thanks for your suggestion.
> > >
> > > On Wed, 2021-08-18 at 11:11 -0300, Ezequiel Garcia wrote:
> > > > +danvet
> > > >
> > > > Hi,
> > > >
> > > > On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com>
> > > > wrote:
> > > > >
> > > > > This series adds support for multi hardware decode into mtk-vcodec,
> > > > > by first
> > > > > adding component framework to manage each hardware information:
> > > > > interrupt,
> > > > > clock, register bases and power. Secondly add core thread to deal
> > > > > with core
> > > > > hardware message, at the same time, add msg queue for different
> > > > > hardware
> > > > > share messages. Lastly, the architecture of different specs are not
> > > > > the same,
> > > > > using specs type to separate them.
> > > > >
> > > >
> > > > I don't think it's a good idea to introduce the component API in the
> > > > media subsystem. It doesn't seem to be maintained, IRC there's not
> > > > even
> > > > a maintainer for it, and it has some issues that were never
> > > > addressed.
> > > >
> > > > It would be really important to avoid it. Is it really needed in the
> > > > first place?
> > > >
> > > > Thanks,
> > > > Ezequiel
> > >
> > > For there are many hardware need to use, mt8192 is three and mt8195 is
> > > five. Maybe need more to be used in the feature.
> > >
> > > Each hardware has independent clk/power/iommu port/irq.
> > > Use component interface in prob to get each component's information.
> > > Just enable the hardware when need to use it, very convenient and
> > > simple.
> > >
> > > I found that there are many modules use component to manage hardware
> > > information, such as iommu and drm etc.
> > >
> >
> > Many drivers support multiple hardware variants, where each variant
> > has a different number of clocks or interrupts, see for instance
> > struct hantro_variant which allows to expose different codec cores,
> > some having both decoder/encoder, and some having just a decoder.
> >
> > The component API is mostly used by DRM to aggregate independent
> > subdevices (called components) into an aggregated driver.
> >
> > For instance, a DRM driver needs to glue together the HDMI, MIPI,
> > and plany controller, or any other hardware arrangement where
> > devices can be described independently.
> >
> The usage scenario is very similar with drm and iommu, So decide to use
> component framework.
> Decode has three/five or more hardwares, these hardware are independent.
> For mt8183 just need core hardware to decode, but mt8192 has lat,soc and
> core hardware to decode. When lat need to use, just enable lat hardware,
> core is the same.And mt8195 will has two cores, each core can work well
> independent.
>
> For each component device just used to open their power/clk/iommu
> port/irq when master need to enable it. The main logic is in master
> device.
>
> > The component API may look simple but has some issues, it's not easy
> > to debug, and can cause troubles if not used as expected [1].
> > It's worth making sure you actually need a framework
> > to glue different devices together.
> >
> Each hardware has its index, master can get hardware information
> according these index, looks not complex. What do you mean about not
> easy to debug?
>
> > > Do you have any other suggestion for this architecture?
> > >
> >
> > Looking at the different patchsets that are posted, it's not clear
> > to me what exactly are the different architectures that you intend
> > to support, can you some documentation which clarifies that?
> >
> Have five hardwares lat,soc,core0,core1 and main. Lat thread can use lat
> soc and main, core thread can use soc,lat, core0 and core1. Core thread
> can be used or not for different project.

Can you explain what are these lat,soc and core threads for?

> Also Need to use these
> hardware dynamic at the same time. So I use component framework, just
> need to know the used  hardware index according to different
> project.Need not to do complex logic to manage these hardwares.
>

I am not thrilled to see the component framework introduced to the
media subsystem. Like I said, it has no clear maintainer, and it's not
easy to use.

The media subsystem has some support which AFAIK does the same thing,
see v4l2-async, which is maintained by media people.

Please push a branch based on media/master containing these changes.
I see there are other patch series for this device, but it's hard to track
which goes first, etc.

Thanks,
Ezequiel
