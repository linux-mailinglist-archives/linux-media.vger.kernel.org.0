Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD57239D68
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 04:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgHCCJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Aug 2020 22:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgHCCJ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Aug 2020 22:09:56 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E50C06174A;
        Sun,  2 Aug 2020 19:09:56 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id d14so33928748qke.13;
        Sun, 02 Aug 2020 19:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f06cvpi9PWuBoxMm0Gzuv9nuHcw9zMoeEWnf83uw1Mo=;
        b=SXy1NbbJm9V9ImmArHk7Tl8JtJCQrmcAs02mFqwKGr+jykTILmluz4Fwee6dUXBiWv
         HpvbyDW7Cb81PF6N5PEyr5hy0m3O5GYwPTFrHLC4zuHFEHzeqPZwqlSGd5suPvn7YYlM
         e9EN/rV+0npypLAcHJdS/M4QRNDDM+cKJY7n98YI3qqTL8pLaRgrtkoy+6HchXqgll8e
         utSpABoOLye3U+Rpri2HiRVQXnXMh+d70M6J4vcCLZSzdioJ6T42dG1oQGzMygM6HBUO
         kTzmX4dCq/hBWeLPnviiCJZGoci7wBeZxFJi2kR52CRUXqwrLOW6ajkLArXPXXK0r0TF
         IXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f06cvpi9PWuBoxMm0Gzuv9nuHcw9zMoeEWnf83uw1Mo=;
        b=a6Fwi6GLlklgFBMqdBTlRr5fF8f4+0fb0hkPAame1499onnxMExAPrkcKCz1gkx1WZ
         HtapXjm4wmNI0MLLaGGkfPbk8phs9LR5dVn3wi/zPVzfOH62WaAi1HjwcXtartbGFzrw
         0in4ld0Se5zDgPMW/1QVlvnxXygjTXUwAJ2Hctqok+bigI4WBBqFhZaEHsOs7g5Fd8kA
         lhuE9H16XdhoVKE60I1+jN2F4qLUAEX6tCkYuUVhO11faRxIfg1AYcGLdy+r34onVA4k
         qtzMV5en6bAnBi3xYzwKa0p8eRPw1YuZACjeONtvIQDCpY1abbdkMHSzCEGg2Ci1BwpU
         mbYQ==
X-Gm-Message-State: AOAM5330VdRlgPAWD+2Z63fFh/xTVL3TNiyYwz9SHyLfQj4uCo7t6Si8
        hh+lX0ZUuBn0k6ZX21UMAQE8qg0CgH4=
X-Google-Smtp-Source: ABdhPJytGncL9J+R0ctFLnptCnI5END8h85/IZHQPQZTppq/cda59XFtCIZU1dcGIQYUMJUWoY2wgA==
X-Received: by 2002:a37:4e4d:: with SMTP id c74mr14079787qkb.311.1596420595562;
        Sun, 02 Aug 2020 19:09:55 -0700 (PDT)
Received: from localhost.localdomain ([190.189.67.136])
        by smtp.gmail.com with ESMTPSA id d124sm18458083qkg.65.2020.08.02.19.09.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2020 19:09:55 -0700 (PDT)
From:   Santiago Hormazabal <santiagohssl@gmail.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Santiago Hormazabal <santiagohssl@gmail.com>
Subject: [PATCH 2/3] media: kt0913: device tree binding
Date:   Sun,  2 Aug 2020 23:09:20 -0300
Message-Id: <20200803020921.64151-3-santiagohssl@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200803020921.64151-1-santiagohssl@gmail.com>
References: <20200803020921.64151-1-santiagohssl@gmail.com>
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

