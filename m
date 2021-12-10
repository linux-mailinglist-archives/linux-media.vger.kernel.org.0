Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9B44706F5
	for <lists+linux-media@lfdr.de>; Fri, 10 Dec 2021 18:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244445AbhLJR36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Dec 2021 12:29:58 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:42454 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S244446AbhLJR35 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Dec 2021 12:29:57 -0500
X-UUID: 4b3bb49e7aeb4cc39fcb24e7d8ad14d8-20211211
X-UUID: 4b3bb49e7aeb4cc39fcb24e7d8ad14d8-20211211
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <flora.fu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 650089352; Sat, 11 Dec 2021 01:26:19 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 11 Dec 2021 01:26:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Dec 2021 01:26:17 +0800
From:   Flora Fu <flora.fu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>,
        JB Tsai <jb.tsai@mediatek.com>
Subject: [PATCH 01/17] dt-bindings: mailbox: mediatek: Add APU mailbox compatible
Date:   Sat, 11 Dec 2021 01:25:49 +0800
Message-ID: <20211210172605.30618-2-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the mailbox compatible for the MediaTek APU.
The MT8192 and MT8195 SOC will use it.

Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../mailbox/mediatek,apu-mailbox.yaml         | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
new file mode 100644
index 000000000000..ffd0e1623955
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2021 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,apu-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek AI Processing Unit mailbox controller bindings
+
+description:
+  The APU mailbox controller provides access from the
+  application processor to the MediaTek AI Processing Unit.
+
+maintainers:
+  - Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mtk-apu-mailbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    apu_mailbox: apu_mailbox@19000000 {
+      compatible = "mediatek,mtk-apu-mailbox";
+      reg = <0x19000000 0x100>;
+      interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH 0>;
+      #mbox-cells = <1>;
+    };
-- 
2.18.0

