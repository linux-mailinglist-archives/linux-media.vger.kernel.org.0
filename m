Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE82C2A7AE9
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 10:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgKEJqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 04:46:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgKEJqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 04:46:00 -0500
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C0AC0613D6
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 01:46:00 -0800 (PST)
Received: by mail-ua1-x942.google.com with SMTP id v16so143204uat.9
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 01:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPeVC0/yyKKsuDCRa2ABd9prVUPUc34ioExCTRmKEHc=;
        b=uufJzy4G7ts1PiE/L3wJVNCw2wP3NSOmawqIi/e2dVMD4Xd21IBA/Vm2yEuo3NRkIO
         5RTFPkxoUZgZvRGL3uCJhgSw/HE6fmf+IDx190dCfUqR+JPH8zXGsd6gelceLKdsJg6T
         W9tmGvZtl0GRilR/Tesuwpo7+anWJCeo6NBiNViKTK2V8/GqdsDZTq11ps7gJlbfeY+i
         pSoDKrE7a3V1srakOPqPG22Jy7SHWsEgoGIWEGTN0Htlxp1Nhn/YPfKpypwxo8uOWeve
         gx03c3qbD5se6hfduEKaO+xHmrhlxJQp6xOVJi1NkwG4/qLyzw5ZIE/FCeeFdhAUNOiH
         Ddqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPeVC0/yyKKsuDCRa2ABd9prVUPUc34ioExCTRmKEHc=;
        b=A0qFcAQA+AjleOIsQOIThqm1R8NS8E4VU00YOtCYQ6LP/ZQU9+Fnc10ly55EKH08OJ
         yJpHG2EuNWni/DK01GkRxI5NQ2LTa2mt1uzhLVxyHIv2WuUKZ7ONkdsqPNMkO2iYLJQ4
         K/d4WOkbUHGSJWckDxTXU7LcYUr1Ij/XaG0Y2ik6bT1wEU6HfepyimSoUsmih5cgVuLY
         GmJ29c0jAVfNTPMn01MEEiLzW27dqde4oJdZq9GVAyQUGXK5S8yjFTk+crxq/lD1nhys
         9llTF3d3jo3PkCOjDenoeGsHyhMjvB9eWH4mMFMZ2md1pAs6kRdsLMDAxpgpmsHvkwlM
         IfHQ==
X-Gm-Message-State: AOAM530v68reTG1+rCOlwra9xZodTy9E4L3llkbNN9KwyAQwPk4SMi7u
        hbjZ8c1Vdm3yfKgid9kQc/+FKIw5VWGep+vZLtIT5A==
X-Google-Smtp-Source: ABdhPJyQXmDq3VGXwDr0haDHSXpl4JtWo+uo7sQGY6XWLUZgE6Tj9Jyk5i5lU0labVUxd8mL5Fh6Hi6T+EuKK3uFWNY=
X-Received: by 2002:ab0:23d5:: with SMTP id c21mr548021uan.129.1604569559528;
 Thu, 05 Nov 2020 01:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20201104234427.26477-1-digetx@gmail.com>
In-Reply-To: <20201104234427.26477-1-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 5 Nov 2020 10:45:23 +0100
Message-ID: <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To:     Dmitry Osipenko <digetx@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Peter Chen <Peter.Chen@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-pwm@vger.kernel.org,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+ Viresh

