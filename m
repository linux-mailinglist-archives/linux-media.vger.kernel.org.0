Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42FAE11F965
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfLOQ7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 11:59:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:54904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbfLOQ7a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 11:59:30 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 757FD2465E;
        Sun, 15 Dec 2019 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576429169;
        bh=Gd00U8yFwwl+S6X9g/gX+uSdH0+/+1ri3WTiVTHeXXs=;
        h=From:To:Cc:Subject:Date:From;
        b=A2ZXDhDk9koYFIl88D6Mf/4V2RRFy/5q2UI+sO847d65qk70b5J6uA+RnF1nyviow
         aQoCzGBqfD3q5AxcDjueSTEOK4TCJGk49FCtiCx9ABY1ykYfLduCqOqr9b9YSD9fxY
         Lb0JyooRRdJ2d2U+E+agKEk4x55CibCkZsvsH/mE=
Received: by wens.tw (Postfix, from userid 1000)
        id 12FD95FC87; Mon, 16 Dec 2019 00:59:26 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/14] media: sun4i-csi: A10/A20 CSI1 and R40 CSI0 support
Date:   Mon, 16 Dec 2019 00:59:10 +0800
Message-Id: <20191215165924.28314-1-wens@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

This series adds basic support for CSI1 on Allwinner A10/A20 and CSI0 on
Allwinner R40. The CSI1 block has the same structure and layout as the
CSI0 block. Differences include:

  - Only one channel in BT.656 instead of four in CSI0
  - 10-bit raw data input vs 8-bit in CSI0
  - 24-bit RGB888/YUV444 input vs 16-bit RGB565/YUV422 in CSI0
  - No ISP hardware (CSI SCLK not needed)

The CSI0 block in the Allwinner R40 SoC looks to be the same as the one
in the A20. The register maps line up, and they support the same
features. The R40 appears to support BT.1120 based on the feature
overview, but it is not mentioned anywhere else. Also like the A20, the
ISP is not mentioned, but the CSI special clock needs to be enabled for
the hardware to function. The manual does state that the CSI special
clock is the TOP clock for all CSI hardware, but currently no hardware
exists for us to test if CSI1 also depends on it or not.

Included are a couple of fixes for signal polarity and DRAM offset
handling.

Patches 1 and 2 add compatible strings for the newly supported hardware.

Patches 3 and 4 fix the polarity setting of [HV]sync and data sampling.
Allwinner hardware uses [HV]ref semantics instead of [HV]sync.

Patch 5 deals with the DRAM offset when the CSI hardware does DMA. The
hardware does DMA directly to the memory bus, thus requiring the address
to not be offset like when DMA is done over the system bus.

Patch 6 add support for the CSI1 hardware block. For now this simply
means not requiring the ISP clock.

Patches 7 and 8 add CSI1 to A10 (sun4i) and A20 (sun7i) dtsi files.

Patch 9 adds I2C pixmuxing options for the R40. Used in the last example
patch.

Patch 10 adds a compatible string for the R40's MBUS (memory bus).

Patch 11 adds CSI0 to the R40 dtsi file

Patches 12 through 14 are examples of cameras hooked up to boards.

Please have a look. The MBUS compatible patch is likely to conflict
with a DT binding conversion patch Maxime sent out.

Also, I sent out an email asking about the polarity settings for
[HV]sync, how to signal the use of [HV]ref instead, and how to pass
timings from the camera to the capture interface. So far I haven't
heard back. In particular I think the OV7670 driver has inverted
polarity settings for HSYNC. Not sure about VSYNC.


Regards
ChenYu


Chen-Yu Tsai (14):
  dt-bindings: media: sun4i-csi: Add compatible for CSI1 on A10/A20
  dt-bindings: media: sun4i-csi: Add compatible for CSI0 on R40
  media: sun4i-csi: Fix data sampling polarity handling
  media: sun4i-csi: Fix [HV]sync polarity handling
  media: sun4i-csi: Deal with DRAM offset
  media: sun4i-csi: Add support for A10 CSI1 camera sensor interface
  ARM: dts: sun4i: Add CSI1 controller and pinmux options
  ARM: dts: sun7i: Add CSI1 controller and pinmux options
  ARM: dts: sun8i: r40: Add I2C pinmux options
  dt-bindings: bus: sunxi: Add R40 MBUS compatible
  ARM: dts: sun8i: r40: Add device node for CSI0
  [DO NOT MERGE] ARM: dts: sun4i: cubieboard: Enable OV7670 camera on
    CSI1
  [DO NOT MERGE] ARM: dts: sun7i: cubieboard2: Enable OV7670 camera on
    CSI1
  [DO NOT MERGE] ARM: dts: sun8i-r40: bananapi-m2-ultra: Enable OV5640
    camera

 .../bindings/arm/sunxi/sunxi-mbus.txt         |  1 +
 .../media/allwinner,sun4i-a10-csi.yaml        | 14 +++-
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts    | 42 ++++++++++++
 arch/arm/boot/dts/sun4i-a10.dtsi              | 35 ++++++++++
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts   | 42 ++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi              | 36 ++++++++++
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  | 67 +++++++++++++++++++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 64 ++++++++++++++++++
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 57 ++++++++++++++--
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  6 +-
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 20 ++++--
 11 files changed, 370 insertions(+), 14 deletions(-)

-- 
2.24.0

