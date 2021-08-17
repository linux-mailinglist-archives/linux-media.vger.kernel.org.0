Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C6F3EE72C
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 09:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238439AbhHQH1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 03:27:16 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:37543 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238067AbhHQH1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 03:27:14 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4CC3AFF80A;
        Tue, 17 Aug 2021 07:26:37 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [RFC 5/5] arm64: dts: GMSL: Adapt to the use max9271 driver
Date:   Tue, 17 Aug 2021 09:27:03 +0200
Message-Id: <20210817072703.1167-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
References: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the whole RDACM20/21 camera module was handled by a single
driver and a single device node entry was required in DTS to describe
it.

With the introduction of the max9271 subdevice driver the camera module
is now described by two device nodes, one for the serializer and one for
the image sensor connected to it.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi | 34 ++++++++++++++++---
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts |  6 ++--
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi b/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
index d45f072f8cdf..7d8f2e979134 100644
--- a/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
+++ b/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
@@ -131,13 +131,37 @@ i2c-mux {
 		i2c@0 {
 			status = "okay";
 
-			camera@51 {
-				compatible = GMSL_CAMERA_MODEL;
-				reg = <0x51>, <0x61>;
+			serializer@51 {
+				compatible = "maxim,max9271";
+				reg = <0x51>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						fakra_con0: endpoint {
+							remote-endpoint = <&max9286_in0>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						sensor_in0: endpoint {
+							remote-endpoint = <&sensor_out0>;
+						};
+					};
+				};
+			};
+
+			camera@61 {
+				compatible = "imi,rdacm20";
+				reg = <0x61>;
 
 				port {
-					fakra_con0: endpoint {
-						remote-endpoint = <&max9286_in0>;
+					sensor_out0: endpoint {
+						remote-endpoint = <&sensor_in0>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 96c807bf868c..22bb04914159 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -388,7 +388,7 @@ &scif0 {
 /* FAKRA Overlay */
 #define GMSL_CAMERA_RDACM20
 #define GMSL_CAMERA_0
-#define GMSL_CAMERA_1
-#define GMSL_CAMERA_2
-#define GMSL_CAMERA_3
+//#define GMSL_CAMERA_1
+//#define GMSL_CAMERA_2
+//#define GMSL_CAMERA_3
 #include "gmsl-cameras.dtsi"
-- 
2.32.0

