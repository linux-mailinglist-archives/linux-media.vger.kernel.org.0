Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED3E623B98
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 17:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387483AbfETPGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 11:06:41 -0400
Received: from vps.xff.cz ([195.181.215.36]:54742 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727108AbfETPGl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 11:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1558364799; bh=MOIiLhQ+IjpqYl5yHzKvxPsRQBzGIbHz8ojgz49ajzM=;
        h=From:To:Cc:Subject:Date:From;
        b=c739CFNQlY0oMPgSRJ6Gd+ppWrHcU9ifdJ48imf5TZ4akgkyrfOflPcrue9VhteFO
         ZqNzzuIzVhoyOMOguR3sQcwhxTpxHpUWAU9zheMWLMTve+3VME2HcaUJlM5wcyUB0i
         NIGfuNVaPkXChDZBBhR7Hb/fH1VvUxQKeMrRAS/E=
From:   megous@megous.com
To:     Chen-Yu Tsai <wens@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [PATCH v2 0/3] ARM: sun8i: a83t: Support Camera Sensor Interface controller
Date:   Mon, 20 May 2019 17:06:34 +0200
Message-Id: <20190520150637.23557-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

This is a re-send of Chen-Yu's A83T CSI patch series with review tags
applied and removed address/size cells from csi_in port. Already applied
patches from v1  were dropped.

The series is ready to be merged:

  Patch 1 and 2 via sunxi tree
  Patch 3 via media tree

v2:
- dropped address/size cells from csi_in port
- added review tags

Please take a look and merge.

Thank you,
	Ondrej

--------------------------
Original description:

Hi everyone,

This series adds support for the camera sensor interface controller
found on the Allwinner A83T SoC. The controller is similar to the one
found on  the H3, with the addition of a MIPI CSI-2 interface. However,
this series only supports parallel and BT.656 interfaces, based on the
existing driver.

Patch 1 adds an undocumented clock parent of the CSI MCLK. This was
found after finding the default value to sometimes work and sometimes
not, and then comparing against BSP code.

Patch 2 adds a compatible string for the A83T variant.

Patch 3 adds support for the A83T variant to the existing sun6i-csi
driver.

Patch 4 adds a device node for the controller, as well as commonly
used pin muxing options.

Patch 5 adds a pin muxing option for I2C1 on the PE pins, used in
conjunction with the CSI pins.

Patch 6 provides an example usage of the CSI controller: the Bananapi M3
with its camera module attached.

Please have a look.

Regards
ChenYu

Chen-Yu Tsai (3):
  dt-bindings: media: sun6i-csi: Add compatible string for A83T variant
  media: sun6i: Support A83T variant
  ARM: dts: sun8i: a83t: Add device node for CSI (Camera Sensor
    Interface)

 .../devicetree/bindings/media/sun6i-csi.txt   |  1 +
 arch/arm/boot/dts/sun8i-a83t.dtsi             | 29 +++++++++++++++++++
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  1 +
 3 files changed, 31 insertions(+)

-- 
2.21.0

