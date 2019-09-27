Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87589C0BA7
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbfI0Spi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:45:38 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46754 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbfI0SpW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:45:22 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIjK60094646;
        Fri, 27 Sep 2019 13:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609920;
        bh=r6LwEruPm5l4y2o3OnL1GB+d2mHbAkCg6/wyb8egeu8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=btR3AXi8A0NVJpXFWkNUtp/Jsg7c5FcFHhYM8x4mASraX60dX7RDWAHjPQVB48hH8
         D6DnY/hqbqxr0l3BrkPmcb40ran9lxH2lWKluxpY5y+pvBrpqokWc5gWF1iXlABpBP
         K/NMV40MJS+BBZpCR9G/zT1wItaLHpkuAjWZ/kWo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIjKmY074980
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:45:20 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:45:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:45:12 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIjEVa122194;
        Fri, 27 Sep 2019 13:45:20 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 5/8] media: dt-bindings: ov2659: add powerdown/reset-gpios optional property
Date:   Fri, 27 Sep 2019 13:47:19 -0500
Message-ID: <20190927184722.31989-6-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927184722.31989-1-bparrot@ti.com>
References: <20190927184722.31989-1-bparrot@ti.com>
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

