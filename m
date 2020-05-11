Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA361CE4E0
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 21:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731375AbgEKT4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 15:56:11 -0400
Received: from v6.sk ([167.172.42.174]:52478 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729049AbgEKT4L (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 15:56:11 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 77C45610CF;
        Mon, 11 May 2020 19:55:39 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 1/2] dt-bindings: sound: Add Marvell MMP Audio Clock Controller binding
Date:   Mon, 11 May 2020 21:55:33 +0200
Message-Id: <20200511195534.1207927-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511195534.1207927-1-lkundrak@v3.sk>
References: <20200511195534.1207927-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This describes the bindings for a controller that generates master and bit
clocks for the I2S interface.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../clock/marvell,mmp2-audio-clock.yaml       | 73 +++++++++++++++++++
 .../dt-bindings/clock/marvell,mmp2-audio.h    |  8 ++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.yaml
 create mode 100644 include/dt-bindings/clock/marvell,mmp2-audio.h

diff --git a/Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.yaml b/Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.yaml
new file mode 100644
index 000000000000..b86e9fbfa56d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/marvell,mmp2-audio-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell MMP2 Audio Clock Controller
+
+maintainers:
+  - Lubomir Rintel <lkundrak@v3.sk>
+
+description: |
+  The audio clock controller generates and supplies the clocks to the audio
+  codec.
+
+  Each clock is assigned an identifier and client nodes use this identifier
+  to specify the clock which they consume.
+
+  All these identifiers could be found in <dt-bindings/clock/marvell,mmp2.h>.
+
+properties:
+  compatible:
+    enum:
+      - marvell,mmp2-audio-clock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Audio subsystem clock
+      - description: The crystal oscillator clock
+      - description: First I2S clock
+      - description: Second I2S clock
+
+  clock-names:
+    items:
+      - const: audio
+      - const: vctcxo
+      - const: i2s0
+      - const: i2s1
+
+  '#clock-cells':
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/marvell,mmp2.h>
+    #include <dt-bindings/power/marvell,mmp2.h>
+
+    clocks@d42a0c30 {
+      compatible = "marvell,mmp2-audio-clock";
+      reg = <0xd42a0c30 0x10>;
+      clock-names = "audio", "vctcxo", "i2s0", "i2s1";
+      clocks = <&soc_clocks MMP2_CLK_AUDIO>,
+               <&soc_clocks MMP2_CLK_VCTCXO>,
+               <&soc_clocks MMP2_CLK_I2S0>,
+               <&soc_clocks MMP2_CLK_I2S1>;
+      power-domains = <&soc_clocks MMP2_POWER_DOMAIN_AUDIO>;
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/marvell,mmp2-audio.h b/include/dt-bindings/clock/marvell,mmp2-audio.h
new file mode 100644
index 000000000000..127b48ec0f0a
--- /dev/null
+++ b/include/dt-bindings/clock/marvell,mmp2-audio.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause) */
+#ifndef __DT_BINDINGS_CLOCK_MARVELL_MMP2_AUDIO_H
+#define __DT_BINDINGS_CLOCK_MARVELL_MMP2_AUDIO_H
+
+#define MMP2_CLK_AUDIO_SYSCLK		1
+#define MMP2_CLK_AUDIO_SSPA0		2
+#define MMP2_CLK_AUDIO_SSPA1		3
+#endif
-- 
2.26.2

