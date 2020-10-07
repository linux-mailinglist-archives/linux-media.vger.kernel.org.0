Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFA6286188
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 16:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgJGOtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 10:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728571AbgJGOtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 10:49:41 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAD5C061755;
        Wed,  7 Oct 2020 07:49:41 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 42646634C87;
        Wed,  7 Oct 2020 17:48:55 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 026/106] dt-bindings: mipi-ccs: Add bus-type for C-PHY support
Date:   Wed,  7 Oct 2020 17:49:37 +0300
Message-Id: <20201007144937.27609-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007135225.GA125839@bogus>
References: <20201007135225.GA125839@bogus>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bus-type property is required for C-PHY support. Add it, including
values for CCP2 and CSI-2 D-PHY.

Also require the bus-type property. Effectively all new sensors are MIPI
D-PHY or C-PHY that cannot be told apart without the bus-type property.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index a386ee246956..1d90767a6196 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -77,9 +77,17 @@ properties:
           data-lanes:
             minItems: 1
             maxItems: 8
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
+          - bus-type
 
 required:
   - compatible
@@ -112,6 +120,7 @@ examples:
                     remote-endpoint = <&csi2a_ep>;
                     link-frequencies = /bits/ 64 <199200000 210000000
                                                   499200000>;
+                    bus-type = <4>;
                 };
             };
         };
-- 
2.27.0

