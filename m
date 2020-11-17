Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E28F2B5B33
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 09:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgKQIou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 03:44:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgKQIot (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 03:44:49 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A60C0613CF
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 00:44:47 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id m6so5119400wrg.7
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 00:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LzZh3XDG0mukcB0i6UGoQqeuQTlDt+ZadapYwoHki6w=;
        b=m+XnfnUxTmcaf8SSzOQRSvg7cCdIGDLHhLFs1Z6EP9RGyPpK08t/tiOnxGxosSp2Uo
         9mgsojGSJ1UIRxYbsH3RWFflLarSd4RdCKczElvNWjNKVJnYhm4d4VgNJKjS4dDwOCYl
         2qixSc+qC7ldjQu/Aau5yoVE2txgXGJDA4CKfiazd1GQ8MaRYBu0JPU/cyJiLWRHMy53
         oig8SRkyYZ7lFjJyT0wVpuz/vheQ6sEiZeh3XjbECVxNvAXpqNFRL3EtSItyNUxu10Ee
         8Y7eDzaLqh7zQoKkXNXeO5Nx9Yiadny6igIKg3ZuOloWMn7h7BEahvNNsfbArmDVUHzO
         Q+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LzZh3XDG0mukcB0i6UGoQqeuQTlDt+ZadapYwoHki6w=;
        b=MOQgb7izJ4l5CQNlYw/QzMgIjNxkYuCypUS9LjIdeuxvAZ0+dJ9uYVKKw6BHCb4ERO
         uGrL3txy7MGUVvkonmTuQkJ+kPqT4qYla/0FFCHBVwVz4SFl85W1hH7xv450oYS4MdjQ
         QpgIUcRTytWxQ9nJlKv9yAcEXruSYVI5I0qKkybeeDqLZvTa/734GPC2gxeF6M9BPG3f
         Wf1c+gkK474BtxvEdYg8PsBVhZFWFZE8RxKLE9pXhP2xqlDk82IPFnnchaMsdUswCaf/
         e0zLxKcH3sPkrSY/tRvrMx8Xl2gkO6hZviFedW5ROvTtcFnTgzczznH+D993A274ZZr6
         HGVA==
X-Gm-Message-State: AOAM531L+Wxx350+PoTXxmQyOOKJimrCPnKN10P5IBBJGtM4rIxowbmC
        chto+6giPnZaqJToFtGI0yrtcg==
X-Google-Smtp-Source: ABdhPJz7Xwfri6Tcac3P5f5Sv4NXug1hdJ29ICgaVg7kkW6e9qOiofXFXarPzRH2khs9xkf2V3O+ZA==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr23510134wrv.355.1605602686559;
        Tue, 17 Nov 2020 00:44:46 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26])
        by smtp.gmail.com with ESMTPSA id s4sm25631423wro.10.2020.11.17.00.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 00:44:45 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil@xs4all.nl, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
Date:   Tue, 17 Nov 2020 09:44:37 +0100
Message-Id: <20201117084440.578540-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117084440.578540-1-narmstrong@baylibre.com>
References: <20201117084440.578540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GE2D is a 2D accelerator with various features like configurable blitter
with alpha blending, frame rotation, scaling, format conversion and colorspace
conversion.

This adds the bindings for the GE2D version found in the AXG SoCs Family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/amlogic,axg-ge2d.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
new file mode 100644
index 000000000000..bee93bd84771
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,axg-ge2d.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic GE2D Acceleration Unit
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,axg-ge2d
+
+  interrupts:
+    minItems: 1
+
+  reg:
+    minItems: 1
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    ge2d: ge2d@ff940000 {
+          compatible = "amlogic,axg-ge2d";
+          reg = <0xff940000 0x10000>;
+          interrupts = <150>;
+          clocks = <&clk_ge2d>;
+          resets = <&reset_ge2d>;
+    };
-- 
2.25.1

