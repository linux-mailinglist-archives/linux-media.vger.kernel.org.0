Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8881EE915
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 19:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbgFDREu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 13:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729929AbgFDREu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 13:04:50 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B82C08C5C0
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 10:04:50 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id d1so6771822ila.8
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 10:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZGYrxbx6t1ErJiayUND7aKrPL6QsSK9diYLbw5ncT4c=;
        b=JDnGSkmAnJ6IisnXCueIELE01XqL66KVEuY+MuZCzlQl45rCvZyBG99mFOSYmeMKlh
         w7CLVAagiQuPjaq7aPQOCzCmzTragemyLtphK4bhoXEZIYagfLEUkcCkfAtt4BQlm8c1
         3wVfHy2NEYofvvSya+yTKrFGG2XSh4fYQsNE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZGYrxbx6t1ErJiayUND7aKrPL6QsSK9diYLbw5ncT4c=;
        b=H9PnwJcwTvUl6p26rYcCsaDbwLLdVGc5SG4vPasSgYTQ4bCYQ3q2X5ieiBO4HVUaxI
         4AhEIbUmMXtcMIkBTo7oiuZQx8uIf4NuQ0+DjG/r6XegziEOcWCuaGG+ZpFuxzwxL+yM
         +adgfBqCLq3ZrK0xBTeRWq3O/nS6MpIp6mqNkQXjoo4AtvGGoaIPPVPZi4RL1ps5z4ZF
         xu6NZeX2CMvrQxzZ+5W78/CyUVW0iosqAq44BOXyxH3QZ/6Xz/B/OB2fLUoUB1MfDjFw
         tE3a7AMqwZr57INvh+RzDEyhGi9RtdTgQMldfOGQ4y6fID5vprEyj55yYa3bt9A5f+ts
         QhUg==
X-Gm-Message-State: AOAM531747IMpxP/8mEqBOYNIU/Aqf4ugPy71i8ESRnLGX7O75n3scfx
        BCsqjOmmcVg3/fqzLbpTjhML/lD8g4GIrg0rJlZmdg==
X-Google-Smtp-Source: ABdhPJxMSMjSnOySAQvozCjtyVCvmI/Oz3mJHNlNBTppPLGujpj+oHukiPY+KlolVwZutNvn/wJyykDWv64y4F5agtE=
X-Received: by 2002:a92:8986:: with SMTP id w6mr4290901ilk.253.1591290289516;
 Thu, 04 Jun 2020 10:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200529130405.929429-1-maxime.chevallier@bootlin.com>
 <CAAFQd5AVD+LhYZziqNUfga1sCp98MMu+ESgBMagS1n6++ae=pg@mail.gmail.com> <1779471.kMuJgyiE6z@diego>
In-Reply-To: <1779471.kMuJgyiE6z@diego>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 4 Jun 2020 19:04:37 +0200
Message-ID: <CAHD77HkHFRuqCWmiuB2ou6F67u3bTSpUKJTX5d_ouGuUgT_jag@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] media: rockchip: Introduce driver for the camera
 interface on PX30
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 1, 2020 at 11:38 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Tomasz,
>
> Am Montag, 1. Juni 2020, 20:45:14 CEST schrieb Tomasz Figa:
> > On Fri, May 29, 2020 at 3:04 PM Maxime Chevallier
> > <maxime.chevallier@bootlin.com> wrote:
> > >
> > > Hello everyone,
> > >
> > > Here's a V2 of the series adding very basic support for the camera in=
terface on
> > > the Rockchip PX30 SoC.
> > >
> > > Thanks to everyone that commented on the first series, your reviews w=
ere
> > > very helpful :)
> > >
> > > This Camera Interface is also supported on other Rockchip SoC such as
> > > the RK1808, RK3128, RK3288 and RK3288, but for now I've only been abl=
e to
> > > test it on the PX30, using a PAL format.
> >
> > How does this hardware relate to the one handled by the rkisp1 driver
> > that is available under staging/media/rkisp1? It was written with
> > RK3399 in mind, but I have a loose recollection that the hardware in
> > RK3288 was roughly the same.
>
> (un-)educated guess would be that the rk3288 has both.
>
> When introducing new IPs Rockchip often keeps the previous incarnation
> around - probably as a fallback.
>
> From a bit of digging around manuals and vendor-dtsi [0] I found:
>
> in rk3288.dtsi both:
> - isp: isp@ff910000
> - cif_isp0: cif_isp@ff910000
>
> - grf_con_disable_isp in GRF_SOC_CON6
> - dphy_rx1_src_sel (1: isp, 0: csi host) in GRF_SOC_CON14
>

