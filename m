Return-Path: <linux-media+bounces-2025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB9280AD5B
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 20:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA5BEB20A13
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 19:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34015027D;
	Fri,  8 Dec 2023 19:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q28ZqfaE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EFA1732
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 11:52:59 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a1f47f91fc0so247582366b.0
        for <linux-media@vger.kernel.org>; Fri, 08 Dec 2023 11:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702065177; x=1702669977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQL2QzATtB7HD48YvHn7NcHvaYuNjHniWUH7CLZRyog=;
        b=q28ZqfaEwMhMnkIACRBvhMKYc7sq9t129BEObLiuPPtKE3Y6d1ulb+oBKs1EO1jEFL
         daKqChtF42XGLxSHB36hVQm8XCDDxFAPF8wHphZyF/RSMtBLGWUfgvXRcTdL3OP22rCl
         2EGoVSWYShNkjAvv2T84WgHp1aK4CHX2dUC+kgsszqUm0TbOlL+pmJfkKK00pdJEbhBX
         DB5Rjga7WjgB4pxYCVBwKA6UdXoPfj9SBIfqqvHzkPH3DggCIvoIH7SjhsY2cNqDvLOE
         u8vIVEJTFFaqidzBtvpNN3eQ3L2RdiHYLB9ZqPWgtL1YBweLf2ljw1qKXreebDW9/28e
         q8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702065177; x=1702669977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQL2QzATtB7HD48YvHn7NcHvaYuNjHniWUH7CLZRyog=;
        b=Wt86D3dHK6jsxrZUAEthSsBOD4CvtzojgUYeKrArlisRm07bjpO+ri4anVJ2rFpPuj
         ucQjwWyn0l/AfG2Rhe0CTK589wbiUu8qNlhx+ZPYZ25WRS8Hl2y2cZKFV2HoKNiXAj9r
         P2PUbyb9mpqSzSlgJacdz/oE8UU9BAmBGCB39q3Ci7SJNIm0MmkmRRVqF0L+7OPpjUpH
         kj2cLz8qihqV3w+HfBcH77Cm2CL1vl3zt7eh9kpN6D14ixFx/xxz4+27J5rrsAkMKd+I
         /RLof0HjvdemaxfTj0W2hdBLIcmJFc0eG2mw95Om4EEyXw6JZ+XCSkyoLb7n4XIG04Y7
         lXeQ==
X-Gm-Message-State: AOJu0YzBGd+k+djsjhYgV2NhY7Y0I6iciqB48mmhjn53Iul3xk13ZHyK
	j9/ExEPNrkuhAlzGMeMs6xtqBQ==
X-Google-Smtp-Source: AGHT+IF8UxKogiHQOCSLgyU2Q+4VTW/vNSAnLHzakwQyvd9TFf30yQ25fUjFYq7YQAinGnNjCOiKyQ==
X-Received: by 2002:a17:906:3289:b0:9c4:54c6:8030 with SMTP id 9-20020a170906328900b009c454c68030mr246504ejw.6.1702065177641;
        Fri, 08 Dec 2023 11:52:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vu6-20020a170907a64600b00a1d61183006sm1339333ejc.83.2023.12.08.11.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:52:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3] media: dt-bindings: ov8856: decouple lanes and link frequency from driver
Date: Fri,  8 Dec 2023 20:52:53 +0100
Message-Id: <20231208195253.130470-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The data lanes and link frequency were set to match existing Linux driver
limitations, however bindings should be independent of chosen Linux
driver support.

Decouple these properties from the driver to match what is actually
supported by the hardware.

This also fixes DTS example:

  ov8856.example.dtb: camera@10: port:endpoint:link-frequencies:0: [360000000] is too short

Fixes: 066a94e28a23 ("media: dt-bindings: media: Use graph and video-interfaces schemas")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Drop link-frequencies entirely (Sakari)
2. Add Conor's ack

Changes in v2:
1. Rework approach: decouple bindings from driver instead of fixing
   DTS example (Sakari)
---
 .../devicetree/bindings/media/i2c/ov8856.yaml | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
index 57f5e48fd8e0..816dac9c6f60 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -67,19 +67,17 @@ properties:
 
         properties:
           data-lanes:
-            description: |-
-              The driver only supports four-lane operation.
-            items:
-              - const: 1
-              - const: 2
-              - const: 3
-              - const: 4
-
-          link-frequencies:
-            description: Frequencies listed are driver, not h/w limitations.
-            maxItems: 2
-            items:
-              enum: [ 360000000, 180000000 ]
+            oneOf:
+              - items:
+                  - const: 1
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
 
         required:
           - link-frequencies
-- 
2.34.1


