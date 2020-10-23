Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8021A2976AA
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 20:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754322AbgJWSLO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 14:11:14 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:51824 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754310AbgJWSLN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 14:11:13 -0400
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 337043B051E;
        Fri, 23 Oct 2020 17:46:35 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A96221BF209;
        Fri, 23 Oct 2020 17:46:09 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: [PATCH 00/14] Allwinner MIPI CSI-2 support for A31/V3s/A83T
Date:   Fri, 23 Oct 2020 19:45:32 +0200
Message-Id: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series introduces support for MIPI CSI-2, with the A31 controller that is
found on most SoCs (A31, V3s and probably V5) as well as the A83T-specific
controller. While the former uses the same MIPI D-PHY that is already supported
for DSI, the latter embeds its own D-PHY.

In order to distinguish the use of the D-PHY between Rx mode (for MIPI CSI-2)
and Tx mode (for MIPI DSI), a submode is introduced for D-PHY in the PHY API.
This allows adding Rx support in the A31 D-PHY driver.

A few changes and fixes are applied to the A31 CSI controller driver, in order
to support the MIPI CSI-2 use-case.

Follows is the V4L2 device topology representing the interactions between
the MIPI CSI-2 sensor, the MIPI CSI-2 controller (which controls the D-PHY)
and the CSI controller:
- entity 1: sun6i-csi (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
	pad0: Sink
		<- "sun6i-mipi-csi2":1 [ENABLED,IMMUTABLE]

- entity 5: sun6i-mipi-csi2 (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
	pad0: Sink
		<- "ov5648 0-0036":0 [ENABLED,IMMUTABLE]
	pad1: Source
		-> "sun6i-csi":0 [ENABLED,IMMUTABLE]

- entity 8: ov5648 0-0036 (1 pad, 1 link)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev0
	pad0: Source
		[fmt:SBGGR8_1X8/640x480@1/30 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
		-> "sun6i-mipi-csi2":0 [ENABLED,IMMUTABLE]

Happy reviewing!

Paul Kocialkowski (14):
  phy: Distinguish between Rx and Tx for MIPI D-PHY with submodes
  phy: allwinner: phy-sun6i-mipi-dphy: Support D-PHY Rx mode for MIPI
    CSI-2
  media: sun6i-csi: Support an optional dedicated memory pool
  media: sun6i-csi: Fix the image storage bpp for 10/12-bit Bayer
    formats
  media: sun6i-csi: Only configure the interface data width for parallel
  media: sun6i-csi: Support feeding from the MIPI CSI-2 controller
  dt-bindings: media: i2c: Add A31 MIPI CSI-2 bindings documentation
  media: sunxi: Add support for the A31 MIPI CSI-2 controller
  ARM: dts: sun8i: v3s: Add CSI0 camera interface node
  ARM: dts: sun8i: v3s: Add MIPI D-PHY and MIPI CSI-2 interface nodes
  dt-bindings: media: i2c: Add A83T MIPI CSI-2 bindings documentation
  media: sunxi: Add support for the A83T MIPI CSI-2 controller
  ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
  media: sunxi: sun8i-a83t-mipi-csi2: Avoid using the (unsolicited)
    interrupt

 .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 168 +++++
 .../media/allwinner,sun8i-a83t-mipi-csi2.yaml | 158 +++++
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  26 +
 arch/arm/boot/dts/sun8i-v3s.dtsi              |  62 ++
 drivers/media/platform/sunxi/Kconfig          |   2 +
 drivers/media/platform/sunxi/Makefile         |   2 +
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  54 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  20 +-
 .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  11 +
 .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 635 +++++++++++++++++
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   | 116 +++
 .../sunxi/sun8i-a83t-mipi-csi2/Kconfig        |  11 +
 .../sunxi/sun8i-a83t-mipi-csi2/Makefile       |   4 +
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c    |  92 +++
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h    |  39 ++
 .../sun8i_a83t_mipi_csi2.c                    | 660 ++++++++++++++++++
 .../sun8i_a83t_mipi_csi2.h                    | 196 ++++++
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 164 ++++-
 drivers/staging/media/rkisp1/rkisp1-isp.c     |   3 +-
 include/linux/phy/phy-mipi-dphy.h             |  13 +
 21 files changed, 2408 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h

-- 
2.28.0

