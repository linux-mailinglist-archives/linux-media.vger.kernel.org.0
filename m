Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B053EE229
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 03:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235511AbhHQBag (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 21:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbhHQBaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 21:30:35 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA49C061764;
        Mon, 16 Aug 2021 18:30:03 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id f2so8516229ljn.1;
        Mon, 16 Aug 2021 18:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bO5VmfaNpjVVREGufhEjpS0RVmiy0+tDrVzrBmR/Klk=;
        b=DGL5unFzfWW6yGqVG2gtuY8Y7AYqNgW1kYmTAFI1UmotEReGMPQ7+/nurfdNtSw6kX
         7t41EQ68yYpDkvs9bN8NZdDPqTqVXnPDOJyXnEBa7RaAsCXrib6QePdF4vbI2GIqUGJ/
         MPRdlcA74ujsVmtLo3Swnwn/AAas5jW+pCF/Ln6WWt5EGHFoZNs+CovnkzUBoMWGJbOR
         l3cHhI403t5GFk3fPzqdH+uHeSvXbH+QSIOscqju5HtKqtPZlgeiwTgbYFuVwhYOAlz0
         uy0kJNeVrbzHlxDgJz3intJg8+X3fA1Hn7KHJHdpqaD4aGtti/w8DsC5NTsZ+HxU3PfJ
         E64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bO5VmfaNpjVVREGufhEjpS0RVmiy0+tDrVzrBmR/Klk=;
        b=hZfvOIsgGrS9H6em1OWnLBGH/l4VYAjafHwT1tRLj6ZvLRqnB2tGIF2m2oyqZxQUsB
         pG5b7lUbuRrRwQsMOk/EQzuWMQZCb3/U74SrOEDVmPyIrSOD4mXj5LNuB3+vJiTGMNJI
         DQ5xPdbDHjUl4VHUZArdy0Xe5TZooq/1hPtRWXnfWcjapUtWc0/sgSYYXobv9HWUA3GU
         0MAQTl0tEoJg5XUacOUQ5BWa0vj7jI54LYZqvx1KC4jE1OjdZhLUtHlS59g/USTuM++v
         vW9xqEQc2Y9Tho8VXN4STlbE9/+iAarP55Um/OpJfhjpkqdOJueTBMyuPvVtSy6o694A
         F5FQ==
X-Gm-Message-State: AOAM532MHNzYZXluzHCdyWthUixU265yXTKOpV86E/QEVs2/dt4WXXD8
        ii4Z1NAWK50xuxAbysUZMwo=
X-Google-Smtp-Source: ABdhPJzfD+REHIwuiGYg1fuxQjjlpDVZHYlge+vtvAZqlGgG4tIZ0Of68hupSFQ0Tvw+LsNO5cfhqA==
X-Received: by 2002:a05:651c:985:: with SMTP id b5mr890013ljq.78.1629163801449;
        Mon, 16 Aug 2021 18:30:01 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:01 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v8 00/34] NVIDIA Tegra power management patches for 5.16
Date:   Tue, 17 Aug 2021 04:27:20 +0300
Message-Id: <20210817012754.8710-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds runtime PM support to Tegra drivers and enables core
voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.

All patches should go via Tegra tree because they are interdependent,
please review and ack.

If you haven't seen this series before, that's because I wanted to
finalize the GENPD part at first and didn't bother you previously.

Changelog:

v8: - Added new generic dev_pm_opp_sync() helper that syncs OPP state with
      hardware. All drivers changed to use it. This replaces GENPD attach_dev
      callback hacks that were used in v7.

    - Added new patch patch "soc/tegra: regulators: Prepare for suspend"
      that fixes dying Tegra20 SoC after enabling VENC power domain during
      resume from suspend. It matches to what downstream kernel does on
      suspend/resume.

    - After a second thought, I dropped patches which added RPM to memory
      drivers since hardware is always-on and RPM not needed.

    - Replaced the "dummy host1x driver" patch with new "Disable unused
      host1x hardware" patch, since it's a cleaner solution.

