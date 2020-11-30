Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503002C8272
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 11:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbgK3KoD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:44:03 -0500
Received: from retiisi.eu ([95.216.213.190]:60878 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgK3KoD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:44:03 -0500
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E670D634C24
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 12:42:20 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kjgdR-0002aS-Dp
        for linux-media@vger.kernel.org; Mon, 30 Nov 2020 12:42:21 +0200
Date:   Mon, 30 Nov 2020 12:42:21 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.11] Camera sensor and CSI-2 patches (mostly)
Message-ID: <20201130104221.GM4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's another set of camera sensor and other nice patches for 5.11. In
particular, there's a driver a for ov02a10. Also a lot of DT bindings are
improved to conform to the graph schema. Apart from these, it's cleanups
and fixes.

Please pull.


The following changes since commit a3f132df0e5f25399c9592c2d14997975ddbf290:

  media: bttv: use generic power management (2020-11-27 14:11:26 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.11-4.1-signed

for you to fetch changes up to 603e062d47bbca54226712afb6ee5e20c6f88f70:

  media: i2c: imx219: Selection compliance fixes (2020-11-30 12:30:04 +0200)

----------------------------------------------------------------
V4L2 patches for 5.11

----------------------------------------------------------------
Bingbu Cao (1):
      media: ov9734: hold lock to check streaming state

Colin Ian King (1):
      media: ov2740: fix dereference before null check on pointer nvm

Dongchun Zhu (2):
      media: dt-bindings: media: i2c: document OV02A10 DT bindings
      media: i2c: add OV02A10 image sensor driver

Hans Verkuil (1):
      media: i2c: imx219: Selection compliance fixes

Jacopo Mondi (2):
      media: max9271: Fix GPIO enable/disable
      media: rdacm20: Enable GPIO1 explicitly

Niklas Söderlund (5):
      rcar-vin: Only dynamically allocate v4l2_async_subdev
      rcar-vin: Rework parallel firmware parsing
      rcar-vin: Use v4l2_async_subdev instead of fwnode_handle to match subdevices
      rcar-vin: Rework CSI-2 firmware parsing
      v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()

Rob Herring (1):
      dt-bindings: media: Use OF graph schema

Sakari Ailus (1):
      v4l: subdev: Set sd->devnode before registering the subdev

Thomas Gleixner (1):
      media: omap3isp: Remove misleading comment

 .../bindings/media/allwinner,sun4i-a10-csi.yaml    |    1 +
 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |    1 +
 .../devicetree/bindings/media/i2c/adv7180.yaml     |   31 +-
 .../devicetree/bindings/media/i2c/adv7604.yaml     |   32 +-
 .../bindings/media/i2c/aptina,mt9v111.yaml         |    2 +-
 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml       |   25 +-
 .../devicetree/bindings/media/i2c/imx219.yaml      |    4 +
 .../bindings/media/i2c/maxim,max9286.yaml          |   76 +-
 .../devicetree/bindings/media/i2c/ov5647.yaml      |    5 +-
 .../devicetree/bindings/media/i2c/ov8856.yaml      |    5 +-
 .../bindings/media/i2c/ovti,ov02a10.yaml           |  159 +++
 .../devicetree/bindings/media/i2c/ovti,ov772x.yaml |    1 +
 .../devicetree/bindings/media/i2c/sony,imx214.yaml |    1 +
 .../devicetree/bindings/media/i2c/sony,imx274.yaml |    3 +-
 .../bindings/media/marvell,mmp2-ccic.yaml          |    1 +
 .../devicetree/bindings/media/renesas,ceu.yaml     |    1 +
 .../devicetree/bindings/media/renesas,csi2.yaml    |   36 +-
 .../devicetree/bindings/media/renesas,vin.yaml     |    7 +-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |    7 +-
 .../devicetree/bindings/media/ti,cal.yaml          |   15 +-
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml       |   21 +-
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx219.c                         |   17 +-
 drivers/media/i2c/max9271.c                        |    8 +-
 drivers/media/i2c/ov02a10.c                        | 1013 ++++++++++++++++++++
 drivers/media/i2c/ov2740.c                         |    7 +-
 drivers/media/i2c/ov9734.c                         |    6 +-
 drivers/media/i2c/rdacm20.c                        |   13 +-
 drivers/media/platform/omap3isp/ispccdc.c          |    5 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |  154 +--
 drivers/media/platform/rcar-vin/rcar-dma.c         |   16 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |   12 +-
 drivers/media/platform/rcar-vin/rcar-vin.h         |    8 +-
 drivers/media/v4l2-core/v4l2-device.c              |    3 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   14 -
 include/media/v4l2-fwnode.h                        |   53 -
 38 files changed, 1404 insertions(+), 381 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
Sakari Ailus
