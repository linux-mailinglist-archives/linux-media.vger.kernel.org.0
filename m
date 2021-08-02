Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73CB43DD0CD
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 08:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbhHBGwA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 02:52:00 -0400
Received: from meesny.iki.fi ([195.140.195.201]:53128 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229734AbhHBGwA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 02:52:00 -0400
Received: from hillosipuli.retiisi.eu (dbd1vftgng281pd4yskly-3.rev.dnainternet.fi [IPv6:2001:14ba:8eb:1240:ab2d:b956:f00:7a12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 461C120180
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 09:51:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1627887110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=l1GHEwlL8+S4QvqF4RD1jR/6e2WCNL476yDm8IeQG7o=;
        b=s2eeZU+R107/64UuktBvS/Poj3U/zEm7Ld6ZHy2fTkRCTVIZUGrw9r9pqRSxzMcQB6CZiQ
        3VTWm1LRzn2DZKQs5u1hpqdtfO6ZCG7X9VCelqfuoGhpIzQZuUV8IMhxvKaEo24RzydkVi
        v0ZCW1UvOMy8OK8/lLK5PHyTCXd5NPE=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 246DE634C87
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 09:50:46 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1mARnW-0002N6-AC
        for linux-media@vger.kernel.org; Mon, 02 Aug 2021 09:51:38 +0300
Date:   Mon, 2 Aug 2021 09:51:38 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.15] rcar improvements, V4L2 async notifier and
 mt9p031 patches
Message-ID: <20210802065138.GI3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1627887110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=l1GHEwlL8+S4QvqF4RD1jR/6e2WCNL476yDm8IeQG7o=;
        b=aTr8TMRHUdJMdJFFitYL3/0+519nMUnn4ng5En4yI73F2+AegygcwvigtPwNAhw1wAI2zQ
        AEnmKfFGqdxlhsI51TmR7G34bUzDWDWv8n1HOLLPWQ53anX8pv9bVLabHVivHNUBRfG3ll
        dwdO/nUKciugmxeS+u/AUAZPxkB28MQ=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1627887110; a=rsa-sha256; cv=none;
        b=BO0O0sHfd52HaZPqOU9wea/fF7ec7IsrydvewwH1F3pu76B89YpE+2AEcZs6Vt634TnMd/
        9pvnEaBaChNjHocmqj5e9+ovzytffSsNByfdW7CAqAPGPgLt9rp2ZTGRryfGmr9X7pLO3O
        HN8G9Jql+usvZL4DPkRuTxsFuSlvxMg=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

I've rebased the set on media-stage and addressed the rcar-vin warning in
the notifier rename patch (it's v3.2 on the list, the subject is "v4l:
async: Rename async nf functions, clean up long lines".

Additionally there are a bunch of mt9p031 patches.

Please pull.


The following changes since commit 8028b7a2157efb09b134461856689347958f88b7:

  media: imx258: Limit the max analogue gain to 480 (2021-07-30 16:42:45 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.15-2-signed

for you to fetch changes up to f09e5d9201c4a8effd368b18516fd0ba410232b7:

  media: dt-bindings: mt9p031: Add missing required properties (2021-08-02 08:20:36 +0300)

----------------------------------------------------------------
V4L2 patches for 5.15

----------------------------------------------------------------
Christian Hemp (1):
      media: mt9p031: Make pixel clock polarity configurable by DT

Dirk Bender (1):
      media: mt9p031: Fix corrupted frame after restarting stream

Enrico Scholz (1):
      media: mt9p031: Read back the real clock rate

Niklas Söderlund (15):
      media: dt-bindings: media: renesas,csi2: Add r8a779a0 support
      rcar-csi2: Add r8a779a0 support
      rcar-vin: Refactor controls creation for video device
      rcar-vin: Fix error paths for rvin_mc_init()
      rcar-vin: Improve async notifier cleanup paths
      rcar-vin: Improve reuse of parallel notifier
      rcar-vin: Rename array storing subdevice information
      rcar-vin: Move group async notifier
      rcar-vin: Extend group notifier DT parser to work with any port
      rcar-vin: Create a callback to setup media links
      rcar-vin: Specify media device ops at group creation time
      rcar-vin: Move and rename CSI-2 link notifications
      rcar-vin: Add r8a779a0 support
      media: rcar-vin: Remove explicit device availability check
      media: v4l2-fwnode: Simplify v4l2_async_nf_parse_fwnode_endpoints()

Sakari Ailus (1):
      v4l: async: Rename async nf functions, clean up long lines

Stefan Riedmueller (3):
      media: mt9p031: Use BIT macro
      media: dt-bindings: mt9p031: Convert bindings to yaml
      media: dt-bindings: mt9p031: Add missing required properties

 .../bindings/media/i2c/aptina,mt9p031.yaml         |  108 ++
 .../devicetree/bindings/media/i2c/mt9p031.txt      |   40 -
 .../devicetree/bindings/media/renesas,csi2.yaml    |    1 +
 Documentation/driver-api/media/v4l2-subdev.rst     |   14 +-
 MAINTAINERS                                        |    1 +
 drivers/media/i2c/Kconfig                          |    1 +
 drivers/media/i2c/max9286.c                        |   17 +-
 drivers/media/i2c/mt9p031.c                        |   80 +-
 drivers/media/i2c/st-mipid02.c                     |   22 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   17 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   19 +-
 drivers/media/platform/atmel/atmel-isc-base.c      |    4 +-
 drivers/media/platform/atmel/atmel-isi.c           |   17 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |   15 +-
 drivers/media/platform/atmel/atmel-sama7g5-isc.c   |   15 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |   14 +-
 drivers/media/platform/davinci/vpif_capture.c      |   21 +-
 drivers/media/platform/exynos4-is/media-dev.c      |   20 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c  |    9 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |   10 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c   |    6 +-
 drivers/media/platform/omap3isp/isp.c              |   21 +-
 drivers/media/platform/pxa_camera.c                |   26 +-
 drivers/media/platform/qcom/camss/camss.c          |   18 +-
 drivers/media/platform/rcar-vin/rcar-core.c        | 1077 +++++++++++---------
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  210 +++-
 drivers/media/platform/rcar-vin/rcar-dma.c         |   22 +-
 drivers/media/platform/rcar-vin/rcar-vin.h         |   25 +-
 drivers/media/platform/rcar_drif.c                 |   14 +-
 drivers/media/platform/renesas-ceu.c               |   29 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   17 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |   18 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |   12 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |   19 +-
 drivers/media/platform/ti-vpe/cal.c                |   16 +-
 drivers/media/platform/video-mux.c                 |   17 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |   17 +-
 drivers/media/v4l2-core/v4l2-async.c               |  168 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   83 +-
 drivers/staging/media/imx/imx-media-csi.c          |   17 +-
 drivers/staging/media/imx/imx-media-dev-common.c   |    7 +-
 drivers/staging/media/imx/imx-media-dev.c          |    6 +-
 drivers/staging/media/imx/imx-media-of.c           |    6 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   17 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   24 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   16 +-
 drivers/staging/media/tegra-video/vi.c             |   17 +-
 include/media/i2c/mt9p031.h                        |    1 +
 include/media/v4l2-async.h                         |  105 +-
 include/media/v4l2-fwnode.h                        |   12 +-
 50 files changed, 1443 insertions(+), 1045 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt

-- 
Kind regards,

Sakari Ailus
