Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A9227F340
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 22:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730482AbgI3UTU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 16:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730457AbgI3UTT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 16:19:19 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDC6C0613D1;
        Wed, 30 Sep 2020 13:19:18 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B10D0634C91;
        Wed, 30 Sep 2020 23:19:01 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [RESEND PATCH 026/100] dt-bindings: ccs: Add bus-type for C-PHY support
Date:   Wed, 30 Sep 2020 23:19:14 +0300
Message-Id: <20200930201914.31377-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bus-type property is required for C-PHY support. Add it, including
values for CCP2 and CSI-2 D-PHY.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../devicetree/bindings/media/i2c/mipi,ccs.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/mipi,ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi,ccs.yaml
index 6ac01ec8610c..b7908f6e48b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi,ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi,ccs.yaml
@@ -114,6 +114,13 @@ properties:
                 - const: 6
                 - const: 7
                 - const: 8
+          bus-type:
+            description: The type of the data bus.
+            oneOf:
+              - const: 1 # CSI-2 C-PHY
+              - const: 3 # CCP2
+              - const: 4 # CSI-2 D-PHY
+
         required:
           - link-frequencies
           - data-lanes
@@ -148,6 +156,7 @@ examples:
                     remote-endpoint = <&csi2a_ep>;
                     link-frequencies = /bits/ 64 <199200000 210000000
                                                   499200000>;
+                    bus-type = <4>;
                 };
             };
         };
-- 
2.27.0

