Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0DEB0F46
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 14:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731897AbfILM6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 08:58:10 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35304 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731889AbfILM6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 08:58:10 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw8Jm014037;
        Thu, 12 Sep 2019 07:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568293088;
        bh=j+HKeEZmSB1veoiq7NiX6Zy7GtSnsB6vb/m4EQLJxDk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=o8J0BecuYZzBJ277xqpCE/XgoIuz8OmBqsbfV6LM4CHW36vrmRVJhB96PQXeYoXO7
         kZculiVnZID53sohlquD3yP/yQp1OTGXuroyGDpTHNP5hG5FK2iPud6RHFuR1KdX+q
         ZIVd0mPesNcMbNgHsUx3Ytla0NPI28m6crZIimQQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw8Br033477;
        Thu, 12 Sep 2019 07:58:08 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 07:58:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 07:58:07 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw4Zh095654;
        Thu, 12 Sep 2019 07:58:07 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 3/6] media: dt-bindings: ov2659: add powerdown-gpios optional property
Date:   Thu, 12 Sep 2019 08:00:04 -0500
Message-ID: <20190912130007.4469-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912130007.4469-1-bparrot@ti.com>
References: <20190912130007.4469-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add powerdown-gpios to the list of optional properties for the OV2659
camera sensor.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 Documentation/devicetree/bindings/media/i2c/ov2659.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
index cabc7d827dfb..f55204cce0cd 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov2659.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
@@ -12,6 +12,10 @@ Required Properties:
 - clock-names: should be "xvclk".
 - link-frequencies: target pixel clock frequency.
 
+Optional Properties:
+- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
+  Active is low.
+
 For further reading on port node refer to
 Documentation/devicetree/bindings/media/video-interfaces.txt.
 
@@ -27,6 +31,8 @@ Example:
 			clocks = <&clk_ov2659 0>;
 			clock-names = "xvclk";
 
+			powerdown-gpios = <&gpio6 14 GPIO_ACTIVE_LOW>;
+
 			port {
 				ov2659_0: endpoint {
 					remote-endpoint = <&vpfe_ep>;
-- 
2.17.1

