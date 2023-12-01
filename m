Return-Path: <linux-media+bounces-1489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9599801255
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 19:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55C0BB21261
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 18:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58284F1E9;
	Fri,  1 Dec 2023 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="KQcxCEIr"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C359106
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 10:13:42 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Shh5H0gB8z49Q33
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 20:13:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1701454419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yat81BBePVkhThXa/5OyhhxXrmZ8TQ1/YD+3Id1Wv4w=;
	b=KQcxCEIrGIvWttbMO8F7lZSoJlaBSb+vMQIwrtvPV1hZ14XH8Liz54L6BpHqYvDQF9FpKo
	CWScaWGpIRvGG4Gq5qT5vF1WAyPY3nIYIt4ome+Og3DoBtlS+Jcm1GtfrnJS5Z3NOQHEDR
	jQmBvP8N+WAYTId277SnHetqcL3EICrOpPVx0k34zynSR+1BznIiA40ci1ExHV9lGcfJHq
	P67X6XkXMuhyDMrPe+YRCLV45sy4Ojt5ZJFtXBHMgk34tQ7lrXDrX1yPziGIlYhs5DA0Jh
	hsnL2590nceafyvNLt6+rEy8VNDoG/NgE0Pb+5oVQ++lyY6DwIUrDP9GrE0uaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1701454419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yat81BBePVkhThXa/5OyhhxXrmZ8TQ1/YD+3Id1Wv4w=;
	b=MpLuw5zITuI92sv3090Ea7972eEhBivUYosypn3JRtZ4D56zDJS6KL9KrnsBgJ8MopyTLB
	egKgNlrKw6ggvfga5NYuXwLFDsj3CYtC6s6YRY9sG7fvpOwSkmJkLgz7WLD2DOW6rIdh6B
	0CndagpjdCZy/HxkngMepr9BP70maC0Vs2aVc5wPVOGSG4rHkzjTJ9WkQWvxNU9EmjqIyr
	SKYLZbrgFe3e409Yd6AS4e28AHoMb0Thp0EaBG7WSjL3Nwe1wDEy9NZ1zs0k2lxGxly/pi
	1aNpzK+f62w0CH6KRCL+806XRnIiJSXg1v++loWhoGZJc96aFmfXddj+2WiQvg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1701454419; a=rsa-sha256;
	cv=none;
	b=gDcRtFm6EXK1AbBJ39XEFw7xwEEgSh3tRkbDsjTxsSd2Qn844jGUy0cJGFa0R6AfK88WyF
	2tiwC+85kfSTXVi76T00oZOQg1D0RVfIXWbCHEoZUvDHMrrphSmMEm25rbidvBKdLlgtQs
	sTtOwajevJhA+pS0mqYLn6HgM8Ogo3be/B5X4UPogX+GIcc5qPvwDA9wPEJ3OpzbAyLCSA
	ZRlshki2nqVpy5mg6LGfTkKHnGIBGyN7KZXLqCVBWwTh6xctBQLhOX5mfwouBtuN80HR+N
	ZQPnTQssSE0dfhBVgn1PtnInu5ePQ3O0mbfcW0Fy73kPhzH5JkPzxAk2PsB2wg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3C726634C8F
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 20:13:34 +0200 (EET)
Date: Fri, 1 Dec 2023 18:13:34 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL v2 FOR 6.8] V4L2 sub-device API changes plus new drivers
Message-ID: <ZWoiTsq_2E3tkk_P@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Mauro, Hans,

Here are a bunch of new drivers (Thine ISP, gc2145 sensor driver, dcmipp
camera interface driver) and an init_cfg pad op change to init_state
internal op. Included is also the media tree portion of the DisCo for
Imaging support and a new fwnode property API function, needed by the Thine
ISP driver. Also a number of fixes and improvements to the mipid02 and
vgxy61 drivers are included --- they also depend on the sub-device API
changes.

since v1:

- Merge media/v6.7-2 (fixes merged by Linus) on media stage tree and rebase
  patches on top.

Please pull.


