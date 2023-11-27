Return-Path: <linux-media+bounces-1072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 984177F9C5D
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 10:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB6BE1C209B9
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 09:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88BD134BF;
	Mon, 27 Nov 2023 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WL/48UD0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A612C111
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 01:07:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 027B19D5;
	Mon, 27 Nov 2023 10:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701076024;
	bh=pyI0FKzKufJ2KXP0At6L09LYpgcg8OIP37kg3YsIZi8=;
	h=From:To:Cc:Subject:Date:From;
	b=WL/48UD06xza9annff7ByHK8kX/FsdFTpQ65wJGjVglu9mPf6zDLSnsVcIDRJh7de
	 VxzIB52S7Q3ec6A93cNlerp7qCw3chnpI8UhHySCbsJPNLSwJXxvUywUcDVTmj4Xm5
	 uU/30qe/lJGB4QOex0fNKKZHxBnvpO5zkRqNnR+M=
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
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v4 0/1] media: v4l2-subdev: Make .init_cfg() an internal operation
Date: Mon, 27 Nov 2023 11:07:43 +0200
Message-ID: <20231127090744.30012-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch addresses a historical issue in the V4L2 subdev in-kernel
API.

The subdev .init_cfg() pad operation used to initialize a
v4l2_subdev_pad_config structure. This was changed to initializing a
v4l2_subdev_state a while ago, but the operation wasn't renamed, and
stayed a pad operation. Not only is the name confusing for new
developers, it is also the only pad operation that doesn't operate on a
pad, leading to more confusion.

This patch addresses those two issues by renaming the operation to
.init_cfg() and moving it to the subdev internal operations. All of the
preparatory patches from previous version have been applied by Sakari
already, leaving only this patch for a respin.

The patch is based on Sakari's latest test branch ([1]), containing
patches scheduled for v6.8. I would like to get it merged in v6.8 as
well, as it touches many drivers and rebasing it is painful. Mauro,
Hans, for this reason, I would appreciate if you could review this patch
now and not when Sakari or I will send a pull request.

[1] https://git.linuxtv.org/sailus/media_tree.git/log/?h=test

Laurent Pinchart (1):
  media: v4l2-subdev: Rename .init_cfg() operation to .init_state()

 drivers/media/i2c/adv7180.c                   | 10 ++--
 drivers/media/i2c/ccs/ccs-core.c              |  6 +--
 drivers/media/i2c/ds90ub913.c                 | 10 ++--
 drivers/media/i2c/ds90ub953.c                 | 10 ++--
 drivers/media/i2c/ds90ub960.c                 | 11 ++--
 drivers/media/i2c/gc2145.c                    | 10 ++--
 drivers/media/i2c/hi846.c                     | 10 ++--
 drivers/media/i2c/imx214.c                    | 12 +++--
 drivers/media/i2c/imx219.c                    |  9 ++--
 drivers/media/i2c/imx290.c                    | 10 ++--
 drivers/media/i2c/imx296.c                    | 10 ++--
 drivers/media/i2c/imx334.c                    | 12 +++--
 drivers/media/i2c/imx335.c                    | 12 +++--
 drivers/media/i2c/imx412.c                    | 12 +++--
 drivers/media/i2c/imx415.c                    | 10 ++--
 drivers/media/i2c/mt9m001.c                   | 10 ++--
 drivers/media/i2c/mt9m111.c                   | 10 ++--
 drivers/media/i2c/mt9m114.c                   | 16 +++---
 drivers/media/i2c/mt9p031.c                   |  8 +--
 drivers/media/i2c/mt9v111.c                   | 10 ++--
 drivers/media/i2c/ov01a10.c                   | 10 ++--
 drivers/media/i2c/ov02a10.c                   | 10 ++--
 drivers/media/i2c/ov2640.c                    | 10 ++--
 drivers/media/i2c/ov2680.c                    | 10 ++--
 drivers/media/i2c/ov2740.c                    | 10 ++--
 drivers/media/i2c/ov5640.c                    | 10 ++--
 drivers/media/i2c/ov5645.c                    | 12 +++--
 drivers/media/i2c/ov5670.c                    | 10 ++--
 drivers/media/i2c/ov7251.c                    | 12 +++--
 drivers/media/i2c/ov8858.c                    | 10 ++--
 drivers/media/i2c/ov9282.c                    | 12 +++--
 drivers/media/i2c/st-vgxy61.c                 | 10 ++--
 drivers/media/i2c/tc358746.c                  | 10 ++--
 drivers/media/i2c/tda1997x.c                  | 10 ++--
 drivers/media/i2c/thp7312.c                   | 10 ++--
 drivers/media/i2c/tvp5150.c                   |  6 +--
 drivers/media/pci/intel/ivsc/mei_csi.c        | 10 ++--
 drivers/media/platform/cadence/cdns-csi2rx.c  | 10 ++--
 .../platform/microchip/microchip-csi2dc.c     | 10 ++--
 .../platform/microchip/microchip-isc-scaler.c | 10 ++--
 drivers/media/platform/nxp/imx-mipi-csis.c    | 10 ++--
 drivers/media/platform/nxp/imx7-media-csi.c   |  6 +--
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 10 ++--
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     | 10 ++--
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 10 ++--
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 10 ++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 10 ++--
 .../media/platform/renesas/vsp1/vsp1_brx.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_clu.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_entity.c | 53 +++++++++----------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  2 -
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  1 -
 .../media/platform/renesas/vsp1/vsp1_lif.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_lut.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  1 -
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  1 -
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 10 ++--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 10 ++--
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 10 ++--
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   |  6 +--
 .../st/stm32/stm32-dcmipp/dcmipp-parallel.c   |  6 +--
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  9 ++--
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 10 ++--
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 10 ++--
 .../sun8i_a83t_mipi_csi2.c                    | 10 ++--
 drivers/media/platform/ti/cal/cal-camerarx.c  | 10 ++--
 drivers/media/platform/video-mux.c            | 10 ++--
 .../media/platform/xilinx/xilinx-csi2rxss.c   | 10 ++--
 .../media/test-drivers/vimc/vimc-debayer.c    | 11 ++--
 drivers/media/test-drivers/vimc/vimc-scaler.c | 11 ++--
 drivers/media/test-drivers/vimc/vimc-sensor.c | 11 ++--
 drivers/media/v4l2-core/v4l2-subdev.c         | 20 +++----
 drivers/staging/media/imx/imx-ic-prp.c        |  2 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  2 +-
 drivers/staging/media/imx/imx-media-csi.c     |  2 +-
 drivers/staging/media/imx/imx-media-utils.c   |  8 +--
 drivers/staging/media/imx/imx-media-vdic.c    |  2 +-
 drivers/staging/media/imx/imx-media.h         |  4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  2 +-
 .../staging/media/starfive/camss/stf-isp.c    |  6 ++-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 10 ++--
 include/media/v4l2-subdev.h                   |  7 +--
 86 files changed, 487 insertions(+), 264 deletions(-)


base-commit: 851fbdaebd3b1b4c47c2e2e38342c5ccf292ce27
-- 
Regards,

Laurent Pinchart


