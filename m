Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5001261F7E
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 22:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732332AbgIHUEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 16:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730400AbgIHPXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 11:23:51 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDE6C061A20
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 07:10:47 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 1FA7A634C87
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 17:08:23 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kFeIJ-0000WB-9N
        for linux-media@vger.kernel.org; Tue, 08 Sep 2020 17:08:23 +0300
Date:   Tue, 8 Sep 2020 17:08:23 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.10] V4L2 camera patches
Message-ID: <20200908140823.GC834@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a bunch of V4L2 camera and fwnode patches for 5.10.

Please pull.

The following changes since commit d13ee586e026e8166231e03e5345718ebf625c02:

  Merge tag 'v5.9-rc4' into patchwork (2020-09-07 16:13:06 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.10-2-signed

for you to fetch changes up to 7f79a4f1e832ac02fa7594806db2ad14adf134e5:

  media: ov8856: Add support for 3264x2448 mode (2020-09-08 16:30:50 +0300)

----------------------------------------------------------------
V4L2 patche sfor 5.10

----------------------------------------------------------------
Andy Shevchenko (10):
      media: ipu3-cio2: Simplify cleanup code
      media: ipu3-cio2: Introduce CIO2_LOP_ENTRIES constant
      media: ipu2-cio2: Replace custom definition with PAGE_SIZE
      media: ipu3-cio2: Use macros from pfn.h
      media: ipu3-cio2: Replace infinite loop by one with clear exit condition
      media: ipu3-cio2: Use readl_poll_timeout() helper
      media: ipu3-cio2: Get rid of pci_set_master() duplication
      media: ipu3-cio2: Drop bogus check and error message
      media: ipu3-cio2: Drop useless assignments
      media: ipu3-cio2: Update Copyright year and fix indentation issues

Christophe JAILLET (1):
      media: staging/intel-ipu3: css: Correctly reset some memory

Dinghao Liu (1):
      media: omap3isp: Fix memleak in isp_probe

Lad Prabhakar (6):
      media: i2c: ov5640: Remain in power down for DVP mode unless streaming
      media: i2c: ov5640: Separate out mipi configuration from s_power
      media: i2c: ov5640: Enable data pins on poweron for DVP mode
      media: i2c: ov5640: Configure HVP lines in s_power callback
      media: i2c: ov5640: Add support for BT656 mode
      media: i2c: ov5640: Fail probe on unsupported bus_type

Laurent Pinchart (5):
      media: v4l2-async: Document asd allocation requirements
      media: rcar_drif: Fix fwnode reference leak when parsing DT
      media: rcar_drif: Allocate v4l2_async_subdev dynamically
      media: rcar-csi2: Allocate v4l2_async_subdev dynamically
      media: i2c: max9286: Allocate v4l2_async_subdev dynamically

Robert Foss (2):
      media: ov8856: Add support for 1632x1224 mode
      media: ov8856: Add support for 3264x2448 mode

Sakari Ailus (5):
      media: i2c: Remove Alan Chiang's e-mail address
      v4l2-fwnode: Use debug level for printing link frequencies
      v4l2-fwnode: Make number of data lanes a character
      v4l2-fwnode: Make bus configuration a struct
      v4l2-fwnode: Document new usage patterns of v4l2_fwnode_endpoint_parse

 drivers/media/i2c/dw9807-vcm.c               |   2 +-
 drivers/media/i2c/imx258.c                   |   2 +-
 drivers/media/i2c/max9286.c                  |  40 +--
 drivers/media/i2c/ov5640.c                   | 336 ++++++++++++---------
 drivers/media/i2c/ov8856.c                   | 430 +++++++++++++++++++++++++++
 drivers/media/pci/intel/ipu3/ipu3-cio2.c     | 150 ++++------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h     |   4 +-
 drivers/media/platform/omap3isp/isp.c        |   6 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c  |  24 +-
 drivers/media/platform/rcar_drif.c           |  30 +-
 drivers/media/v4l2-core/v4l2-fwnode.c        |   4 +-
 drivers/staging/media/ipu3/ipu3-css-params.c |   2 +-
 include/media/v4l2-async.h                   |   5 +-
 include/media/v4l2-fwnode.h                  |  24 +-
 14 files changed, 745 insertions(+), 314 deletions(-)

-- 
Sakari Ailus
