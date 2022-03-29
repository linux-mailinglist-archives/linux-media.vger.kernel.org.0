Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15E0C4EB53C
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 23:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233912AbiC2V2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 17:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiC2V2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 17:28:12 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254EA2274E6;
        Tue, 29 Mar 2022 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648589188; x=1680125188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RMvn66UyUzs7mgsM9+a4ywvQPdjRgsacm9kdwxNHKkY=;
  b=OTairNGWabxP3MIKs+vJLlsWdI8YmbsUJUaH/O/5WFP5XnUYPIQPSvLC
   BOerHO2kj3/BAthtEbgkmOS/4NN2eE4MeXK/V/9kD5YH/25hh6eaS4p+V
   5HyWLOBa3+ZSpO1nynsf9REeE50mhxlUdq2YhRzzLa3VZkhz7Rl0PUtPd
   +1jsZTCO+e0Vq3i4whv3+0xeduByxShwCf9wtAS+Lx5260XRE+J9Ffqzw
   JOHJkgsinjtD0RI7MmJDgbkCwyHyyl7r+w6bC/1gkIJB229Ecbv7zgNre
   C6Q+6MWD1MTjtWIOjZ19rdKnyO/ZF7/L8aFQoffBJOHBhfx6tvAOVmlEV
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259565452"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="259565452"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:26:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="639497307"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:26:26 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id B7835206F4;
        Wed, 30 Mar 2022 00:26:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nZJMd-002Spv-7D; Wed, 30 Mar 2022 00:26:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: Convert Dongwoon dw9807-vcm bindings to json-schema
Date:   Wed, 30 Mar 2022 00:26:54 +0300
Message-Id: <20220329212654.587451-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220329212654.587451-1-sakari.ailus@linux.intel.com>
References: <20220329212654.587451-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
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

