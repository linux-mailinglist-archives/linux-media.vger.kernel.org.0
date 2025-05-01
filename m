Return-Path: <linux-media+bounces-31509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE0EAA6258
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CABB3B9ECB
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 17:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35F62185BD;
	Thu,  1 May 2025 17:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IJOATLMN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA8A35961
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120865; cv=none; b=BGxmBKCBn75qghYqigPsL/tNmrydLcO605ffLFmR5KDuVMcJEd6X0NDFct3fjzQcwEiiucczoxR0gFa/rsm4XFuGKwiOA0Pe1Bg0ioX9jR3LyjatmZEo+s93gU1aoxi34cT23DumhVt0fVqit7IO/paW7hw78bILziT/ip168RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120865; c=relaxed/simple;
	bh=2gUZzAGI9l/7uoNMIsn/D/u9hWshHKzGh9TMse0LW1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q5rxmYXgS/YmhMxZNRvkqSZuuk1WTyueFFx1Q2NBRJ7e8VVFGRFI3zdJtK/PewrymVeYGPi3WKbZUuZR+6dLoXR83xQgmRQZqDcsMrE5zdXD/UZ/YqkTpIbY7edT15Dbpwg0AenOMvgKCLabIQ3OvLzCCGQPTce1zlXHpxoK7WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IJOATLMN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-440668acbf3so1667855e9.0
        for <linux-media@vger.kernel.org>; Thu, 01 May 2025 10:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746120861; x=1746725661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8StV9iuTddu5B1f6HK3JsWIBowtp7A8CxnimQASxOOQ=;
        b=IJOATLMNWa/xwZrPSyFsjEhYB7KcVFYCvM5xTHO8GdxustMOZU3hlPTOBF8m8Q2+Js
         Lq2xXdOF8Dy0IYL5cPuqh+jecnd1d0Tqcsxn+wrYzq7vBJSENfU8eUghbTTh2259RgeM
         7Idxh1gdCGpJGkGoiYAf5/RC7zLtviz2/Adr5vOj3VyxBCU23P1zJ05ayDQvaD8xxZ20
         QaSh0wrUmInHC0SvI1g0YIxtD/yXZZn27ITb1NLHqVEnzy1XPL+dl3lYt/5ZEFx5/wp9
         99wWYQOrP49lXSQ1dCuAh4yndJkU5K9UNUP0tUAWD6QoTN/EEV9VNQaogEzs8H+Ugl7j
         ubsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746120861; x=1746725661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8StV9iuTddu5B1f6HK3JsWIBowtp7A8CxnimQASxOOQ=;
        b=ZQIeK7jpkstttmXSj4dQuLGQNpnWfSMP8hMSc8NkE22rPeKIM9hXVSt3mOYSpnTppU
         4mTyU/rHlbgiS8qKZUD6H/euULlWC0T5/iBuMxdqJGtNFufsiGBkSSFu//atJQ08vRft
         fQ+tKQhvMzWlTUUhAW2CqT3ui/aNkqDQrm1sT8GkKxYZAaoumc7BtEXx2NrQ27AEXeO2
         bmeC8gANll4iqnUQE+2vXF6IwpL2A8LdCXNz6Z0+2F5cmBpR1vI290aAcUS8MMNabWHu
         DjHy2mvTFWDrG53P3oWNTpxhx/zFg4F0Je96YIgWhsSSXzdLAqOfWF/0Tf9T7VJoffV4
         VBZg==
X-Forwarded-Encrypted: i=1; AJvYcCVg1C7Djt/hpC13bmCKq26M+e4hnhfLIwtOQJKcIA+x+G1zZtVgf1JWfjO6ZHAXnlHwlrqm6zNhcg+LKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9D8sZ9eX4cH/4kDNIcbeJS2xFvPXoADfWFgwWgmfc189qOJnP
	lRCgekCl+gZAl2QqWbBqJadzBR+WVjJEhhgtGonBhADQLtTrtYLC7isknacyI74=
