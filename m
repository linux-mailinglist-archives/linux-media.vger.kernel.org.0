Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8703D7A0D77
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240748AbjINSuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240743AbjINSue (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:50:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37ACA144FFC
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:44:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCF6E15EF;
        Thu, 14 Sep 2023 20:42:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694716969;
        bh=1x/krJbBaWEcTmS0Hmfr3v6bjo/J1oI90VyUhAYrtB4=;
        h=From:To:Cc:Subject:Date:From;
        b=XVg+b3yV9eUmPyAfPtA5KxMLAZLeebSA0HXFr+Xreo3oyjmKgGmragz101dg0oLdD
         5qzlxWu7aebgnfj6u/FBgo2ssnYSkrH8wB86oV5V5ODwLU494O9KO6AbvXXZqdlEw4
         rqmSDfYEV3ACY4dFFbTjdC5RQ+CAFyHfL3s690s8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 0/2] media: v4l2-fwnode: Provide device context in endpoint parsing messages
Date:   Thu, 14 Sep 2023 21:44:33 +0300
Message-ID: <20230914184435.7807-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The series has been rebased on top ov v6.6-rc1 (or, more exactly, on top
of Sakari's master branch available at
https://git.linuxtv.org/sailus/media_tree.git/log/). There are otherwise
no other update.

Laurent Pinchart (2):
  media: Pass struct device pointer to fwnode endpoint parsing functions
  media: v4l2-fwnode: Replace pr_*() with dev_*()

 drivers/media/i2c/adv748x/adv748x-core.c      |   2 +-
 drivers/media/i2c/adv7604.c                   |   3 +-
 drivers/media/i2c/ar0521.c                    |   2 +-
 drivers/media/i2c/ccs/ccs-core.c              |   2 +-
 drivers/media/i2c/ds90ub913.c                 |   2 +-
 drivers/media/i2c/ds90ub953.c                 |   2 +-
 drivers/media/i2c/ds90ub960.c                 |   4 +-
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
 drivers/media/i2c/ov2680.c                    |   2 +-
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
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |   2 +-
 drivers/media/pci/intel/ivsc/mei_csi.c        |   4 +-
 drivers/media/platform/atmel/atmel-isi.c      |   2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |   2 +-
 drivers/media/platform/cadence/cdns-csi2tx.c  |   3 +-
 drivers/media/platform/intel/pxa_camera.c     |   2 +-
 .../platform/microchip/microchip-csi2dc.c     |   5 +-
 .../microchip/microchip-sama5d2-isc.c         |   2 +-
 .../microchip/microchip-sama7g5-isc.c         |   2 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |   2 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |   2 +-
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
 drivers/media/v4l2-core/v4l2-fwnode.c         | 126 +++++++++---------
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |   2 +-
 .../deprecated/atmel/atmel-sama5d2-isc.c      |   2 +-
 .../deprecated/atmel/atmel-sama7g5-isc.c      |   2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |   2 +-
 drivers/staging/media/max96712/max96712.c     |   2 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   2 +-
 drivers/staging/media/tegra-video/csi.c       |   2 +-
 drivers/staging/media/tegra-video/vi.c        |   2 +-
 drivers/staging/media/tegra-video/vip.c       |   2 +-
 include/media/v4l2-fwnode.h                   |  12 +-
 100 files changed, 207 insertions(+), 170 deletions(-)


base-commit: 48533e9034e3350043655258ec443d79be84255a
-- 
Regards,

Laurent Pinchart