Dmitry Osipenko (34):
  opp: Add dev_pm_opp_sync() helper
  soc/tegra: pmc: Disable PMC state syncing
  soc/tegra: Don't print error message when OPPs not available
  soc/tegra: Add devm_tegra_core_dev_init_opp_table_simple()
  soc/tegra: Use dev_pm_opp_sync()
  dt-bindings: clock: tegra-car: Document new tegra-clocks sub-node
  clk: tegra: Support runtime PM and power domain
  dt-bindings: host1x: Document OPP and power domain properties
  dt-bindings: host1x: Document Memory Client resets of Host1x, GR2D and
    GR3D
  gpu: host1x: Add host1x_channel_stop()
  gpu: host1x: Add runtime PM and OPP support
  drm/tegra: dc: Support OPP and SoC core voltage scaling
  drm/tegra: hdmi: Add OPP support
  drm/tegra: gr2d: Support power management
  drm/tegra: gr3d: Support power management
  drm/tegra: vic: Support system suspend
  usb: chipidea: tegra: Add runtime PM and OPP support
  bus: tegra-gmi: Add runtime PM and OPP support
  pwm: tegra: Add runtime PM and OPP support
  mmc: sdhci-tegra: Add runtime PM and OPP support
  mtd: rawnand: tegra: Add runtime PM and OPP support
  spi: tegra20-slink: Add OPP support
  media: dt: bindings: tegra-vde: Convert to schema
  media: dt: bindings: tegra-vde: Document OPP and power domain
  media: staging: tegra-vde: Support generic power domain and OPP
  soc/tegra: fuse: Add OPP support
  soc/tegra: fuse: Reset hardware
  soc/tegra: regulators: Prepare for suspend
  soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30
  ARM: tegra: Add OPP tables and power domains to Tegra20 device-trees
  ARM: tegra: Add OPP tables and power domains to Tegra30 device-trees
  ARM: tegra: Add Memory Client resets to Tegra20 GR2D, GR3D and Host1x
  ARM: tegra: Add Memory Client resets to Tegra30 GR2D, GR3D and Host1x
  ARM: tegra20/30: Disable unused host1x hardware

 .../bindings/clock/nvidia,tegra20-car.yaml    |   51 +
 .../display/tegra/nvidia,tegra20-host1x.txt   |   53 +
 .../bindings/media/nvidia,tegra-vde.txt       |   64 -
 .../bindings/media/nvidia,tegra-vde.yaml      |  119 ++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |    1 +
 arch/arm/boot/dts/tegra20-colibri.dtsi        |    3 +-
 arch/arm/boot/dts/tegra20-harmony.dts         |    3 +-
 arch/arm/boot/dts/tegra20-paz00.dts           |    1 +
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  941 +++++++++++
 arch/arm/boot/dts/tegra20-seaboard.dts        |    3 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi       |    3 +-
 arch/arm/boot/dts/tegra20-trimslice.dts       |    9 +
 arch/arm/boot/dts/tegra20-ventana.dts         |    1 +
 arch/arm/boot/dts/tegra20.dtsi                |  119 +-
 .../tegra30-asus-nexus7-grouper-common.dtsi   |    1 +
 arch/arm/boot/dts/tegra30-beaver.dts          |    1 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |    1 +
 arch/arm/boot/dts/tegra30-colibri.dtsi        |   17 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |    1 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 1412 +++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |  181 ++-
 drivers/bus/tegra-gmi.c                       |   92 +-
 drivers/clk/tegra/Makefile                    |    1 +
 drivers/clk/tegra/clk-device.c                |  222 +++
 drivers/clk/tegra/clk-pll.c                   |    2 +-
 drivers/clk/tegra/clk-super.c                 |    2 +-
 drivers/clk/tegra/clk-tegra20.c               |   39 +-
 drivers/clk/tegra/clk-tegra30.c               |   70 +-
 drivers/clk/tegra/clk.c                       |   64 +
 drivers/clk/tegra/clk.h                       |    2 +
 drivers/gpu/drm/tegra/dc.c                    |   74 +
 drivers/gpu/drm/tegra/dc.h                    |    2 +
 drivers/gpu/drm/tegra/gr2d.c                  |  154 +-
 drivers/gpu/drm/tegra/gr3d.c                  |  393 ++++-
 drivers/gpu/drm/tegra/hdmi.c                  |   15 +-
 drivers/gpu/drm/tegra/vic.c                   |    4 +
 drivers/gpu/host1x/channel.c                  |    8 +
 drivers/gpu/host1x/debug.c                    |   15 +
 drivers/gpu/host1x/dev.c                      |  157 +-
 drivers/gpu/host1x/dev.h                      |    3 +-
 drivers/gpu/host1x/hw/channel_hw.c            |   44 +-
 drivers/gpu/host1x/intr.c                     |    3 -
 drivers/gpu/host1x/syncpt.c                   |    5 +-
 drivers/mmc/host/sdhci-tegra.c                |  146 +-
 drivers/mtd/nand/raw/tegra_nand.c             |   62 +-
 drivers/opp/core.c                            |   42 +-
 drivers/pwm/pwm-tegra.c                       |  104 +-
 drivers/soc/tegra/common.c                    |   34 +-
 drivers/soc/tegra/fuse/fuse-tegra.c           |   36 +
 drivers/soc/tegra/fuse/fuse.h                 |    1 +
 drivers/soc/tegra/pmc.c                       |   17 +
 drivers/soc/tegra/regulators-tegra20.c        |   99 ++
 drivers/soc/tegra/regulators-tegra30.c        |  122 ++
 drivers/spi/spi-tegra20-slink.c               |   15 +-
 drivers/staging/media/tegra-vde/vde.c         |   65 +-
 drivers/usb/chipidea/ci_hdrc_tegra.c          |   61 +-
 include/linux/host1x.h                        |    1 +
 include/linux/pm_opp.h                        |    6 +
 include/soc/tegra/common.h                    |   13 +
 59 files changed, 4796 insertions(+), 384 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
 create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
 create mode 100644 drivers/clk/tegra/clk-device.c

-- 
2.32.0

