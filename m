Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC7137C8387
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 12:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjJMKox (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 06:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbjJMKok (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 06:44:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3862D129
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 03:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697193871; x=1728729871;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=02f2Gg4jINzCSEwjhfvTu2QK92+716tMpZrF3G2XsH4=;
  b=cExfcK677IKVwVB7hvBNXDSqX4RC+5iSygblyYVrfWLWkHNDSMu2/a64
   60+And/TmM4zNlDvNrd2EyfjRSRlrWgoXkmmOAWgKHz3oxgDfwU014jtP
   j1U/plcVcC4CXsGOSAv+XjZ74FG3vLAcFBg7kxXbQX9RJ6WKWmx0aze4L
   9QsikV7LH3gQvFyJoREv7kfvq6syIJJ4hj8jYtLYM33+FFOuYEw+nWoMK
   PjVnetiuuj/qfprTzy798qPtR8jHGnx/7Hb+PLu4bqTcce+RyBf0DkMT1
   nupNO80HQHSfVKxThLpuj7JezBMumNsr4S2uT3ybU5UP3UT3nbXx3AdYQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388004007"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="388004007"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="825016430"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="825016430"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:44:28 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AB000120A2E;
        Fri, 13 Oct 2023 13:44:24 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [PATCH 0/6] Unify sub-device state access functions
Date:   Fri, 13 Oct 2023 13:44:18 +0300
Message-Id: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This set unifies historical and stream-aware sub-device state access
functions into one set of functions called
v4l2_subdev_get_{format,crop,compose}. No functional change is intended.

This happened after Tomi suggested adding a num_pads field to struct
v4l2_subdev_state.

I'd like to merge these somewhat soon, assuming there's a rough consensus
on them, as this is a fairly hot set, touching 136 files.

Sakari Ailus (6):
  media: v4l: subdev: Store the number of pads in sub-device state
  media: v4l: subdev: Also return pads array information on stream
    functions
  media: v4l: subdev: Rename sub-device state information access
    functions
  media: v4l: subdev: v4l2_subdev_get_format always returns format now
  media: v4l: subdev: Switch to stream-aware state functions
  media: v4l: subdev: Remove stream-unaware sub-device state access

 drivers/media/i2c/adv7180.c                   |   4 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |   6 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |   2 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c      |   6 +-
 drivers/media/i2c/adv7511-v4l2.c              |   4 +-
 drivers/media/i2c/adv7604.c                   |   4 +-
 drivers/media/i2c/adv7842.c                   |   4 +-
 drivers/media/i2c/ar0521.c                    |   5 +-
 drivers/media/i2c/ccs/ccs-core.c              |  21 ++--
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |   3 +-
 drivers/media/i2c/hi556.c                     |  12 +-
 drivers/media/i2c/hi846.c                     |  11 +-
 drivers/media/i2c/hi847.c                     |   8 +-
 drivers/media/i2c/imx208.c                    |   8 +-
 drivers/media/i2c/imx214.c                    |   4 +-
 drivers/media/i2c/imx219.c                    |  12 +-
 drivers/media/i2c/imx258.c                    |   8 +-
 drivers/media/i2c/imx290.c                    |   8 +-
 drivers/media/i2c/imx296.c                    |  18 +--
 drivers/media/i2c/imx319.c                    |   7 +-
 drivers/media/i2c/imx334.c                    |   4 +-
 drivers/media/i2c/imx335.c                    |   4 +-
 drivers/media/i2c/imx355.c                    |   7 +-
 drivers/media/i2c/imx412.c                    |   4 +-
 drivers/media/i2c/imx415.c                    |   6 +-
 drivers/media/i2c/isl7998x.c                  |   6 +-
 drivers/media/i2c/max9286.c                   |   4 +-
 drivers/media/i2c/mt9m001.c                   |   4 +-
 drivers/media/i2c/mt9m111.c                   |   4 +-
 drivers/media/i2c/mt9m114.c                   |  58 +++++-----
 drivers/media/i2c/mt9p031.c                   |   6 +-
 drivers/media/i2c/mt9v032.c                   |  10 +-
 drivers/media/i2c/mt9v111.c                   |   2 +-
 drivers/media/i2c/og01a1b.c                   |   9 +-
 drivers/media/i2c/ov01a10.c                   |   2 +-
 drivers/media/i2c/ov02a10.c                   |   5 +-
 drivers/media/i2c/ov08d10.c                   |   8 +-
 drivers/media/i2c/ov08x40.c                   |   7 +-
 drivers/media/i2c/ov13858.c                   |  10 +-
 drivers/media/i2c/ov13b10.c                   |  10 +-
 drivers/media/i2c/ov2640.c                    |   4 +-
 drivers/media/i2c/ov2659.c                    |   6 +-
 drivers/media/i2c/ov2680.c                    |   6 +-
 drivers/media/i2c/ov2685.c                    |   4 +-
 drivers/media/i2c/ov2740.c                    |   4 +-
 drivers/media/i2c/ov4689.c                    |   2 +-
 drivers/media/i2c/ov5640.c                    |   9 +-
 drivers/media/i2c/ov5645.c                    |   4 +-
 drivers/media/i2c/ov5647.c                    |  12 +-
 drivers/media/i2c/ov5648.c                    |   6 +-
 drivers/media/i2c/ov5670.c                    |  12 +-
 drivers/media/i2c/ov5675.c                    |   8 +-
 drivers/media/i2c/ov5693.c                    |   4 +-
 drivers/media/i2c/ov5695.c                    |   7 +-
 drivers/media/i2c/ov7251.c                    |   4 +-
 drivers/media/i2c/ov7670.c                    |   7 +-
 drivers/media/i2c/ov7740.c                    |   7 +-
 drivers/media/i2c/ov8856.c                    |   8 +-
 drivers/media/i2c/ov8858.c                    |   6 +-
 drivers/media/i2c/ov8865.c                    |   8 +-
 drivers/media/i2c/ov9282.c                    |   6 +-
 drivers/media/i2c/ov9650.c                    |   7 +-
 drivers/media/i2c/ov9734.c                    |   8 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  35 +++---
 drivers/media/i2c/s5k5baf.c                   |  30 +++--
 drivers/media/i2c/s5k6a3.c                    |   8 +-
 drivers/media/i2c/st-mipid02.c                |  11 +-
 drivers/media/i2c/st-vgxy61.c                 |   5 +-
 drivers/media/i2c/tc358746.c                  |  12 +-
 drivers/media/i2c/tda1997x.c                  |   6 +-
 drivers/media/i2c/tvp5150.c                   |   2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |   9 +-
 drivers/media/pci/intel/ivsc/mei_csi.c        |   4 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |   4 +-
 drivers/media/platform/cadence/cdns-csi2tx.c  |   3 +-
 .../platform/microchip/microchip-csi2dc.c     |  15 ++-
 .../platform/microchip/microchip-isc-scaler.c |  17 +--
 drivers/media/platform/nxp/imx-mipi-csis.c    |  10 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |  15 ++-
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  18 +--
 .../platform/nxp/imx8-isi/imx8-isi-video.c    |   2 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  12 +-
 .../media/platform/qcom/camss/camss-csid.c    |   3 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   3 +-
 .../media/platform/qcom/camss/camss-ispif.c   |   3 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   9 +-
 drivers/media/platform/renesas/rcar-isp.c     |   4 +-
 .../platform/renesas/rcar-vin/rcar-csi2.c     |   4 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   6 +-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |   6 +-
 .../media/platform/renesas/vsp1/vsp1_brx.c    |   2 +-
 .../media/platform/renesas/vsp1/vsp1_entity.c |   8 +-
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |   3 +-
 .../platform/rockchip/rkisp1/rkisp1-csi.c     |  16 ++-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 103 ++++++++---------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  53 ++++-----
 .../samsung/exynos4-is/fimc-capture.c         |  12 +-
 .../platform/samsung/exynos4-is/fimc-isp.c    |  23 ++--
 .../platform/samsung/exynos4-is/fimc-lite.c   |  17 ++-
 .../platform/samsung/exynos4-is/mipi-csis.c   |   3 +-
 .../samsung/s3c-camif/camif-capture.c         |   8 +-
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |   8 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   7 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   7 +-
 .../sun8i_a83t_mipi_csi2.c                    |   7 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  13 +--
 drivers/media/platform/ti/cal/cal-video.c     |   2 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c  |   6 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c  |   3 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |   3 +-
 .../media/platform/ti/omap3isp/isppreview.c   |   6 +-
 .../media/platform/ti/omap3isp/ispresizer.c   |   5 +-
 drivers/media/platform/video-mux.c            |  18 +--
 .../media/platform/xilinx/xilinx-csi2rxss.c   |   5 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |   9 +-
 drivers/media/platform/xilinx/xilinx-vip.c    |   4 +-
 .../media/test-drivers/vimc/vimc-debayer.c    |  10 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c |   9 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c |   6 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  73 ++++++++----
 .../media/atomisp/i2c/atomisp-gc0310.c        |   2 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |   3 +-
 .../media/atomisp/pci/atomisp_subdev.c        |   6 +-
 drivers/staging/media/imx/imx-ic-prp.c        |   2 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   2 +-
 drivers/staging/media/imx/imx-media-csi.c     |   8 +-
 drivers/staging/media/imx/imx-media-utils.c   |   2 +-
 drivers/staging/media/imx/imx-media-vdic.c    |   2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |   2 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |  14 +--
 drivers/staging/media/omap4iss/iss_csi2.c     |   3 +-
 drivers/staging/media/omap4iss/iss_ipipe.c    |   3 +-
 drivers/staging/media/omap4iss/iss_ipipeif.c  |   3 +-
 drivers/staging/media/omap4iss/iss_resizer.c  |   3 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   7 +-
 include/media/v4l2-subdev.h                   | 107 +++---------------
 136 files changed, 597 insertions(+), 751 deletions(-)

-- 
2.39.2

