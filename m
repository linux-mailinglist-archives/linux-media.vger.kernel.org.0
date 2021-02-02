Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D4D30CD3A
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 21:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhBBUnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 15:43:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhBBUnu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 15:43:50 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFB3C0613D6
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 12:43:09 -0800 (PST)
Received: from hillosipuli.retiisi.eu (213-243-181-26.bb.dnainternet.fi [213.243.181.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 5A7351B00090
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 22:43:07 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1612298587;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=d4zws5P8CbG9x/cXpwQiOy34pW/+n+t7YFt3+lhtAGs=;
        b=Na8GBs29kIpPp//AJc0QvnjPZhBBDVxVELgbDwMAk9CXcLvyKW/uhKBKYkaRbvFzqDGKQS
        vhjg58sp4E+mZ/UrNpnAIuBRk2yuz57URU0gmM2N4MlWVdJDVjp2ktC16P288K5yBqGAq0
        CFNezx9mUgOSq8MdPLpJC3NIH0OZhElWgyN0UYxxBD/Y/r4rpIZxt8DXvHEz8XEM+tDCcV
        t3/yu99B58icw6zNxs0svV8spLPzO0CFrXwVxa5dGnzElZyPuvORuhKBHwJTTbrXyzyKut
        Q4298++v0lEAIxK1Z26pUwE5IugIUNCKGUseINZJku9MhCblhWDK5pr69JLy5A==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BBFFA634C8F
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 22:43:01 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l72Vt-0000ZP-QP
        for linux-media@vger.kernel.org; Tue, 02 Feb 2021 22:43:05 +0200
Date:   Tue, 2 Feb 2021 22:43:05 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.12] More V4L2 patches
Message-ID: <20210202204305.GE3@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1612298587; a=rsa-sha256;
        cv=none;
        b=ZFgB9K3fS5V4Nlw/TM7VBUbMFvDEl2BUI4qFtMVLyCqkaFPqFADesDlRKw4HQhUkO/6AqJ
        0XcOVj4A77q/0phTK3vlYhPdU9AN66+Wf9G1ZKOYxig9MO81LHVll7ZJ/G6t2UCuTsPN+m
        ywpmEVAQPulL5ajS32ArsI08cSjcoagAT8gPta4eArVjBzYbRZYp68PcGqmxlt5sWoCzDy
        KQk5SpwJQM2GzCxbQXA68wXTvnG5l6AOT/LAN+DSM0RKBMyJll8D8p3piB9PQMZBojV5TW
        fRaaprFd7zn0AZg9BRV2fmDnS9qvyqgaXBN1dRfkVxACWKGwzprfWYMf8KwjhQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1612298587;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=d4zws5P8CbG9x/cXpwQiOy34pW/+n+t7YFt3+lhtAGs=;
        b=UluST3QnR8unWKgfTGL3vZ4weNqiDn5PDathlej7mP5t4H5GSuI91M2w3xlcMCuUn1XNcu
        uXJC0oMe9L48WlkVv/dvbca5El22xUWt8bprZRpNmzfLX2vWAihUZOd4+LZu8Nwf6yEMQP
        CLxITqF1xyChSx9p8MI05tLVPygtU7mQy554OUHQFG/zeA17SDxNoON3s7kWNyaNR2zsk4
        4eV6LGasFwyD0Do6J5nqVp82+jRW1hjDhjufElabVGD7taojfOmYL/Vi2Yq8AzzhTarNtN
        5/2+uRkPiX2VZCSBiNs299USGSAto5XvCo1v6VDtMu8Q4CxhccHNHKPGwhimZA==
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

Please pull.


The following changes since commit f0ddb4e9911665b9ad68fe94e0faaaff5953902e:

  media: venus: venc: set IDR period to FW only for H264 & HEVC (2021-01-27 16:22:36 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.12-5-signed

for you to fetch changes up to 294bac0c7d79761440dfb1aeaf17186a8ccf3208:

  ov5675: fix vflip/hflip control (2021-02-02 22:28:48 +0200)

----------------------------------------------------------------
V4L2 patches for 5.12

----------------------------------------------------------------
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

Ricardo Ribalda (2):
      media: ipu3-cio2: Do not zero reserved fields
      media: staging/intel-ipu3: Do not zero reserved fields

Rikard Falkeborn (1):
      media: i2c: rdacm20: Constify static structs

Sakari Ailus (3):
      dt-bindings: Remove old ov5647.yaml file, update ovti,ov5647.yaml
      Documentation: media: camera-sensor: The unit of hblank is pixels
      ipu3-cio2: Build bridge only if ACPI is enabled

Shawn Tu (1):
      ov5675: fix vflip/hflip control

Tomi Valkeinen (1):
      media: i2c: max9286: fix access to unallocated memory

 .../devicetree/bindings/media/i2c/imx258.yaml      | 134 +++++
 .../bindings/media/i2c/maxim,max9286.yaml          |  22 +
 .../devicetree/bindings/media/i2c/ov5647.yaml      |  76 ---
 .../devicetree/bindings/media/i2c/ovti,ov5647.yaml |  20 +-
 Documentation/driver-api/media/camera-sensor.rst   |   7 +-
 Documentation/driver-api/media/v4l2-clocks.rst     |  31 -
 Documentation/driver-api/media/v4l2-core.rst       |   1 -
 Documentation/driver-api/media/v4l2-subdev.rst     |  48 +-
 MAINTAINERS                                        |  13 +
 arch/arm/mach-pxa/devices.c                        |   8 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   2 +
 drivers/media/i2c/imx258.c                         |  82 ++-
 drivers/media/i2c/max9286.c                        |  74 ++-
 drivers/media/i2c/mt9m111.c                        |  17 +-
 drivers/media/i2c/ov5648.c                         |   4 +-
 drivers/media/i2c/ov5675.c                         |   6 +-
 drivers/media/i2c/ov6650.c                         |  28 +-
 drivers/media/i2c/ov8865.c                         |   2 +-
 drivers/media/i2c/ov9640.c                         |  15 +-
 drivers/media/i2c/ov9640.h                         |   2 +-
 drivers/media/i2c/rdacm20.c                        |   4 +-
 drivers/media/i2c/rdacm21.c                        | 623 +++++++++++++++++++++
 drivers/media/i2c/st-mipid02.c                     |  21 +-
 drivers/media/pci/intel/ipu3/Kconfig               |   2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |  18 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   2 +-
 drivers/media/platform/atmel/atmel-isc.h           |   1 +
 drivers/media/platform/atmel/atmel-isi.c           |  46 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |  44 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |  17 +-
 drivers/media/platform/davinci/vpif_capture.c      |   2 +-
 drivers/media/platform/davinci/vpif_display.c      |  86 +--
 drivers/media/platform/davinci/vpif_display.h      |   1 -
 drivers/media/platform/exynos4-is/media-dev.c      |  25 +-
 drivers/media/platform/exynos4-is/media-dev.h      |   2 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c  |  14 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |  12 +-
 drivers/media/platform/marvell-ccic/mcam-core.h    |   1 -
 drivers/media/platform/marvell-ccic/mmp-driver.c   |  11 +-
 drivers/media/platform/omap3isp/isp.c              |  74 +--
 drivers/media/platform/pxa_camera.c                |  83 +--
 drivers/media/platform/qcom/camss/camss.c          |  11 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |   5 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |   2 +-
 drivers/media/platform/rcar_drif.c                 |   2 +-
 drivers/media/platform/renesas-ceu.c               |  56 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |  15 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |  87 +--
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |   9 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h |   1 -
 drivers/media/platform/ti-vpe/cal.c                |  12 +-
 drivers/media/platform/video-mux.c                 |  14 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |  10 +-
 drivers/media/v4l2-core/Makefile                   |   2 +-
 drivers/media/v4l2-core/v4l2-async.c               |  95 +---
 drivers/media/v4l2-core/v4l2-clk.c                 | 321 -----------
 drivers/media/v4l2-core/v4l2-fwnode.c              |   6 +-
 drivers/staging/media/imx/imx-media-csi.c          |  14 +-
 drivers/staging/media/imx/imx-media-of.c           |   2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |  19 +-
 drivers/staging/media/imx/imx7-media-csi.c         |  16 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |  15 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   3 -
 drivers/staging/media/tegra-video/vi.c             |  10 +-
 include/media/davinci/vpif_types.h                 |   2 -
 include/media/v4l2-async.h                         |  89 ++-
 include/media/v4l2-clk.h                           |  73 ---
 68 files changed, 1362 insertions(+), 1223 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml
 delete mode 100644 Documentation/driver-api/media/v4l2-clocks.rst
 create mode 100644 drivers/media/i2c/rdacm21.c
 delete mode 100644 drivers/media/v4l2-core/v4l2-clk.c
 delete mode 100644 include/media/v4l2-clk.h

-- 
Kind regards,

Sakari Ailus
