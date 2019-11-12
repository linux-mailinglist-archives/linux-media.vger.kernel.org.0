Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6A47F9357
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfKLOuv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:50:51 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52456 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfKLOuv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:50:51 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEomEY097959;
        Tue, 12 Nov 2019 08:50:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570248;
        bh=TsBneoZKzB5CGJwt7jeP9UzozJx7lt2k4GHROFzZFr4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=G408UHjpMZVQfEbKkgdYCa8SqpPcBSw0JyBVhMUIv8SW77zZuYSMK+5RX9p06ji3G
         /r5MqHBfbh46KQqtsL8KXUQ+5V9vT+90QyGmPuiRIZCzMI0Di/wog6Jo/P7+E0wPGp
         RM5Vpqs3tJ5He27ZvG4f0LlzudyoLZmdmjD9Lg40=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEom7n058722
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:50:48 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:50:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:50:30 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEokem068428;
        Tue, 12 Nov 2019 08:50:48 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [RESEND Patch v3 02/20] dt-bindings: media: cal: update binding example
Date:   Tue, 12 Nov 2019 08:53:29 -0600
Message-ID: <20191112145347.23519-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112145347.23519-1-bparrot@ti.com>
References: <20191112145347.23519-1-bparrot@ti.com>
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
 .../devicetree/bindings/media/ti-cal.txt      | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
index 93096d924786..7e960cf26e23 100644
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
+				csi2_phy0: endpoint {
+					remote-endpoint = <&csi2_cam0>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
 				};
 			};
 			csi2_1: port@1 {
@@ -57,19 +57,20 @@ Example:
 	};
 
 	i2c5: i2c@4807c000 {
-		ar0330@10 {
-			compatible = "ti,ar0330";
-			reg = <0x10>;
+		clock-frequency = <400000>;
 
-			port {
-				#address-cells = <1>;
-				#size-cells = <0>;
+		camera-sensor@3c {
+			compatible = "ovti,ov5640";
+			reg = <0x3c>;
+
+			clocks = <&clk_fixed>;
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

