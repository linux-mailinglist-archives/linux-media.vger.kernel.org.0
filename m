Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B7A3D5073
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 00:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhGYV4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 17:56:08 -0400
Received: from meesny.iki.fi ([195.140.195.201]:46404 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229531AbhGYV4I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 17:56:08 -0400
Received: from hillosipuli.retiisi.eu (dbd1vftgng281pd4yskly-3.rev.dnainternet.fi [IPv6:2001:14ba:8eb:1240:ab2d:b956:f00:7a12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 5C21620076
        for <linux-media@vger.kernel.org>; Mon, 26 Jul 2021 01:36:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1627252596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=cJE4J7P8ehXusDUsDZdpPRBCgYBQviuSXUnRUprpqvI=;
        b=phRs5ch/MSlzUakSxy/UkV8smPjqhLs5eA2LRwqBXz/BxBx9PkrwlJE4cchsY/sQwO3FWy
        HlMweW8q4VHeI0AgPwo7NIpfevvGUmlB+zXwKewGSbnaO8TRLWNgk8JQtBWRNXp9L4JwdJ
        QdBKx6lSnjEoAaUt+teSxVBKmEe+zzc=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EE59D634C87
        for <linux-media@vger.kernel.org>; Mon, 26 Jul 2021 01:36:01 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1m7mjN-0000zR-Gg
        for linux-media@vger.kernel.org; Mon, 26 Jul 2021 01:36:21 +0300
Date:   Mon, 26 Jul 2021 01:36:21 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.15] Camera sensor, async and documentation patches
Message-ID: <20210725223621.GB3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1627252596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=cJE4J7P8ehXusDUsDZdpPRBCgYBQviuSXUnRUprpqvI=;
        b=YSEzI6s/9AkDHZSZbQf47ASAHzpeh3PaXI0hLJokFO4xUQvdlDOSo8sx5eHMIUyxY8qwTd
        xZKaZzsQPt33U61qIbUB30u5x+0saRd9clVwznHC9mIJjYPoCuOYGavivdDj47TbEwFHzX
        avucJ0zHW5RCuIxpXlxtq9tYp+bKMyQ=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1627252596; a=rsa-sha256; cv=none;
        b=i6mDbKR6huMJIoCOLxeCrN00czpsKcvlxtNbE43el6ape7fFhgfsqdyo8HhVTGCppRWorF
        7/YzEn1DEu7XMcEcglV8C/6+YVRDO9ltMId00X/QPkpwJQBd7eZ1X3a9vK2265LXgKfrfJ
        ZV1I9RW7FbSLH5YLGvhEGgGproquV+0=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a large set of patches for 5.15.

Notable changes include:

- Drivers for imx335, imx412 and ov9282 sensors
- Fixes for digital gain configuration in ov2740 and ov9734 drivers
- Shorten V4L2 async notifier functions for better fitting under 80 chars
- Documentation improvements (camera sensors, CSI-2)
- V4L2 LED flash cleanups
- Manual CSI-2 LP-11/LP-111 mode support with runtime PM
- Correct mbus code for YUV output in ov5640 driver with CSI-2
- Switch to DEVICE_ATTR_RO and DEVICE_ATTR_RW in MC and a few drivers
- Omap3isp error path bugfix

Please pull.


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.15-1.1-signed

for you to fetch changes up to 62f1b9d2ad3dc284caebe55cfaf7043dce8e7703:

  media: ov8856: ignore gpio and regulator for ov8856 with ACPI (2021-07-25 23:38:57 +0300)

----------------------------------------------------------------
V4L2 patches for 5.15

----------------------------------------------------------------
Bingbu Cao (3):
      media: ov2740: use group write for digital gain
      media: ov9734: use group write for digital gain
      media: ov8856: ignore gpio and regulator for ov8856 with ACPI

Martina Krasteva (6):
      dt-bindings: media: Add bindings for imx335
      media: i2c: Add imx335 camera sensor driver
      dt-bindings: media: Add bindings for imx412
      media: i2c: Add imx412 camera sensor driver
      dt-bindings: media: Add bindings for ov9282
      media: i2c: Add ov9282 camera sensor driver

Niklas Söderlund (4):
      media: dt-bindings: media: renesas,csi2: Add r8a779a0 support
      rcar-csi2: Add r8a779a0 support
      media: v4l2-fwnode: Simplify v4l2_async_nf_parse_fwnode_endpoints()
      media: rcar-vin: Remove explicit device availability check

Paul Kocialkowski (1):
      media: v4l2-subdev: Fix documentation of the subdev_notifier member

Sakari Ailus (10):
      Documentation: media: Improve camera sensor documentation
      Documentation: media: Fix v4l2-async kerneldoc syntax
      v4l: async: Rename async nf functions, clean up long lines
      Documentation: v4l: Fix V4L2_CID_PIXEL_RATE documentation
      Documentation: v4l: Improve frame rate configuration documentation
      Documentation: v4l: Rework LP-11 documentation, add callbacks
      v4l: subdev: Add pre_streamon and post_streamoff callbacks
      ccs: Implement support for manual LP control
      v4l2-flash: Add sanity checks for flash and indicator controls
      v4l2-flash: Check whether setting LED brightness succeeded

Wei Yongjun (1):
      media: omap3isp: Fix missing unlock in isp_subdev_notifier_complete()

Xavier Roumegue (1):
      media: ov5640: Complement yuv mbus formats with their 1X16 versions

Zhen Lei (4):
      media: mc-device.c: use DEVICE_ATTR_RO() helper macro
      media: i2c: et8ek8: use DEVICE_ATTR_RO() helper macro
      media: i2c: use DEVICE_ATTR_RO() helper macro
      media: exynos4-is: use DEVICE_ATTR_RW() helper macro

 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml |   91 ++
 .../devicetree/bindings/media/i2c/sony,imx335.yaml |   91 ++
 .../devicetree/bindings/media/i2c/sony,imx412.yaml |   91 ++
 .../devicetree/bindings/media/renesas,csi2.yaml    |    1 +
 Documentation/driver-api/media/camera-sensor.rst   |   45 +-
 Documentation/driver-api/media/csi2.rst            |   94 --
 Documentation/driver-api/media/index.rst           |    2 +-
 Documentation/driver-api/media/tx-rx.rst           |  133 ++
 Documentation/driver-api/media/v4l2-subdev.rst     |   14 +-
 .../media/v4l/ext-ctrls-image-process.rst          |   29 +-
 MAINTAINERS                                        |   27 +
 drivers/media/i2c/Kconfig                          |   42 +
 drivers/media/i2c/Makefile                         |    4 +-
 drivers/media/i2c/ccs/ccs-core.c                   |   58 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    5 +-
 drivers/media/i2c/imx335.c                         | 1129 +++++++++++++++++
 drivers/media/i2c/imx412.c                         | 1272 ++++++++++++++++++++
 drivers/media/i2c/max9286.c                        |   17 +-
 drivers/media/i2c/ov2740.c                         |   26 +-
 drivers/media/i2c/ov5640.c                         |    4 +
 drivers/media/i2c/ov8856.c                         |   27 +-
 drivers/media/i2c/ov9282.c                         | 1137 +++++++++++++++++
 drivers/media/i2c/ov9734.c                         |   24 +-
 drivers/media/i2c/st-mipid02.c                     |   22 +-
 drivers/media/mc/mc-device.c                       |    4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   17 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   19 +-
 drivers/media/platform/atmel/atmel-isc-base.c      |    4 +-
 drivers/media/platform/atmel/atmel-isi.c           |   17 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |   15 +-
 drivers/media/platform/atmel/atmel-sama7g5-isc.c   |   15 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |   14 +-
 drivers/media/platform/davinci/vpif_capture.c      |   21 +-
 drivers/media/platform/exynos4-is/media-dev.c      |   33 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c  |    9 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |   10 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c   |    6 +-
 drivers/media/platform/omap3isp/isp.c              |   25 +-
 drivers/media/platform/pxa_camera.c                |   26 +-
 drivers/media/platform/qcom/camss/camss.c          |   18 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |   41 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  210 +++-
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
 drivers/media/v4l2-core/v4l2-flash-led-class.c     |   80 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   83 +-
 drivers/staging/media/imx/imx-media-csi.c          |   17 +-
 drivers/staging/media/imx/imx-media-dev-common.c   |    7 +-
 drivers/staging/media/imx/imx-media-dev.c          |    6 +-
 drivers/staging/media/imx/imx-media-of.c           |    6 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   17 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   24 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   16 +-
 drivers/staging/media/tegra-video/vi.c             |   17 +-
 include/media/v4l2-async.h                         |  105 +-
 include/media/v4l2-fwnode.h                        |   12 +-
 include/media/v4l2-subdev.h                        |   27 +-
 65 files changed, 4916 insertions(+), 717 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
 delete mode 100644 Documentation/driver-api/media/csi2.rst
 create mode 100644 Documentation/driver-api/media/tx-rx.rst
 create mode 100644 drivers/media/i2c/imx335.c
 create mode 100644 drivers/media/i2c/imx412.c
 create mode 100644 drivers/media/i2c/ov9282.c

-- 
Sakari Ailus