The following changes since commit a00b3f296eac3d43328615c3113e1a74143fc67a:

  media: mediatek: vcodec: Set the supported vp9 profile for each platform (2023-11-23 19:26:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.8-4.2-signed

for you to fetch changes up to 79adb3adb3316b6729a33e37a12006689a23a214:

  media: stm32-dcmipp: STM32 DCMIPP camera interface driver (2023-12-01 13:03:09 +0200)

----------------------------------------------------------------
V4L2 patches for 6.8

----------------------------------------------------------------
Alain Volmat (15):
      dt-bindings: vendor-prefixes: Add prefix for GalaxyCore Inc.
      dt-bindings: media: i2c: add galaxycore,gc2145 dt-bindings
      media: i2c: gc2145: Galaxy Core GC2145 sensor support
      media: i2c: st-mipid02: correct format propagation
      media: i2c: st-mipid02: add usage of v4l2_get_link_freq
      media: i2c: st-mipid02: don't keep track of streaming status
      media: i2c: st-mipid02: use cci_* helpers for register access.
      media: i2c: st-mipid02: use active state to store pad formats
      media: i2c: st-mipid02: use mipi-csi macro for data-type
      media: i2c: st-mipid02: removal of unused link_frequency variable
      media: i2c: st-mipid02: add Y8 format support
      media: i2c: st-vgxy61: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
      media: i2c: st-vgxy61: add v4l2_fwnode ctrls parse and addition
      dt-bindings: media: add bindings for stm32 dcmipp
      media: MAINTAINERS: add entry for STM32 DCMIPP driver

Arnd Bergmann (1):
      media: pci: mgb4: add COMMON_CLK dependency

Dan Carpenter (1):
      media: v4l2-subdev: Fix a 64bit bug

Deborah Brouwer (1):
      media: wave5: add OF and V4L_MEM2MEM_DRIVERS dependencies

Hans Verkuil (1):
      Merge tag 'media-renesas-fixes-20231113' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git

Hugues Fruchet (1):
      media: stm32-dcmipp: STM32 DCMIPP camera interface driver

Laurent Pinchart (4):
      media: vsp1: Remove unbalanced .s_stream(0) calls
      media: renesas: vsp1: Fix references to pad config
      media: uapi: Add controls for the THP7312 ISP
      media: v4l2-subdev: Rename .init_cfg() operation to .init_state()

Martin Tůma (1):
      media: mgb4: Added support for T200 card variant

Paul Elder (2):
      dt-bindings: media: Add bindings for THine THP7312 ISP
      media: i2c: Add driver for THine THP7312

Sakari Ailus (3):
      Merge tag 'media/v6.7-2' into HEAD
      device property: Add fwnode_name_eq()
      media: v4l: fwnode: Parse MIPI DisCo for Imaging properties

 .../bindings/media/i2c/galaxycore,gc2145.yaml      |  113 +
 .../bindings/media/i2c/thine,thp7312.yaml          |  224 ++
 .../devicetree/bindings/media/st,stm32-dcmipp.yaml |   89 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 .../userspace-api/media/drivers/index.rst          |    1 +
 .../userspace-api/media/drivers/thp7312.rst        |   39 +
 MAINTAINERS                                        |   24 +-
 drivers/base/property.c                            |   28 +
 drivers/media/i2c/Kconfig                          |   27 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/adv7180.c                        |   10 +-
 drivers/media/i2c/ccs/ccs-core.c                   |    6 +-
 drivers/media/i2c/ds90ub913.c                      |   10 +-
 drivers/media/i2c/ds90ub953.c                      |   10 +-
 drivers/media/i2c/ds90ub960.c                      |   11 +-
 drivers/media/i2c/gc2145.c                         | 1450 +++++++++++++
 drivers/media/i2c/hi846.c                          |   10 +-
 drivers/media/i2c/imx214.c                         |   12 +-
 drivers/media/i2c/imx219.c                         |    9 +-
 drivers/media/i2c/imx290.c                         |   10 +-
 drivers/media/i2c/imx296.c                         |   10 +-
 drivers/media/i2c/imx334.c                         |   12 +-
 drivers/media/i2c/imx335.c                         |   12 +-
 drivers/media/i2c/imx412.c                         |   12 +-
 drivers/media/i2c/imx415.c                         |   10 +-
 drivers/media/i2c/mt9m001.c                        |   10 +-
 drivers/media/i2c/mt9m111.c                        |   10 +-
 drivers/media/i2c/mt9m114.c                        |   16 +-
 drivers/media/i2c/mt9p031.c                        |    8 +-
 drivers/media/i2c/mt9v111.c                        |   10 +-
 drivers/media/i2c/ov01a10.c                        |   10 +-
 drivers/media/i2c/ov02a10.c                        |   10 +-
 drivers/media/i2c/ov2640.c                         |   10 +-
 drivers/media/i2c/ov2680.c                         |   10 +-
 drivers/media/i2c/ov2740.c                         |   10 +-
 drivers/media/i2c/ov5640.c                         |   10 +-
 drivers/media/i2c/ov5645.c                         |   12 +-
 drivers/media/i2c/ov5670.c                         |   10 +-
 drivers/media/i2c/ov7251.c                         |   12 +-
 drivers/media/i2c/ov8858.c                         |   10 +-
 drivers/media/i2c/ov9282.c                         |   12 +-
 drivers/media/i2c/st-mipid02.c                     |  480 ++---
 drivers/media/i2c/st-vgxy61.c                      |   29 +-
 drivers/media/i2c/tc358746.c                       |   10 +-
 drivers/media/i2c/tda1997x.c                       |   10 +-
 drivers/media/i2c/thp7312.c                        | 2244 ++++++++++++++++++++
 drivers/media/i2c/tvp5150.c                        |    6 +-
 drivers/media/pci/intel/ivsc/mei_csi.c             |   10 +-
 drivers/media/pci/mgb4/Kconfig                     |    1 +
 drivers/media/pci/mgb4/mgb4_core.c                 |   20 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |   10 +-
 drivers/media/platform/chips-media/wave5/Kconfig   |    3 +-
 .../media/platform/microchip/microchip-csi2dc.c    |   10 +-
 .../platform/microchip/microchip-isc-scaler.c      |   10 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |   10 +-
 drivers/media/platform/nxp/imx7-media-csi.c        |    6 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   10 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |   10 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |   10 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |   10 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |   10 +-
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |   41 +-
 drivers/media/platform/renesas/vsp1/vsp1_clu.c     |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |  130 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.h  |   12 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgo.c     |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgt.c     |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |   24 +-
 drivers/media/platform/renesas/vsp1/vsp1_hsit.c    |   12 +-
 drivers/media/platform/renesas/vsp1/vsp1_lif.c     |    3 +-
 drivers/media/platform/renesas/vsp1/vsp1_lut.c     |    1 -
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |    2 +-
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |   18 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |   46 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h    |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_sru.c     |   37 +-
 drivers/media/platform/renesas/vsp1/vsp1_uds.c     |   40 +-
 drivers/media/platform/renesas/vsp1/vsp1_uif.c     |   25 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |   39 +-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |   10 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |   10 +-
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |   10 +-
 drivers/media/platform/st/stm32/Kconfig            |   16 +
 drivers/media/platform/st/stm32/Makefile           |    1 +
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |    4 +
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  956 +++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  565 +++++
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.c |  111 +
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  218 ++
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  604 ++++++
 .../st/stm32/stm32-dcmipp/dcmipp-parallel.c        |  440 ++++
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |    1 +
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h |    1 +
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |    9 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c    |   10 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |   10 +-
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |   10 +-
 drivers/media/platform/ti/cal/cal-camerarx.c       |   10 +-
 drivers/media/platform/video-mux.c                 |   10 +-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    |   10 +-
 drivers/media/test-drivers/vimc/vimc-debayer.c     |   11 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c      |   11 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c      |   11 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |    4 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   20 +-
 drivers/staging/media/imx/imx-ic-prp.c             |    2 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |    2 +-
 drivers/staging/media/imx/imx-media-csi.c          |    2 +-
 drivers/staging/media/imx/imx-media-utils.c        |    8 +-
 drivers/staging/media/imx/imx-media-vdic.c         |    2 +-
 drivers/staging/media/imx/imx-media.h              |    4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |    2 +-
 drivers/staging/media/starfive/camss/stf-isp.c     |    6 +-
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c |   10 +-
 include/linux/property.h                           |    1 +
 include/media/v4l2-subdev.h                        |    7 +-
 include/uapi/linux/thp7312.h                       |   19 +
 include/uapi/linux/v4l2-controls.h                 |    6 +
 include/uapi/linux/v4l2-subdev.h                   |    2 +-
 120 files changed, 8018 insertions(+), 800 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
 create mode 100644 drivers/media/i2c/gc2145.c
 create mode 100644 drivers/media/i2c/thp7312.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
 create mode 100644 include/uapi/linux/thp7312.h

-- 
Sakari Ailus

