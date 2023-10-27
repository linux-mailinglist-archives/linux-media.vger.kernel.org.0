Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1647D946B
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345645AbjJ0J6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345452AbjJ0J6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:58:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30129191
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:58:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ECE274A;
        Fri, 27 Oct 2023 11:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698400714;
        bh=ppkHuK8YIDRMqTVmK5BM1GpIXZyozCm9UPT2jleUnWI=;
        h=From:To:Cc:Subject:Date:From;
        b=SC/gxWOPnDCKBA0gAbwJFf8DLVnfVMFLcoF7khC77Mmaej2OJNDcl2rjIfn0ZOSud
         Ucu4eExLGWB/BMZQBcfUfqDGnf8/aD1RrN7QxqVP+EwypzX7kktwVbFRZtI1m+J7LQ
         W09Za21sgKfnH/oNVOU8J6tx0umdRIBX6OBlB3qA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Benoit Parrot <bparrot@ti.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Dan Scally <djrscally@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Hans de Goede <hansg@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Martin Kepplinger <martink@posteo.de>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Michal Simek <michal.simek@amd.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Todor Tomov <todor.too@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Deng <yong.deng@magewell.com>,
        Yong Zhi <yong.zhi@intel.com>
Subject: [PATCH v1 0/9] media: v4l2-subdev: Make .init_cfg() an internal operation
Date:   Fri, 27 Oct 2023 12:58:44 +0300
Message-ID: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
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

This patch series addresses a historical issue in the V4L2 subdev
in-kernel API.

The subdev .init_cfg() pad operation used to initialize a
v4l2_subdev_pad_config structure. This was changed to initializing a
v4l2_subdev_state a while ago, but the operation wasn't renamed, and
stayed a pad operation. Not only is the name confusing for new
developers, it is also the only pad operation that doesn't operate on a
pad, leading to more confusion.

This series addresses those two issues by renaming the operation to
.init_cfg() and moving it to the subdev internal operations, in patch
9/9. Patches before that prepare for this change, by dropping or
fixing references to pad config in drivers.

The series is based on top of "[PATCH v2 0/9] media: v4l2-subdev: Rename
pad config 'try_*' fields" ([1]).

[1] https://lore.kernel.org/linux-media/20231027091649.10553-1-laurent.pinchart@ideasonboard.com

