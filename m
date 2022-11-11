Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFC7625B30
	for <lists+linux-media@lfdr.de>; Fri, 11 Nov 2022 14:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbiKKNaG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Nov 2022 08:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233869AbiKKNaE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Nov 2022 08:30:04 -0500
X-Greylist: delayed 65 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Nov 2022 05:30:01 PST
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD1560359;
        Fri, 11 Nov 2022 05:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1727; q=dns/txt; s=iport;
  t=1668173401; x=1669383001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fpoaqd45mwZJZyz8x5faOds/9H7dtWgFFewbkC5tH00=;
  b=BudeHa+3beCisGeeCokRGzGkb2wlPjVWuaV4h7LcRDPrPGvLx+EIgccQ
   kDgyLzrIcAzCML+D93hK5q2/OLjsVdkl9je4hyt1dobFXlOTC/Jyv46Li
   JQ6XgvzREruiuKLDyYAYFGH0u9ecPt0oLyb4cwOub+v8NcaPc1QLlriTz
   A=;
X-IronPort-AV: E=Sophos;i="5.96,156,1665446400"; 
   d="scan'208";a="4893680"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 11 Nov 2022 13:28:55 +0000
Received: from office-260.rd.cisco.com ([10.47.79.110])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 2ABDSsVQ020236;
        Fri, 11 Nov 2022 13:28:55 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>, devicetree@vger.kernel.org
Subject: [PATCH v4 3/5] dt-bindings: media: add cat24c208 bindings
Date:   Fri, 11 Nov 2022 14:29:04 +0100
Message-Id: <20221111132906.2212662-4-hljunggr@cisco.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221111132906.2212662-1-hljunggr@cisco.com>
References: <20221111132906.2212662-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.79.110, [10.47.79.110]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        SPF_HELO_PASS,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree bindings for new cat24c208 EDID EEPROM driver.

Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
---
 .../bindings/media/i2c/onnn,cat24c208.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
new file mode 100644
index 000000000000..492eecb3ab7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,cat24c208.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor CAT24C208 EDID EEPROM driver
+
+maintainers:
+  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
+
+description: |
+  CAT24C208 is a dual port i2c EEPROM designed for EDID storage.
+
+properties:
+  compatible:
+    const: onnn,cat24c208
+
+  reg:
+    maxItems: 1
+
+  input-connector:
+    description: |
+      Phandle to the video input connector, used to find
+      the HPD gpio and the connector label, both optional.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - input-connector
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cat24c208@31 {
+            compatible = "onnn,cat24c208";
+            reg = <0x31>;
+            input-connector = <&hdmi_connector_in>;
+        };
+    };
-- 
2.38.0

