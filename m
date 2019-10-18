Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 935B3DC895
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410601AbfJRPcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:32:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37070 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410589AbfJRPcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:05 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW30J064225;
        Fri, 18 Oct 2019 10:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412724;
        bh=j99x0LUGCJ69WgqO6pLApz0kcnPMoOP7gpKZ5+4Wc4s=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=PwrYcDffNRGqHy/KOEkoUP4W1d7im000TzLudCw09ioujSpSBiOyj4S0hkjVuhEOJ
         PtjfBkOwWAxjslmbJJmR1sRus/o2DYrbDh/VcxysCEjTTuv595wHJ2hW1eoEb7hMyy
         s2Vx2U4aIon7Med1lBM5XDVQoShPFYlIwG1q0gUg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFW3et084570
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:32:03 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:31:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:03 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15F080266;
        Fri, 18 Oct 2019 10:32:03 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 01/19] dt-bindings: media: cal: update binding to use syscon
Date:   Fri, 18 Oct 2019 10:34:19 -0500
Message-ID: <20191018153437.20614-2-bparrot@ti.com>
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

Update Device Tree bindings for the CAL driver to use syscon to access
the phy config register instead of trying to map it directly.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 Documentation/devicetree/bindings/media/ti-cal.txt | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
index ae9b52f37576..782f801b12a9 100644
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
+- syscon-camerrx: phandle to the device control module and offset to the
+		  control_camerarx_core register
+		  This node is meant to replace the "camerrx_control" reg
+		  entry above but "camerrx_control" is still handled
+		  for backward compatibility.
 
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
+		syscon-camerrx = <&scm_conf 0xE94>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-- 
2.17.1

