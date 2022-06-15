Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5C4E54D469
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 00:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350477AbiFOWOb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 18:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345119AbiFOWO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 18:14:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB9415FE4;
        Wed, 15 Jun 2022 15:14:26 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E6DBA49;
        Thu, 16 Jun 2022 00:14:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655331264;
        bh=DIQENIdSE1gjW6Rzp/77O3mIdomiUrw1FaQO4jkW33s=;
        h=From:To:Cc:Subject:Date:From;
        b=nAfAXHt7/MeaG91uSDaJcUhelSVdIWJfcyewrDDMzEJ9Sc3XvXQnZ6TGb/4V3nCs9
         jZ9vP33r5yZXcPjSf8YsekumlnyM9kvYjouxLxnHDqdGDdrpmNQbw4DEhzbXeU4DN3
         gbxDjoSrV4KaH8exUaBHYLP+L7S2izjRzMyj/WP0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v3 0/6] dt-bindings: Add macros for video interface bus types
Date:   Thu, 16 Jun 2022 01:14:04 +0300
Message-Id: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series is the result of me getting a bus-type numerical
value wrong in a device tree file and spending too long debugging the
issue. Hopefully there's nothing controversial here.

Compared to v2, the PARALLEL bus type came back to replace BT601, as it
turned out that BT601 doesn't actually describe what is usually referred
to as the parallel bus type. Patch 3/3 has been split in per-vendor
patches at the request of Alexandre Torgue.

Laurent Pinchart (6):
  dt-bindings: media: Add macros for video interface bus types
  dt-bindings: Use new video interface bus type macros in examples
  ARM: dts: freescale: Use new media bus type macros
  ARM: dts: omap: Use new media bus type macros
  ARM: dts: renesas: Use new media bus type macros
  ARM: dts: stm32: Use new media bus type macros

 .../display/bridge/analogix,anx7625.yaml         |  1 +
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml  |  3 ++-
 .../bindings/media/i2c/ovti,ov772x.yaml          |  3 ++-
 .../bindings/media/marvell,mmp2-ccic.yaml        |  3 ++-
 .../bindings/media/microchip,xisc.yaml           |  3 ++-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml |  4 +++-
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi          |  4 +++-
 arch/arm/boot/dts/omap3-n900.dts                 |  5 +++--
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts  | 11 +++++++----
 .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi    |  4 +++-
 .../r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi    |  4 +++-
 arch/arm/boot/dts/stm32429i-eval.dts             |  3 ++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts            |  3 ++-
 include/dt-bindings/media/video-interfaces.h     | 16 ++++++++++++++++
 14 files changed, 51 insertions(+), 16 deletions(-)
 create mode 100644 include/dt-bindings/media/video-interfaces.h


base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
-- 
Regards,

Laurent Pinchart

