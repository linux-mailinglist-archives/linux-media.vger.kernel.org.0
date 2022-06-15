Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96AF54D46C
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 00:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350550AbiFOWOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 18:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350520AbiFOWOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 18:14:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601B3562E5;
        Wed, 15 Jun 2022 15:14:32 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09FED1440;
        Thu, 16 Jun 2022 00:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655331271;
        bh=CvmefkoiMCCllfPdCZdsUzGM5N3XWshqkLSA6CI/9hg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R5mbdHU0rHEAKrnJVpCCMtEc8+sg9w1HwIDAqFxJiJkWMFlCsCFV6E/UO+l8qft6U
         sFqNk2sAo+k8CCfJWs/TnUFyI52znZimLRKRsu712Pj+e4o3VPhFQofps9R4x2YaoH
         6dPkCwMzbp21VlDJYXtrgTvrGhv9R/D50Vbumoy0=
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
Subject: [PATCH v3 4/6] ARM: dts: omap: Use new media bus type macros
Date:   Thu, 16 Jun 2022 01:14:08 +0300
Message-Id: <20220615221410.27459-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
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

Now that a header exists with macros for the media interface bus-type
values, replace hardcoding numerical constants with the corresponding
macros in the DT sources.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/omap3-n900.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index d40c3d2c4914..9cad9d6a83e2 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -9,6 +9,7 @@
 #include "omap34xx.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 /*
  * Default secure signed bootloader (Nokia X-Loader) does not enable L3 firewall
@@ -194,7 +195,7 @@ port@1 {
 
 			csi_isp: endpoint {
 				remote-endpoint = <&csi_cam1>;
-				bus-type = <3>; /* CCP2 */
+				bus-type = <MEDIA_BUS_TYPE_CCP2>;
 				clock-lanes = <1>;
 				data-lanes = <0>;
 				lane-polarity = <0 0>;
@@ -835,7 +836,7 @@ cam1: camera@3e {
 
 		port {
 			csi_cam1: endpoint {
-				bus-type = <3>; /* CCP2 */
+				bus-type = <MEDIA_BUS_TYPE_CCP2>;
 				strobe = <1>;
 				clock-inv = <0>;
 				crc = <1>;
-- 
Regards,

Laurent Pinchart

