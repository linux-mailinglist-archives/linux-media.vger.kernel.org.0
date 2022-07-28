Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD9C583DD9
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 13:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236650AbiG1LmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 07:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236734AbiG1Llv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 07:41:51 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243142641
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 04:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1436; q=dns/txt; s=iport;
  t=1659008510; x=1660218110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DLEp0o3Tg9b97BEPc9VE4jjf3IOnWujLqJ4rv8kbZVk=;
  b=HPup/33B3G0EHwyhrlr7eZSm8ifwIBjvPvVAxsK46TDqcZpc/bPocTDW
   9x9l+QL9mNEXyWuJwD6vecZw5/rfyyK/j5709OdUqS1wKGMdL6apbVuQR
   sOjPpg6VYhHPKSNKDjOJe6Wj491e5pPJd0DUSk55CBfbbr/JqGdfwkbtv
   Y=;
X-IronPort-AV: E=Sophos;i="5.93,198,1654560000"; 
   d="scan'208";a="3279439"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 Jul 2022 11:40:43 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 26SBegI4010979;
        Thu, 28 Jul 2022 11:40:43 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>, devicetree@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: media: add cat24c208 bindings
Date:   Thu, 28 Jul 2022 13:40:48 +0200
Message-Id: <20220728114050.2400475-4-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728114050.2400475-1-hljunggr@cisco.com>
References: <20220728114050.2400475-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-10.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
 .../bindings/media/i2c/onnn,cat24c208.yaml    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
new file mode 100644
index 000000000000..e1c861335538
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
@@ -0,0 +1,40 @@
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
+
+properties:
+  compatible:
+    const: onnn,cat24c208
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        lens@e {
+            compatible = "onnn,cat24c208";
+            reg = <0x31>;
+        };
+    };
+...
-- 
2.37.1

