Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC399EE86B
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbfKDTbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:31:55 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46516 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729565AbfKDTby (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:31:54 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVq5t028674;
        Mon, 4 Nov 2019 13:31:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895912;
        bh=TsBneoZKzB5CGJwt7jeP9UzozJx7lt2k4GHROFzZFr4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=g+IMLC5YP26rIdZ0L9AejkYqsu/iaBDakIDWnmfObQ7Ezp/QU+UhFLmYE7xfKgHlu
         Pzijd5fgTcnvi/Q8NnZVxY7KwQ8znIIwiHCw5fsLihEramDOJ/xeYJl6y8AkhmkJhQ
         Mvr5eOLjc9VprLVPhBfuDgRyyu2Rxa9xYnjf4BvY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4JVqCs020892
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 13:31:52 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:31:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:31:37 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmd1096934;
        Mon, 4 Nov 2019 13:31:51 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 02/20] dt-bindings: media: cal: update binding example
Date:   Mon, 4 Nov 2019 13:31:22 -0600
Message-ID: <20191104193140.31145-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104193140.31145-1-bparrot@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
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

