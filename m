Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546F530E505
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 22:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhBCVf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 16:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhBCVfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 16:35:54 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA255C061573
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 13:35:13 -0800 (PST)
Received: from hillosipuli.retiisi.eu (213-243-181-26.bb.dnainternet.fi [213.243.181.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 7B8901B000E5
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 23:35:08 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1612388108;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=LfQ1HxOS4mnFUGlZ4AtZxXfj509aWOZpA42r5BBqb9c=;
        b=u+upVoKjxXwf8ihbXKdevBjDdStuECVviCcVt3mg8+MDgnEru8xEpbxuoFVto2W9wkLBaS
        zaJfUlFxCj9KCAfqusHkUHidImvtzmuuwFhv7+nFcQEt9BQcT3rgZ0NAzSDK6fkqLQIV33
        4Cbw/1F2boFM1Qwrdx4UttaSVBrHgInEEerpoi5KBicCgGmeNN294NMFOBU/PFfqoUbwaV
        7GBFi+iIJamOJAn132TSX73/9xCiCigL8DMFMcl6p+PvSy9qgCZki1f50WNA80/8J7BAhs
        rilWkRtghULpWutS25ZSolp+G30t1cmkAlgcFWmTIEflQmktaoUu+dca1GqjEA==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 50715634C94
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 23:34:59 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l7Pnn-0000oh-Ru
        for linux-media@vger.kernel.org; Wed, 03 Feb 2021 23:35:07 +0200
Date:   Wed, 3 Feb 2021 23:35:07 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2 for 5.12] More V4L2 patches
Message-ID: <20210203213507.GA3@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1612388108; a=rsa-sha256;
        cv=none;
        b=t1w7Z2bI1Ye4TAtK6CqbdoASqBik1q4DtraGAXN66SQym8IAUTGNWT+NSOOaKNwaiTis1q
        P05VyCznCy1GIZY9FoN7yfeXCVcX/cUhV/c0B3JpMYFWFnyUsOyKhXYlukc4B4HVTimspR
        GXm7pt+ryihJum59KLRh8unrjT37CmmBVSqKlZh44JmZTqzRk3KzIf98xySs/Hca2xTpBM
        dGK3S2P8VavR7JiQNLHa/OFf/xGfwjshlLShnsUZhuBtJ/5inejHXkDP7tTuo/8B7FMCEM
        K8zxisl6CIgVgVFCvMPGFOMNNFJFAfhrRD8IZKegWcFmVUDYSahCqQEoOTLW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1612388108;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=LfQ1HxOS4mnFUGlZ4AtZxXfj509aWOZpA42r5BBqb9c=;
        b=OXGgGy7nDo7bgAXGBo8hsApJHDcVHYsfH/V3b/7cUcmi8BrFZ9oQGrONyYbxzXr8uSW3+m
        R21p2IYzs9EyVwthDd8GHqpGDT7oSwJ4A8sYovib+bQzkBbxHdnj0Rl0U1kJaFxtpzOj3z
        y1rxjCtHIAvLTbeRTr+nG6+zHTc2YncR52HKSRXRyJZeBekY90ZYBPu6SmPp3g7yel2ylp
        zRoh92Tb1HjFHpPJz7OjvViDDo6qylGCKIBYbtbsSm0SF5AqsXICfX5Ui0sPleqMJpUT9W
        Q29mUF5+QFsCkFvaM1+CqeczOuODzcYITJcCDoPN5goBMNyVcMXOeZWUVWKlpg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This pull request contains quite a bunch of different patches, but to name
a few, there are:

- Ezequiel's V4L2 async cleanup and V4L2 clock removal serieses,
- RDACM21 camera module driver,
- Imx258 raw camera driver,
- Nice improvement for V4L2 async subdev struct allocation by Laurent and
- Random fixes here and there.

Since v1:

- Add IMX334 driver + DT bindings
- Add ov8856 driver fix
- Add LINK_FREQ to IMX219 driver
- Fix vflip/hflip in ov5675 driver
- Dropped a minor documentation fix from me, merged with another bigger
  patch not yet in this pull request

Please pull.


The following changes since commit 0b9112a58836ad6a7e84eebec06a2de9778b7573:

  Merge tag 'v5.11-rc6' into patchwork (2021-02-01 10:03:45 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.12-5.1-signed

for you to fetch changes up to 6f20874cd363061c0f6cab3442ed914147bf6382:

  media: i2c: Add imx334 camera sensor driver (2021-02-03 22:35:24 +0200)

----------------------------------------------------------------
More V4L2 patches for 5.12

----------------------------------------------------------------
Andrey Konovalov (1):
      media: i2c: imx219: Implement V4L2_CID_LINK_FREQ control

Colin Ian King (1):
      media: i2c: fix spelling mistakes: "enpoint" -> "endpoint"

Dan Carpenter (1):
      media: i2c: ov5648: remove unnecessary NULL check

Ezequiel Garcia (19):
      media: v4l2-async: Remove V4L2_ASYNC_MATCH_DEVNAME
      media: v4l2-async: Clean v4l2_async_notifier_add_fwnode_remote_subdev
      media: atmel: Use v4l2_async_notifier_add_fwnode_remote_subdev
      media: stm32: Use v4l2_async_notifier_add_fwnode_remote_subdev
      media: exynos4-is: Use v4l2_async_notifier_add_fwnode_remote_subdev
      media: st-mipid02: Use v4l2_async_notifier_add_fwnode_remote_subdev
      media: cadence: Use v4l2_async_notifier_add_fwnode_remote_subdev
      media: marvell-ccic: Use v4l2_async_notifier_add_*_subdev
      media: renesas-ceu: Use v4l2_async_notifier_add_*_subdev
      media: pxa-camera: Use v4l2_async_notifier_add_*_subdev
      media: davinci: vpif_display: Remove unused v4l2-async code
      media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev
      media: Clarify v4l2-async subdevice addition API
      media: mach-pxa: Register the camera sensor fixed-rate clock
      media: pxa_camera: Drop the v4l2-clk clock register
      media: ov9640: Use the generic clock framework
      media: mt9m111: Use the generic clock framework
      media: ov6650: Use the generic clock framework
      media: Remove the legacy v4l2-clk API

Jacopo Mondi (5):
      media: i2c: Add driver for RDACM21 camera module
      dt-bindings: media: max9286: Document 'maxim,reverse-channel-microvolt'
      media: i2c: max9286: Break-out reverse channel setup
      media: i2c: max9286: Make channel amplitude programmable
      media: i2c: max9286: Configure reverse channel amplitude

Krzysztof Kozlowski (4):
      dt-bindings: media: imx258: add bindings for IMX258 sensor
      media: i2c: imx258: add support for binding via device tree
      media: i2c: imx258: simplify getting state container
      media: i2c: imx258: get clock from device properties and enable it via runtime PM

Laurent Pinchart (1):
      media: v4l2-async: Improve v4l2_async_notifier_add_*_subdev() API

Lubomir Rintel (1):
      media: marvell-ccic: power up the device on mclk enable

Martina Krasteva (2):
      dt-bindings: media: Add bindings for imx334
      media: i2c: Add imx334 camera sensor driver

Ricardo Ribalda (2):
      media: ipu3-cio2: Do not zero reserved fields
      media: staging/intel-ipu3: Do not zero reserved fields

Rikard Falkeborn (1):
      media: i2c: rdacm20: Constify static structs

Robert Foss (1):
      media: ov8856: Configure sensor for GRBG Bayer for all modes

Sakari Ailus (2):
      dt-bindings: Remove old ov5647.yaml file, update ovti,ov5647.yaml
      ipu3-cio2: Build bridge only if ACPI is enabled

Shawn Tu (1):
      ov5675: fix vflip/hflip control

Tomi Valkeinen (1):
      media: i2c: max9286: fix access to unallocated memory

 .../devicetree/bindings/media/i2c/imx258.yaml      |  134 +++
 .../bindings/media/i2c/maxim,max9286.yaml          |   22 +
 .../devicetree/bindings/media/i2c/ov5647.yaml      |   76 --
 .../devicetree/bindings/media/i2c/ovti,ov5647.yaml |   20 +-
 .../devicetree/bindings/media/i2c/sony,imx334.yaml |   90 ++
 Documentation/driver-api/media/v4l2-clocks.rst     |   31 -
 Documentation/driver-api/media/v4l2-core.rst       |    1 -
 Documentation/driver-api/media/v4l2-subdev.rst     |   48 +-
 MAINTAINERS                                        |   22 +
 arch/arm/mach-pxa/devices.c                        |    8 +
 drivers/media/i2c/Kconfig                          |   27 +
 drivers/media/i2c/Makefile                         |    3 +
 drivers/media/i2c/imx219.c                         |   15 +-
 drivers/media/i2c/imx258.c                         |   82 +-
 drivers/media/i2c/imx334.c                         | 1131 ++++++++++++++++++++
 drivers/media/i2c/max9286.c                        |   74 +-
 drivers/media/i2c/mt9m111.c                        |   17 +-
 drivers/media/i2c/ov5648.c                         |    4 +-
 drivers/media/i2c/ov5675.c                         |    6 +-
 drivers/media/i2c/ov6650.c                         |   28 +-
 drivers/media/i2c/ov8856.c                         |    4 +-
 drivers/media/i2c/ov8865.c                         |    2 +-
 drivers/media/i2c/ov9640.c                         |   15 +-
 drivers/media/i2c/ov9640.h                         |    2 +-
 drivers/media/i2c/rdacm20.c                        |    4 +-
 drivers/media/i2c/rdacm21.c                        |  623 +++++++++++
 drivers/media/i2c/st-mipid02.c                     |   21 +-
 drivers/media/pci/intel/ipu3/Kconfig               |    2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   18 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |    2 +-
 drivers/media/platform/atmel/atmel-isc.h           |    1 +
 drivers/media/platform/atmel/atmel-isi.c           |   46 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |   44 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |   17 +-
 drivers/media/platform/davinci/vpif_capture.c      |    2 +-
 drivers/media/platform/davinci/vpif_display.c      |   86 +-
 drivers/media/platform/davinci/vpif_display.h      |    1 -
 drivers/media/platform/exynos4-is/media-dev.c      |   25 +-
 drivers/media/platform/exynos4-is/media-dev.h      |    2 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c  |   14 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |   12 +-
 drivers/media/platform/marvell-ccic/mcam-core.h    |    1 -
 drivers/media/platform/marvell-ccic/mmp-driver.c   |   11 +-
 drivers/media/platform/omap3isp/isp.c              |   74 +-
 drivers/media/platform/pxa_camera.c                |   83 +-
 drivers/media/platform/qcom/camss/camss.c          |   11 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |    5 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |    2 +-
 drivers/media/platform/rcar_drif.c                 |    2 +-
 drivers/media/platform/renesas-ceu.c               |   56 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   15 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |   87 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |    9 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h |    1 -
 drivers/media/platform/ti-vpe/cal.c                |   12 +-
 drivers/media/platform/video-mux.c                 |   14 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |   10 +-
 drivers/media/v4l2-core/Makefile                   |    2 +-
 drivers/media/v4l2-core/v4l2-async.c               |   95 +-
 drivers/media/v4l2-core/v4l2-clk.c                 |  321 ------
 drivers/media/v4l2-core/v4l2-fwnode.c              |    6 +-
 drivers/staging/media/imx/imx-media-csi.c          |   14 +-
 drivers/staging/media/imx/imx-media-of.c           |    2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   19 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   16 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   15 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |    3 -
 drivers/staging/media/tegra-video/vi.c             |   10 +-
 include/media/davinci/vpif_types.h                 |    2 -
 include/media/v4l2-async.h                         |   89 +-
 include/media/v4l2-clk.h                           |   73 --
 71 files changed, 2619 insertions(+), 1223 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
 delete mode 100644 Documentation/driver-api/media/v4l2-clocks.rst
 create mode 100644 drivers/media/i2c/imx334.c
 create mode 100644 drivers/media/i2c/rdacm21.c
 delete mode 100644 drivers/media/v4l2-core/v4l2-clk.c
 delete mode 100644 include/media/v4l2-clk.h

-- 
Kind regards,

Sakari Ailus
