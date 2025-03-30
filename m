Return-Path: <linux-media+bounces-29000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7054A75C71
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAD7F188B3A3
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C472F1E3787;
	Sun, 30 Mar 2025 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2KJI710"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978E1E22FC;
	Sun, 30 Mar 2025 21:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368891; cv=none; b=UANDxAKIUhX7q0ct+P2ltqOzJpHtHY+eA3sWdjfalUvCwREigAclkvFOWCzZMFTDgZUMlxsen5kMRa0l9E3+/aXexhwvFo9eP3hwbuNL0O+UzuE6I2QMl7ndXCkm5f5pNz8bvx3U/sDQtk+c2asfgkcWzYxEA7/yfgkTyfx7vTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368891; c=relaxed/simple;
	bh=rPOU6SK6KBnqiJhD/GUW9tTvnEw/MGykezT8vv4g5QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tOPqgmRk7H7LhwqzNdzhFeyXBV5Kvsc5oRknJLey01VrkUowiN021tZcQi/0rkq+jvgIiS7+C8H2wynt2seBOMiUmXhNRn72qJpZvghiIHZqkAMA0gPtIVT/uHg/I1/9fyXiuLNJnWkzS6Y3Lg7oBfzQWKeA86ZR8gVh6sH08IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2KJI710; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3306310f8f.2;
        Sun, 30 Mar 2025 14:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368888; x=1743973688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOya+hsmwz22BhJPkrxREwIJnTNnWqboReymlaoYzMM=;
        b=N2KJI710SvHXPIEalWjQO9qfyEfAHU6hEdq7G91oJvf0fH4/AMcF5RnX/UVzUrzrqu
         e8Iyandr/ho6WZIx+EayHgSj+afMoCT01cSHdc/jaQhacZqJVOXh/2h7W1XwLTifcl3s
         phDQCjG1GXHzJjtNIs2B2NwCnuF7hqSu5Rhhsr60YfhdVb2jCmxiOp8LjycJrdOTr6UF
         yiILDmbSvBHSgbIQx7dssearNaWXyyXZiubnZH17ncIWD4MpINEsuBBIDS/GEMvonBuP
         gvfVv//UApQWAvRsVOhakiH12hZ2ttVNvykID7Qm4bxBcOSMN3dTuAE+VFS1dOAwBBU6
         gziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368888; x=1743973688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOya+hsmwz22BhJPkrxREwIJnTNnWqboReymlaoYzMM=;
        b=uSFP/EV1Tr7/Gwf2oBS0yjiKF/ue7sqJRHFM3C44y9SRrxhBsVBtZ0BYJIC9b2cQfb
         4oSv68JxAlVmnpVmIEdSXKiKS1ikc0AX6twLqiPYQbkHOiAra+QqXI0AGBrwwvgTmNkc
         OyLURZ/OlRqmQ0rgyia8qkq8xlQCTsLcnqcZIUmgxS0Feb6z+nHElF/4OCvHao1dJAFY
         jwSEvH4X3u7yMFC+/v6h2+ehOFBh4gnGiClJR3bBnEaEaUtHYOm3akeZVeOY2rJgGE8p
         EOg3Cd49zXgd7jilk+ip6vsmNKw3OpYgJqa+AaPPtdIhn7E/2mPTHrAY3/FSNiFz+H2W
         YVbw==
X-Forwarded-Encrypted: i=1; AJvYcCU1BXixNmsL94P9o6teFat6hieCJPIhjJT8eM39R1UK4Ql5mggjn9LtMUxJvgU/sdshdnVWByuax8gHIlSO@vger.kernel.org, AJvYcCU85g8/dcxpj6hkyA2M2ScOeQPPjsG/1JdfOhcmHGxHuGL4m0KHjWl36/rU8JVYX/JM1TOBXzjhQoRDsVyEEdjy3cg=@vger.kernel.org, AJvYcCVdYrpBmvqqPq+usIu8cvJ7aCSzfPdDCg4PcYo77qgzT7u9Fn0rjuMbV1T63XlLFm5h7H9tyy6CS08=@vger.kernel.org, AJvYcCX2v5xCrG+Z4EK6sdorDYQC/i47KJuEDtZmIPwg8k5RIhuH+xw52hkulOJfT/gczo6fV/2bYNeqxyPsY/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YymBXY88Zn++h1XkaR5Q3d4FPHe8bHIWgqvPxXNQaaAuTA5oX22
	OqdHl84dG/QqNujfVfU1IMC3/1EZb8CBxY/OofTgyyTezGP2l5Ck
