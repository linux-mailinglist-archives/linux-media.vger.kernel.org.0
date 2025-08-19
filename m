Return-Path: <linux-media+bounces-40274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 039CFB2C369
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0C3724061
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C648735A28D;
	Tue, 19 Aug 2025 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpJy6hHA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC33570AD;
	Tue, 19 Aug 2025 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605835; cv=none; b=l3szMK11qFuQ4TRJ1jAwWkgSTwlAzqAQ+CEmYqXrdBy7AR4s3nEA2JhlEr2Xkven4hYktljG5TN/lM9HjbDxggrqsU7Fn5dYS1zf49vs3jl7WOgLoq6NMzBdvZWdUlXGARx3qUyNi8gTwjDm4nPRTZg5t9jBg3PEaIxAOXBuuMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605835; c=relaxed/simple;
	bh=fIIWgWwa1cNjmo8m5IZObO858X88oB6pEyhk3u1RmuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8jsMl7V/o961SN+QuXuBKcFjM+g+z7vWAGrrVuKg2lp5r7RXs6LDB/nU5vhhuXYRNEONwA+RVU9Q6p9/JIGkA2Dw/wh3ekmLkg54jUxah5yOyt4B8V4zIo9XpaZhK/W39TiX1zRZI+Oqp5dnKxvHgRp1LllmHJxcxA2zuojs3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpJy6hHA; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb78d5e74so886961966b.1;
        Tue, 19 Aug 2025 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605831; x=1756210631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhbWfkMKF6hF66NOAL+RPoWVZuRp+fSGcoMAU/Szml0=;
        b=XpJy6hHAzqA0gaAMfBxljqUE0JWAsBUCW3rcU3nCkUNJbJZGB8d8An+JbVlqDzSURA
         SpJt52Y/HO3TleRfHtNn7PCGPuXfCifTMF6Opo6/5WkV7ezapcWfzYpYu8CUiSaROfsI
         aPj1Unr3lZBahlBY1R2ZxUvW0spikK5c/zEcMfLqyPeLoQn9L+MoTnQy5ZEitOXCzIyG
         IphHg6GDG8EntJ2LCNkZx4oUMHzwjKBqDRbmiQvu5uErSHxJtpZh1gsaePPCWuyG2t8p
         jWzCBgRfS5Pq4RxPq903khlUnIvsosZ4mjbXRTbNMc040LG4afPKw5JYgdwWMIyLD5jl
         aC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605831; x=1756210631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhbWfkMKF6hF66NOAL+RPoWVZuRp+fSGcoMAU/Szml0=;
        b=dVSo9v7zMVPV1ezJdGoSbiMEXPNsGfR9nM5a6VebTgduCLCkGWEpCNigXIbkNh3Uxa
         8Zue1qCPS2ofKhsfrjUI8JigxcI7tf9bTbtzV7tPFkJ9JlGe10ORZG/iJwi2/HyKbQjf
         5qypyBUkPZKseqGpS/eUpFszdGJEYsI6vRV+gMiixJ9guhE+hBuxNxZ/9Om+M2gcmbEz
         yg91qk6YZVTSA3VbXaM04ZzXba+E3t78ENZa1G0vVtIGtBIkmRi87MYOuRHs2QEQENOB
         3w7ODhsTIIQxKL0Uem9X8poRZOQ9WzL3wg0FkUMfGoEwNyz7Z/7kYCNeq8jwL63Gg8Bn
         lpvA==
X-Forwarded-Encrypted: i=1; AJvYcCUJrejVk4VYPibXMt26jBwkWMFq3J7JjYsQ6BPiN6PdkzYFKCza5l6OhUO/Ki4D2fWxu7bW9Ej1cBxo+nZk@vger.kernel.org, AJvYcCUSZ/VHnfrdY11z9c1mYdyiNnTKDOtEHIRj5X1ZvpIqIybN+GY8Y8HE5cxXzvsWenfq5upPq23K3rzu@vger.kernel.org, AJvYcCW2+Y8e/QBy4jH7P4Ss691wvoix5A2YavDdWMIyxrBcepOOzup2vXdf2Z8nx9l55My4gT4K4jXRht4L@vger.kernel.org, AJvYcCW5hdYSG1d2JSZ/mABgs7DOTdn0IWuwcm+hMUvumRmQ24x3E6Dkx0ijt0tnv6/ka2F/CFscCFkDE4b9FBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaIPyxaCSaN+rx4dqTUPzy5CPAqoZBVyrhdx7/qzUCSlyCiJYs
	KM3KoGUGZicC43/UNpvTQUTJ9ccjE5UvPIIRTfB1t1HioBqqcM3ZH1+l
X-Gm-Gg: ASbGncuUiGMfmhYoZnBL11LXlocpSlwASIrJr7Ck6o+8+8s6TJN60FURJcJXM5XtP2D
	wdKoCmwzayaCDt+vDQP0ATHrPnsb41mcEdiOe2XYsMdskWLeRMSdfQuxkjzBNyzwsOlUNhVVRcc
	4KJ0WVIVqCQdXTW71dhkqxoUBOU0Z4FW1PzHw3pWpZq9M2+E+c6PLcLKjOCWd2zkTuFkpVBHVnL
	XC8LheCaDndxIZZp3KWdCP+lFoL/QkAV7QczULeAyOQONBwrPA75qKGvg0JjDN4cwUED6H5fVCg
	kr1Es96LnyuuWtSO1dCO8Lf4EWqLkEJXm4fLha9jvJRFXH57hBI6bRBxM5ZxgHb/EJXb5vD9Ht8
	zQb/WXuiljUTjqg==
X-Google-Smtp-Source: AGHT+IFsyn72hjdeQEsFRbU5nBWZrG6wCs9qdktkISE8s0ETQsL6XXo/oatl3CIX8p7Q4Fqo+MpW3A==
X-Received: by 2002:a17:907:9706:b0:ae3:f2a0:459f with SMTP id a640c23a62f3a-afddd1f0af0mr248773766b.54.1755605831408;
        Tue, 19 Aug 2025 05:17:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 17/19] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Tue, 19 Aug 2025 15:16:29 +0300
Message-ID: <20250819121631.84280-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document CSI hw block found in Tegra20 and Tegra30 SoC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra210-csi.yaml    | 78 +++++++++++++++----
 1 file changed, 63 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
index fa07a40d1004..a5669447a33b 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
@@ -16,30 +16,78 @@ properties:
 
   compatible:
     enum:
+      - nvidia,tegra20-csi
+      - nvidia,tegra30-csi
       - nvidia,tegra210-csi
 
   reg:
     maxItems: 1
 
-  clocks:
-    items:
-      - description: module clock
-      - description: A/B lanes clock
-      - description: C/D lanes clock
-      - description: E lane clock
-      - description: test pattern generator clock
-
-  clock-names:
-    items:
-      - const: csi
-      - const: cilab
-      - const: cilcd
-      - const: cile
-      - const: csi_tpg
+  clocks: true
+  clock-names: true
 
   power-domains:
     maxItems: 1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+
+        clock-names:
+          items:
+            - const: csi
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+            - description: PAD A clock
+            - description: PAD B clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia_pad
+            - const: csib_pad
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra210-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+            - description: A/B lanes clock
+            - description: C/D lanes clock
+            - description: E lane clock
+            - description: test pattern generator clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: cilab
+            - const: cilcd
+            - const: cile
+            - const: csi_tpg
+
 additionalProperties: false
 
 required:
-- 
2.48.1


