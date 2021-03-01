Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57466328240
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 16:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237028AbhCAPTU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 10:19:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60428 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237152AbhCAPSu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 10:18:50 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:39a1:f0e7:a696:18c8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C5B831F44E6E;
        Mon,  1 Mar 2021 15:18:06 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, benjamin.gaignard@collabora.com
Subject: [PATCH v3 1/5] dt-bindings: reset: IMX8MQ VPU reset
Date:   Mon,  1 Mar 2021 16:17:50 +0100
Message-Id: <20210301151754.104749-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document bindings for IMX8MQ VPU reset hardware block

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../bindings/reset/fsl,imx8mq-vpu-reset.yaml  | 54 +++++++++++++++++++
 include/dt-bindings/reset/imx8mq-vpu-reset.h  | 16 ++++++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml
 create mode 100644 include/dt-bindings/reset/imx8mq-vpu-reset.h

diff --git a/Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml b/Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml
new file mode 100644
index 000000000000..00020421c0e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/fsl,imx8mq-vpu-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MQ VPU Reset Controller
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
+
+description: |
+  The VPU reset controller is used to reset the video processor
+  unit peripherals. Device nodes that need access to reset lines should
+  specify them as a reset phandle in their corresponding node as
+  specified in reset.txt.
+
+  For list of all valid reset indices see
+    <dt-bindings/reset/imx8mq-vpu-reset.h> for i.MX8MQ.
+
+properties:
+  compatible:
+    items:
+      - const: fsl,imx8mq-vpu-reset
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+
+    vpu-reset@38320000 {
+        compatible = "fsl,imx8mq-vpu-reset", "syscon";
+        reg = <0x38320000 0x10000>;
+        clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/imx8mq-vpu-reset.h b/include/dt-bindings/reset/imx8mq-vpu-reset.h
new file mode 100644
index 000000000000..efcbe18177fe
--- /dev/null
+++ b/include/dt-bindings/reset/imx8mq-vpu-reset.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, Collabora
+ *
+ * i.MX7 System Reset Controller (SRC) driver
+ *
+ * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
+ */
+
+#ifndef DT_BINDINGS_VPU_RESET_IMX8MQ
+#define DT_BINDINGS_VPU_RESET_IMX8MQ
+
+#define IMX8MQ_RESET_VPU_RESET_G1	0
+#define IMX8MQ_RESET_VPU_RESET_G2	1
+
+#endif
-- 
2.25.1

