Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB292A080A
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 15:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgJ3Ohe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 10:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgJ3Ohd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 10:37:33 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49873C0613CF
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 07:37:33 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id a9so6691774wrg.12
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LzZh3XDG0mukcB0i6UGoQqeuQTlDt+ZadapYwoHki6w=;
        b=PKvJHqcNYdJW++F0cK3QdV1zjaBzxTRCv5vhX4WWc74HsnkNOW2boPcbIEAfum+fBi
         B/P5FaDTDLDZChtNdf9wwJl4BVBpNRTymjwisnPGtxZZDgV+bZdti6RZ05YHlxPId9ZW
         bW8JMK6AHibUdKa0nvDqmyyGGx6BeCS5UC1BKuOwbaX3kUDdL/qsiiVX2a/q6m4CmnXp
         SSHXiEZZD4rbLZGzwGrHP0BGY4oJzENhhdR716+8wI3YGc+oK9Kp4UcT8M7YNlkvwCvj
         iotghBj+ZqloR71rF4GFxqcpz/owyfaaF4Jjpwujdp6oJIhgcPQiWk+1lhsMJkwh5B08
         H4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LzZh3XDG0mukcB0i6UGoQqeuQTlDt+ZadapYwoHki6w=;
        b=BZdqbfWVwtbFckmvrsItOJklHxiNG5X5WeXEKgc6Y8DMEZ9bj8RqowxwzNxhrBqCiG
         QdhItyDeWE4wZbabLkp8IRUPja59z8tytTUTWhZ/lP3yCI5CHv1H+ATxqoYNhtN/zAbF
         5bOIJOvdeqs+dq6Syny41JU3NS7qOX1gWeBaN8bsJ41+Coi1A4pvmh9CIkyyf217wU0c
         38VL+eLwIDpG9bsvMsYnVgXyX/izueCw68RE8aVyZhSoFITszHnYc+hpCYbHoKYddPHK
         dpQEEYh+5ZRDqa0DiTewlXX64SnyHWOhr1OirKTbcAaVaKR5REbPXVWsI6ujdo4KglGV
         BCYw==
X-Gm-Message-State: AOAM533IODAKzgE+8VwVzrYtj2eGkwQAzfrmoz7l4+3MOxAtQFqYctg3
        6jmcNDMicfVrWWsLrF13ILGxjA==
X-Google-Smtp-Source: ABdhPJwfmKHE9tpJbPP/m+MZUzeVqC6HJIZFOAipny4H8X0b0Mu1A+//qbtSHVOIRt8w+qwQ/uSX+w==
X-Received: by 2002:a5d:4747:: with SMTP id o7mr3689083wrs.423.1604068651798;
        Fri, 30 Oct 2020 07:37:31 -0700 (PDT)
Received: from localhost.localdomain ([37.172.114.188])
        by smtp.gmail.com with ESMTPSA id y200sm351481wmc.23.2020.10.30.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 07:37:31 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil@xs4all.nl, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
Date:   Fri, 30 Oct 2020 15:37:12 +0100
Message-Id: <20201030143715.577641-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030143715.577641-1-narmstrong@baylibre.com>
References: <20201030143715.577641-1-narmstrong@baylibre.com>
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

