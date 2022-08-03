Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3A22588860
	for <lists+linux-media@lfdr.de>; Wed,  3 Aug 2022 09:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237360AbiHCH6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Aug 2022 03:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237324AbiHCH6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 03:58:10 -0400
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9963120F;
        Wed,  3 Aug 2022 00:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1442; q=dns/txt; s=iport;
  t=1659513489; x=1660723089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y0WnfnASAaSNWqN6hhhY0Go5IWPq3oMhskgNHoWb0YE=;
  b=lKI5gb4w5236j9/9IzMppTOGmKAZWheoFdquOJfwcXB/nWtE/XziT2K/
   vdBMo3Ly3Yimxq3MtJq3mf5jA2ydEFtVFhiKIV+96nax5UNnheiOvZ/mn
   SF3t4Z9Yd+nuYewoERJX7dKejVdUsTg8TlSLlpXDRpfg6LYFJir0D7wYZ
   U=;
X-IronPort-AV: E=Sophos;i="5.93,213,1654560000"; 
   d="scan'208";a="3358740"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 03 Aug 2022 07:58:07 +0000
Received: from office-260.rd.cisco.com ([10.47.77.162])
        by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 2737w5SB024084;
        Wed, 3 Aug 2022 07:58:06 GMT
From:   Erling Ljunggren <hljunggr@cisco.com>
To:     linux-media@vger.kernel.org
Cc:     Erling Ljunggren <hljunggr@cisco.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 3/5] dt-bindings: media: add cat24c208 bindings
Date:   Wed,  3 Aug 2022 09:58:48 +0200
Message-Id: <20220803075850.1196988-4-hljunggr@cisco.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803075850.1196988-1-hljunggr@cisco.com>
References: <20220803075850.1196988-1-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.77.162, [10.47.77.162]
X-Outbound-Node: aer-core-1.cisco.com
X-Spam-Status: No, score=-10.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
index 000000000000..590cdf0cbdc1
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
+        cat24c208@31 {
+            compatible = "onnn,cat24c208";
+            reg = <0x31>;
+        };
+    };
+...
-- 
2.37.1

