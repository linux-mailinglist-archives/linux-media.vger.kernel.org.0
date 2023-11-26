Return-Path: <linux-media+bounces-1031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 918C67F90AB
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 02:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 481221C20A42
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 01:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38161111;
	Sun, 26 Nov 2023 01:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DmcklNpu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD3E10D
	for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 17:37:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E2292E7;
	Sun, 26 Nov 2023 02:36:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700962597;
	bh=A4n4cQ0MvHK0m+fZlYusnOVsLLXCndoL1W2YUb2jY8E=;
	h=From:To:Cc:Subject:Date:From;
	b=DmcklNpuXAAlGOzlE20cNaga+7fWVHr4YJrvPtOJFbiaKbNLIbczgcqGARNIXIeOk
	 Xy2ZDxgpAGzcKoRM+XcHHIbU/ATPMB09mlvXLm7vzv+LNsUVlQKsXcUBrLySoqHUBR
	 XF3wNALeJ1BFSu8BLn4ELnY8rGBQsaTg3D45SSCQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Maxime Ripard <mripard@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 0/2] media: v4l2-subdev: Make .init_cfg() an internal operation
Date: Sun, 26 Nov 2023 03:37:14 +0200
Message-ID: <20231126013716.32523-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2/2. Most of the preparatory patches from v1 have been applied by Sakari
already, leaving only 1/2 for a respin due to issues with the
first version.

The series is based on Sakari's latest test branch ([1]), containing
patches scheduled for v6.8. I would like to get it merged in v6.8 as
well, as it touches many drivers and rebasing it is painful. Mauro,
Hans, for this reason, I would appreciate if you could review this
series now and not when Sakari or I will send a pull request.

[1] https://git.linuxtv.org/sailus/media_tree.git/log/?h=test

The VSP1 driver has been tested on a Renesas R-Car M3-N Salvator-XS. The
rest of the series is compile-tested only.

Laurent Pinchart (2):
  media: renesas: vsp1: Fix references to pad config
  media: v4l2-subdev: Rename .init_cfg() operation to .init_state()

 drivers/media/i2c/adv7180.c                   |  10 +-
 drivers/media/i2c/ccs/ccs-core.c              |   6 +-
 drivers/media/i2c/ds90ub913.c                 |  10 +-
 drivers/media/i2c/ds90ub953.c                 |  10 +-
 drivers/media/i2c/ds90ub960.c                 |  11 +-
 drivers/media/i2c/gc2145.c                    |  10 +-
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
 drivers/media/i2c/thp7312.c                   |  10 +-
 drivers/media/i2c/tvp5150.c                   |   6 +-
 drivers/media/pci/intel/ivsc/mei_csi.c        |  10 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  10 +-
 .../platform/microchip/microchip-csi2dc.c     |  10 +-
 .../platform/microchip/microchip-isc-scaler.c |  10 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |  10 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |   6 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  10 +-
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  10 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  10 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  10 +-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  10 +-
 .../media/platform/renesas/vsp1/vsp1_brx.c    |  41 +++---
 .../media/platform/renesas/vsp1/vsp1_clu.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_entity.c | 130 +++++++++---------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  12 +-
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_hgt.c    |   4 +-
 .../media/platform/renesas/vsp1/vsp1_histo.c  |  24 ++--
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  12 +-
 .../media/platform/renesas/vsp1/vsp1_lif.c    |   3 +-
 .../media/platform/renesas/vsp1/vsp1_lut.c    |   1 -
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |   8 +-
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  38 +++--
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  37 +++--
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  40 +++---
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  25 ++--
 .../media/platform/renesas/vsp1/vsp1_video.c  |   4 +-
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  10 +-
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
 drivers/media/platform/video-mux.c            |  10 +-
 .../media/platform/xilinx/xilinx-csi2rxss.c   |  10 +-
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
 .../staging/media/starfive/camss/stf-isp.c    |   6 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  10 +-
 include/media/v4l2-subdev.h                   |   7 +-
 90 files changed, 633 insertions(+), 427 deletions(-)


base-commit: bc3995c9d5e909c43862917321d0996bbd9fed99
-- 
Regards,

Laurent Pinchart