Laurent Pinchart (9):
  media: ipu3-cio2: Drop comment blocks for subdev op handlers
  media: xilinx: csi2rxss: Drop comment blocks for subdev op handlers
  media: v4l2-subdev: Fix references to pad config
  media: qcom: camss: Fix references to pad config
  media: renesas: vsp1: Fix references to pad config
  media: ti: omap3isp: Fix references to pad config
  media: ti: omap4iss: Fix references to pad config
  media: i2c: Fix references to pad config
  media: v4l2-subdev: Rename .init_cfg() operation to .init_state()

 .../driver-api/media/v4l2-subdev.rst          |   4 +-
 drivers/media/i2c/adv7180.c                   |  10 +-
 drivers/media/i2c/ccs/ccs-core.c              |   6 +-
 drivers/media/i2c/ds90ub913.c                 |  10 +-
 drivers/media/i2c/ds90ub953.c                 |  10 +-
 drivers/media/i2c/ds90ub960.c                 |  11 +-
 drivers/media/i2c/hi846.c                     |  10 +-
 drivers/media/i2c/imx214.c                    |  12 +-
 drivers/media/i2c/imx219.c                    |   9 +-
 drivers/media/i2c/imx290.c                    |  10 +-
 drivers/media/i2c/imx296.c                    |  10 +-
 drivers/media/i2c/imx334.c                    |  12 +-
 drivers/media/i2c/imx335.c                    |  12 +-
 drivers/media/i2c/imx412.c                    |  12 +-
 drivers/media/i2c/imx415.c                    |  10 +-
 drivers/media/i2c/mt9m001.c                   |  10 +-
 drivers/media/i2c/mt9m111.c                   |  10 +-
 drivers/media/i2c/mt9m114.c                   |  16 ++-
 drivers/media/i2c/mt9p031.c                   |   8 +-
 drivers/media/i2c/mt9v111.c                   |  10 +-
 drivers/media/i2c/ov01a10.c                   |  10 +-
 drivers/media/i2c/ov02a10.c                   |  10 +-
 drivers/media/i2c/ov2640.c                    |  10 +-
 drivers/media/i2c/ov2680.c                    |  10 +-
 drivers/media/i2c/ov2740.c                    |  10 +-
 drivers/media/i2c/ov5640.c                    |  10 +-
 drivers/media/i2c/ov5645.c                    |  12 +-
 drivers/media/i2c/ov5670.c                    |  10 +-
 drivers/media/i2c/ov7251.c                    |  12 +-
 drivers/media/i2c/ov8858.c                    |  10 +-
 drivers/media/i2c/ov9282.c                    |  12 +-
 drivers/media/i2c/st-vgxy61.c                 |  10 +-
 drivers/media/i2c/tc358746.c                  |  10 +-
 drivers/media/i2c/tda1997x.c                  |  10 +-
 drivers/media/i2c/tvp5150.c                   |   6 +-
 drivers/media/i2c/tvp7002.c                   |   6 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  14 --
 drivers/media/pci/intel/ivsc/mei_csi.c        |  10 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  10 +-
 .../platform/microchip/microchip-csi2dc.c     |  10 +-
 .../platform/microchip/microchip-isc-scaler.c |  10 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |  10 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |   6 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  10 +-
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  10 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  10 +-
 .../media/platform/qcom/camss/camss-csid.c    |  12 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |  12 +-
 .../media/platform/qcom/camss/camss-ispif.c   |  12 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  24 ++--
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  10 +-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  10 +-
 .../media/platform/renesas/vsp1/vsp1_brx.c    |  41 +++---
 .../media/platform/renesas/vsp1/vsp1_clu.c    |   1 -
 .../media/platform/renesas/vsp1/vsp1_entity.c | 128 +++++++++---------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  12 +-
 .../media/platform/renesas/vsp1/vsp1_histo.c  |  24 ++--
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  12 +-
 .../media/platform/renesas/vsp1/vsp1_lif.c    |   1 -
 .../media/platform/renesas/vsp1/vsp1_lut.c    |   1 -
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  38 +++---
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  37 +++--
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  40 +++---
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  25 ++--
 .../platform/rockchip/rkisp1/rkisp1-csi.c     |  10 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  10 +-
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  10 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |   1 +
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |   1 +
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |   9 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |  10 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  10 +-
 .../sun8i_a83t_mipi_csi2.c                    |  10 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  10 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c  |  12 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c  |  10 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |   6 +-
 .../media/platform/ti/omap3isp/isppreview.c   |  12 +-
 .../media/platform/ti/omap3isp/ispresizer.c   |  16 +--
 drivers/media/platform/video-mux.c            |  10 +-
 .../media/platform/xilinx/xilinx-csi2rxss.c   |  69 +---------
 .../media/test-drivers/vimc/vimc-debayer.c    |  11 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c |  11 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c |  11 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |   8 +-
 drivers/staging/media/imx/imx-ic-prp.c        |   2 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   2 +-
 drivers/staging/media/imx/imx-media-csi.c     |   2 +-
 drivers/staging/media/imx/imx-media-utils.c   |   8 +-
 drivers/staging/media/imx/imx-media-vdic.c    |   2 +-
 drivers/staging/media/imx/imx-media.h         |   4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |   2 +-
 drivers/staging/media/omap4iss/iss_csi2.c     |   6 +-
 drivers/staging/media/omap4iss/iss_ipipe.c    |   8 +-
 drivers/staging/media/omap4iss/iss_ipipeif.c  |   8 +-
 drivers/staging/media/omap4iss/iss_resizer.c  |   8 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  10 +-
 include/media/v4l2-subdev.h                   |   7 +-
 98 files changed, 674 insertions(+), 552 deletions(-)

-- 
Regards,

Laurent Pinchart

