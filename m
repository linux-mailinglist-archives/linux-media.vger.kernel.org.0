Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA376DE524
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 09:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfJUHPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 03:15:50 -0400
Received: from retiisi.org.uk ([95.216.213.190]:56886 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727110AbfJUHPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 03:15:50 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 03668634C87
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 10:15:40 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iMRul-0000QF-Rz
        for linux-media@vger.kernel.org; Mon, 21 Oct 2019 10:15:39 +0300
Date:   Mon, 21 Oct 2019 10:15:39 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.5] Sensor and lens driver patches
Message-ID: <20191021071539.GB864@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's another bunch of sensor and lens driver patches for 5.5.

The noteworthy change is the addition of the imx290 driver.

Please pull.


The following changes since commit 4b1d7c2760d26363c497b959a81f8d055ba767c1:

  media: staging: media: Make use of devm_platform_ioremap_resource (2019-10-16 16:35:15 -0300)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.5-3-signed

for you to fetch changes up to fc6a5dd9c50f27ec13a77b0a5875a4512dff7066:

  media: imx7-mipi-csis: Add a check for devm_regulator_get (2019-10-21 10:01:47 +0300)

----------------------------------------------------------------
Sensor and camera related patches for 5.5

----------------------------------------------------------------
Benoit Parrot (3):
      media: ov5640: add PIXEL_RATE control
      media: ov5640: Fix 1920x1080 mode to remove extra enable/disable
      media: ov5640: Make 2592x1944 mode only available at 15 fps

Chuhong Yuan (2):
      media: st-mipid02: add a check for devm_gpiod_get_optional
      media: imx7-mipi-csis: Add a check for devm_regulator_get

Colin Ian King (1):
      media: lm3646: remove redundant assignment to variable rval

Janusz Krzysztofik (6):
      media: ov6650: Fix stored frame interval not in sync with hardware
      media: ov6650: Drop obsolete .pclk_limit attribute
      media: ov6650: Simplify clock divisor calculation
      media: ov6650: Don't reapply pixel clock divisor on format change
      media: ov6650: Drop unused .pclk_max field
      media: ov6650: Fix arbitrary selection of master clock rate

Manivannan Sadhasivam (2):
      dt-bindings: media: i2c: Add IMX290 CMOS sensor binding
      media: i2c: Add IMX290 CMOS image sensor driver

Ricardo Ribalda Delgado (6):
      media: ad5820: Define entity function
      media: ad5820: DT new optional field enable-gpios
      media: ad5820: Add support for enable pin
      media: ad5820: Add support for of-autoload
      media: ad5820: DT new compatible devices
      media: ad5820: Add support for ad5821 and ad5823

YueHaibing (1):
      media: i2c: ov5695: Fix randbuild error

 .../devicetree/bindings/media/i2c/ad5820.txt       |  11 +-
 .../devicetree/bindings/media/i2c/imx290.txt       |  57 ++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  14 +-
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/ad5820.c                         |  35 +-
 drivers/media/i2c/imx290.c                         | 884 +++++++++++++++++++++
 drivers/media/i2c/lm3646.c                         |   2 +-
 drivers/media/i2c/ov5640.c                         |  33 +-
 drivers/media/i2c/ov6650.c                         | 129 +--
 drivers/media/i2c/st-mipid02.c                     |   5 +
 drivers/staging/media/imx/imx7-mipi-csis.c         |   7 +-
 12 files changed, 1117 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
 create mode 100644 drivers/media/i2c/imx290.c

-- 
Sakari Ailus
