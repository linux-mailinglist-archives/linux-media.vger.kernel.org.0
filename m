Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C586AF792
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 22:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbjCGV2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 16:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjCGV22 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 16:28:28 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E21897494
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 13:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678224505; x=1709760505;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xj14fKHAMt26CUSHgyWU1wTqrX3r+AJnOZmZUeItHcQ=;
  b=g8SaIaJqVGXUk8v/9qDlCKjExuW8T0oa+lm/ZQPQ7lTvXNB6W6gqw/DT
   oa6beiTEfVwP0IW7ielpK61ptjeV2BRa/DZPzFRhGk2J5lydmzknv3YSA
   R6/xq912/cwoKVwqxc3EZoHVSLT8jzSR8nZohya3uyxwhBe6WbnheA3QE
   FLygY99mxpINcPipQQ+utjD/QibFrNeZ0l8UIQEWVjl+7h0m4vQwhFSG4
   PZrFhmnqP4WmwtzafoOAhLemj/N003OFBnkvKMsichs5bV3HV+lLZQXlH
   76JSRS1MXgGNOTgZEBJwv1MHliYtwiKCoxqvlHlpdyWD1FO+qhY9a22CH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398557124"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="398557124"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676710138"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="676710138"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:15 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E1C2B11F78D;
        Tue,  7 Mar 2023 23:20:38 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: [RFC 00/10] Separate links and async sub-devices
Date:   Tue,  7 Mar 2023 23:20:28 +0200
Message-Id: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This set adds support for multiple downstream links in an async sub-device,
by separating the sub-device registration from the link creation.

A new concept, V4L2 async connection is added. Generally async notifiers
have a number of connections but at that level there is no knowledge of how
many sub-devices they will connect to. The bound and unbound callbacks now
work on connections. For the existing drivers there's only one connection so
I do not expect regressions because of that.

Async sub-device fwnode matching will now take place between the device (the
dev field of struct v4l2_subdev) and a struct v4l2_async_connection (an
endpoint for devices that have endpoints or the device for those that do
not). This is because the graph data structure only describes point-to-point
connections so therefore defining one end of the connection defines the
entire connection.

I'll still go through the documentation to make sure it's appropriately
modified.

I'm also posting this as an RFC as I would think more testing will be
required. There could be breakages in the intermediate patches. But feel
free to comment.

This set is unlikely to address all needs people have related to the async
framework but I think that beyond what it does, it paves some way for
addressing more of those additional needs.

To be frank, I'd like to get rid of the entire V4L2 async framework, but it
would require allowing much more dynamic driver initialisation, including
sub-devices and device nodes popping up in the system in the order and
extent there is successfully probed hardware. Until that, and this may well
be the entire foreseeable future, we have at least some of this complexity.

There's a bugfix, too, in the first patch. That should be merged separately.
The rest depends on it so I'm sending it as part of the set.

Sakari Ailus (10):
  media: v4l: async: Return async sub-devices to subnotifier list
  media: v4l: async: Add some debug prints
  media: v4l: async: Simplify async sub-device fwnode matching
  media: v4l: async: Make V4L2 async match information a struct
  media: v4l: async: Clean testing for duplicated async subdevs
  media: v4l: async: Only pass match information for async subdev
    validation
  media: v4l: async: Clean up list heads and entries
  media: v4l: async: Rename v4l2_async_subdev as v4l2_async_connection
  media: v4l: async: Set v4l2_device in async notifier init
  media: v4l: async: Differentiate connecting and creating sub-devices

 .../driver-api/media/v4l2-subdev.rst          |  10 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |   3 -
 drivers/media/i2c/max9286.c                   |  28 +-
 drivers/media/i2c/rdacm20.c                   |  15 +-
 drivers/media/i2c/rdacm21.c                   |  15 +-
 drivers/media/i2c/st-mipid02.c                |  12 +-
 drivers/media/i2c/tc358746.c                  |  13 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  14 +-
 drivers/media/platform/atmel/atmel-isi.c      |  12 +-
 drivers/media/platform/atmel/atmel-isi.h      |   2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  10 +-
 drivers/media/platform/intel/pxa_camera.c     |  16 +-
 drivers/media/platform/marvell/cafe-driver.c  |   7 +-
 drivers/media/platform/marvell/mcam-core.c    |   6 +-
 drivers/media/platform/marvell/mmp-driver.c   |   4 +-
 .../platform/microchip/microchip-csi2dc.c     |   6 +-
 .../platform/microchip/microchip-isc-base.c   |   4 +-
 .../media/platform/microchip/microchip-isc.h  |   2 +-
 .../microchip/microchip-sama5d2-isc.c         |   4 +-
 .../microchip/microchip-sama7g5-isc.c         |   4 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |  10 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |  10 +-
 drivers/media/platform/qcom/camss/camss.c     |   2 +-
 drivers/media/platform/qcom/camss/camss.h     |   2 +-
 drivers/media/platform/renesas/rcar-isp.c     |  12 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |  26 +-
 .../platform/renesas/rcar-vin/rcar-csi2.c     |  12 +-
 .../platform/renesas/rcar-vin/rcar-vin.h      |   4 +-
 drivers/media/platform/renesas/rcar_drif.c    |  12 +-
 drivers/media/platform/renesas/renesas-ceu.c  |  10 +-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  14 +-
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |   2 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  12 +-
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   2 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |   8 +-
 .../platform/samsung/exynos4-is/media-dev.c   |   6 +-
 .../platform/samsung/exynos4-is/media-dev.h   |   2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |  12 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  10 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   8 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   2 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  10 +-
 .../sun8i_a83t_mipi_csi2.c                    |  10 +-
 .../media/platform/ti/am437x/am437x-vpfe.c    |   9 +-
 .../media/platform/ti/am437x/am437x-vpfe.h    |   2 +-
 drivers/media/platform/ti/cal/cal.c           |  10 +-
 .../media/platform/ti/davinci/vpif_capture.c  |   7 +-
 drivers/media/platform/ti/omap3isp/isp.c      |   4 +-
 drivers/media/platform/ti/omap3isp/isp.h      |   2 +-
 drivers/media/platform/video-mux.c            |  10 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  28 +-
 drivers/media/v4l2-core/v4l2-async.c          | 601 +++++++++++-------
 drivers/media/v4l2-core/v4l2-fwnode.c         |  20 +-
 .../media/deprecated/atmel/atmel-isc-base.c   |   4 +-
 .../media/deprecated/atmel/atmel-isc.h        |   2 +-
 .../deprecated/atmel/atmel-sama5d2-isc.c      |   4 +-
 .../deprecated/atmel/atmel-sama7g5-isc.c      |   4 +-
 drivers/staging/media/imx/imx-media-csi.c     |  10 +-
 .../staging/media/imx/imx-media-dev-common.c  |   8 +-
 drivers/staging/media/imx/imx-media-dev.c     |   2 +-
 drivers/staging/media/imx/imx-media-of.c      |   4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  12 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  |  10 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   6 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   2 +-
 drivers/staging/media/tegra-video/vi.c        |  18 +-
 drivers/staging/media/tegra-video/vi.h        |   2 +-
 include/media/davinci/vpif_types.h            |   2 +-
 include/media/v4l2-async.h                    | 181 +++---
 include/media/v4l2-fwnode.h                   |  10 +-
 include/media/v4l2-subdev.h                   |   2 +-
 71 files changed, 735 insertions(+), 626 deletions(-)

-- 
2.30.2

