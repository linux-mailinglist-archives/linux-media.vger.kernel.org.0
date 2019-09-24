Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 864DFBD021
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 19:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404492AbfIXQm0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 12:42:26 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58766 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404333AbfIXQmZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 12:42:25 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgM8A054436;
        Tue, 24 Sep 2019 11:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569343342;
        bh=r6LwEruPm5l4y2o3OnL1GB+d2mHbAkCg6/wyb8egeu8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=XJhw9QwxXyzAJmAXZ0T8NQUnUPPsfE4c1vQ9cGcs3mFunqlt2Y4X132mDna1nid2u
         oYf6QcUrbU8l/7gvc0oowHCR6PwcrXa15NwvRkjuhm1ymjfnJHLUfbCjQ8txR1sLHf
         QWwki4neMoZqImRFLly2IlFYiTCOCKdTMm37U2io=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8OGgMIm079156
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Sep 2019 11:42:22 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 24
 Sep 2019 11:42:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 24 Sep 2019 11:42:15 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgCQX073229;
        Tue, 24 Sep 2019 11:42:21 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 5/8] media: dt-bindings: ov2659: add powerdown/reset-gpios optional property
Date:   Tue, 24 Sep 2019 11:44:11 -0500
Message-ID: <20190924164414.21897-6-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190924164414.21897-1-bparrot@ti.com>
References: <20190924164414.21897-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add powerdown-gpios and reset-gpios to the list of optional properties
for the OV2659 camera sensor.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 Documentation/devicetree/bindings/media/i2c/ov2659.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
index cabc7d827dfb..92989a619f29 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov2659.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
@@ -12,6 +12,12 @@ Required Properties:
 - clock-names: should be "xvclk".
 - link-frequencies: target pixel clock frequency.
 
+Optional Properties:
+- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
+  Active high with internal pull down resistor.
+- reset-gpios: reference to the GPIO connected to the resetb pin, if any.
+  Active low with internal pull up resistor.
+
 For further reading on port node refer to
 Documentation/devicetree/bindings/media/video-interfaces.txt.
 
@@ -27,6 +33,9 @@ Example:
 			clocks = <&clk_ov2659 0>;
 			clock-names = "xvclk";
 
+			powerdown-gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
+
 			port {
 				ov2659_0: endpoint {
 					remote-endpoint = <&vpfe_ep>;
-- 
2.17.1

