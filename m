Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D5B5763CF
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 16:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiGOOoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 10:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiGOOoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 10:44:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52C421E28
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 07:44:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9C25993;
        Fri, 15 Jul 2022 16:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657896274;
        bh=KKsRJWOui/B9ctlc8kETpuiGrhxdWxuYS0CooEZdSkc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u+dTSQZYG425uhPAtZAdHpSqPlLZgH/cJYJXVEpxfNqC0/ouRldXYq+h5LWN13+Ya
         4ieL/O2UsKrvLO8QlVItJJ1HQff78NCk9/QBtq51rixynwPFEWOvKysrRZnDbgAK+6
         oKELXHvHB0K4ZpsLIRyj5umUuo/M0wVn95TvlyBw=
Date:   Fri, 15 Jul 2022 17:44:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [GIT PULL FOR v5.20 - v2] rkisp1 refactoring to prepare for i.MX8MP
 support
Message-ID: <YtF9MkyD11fMnpYp@pendragon.ideasonboard.com>
References: <Ys30elcTTEnlu7c7@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ys30elcTTEnlu7c7@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This v2 addresses a compilation issue in commit "media: mc-entity:
Rename media_entity_remote_pad() to media_pad_remote_pad_first()" that
was caused by another pull request not present in my base branch. It is
now rebased on top of the stage/master branch, with an update of the
offending patch sent to the mailing list.

