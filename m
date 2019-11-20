Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA52910385D
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 12:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbfKTLOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 06:14:53 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:36672 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729013AbfKTLOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 06:14:38 -0500
Received: by mail-wr1-f47.google.com with SMTP id z3so746801wru.3
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 03:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ja7kn8nM5rQg+IdSoiS0Hj6iA3DSp06ChG/PAIh+vCY=;
        b=yDKsahxL4XEoVTSy9nI9vw6XP4e0ElslXK2PKtL1dSHo0DKVnDOCN7B+ptZDtjfvN/
         RZdtvW9hYYy2wtEZmwnr0dqku1ywWgdHJTjgcmAOwuWWo1QQK98mEEYLDSb9dv5sWv+K
         z9mDI9XIj1D5chjio5BHM3FirH67Ih7oucgqayFM4uxsHOqDoeurQWgaqMLeE3WUtvnl
         9wEVug9zAW7upPRi5AiKDJ/NtLpr33gPro8NWKIJ03yQv8QNO05EuF+v3tKQKjTzRQbg
         hYUiIdB2P/YSQZfEwIOqAhsXSLOP3Cy+tluNXV69i28MsNFb/HuHAtVNF4PKJptluxJV
         t9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ja7kn8nM5rQg+IdSoiS0Hj6iA3DSp06ChG/PAIh+vCY=;
        b=X1P45+73mE4vPU7trLFC8XpYI6eKxCekeh0oUb9sSDFIKuVjsIhMdSF9v1rqwugrrl
         +8e8FyHoEspi87lpux703BHxLsW+IG6rDNp/a9xWLeBzMQqkw8SH1RK6LRi8Wkrm4lT1
         gBkeu5mOzQ3MNHcgoI86rMN8OsyzKFsX0kQ2p3aPqz/649bWJz+TL2W0iTVZU01bjoYk
         R/XPF8bM1FkCD7bya1wyPnpFjsNbD4jcMsSy8bauUy50a/GNSqroMBSd6V8Heu0Msnf5
         mG9PoAwTOnZagthPSK0GzN42jihh2eVj9IWpypbDHB92LIOnoGdeCYhuE5vHAPjF06RQ
         QgEA==
X-Gm-Message-State: APjAAAWMvp6HqDqD8pyiwQvE4f7HRS928wa3ZErwbj9sKIo/OCjKB64C
        HlQP/JKDMMWKpfcOdLwDNiEd+A==
X-Google-Smtp-Source: APXvYqwH4aS6TrfN/psjDpRkojuL6BjXTzCTMYaIzigeYCPayBYWGt9XP2jw+vQf19vd5P/yzoZvcg==
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr2647778wro.314.1574248475978;
        Wed, 20 Nov 2019 03:14:35 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u1sm6061748wmc.3.2019.11.20.03.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 03:14:35 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: media: amlogic,gx-vdec: add bindings for G12A family
Date:   Wed, 20 Nov 2019 12:14:28 +0100
Message-Id: <20191120111430.29552-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191120111430.29552-1-narmstrong@baylibre.com>
References: <20191120111430.29552-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings to support the Amlogic Video Decoder on the Amlogic G12A
family.

For the G12A family, a supplementary clock is needed to operate the
HEVC/VP9 decoder.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/media/amlogic,gx-vdec.yaml       | 57 +++++++++++++++----
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
index 878944867d6e..8ea979bb97e6 100644
--- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
@@ -27,12 +27,15 @@ description: |
 
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+        - enum:
+          - amlogic,gxbb-vdec # GXBB (S905)
+          - amlogic,gxl-vdec # GXL (S905X, S905D)
+          - amlogic,gxm-vdec # GXM (S912)
+        - const: amlogic,gx-vdec
       - enum:
-        - amlogic,gxbb-vdec # GXBB (S905)
-        - amlogic,gxl-vdec # GXL (S905X, S905D)
-        - amlogic,gxm-vdec # GXM (S912)
-      - const: amlogic,gx-vdec
+        - amlogic,g12a-vdec # G12A (S905X2, S905D2)
 
   interrupts:
     minItems: 2
@@ -59,13 +62,9 @@ properties:
 
   clocks:
     minItems: 4
+    maxItems: 5
 
-  clock-names:
-    items:
-      - const: dos_parser
-      - const: dos
-      - const: vdec_1
-      - const: vdec_hevc
+  clock-names: true
 
   amlogic,ao-sysctrl:
     description: should point to the AOBUS sysctrl node
@@ -77,6 +76,42 @@ properties:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/phandle
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,gx-vdec
+
+    then:
+      properties:
+        clock-names:
+          minItems: 4
+          items:
+            - const: dos_parser
+            - const: dos
+            - const: vdec_1
+            - const: vdec_hevc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-vdec
+
+    then:
+      properties:
+        clock-names:
+          minItems: 5
+          items:
+            - const: dos_parser
+            - const: dos
+            - const: vdec_1
+            - const: vdec_hevc
+            - const: vdec_hevcf
+
 required:
   - compatible
   - reg
-- 
2.22.0

