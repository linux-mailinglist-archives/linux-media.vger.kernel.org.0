Return-Path: <linux-media+bounces-485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 306307EEFDF
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 11:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA38A28129C
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 10:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16B8179A9;
	Fri, 17 Nov 2023 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="td8X2hpt"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8E7CE
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 02:13:34 -0800 (PST)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4SWt5k0TcPzyT5
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 12:13:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1700216010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=k2EjIglW2pdrDAcRvM29wRt8pHRuq3J+4dVf6xGflaU=;
	b=td8X2hptBnWkVr72g3yrPvtysc1CJCagD7YR8w2f0kqvE2CE+tDM6rPx+RRUmep/KOcTxM
	p1rlcBJKip3TEMHU8k6TkTNoUzu6gAjLZf6+PRyixIcJGXWiFv0P0/n5QVWVy9ZX6G6Ao6
	DJtqEZnIs6/PYJ5+9t8BM4NPQ1L2WD0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1700216010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=k2EjIglW2pdrDAcRvM29wRt8pHRuq3J+4dVf6xGflaU=;
	b=nL639qK26D2NMJgig4HdHgCR7WEQf0u620lmbmqluCbO3xR6T3NGKiLmKGM0SK89Y+vstD
	tjJdemo8ZNuTSMH9hw2EwyuNAR3iTzCDpwGwWeP/FaYb6rbyrHG2tXF9c+c9hCjbW6TxsU
	LABTJ8IKSQoKt1qUk/DeuYWtGehQigw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1700216010; a=rsa-sha256; cv=none;
	b=ye239rrfJu8MOpUX+S395SjPOKrGiJXz7SZ6mGaY0vb5vWrrEHtUpBMYsqQz6akhlwkHpW
	T5SAtgoFvIYPc2YQGYwO7zNFZt/1Wf62CtKjT7nZ1wj+USO5C3QtqKVKvMWvsuOBHYulBM
	79R1aqqtRc+TXD3QwbhIkHph7fHkaHk=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D22F7634C93
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 12:13:26 +0200 (EET)
Date: Fri, 17 Nov 2023 10:13:26 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL v4 FOR 6.8] V4L2 subdev patches
Message-ID: <ZVc8xsl5hSk3b8nI@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro, Hans,

Here's a bunch of patches from myself and Laurent, cleaning up V4L2
sub-device state information access API, drivers using it plus fixing IVSC
driver firmware parsing and IMX319 driver. A few CCS driver fixes and
documentation improvement are included, too.

Please pull.


since v3:

- Address kerneldoc issues in sub-device state information access macros.

- Rebase on Starfive ISP driver patches just merged.

since v2:

- Fix sub-device state access conditional compilation (was dependent on
  sub-device UAPI).

since v1:

- Fix IVSC driver patch error handling.

