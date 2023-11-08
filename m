Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47FC17E5265
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 10:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235402AbjKHJJA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 04:09:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235217AbjKHJI7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 04:08:59 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FF110A
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 01:08:57 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4SQK5L1CVLzySP
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 11:08:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1699434534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=W+lOyN4yqYJwwSx2mWWof0szkiP+tPk5vj2qFh0tfN0=;
        b=l1t2PiB4Xd4pZrKMLI8fyw5cBJalhwmgNn0WGcH33JOeDqAFwySPrB/O+sAn0PVSVNAgtf
        W/sBIkOJV6VlcEf02G68bzy9AeUSLE/HEaRVBgim8zXkmTEB+fEzVrGY7LFQb3hWDHzbic
        oVxzjVWX25hdZcDx1AhntsUnIT+iTrI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1699434534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=W+lOyN4yqYJwwSx2mWWof0szkiP+tPk5vj2qFh0tfN0=;
        b=LJ/hiSW2md2VXTphWpuasg7ZOzyJ5CCkz31N4fOkAz4PtdWL4IkNztmNrCatGSeN2HTdMi
        l8zQtv28dQbc+QdZLLFx9kTqzgy9clUhoZj1rxqQHZcOuvXcX7GBjzw1FNlskLfe3QTgGC
        y70I5DMbKEdzRFTlUbw3/QqRCfftF+U=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1699434534; a=rsa-sha256; cv=none;
        b=k0UsABRn8o5ZPdkMfS+erLFeLeWhjRf+1G48+2Y8EKNVnKny6iGmaDO0F4dyYQmyJueZ2n
        Vi8QzfVhHn6LBwjEjD5fCMg45qRcsHBaYRRDethR+5TVO66BSF9OIPfOvZr9Wpy/J6K0bU
        uXGkFg753L4hr0vo3YYrI7d90+cPfj8=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E67C2634C93
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 11:08:51 +0200 (EET)
Date:   Wed, 8 Nov 2023 09:08:51 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2 FOR 6.8] V4L2 subdev patches
Message-ID: <ZUtQI7xITXSJGhy3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Hans,

Here's a bunch of patches from myself and Laurent, cleaning up V4L2
sub-device state information access API, drivers using it plus fixing IVSC
driver firmware parsing and IMX319 driver. A few CCS driver fixes and
documentation improvement are included, too.

Please pull.

since v1:

- Fix IVSC driver patch error handling.


The following changes since commit 3e238417254bfdcc23fe207780b59cbb08656762:

  media: nuvoton: VIDEO_NPCM_VCD_ECE should depend on ARCH_NPCM (2023-10-27 11:44:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.8-1.1-signed

for you to fetch changes up to 62bdf633090d684c3ac6d3b46e926c0ac8cef466:

  media: v4l: subdev: Return NULL from pad access functions on error (2023-11-08 11:06:40 +0200)

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

Sakari Ailus (18):
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
 drivers/media/i2c/ccs/ccs-core.c                   |  44 ++++--
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
 drivers/media/i2c/imx296.c                         |  18 +--
 drivers/media/i2c/imx319.c                         |  19 +--
 drivers/media/i2c/imx334.c                         |  12 +-
 drivers/media/i2c/imx335.c                         |  12 +-
 drivers/media/i2c/imx355.c                         |   7 +-
 drivers/media/i2c/imx412.c                         |  12 +-
 drivers/media/i2c/imx415.c                         |   6 +-
 drivers/media/i2c/isl7998x.c                       |   6 +-
 drivers/media/i2c/max9286.c                        |   4 +-
 drivers/media/i2c/mt9m001.c                        |   6 +-
 drivers/media/i2c/mt9m111.c                        |   6 +-
 drivers/media/i2c/mt9m114.c                        |  58 ++++----
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
 drivers/media/i2c/ov6650.c                         |  34 +++--
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
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |  37 +++--
 drivers/media/i2c/s5k5baf.c                        |  35 ++---
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
 drivers/media/pci/intel/ivsc/mei_csi.c             |  73 ++++++----
 drivers/media/platform/atmel/atmel-isi.c           |  12 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |   4 +-
 drivers/media/platform/cadence/cdns-csi2tx.c       |   3 +-
 .../media/platform/microchip/microchip-csi2dc.c    |  15 +-
 .../media/platform/microchip/microchip-isc-base.c  |  10 +-
 .../platform/microchip/microchip-isc-scaler.c      |  16 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |  10 +-
 drivers/media/platform/nxp/imx7-media-csi.c        |  16 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  10 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  18 +--
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |   2 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |  13 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |  15 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  15 +-
 drivers/media/platform/qcom/camss/camss-ispif.c    |  15 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  34 ++---
 drivers/media/platform/renesas/rcar-isp.c          |   4 +-
 .../media/platform/renesas/rcar-vin/rcar-csi2.c    |   4 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |   6 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |   6 +-
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |   2 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |   8 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |   3 +-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |  16 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 103 ++++++-------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |  53 +++----
 .../platform/samsung/exynos4-is/fimc-capture.c     |  12 +-
 .../media/platform/samsung/exynos4-is/fimc-isp.c   |  24 ++-
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |  16 +-
 .../media/platform/samsung/exynos4-is/mipi-csis.c  |   3 +-
 .../platform/samsung/s3c-camif/camif-capture.c     |   8 +-
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |   8 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c    |   8 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |   8 +-
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |   8 +-
 drivers/media/platform/ti/cal/cal-camerarx.c       |  18 +--
 drivers/media/platform/ti/cal/cal-video.c          |   2 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c       |  19 ++-
 drivers/media/platform/ti/omap3isp/ispccp2.c       |  13 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c       |   9 +-
 drivers/media/platform/ti/omap3isp/isppreview.c    |  18 +--
 drivers/media/platform/ti/omap3isp/ispresizer.c    |  21 ++-
 drivers/media/platform/video-mux.c                 |  18 +--
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    |  64 +-------
 drivers/media/platform/xilinx/xilinx-tpg.c         |   9 +-
 drivers/media/platform/xilinx/xilinx-vip.c         |   4 +-
 drivers/media/test-drivers/vimc/vimc-debayer.c     |  10 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c      |   9 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c      |   6 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  73 +++++++---
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
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c |   8 +-
 drivers/staging/media/tegra-video/vi.c             |  14 +-
 include/media/v4l2-subdev.h                        | 162 +++++++--------------
 include/uapi/linux/v4l2-subdev.h                   |   2 +-
 163 files changed, 921 insertions(+), 1052 deletions(-)

-- 
Sakari Ailus
