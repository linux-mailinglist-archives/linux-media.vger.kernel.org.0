Return-Path: <linux-media+bounces-332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70B67EB0A6
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 14:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E95EBB20B21
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 13:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AB23FE4B;
	Tue, 14 Nov 2023 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IHKIzWB4"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09433E47D
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 13:15:10 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF81A199
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 05:15:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9B28223;
	Tue, 14 Nov 2023 14:14:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699967681;
	bh=AMcoJHGplpR6K5mBaXM7dxCkzkzQwsI+gtMQOL2fhd8=;
	h=From:To:Cc:Subject:Date:From;
	b=IHKIzWB4s3GxIOQcO6GX/UFe5GbWAXUQ/jHl05Fe3RRrDceC3mLy+xB6SMYPTrbqC
	 X/lQFef2ISTE+xaGLKCXfTGXdLduT7k5oXKHxcNluvPQ4vB7TSWsJgvKNdvub0pEMH
	 ce2ICb7K5xY1Mfen6Im7JlRAaDviDahcPNegD9hI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 0/2] media: v4l2-subdev: Make .init_cfg() an internal operation
Date: Tue, 14 Nov 2023 15:15:10 +0200
Message-ID: <20231114131512.24615-1-laurent.pinchart+renesas@ideasonboard.com>
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

The series is based on a merge oof Sakari's latest pull request for v6.8
([1]) and a v6.7 fix for the VSP1 driver ([2]).

[1] https://lore.kernel.org/linux-media/ZVEyCfzm4ninES6K@valkosipuli.retiisi.eu
[2] https://lore.kernel.org/linux-media/20231113020054.GA18039@pendragon.ideasonboard.com

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
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  10 +-
 include/media/v4l2-subdev.h                   |   7 +-
 87 files changed, 614 insertions(+), 420 deletions(-)

-- 
Regards,

Laurent Pinchart


