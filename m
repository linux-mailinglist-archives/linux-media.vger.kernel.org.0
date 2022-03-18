Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C5F4DDF5C
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 17:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239393AbiCRQwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 12:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234838AbiCRQwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 12:52:39 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A52F461E;
        Fri, 18 Mar 2022 09:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647622280; x=1679158280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RMvn66UyUzs7mgsM9+a4ywvQPdjRgsacm9kdwxNHKkY=;
  b=l/cwYnpZNI4FTYrJ3E6qP9ztUshW04nPFY5hCxQoxy1Lf4dYJiuI6+OV
   zO/kZFBBcPX1sJS3cqIr/AQPi02RKIKbc3U089hB1th9uY/oB8qVPOji6
   Yup3hGq/sUd2bTKK0XPrFKMR8B/1ICraBH3HtYNrd5F7bda0HFAt/8tr7
   m1KiEURSkPa2iH2FEEa5FK+uVgnx3Xn5ULnOMKbrEQP79djEqB2eAaMoJ
   94JA7ErKX0XZ7wks7/uNy5RlEVl9yep9HmSsTWL7NPecZ50QQ8NwBcCY7
   oD1Pq236TbOMtcbqDj5JF9lEKoRhhKY6OYasBk/RNx2Z3bo8RlVI9+doR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="343608318"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="343608318"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 09:51:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="715560022"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 09:51:18 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1B43B2067A;
        Fri, 18 Mar 2022 18:51:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nVFou-0003BU-3I; Fri, 18 Mar 2022 18:51:20 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH 1/2] dt-bindings: Convert Dongwoon dw9807-vcm bindings to json-schema
Date:   Fri, 18 Mar 2022 18:51:18 +0200
Message-Id: <20220318165119.12191-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
References: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the old text based dw9807-vcm chip DT bindings to json-schema.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/i2c/dongwoon,dw9807-vcm.txt         |  9 ----
 .../media/i2c/dongwoon,dw9807-vcm.yaml        | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
deleted file mode 100644
index c4701f1eaaf63..0000000000000
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Dongwoon Anatech DW9807 voice coil lens driver
-
-DW9807 is a 10-bit DAC with current sink capability. It is intended for
-controlling voice coil lenses.
-
-Mandatory properties:
-
-- compatible: "dongwoon,dw9807-vcm"
-- reg: I2C slave address
diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
new file mode 100644
index 0000000000000..0cf153ed547fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2018, 2021 Intel Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9807-vcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9807 voice coil lens driver
+
+maintainers:
+  - Sakari Ailus <sakari.ailus@linux.intel.com>
+
+description: |
+  DW9807 is a 10-bit DAC with current sink capability. It is intended for
+  controlling voice coil lenses.
+
+properties:
+
+  compatible:
+    const: "dongwoon,dw9807-vcm"
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
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        lens@e {
+            compatible = "dongwoon,dw9807-vcm";
+            reg = <0x0e>;
+        };
+    };
+...
-- 
2.30.2

