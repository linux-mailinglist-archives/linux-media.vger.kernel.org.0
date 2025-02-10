Return-Path: <linux-media+bounces-25904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C7A2EBB2
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C9C18842A3
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DB31F4297;
	Mon, 10 Feb 2025 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA3S5hgi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF11F4261;
	Mon, 10 Feb 2025 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187991; cv=none; b=b7NxgiLKLJJRZ1n2V42abFHDzGPRNTmc2f+5pEPIRfVkWg+Jr9ncxy68cx3oSCnWeyi8zlIPWVX1IHS+xg3nUR678etUhA9+t8G4A/d7qe5RriDfP1t9GfPnv+HLKfgj7ldA2GXC+UaTwKtxIqq68aTToMYamg93xFGmdCqkQP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187991; c=relaxed/simple;
	bh=glO4UHaz3RD3fduKHW4s2v/ZY1TdUQtL0ceFYfAmvUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jLFgU4XN1fVHHbgsZQwWEzCgq6sBSNVt9BKTpLcQMkmdpNdu0dVXxu0/qttkgTTc/N4dJlAhdtEEDUN6sI21sgyp7hFHtDg29l77w4DJyM3wzZBWr8mVP4gt6Aa1gHNdqVO9wgh47xCPOhzbQ5wUimVhzDI+H54UDSBqjrFUt/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iA3S5hgi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7c6fc35b3so113038066b.2;
        Mon, 10 Feb 2025 03:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739187988; x=1739792788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnkKsW19OEov2QgBC44PML1O8ZJIYR7AhQohKtAxJy0=;
        b=iA3S5hgil8NVUtNWv15iSieuOleAaBStoUW54nEFcB/VYjnM/XmRI/9H1uTQtsPfzn
         gaK6DZRxmwYO0AYI7vlss8FUSSIS2l+svq5Acbpefah2O1cBR4Sr7FW5QPG0P0gnUQ4O
         GVSP/7w41IcbrXdsRxJDSr2RBcUL7KmEgygWFayLgH8kc76xMsSDV+OvQRuRWIUm7BJX
         8PpjrPx1+a9xg8Z+StNUJMdnX1lSPdaitzqxwAP0Me3M8UIWpz4ljMnnGsBoqhFY/fvm
         tVhF8qH6iRbDFAN/+IUhubwmZjyq1HYcPoLGymbuLq6n4rE+PxAfLyDW0cJZ2B/XcaKi
         XYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187988; x=1739792788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnkKsW19OEov2QgBC44PML1O8ZJIYR7AhQohKtAxJy0=;
        b=H3ci9ArXRduad8yydJSnO9SIPXy3Erh2yhRK71oxwwjlZiUnRAKkzl/xYc8T5YmqPv
         NEqVZbW1pADTho7h7HeCvL+XNQBpgUhqDxXm6r4wl1eh4aBYtZ3NuUguq1R4vsWT7XZW
         yJghFqezf0tjpV1Qi0UfC/ogNIbTKEyyCuQ9DEbKO+bHfcJXwNUuiZMX18xcNcasC1Lz
         +aogVuzY0Hp1neqLO404F272ZSyl9IMFP+5LGrorQTC6O2YzTWGc+kTUui0YCEe+75Jj
         kOfYJmNXYNnTASyRomaF9aozyaMrgunj+PQ6xqZARBcOLexDJKTxRxcOT2cGpWc6MiNB
         VXLg==
X-Forwarded-Encrypted: i=1; AJvYcCUT0NGFc7Bv0kzXbubESUQDtdOmW5hTfAoU1riYvPvEuiPi5J52hUkuJ+UZr61zkZ1TitI8+ftrY8At4jQ=@vger.kernel.org, AJvYcCVPab08dghjHBcEQrn1lKJalIg50gyl1p14Rocch+v30cwN/7k/yrGwux7QXTMss5v2XwHQ5G4QcSz4@vger.kernel.org, AJvYcCX9hY82FVUhUgfNx9BWDGh06tflWIW5vkwSnjZD1/tY1yesdb8Q1Mev4eUVUPbxbZTlEtH7X+Zn2u1CRVdJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxhoYiZo4AhIS9dTEWGlp8dvarZOYC9/NhU/R5KpJd1vmTqVOdB
	bLIhuVOnixGOeZKu6wZrYzWSV2mo4TI1VfgUrZZ/VUBLp54jL6uIy8LDAA==
