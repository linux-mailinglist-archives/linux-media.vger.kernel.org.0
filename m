Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9919B7E46F5
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 18:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbjKGR3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 12:29:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjKGR3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 12:29:11 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EC7C0
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 09:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699378149; x=1730914149;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S5HAJF+LbmJFS5+YCgUJ96MGnqYkQiFCpNstrP61SZk=;
  b=O3/1zL3cjwIUYUeBC2ck1+nWc9yQbMkGPdsYx3kCXKp3n0hMYu9LDKDw
   uVSE1qNDJKgJjOkCxPdr7Ht3rV+KoXVXMZxAtw+6ZIu17Vf9QlgAc6JId
   eDYTfj82mQBIsfcbVAPJ7E0VK4fF/geFLWenlQTo2fTKNLSmlh8vxA1j+
   hwQvJMcAI1IhwtSR2KZwWErR4Zt2Qn1TBn9fCRogoxCQLzK3UXbZebXSd
   k3KszHM4q1LuYpohZC4IfkKDypGRSFOPecM9JBtm6uFfTbVpc9Gj2DKTB
   P5j4o5qUsVZg6wj/cNsA6RKH/kGi0IsltpeMv+iTE2ciGwWqKciUakxFP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="389368868"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="389368868"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 09:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="853441079"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="853441079"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 09:29:05 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 402AF1202A6;
        Tue,  7 Nov 2023 19:29:02 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 0/8] Unify sub-device state access functions
Date:   Tue,  7 Nov 2023 19:28:53 +0200
Message-Id: <20231107172901.1302019-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

This set unifies historical and stream-aware sub-device state access
functions into one set of functions called
v4l2_subdev_state_get_{format,crop,compose}. No functional change is
intended.

This happened after Tomi suggested adding a num_pads field to struct
v4l2_subdev_state.

I'd like to merge these somewhat soon, assuming there's a rough consensus
on them, as this is a fairly hot set, touching 136 files.

Note: the big Coccinelle-generated patch likely won't make it to the list.
You can find it here:
<URL:https://pilvi.retiisi.eu/s/j3LjF7FmGAmadDL/download/v4-0006-media-v4l-subdev-Switch-to-stream-aware-state-fun.patch>.

since v6:

- More driver changes missing in v6.

since v5:

- Fix Coccinelle-added space (not tab) indenting in the big patch.

since v4:

- Rework macros for two/three argument state information access functions.
  There's now a common function for generating the name while renames have
  been done according to the discussion on the list.

- Don't warn about incorrect pad or stream being set for pad information
  access functions (dropped the last patch). The pad index is nowadays
  validated by the caller and so resulting NULL is now a driver bug, in
  other words we no longer need to prepare for driver not validating the
  field (as this is now done by the framework).

- There are no changes to the big patch i.e. it's the same as in v4.

since v3:

- Drop the patch asserting state mutex acquisition for stream-unaware
  drivers.

- Add a patch to warn about non-zero stream when access per-pad state
  information.

- Added a comment on why pad 0 information was returned on invalid pad.

- Add a patch to return NULL from per-pad state information access
  functions if pad is invalid. (The added comment is removed by this patch
  as well.)

- Use only __VA_ARGS__ to implement variable number of arguments for
  subdev state information access functions. This should now work for all
  supported GCC versions. Add a comment to explain the macro.

- Rename the subdev state information access functions to include "state"
  again, i.e. v4l2_subdev_state_get_{format,crop,compose}.

- Try to avoid confusing git am by adding '> ' prefix for the manually
  created diff.

since v2:

- Add back a missing patch (adding sub-device pointer to the state).

- Address unused variable warnings in a few sensor drivers.

- Address kernel-doc build warnings (see lkp bot mail to v2).

- Add a patch to assert holding the state lock also for stream-unaware
  users.

- Elaborate manual changes in the commit message of the big
  Coccinelle-generated patch.

since v1:

- Fix missing changes in ds90ub913, TI CAL and IMX drivers.

- Rename state access functions as v4l2_subdev_state_get_*(), i.e. added
  "state_" to the function names.

- Instead of requiring stream-unaware users to specify the stream value,
  provide a wrapper macro to produce that, using variadic args.

- Put struct v4l2_subdev pointer to sub-device state (instead of num_pads
  integer field).

