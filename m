Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F6070F50B
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbjEXLYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232729AbjEXLYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:24:30 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805E6C5
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927468; x=1716463468;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A4rWG378d0tFVi7zd2HP0sVA0Ew+seIYR+ceMm+YtbA=;
  b=PsC7J5WgbLFKgIBvCGBufs+4F8YeFDoz8Zc5xpEJqWjr/DinN7U3dp1s
   /WHqiRW3E4I9wk5+qeF2LBNyVu2w86PQbK55nNbPsQJVDeWQ/ECaSTM7y
   oF6fXpvtckIdisAjGfIN/OAV4SoGoRBki3LoSo77gYiU+4bmC0WA5AjBf
   Zej9OUwpJjgnvDrUQ4Gq1W3R1ClppBdY1v1yWk9JgSWQWdyLrt8MMg/QF
   p6PsXC0mkZxYWHkfiKKO6XAOfeUXff+jv+IR5EZ2tvY4l0G3awxBL8Wzk
   2yaQPlDKWnlF5LP9UJ7F1ac+dOgmkbVjsAWy89iixKs6a01ACR1uupSVK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758105"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758105"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540544"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540544"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:23 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 23E9B1202A9;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb1-008z5x-Fq; Wed, 24 May 2023 14:23:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 00/32] Separate links and async sub-devices
Date:   Wed, 24 May 2023 14:23:17 +0300
Message-Id: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
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

A new concept, V4L2 async connection is added. A connection later on
translates to an MC ancillary or data link. Generally async notifiers have
a number of connections but at that level there is no knowledge of how
many sub-devices they will connect to. The bound and unbound callbacks now
work on connections. For the existing drivers there's only one connection
so I do not expect regressions because of that.

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

I didn't add the Tested-by: tags I got for v2 as there are significant
changes, albeit only for better I hope. :-) Niklas has also tested this on
rcar-vin + adv746x, it works now while on v2 it did not. So having also
this version validated on i.MX6 would be nice.

The code also can be found in my async-multi branch, on media tree master.

since v2:

- Drop the sub-devices (struct v4l2_async_subdev) earlier re-introduced in
  this patchset. They aren't necessary, instead we can use struct
  v4l2_subdev to store the information. This simplifies the code quite a
  bit, including removal of one of the global lists: only the sub-device
  and notifier lists are left now. The sub-device is assigned to the
  connection at the bound time: information on which sub-devices are
  connected via async connections is only actually available at the time
  of binding.

- Address issues related to sub-device handling in the rcar-vin driver.
  Also other fixes to the rcar-vin driver (bugs introduced in v2).

- Remove sub-device's notifier field, including an omap3isp patch removing
  an unnecessary test.

- Drop support for async sub-device side endpoint matching. Convert
  NXP imx-mipi-csis.

since v1:

- Fixed object relation issues. The set has now been tested on an
  async sub-device with two pads connected by data links to sub-devices on
  a notifier (struct) device. (Multiple notifiers should work, too, but
  has not been tested.)

- Add a function to obtain an async connection based on the sub-device.
  This is useful for drivers for accessing their own link specific data.

- Improved documentation. Include a patch documenting
  v4l2_async_nf_add_fwnode().

- Return endpoint matching and address adv748x driver breakage in v1. It's
  a special case so other drivers can remain simpler.

- Swap notifier initialisation arguments, by making the notifier the first
  argument.

- Remove extra fwnode_handle_put() in max9286_v4l2_unregister().

- Make struct device available before notifier initialisation for
  consistent debug messages.

- Simplify notifier and async sub-device linked lists. Consistent list
  head and list entry naming.

- Drop leftovers from an early experimenation work in rkisp1 and omap3isp
  drivers.

- Simplify xilinx-vipp sub-device binding.

- Use if()s in notifier_dev() of v4l2-async.c.

- Improved debug messages in v4l2-async.c, use v4l2-async prefix and
  generally with notifier device.

- Call match types with macros V4L2_ASYNC_MATCH_TYPE_* (was
  V4L2_ASYNC_MATCH_*).

- Create ancillary links only when the sub-device is registered, not when
  a connection is bound (which can take place more than once for a
  sub-device).

- Rename struct v4l2_async_match as v4l2_async_match_desc.

- Perform list initialisation in notifier init rather than registration.

- Get rid of the "readd" parameter for v4l2_async_nf_unbind_all_subdevs().

- Check async sub-device validity on a notifier only when the notifier is
  registered. This removes extra list traversal and simplifies the code.

- Remove extra list initialisation in v4l2_async_register_subdev().

- Drop v4l2_async_cleanup(). It was no longer useful, called from a single
  place.

- Lots of kerneldoc fixes (mostly changed argument names).

since RFC v1:

- Address missing API usage changes in a lot of drivers.

- Fix compilation problems in intermediate patches.

- Move V4L2 device registration earlier or move notifier initialisation
  and fwnode endpoint parsing past the current V4L2 device registration
  (patches 11--16).

Jacopo Mondi (1):
  media: v4l: async: Drop v4l2_async_nf_parse_fwnode_endpoints()