X-Gm-Gg: ASbGnctGn5urJff45OzfgpqcyZsDKEiAU3W++iIkSB9MfS0t5Z7rnEGqu4cBRrSsjHV
	rwmRooP5MxWaZtG1srWXA+DJvNn9YRjCcTqdOiGXdQrsToG0Mwos6kK5PwzxNxKyApNu6VMIkUn
	1VgrqnoolMxdYsMfpAll/+XMzWuHNQ1y12/KC5vmqi6jHWohUBlM8qH7x3DSiKhjTlYEcKpk3u3
	kC6CYRdvxCxx+WCjG4Y2uIds291PNehaxx6Se5pkPowFfFMNvZW+LKhqHyNdSNRpC7yf1tFmBcD
	pa1GALi9ImeRxvZ/hrG3G5hsxCfmZ9ACzrHyNAwcnJi8CMrHOBuFfMZc/9l6K83MrLNRcKFZR7X
	x/Hray+hyheyADv80Qp5wl2tj3l0=
X-Google-Smtp-Source: AGHT+IGCYgTr+h7vSv2zr4+9waXZIbj4U9eWKPeeV+nJjj40xrjcMG1ec+tYGILsSfK85NAjhaq7UQ==
X-Received: by 2002:a17:907:d204:b0:ab7:b589:4f9e with SMTP id a640c23a62f3a-ab7b5894fe3mr517108666b.39.1739187987802;
        Mon, 10 Feb 2025 03:46:27 -0800 (PST)
Received: from tom-desktop.example.org (net-188-217-54-237.cust.vodafonedsl.it. [188.217.54.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a9e6e06fsm428948566b.80.2025.02.10.03.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:46:27 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
X-Google-Original-From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
Date: Mon, 10 Feb 2025 12:45:36 +0100
Message-Id: <20250210114540.524790-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC has five
interrups:

 - image_conv:    image_conv irq
 - axi_mst_err:   AXI master error level irq
 - vd_addr_wend:  Video data AXI master addr 0 write end irq
 - sd_addr_wend:  Statistics data AXI master addr 0 write end irq
 - vsd_addr_wend: Video statistics data AXI master addr 0 write end irq

This IP has only one input port 'port@1' similar to the RZ/G2UL CRU.

Document the CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../bindings/media/renesas,rzg2l-cru.yaml     | 33 ++++++++++++-------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index bc1245127025..7e4a7ed56378 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -17,24 +17,34 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-cru       # RZ/G2UL
-          - renesas,r9a07g044-cru       # RZ/G2{L,LC}
-          - renesas,r9a07g054-cru       # RZ/V2L
-      - const: renesas,rzg2l-cru
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-cru       # RZ/G2UL
+              - renesas,r9a07g044-cru       # RZ/G2{L,LC}
+              - renesas,r9a07g054-cru       # RZ/V2L
+          - const: renesas,rzg2l-cru
+
+      - const: renesas,r9a09g047-cru        # RZ/G3E
 
   reg:
     maxItems: 1
 
   interrupts:
-    maxItems: 3
+    maxItems: 5
 
   interrupt-names:
-    items:
-      - const: image_conv
-      - const: image_conv_err
-      - const: axi_mst_err
+    oneOf:
+      - items:
+          - const: image_conv
+          - const: image_conv_err
+          - const: axi_mst_err
+      - items:
+          - const: image_conv
+          - const: axi_mst_err
+          - const: vd_addr_wend
+          - const: sd_addr_wend
+          - const: vsd_addr_wend
 
   clocks:
     items:
@@ -120,6 +130,7 @@ allOf:
           contains:
             enum:
               - renesas,r9a07g043-cru
+              - renesas,r9a09g047-cru
     then:
       properties:
         ports:
-- 
2.34.1


