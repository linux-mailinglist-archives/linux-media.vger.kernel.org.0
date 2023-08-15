Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87BDB77D55E
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 23:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240286AbjHOVsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 17:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240393AbjHOVr7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 17:47:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32371FCE
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 14:47:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6088757E;
        Tue, 15 Aug 2023 23:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692136002;
        bh=et4hZeU8UzU1t3dHCuAOIEkplGbhzOe42Wa9c6jQzgw=;
        h=From:To:Cc:Subject:Date:From;
        b=KgmfZFUQg6BS33u1VBxYEQd7NBlupV70aDyUMthfjMv2EvYK5BT8fHzAr0wRnF4gK
         /veLlmyRVE3gdtQ/j2cdkVcTsplfjWKB24s7UNDR27l6yNdfptAX9Rq68B5/5IacEP
         eqyUxi9V9ma/FIt2Et/GIb6g6ZRdKO72t2kX2MEo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v1 0/2] media: v4l2-fwnode: Provide device context in endpoint parsing messages
Date:   Wed, 16 Aug 2023 00:47:59 +0300
Message-ID: <20230815214801.6420-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series improves (in my opinion) messages logged by
v4l2-fwnode when parsing endpoints by adding a device context. Patch 1/2
prepares for the change by passing a struct device pointer to the
v4l2_fwnode_endpoint_parse() and v4l2_fwnode_endpoint_alloc_parse()
functions, mass-patching all the callers. Patch 2/2 then makes use of
the device internally to switch from pr_*() to dev_*().

I haven't created a mailbomb by CC'ing individual maintainers of all the
drivers touched, as I would like to have feedback on the idea first.
get_maintainer.pl returns 109 addresses, which may be over the limit
that some mailing lists may accept before classifying the message as
spam.

Laurent Pinchart (2):
  media: Pass struct device pointer to fwnode endpoint parsing functions
  media: v4l2-fwnode: Replace pr_*() with dev_*()

 drivers/media/i2c/adv748x/adv748x-core.c      |   2 +-
 drivers/media/i2c/adv7604.c                   |   3 +-
 drivers/media/i2c/ar0521.c                    |   2 +-
 drivers/media/i2c/ccs/ccs-core.c              |   2 +-
 drivers/media/i2c/hi556.c                     |   2 +-
 drivers/media/i2c/hi846.c                     |   2 +-
 drivers/media/i2c/hi847.c                     |   2 +-
 drivers/media/i2c/imx214.c                    |   2 +-
 drivers/media/i2c/imx219.c                    |   2 +-
 drivers/media/i2c/imx274.c                    |   2 +-
 drivers/media/i2c/imx290.c                    |   2 +-
 drivers/media/i2c/imx319.c                    |   2 +-
 drivers/media/i2c/imx334.c                    |   2 +-
 drivers/media/i2c/imx335.c                    |   2 +-
 drivers/media/i2c/imx355.c                    |   2 +-
 drivers/media/i2c/imx412.c                    |   2 +-
 drivers/media/i2c/imx415.c                    |   2 +-
 drivers/media/i2c/isl7998x.c                  |   2 +-
 drivers/media/i2c/max9286.c                   |   2 +-
 drivers/media/i2c/mt9m111.c                   |   2 +-
 drivers/media/i2c/mt9p031.c                   |   3 +-
 drivers/media/i2c/mt9v032.c                   |   3 +-
 drivers/media/i2c/og01a1b.c                   |   2 +-
 drivers/media/i2c/ov02a10.c                   |   2 +-
 drivers/media/i2c/ov08d10.c                   |   2 +-
 drivers/media/i2c/ov08x40.c                   |   2 +-
 drivers/media/i2c/ov13b10.c                   |   2 +-
 drivers/media/i2c/ov2659.c                    |   3 +-
 drivers/media/i2c/ov2740.c                    |   2 +-
 drivers/media/i2c/ov4689.c                    |   2 +-
 drivers/media/i2c/ov5640.c                    |   2 +-
 drivers/media/i2c/ov5645.c                    |   2 +-
 drivers/media/i2c/ov5647.c                    |   6 +-
 drivers/media/i2c/ov5648.c                    |   2 +-
 drivers/media/i2c/ov5670.c                    |   3 +-
 drivers/media/i2c/ov5675.c                    |   2 +-
 drivers/media/i2c/ov5693.c                    |   2 +-
 drivers/media/i2c/ov7251.c                    |   2 +-
 drivers/media/i2c/ov7670.c                    |   2 +-
 drivers/media/i2c/ov772x.c                    |   5 +-
 drivers/media/i2c/ov8856.c                    |   2 +-
 drivers/media/i2c/ov8858.c                    |   2 +-
 drivers/media/i2c/ov8865.c                    |   2 +-
 drivers/media/i2c/ov9282.c                    |   2 +-
 drivers/media/i2c/ov9734.c                    |   2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |   2 +-
 drivers/media/i2c/s5k5baf.c                   |   2 +-
 drivers/media/i2c/st-mipid02.c                |   6 +-
 drivers/media/i2c/st-vgxy61.c                 |   2 +-
 drivers/media/i2c/tc358743.c                  |   3 +-
 drivers/media/i2c/tc358746.c                  |   4 +-
 drivers/media/i2c/tda1997x.c                  |   3 +-
 drivers/media/i2c/tvp514x.c                   |   3 +-
 drivers/media/i2c/tvp5150.c                   |   2 +-
 drivers/media/i2c/tvp7002.c                   |   3 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   2 +-
 drivers/media/platform/atmel/atmel-isi.c      |   2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |   2 +-
 drivers/media/platform/cadence/cdns-csi2tx.c  |   3 +-
 drivers/media/platform/intel/pxa_camera.c     |   2 +-
 .../platform/microchip/microchip-csi2dc.c     |   5 +-
 .../microchip/microchip-sama5d2-isc.c         |   2 +-
 .../microchip/microchip-sama7g5-isc.c         |   2 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |   2 +-
 drivers/media/platform/qcom/camss/camss.c     |   2 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |   4 +-
 .../platform/renesas/rcar-vin/rcar-csi2.c     |   2 +-
 drivers/media/platform/renesas/renesas-ceu.c  |   3 +-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |   2 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   2 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |   2 +-
 .../platform/samsung/exynos4-is/media-dev.c   |   3 +-
 .../platform/samsung/exynos4-is/mipi-csis.c   |   3 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |   2 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |   2 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   2 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   2 +-
 .../sun8i_a83t_mipi_csi2.c                    |   2 +-
 .../media/platform/ti/am437x/am437x-vpfe.c    |   2 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |   3 +-
 .../media/platform/ti/davinci/vpif_capture.c  |   3 +-
 drivers/media/platform/ti/omap3isp/isp.c      |   8 +-
 .../media/platform/xilinx/xilinx-csi2rxss.c   |   2 +-
 drivers/media/v4l2-core/v4l2-fwnode.c         | 128 +++++++++---------
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |   2 +-
 .../deprecated/atmel/atmel-sama5d2-isc.c      |   2 +-
 .../deprecated/atmel/atmel-sama7g5-isc.c      |   2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |   2 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  |   2 +-
 drivers/staging/media/max96712/max96712.c     |   2 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   2 +-
 drivers/staging/media/tegra-video/csi.c       |   2 +-
 drivers/staging/media/tegra-video/vi.c        |   2 +-
 drivers/staging/media/tegra-video/vip.c       |   2 +-
 include/media/v4l2-fwnode.h                   |  12 +-
 95 files changed, 201 insertions(+), 164 deletions(-)


base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
-- 
Regards,

Laurent Pinchart

