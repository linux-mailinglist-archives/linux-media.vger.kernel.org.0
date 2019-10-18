Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBD0DC896
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410609AbfJRPcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:32:07 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47644 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410487AbfJRPcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:07 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW4EV013333;
        Fri, 18 Oct 2019 10:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412724;
        bh=1IFsv4aHfGxY2ANuXmzhcs4OdarMkTUyT1n5qDGGa7c=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IWGYNEUXK5dFD9FbMBRxPOvPH0apkpXxglU1ibA+7opOVY81RZOx7obpCSb89cLnJ
         TNngqVsE6H46nHYQvx6uKSswGA12Ui+HHUa8G1aHS9fXKyLfru6uBisFLBV69gKFa3
         qZb3HVR41CjT7nWf1ow6XjIyvT9NlFJXkHX6xCV8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW4DD105555;
        Fri, 18 Oct 2019 10:32:04 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:31:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:31:56 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15G080266;
        Fri, 18 Oct 2019 10:32:04 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 02/19] dt-bindings: media: cal: update binding example
Date:   Fri, 18 Oct 2019 10:34:20 -0500
Message-ID: <20191018153437.20614-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update binding example to show proper endpoint properties and linkage.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 .../devicetree/bindings/media/ti-cal.txt      | 32 ++++++++++---------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
index 782f801b12a9..6b56fddcfc4a 100644
--- a/Documentation/devicetree/bindings/media/ti-cal.txt
+++ b/Documentation/devicetree/bindings/media/ti-cal.txt
@@ -27,7 +27,6 @@ Documentation/devicetree/bindings/media/video-interfaces.txt.
 Example:
 	cal: cal@4845b000 {
 		compatible = "ti,dra72-cal";
-		ti,hwmods = "cal";
 		reg = <0x4845B000 0x400>,
 		      <0x4845B800 0x40>,
 		      <0x4845B900 0x40>;
@@ -45,9 +44,10 @@ Example:
 
 			csi2_0: port@0 {
 				reg = <0>;
-				endpoint {
-					slave-mode;
-					remote-endpoint = <&ar0330_1>;
+				csi2_phy0: endpoint@0 {
+					remote-endpoint = <&csi2_cam0>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
 				};
 			};
 			csi2_1: port@1 {
@@ -57,19 +57,21 @@ Example:
 	};
 
 	i2c5: i2c@4807c000 {
-		ar0330@10 {
-			compatible = "ti,ar0330";
-			reg = <0x10>;
+		status = "okay";
+		clock-frequency = <400000>;
 
-			port {
-				#address-cells = <1>;
-				#size-cells = <0>;
+		ov5640@3c {
+			compatible = "ovti,ov5640";
+			reg = <0x3c>;
+
+			clocks = <&clk_ov5640_fixed>;
+			clock-names = "xclk";
 
-				ar0330_1: endpoint {
-					reg = <0>;
-					clock-lanes = <1>;
-					data-lanes = <0 2 3 4>;
-					remote-endpoint = <&csi2_0>;
+			port {
+				csi2_cam0: endpoint {
+					remote-endpoint = <&csi2_phy0>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
 				};
 			};
 		};
-- 
2.17.1