Sakari Ailus (8):
  media: v4l: subdev: Store the sub-device in the sub-device state
  media: v4l: subdev: Also return pads array information on stream
    functions
  media: v4l: subdev: Rename sub-device state information access
    functions
  media: v4l: subdev: v4l2_subdev_state_get_format always returns format
    now
  media: v4l: subdev: Make stream argument optional in state access
    functions
  media: v4l: subdev: Switch to stream-aware state functions
  media: v4l: subdev: Remove stream-unaware sub-device state access
  media: v4l: subdev: Return NULL from pad access functions on error

 drivers/media/i2c/adv7180.c                   |   4 +-
 drivers/media/i2c/adv7183.c                   |   2 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |   6 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |   2 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c      |   6 +-
 drivers/media/i2c/adv7511-v4l2.c              |   4 +-
 drivers/media/i2c/adv7604.c                   |   4 +-
 drivers/media/i2c/adv7842.c                   |   4 +-
 drivers/media/i2c/ar0521.c                    |   5 +-
 drivers/media/i2c/ccs/ccs-core.c              |  22 +--
 drivers/media/i2c/ds90ub913.c                 |   3 +-
 drivers/media/i2c/ds90ub953.c                 |   3 +-
 drivers/media/i2c/ds90ub960.c                 |  12 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |   3 +-
 drivers/media/i2c/hi556.c                     |  13 +-
 drivers/media/i2c/hi846.c                     |  11 +-
 drivers/media/i2c/hi847.c                     |   9 +-
 drivers/media/i2c/imx208.c                    |   9 +-
 drivers/media/i2c/imx214.c                    |   4 +-
 drivers/media/i2c/imx219.c                    |  12 +-
 drivers/media/i2c/imx258.c                    |   9 +-
 drivers/media/i2c/imx274.c                    |  12 +-
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
 drivers/media/i2c/mt9m001.c                   |   6 +-
 drivers/media/i2c/mt9m111.c                   |   6 +-
 drivers/media/i2c/mt9m114.c                   |  58 +++----
 drivers/media/i2c/mt9p031.c                   |   6 +-
 drivers/media/i2c/mt9t112.c                   |   2 +-
 drivers/media/i2c/mt9v011.c                   |   2 +-
 drivers/media/i2c/mt9v032.c                   |  10 +-
 drivers/media/i2c/mt9v111.c                   |   4 +-
 drivers/media/i2c/og01a1b.c                   |  10 +-
 drivers/media/i2c/ov01a10.c                   |   2 +-
 drivers/media/i2c/ov02a10.c                   |   6 +-
 drivers/media/i2c/ov08d10.c                   |   9 +-
 drivers/media/i2c/ov08x40.c                   |   7 +-
 drivers/media/i2c/ov13858.c                   |  10 +-
 drivers/media/i2c/ov13b10.c                   |  10 +-
 drivers/media/i2c/ov2640.c                    |   6 +-
 drivers/media/i2c/ov2659.c                    |   6 +-
 drivers/media/i2c/ov2680.c                    |  10 +-
 drivers/media/i2c/ov2685.c                    |   4 +-
 drivers/media/i2c/ov2740.c                    |   4 +-
 drivers/media/i2c/ov4689.c                    |   2 +-
 drivers/media/i2c/ov5640.c                    |   9 +-
 drivers/media/i2c/ov5645.c                    |   4 +-
 drivers/media/i2c/ov5647.c                    |  12 +-
 drivers/media/i2c/ov5648.c                    |   6 +-
 drivers/media/i2c/ov5670.c                    |  13 +-
 drivers/media/i2c/ov5675.c                    |   9 +-
 drivers/media/i2c/ov5693.c                    |   4 +-
 drivers/media/i2c/ov5695.c                    |   8 +-
 drivers/media/i2c/ov6650.c                    |  12 +-
 drivers/media/i2c/ov7251.c                    |   4 +-
 drivers/media/i2c/ov7670.c                    |   7 +-
 drivers/media/i2c/ov772x.c                    |   2 +-
 drivers/media/i2c/ov7740.c                    |   7 +-
 drivers/media/i2c/ov8856.c                    |   9 +-
 drivers/media/i2c/ov8858.c                    |   6 +-
 drivers/media/i2c/ov8865.c                    |   8 +-
 drivers/media/i2c/ov9282.c                    |   6 +-
 drivers/media/i2c/ov9640.c                    |   2 +-
 drivers/media/i2c/ov9650.c                    |   7 +-
 drivers/media/i2c/ov9734.c                    |   9 +-
 drivers/media/i2c/rj54n1cb0c.c                |   2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  37 +++--
 drivers/media/i2c/s5k5baf.c                   |  35 ++---
 drivers/media/i2c/s5k6a3.c                    |   8 +-
 drivers/media/i2c/saa6752hs.c                 |   2 +-
 drivers/media/i2c/st-mipid02.c                |  11 +-
 drivers/media/i2c/st-vgxy61.c                 |   5 +-
 drivers/media/i2c/tc358746.c                  |  12 +-
 drivers/media/i2c/tda1997x.c                  |   6 +-
 drivers/media/i2c/tvp5150.c                   |   2 +-
 drivers/media/i2c/tw9910.c                    |   2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  10 +-
 drivers/media/pci/intel/ivsc/mei_csi.c        |   4 +-
 drivers/media/platform/atmel/atmel-isi.c      |   2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |   4 +-
 drivers/media/platform/cadence/cdns-csi2tx.c  |   3 +-
 .../platform/microchip/microchip-csi2dc.c     |  15 +-
 .../platform/microchip/microchip-isc-base.c   |   2 +-
 .../platform/microchip/microchip-isc-scaler.c |  16 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |  10 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |  16 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  10 +-
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  18 +--
 .../platform/nxp/imx8-isi/imx8-isi-video.c    |   2 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  13 +-
 .../media/platform/qcom/camss/camss-csid.c    |   3 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   3 +-
 .../media/platform/qcom/camss/camss-ispif.c   |   3 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  10 +-
 drivers/media/platform/renesas/rcar-isp.c     |   4 +-
 .../platform/renesas/rcar-vin/rcar-csi2.c     |   4 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   6 +-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |   6 +-
 .../media/platform/renesas/vsp1/vsp1_brx.c    |   2 +-
 .../media/platform/renesas/vsp1/vsp1_entity.c |   8 +-
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |   3 +-
 .../platform/rockchip/rkisp1/rkisp1-csi.c     |  16 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 103 ++++++-------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  53 +++----
 .../samsung/exynos4-is/fimc-capture.c         |  12 +-
 .../platform/samsung/exynos4-is/fimc-isp.c    |  24 ++-
 .../platform/samsung/exynos4-is/fimc-lite.c   |  16 +-
 .../platform/samsung/exynos4-is/mipi-csis.c   |   3 +-
 .../samsung/s3c-camif/camif-capture.c         |   8 +-
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |   8 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   8 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   8 +-
 .../sun8i_a83t_mipi_csi2.c                    |   8 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  18 +--
 drivers/media/platform/ti/cal/cal-video.c     |   2 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c  |   7 +-
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
 drivers/media/v4l2-core/v4l2-subdev.c         |  73 ++++++---
 .../media/atomisp/i2c/atomisp-gc0310.c        |   2 +-
 .../media/atomisp/i2c/atomisp-gc2235.c        |   2 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       |   2 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |   2 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |   3 +-
 .../media/atomisp/pci/atomisp_subdev.c        |   6 +-
 .../staging/media/atomisp/pci/atomisp_tpg.c   |   2 +-
 .../media/deprecated/atmel/atmel-isc-base.c   |   2 +-
 drivers/staging/media/imx/imx-ic-prp.c        |   4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   4 +-
 drivers/staging/media/imx/imx-media-csi.c     |   8 +-
 drivers/staging/media/imx/imx-media-utils.c   |   2 +-
 drivers/staging/media/imx/imx-media-vdic.c    |   2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |   2 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |  14 +-
 drivers/staging/media/omap4iss/iss_csi2.c     |   3 +-
 drivers/staging/media/omap4iss/iss_ipipe.c    |   3 +-
 drivers/staging/media/omap4iss/iss_ipipeif.c  |   3 +-
 drivers/staging/media/omap4iss/iss_resizer.c  |   3 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   8 +-
 drivers/staging/media/tegra-video/vi.c        |   2 +-
 include/media/v4l2-subdev.h                   | 141 ++++++------------
 158 files changed, 703 insertions(+), 812 deletions(-)


base-commit: f1e65d6e782f90793a1ca819a3786087353aad77
-- 
2.39.2

