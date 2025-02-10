Return-Path: <linux-media+bounces-25902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68890A2EBAB
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13E223A39BD
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D981F3FCB;
	Mon, 10 Feb 2025 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlGAx3/u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948621F3BAE;
	Mon, 10 Feb 2025 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187986; cv=none; b=MTUNX8W6DR8lQD+Tzx/drz9FeiCIlFxSwUUy820TbVz7RS2oM5Uu3ulFF0lfrag0Z/DG2PFXLZG8GWILUoAyKlegmV618XLRsi/PStWVKXDep6Isel96U6dekUwWgoTG1++dbAZq8vFoAQon1fBKymDay5gqhGr3llh3pibLKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187986; c=relaxed/simple;
	bh=W3BecK8kvWhrKX6u9NpUd1Hv73BjssHxDJFWOrQnheg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uPqjVMzJGLITjuPGSpk+sEAmSkTgv74/kNFFFy8MdDmkuwNlEPfAXpOzggcGauHidEjKnqcQR+x+PO7wwn8pjCryRX4kbeTV78hHFpdHvAJgMNpcTktfTAd3X1iHrcRxxnWk6zqzxOCfK0sVYoHRtOwBlcSiE5WJ71mnDzi+2jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlGAx3/u; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5de5bf41652so3544774a12.1;
        Mon, 10 Feb 2025 03:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739187983; x=1739792783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpg9KpBNgMnER2heO+c2aFQqwj+tuJAjEMuxsRouwjM=;
        b=RlGAx3/udY8wRcCt27ginVhDisbfHe1IxSzBkskzcWrPqD6gZiDly8ub6wYOcNnK1I
         UAli15ioWVp8EHcUrlUPwCDN2801j8ciW9K49dxrENa9vGChS8wF4z8EfiHBw49uH8e8
         9u/vjAbxmbAaLotTOIWnT/h+X2qzmQwGrWkJNhXIF3HoxvQpSWMsH1bISymVjIzN2NmG
         6rpYz6BFHtNa1IQmxyUzfawXSLlY/M3MtXW364a/oRwfcgrvKlhczVD44rZPGDgaAsSS
         Om3L8dQfLMEuJA6hvPEuy5QDLlwPVCc/CJFAwD7VNrlj3469LEpXYbCfbloBbFDsycdg
         /e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187983; x=1739792783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpg9KpBNgMnER2heO+c2aFQqwj+tuJAjEMuxsRouwjM=;
        b=H8grzoRivbWQnACMR8d6lEXStgVE7THHRRU4YupgcObor8ORTiFeRHzgVH6n362odH
         1lH+rofKTDT5i+Jw+3pYw2stz5kDskdh0wRGZcs5hcddMV2LvjmPHArLBb1tvqOLmpGK
         aV6GV2fvGwmTB0H3LwWSo3Zb984cj/k4DXqWY+4H/F5ag+Kc8hXLT+ERaVWsIYxK4yy4
         cZ51LQAxdkSEKqQ6CA63UytN1kxeEogzu1VwZsxN6yvd3e41ytFtrnr27ks1q2pa4qgT
         u1URhqsKjLZgA6qmB1eiImi8mvFSEIDY8070FBxkaW52JxAYxAnc+RiGeLsUGMjdaLUa
         jwag==
X-Forwarded-Encrypted: i=1; AJvYcCUEW7p5ybGXK33O+maipKzC1wTvXbUC4h3wX/NptnRnTqrNx7G4qxYMzBsVhPCFkuTQfs3fuOpRGYpi@vger.kernel.org, AJvYcCV+EMv3HzEvt10g0p8RSy77ZXs21w8P1tWj9bVha2KpzECAU07kJyrxiVAC/J/JD2+sid+TxuyQVCHFtfpq@vger.kernel.org, AJvYcCXqhRmbNmpxEuRdztyGDS7O91Eo4WJGlwZr5l4dIggDjdQ0D6SR5+7t007dzpCbX6KVvVtMpIyvVkd5CnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YylySk6pNiV5nZPplJl84CIoOtHJtidlvUuw4Mf6sbwLPgPE84V
	XpEJXYV0JpYcQoabXOZnX6pMm76qIx4EgoLQn35DJyvafKou3X1A
