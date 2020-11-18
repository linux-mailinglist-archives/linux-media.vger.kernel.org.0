Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66D72B7B85
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 11:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgKRKld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 05:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgKRKld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 05:41:33 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA57C0613D4
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 02:41:32 -0800 (PST)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 98AE4634C93
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 12:41:20 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kfKtt-0000W9-3g
        for linux-media@vger.kernel.org; Wed, 18 Nov 2020 12:41:21 +0200
Date:   Wed, 18 Nov 2020 12:41:21 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.11] V4L2 sensor and CSI-2 driver patches
Message-ID: <20201118104121.GE867@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a smallish set of V4L2 sensor and CSI-2 driver patches. Notable
changes include the ov9734 sensor driver.

Please pull.


The following changes since commit 9463e07df8e0f93931e32c6f415d3f82bda63f35:

  media: v4l2-compat-ioctl32.c: add missing #ifdef CONFIG_COMPAT_32BIT_TIMEs (2020-11-17 07:14:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.11-2.1-signed

for you to fetch changes up to b1848758e322e652809bf5e63458b1f630292ccd:

  media: i2c: imx219: Declare that the driver can create events (2020-11-18 12:33:17 +0200)

----------------------------------------------------------------
V4L2 patches for 5.11

----------------------------------------------------------------
Andy Shevchenko (1):
      media: ipu3-cio2: Use macros from mm.h

Bingbu Cao (2):
      media: ov2740: only do OTP data read on demand from user
      media: ov2740: allow OTP data access during streaming

Dave Stevenson (1):
      media: i2c: imx219: Declare that the driver can create events

Hugues Fruchet (2):
      media: dt-bindings: media: st,stm32-dcmi: add support of BT656 bus
      media: stm32-dcmi: add support of BT656 bus

Nigel Christian (1):
      media: ipu3-cio2: fix trivial style warning

Rui Miguel Silva (3):
      dt-bindings: ov2680: convert bindings to yaml
      dt-bindings: imx7-csi: convert bindings to yaml
      dt-bindings: imx7-mipi-csi2: convert bindings to yaml

Tianshu Qiu (1):
      media: i2c: Add ov9734 image sensor driver

Xu Wang (1):
      media: i2c: mt9p031: Remove redundant null check before clk_disable_unprepare

 .../devicetree/bindings/media/i2c/ov2680.txt       |   46 -
 .../devicetree/bindings/media/i2c/ovti,ov2680.yaml |   99 ++
 .../devicetree/bindings/media/imx7-csi.txt         |   42 -
 .../devicetree/bindings/media/imx7-mipi-csi2.txt   |   90 --
 .../devicetree/bindings/media/nxp,imx7-csi.yaml    |   71 ++
 .../bindings/media/nxp,imx7-mipi-csi2.yaml         |  173 ++++
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |   38 +
 MAINTAINERS                                        |   14 +-
 drivers/media/i2c/Kconfig                          |   14 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx219.c                         |    3 +-
 drivers/media/i2c/mt9p031.c                        |    3 +-
 drivers/media/i2c/ov2740.c                         |  203 ++--
 drivers/media/i2c/ov9734.c                         | 1018 ++++++++++++++++++++
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    8 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |   37 +-
 16 files changed, 1596 insertions(+), 264 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
 create mode 100644 drivers/media/i2c/ov9734.c

-- 
Sakari Ailus
