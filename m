Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C522F932D
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfKLOvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:51:52 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41710 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727348AbfKLOvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:51:05 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEolHT105772;
        Tue, 12 Nov 2019 08:50:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570247;
        bh=tLf8SXtD5MIh4RuLfkAo79HCpF/i9eG4PtrsPy5Sv/A=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Rxpn55xzSMr41A7LDNhtoeirfJ0nfSSqqVVXr8qEzDeNn0KeM0ix+nRTxgsI2OZP3
         rBpKUDkypXQFFGXk08xfFUW7THKqN+A4/c/r8UU4k7Tsdfbf0ETBPfVtgpJ2p9fClv
         4fWa8uWKC2NXwuHtYRuxx6OmS3AYOdoM1rCpah3Q=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEolWo070274;
        Tue, 12 Nov 2019 08:50:47 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:50:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:50:47 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEokel068428;
        Tue, 12 Nov 2019 08:50:47 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [RESEND Patch v3 01/20] dt-bindings: media: cal: update binding to use syscon
Date:   Tue, 12 Nov 2019 08:53:28 -0600
Message-ID: <20191112145347.23519-2-bparrot@ti.com>
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

Update Device Tree bindings for the CAL driver to use syscon to access
the phy config register instead of trying to map it directly.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 Documentation/devicetree/bindings/media/ti-cal.txt | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
index ae9b52f37576..93096d924786 100644
--- a/Documentation/devicetree/bindings/media/ti-cal.txt
+++ b/Documentation/devicetree/bindings/media/ti-cal.txt
@@ -10,9 +10,14 @@ Required properties:
 - compatible: must be "ti,dra72-cal"
 - reg:	CAL Top level, Receiver Core #0, Receiver Core #1 and Camera RX
 	control address space
-- reg-names: cal_top, cal_rx_core0, cal_rx_core1, and camerrx_control
+- reg-names: cal_top, cal_rx_core0, cal_rx_core1 and camerrx_control
 	     registers
 - interrupts: should contain IRQ line for the CAL;
+- ti,camerrx-control: phandle to the device control module and offset to
+		      the control_camerarx_core register.
+		      This node is meant to replace the "camerrx_control"
+		      reg entry above but "camerrx_control" is still
+		      handled for backward compatibility.
 
 CAL supports 2 camera port nodes on MIPI bus. Each CSI2 camera port nodes
 should contain a 'port' child node with child 'endpoint' node. Please
@@ -25,13 +30,12 @@ Example:
 		ti,hwmods = "cal";
 		reg = <0x4845B000 0x400>,
 		      <0x4845B800 0x40>,
-		      <0x4845B900 0x40>,
-		      <0x4A002e94 0x4>;
+		      <0x4845B900 0x40>;
 		reg-names = "cal_top",
 			    "cal_rx_core0",
-			    "cal_rx_core1",
-			    "camerrx_control";
+			    "cal_rx_core1";
 		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+		ti,camerrx-control = <&scm_conf 0xE94>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-- 
2.17.1

