Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45FCB562672
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbiF3XHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiF3XHp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:07:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BAD958FEC
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:07:39 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB72C25C;
        Fri,  1 Jul 2022 01:07:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630457;
        bh=X0oev0zOu9vW6im2CKVBz9toPYYmFgmMZF4thdKgzg4=;
        h=From:To:Cc:Subject:Date:From;
        b=Cs453VPICqrZ60l/0/dzJEVWHl2fMZNWPD9Oy1a5dAc9yIrfLYQ1dMwq/UOLELTDc
         1qNyqcVaO+vBMGQqHFAUkb7TwJfZYVGqwsHUKxGLPlHLaVk6A6WVKfvzzA6sH0sKCj
         4RPSYJikxf/+3jGfM/WX7/O+qQBFzEwQrgoRy91A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 00/55] media: rkisp1: Cleanups and add support for i.MX8MP
Date:   Fri,  1 Jul 2022 02:06:18 +0300
Message-Id: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series cleans up, reworks and extends the rkisp1 driver to support
the ISP found in the NXP i.MX8MP SoC.

The ISP IP cores in the Rockchip RK3399 (known as the "Rockchip ISP1")
and in the NXP i.MX8MP have the same origin, and have slightly diverged
over time as they are now independently developed (as far as I
understand) by Rockchip and VeriSilicon. The latter is marketed under
the name "ISP8000Nano", and is close enough to the RK3399 ISP that it
can easily be supported by the same driver.

This series starts with a few changes to the V4L2 async framework
(01/55) and MC core helpers (02/55 to 04/55) to support the rest of the
changes. It continues with various cleanups and reworks in order to
support CSI-2 receivers external to the ISP as found in the i.MX8MP
(05/55 to 45/55). Patch 46/55 is a small debugging improvement, and
patches 47/55 to 55/55 then add i.MX8MP support.

Compared to v1, patches have been shuffled around a bit so that patches
01/55 to 45/55 should be ready in time for integration in v5.20, while
the remaining patches may take one more kernel release. See individual
patches for detailed changelogs.

Review comments from v1 have been taken into account, except for patches
46/55, 48/55, 50/55 and 55/55 as discussion are still ongoing there.

This series depends on v4 of "media: rkisp1: Misc bug fixes and
cleanups" ([1]), which has been accepted in the Linux media tree for
v5.20.

[1] https://lore.kernel.org/linux-media/Ymbxs2p9Tuf331qM@pendragon.ideasonboard.com/T/

Laurent Pinchart (39):
  media: v4l2-async: Add notifier operation to destroy asd instances
  media: mc-entity: Rename media_entity_remote_pad() to
    media_pad_remote_pad_first()
  media: mc-entity: Add a new helper function to get a remote pad
  media: mc-entity: Add a new helper function to get a remote pad for a
    pad
  media: rkisp1: Enable compilation on ARCH_MXC
  media: rkisp1: Disable runtime PM in probe error path
  media: rkisp1: Read the ID register at probe time instead of streamon
  media: rkisp1: Rename rkisp1_match_data to rkisp1_info
  media: rkisp1: Access ISP version from info pointer
  media: rkisp1: cap: Print debug message on failed link validation
  media: rkisp1: Move sensor .s_stream() call to ISP
  media: rkisp1: Reject sensors without pixel rate control at bound time
  media: rkisp1: Create link from sensor to ISP at notifier bound time
  media: rkisp1: Create internal links at probe time
  media: rkisp1: Rename rkisp1_subdev_notifier() to
    rkisp1_subdev_notifier_register()
  media: rkisp1: Fix sensor source pad retrieval at bound time
  media: rkisp1: isp: Start CSI-2 receiver before ISP
  media: rkisp1: csi: Handle CSI-2 RX configuration fully in
    rkisp1-csi.c
  media: rkisp1: csi: Rename CSI functions with a common rkisp1_csi
    prefix
  media: rkisp1: csi: Move start delay to rkisp1_csi_start()
  media: rkisp1: csi: Pass sensor pointer to rkisp1_csi_config()
  media: rkisp1: csi: Constify argument to rkisp1_csi_start()
  media: rkisp1: isp: Don't initialize ret to 0 in rkisp1_isp_s_stream()
  media: rkisp1: isp: Pass mbus type and flags to rkisp1_config_cif()
  media: rkisp1: isp: Rename rkisp1_device.active_sensor to source
  media: rkisp1: isp: Add container_of wrapper to cast subdev to
    rkisp1_isp
  media: rkisp1: isp: Add rkisp1_device backpointer to rkisp1_isp
  media: rkisp1: isp: Pass rkisp1_isp pointer to internal ISP functions
  media: rkisp1: isp: Move input configuration to rkisp1_config_isp()
  media: rkisp1: isp: Merge ISP_ACQ_PROP configuration in single
    variable
  media: rkisp1: isp: Initialize some variables at declaration time
  media: rkisp1: isp: Fix whitespace issues
  media: rkisp1: isp: Constify various local variables
  media: rkisp1: isp: Rename rkisp1_get_remote_source()
  media: rkisp1: isp: Disallow multiple active sources
  media: rkisp1: csi: Plumb the CSI RX subdev
  media: rkisp1: Add infrastructure to support ISP features
  media: rkisp1: Make the internal CSI-2 receiver optional
  media: rkisp1: Configure gasket on i.MX8MP

