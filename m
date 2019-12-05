Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBF031143AF
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 16:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbfLEPef (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 10:34:35 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:38439 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729698AbfLEPeS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 10:34:18 -0500
Received: by mail-wr1-f53.google.com with SMTP id y17so4150160wrh.5
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2019 07:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KzKSFA37zQ+fSsnCSfsJqcJWA1YqoEpujyYe82jiosA=;
        b=1RAkL/YqqEmrVPedzEg2Pc0Ov3GvHhQDDskUsdP88FKftcpyQigTss9I7/RJeNaUWJ
         8SxDYfPOP10oekWk/HW52CxH3vycbaZGijkt/iEktSBaQIOyZ+ZFiih4FwRMEvQrBtKt
         q40mxhTIaXZm6rmsGymyE03yDP1zjMp5GsS4ojcVZP+c8ME5ZADLF9qLjLlhNtZPpVna
         v40EMCUiDKqq0m4nYJfbIXt1EDhDHbUXfxR+luG/18Z936G2of2baLTrugjU1n9HO3i+
         M1BlbA/SLFnu4eSJEi3Ts5ZyZKM7eCVemr2cYZJV0SNcv33nR7gSciCyUWMV6MMUmrRs
         bYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KzKSFA37zQ+fSsnCSfsJqcJWA1YqoEpujyYe82jiosA=;
        b=VNw/m4xjqlOCGplpRyg/Lro742mhVX4oCsMFsoFSfNDhkq9FlDjjgz7gVEtIGi1YgB
         1h+Ajq+bCSjSBMUPDBl1+YRSyk68fJeamqydnrYmq+JFVhE3XaH0aPibmnw+qKa1rpF1
         ppWv8AduPTWv250cYZJCX+RZuOL6/9RSmWMEOlVgeXjATRfgp3wXx7OmThz1z74sW1jK
         wA2wtphBPZgM3kNmWST2Mpt1NSk+U84jw5KVc0uBMUvgphWpkdvM4EVpWNnzNvjkviyK
         DIvnqYMLJWq3YwL4AuGY+n/ofQolgajWwLG0WyLjVsHlIKKtLtxdRV1IfXr2EAtpLuj5
         /OZw==
X-Gm-Message-State: APjAAAUAsVAhtDL/zjTpX2bJzBMmwFLPG9+oDpk1+VUif9Id3JmRMic9
        0Bpq5Io5O09ogzsoQUXdUKjsow==
X-Google-Smtp-Source: APXvYqzZBXKnAbQRB+UN+TlYuRc21RIUf2MlSS34PJhj5LkssDhww4cmP6eaWU2qSaFmGTFxlmAbFw==
X-Received: by 2002:adf:83c7:: with SMTP id 65mr10264958wre.368.1575560054836;
        Thu, 05 Dec 2019 07:34:14 -0800 (PST)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id u26sm191894wmj.9.2019.12.05.07.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 07:34:13 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: media: amlogic,gx-vdec: add bindings for G12A family
Date:   Thu,  5 Dec 2019 16:34:06 +0100
Message-Id: <20191205153408.26500-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205153408.26500-1-narmstrong@baylibre.com>
References: <20191205153408.26500-1-narmstrong@baylibre.com>
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
 .../bindings/media/amlogic,gx-vdec.yaml       | 42 ++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
index 878944867d6e..cc8dc264fc72 100644
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
@@ -59,13 +62,17 @@ properties:
 
   clocks:
     minItems: 4
+    maxItems: 5
 
   clock-names:
+    minItems: 4
+    maxItems: 5
     items:
       - const: dos_parser
       - const: dos
       - const: vdec_1
       - const: vdec_hevc
+      - const: vdec_hevcf
 
   amlogic,ao-sysctrl:
     description: should point to the AOBUS sysctrl node
@@ -77,6 +84,31 @@ properties:
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
+          maxItems: 4
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
+
 required:
   - compatible
   - reg
-- 
2.22.0

