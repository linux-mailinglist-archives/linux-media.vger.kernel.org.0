Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6C46D041B
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbjC3L7D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjC3L7C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:02 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3036FA24B
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177541; x=1711713541;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ym6m14y3NMAFvdrU29p8KczAOiAtsNpHaGz191R2Eyg=;
  b=h52JkzMwIu33HoAVqN4qznND3YYgogiGsap5gWK8LZgC7twpfzUE6sfw
   IROjf4c2xkmvx8LVMm9Y7uMIuJbRcgNlunPbK77qSbCn1Eo24YOxp6YMo
   kCiU2VPM++aufwIBEmjS7fRcMXBnLdRo3KwQqSXOssmnsiTVDctQQNoBr
   qbwmvt0hnB6JcLBumInROh462jgfCC4HNLqCj6eNVMs9tPL38J4bNe3Av
   fV7BxaLQfC3n1165gC0vrxknzYhHPt6Mym4m9JhtoHPg77oqvUyXYoJuK
   K4q3+Slom+FyFc09WOAXq9CxtTGh5JgjYylT7NZQOfj1sZQzUVcVqvTLI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111319"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111319"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952898"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952898"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:58:57 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E45AE122457;
        Thu, 30 Mar 2023 14:58:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 00/18] Separate links and async sub-devices
Date:   Thu, 30 Mar 2023 14:58:35 +0300
Message-Id: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This set adds support for multiple downstream links in an async
sub-device, by separating the sub-device registration from the link
creation.

A new concept, V4L2 async connection is added. Generally async notifiers
have a number of connections but at that level there is no knowledge of
how many sub-devices they will connect to. The bound and unbound callbacks
now work on connections. For the existing drivers there's only one
connection so I do not expect regressions because of that.

Async sub-device fwnode matching will now take place between the device
(the dev field of struct v4l2_subdev) and a struct v4l2_async_connection
(an endpoint for devices that have endpoints or the device for those that
do not). This is because the graph data structure only describes
point-to-point connections so therefore defining one end of the connection
defines the entire connection.

This set is unlikely to address all needs people have related to the async
framework but I think that beyond what it does, it paves some way for
addressing more of those additional needs.

To be frank, I'd like to get rid of the entire V4L2 async framework, but
it would require allowing much more dynamic driver initialisation,
including sub-devices and device nodes popping up in the system in the
order and extent there is successfully probed hardware. Until that, and
this may well be the entire foreseeable future, we have at least some of
this complexity.

There's a bugfix, too, in the first patch. That should be merged
separately. The rest depends on it so I'm sending it as part of the set.

since RFC v1:

- Address missing API usage changes in a lot of drivers.

- Fix compilation problems in intermediate patches.

- Move V4L2 device registration earlier or move notifier initialisation
  and fwnode endpoint parsing past the current V4L2 device registration
  (patches 11--16).

Sakari Ailus (18):
  media: v4l: async: Return async sub-devices to subnotifier list
  media: v4l: async: Add some debug prints
  media: v4l: async: Simplify async sub-device fwnode matching
  media: v4l: async: Make V4L2 async match information a struct
  media: v4l: async: Clean testing for duplicated async subdevs
  media: v4l: async: Only pass match information for async subdev
    validation
  media: v4l: async: Clean up list heads and entries
  media: v4l: async: Rename v4l2_async_subdev as v4l2_async_connection
  media: v4l: async: Differentiate connecting and creating sub-devices
  media: pxa_camera: Register V4L2 device early, fix probe error
    handling
  media: marvell: cafe: Register V4L2 device earlier
  media: am437x-vpfe: Register V4L2 device early
  media: omap3isp: Initialise V4L2 async notifier later
  media: xilinx-vipp: Init async notifier after registering V4L2 device
  media: davinci: Init async notifier after registering V4L2 device
  media: qcom: Initialise V4L2 async notifier later
  media: v4l: async: Set v4l2_device in async notifier init
  Documentation: media: Document sub-device notifiers

 .../driver-api/media/v4l2-subdev.rst          |  16 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |   3 -
 drivers/media/i2c/max9286.c                   |  27 +-
 drivers/media/i2c/rdacm20.c                   |  15 +-
 drivers/media/i2c/rdacm21.c                   |  15 +-
 drivers/media/i2c/st-mipid02.c                |  12 +-
 drivers/media/i2c/tc358746.c                  |  13 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  14 +-
 drivers/media/platform/atmel/atmel-isi.c      |  12 +-
 drivers/media/platform/atmel/atmel-isi.h      |   2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  10 +-
 drivers/media/platform/intel/pxa_camera.c     |  46 +-
 drivers/media/platform/marvell/cafe-driver.c  |  19 +-
 drivers/media/platform/marvell/mcam-core.c    |  12 +-
 drivers/media/platform/marvell/mmp-driver.c   |   6 +-
 .../platform/microchip/microchip-csi2dc.c     |  11 +-
 .../platform/microchip/microchip-isc-base.c   |   4 +-
 .../media/platform/microchip/microchip-isc.h  |   2 +-
 .../microchip/microchip-sama5d2-isc.c         |   9 +-
 .../microchip/microchip-sama7g5-isc.c         |   9 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |  10 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |  10 +-
 drivers/media/platform/qcom/camss/camss.c     |  26 +-
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
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  12 +-
 .../platform/samsung/exynos4-is/media-dev.c   |  11 +-
 .../platform/samsung/exynos4-is/media-dev.h   |   2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |  12 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  10 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   8 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   2 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  10 +-
 .../sun8i_a83t_mipi_csi2.c                    |  10 +-
 .../media/platform/ti/am437x/am437x-vpfe.c    |  37 +-
 .../media/platform/ti/am437x/am437x-vpfe.h    |   2 +-
 drivers/media/platform/ti/cal/cal.c           |  10 +-
 .../media/platform/ti/davinci/vpif_capture.c  |  33 +-
 drivers/media/platform/ti/omap3isp/isp.c      |  17 +-
 drivers/media/platform/video-mux.c            |  10 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  29 +-
 drivers/media/v4l2-core/v4l2-async.c          | 601 +++++++++++-------
 drivers/media/v4l2-core/v4l2-fwnode.c         |  20 +-
 .../media/deprecated/atmel/atmel-isc-base.c   |   4 +-
 .../media/deprecated/atmel/atmel-isc.h        |   2 +-
 .../deprecated/atmel/atmel-sama5d2-isc.c      |   9 +-
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
 69 files changed, 825 insertions(+), 708 deletions(-)

-- 
2.30.2
