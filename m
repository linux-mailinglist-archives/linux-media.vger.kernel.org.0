Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C560677791
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 10:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbjAWJnC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 04:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbjAWJm6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 04:42:58 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261481B547
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 01:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674466977; x=1706002977;
  h=date:from:to:subject:message-id:mime-version;
  bh=GHY5oVsSLAAcHMa2YFvei3Pc6aZO999Ni+PizNnj5Ao=;
  b=Ix7NRc/ZodeInTCYGMBwCsaCuYtY9AZQhVItuldWka10A/L/SEF7DE73
   d9OSZzOUrKAmQnTCX6Qx4PBpWa0vBilAQkzJK9uhGDkmIYINkbNZkPk7T
   VyuvAw+nvvMMIGIgsiJiImcaaeqibtrHbD+jwBJIspHsgHxfT6HjESWYt
   Kb/Dv3CZiUL7fk4Fa0np88kgj1mV4cugx/PzCYGl78jIa4HyVaMxzZvHT
   rBUMrQSwgQ6mkd3QE9yyuXB8KZkMCmEGvmNs6PpeizGbmRO6fILQ1w895
   nWRadCD/N9nkXjkgE5Ti5a/rQpdphXnBeTUkuj6Bk4l31p09T4PXJ+LN8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="327267037"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="327267037"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 01:42:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="639066937"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="639066937"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 01:42:56 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E37D51225D4
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 11:42:52 +0200 (EET)
Date:   Mon, 23 Jan 2023 11:42:52 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.3 v2] Lots of camera sensor and some MC material
Message-ID: <Y85WnCXKpglRLPBT@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a large number of MC and camera sensor driver patches for 6.3.  In
particular this includes media graph traversal improvements, new drivers for
ov8858 and imx296, also lots of improvements and fixes for imx290 and DT
bindings to YAML conversion for ak7375.

Please pull.

since v1:

- Drop
  <URL:https://patchwork.linuxtv.org/project/linux-media/patch/20221217143113.3219104-1-linmq006@gmail.com/>
  which is already merged.


The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:

  media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.3-1.1-signed

for you to fetch changes up to 03c6dcbc169ae88dacb0b89970c67692d91e2a06:

  media: i2c: imx219: Fix binning for RAW8 capture (2023-01-23 11:25:03 +0200)

----------------------------------------------------------------
V4L2 patches for 6.3

----------------------------------------------------------------
Adam Ford (2):
      media: i2c: imx219: Split common registers from mode tables
      media: i2c: imx219: Support four-lane operation

Alexander Stein (2):
      media: i2c: ov9282: remove unused and unset i2c_client member
      media: i2c: ov9282: Switch to use dev_err_probe helper

Andrey Skvortsov (1):
      media: ov5640: Update last busy timestamp to reset autosuspend timer

Andy Shevchenko (1):
      media: i2c: st-vgxy61: Use asm intead of asm-generic

Guoniu.zhou (1):
      media: ov5640: set correct default format for CSI-2 mode

Jacopo Mondi (1):
      dt-bindings: media: Add OmniVision OV8858

Jai Luthra (3):
      media: ov5640: Fix soft reset sequence and timings
      media: ov5640: Handle delays when no reset_gpio set
      media: i2c: imx219: Fix binning for RAW8 capture

