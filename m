Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2125D2C6345
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 11:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbgK0KiM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 05:38:12 -0500
Received: from retiisi.eu ([95.216.213.190]:44904 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729250AbgK0KiM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 05:38:12 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 485DD634CCC;
        Fri, 27 Nov 2020 12:37:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 28/29] dt-bindings: mipi-ccs: Add bus-type for C-PHY support
Date:   Fri, 27 Nov 2020 12:33:24 +0200
Message-Id: <20201127103325.29814-29-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
References: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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