X-Gm-Gg: ASbGncueCu7RAEe55lhTgcaKXDW14LOEpsP9pAyro6ARrop4BgngJQWtRlcbo0Ie2xV
	PzsYdxjJWEgGcFLxbkC+i2WNu1dZ8y6uF04JOpOb/XYJT7++/Y789tNNlrJSrXIvg6E2TiSxHoE
	EVxMCeuJJfydti/G841yxxfPUEdyAiV5mxbaJtxHUt3TjEdhu6e9n2VLZC2GLB4Cj6WyNydO+E2
	O0iXYM6Bb5mbAM0R9ToBz1pMle0Btr78tmh6iVXwmcDTvThGvnlpbgnibN9ZZYqoTcl+vuGUOk4
	luw5blHzV4YOSR5pqeK5tWiwJ+J3cvLZWb3kSSApJgEsMi2YRw==
X-Google-Smtp-Source: AGHT+IHdy4tE9zK/W8vJHJJMvw7CoQzsD7xLIoJ0aJrQeQmv4GAFnnHxfWP7eTWalox0noB95p6u2Q==
X-Received: by 2002:a05:6000:420f:b0:39c:1ef4:b0d1 with SMTP id ffacd0b85a97d-3a0941608ecmr836941f8f.10.1746120861106;
        Thu, 01 May 2025 10:34:21 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4650fsm1314481f8f.26.2025.05.01.10.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:34:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v2 1/2] media: dt-bindings: renesas,fcp: add top-level constraints
Date: Thu,  1 May 2025 19:34:12 +0200
Message-ID: <20250501173411.134130-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=2gUZzAGI9l/7uoNMIsn/D/u9hWshHKzGh9TMse0LW1g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE7CT14i4pKggHQ0CINRGpD4iQxqHx5htsnl1p
 S9xOauKPhiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOwkwAKCRDBN2bmhouD
 158oD/9LQlgvfK8FFbWxhLyIy1nge4qIfH+NQzSAPFhaCRCiq8A8uRuYRyKiuVZzbLde/KMlT/J
 bzLGaY4T06LxBuB85ZgDik8Oxa8p2eTEnLb/aGON11qSWvmRa0qtWD43boIKoK40DezGRgxEO70
 fhFockcCvmxOK1X+tPqsdArnMV8UUXG0LTjwI/rD47wsSrkI5MplqAofSekxWsenk2J+KkuX3s9
 prD/Uv1bnNOF3sz03DsfI23pF85/8hVPVWltf0HO36B7b8xPz35fEl2RCb8IUQRm+eXcWQlZcUJ
 uzy9lwNKjk0QkqS0tpxN86qzlul6m5fz6DLhEouU9LJjF8dyxgzaaAVQ0/jtxJqNjSfDN9vFRdf
 kiTMaqSr4KtEwwBNb1We0KX/6MxNWWZBH3Bh6P7iTD5YIoBHcKKOxQfBLjcJ9/Og5XIJiR474IF
 /FeWFUd6By1aCRMVhFX9kQh/Lw8f9S/0PfncdmRCSk7CkoEd32niNfIKOa7Wn8AQrjCaRGnJwR2
 2IdpCbRobGWu02Q5iIRaEPeiEhr9ZNSVYCQpQB753u7uTE6DrTIwttterk7l4f0cruUqIq4a1+g
 iOseuIcj8WugZldLSX7U8g8XZqDPsp70ZQkhJRkQ1pt0zxEpetmHEEYQ36WmsgmvZyWU43nQEdp LUy6kc8glQczcDQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clocks and clock-names.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending because for three months these were not picked up by media
(still in "New" state).

Changes in v2:
1. Add tag
2. Move clocks description to top level
---
 .../bindings/media/renesas,fcp.yaml           | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index 5ed9427fb757..7bf1266223e8 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -36,9 +36,18 @@ properties:
   reg:
     maxItems: 1
 
-  clocks: true
+  clocks:
+    minItems: 1
+    items:
+      - description: Main clock
+      - description: Register access clock
+      - description: Video clock
 
-  clock-names: true
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: vclk
 
   iommus:
     maxItems: 1
@@ -71,15 +80,7 @@ allOf:
     then:
       properties:
         clocks:
-          items:
-            - description: Main clock
-            - description: Register access clock
-            - description: Video clock
-        clock-names:
-          items:
-            - const: aclk
-            - const: pclk
-            - const: vclk
+          minItems: 3
       required:
         - clock-names
     else:
-- 
2.45.2


