Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2BB4EBBD1
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 09:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243820AbiC3HfT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 03:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243806AbiC3HfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 03:35:15 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0ABE2128C3;
        Wed, 30 Mar 2022 00:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648625610; x=1680161610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OTL+TBGd3jPSesaSKnW4G1kZ6EDpvl5CmgzRjZJC8sA=;
  b=KtYPhsgjfbOYFjHBPqQK9datcF89psfFOH0Auv7N6NgTf3TRg0LewXQ9
   QLhFSCN5Y8sHnW+J9hUMYAyySQ/BJDhMSOSc2y0amHuDQtbHXx3HJ7buK
   JvfkKmWj7xHvemNbiw11ywQxiS1EIvd+1WeAc7hTJ7NZftX5i54hK7C2J
   CFazCx6sCXlQH+6qQ/WRJoo1L0OzxqiNTRJOlSSvby78p8MEax7tj3SpF
   M1KLIBsJuWc53bUDGBUTBYlT4hWtF2VRXuDugoHEF3SvFk9Qk+AEYSLzY
   yrKdvntn4B6sLp4bA54PzURKiUD1tBhLLJ8eU7MJhIilGfJ/z2rbXOtJ4
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="246971830"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="246971830"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:33:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="695012346"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:33:11 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id ECD0520621;
        Wed, 30 Mar 2022 10:33:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nZSpp-002T7b-D5; Wed, 30 Mar 2022 10:33:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: Convert Dongwoon dw9807-vcm bindings to json-schema
Date:   Wed, 30 Mar 2022 10:33:40 +0300
Message-Id: <20220330073341.588550-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220330073341.588550-1-sakari.ailus@linux.intel.com>
References: <20220330073341.588550-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the old text based dw9807-vcm chip DT bindings to json-schema.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/i2c/dongwoon,dw9807-vcm.txt         |  9 ----
 .../media/i2c/dongwoon,dw9807-vcm.yaml        | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 9 deletions(-)
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
index 0000000000000..aae246ca3fcf5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
@@ -0,0 +1,41 @@
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
+  compatible:
+    const: dongwoon,dw9807-vcm
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
+            compatible = "dongwoon,dw9807-vcm";
+            reg = <0x0e>;
+        };
+    };
+...
-- 
2.30.2