Laurent Pinchart (25):
      media: i2c: imx290: Group functions in sections
      media: i2c: imx290: Factor out subdev init and cleanup to functions
      media: i2c: imx290: Factor out control update code to a function
      media: i2c: imx290: Access link_freq_index directly
      media: i2c: imx290: Pass format and mode to imx290_calc_pixel_rate()
      media: i2c: imx290: Compute pixel rate and blanking in one place
      media: i2c: imx290: Factor out black level setting to a function
      media: i2c: imx290: Factor out DT parsing to separate function
      media: i2c: imx290: Use dev_err_probe()
      media: i2c: imx290: Factor out clock initialization to separate function
      media: i2c: imx290: Use V4L2 subdev active state
      media: i2c: imx290: Rename, extend and expand usage of imx290_pixfmt
      media: i2c: imx290: Use runtime PM autosuspend
      media: i2c: imx290: Initialize runtime PM before subdev
      media: i2c: imx290: Configure data lanes at start time
      media: i2c: imx290: Simplify imx290_set_data_lanes()
      media: i2c: imx290: Handle error from imx290_set_data_lanes()
      media: mc: entity: Add pad iterator for media_pipeline
      media: mc: entity: Add entity iterator for media_pipeline
      media: ti: omap3isp: Use media_pipeline_for_each_entity()
      media: ti: omap4iss: Use media_pipeline_for_each_entity()
      media: xilinx: dma: Use media_pipeline_for_each_pad()
      media: mc: Get media_device directly from pad
      media: mc: entity: Fix minor issues in comments and documentation
      media: i2c: IMX296 camera sensor driver

Manivannan Sadhasivam (1):
      dt-bindings: media: i2c: Add IMX296 CMOS sensor binding

Marco Felsch (3):
      media: i2c: tc358746: fix missing return assignment
      media: i2c: tc358746: fix ignoring read error in g_register callback
      media: i2c: tc358746: fix possible endianness issue

Nicholas Roth (1):
      media: i2c: Add driver for OmniVision OV8858

Oleg Verych (1):
      media: sun4i-csi: Use CSI_INT_STA_REG name, fix typo in a comment

Paul Elder (1):
      media: ov5640: Fix analogue gain control

Shang XiaoJing (3):
      media: max9286: Fix memleak in max9286_v4l2_register()
      media: ov2740: Fix memleak in ov2740_init_controls()
      media: ov5675: Fix memleak in ov5675_init_controls()

Yassine Oudjana (3):
      media: dt-bindings: ak7375: Convert to DT schema
      media: dt-bindings: ak7375: Add supplies
      media: i2c: ak7375: Add regulator management

Yuan Can (1):
      media: i2c: ov772x: Fix memleak in ov772x_probe()

 .../devicetree/bindings/media/i2c/ak7375.txt       |    8 -
 .../bindings/media/i2c/asahi-kasei,ak7375.yaml     |   52 +
 .../devicetree/bindings/media/i2c/ovti,ov8858.yaml |  106 ++
 .../devicetree/bindings/media/i2c/sony,imx296.yaml |  106 ++
 Documentation/driver-api/media/mc-core.rst         |   10 +-
 MAINTAINERS                                        |   20 +-
 drivers/media/i2c/Kconfig                          |   26 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/ak7375.c                         |   38 +
 drivers/media/i2c/imx219.c                         |  311 ++-
 drivers/media/i2c/imx290.c                         | 1059 ++++++-----
 drivers/media/i2c/imx296.c                         | 1172 ++++++++++++
 drivers/media/i2c/max9286.c                        |    1 +
 drivers/media/i2c/ov2740.c                         |    4 +-
 drivers/media/i2c/ov5640.c                         |   86 +-
 drivers/media/i2c/ov5675.c                         |    4 +-
 drivers/media/i2c/ov772x.c                         |    3 +-
 drivers/media/i2c/ov8858.c                         | 2008 ++++++++++++++++++++
 drivers/media/i2c/ov9282.c                         |    9 +-
 drivers/media/i2c/st-vgxy61.c                      |    4 +-
 drivers/media/i2c/tc358746.c                       |    9 +-
 drivers/media/mc/mc-entity.c                       |   69 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |    4 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |   20 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |   28 +-
 drivers/staging/media/omap4iss/iss_video.c         |   66 +-
 include/media/media-entity.h                       |   98 +
 27 files changed, 4537 insertions(+), 786 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ak7375.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
 create mode 100644 drivers/media/i2c/imx296.c
 create mode 100644 drivers/media/i2c/ov8858.c

-- 
Kind regards,

Sakari Ailus
