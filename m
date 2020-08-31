Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE162583E4
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 00:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbgHaWGY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 18:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730395AbgHaWGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 18:06:20 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0742FC061755;
        Mon, 31 Aug 2020 15:06:19 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id e5so5963850qth.5;
        Mon, 31 Aug 2020 15:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f06cvpi9PWuBoxMm0Gzuv9nuHcw9zMoeEWnf83uw1Mo=;
        b=dYGwCZahF4QF7kwO9xlGvLqbRlBAYcp0VWBlaMsUJnhVmbGXW/Mx0pOvWgp3n4x39+
         WyxSnh/ec2fzsRn3ZV77+WHdd35R3Egl2neA6TA3BkNdOU/JaNExuCAm9jTNfhVBhNhj
         3BuiPhVS6HhevL0iAv31d+wZZKEX0fPWF/HtYkcpFO9acOg7h851geN7EerCnkCMeJjD
         RD2Azb1tl9bZpLxRv467mFhRatm3b0uxpU3uGwJE4UPHn4sMeX8T8XaX1vFdu9VFdrZs
         r6LcHxpdT8GaVkUq69KrKu+JSrocgwAa6qOeJ83SJQRCYYXT8P3ScSIKUrosVlD9VCe6
         EFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f06cvpi9PWuBoxMm0Gzuv9nuHcw9zMoeEWnf83uw1Mo=;
        b=CXpzEFvZhY3KhOa4CDLKO9LQrWCzEvQMLLuTSpOlLxJTQng9HhiCnbj17C5FfJh1/X
         ErdhpUKHgUhfHXvARr/+BcqbrcDbiGB0bNzsng8jmShGV6Z8jgrI2R8GuLt+VsercwGY
         wouZZSA9sGaTOmG4nbGH7kjGrbGr6l3+Bmrq/TZnpDTcNWadfeM+0RuCJyNZqeVF9Lji
         EfkXV8/sKyZ+kWnRCkwKnmMFFEoOHHb8nRvuxzA9/QHea9Ir04k73GeSXCTS7JjCBgal
         arFz5VugTNKhWrdlBBzLfJXKsoYoXWgKMVMW7tZIIjvPWXahWL+6U5vzT0xZZBQa+6bx
         DKgA==
X-Gm-Message-State: AOAM531v9G8GRI+gH3c4RmXS9MxHSYkiRBphUE67rRgKDv9yNfVmJB9V
        B+jCBNyJ+lgIG5VMJE37PlVPV0PHF/C7/w+m
X-Google-Smtp-Source: ABdhPJzSiuTNIbOGmR+7k+q7vYYVas6DZOv6cS0taRrbi/uRO8oxA5bhQ5v6DVEIA4ac691SF203hg==
X-Received: by 2002:ac8:742:: with SMTP id k2mr3506683qth.101.1598911577953;
        Mon, 31 Aug 2020 15:06:17 -0700 (PDT)
Received: from localhost.localdomain ([190.189.67.136])
        by smtp.gmail.com with ESMTPSA id d10sm3051232qkk.1.2020.08.31.15.06.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 15:06:17 -0700 (PDT)
From:   Santiago Hormazabal <santiagohssl@gmail.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Santiago Hormazabal <santiagohssl@gmail.com>
Subject: [PATCH 3/3] media: kt0913: device tree binding
Date:   Mon, 31 Aug 2020 19:06:01 -0300
Message-Id: <20200831220601.20794-4-santiagohssl@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200831220601.20794-1-santiagohssl@gmail.com>
References: <20200831220601.20794-1-santiagohssl@gmail.com>
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