X-Gm-Gg: ASbGnctRRcu+PwG68C70BXyqe4GE1B08WhOTid9k5RbJuMOeiDinaBuBGLjlURQOCR0
	mzWxy991nHvTjnpfDuaMYbha85VzfHIqB912ELsi4UMiGJ0OGzfWdABNdOx78gFFFaF0FJzaajQ
	eH2qtHccDfbRvy3e7GpJ3ZGBz6WTkEfyuSHGH13hrRLitWcYihs4fn7n0kYCdGfveYO7rWYSffI
	cXeCAKNGC11xlwQVTT+P/CyyC6FC7Bm/quT9lBTETIZIA2+wMul2sbNMhmg3SPQ4hvKVgLTDHHc
	T5x57Ipkwlhmh52N2m+ipmCZLoIQJ9QaQ9w2g6kX1CzOjhRc9yS6SL/ZnmIN+HNx92JLQQ==
X-Google-Smtp-Source: AGHT+IHzYnG1Q67QoKSFJx+h5jPQaNu3fis8IoYs4sBaSTupv984ZvQyex5BVmGbt92C9CR44EK3RQ==
X-Received: by 2002:a5d:588a:0:b0:394:ef93:9afc with SMTP id ffacd0b85a97d-39c120dc1aamr4747563f8f.18.1743368887428;
        Sun, 30 Mar 2025 14:08:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 06/17] dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P) SoC
Date: Sun, 30 Mar 2025 22:07:02 +0100
Message-ID: <20250330210717.46080-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to that of
the RZ/G2L SoC. While the LINK registers are the same for both SoCs, the
D-PHY registers differ. Additionally, the number of resets for DSI on
RZ/V2H(P) is two compared to three on the RZ/G2L.

To accommodate these differences, a SoC-specific
`renesas,r9a09g057-mipi-dsi` compatible string has been added for the
RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 117 +++++++++++++-----
 1 file changed, 87 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index e08c24633926..501239f7adab 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -14,16 +14,16 @@ description: |
   RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
   up to four data lanes.
 
-allOf:
-  - $ref: /schemas/display/dsi-controller.yaml#
-
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
-          - renesas,r9a07g054-mipi-dsi # RZ/V2L
-      - const: renesas,rzg2l-mipi-dsi
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
+              - renesas,r9a07g054-mipi-dsi # RZ/V2L
+          - const: renesas,rzg2l-mipi-dsi
+
+      - const: renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -49,34 +49,56 @@ properties:
       - const: debug
 
   clocks:
-    items:
-      - description: DSI D-PHY PLL multiplied clock
-      - description: DSI D-PHY system clock
-      - description: DSI AXI bus clock
-      - description: DSI Register access clock
-      - description: DSI Video clock
-      - description: DSI D-PHY Escape mode transmit clock
+    oneOf:
+      - items:
+          - description: DSI D-PHY PLL multiplied clock
+          - description: DSI D-PHY system clock
+          - description: DSI AXI bus clock
+          - description: DSI Register access clock
+          - description: DSI Video clock
+          - description: DSI D-PHY Escape mode transmit clock
+      - items:
+          - description: DSI D-PHY PLL multiplied clock
+          - description: DSI AXI bus clock
+          - description: DSI Register access clock
+          - description: DSI Video clock
+          - description: DSI D-PHY Escape mode transmit clock
 
   clock-names:
-    items:
-      - const: pllclk
-      - const: sysclk
-      - const: aclk
-      - const: pclk
-      - const: vclk
-      - const: lpclk
+    oneOf:
+      - items:
+          - const: pllclk
+          - const: sysclk
+          - const: aclk
+          - const: pclk
+          - const: vclk
+          - const: lpclk
+      - items:
+          - const: pllclk
+          - const: aclk
+          - const: pclk
+          - const: vclk
+          - const: lpclk
 
   resets:
-    items:
-      - description: MIPI_DSI_CMN_RSTB
-      - description: MIPI_DSI_ARESET_N
-      - description: MIPI_DSI_PRESET_N
+    oneOf:
+      - items:
+          - description: MIPI_DSI_CMN_RSTB
+          - description: MIPI_DSI_ARESET_N
+          - description: MIPI_DSI_PRESET_N
+      - items:
+          - description: MIPI_DSI_ARESET_N
+          - description: MIPI_DSI_PRESET_N
 
   reset-names:
-    items:
-      - const: rst
-      - const: arst
-      - const: prst
+    oneOf:
+      - items:
+          - const: rst
+          - const: arst
+          - const: prst
+      - items:
+          - const: arst
+          - const: prst
 
   power-domains:
     maxItems: 1
@@ -130,6 +152,41 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: ../dsi-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-mipi-dsi
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+
+        clock-names:
+          maxItems: 5
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 6
+
+        clock-names:
+          minItems: 6
+
+        resets:
+          minItems: 3
+
+        reset-names:
+          minItems: 3
+
 examples:
   - |
     #include <dt-bindings/clock/r9a07g044-cpg.h>
-- 
2.49.0


