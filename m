Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9204F453
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 10:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfFVI3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jun 2019 04:29:19 -0400
Received: from retiisi.org.uk ([95.216.213.190]:53734 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbfFVI3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jun 2019 04:29:19 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 830FD634C7B
        for <linux-media@vger.kernel.org>; Sat, 22 Jun 2019 11:29:13 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hebOa-0000Jp-Ol
        for linux-media@vger.kernel.org; Sat, 22 Jun 2019 11:29:12 +0300
Date:   Sat, 22 Jun 2019 11:29:12 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.3] More sensor and CSI-2 driver patches
Message-ID: <20190622082912.knhtiwvwjreok55v@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's another set of CSI-2 and sensor driver patches for 5.3.

The number appears large but the only driver receiving a significant amount
of functional changes is the marvell-ccic.

Please pull.


The following changes since commit 3a959dcd11a4b1f55bbb4a37d3bac685c4e106b1:

  media: mt9m111: add regulator support (2019-06-21 17:56:39 -0400)

are available in the git repository at:

  ssh://linuxtv.org/git/sailus/media_tree.git tags/for-5.3-4-signed

for you to fetch changes up to e1f8eca499d2aac228bea702f361a0601dad5e94:

  staging: media: fix style problem (2019-06-22 10:36:59 +0300)

----------------------------------------------------------------
sensor and CSI-2 driver patches for 5.3

----------------------------------------------------------------
Aliasgar Surti (1):
      staging: media: fix style problem

Hugues Fruchet (4):
      media: st-mipid02: add support of V4L2_CID_LINK_FREQ
      media: st-mipid02: add support of RGB565
      media: st-mipid02: add support of YUYV8 and UYVY8
      media: st-mipid02: add support of JPEG

Lubomir Rintel (9):
      Revert "[media] marvell-ccic: reset ccic phy when stop streaming for stability"
      marvell-ccic: drop unused stuff
      marvell-ccic/mmp: enable clock before accessing registers
      marvell-ccic: rename the clocks
      marvell-ccic/mmp: add devicetree support
      marvell-ccic: use async notifier to get the sensor
      marvell-ccic: provide a clock for the sensor
      media: marvell-ccic: only calculate the DPHY registers when needed
      media: marvell-ccic: mmp: don't chicken out w/o pdata

Robert Jarzmik (1):
      media: mt9m111: fix fw-node refactoring

Sakari Ailus (2):
      mt9m111: No need to check for the regulator
      mt9m111: Fix error handling in mt9m111_power_on

Wolfram Sang (8):
      media: i2c: ak881x: simplify getting the adapter of a client
      media: i2c: mt9m001: simplify getting the adapter of a client
      media: i2c: mt9m111: simplify getting the adapter of a client
      media: i2c: ov2640: simplify getting the adapter of a client
      media: i2c: tw9910: simplify getting the adapter of a client
      staging: media: soc_camera: imx074: simplify getting the adapter of a client
      staging: media: soc_camera: mt9t031: simplify getting the adapter of a client
      staging: media: soc_camera: soc_mt9v022: simplify getting the adapter of a client

 drivers/media/i2c/ak881x.c                        |   2 +-
 drivers/media/i2c/mt9m001.c                       |   2 +-
 drivers/media/i2c/mt9m111.c                       |  37 ++-
 drivers/media/i2c/ov2640.c                        |   2 +-
 drivers/media/i2c/st-mipid02.c                    |  60 +++-
 drivers/media/i2c/tw9910.c                        |   3 +-
 drivers/media/platform/marvell-ccic/Kconfig       |   2 +
 drivers/media/platform/marvell-ccic/cafe-driver.c |  58 +++-
 drivers/media/platform/marvell-ccic/mcam-core.c   | 337 +++++++++++++++-------
 drivers/media/platform/marvell-ccic/mcam-core.h   |  12 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c  | 238 ++++-----------
 drivers/staging/media/soc_camera/imx074.c         |   2 +-
 drivers/staging/media/soc_camera/mt9t031.c        |   2 +-
 drivers/staging/media/soc_camera/soc_mt9v022.c    |   2 +-
 drivers/staging/media/soc_camera/soc_ov5642.c     |   6 +-
 include/linux/platform_data/media/mmp-camera.h    |   4 -
 16 files changed, 424 insertions(+), 345 deletions(-)

-- 
Sakari Ailus
