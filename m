Return-Path: <linux-media+bounces-479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F97EEFD3
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 11:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CAA41C20AB2
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 10:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF6E18C28;
	Fri, 17 Nov 2023 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByUjL8YW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB60A6
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 02:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700215942; x=1731751942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3i2yezoBt2Z3eL9Qn+8QYw/IsVDC91oawRN5O8WhYyw=;
  b=ByUjL8YWCE7vE4tnrqfXSG88dS7m4rvmWorSmADYiWv5RGrbpnjLj6Ay
   AMQ0n04FUXIRqobF3zkcCJQrYDZVI/9vnXY5AgbvY6uE8wVhSYhtFP4rH
   SH8pOvUARJSU6JfhYtTrJIjJYwIzv3/Gk8MSlpVuGJ4UCeyXg1SFfmw2u
   0Gm9k+xoU3CpDn/8dGXQe6BQt8ozqPEUHWY86gIo1M+SgzYKxCEPzKz0m
   NsC3RRMsf3e/z2oFCedvYqrJpm4cWu92sXY5KtcGxBYlzYRuk8DuXOy91
   xSuPCgf1xJpyfawzBFBoAEbCISLyyNZn6uuMTEUp/q/IJismiSBvSgAUb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457771934"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="457771934"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715494805"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="715494805"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:17 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5017B120E08;
	Fri, 17 Nov 2023 12:12:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1r3vpG-005c9m-0G;
	Fri, 17 Nov 2023 12:11:50 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 0/9] Unify sub-device state access functions
Date: Fri, 17 Nov 2023 12:11:30 +0200
Message-Id: <20231117101140.1338288-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

since v9:

- Rebase on Starfive ISP driver patches.

- Fix kerneldoc issues in sub-device state access functions.

since v7:

- Include one more patch, to move the sub-device state access functions
  out a section conditional to sub-device UAPI. The patch has been rebased
  before the driver changes.

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

Sakari Ailus (9):
  media: v4l: subdev: Store the sub-device in the sub-device state
  media: v4l: subdev: Also return pads array information on stream
    functions
  media: v4l: subdev: Rename sub-device state information access
    functions
  media: v4l: subdev: v4l2_subdev_state_get_format always returns format
    now
  media: v4l: subdev: Make stream argument optional in state access
    functions
  media: v4l: subdev: Always compile sub-device state access functions
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
 drivers/media/i2c/ccs/ccs-core.c              |  22 +-
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
 drivers/media/i2c/imx296.c                    |  18 +-
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
 drivers/media/i2c/mt9m114.c                   |  58 ++---
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
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  37 ++--
 drivers/media/i2c/s5k5baf.c                   |  35 ++-
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
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  18 +-
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
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 103 ++++-----
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  53 ++---
 .../samsung/exynos4-is/fimc-capture.c         |  12 +-
 .../platform/samsung/exynos4-is/fimc-isp.c    |  24 +--
 .../platform/samsung/exynos4-is/fimc-lite.c   |  16 +-
 .../platform/samsung/exynos4-is/mipi-csis.c   |   3 +-
 .../samsung/s3c-camif/camif-capture.c         |   8 +-
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |   8 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   8 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   8 +-
 .../sun8i_a83t_mipi_csi2.c                    |   8 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  18 +-
 drivers/media/platform/ti/cal/cal-video.c     |   2 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c  |   7 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c  |   3 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |   3 +-
 .../media/platform/ti/omap3isp/isppreview.c   |   6 +-
 .../media/platform/ti/omap3isp/ispresizer.c   |   5 +-
 drivers/media/platform/video-mux.c            |  18 +-
 .../media/platform/xilinx/xilinx-csi2rxss.c   |   5 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |   9 +-
 drivers/media/platform/xilinx/xilinx-vip.c    |   4 +-
 .../media/test-drivers/vimc/vimc-debayer.c    |  10 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c |   9 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c |   6 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 181 +++++++++-------
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
 .../staging/media/starfive/camss/stf-isp.c    |  25 ++-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   8 +-
 drivers/staging/media/tegra-video/vi.c        |   2 +-
 include/media/v4l2-subdev.h                   | 204 +++++++-----------
 159 files changed, 802 insertions(+), 909 deletions(-)

-- 
2.39.2


