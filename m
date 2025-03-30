Return-Path: <linux-media+bounces-28999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E31A75C69
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E108188B149
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0B31DE882;
	Sun, 30 Mar 2025 21:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIjrJKQG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7CA1DF747;
	Sun, 30 Mar 2025 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368889; cv=none; b=poXczGosl0CUdUqHrB4WaHpCZ5i6lkXM9Si6w1Jk5rAk9s6WYGyTE+v+88JjE1WjujeqLU5ddv6Q7kVcCLacxBPKEYOOH5oEumFpjZUbpHS4r6yc/HK+aE54K0gCI8UuWLW02NmJRBHY6Y/e7dlx3UwbCuLzpOuR8au6pAfFU6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368889; c=relaxed/simple;
	bh=sIP59GBXv0gKvzFh/HL1Jft9vSgbyVO2jGNx76RkrBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wx0gR0SD3Kaq6ur55bmJIlUhl1u0P0D3A6OVZ+BnOmTYwnNuQOVJtgaME/LV7OUycxA8d+o4XQJgON6kxvqXZdJkssHtNilVFDn7qZJcDnqXKRlWh3SBEmZiIcsxJ+MYAsH+wtH5evpxTH0Fk81b85Mgn5lsTLqbUXGxp2eFuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIjrJKQG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so33713105e9.1;
        Sun, 30 Mar 2025 14:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368886; x=1743973686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgqdMu0oAVGbwwEH05wAuHtLT7zgiIKcDwaf1TQKovY=;
        b=hIjrJKQGraURdcVjyZHD5FWQ1v0QGqKhrPdkj6zSD2OPbZFWyND4m612M+ewoNSMmo
         EXxpIo2vQZicuO49in5howxtVbZv2boxc/nesZqinC+h7l6S5pe+ENHHU3LA+haeu6md
         qdA7z988eM0oGvTgvjBRI4bhtGNPpVw8Bv8s+C3hAaKJMKXvujfQk+aN5PU3Js4OzAWN
         QOcrcSKmLQdOe6ib2vzxuBIZDa80qum6+C3fZmi4MsD2740TKquukTF2E8fDGEMWHFrC
         EN8+g9So/XjjPbJ/xcfts9teo6T0LrhlpNd7GcuG2ATjt1TVUMLUYBbHtHHVFApebudP
         5H3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368886; x=1743973686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgqdMu0oAVGbwwEH05wAuHtLT7zgiIKcDwaf1TQKovY=;
        b=Epo1jBHnKTr3mFsy8bobfbDdr8B/VQ5jMMOzNqxS5zfBLFlqjFtus8spOAci8KK8sz
         FIPCq/oDwtRIvsFmeM3mJGe6/51VqkHjhv2uSxBZJTE2XJ0uT93d3EI2fPsgDkZthqlg
         vAtjgCEl1gweC1NxBC3xpSCa9HmLUTJC7jtq93/GWttRLbfj0U/l5YW6B3wLeIOL8HuQ
         e6dGzxhIPpKUDYCFNyjd2XCRHY4gXRBca4ifzBtv73lLu2i7X6Bw5CYJYGtoszZEX07U
         AdqHmGJBaR7EgIUXv1o7uu89MNrlGGziS2xcIGD8xXFmVSYmRHJubS6m4/0GbFWnhQz2
         gyHg==
X-Forwarded-Encrypted: i=1; AJvYcCVSBRq1OzBd7z8D4T8AK9JeHa294Xt2Y+Y2n4/0JSPvihPDxFJ4TCtx6NbQZkDvqunVIS1oDp5c9jxVPy0=@vger.kernel.org, AJvYcCXNaB1iBI7Iwb2Dmq7PGmjFfXWyZIzeQSZ5ih58F91tLZVJaAls84xIF8MccPWY/NdkwAPbOn5duYtjwaW+@vger.kernel.org, AJvYcCXZamnk5FDjS8Wcq3N6pU8IV8tSiItTY5JN/sHE8NUFVu3bRE/SA2I3baqvb7Mm7Oe3W2Ex1W4yww5vsuata8K0kZQ=@vger.kernel.org, AJvYcCXnkz4x1tvrXEk/4rQW9+EC89eLJgbjqDTQsHnD4VZIp0oJ7sOOEKXI6ZAG6Zwma4tKq2BINGwfQT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YytPYh5O9jHWO/2vn0TB0w39aCxqrq+LqVlsYt0jp8kwA6zgboi
	HGoKhlLRArfpzZ5rET9brCVUJTErXXfQGljGUYy1OR7eEgk1wHrg
X-Gm-Gg: ASbGncuk6qX+N9iGEK9t2AnekeNI0zBP6XH0rcdaDU9rIubQKBJfgWVoiu/UwGCogT4
	exCLwDJTaTHbtpEXe4rZWBBXDsEOZOZu/v+1bwqWsw6rCEbMGmW59lXVf/ZwHVPPn3BO/YLHird
	bsd7gJv8bTbi3xPNH94ZnHFG0srM4bK+O4PWgGZCVODLEtL7RCxrC0ncszfIQiYeJQfy7uxx9wm
	gllfanrrhB1UUgeclbnG33LvyVoms26OSbOLUKezIeg+VxRmlB3jsPBQNYlXCiPZp55put09a9y
	Oay/5Ekwf8uKwIXAYdQAJjQmR5s5e56DgRjMYC/syQhd2Cwd112tf7IZTfgvhQBUbRzWFQ==
X-Google-Smtp-Source: AGHT+IEd0kdtHirt5rLM9tanycYyHvPODHCwZCJHWvvpSQdxS+WgA2Y/HcvRAIQ1N0P0umtMz0KFTA==
X-Received: by 2002:a5d:59a6:0:b0:39c:dfa:c92a with SMTP id ffacd0b85a97d-39c12118ddfmr5125325f8f.36.1743368885591;
        Sun, 30 Mar 2025 14:08:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:05 -0700 (PDT)
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
Subject: [PATCH 05/17] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Sun, 30 Mar 2025 22:07:01 +0100
Message-ID: <20250330210717.46080-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The DU block on the RZ/V2H(P) SoC is identical to the one found on the
RZ/G2L SoC. However, it only supports the DSI interface, whereas the
RZ/G2L supports both DSI and DPI interfaces.

Due to this difference, a SoC-specific compatible string
'renesas,r9a09g057-du' is added for the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 95e3d5e74b87..5c666b6123ff 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
@@ -87,6 +88,23 @@ required:
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g044-du
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1:
+              description: DPI
+
+          required:
+            - port@0
+            - port@1
   - if:
       properties:
         compatible:
@@ -101,18 +119,20 @@ allOf:
 
           required:
             - port@0
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-du
+    then:
       properties:
         ports:
           properties:
             port@0:
               description: DSI
-            port@1:
-              description: DPI
 
           required:
             - port@0
-            - port@1
 
 examples:
   # RZ/G2L DU
-- 
2.49.0