On Thu, 5 Nov 2020 at 00:44, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Introduce core voltage scaling for NVIDIA Tegra20/30 SoCs, which reduces
> power consumption and heating of the Tegra chips. Tegra SoC has multiple
> hardware units which belong to a core power domain of the SoC and share
> the core voltage. The voltage must be selected in accordance to a minimum
> requirement of every core hardware unit.
>
> The minimum core voltage requirement depends on:
>
>   1. Clock enable state of a hardware unit.
>   2. Clock frequency.
>   3. Unit's internal idling/active state.
>
> This series is tested on Acer A500 (T20), AC100 (T20), Nexus 7 (T30) and
> Ouya (T30) devices. I also added voltage scaling to the Ventana (T20) and
> Cardhu (T30) boards which are tested by NVIDIA's CI farm. Tegra30 is now up
> to 5C cooler on Nexus 7 and stays cool on Ouya (instead of becoming burning
> hot) while system is idling. It should be possible to improve this further
> by implementing a more advanced power management features for the kernel
> drivers.
>
> The DVFS support is opt-in for all boards, meaning that older DTBs will
> continue to work like they did it before this series. It should be possible
> to easily add the core voltage scaling support for Tegra114+ SoCs based on
> this grounding work later on, if anyone will want to implement it.
>
> WARNING(!) This series is made on top of the memory interconnect patches
>            which are currently under review [1]. The Tegra EMC driver
>            and devicetree-related patches need to be applied on top of
>            the ICC series.
>
> [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=212196
>
> Dmitry Osipenko (30):
>   dt-bindings: host1x: Document OPP and voltage regulator properties
>   dt-bindings: mmc: tegra: Document OPP and voltage regulator properties
>   dt-bindings: pwm: tegra: Document OPP and voltage regulator properties
>   media: dt: bindings: tegra-vde: Document OPP and voltage regulator
>     properties
>   dt-binding: usb: ci-hdrc-usb2:  Document OPP and voltage regulator
>     properties
>   dt-bindings: usb: tegra-ehci: Document OPP and voltage regulator
>     properties
>   soc/tegra: Add sync state API
>   soc/tegra: regulators: Support Tegra SoC device sync state API
>   soc/tegra: regulators: Fix lockup when voltage-spread is out of range
>   regulator: Allow skipping disabled regulators in
>     regulator_check_consumers()
>   drm/tegra: dc: Support OPP and SoC core voltage scaling
>   drm/tegra: gr2d: Correct swapped device-tree compatibles
>   drm/tegra: gr2d: Support OPP and SoC core voltage scaling
>   drm/tegra: gr3d: Support OPP and SoC core voltage scaling
>   drm/tegra: hdmi: Support OPP and SoC core voltage scaling
>   gpu: host1x: Support OPP and SoC core voltage scaling
>   mmc: sdhci-tegra: Support OPP and core voltage scaling
>   pwm: tegra: Support OPP and core voltage scaling
>   media: staging: tegra-vde: Support OPP and SoC core voltage scaling
>   usb: chipidea: tegra: Support OPP and SoC core voltage scaling
>   usb: host: ehci-tegra: Support OPP and SoC core voltage scaling
>   memory: tegra20-emc: Support Tegra SoC device state syncing
>   memory: tegra30-emc: Support Tegra SoC device state syncing
>   ARM: tegra: Add OPP tables for Tegra20 peripheral devices
>   ARM: tegra: Add OPP tables for Tegra30 peripheral devices
>   ARM: tegra: ventana: Add voltage supplies to DVFS-capable devices
>   ARM: tegra: paz00: Add voltage supplies to DVFS-capable devices
>   ARM: tegra: acer-a500: Add voltage supplies to DVFS-capable devices
>   ARM: tegra: cardhu-a04: Add voltage supplies to DVFS-capable devices
>   ARM: tegra: nexus7: Add voltage supplies to DVFS-capable devices
>
>  .../display/tegra/nvidia,tegra20-host1x.txt   |  56 +++
>  .../bindings/media/nvidia,tegra-vde.txt       |  12 +
>  .../bindings/mmc/nvidia,tegra20-sdhci.txt     |  12 +
>  .../bindings/pwm/nvidia,tegra20-pwm.txt       |  13 +
>  .../devicetree/bindings/usb/ci-hdrc-usb2.txt  |   4 +
>  .../bindings/usb/nvidia,tegra20-ehci.txt      |   2 +
>  .../boot/dts/tegra20-acer-a500-picasso.dts    |  30 +-
>  arch/arm/boot/dts/tegra20-paz00.dts           |  40 +-
>  .../arm/boot/dts/tegra20-peripherals-opp.dtsi | 386 ++++++++++++++++
>  arch/arm/boot/dts/tegra20-ventana.dts         |  65 ++-
>  arch/arm/boot/dts/tegra20.dtsi                |  14 +
>  .../tegra30-asus-nexus7-grouper-common.dtsi   |  23 +
>  arch/arm/boot/dts/tegra30-cardhu-a04.dts      |  44 ++
>  .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 415 ++++++++++++++++++
>  arch/arm/boot/dts/tegra30.dtsi                |  13 +
>  drivers/gpu/drm/tegra/Kconfig                 |   1 +
>  drivers/gpu/drm/tegra/dc.c                    | 138 +++++-
>  drivers/gpu/drm/tegra/dc.h                    |   5 +
>  drivers/gpu/drm/tegra/gr2d.c                  | 140 +++++-
>  drivers/gpu/drm/tegra/gr3d.c                  | 136 ++++++
>  drivers/gpu/drm/tegra/hdmi.c                  |  63 ++-
>  drivers/gpu/host1x/Kconfig                    |   1 +
>  drivers/gpu/host1x/dev.c                      |  87 ++++
>  drivers/memory/tegra/tegra20-emc.c            |   8 +-
>  drivers/memory/tegra/tegra30-emc.c            |   8 +-
>  drivers/mmc/host/Kconfig                      |   1 +
>  drivers/mmc/host/sdhci-tegra.c                |  70 ++-
>  drivers/pwm/Kconfig                           |   1 +
>  drivers/pwm/pwm-tegra.c                       |  84 +++-
>  drivers/regulator/core.c                      |  12 +-
>  .../soc/samsung/exynos-regulator-coupler.c    |   2 +-
>  drivers/soc/tegra/common.c                    | 152 ++++++-
>  drivers/soc/tegra/regulators-tegra20.c        |  25 +-
>  drivers/soc/tegra/regulators-tegra30.c        |  30 +-
>  drivers/staging/media/tegra-vde/Kconfig       |   1 +
>  drivers/staging/media/tegra-vde/vde.c         | 127 ++++++
>  drivers/staging/media/tegra-vde/vde.h         |   1 +
>  drivers/usb/chipidea/Kconfig                  |   1 +
>  drivers/usb/chipidea/ci_hdrc_tegra.c          |  79 ++++
>  drivers/usb/host/Kconfig                      |   1 +
>  drivers/usb/host/ehci-tegra.c                 |  79 ++++
>  include/linux/regulator/coupler.h             |   6 +-
>  include/soc/tegra/common.h                    |  22 +
>  43 files changed, 2360 insertions(+), 50 deletions(-)
>
> --
> 2.27.0
>

I need some more time to review this, but just a quick check found a
few potential issues...

The "core-supply", that you specify as a regulator for each
controller's device node, is not the way we describe power domains.
Instead, it seems like you should register a power-domain provider
(with the help of genpd) and implement the ->set_performance_state()
callback for it. Each device node should then be hooked up to this
power-domain, rather than to a "core-supply". For DT bindings, please
have a look at Documentation/devicetree/bindings/power/power-domain.yaml
and Documentation/devicetree/bindings/power/power_domain.txt.

In regards to the "sync state" problem (preventing to change
performance states until all consumers have been attached), this can
then be managed by the genpd provider driver instead.

Kind regards
Uffe
