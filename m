Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249CA27B18C
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 18:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgI1QOT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 12:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgI1QOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 12:14:19 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B02A2C0613D0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:14:18 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id q9so1732573wmj.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vbHHP40xkg2uYk/UH9HSDIAS1kguxIesOVY207PSNWM=;
        b=FNsS1JaCt6m6mE/WfI8++x/y/+lxIpJoJGF+TsZB7s2VnQlOiprldL24g4EEBMhIdy
         pnZySMRZ91Rnxw8DhYbli2oDrlt/yfizs5leKTyZTtrLVjQVEsA4YoxPrtH8LtCPWE6F
         WtC37v5DzATeRgAGn9bfM8Iuw6HOBVgpTlswzf5QNYoDruGAsPupPfRvUDGCsL+YeAVT
         E9U25/3fjIddYm3az2X4p7/xeazYapF4KNfMDiGpQbUnZdYDnXNL60W83gjKuUWkq8JN
         hMpJLyNXdvsc9VRFFQehVCnOiw95MvMihshOxAi8s1ueIg6qZ6m5Aagp6fPid5/kCdF2
         g83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vbHHP40xkg2uYk/UH9HSDIAS1kguxIesOVY207PSNWM=;
        b=eBAEMhF5/zaWdSodi26WEvw8psGYUYN26/5JccZU/QZWfcJg+Bcf4QAnp+Fy30Wj31
         d/D69Jj45iAEQKKIWJGq02HTCCgmY7BPbfXmD/UltQjcMnQlDjykNDMIobtFt4HszQgW
         tKqb8DmuZNytSm0NHWCPJkOVVeW5UBZTdks/02jaZ73OtzTpLBAkkBmcJmh+YmTNoIts
         J9KUJlcmseYjl8Q0efC3nnPI09YXl2ePd43peCWI0laHFgwvGLVsYNAZrxMtZMV5TEBu
         H9TARKnnkscB4YM5Vy7jz4oCPSjpSQKttmPyXoHHsHqiOZWtdRiC6FlhWdJuhufZ7BHX
         O1hA==
X-Gm-Message-State: AOAM531L8q1oQdISvsQD4sJI253Xtvp1uXCCZnfhmHVHdTtS/EGNyAPP
        JFCk8SiI9jVXv2qTeuZDBnIWzA==
X-Google-Smtp-Source: ABdhPJz2Xorp3vXaFUhQ6uWGhTbeVdxJs51CEXnFKiSt47Nj3cKxXsEMNjeoSd7oepsFB9yy40noNg==
X-Received: by 2002:a7b:c848:: with SMTP id c8mr2254953wml.184.1601309657138;
        Mon, 28 Sep 2020 09:14:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:19c2:a71d:5af8:dbf6])
        by smtp.gmail.com with ESMTPSA id n4sm2004867wrp.61.2020.09.28.09.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 09:14:16 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil-cisco@xs4all.nl, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
Date:   Mon, 28 Sep 2020 18:14:08 +0200
Message-Id: <20200928161411.323581-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161411.323581-1-narmstrong@baylibre.com>
References: <20200928161411.323581-1-narmstrong@baylibre.com>
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

