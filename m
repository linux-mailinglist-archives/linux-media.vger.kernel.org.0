Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82D79EE8A4
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729567AbfKDTbx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:31:53 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42502 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729546AbfKDTbx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:31:53 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVpdE104982;
        Mon, 4 Nov 2019 13:31:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895911;
        bh=tLf8SXtD5MIh4RuLfkAo79HCpF/i9eG4PtrsPy5Sv/A=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Nj8SYx0SVzVtL19U9EdyoJHtP6osyejNuF05gMOWfdnCGDXm+NqEe0eLylbA/N9Cv
         LHghvGesjlcGqOruEk64M12eBqsXPHq0OUnJZanB4xKa8z817knGd+j2FQ8jlQSz2B
         xS47YOHLX/SMQxHPHAxk35n1ePCsacO9eMvcdRgw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4JVpHC059224
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 13:31:51 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:31:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:31:36 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmd0096934;
        Mon, 4 Nov 2019 13:31:50 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 01/20] dt-bindings: media: cal: update binding to use syscon
Date:   Mon, 4 Nov 2019 13:31:21 -0600
Message-ID: <20191104193140.31145-2-bparrot@ti.com>
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

