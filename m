Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1BE54D46D
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 00:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350555AbiFOWOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 18:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350525AbiFOWOe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 18:14:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2D115FE4;
        Wed, 15 Jun 2022 15:14:33 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71F031356;
        Thu, 16 Jun 2022 00:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655331272;
        bh=hYw/XG1wi5ZlvDQ178c/bGN3IuQNb9BadCv6ZsV1h1E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LAlSmvf8tlZ4mhO5fsFMt9WsM/BiuSUs4ahJ07wNZmGr23eXjByCKwe7owQ2j+APh
         GL2vrtFTrhVEbGLFnaBRO/a4k6rvaYlwGkuhvJimsJh/P/w9IC2g/yTYW+UnEeoL+W
         p9eh91iukhDhwjIVHhFZEgbq9qXIiam9MnO6cKZ8=
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
Subject: [PATCH v3 5/6] ARM: dts: renesas: Use new media bus type macros
Date:   Thu, 16 Jun 2022 01:14:09 +0300
Message-Id: <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
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
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
 .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 4e58c54cde17..33ac4bd1e63b 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -7,6 +7,9 @@
  */
 
 /dts-v1/;
+
+#include <dt-bindings/media/video-interfaces.h>
+
 #include "r8a7742-iwg21d-q7.dts"
 
 / {
@@ -242,7 +245,7 @@ port {
 		vin0ep: endpoint {
 			remote-endpoint = <&cam0ep>;
 			bus-width = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
@@ -273,7 +276,7 @@ port {
 		vin1ep: endpoint {
 			remote-endpoint = <&cam1ep>;
 			bus-width = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
@@ -305,7 +308,7 @@ vin2ep: endpoint {
 			remote-endpoint = <&cam2ep>;
 			bus-width = <8>;
 			data-shift = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
@@ -335,7 +338,7 @@ port {
 		vin3ep: endpoint {
 			remote-endpoint = <&cam3ep>;
 			bus-width = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
index 40cef0b1d1e6..c73160df619d 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
@@ -7,6 +7,8 @@
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/media/video-interfaces.h>
+
 #define CAM_ENABLED	1
 
 &CAM_PARENT_I2C {
@@ -26,7 +28,7 @@ port {
 			CAM_EP: endpoint {
 				bus-width = <8>;
 				data-shift = <2>;
-				bus-type = <6>;
+				bus-type = <MEDIA_BUS_TYPE_BT656>;
 				pclk-sample = <1>;
 				remote-endpoint = <&VIN_EP>;
 			};
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
index f5e77f024251..a7f5cfec64b8 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
@@ -7,6 +7,8 @@
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/media/video-interfaces.h>
+
 #define CAM_ENABLED	1
 
 &CAM_PARENT_I2C {
@@ -21,7 +23,7 @@ ov7725@21 {
 		port {
 			CAM_EP: endpoint {
 				bus-width = <8>;
-				bus-type = <6>;
+				bus-type = <MEDIA_BUS_TYPE_BT656>;
 				remote-endpoint = <&VIN_EP>;
 			};
 		};
-- 
Regards,

Laurent Pinchart