The following changes since commit 1865913dd590ca6d5e3207b15099a1210dd62f29:

  media: meson-ir-tx: Drop usage of platform_driver_probe() (2023-11-16 13:56:48 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.8-1.4-signed

for you to fetch changes up to 82b0e8c686450fd8864d36016931ef8a297991b7:

  media: v4l: subdev: Return NULL from pad access functions on error (2023-11-17 11:02:50 +0200)

----------------------------------------------------------------
V4L2 patches for 6.8

----------------------------------------------------------------
Laurent Pinchart (16):
      media: v4l2-subdev: Fix indentation in v4l2-subdev.h
      media: atmel-isi: Use accessors for pad config 'try_*' fields
      media: microchip-isc: Use accessors for pad config 'try_*' fields
      media: atmel-isc: Use accessors for pad config 'try_*' fields
      media: atomisp: Use accessors for pad config 'try_*' fields
      media: tegra-video: Use accessors for pad config 'try_*' fields
      media: i2c: Use accessors for pad config 'try_*' fields
      media: v4l2-subdev: Rename pad config 'try_*' fields
      media: v4l2-subdev: Drop outdated comment for v4l2_subdev_pad_config
      media: ipu3-cio2: Drop comment blocks for subdev op handlers
      media: xilinx: csi2rxss: Drop comment blocks for subdev op handlers
      media: v4l2-subdev: Fix references to pad config
      media: qcom: camss: Fix references to pad config
      media: ti: omap3isp: Fix references to pad config
      media: ti: omap4iss: Fix references to pad config
      media: i2c: Fix references to pad config

Sakari Ailus (19):
      media: ccs: Ensure control handlers have been set up after probe
      media: ivsc: csi: Don't parse remote endpoints
      media: ivsc: csi: Clean up V4L2 async notifier on error
      media: ivsc: csi: Clean up notifier set-up
      media: ivsc: csi: Clean up parsing firmware and setting up async notifier
      media: ivsc: csi: Don't mask v4l2_fwnode_endpoint_parse return value
      media: ivsc: csi: Check number of lanes on source, too
      media: ccs: Print ireal and float limits converted to integers
      media: imx319: Enable runtime PM before registering async sub-device
      media: Documentation: Initialisation finishes before subdev registration
      media: v4l: subdev: Store the sub-device in the sub-device state
      media: v4l: subdev: Also return pads array information on stream functions
      media: v4l: subdev: Rename sub-device state information access functions
      media: v4l: subdev: v4l2_subdev_state_get_format always returns format now
      media: v4l: subdev: Make stream argument optional in state access functions
      media: v4l: subdev: Always compile sub-device state access functions
      media: v4l: subdev: Switch to stream-aware state functions
      media: v4l: subdev: Remove stream-unaware sub-device state access
      media: v4l: subdev: Return NULL from pad access functions on error

 Documentation/driver-api/media/camera-sensor.rst   |   3 +-
 Documentation/driver-api/media/v4l2-subdev.rst     |  11 +-
 drivers/media/i2c/adv7180.c                        |   4 +-
 drivers/media/i2c/adv7183.c                        |   2 +-
 drivers/media/i2c/adv748x/adv748x-afe.c            |   6 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c           |   2 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c           |   6 +-
 drivers/media/i2c/adv7511-v4l2.c                   |   4 +-
 drivers/media/i2c/adv7604.c                        |   4 +-
 drivers/media/i2c/adv7842.c                        |   4 +-
 drivers/media/i2c/ar0521.c                         |   5 +-
 drivers/media/i2c/ccs/ccs-core.c                   |  44 ++--
 drivers/media/i2c/ccs/ccs.h                        |   1 +
 drivers/media/i2c/ds90ub913.c                      |   3 +-
 drivers/media/i2c/ds90ub953.c                      |   3 +-
 drivers/media/i2c/ds90ub960.c                      |  12 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |   3 +-
 drivers/media/i2c/hi556.c                          |  13 +-
 drivers/media/i2c/hi846.c                          |  11 +-
 drivers/media/i2c/hi847.c                          |   9 +-
 drivers/media/i2c/imx208.c                         |   9 +-
 drivers/media/i2c/imx214.c                         |   4 +-
 drivers/media/i2c/imx219.c                         |  12 +-
 drivers/media/i2c/imx258.c                         |   9 +-
 drivers/media/i2c/imx274.c                         |  12 +-
 drivers/media/i2c/imx290.c                         |   8 +-
 drivers/media/i2c/imx296.c                         |  18 +-
 drivers/media/i2c/imx319.c                         |  19 +-
 drivers/media/i2c/imx334.c                         |  12 +-
 drivers/media/i2c/imx335.c                         |  12 +-
 drivers/media/i2c/imx355.c                         |   7 +-
 drivers/media/i2c/imx412.c                         |  12 +-
 drivers/media/i2c/imx415.c                         |   6 +-
 drivers/media/i2c/isl7998x.c                       |   6 +-
 drivers/media/i2c/max9286.c                        |   4 +-
 drivers/media/i2c/mt9m001.c                        |   6 +-
 drivers/media/i2c/mt9m111.c                        |   6 +-
 drivers/media/i2c/mt9m114.c                        |  58 +++---
 drivers/media/i2c/mt9p031.c                        |   6 +-
 drivers/media/i2c/mt9t112.c                        |   2 +-
 drivers/media/i2c/mt9v011.c                        |   2 +-
 drivers/media/i2c/mt9v032.c                        |  10 +-
 drivers/media/i2c/mt9v111.c                        |   4 +-
 drivers/media/i2c/og01a1b.c                        |  10 +-
 drivers/media/i2c/ov01a10.c                        |   2 +-
 drivers/media/i2c/ov02a10.c                        |   6 +-
 drivers/media/i2c/ov08d10.c                        |   9 +-
 drivers/media/i2c/ov08x40.c                        |   7 +-
 drivers/media/i2c/ov13858.c                        |  10 +-
 drivers/media/i2c/ov13b10.c                        |  10 +-
 drivers/media/i2c/ov2640.c                         |   6 +-
 drivers/media/i2c/ov2659.c                         |   6 +-
 drivers/media/i2c/ov2680.c                         |  10 +-
 drivers/media/i2c/ov2685.c                         |   4 +-
 drivers/media/i2c/ov2740.c                         |   4 +-
 drivers/media/i2c/ov4689.c                         |   2 +-
 drivers/media/i2c/ov5640.c                         |   9 +-
 drivers/media/i2c/ov5645.c                         |   4 +-
 drivers/media/i2c/ov5647.c                         |  12 +-
 drivers/media/i2c/ov5648.c                         |   6 +-
 drivers/media/i2c/ov5670.c                         |  13 +-
 drivers/media/i2c/ov5675.c                         |   9 +-
 drivers/media/i2c/ov5693.c                         |   4 +-
 drivers/media/i2c/ov5695.c                         |   8 +-
 drivers/media/i2c/ov6650.c                         |  34 ++--
 drivers/media/i2c/ov7251.c                         |   4 +-
 drivers/media/i2c/ov7670.c                         |   7 +-
 drivers/media/i2c/ov772x.c                         |   2 +-
 drivers/media/i2c/ov7740.c                         |   7 +-
 drivers/media/i2c/ov8856.c                         |   9 +-
 drivers/media/i2c/ov8858.c                         |   6 +-
 drivers/media/i2c/ov8865.c                         |   8 +-
 drivers/media/i2c/ov9282.c                         |  14 +-
 drivers/media/i2c/ov9640.c                         |   2 +-
 drivers/media/i2c/ov9650.c                         |   7 +-
 drivers/media/i2c/ov9734.c                         |   9 +-
 drivers/media/i2c/rj54n1cb0c.c                     |   2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |  37 ++--
 drivers/media/i2c/s5k5baf.c                        |  35 ++--
 drivers/media/i2c/s5k6a3.c                         |   8 +-
 drivers/media/i2c/saa6752hs.c                      |   2 +-
 drivers/media/i2c/st-mipid02.c                     |  11 +-
 drivers/media/i2c/st-vgxy61.c                      |   5 +-
 drivers/media/i2c/tc358746.c                       |  12 +-
 drivers/media/i2c/tda1997x.c                       |   6 +-
 drivers/media/i2c/tvp5150.c                        |   2 +-
 drivers/media/i2c/tvp7002.c                        |   6 +-
 drivers/media/i2c/tw9910.c                         |   2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  24 +--
 drivers/media/pci/intel/ivsc/mei_csi.c             |  73 ++++---
 drivers/media/platform/atmel/atmel-isi.c           |  12 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |   4 +-
 drivers/media/platform/cadence/cdns-csi2tx.c       |   3 +-
 .../media/platform/microchip/microchip-csi2dc.c    |  15 +-
 .../media/platform/microchip/microchip-isc-base.c  |  10 +-
 .../platform/microchip/microchip-isc-scaler.c      |  16 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |  10 +-
 drivers/media/platform/nxp/imx7-media-csi.c        |  16 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  10 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  18 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |   2 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |  13 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |  15 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  15 +-
 drivers/media/platform/qcom/camss/camss-ispif.c    |  15 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  34 ++--
 drivers/media/platform/renesas/rcar-isp.c          |   4 +-
 .../media/platform/renesas/rcar-vin/rcar-csi2.c    |   4 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |   6 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |   6 +-
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |   2 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |   8 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |   3 +-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |  16 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 103 +++++-----
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |  53 ++---
 .../platform/samsung/exynos4-is/fimc-capture.c     |  12 +-
 .../media/platform/samsung/exynos4-is/fimc-isp.c   |  24 +--
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |  16 +-
 .../media/platform/samsung/exynos4-is/mipi-csis.c  |   3 +-
 .../platform/samsung/s3c-camif/camif-capture.c     |   8 +-
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |   8 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c    |   8 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |   8 +-
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |   8 +-
 drivers/media/platform/ti/cal/cal-camerarx.c       |  18 +-
 drivers/media/platform/ti/cal/cal-video.c          |   2 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c       |  19 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c       |  13 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c       |   9 +-
 drivers/media/platform/ti/omap3isp/isppreview.c    |  18 +-
 drivers/media/platform/ti/omap3isp/ispresizer.c    |  21 +-
 drivers/media/platform/video-mux.c                 |  18 +-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    |  64 +-----
 drivers/media/platform/xilinx/xilinx-tpg.c         |   9 +-
 drivers/media/platform/xilinx/xilinx-vip.c         |   4 +-
 drivers/media/test-drivers/vimc/vimc-debayer.c     |  10 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c      |   9 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c      |   6 +-
 drivers/media/v4l2-core/v4l2-subdev.c              | 181 ++++++++++-------
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |   2 +-
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |   2 +-
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |   2 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |   2 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |   3 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |   6 +-
 drivers/staging/media/atomisp/pci/atomisp_tpg.c    |   2 +-
 .../media/deprecated/atmel/atmel-isc-base.c        |  10 +-
 drivers/staging/media/imx/imx-ic-prp.c             |   4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |   4 +-
 drivers/staging/media/imx/imx-media-csi.c          |   8 +-
 drivers/staging/media/imx/imx-media-utils.c        |   2 +-
 drivers/staging/media/imx/imx-media-vdic.c         |   2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   2 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |  14 +-
 drivers/staging/media/omap4iss/iss_csi2.c          |   9 +-
 drivers/staging/media/omap4iss/iss_ipipe.c         |  11 +-
 drivers/staging/media/omap4iss/iss_ipipeif.c       |  11 +-
 drivers/staging/media/omap4iss/iss_resizer.c       |  11 +-
 drivers/staging/media/starfive/camss/stf-isp.c     |  25 ++-
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c |   8 +-
 drivers/staging/media/tegra-video/vi.c             |  14 +-
 include/media/v4l2-subdev.h                        | 225 ++++++++-------------
 include/uapi/linux/v4l2-subdev.h                   |   2 +-
 164 files changed, 1020 insertions(+), 1149 deletions(-)

-- 
Sakari Ailus

