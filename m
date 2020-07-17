Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C80223012
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 02:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgGQAp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 20:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgGQAp1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 20:45:27 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7568DC061755;
        Thu, 16 Jul 2020 17:45:27 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id d27so6455316qtg.4;
        Thu, 16 Jul 2020 17:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f06cvpi9PWuBoxMm0Gzuv9nuHcw9zMoeEWnf83uw1Mo=;
        b=M9HkEjUjggMDAtq+GS+06pLwO1Y4rENNOREAYuxSImzoYYHmRaVt0mofX0dUOkbbOG
         l25z+oK8NHfWql1DA5PSu+Gjoc9qKLkRkPwn3aGKow8yCy5raUY+Mtha7s7sNiACHd+w
         WdZayDeK1UI+es2Pt8AyYezDcs6ikFARfOZd6fyRFn9EuZW++wwoh6Gbq3DrUhafQ39j
         /OJoQ9TaNAToUOI+Pshz2o/VvBzzJOuz/hvw+hXPydGwM6PVPOLoawS1DNCCCH96tHwz
         JUIxP9+edrb3J/Dojg2wrsRhS7Cd5PXLHrcUtJl1jfI4c0ZvGi4ofj0DPIwgk/y2/7wl
         im+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f06cvpi9PWuBoxMm0Gzuv9nuHcw9zMoeEWnf83uw1Mo=;
        b=mHYPq0+eD9oCm+Urp3DjdP4q1iFHzaLzsw44N32xSrxdqB3kMbp+WR8nthXH6RZoIQ
         fDzzRbFIYJLkMYQVqiGms9BCnCWUNrGHTXXqleaZ0zkic9L263gg7G4T29izaeCyzMjw
         4qNIWkgg5Kqm1iZGsHyk1mnj4+iUUcskkFYNCnhfAVZnYF5nTDE2rkiXQy3KYt9og2G1
         mD3+M8KVCVqJ+9wHj6RYFL7OLI8E8cyIW4q7oiRqewVgrWN8lvTtY0D5+5nfePi2XLXL
         jprV4yiMREoN7igpxOvtn2EXzgTqe7sgOHB6EvS63/7GOKvIVsL4ivsRM0Tw917lglh0
         dIHA==
X-Gm-Message-State: AOAM530HAi+P0TiVKk39HY1ecG3Brpn1bwUcV1ryrsn5tuBR9Rxc//Vr
        Tn4pQ6ca7iMc24lRIAOK7ptilazoaI8A0w==
X-Google-Smtp-Source: ABdhPJwjqGt8259C3SPA5JahBYjSH0Wuw6JUFRPZ5VzyUFcs33USrVhX2r1dHeAqlVGpLb3bFg6I4g==
X-Received: by 2002:ac8:729a:: with SMTP id v26mr8025837qto.362.1594946726463;
        Thu, 16 Jul 2020 17:45:26 -0700 (PDT)
Received: from localhost.localdomain ([192.58.132.250])
        by smtp.gmail.com with ESMTPSA id y22sm8890042qth.46.2020.07.16.17.45.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jul 2020 17:45:25 -0700 (PDT)
From:   Santiago Hormazabal <santiagohssl@gmail.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org
Cc:     Santiago Hormazabal <santiagohssl@gmail.com>
Subject: [PATCH 2/3] media: kt0913: device tree binding
Date:   Thu, 16 Jul 2020 21:44:40 -0300
Message-Id: <20200717004441.116248-3-santiagohssl@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200717004441.116248-1-santiagohssl@gmail.com>
References: <20200717004441.116248-1-santiagohssl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document bindings for the kt0913 AM/FM radio tuner.

Signed-off-by: Santiago Hormazabal <santiagohssl@gmail.com>
---
 .../bindings/media/i2c/ktm,kt0913.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml b/Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml
new file mode 100644
index 000000000000..2c3d1795da43
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 Santiago Hormazabal <santiagohssl@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ktm,kt0913.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device-Tree bindings for the KTMicro KT0913 FM/AM radio tuner.
+
+maintainers:
+  - Santiago Hormazabal <santiagohssl@gmail.com>
+
+description: |-
+  The KT0913 is a low cost, low components FM/AM radio chip.
+  It uses the I2C protocol for operation.
+
+properties:
+  compatible:
+    const: ktm,kt0913
+
+  reg:
+    description: I2C device address
+    const: 0x35
+
+  ktm,anti-pop:
+    description:  |
+      Selects the DAC Anti-Pop capacitor. Possible values are
+      0 thru 3, which corresponds to 100uF (default), 60uF, 20uF or 10uF.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    enum: [0, 1, 2, 3]
+
+  ktm,refclk:
+    description:  |
+      Selects the reference clock used on the KT0913. Possible
+      values are 0 thru 9, which corresponds to 32.768kHz (default),
+      6.5MHz, 7.6MHz, 12MHz, 13MHz, 15.2MHz, 19.2MHz, 24MHz, 26MHz, 38kHz.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    enum: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
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
+        kt0913: fm-am-tuner@35 {
+            compatible = "ktm,kt0913";
+            reg = <0x35>;
+            ktm,anti-pop = <0x01>;
+            ktm,refclk = <0x00>;
+        };
+    };
+...
-- 
2.24.1