Paul Elder (16):
  media: rkisp1: Save info pointer in rkisp1_device
  media: rkisp1: Make rkisp1_isp_mbus_info common
  media: rkisp1: Split CSI handling to separate file
  media: rkisp1: csi: Implement a V4L2 subdev for the CSI receiver
  media: rkisp1: Use fwnode_graph_for_each_endpoint
  dt-bindings: media: rkisp1: Add port for parallel interface
  media: rkisp1: Support the ISP parallel input
  media: rkisp1: debug: Add dump file in debugfs for MI buffer registers
  dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
  media: rkisp1: Add match data for i.MX8MP ISP
  media: rkisp1: Add and set registers for crop for i.MX8MP
  media: rkisp1: Add and set registers for output size config on i.MX8MP
  media: rkisp1: Add i.MX8MP-specific registers for MI and resizer
  media: rkisp1: Shift DMA buffer addresses on i.MX8MP
  media: rkisp1: Add register definitions for the test pattern generator
  media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP

 .../bindings/media/rockchip-isp1.yaml         |  30 +-
 Documentation/driver-api/media/mc-core.rst    |   5 +-
 .../driver-api/media/v4l2-subdev.rst          |   6 +
 drivers/media/i2c/adv748x/adv748x.h           |   2 +-
 drivers/media/i2c/tvp5150.c                   |   2 +-
 drivers/media/mc/mc-entity.c                  |  75 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   2 +-
 .../media/platform/qcom/camss/camss-csid.c    |   6 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   2 +-
 .../media/platform/qcom/camss/camss-ispif.c   |   4 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +-
 .../media/platform/qcom/camss/camss-video.c   |   6 +-
 drivers/media/platform/qcom/camss/camss.c     |   2 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |   2 +-
 .../platform/renesas/rcar-vin/rcar-csi2.c     |   2 +-
 .../platform/renesas/rcar-vin/rcar-dma.c      |   2 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |   2 +-
 .../media/platform/renesas/vsp1/vsp1_entity.c |   4 +-
 .../media/platform/renesas/vsp1/vsp1_video.c  |   2 +-
 .../media/platform/rockchip/rkisp1/Kconfig    |   2 +-
 .../media/platform/rockchip/rkisp1/Makefile   |   1 +
 .../platform/rockchip/rkisp1/rkisp1-capture.c |  49 +-
 .../platform/rockchip/rkisp1/rkisp1-common.c  | 143 ++++
 .../platform/rockchip/rkisp1/rkisp1-common.h  | 116 ++-
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 526 ++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-csi.h     |  28 +
 .../platform/rockchip/rkisp1/rkisp1-debug.c   |  35 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 474 +++++++-----
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 687 +++++++-----------
 .../platform/rockchip/rkisp1/rkisp1-params.c  |   2 +-
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  87 +++
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  43 +-
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |   4 +-
 .../platform/samsung/exynos4-is/common.c      |   2 +-
 .../samsung/exynos4-is/fimc-capture.c         |   6 +-
 .../samsung/exynos4-is/fimc-isp-video.c       |   2 +-
 .../platform/samsung/exynos4-is/fimc-lite.c   |   2 +-
 .../platform/samsung/exynos4-is/media-dev.c   |   2 +-
 .../samsung/s3c-camif/camif-capture.c         |   2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |   6 +-
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |   4 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |   2 +-
 drivers/media/platform/ti/cal/cal-video.c     |   2 +-
 drivers/media/platform/ti/omap3isp/isp.c      |   6 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c  |   2 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c  |   2 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |   2 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c |   4 +-
 drivers/media/platform/video-mux.c            |   2 +-
 .../media/platform/xilinx/xilinx-csi2rxss.c   |   2 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |   4 +-
 .../media/test-drivers/vimc/vimc-streamer.c   |   2 +-
 drivers/media/v4l2-core/v4l2-async.c          |  10 +
 .../staging/media/imx/imx-media-dev-common.c  |   2 +-
 drivers/staging/media/imx/imx-media-utils.c   |   2 +-
 drivers/staging/media/omap4iss/iss.c          |   6 +-
 drivers/staging/media/omap4iss/iss_csi2.c     |   2 +-
 drivers/staging/media/omap4iss/iss_video.c    |   2 +-
 drivers/staging/media/tegra-video/vi.c        |   4 +-
 include/media/media-entity.h                  |  68 +-
 include/media/v4l2-async.h                    |   2 +
 include/uapi/linux/rkisp1-config.h            |   3 +
 62 files changed, 1790 insertions(+), 722 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h

-- 
Regards,

Laurent Pinchart