Sakari Ailus (31):
  media: Documentation: v4l: Document missing async subdev function
  media: xilinx-vipp: Clean up bound async notifier callback
  media: omap3isp: Don't check for the sub-device's notifier
  media: v4l: async: Add some debug prints
  media: v4l: async: Clean up testing for duplicate async subdevs
  media: v4l: async: Drop unneeded list entry initialisation
  media: v4l: async: Don't check whether asd is NULL in validity check
  media: v4l: async: Make V4L2 async match information a struct
  media: v4l: async: Rename V4L2_ASYNC_MATCH_ macros, add TYPE_
  media: v4l: async: Only pass match information for async subdev
    validation
  media: v4l: async: Clean up list heads and entries
  media: v4l: async: Simplify async sub-device fwnode matching
  media: v4l: async: Rename v4l2_async_subdev as v4l2_async_connection
  media: v4l: async: Clean up error handling in v4l2_async_match_notify
  media: v4l: async: Drop duplicate handling when adding connections
  media: v4l: async: Rework internal lists
  media: v4l: async: Obtain async connection based on sub-device
  media: v4l: async: Allow multiple connections between entities
  media: v4l: async: Try more connections
  media: v4l: async: Support fwnode endpoint list matching for subdevs
  media: adv748x: Return to endpoint matching
  media: pxa_camera: Fix probe error handling
  media: pxa_camera: Register V4L2 device early
  media: marvell: cafe: Register V4L2 device earlier
  media: am437x-vpfe: Register V4L2 device early
  media: omap3isp: Initialise V4L2 async notifier later
  media: xilinx-vipp: Init async notifier after registering V4L2 device
  media: davinci: Init async notifier after registering V4L2 device
  media: qcom: Initialise V4L2 async notifier later
  media: v4l: async: Set v4l2_device in async notifier init
  media: Documentation: v4l: Document sub-device notifiers

 .../driver-api/media/v4l2-subdev.rst          |  28 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |  13 +-
 drivers/media/i2c/max9286.c                   |  27 +-
 drivers/media/i2c/rdacm20.c                   |  16 +-
 drivers/media/i2c/rdacm21.c                   |  15 +-
 drivers/media/i2c/st-mipid02.c                |  12 +-
 drivers/media/i2c/tc358746.c                  |  15 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  14 +-
 drivers/media/platform/atmel/atmel-isi.c      |  12 +-
 drivers/media/platform/atmel/atmel-isi.h      |   2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  10 +-
 drivers/media/platform/intel/pxa_camera.c     |  77 +-
 drivers/media/platform/marvell/cafe-driver.c  |  18 +-
 drivers/media/platform/marvell/mcam-core.c    |  12 +-
 drivers/media/platform/marvell/mmp-driver.c   |   6 +-
 .../platform/microchip/microchip-csi2dc.c     |  11 +-
 .../platform/microchip/microchip-isc-base.c   |   4 +-
 .../media/platform/microchip/microchip-isc.h  |   2 +-
 .../microchip/microchip-sama5d2-isc.c         |   9 +-
 .../microchip/microchip-sama7g5-isc.c         |   9 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |  17 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |  10 +-
 .../platform/nxp/imx8-isi/imx8-isi-core.c     |  12 +-
 drivers/media/platform/qcom/camss/camss.c     |  26 +-
 drivers/media/platform/qcom/camss/camss.h     |   2 +-
 drivers/media/platform/renesas/rcar-isp.c     |  12 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |  52 +-
 .../platform/renesas/rcar-vin/rcar-csi2.c     |  20 +-
 .../platform/renesas/rcar-vin/rcar-vin.h      |   8 +-
 drivers/media/platform/renesas/rcar_drif.c    |  12 +-
 drivers/media/platform/renesas/renesas-ceu.c  |  10 +-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  14 +-
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |   2 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  12 +-
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   2 +-
 .../platform/rockchip/rkisp1/rkisp1-csi.c     |   7 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  12 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |   8 +-
 .../platform/samsung/exynos4-is/media-dev.c   |  11 +-
 .../platform/samsung/exynos4-is/media-dev.h   |   2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |  12 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  10 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   8 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   2 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  10 +-
 .../sun8i_a83t_mipi_csi2.c                    |  10 +-
 .../media/platform/ti/am437x/am437x-vpfe.c    |  36 +-
 .../media/platform/ti/am437x/am437x-vpfe.h    |   2 +-
 drivers/media/platform/ti/cal/cal.c           |  10 +-
 .../media/platform/ti/davinci/vpif_capture.c  |  33 +-
 drivers/media/platform/ti/omap3isp/isp.c      |  29 +-
 drivers/media/platform/ti/omap3isp/isp.h      |  15 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c  |  13 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c  |   2 +
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |   2 +
 .../media/platform/ti/omap3isp/ispcsiphy.c    |  15 +-
 drivers/media/platform/video-mux.c            |  10 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  55 +-
 drivers/media/v4l2-core/v4l2-async.c          | 685 ++++++++++--------
 drivers/media/v4l2-core/v4l2-fwnode.c         | 109 +--
 drivers/media/v4l2-core/v4l2-subdev.c         |  13 +
 .../media/deprecated/atmel/atmel-isc-base.c   |   4 +-
 .../media/deprecated/atmel/atmel-isc.h        |   2 +-
 .../deprecated/atmel/atmel-sama5d2-isc.c      |   9 +-
 .../deprecated/atmel/atmel-sama7g5-isc.c      |   9 +-
 drivers/staging/media/imx/imx-media-csi.c     |  10 +-
 .../staging/media/imx/imx-media-dev-common.c  |   6 +-
 drivers/staging/media/imx/imx-media-dev.c     |   2 +-
 drivers/staging/media/imx/imx-media-of.c      |   4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  12 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  |  10 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   6 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   2 +-
 drivers/staging/media/tegra-video/vi.c        |  18 +-
 drivers/staging/media/tegra-video/vi.h        |   2 +-
 include/media/davinci/vpif_types.h            |   2 +-
 include/media/v4l2-async.h                    | 218 +++---
 include/media/v4l2-fwnode.h                   |  68 +-
 include/media/v4l2-subdev.h                   |  17 +-
 79 files changed, 973 insertions(+), 1072 deletions(-)

-- 
2.30.2