Makes sense. Thanks!

Right now the rkisp1 driver doesn't support rk3288, because we didn't
have any way to test it, but it shouldn't require much changes to do
so. If that happens, I wonder how one would select between the two
hardware blocks?

Best regards,
Tomasz

>
> Heiko
>
>
> [0] https://github.com/rockchip-linux/kernel/blob/develop-4.4/arch/arm/bo=
ot/dts/rk3288.dtsi
>
>
> > +Helen Koike +Dafna Hirschfeld working on the rkisp1 driver.
> >
> > Best regards,
> > Tomasz
> >
> > >
> > > This driver is mostly based on the driver found in Rockchip's BSP, th=
at
> > > has been trimmed down to support the set of features that I was able =
to test,
> > > that is pretty much a very basic one-frame capture and video streamin=
g
> > > with GStreamer.
> > >
> > > This first draft only supports the Parallel interface, although the
> > > controller has support for BT656 and CSI2.
> > >
> > > Finally, this controller has an iommu that could be used in this driv=
er,
> > > but as of today I've not been able to get it to work.
> > >
> > > Any review is welcome.
> > >
> > > Thanks,
> > >
> > > Maxime
> > >
> > > --- Changes since V1 ---
> > >
> > >  - Took reviews from Rob, Hans, Robin and Heiko into account :
> > >   - Renamed the clocks in the binding
> > >   - Fixed the DT schema compiling
> > >   - Fixed a few typos
> > >   - Used the clk bulk API
> > >   - Used the reset array API
> > >   - Changed a few helpers for more suitable ones
> > >   - Rebased on 5.7-rc7
> > >
> > >
> > >
> > > Maxime Chevallier (3):
> > >   media: dt-bindings: media: Document Rockchip CIF bindings
> > >   media: rockchip: Introduce driver for Rockhip's camera interface
> > >   arm64: dts: rockchip: Add the camera interface description of the P=
X30
> > >
> > >  .../bindings/media/rockchip-cif.yaml          |  100 ++
> > >  arch/arm64/boot/dts/rockchip/px30.dtsi        |   12 +
> > >  drivers/media/platform/Kconfig                |   13 +
> > >  drivers/media/platform/Makefile               |    1 +
> > >  drivers/media/platform/rockchip/cif/Makefile  |    3 +
> > >  drivers/media/platform/rockchip/cif/capture.c | 1170 +++++++++++++++=
++
> > >  drivers/media/platform/rockchip/cif/dev.c     |  358 +++++
> > >  drivers/media/platform/rockchip/cif/dev.h     |  213 +++
> > >  drivers/media/platform/rockchip/cif/regs.h    |  256 ++++
> > >  9 files changed, 2126 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/rockchip-=
cif.yaml
> > >  create mode 100644 drivers/media/platform/rockchip/cif/Makefile
> > >  create mode 100644 drivers/media/platform/rockchip/cif/capture.c
> > >  create mode 100644 drivers/media/platform/rockchip/cif/dev.c
> > >  create mode 100644 drivers/media/platform/rockchip/cif/dev.h
> > >  create mode 100644 drivers/media/platform/rockchip/cif/regs.h
> > >
> > > --
> > > 2.25.4
> > >
> >
>
>
>
>
