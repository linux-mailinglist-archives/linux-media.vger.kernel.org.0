Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58B4574A5A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 11:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390817AbfGYJut (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 05:50:49 -0400
Received: from retiisi.org.uk ([95.216.213.190]:59088 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725808AbfGYJut (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 05:50:49 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 6878F634C87
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 12:50:31 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hqaOM-0000mn-PD
        for linux-media@vger.kernel.org; Thu, 25 Jul 2019 12:50:30 +0300
Date:   Thu, 25 Jul 2019 12:50:30 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.4] V4L2 ISP, fwnode, sensor and CSI2 patches
Message-ID: <20190725095030.GG1263@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's my first set of V4L2 patches for 5.4. Included are sensor driver
patches, but also update for the Cadence CSI2TX driver and odd fixes and
cleanups. No new drivers this time.

Please pull.


The following changes since commit ebe15c7679680308268b99d911b1db15d514c7b8:

  media: tegra-cec: use cec_notifier_cec_adap_(un)register (2019-07-23 08:40:57 -0400)

are available in the Git repository at:

  ssh://linuxtv.org/git/sailus/media_tree.git tags/for-5.4-3-signed

for you to fetch changes up to d0de3d651cbc2ff02084a1671368c461bb3c3e78:

  media: staging/intel-ipu3: Use dev_get_drvdata where possible (2019-07-25 12:30:25 +0300)

----------------------------------------------------------------
V4L2 patches for 5.4

----------------------------------------------------------------
Andy Shevchenko (1):
      media: v4l2-fwnode: Switch to use fwnode_property_count_uXX()

Christophe JAILLET (1):
      media: ov2680: fix a typo in a function name

Chuhong Yuan (2):
      media: pci: Use dev_get_drvdata where possible
      media: staging/intel-ipu3: Use dev_get_drvdata where possible

Fabio Estevam (5):
      media: ov5645: Remove unneeded regulator_set_voltage()
      media: ov5645: Use regulator_bulk() functions
      media: i2c: ov5640: Check for devm_gpiod_get_optional() error
      media: i2c: ov5640: Fix the order for enabling regulators
      media: imx7.rst: Fix the references to the CSI multiplexer

Jan Kotas (4):
      media: dt-bindings: Update bindings for Cadence CSI2TX version 2.1
      media: Add lane checks for Cadence CSI2TX
      media: Fix Lane mapping in Cadence CSI2TX
      media: Add support for Cadence CSI2TX 2.1

 .../devicetree/bindings/media/cdns,csi2tx.txt      |   3 +-
 Documentation/media/v4l-drivers/imx7.rst           | 127 +++++++++--------
 drivers/media/i2c/ov2680.c                         |   4 +-
 drivers/media/i2c/ov5640.c                         |   7 +-
 drivers/media/i2c/ov5645.c                         | 120 +++-------------
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |   3 +-
 drivers/media/pci/pt1/pt1.c                        |   6 +-
 drivers/media/pci/pt3/pt3.c                        |   6 +-
 drivers/media/platform/cadence/cdns-csi2tx.c       | 155 ++++++++++++++++-----
 drivers/media/v4l2-core/v4l2-fwnode.c              |   8 +-
 drivers/staging/media/ipu3/ipu3.c                  |   3 +-
 11 files changed, 225 insertions(+), 217 deletions(-)

-- 
Kind regards,

Sakari Ailus