X-Gm-Gg: ASbGnctFoUYBXuhskdvdYo8yGKcrdlnfk8NluknFtlncDdqEFi2PG7h5360mv46V72i
	Tmzzj+l8j+zlGbiXjjVoECxKi/SKlFoZE2aXVV3x8n0MXLD6Cx6R/V+BATeRohyGwvejxc2SubL
	mb3RqNSRxUyggtQsKIZ9N47HtKeGzWmT4rP363atB0NQM4VqWsqplDZpHozOMD6/CCLvFulWjeT
	0UPioeZAohWyyd6LhEfQsgkL8eDxOUxENX4PR+HKpMMNyC4qW9SoHTw0VwiapzpoB91wd4fMDm+
	SilHQUpEgYu6FJZEfoaqewrS4ajS8tLf4wSPMH8ka+rTJ3Hr78t6RcfPHyy3jkeS5REWgXFYmbd
	xRrx3N26N74sHftG5d/5lw++AMqs=
X-Google-Smtp-Source: AGHT+IHiWSAStiYpGW5KAigmZSZA0ERMAPot2WHmHlIhc20+7i+WJMJr7UHhYULuKhuPnQDRFkLrag==
X-Received: by 2002:a17:907:7d90:b0:ab7:bcf9:34f with SMTP id a640c23a62f3a-ab7bcf95824mr361190966b.15.1739187982729;
        Mon, 10 Feb 2025 03:46:22 -0800 (PST)
Received: from tom-desktop.example.org (net-188-217-54-237.cust.vodafonedsl.it. [188.217.54.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a9e6e06fsm428948566b.80.2025.02.10.03.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:46:22 -0800 (PST)
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
Subject: [PATCH 2/8] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
Date: Mon, 10 Feb 2025 12:45:34 +0100
Message-Id: <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
found on the Renesas RZ/G2L SoC, with the following differences:
- A different D-PHY
- Additional registers for the MIPI CSI-2 link
- Only two clocks

Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../bindings/media/renesas,rzg2l-csi2.yaml    | 63 ++++++++++++++-----
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 7faa12fecd5b..0d07c55a3f35 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -17,12 +17,15 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-csi2       # RZ/G2UL
-          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
-          - renesas,r9a07g054-csi2       # RZ/V2L
-      - const: renesas,rzg2l-csi2
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-csi2 # RZ/G2UL
+              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
+              - renesas,r9a07g054-csi2 # RZ/V2L
+          - const: renesas,rzg2l-csi2
+
+      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -31,16 +34,24 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Internal clock for connecting CRU and MIPI
-      - description: CRU Main clock
-      - description: CRU Register access clock
+    oneOf:
+      - items:
+          - description: Internal clock for connecting CRU and MIPI
+          - description: CRU Main clock
+          - description: CRU Register access clock
+      - items:
+          - description: CRU Main clock
+          - description: CRU Register access clock
 
   clock-names:
-    items:
-      - const: system
-      - const: video
-      - const: apb
+    oneOf:
+      - items:
+          - const: system
+          - const: video
+          - const: apb
+      - items:
+          - const: video
+          - const: apb
 
   power-domains:
     maxItems: 1
@@ -48,7 +59,7 @@ properties:
   resets:
     items:
       - description: CRU_PRESETN reset terminal
-      - description: CRU_CMN_RSTB reset terminal
+      - description: CRU_CMN_RSTB reset terminal or D-PHY reset
 
   reset-names:
     items:
@@ -101,6 +112,28 @@ required:
   - reset-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-csi2
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          maxItems: 2
+
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+
+        clock-names:
+          maxItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


