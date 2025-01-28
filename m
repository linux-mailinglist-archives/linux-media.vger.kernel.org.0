Return-Path: <linux-media+bounces-25327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE6A207BB
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 10:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A934D1889325
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 09:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1B319D892;
	Tue, 28 Jan 2025 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iBOXOiW/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A13219CC2E
	for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058044; cv=none; b=Jr1VFjXfj+uDF6cbjaSsZYMm0cJvOcgyy7rHBjziD8gbDktyaOHBkQm2wRhOnj9EZMRUVH/wUQXB0Z21elifYawNPCPzhwnbQKzq9WpCqBcLwdOh9hs4km0D7xc1nzV5YkeE0pvYTxgBYWJZtLLJUvdIf4jFpbaMA2tzOx4BpPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058044; c=relaxed/simple;
	bh=m/9A+vV18V8o3rxj75sgunitt9f7oIlfI/V0HVXTsIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/YmSuqmlzlBnrfD+GrdZOMF6Z9nVJuFHY7B9xamOqXClj+QImtAbqzWkDh8cdUqiVBur1bQZH5arDR6nD5IZxOla4rgDPYjdJNaHc7kjPIvr92KfF/Aa8o8MRPJsKkjmcvMaF4f9MG01SAs3Jv0lYDJmcbw/BQ/kJMJmP5rLec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iBOXOiW/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434f398a171so4627675e9.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 01:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738058041; x=1738662841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mynkn1T58KbWxPJslgprg5ONuckX8jf1idYXFeWeEt8=;
        b=iBOXOiW/EznO4St6025LyF/RTSPkiyYF6q//6Z6KCstNnRllO+4ArfLlAL1doLy0SW
         Z4nxXiyHJBCrzQ0GLIbThZIfWNaSMU629v7mYmx89SridxjOVCp+r85UQdv4XxdJeGHv
         gYPrxNxuCiiwtSOw+mJj1Y7b0xRLlBs8FIJcZUev9knJb0lMyw+UmHyLx1lS5xvs9LNp
         c0kbP2l1zppOWoB3VRMgfUA7GtDW2+u9NyLl97omgxvu6GbsJIP/l0uCoARu7h8FgJcQ
         w68XiJysTICIqrkVxiR64dGVyZ4++4zlSDN6wCQPJVh7n1HHTdxZqwmOutT3/oyQQmHC
         96fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738058041; x=1738662841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mynkn1T58KbWxPJslgprg5ONuckX8jf1idYXFeWeEt8=;
        b=MLc1ewkHqIMw/l5L8cdsFTthhP4tylQwAS9ulqg1nDlR4basy8O73497Xtz2NHCYHh
         Kwh+pxPt2lOI4n8dXjVINiZLyHrR4WG9POkQuZXvEH4/w62DQdiHyFklPICLZbwJ6Kx5
         lq1YZp9cmGmtIE55CcqZcZETKaGioWclk66LaC6jyUoZVeNo0XKuZ7tE964piDg3eXWF
         hTcIrGY6I6DxUanMsTejv0IkaKE8tCfMJhPr0xTeX3eiJiJsKI+oBHPPEwn7EDQ1aPmp
         d3rDlcAQJmNHFBO/UMOzdTUgoo4W/rDKbIiCjR9oDDCfgfb/i0Uj+b9uilxigpWMqUJK
         J/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOAG9ox5M1l00PcTaNZXwdMMDMxNTw9OdU+h5tXrt+p86SElysHdam75yR2wkA6u3cWoerpi6AIGi+TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpwRInH3KQIPIXfa73mXIUkdw/g6HCSnKW7FPV5LeKnXkw326
	BRE2wngXySiKlR/gTz+CNaMT3ULb1J1v1Jdl2n+kDpqs+MyJk8kQa6Y87ZFEDp8=
X-Gm-Gg: ASbGncvi5Wr0YZb+jdMXdeDkmQ3xlXeXGKfWDabyZzEEKnl7v3NYt+qUL1VUi6XN8f0
	ngiKIv7CRSMRsQ9Dul+d7ioFm+3h1CQIh7s/YbXz4ycITb4e1ewiEa4uLKz+3u1uN1bKWa1lv06
	m3efltXVxQKT35q5Z6J9uOJ9vUEuqTz4uiqDBgJVrHjOWBiyoXXlR0iM/pQTuM3q7OTDC1av3Hs
	RbqTATzxQZezjE/X9s80L/n2KG+pd7TNppQwuUOfhnunJ1lmzG3ddTFN2+r/FUeaAzecBKso6hF
	91eBsYNVi5PXSxlzcnvyfBWe9lVC
X-Google-Smtp-Source: AGHT+IFaCb5uid+D45DpJt271ckjlQY8cqUkzEIatk9zjS+oh+oJJnaznv1MM2Dub/pe4P4CUIZarg==
X-Received: by 2002:a05:600c:8712:b0:434:9cb7:7321 with SMTP id 5b1f17b1804b1-438913c7930mr158611885e9.1.1738058041497;
        Tue, 28 Jan 2025 01:54:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48ae56sm163002455e9.21.2025.01.28.01.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 01:54:01 -0800 (PST)
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
Subject: [PATCH v2 2/2] media: dt-bindings: renesas,vsp1: add top-level constraints
Date: Tue, 28 Jan 2025 10:53:55 +0100
Message-ID: <20250128095355.65766-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128095355.65766-1-krzysztof.kozlowski@linaro.org>
References: <20250128095355.65766-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clocks and clock-names.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add tag
2. Move clocks description to top level
---
 .../bindings/media/renesas,vsp1.yaml          | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 1a03e67462a4..dc4b8f00aa7d 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -33,8 +33,18 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks: true
-  clock-names: true
+  clocks:
+    minItems: 1
+    items:
+      - description: Main clock
+      - description: Register access clock
+      - description: Video clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: vclk
 
   power-domains:
     maxItems: 1
@@ -78,15 +88,7 @@ allOf:
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
2.43.0