The following changes since commit 109670df7dfed3fa0cb33e0868a889f4f512b698:

  media: ov5693: add ov5693_of_match, dts support (2022-07-15 15:33:08 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220715

for you to fetch changes up to 6d295cbc759d68143699f1c2abdd0e7433b987c1:

  media: rkisp1: debug: Add dump file in debugfs for MI main path registers (2022-07-15 17:36:10 +0300)

----------------------------------------------------------------
rkisp1 refactoring to prepare for i.MX8MP support

----------------------------------------------------------------
Laurent Pinchart (38):
      media: v4l2-async: Add notifier operation to destroy asd instances
      media: mc-entity: Rename media_entity_remote_pad() to media_pad_remote_pad_first()
      media: mc-entity: Add a new helper function to get a remote pad
      media: mc-entity: Add a new helper function to get a remote pad for a pad
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
      media: rkisp1: Rename rkisp1_subdev_notifier() to rkisp1_subdev_notifier_register()
      media: rkisp1: Fix sensor source pad retrieval at bound time
      media: rkisp1: isp: Start CSI-2 receiver before ISP
      media: rkisp1: csi: Handle CSI-2 RX configuration fully in rkisp1-csi.c
      media: rkisp1: csi: Rename CSI functions with a common rkisp1_csi prefix
      media: rkisp1: csi: Move start delay to rkisp1_csi_start()
      media: rkisp1: csi: Pass sensor pointer to rkisp1_csi_config()
      media: rkisp1: csi: Constify argument to rkisp1_csi_start()
      media: rkisp1: isp: Don't initialize ret to 0 in rkisp1_isp_s_stream()
      media: rkisp1: isp: Pass mbus type and flags to rkisp1_config_cif()
      media: rkisp1: isp: Rename rkisp1_device.active_sensor to source
      media: rkisp1: isp: Add container_of wrapper to cast subdev to rkisp1_isp
      media: rkisp1: isp: Add rkisp1_device backpointer to rkisp1_isp
      media: rkisp1: isp: Pass rkisp1_isp pointer to internal ISP functions
      media: rkisp1: isp: Move input configuration to rkisp1_config_isp()
      media: rkisp1: isp: Merge ISP_ACQ_PROP configuration in single variable
      media: rkisp1: isp: Initialize some variables at declaration time
      media: rkisp1: isp: Fix whitespace issues
      media: rkisp1: isp: Constify various local variables
      media: rkisp1: isp: Rename rkisp1_get_remote_source()
      media: rkisp1: isp: Disallow multiple active sources
      media: rkisp1: csi: Plumb the CSI RX subdev
      media: rkisp1: Add infrastructure to support ISP features
      media: rkisp1: Make the internal CSI-2 receiver optional

Paul Elder (8):
      media: rkisp1: Save info pointer in rkisp1_device
      media: rkisp1: Make rkisp1_isp_mbus_info common
      media: rkisp1: Split CSI handling to separate file
      media: rkisp1: csi: Implement a V4L2 subdev for the CSI receiver
      media: rkisp1: Use fwnode_graph_for_each_endpoint
      dt-bindings: media: rkisp1: Add port for parallel interface
      media: rkisp1: Support the ISP parallel input
      media: rkisp1: debug: Add dump file in debugfs for MI main path registers

 .../devicetree/bindings/media/rockchip-isp1.yaml   |  23 +-
 Documentation/driver-api/media/mc-core.rst         |   5 +-
 Documentation/driver-api/media/v4l2-subdev.rst     |   6 +
 drivers/media/i2c/adv748x/adv748x.h                |   2 +-
 drivers/media/i2c/tvp5150.c                        |   2 +-
 drivers/media/mc/mc-entity.c                       |  74 ++-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   2 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |   6 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   2 +-
 drivers/media/platform/qcom/camss/camss-ispif.c    |   4 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +-
 drivers/media/platform/qcom/camss/camss-video.c    |   6 +-
 drivers/media/platform/qcom/camss/camss.c          |   2 +-
 .../media/platform/renesas/rcar-vin/rcar-core.c    |   2 +-
 .../media/platform/renesas/rcar-vin/rcar-csi2.c    |   2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   2 +-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |   2 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |   4 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |   2 +-
 drivers/media/platform/rockchip/rkisp1/Kconfig     |   2 +-
 drivers/media/platform/rockchip/rkisp1/Makefile    |   1 +
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |  22 +-
 .../media/platform/rockchip/rkisp1/rkisp1-common.c | 143 ++++++
 .../media/platform/rockchip/rkisp1/rkisp1-common.h | 109 +++-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    | 536 +++++++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-csi.h    |  28 +
 .../media/platform/rockchip/rkisp1/rkisp1-debug.c  |  21 +
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 431 +++++++++-------
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 571 +++++----------------
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |   2 +-
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |  14 +-
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |   4 +-
 drivers/media/platform/samsung/exynos4-is/common.c |   2 +-
 .../platform/samsung/exynos4-is/fimc-capture.c     |   6 +-
 .../platform/samsung/exynos4-is/fimc-isp-video.c   |   2 +-
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |   2 +-
 .../media/platform/samsung/exynos4-is/media-dev.c  |   2 +-
 .../platform/samsung/s3c-camif/camif-capture.c     |   2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |   6 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |   4 +-
 drivers/media/platform/ti/cal/cal-camerarx.c       |   2 +-
 drivers/media/platform/ti/cal/cal-video.c          |   2 +-
 drivers/media/platform/ti/omap3isp/isp.c           |   6 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c       |   2 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c       |   2 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c       |   2 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |   4 +-
 drivers/media/platform/video-mux.c                 |   2 +-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    |   2 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |   4 +-
 drivers/media/test-drivers/vimc/vimc-streamer.c    |   2 +-
 drivers/media/v4l2-core/v4l2-async.c               |  10 +
 drivers/staging/media/imx/imx-media-dev-common.c   |   2 +-
 drivers/staging/media/imx/imx-media-utils.c        |   2 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   2 +-
 drivers/staging/media/omap4iss/iss.c               |   6 +-
 drivers/staging/media/omap4iss/iss_csi2.c          |   2 +-
 drivers/staging/media/omap4iss/iss_video.c         |   2 +-
 drivers/staging/media/tegra-video/vi.c             |   4 +-
 include/media/media-entity.h                       |  68 ++-
 include/media/v4l2-async.h                         |   2 +
 61 files changed, 1479 insertions(+), 711 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h

-- 
Regards,

Laurent Pinchart
