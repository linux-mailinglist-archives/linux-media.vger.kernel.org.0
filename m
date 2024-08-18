Return-Path: <linux-media+bounces-16416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ECD955E20
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 19:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BDF11F213D2
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 17:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915DA155391;
	Sun, 18 Aug 2024 17:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j5sXNqW3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CC9158D91
	for <linux-media@vger.kernel.org>; Sun, 18 Aug 2024 17:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002186; cv=none; b=noRb+IN5CY71whNrj35MmK+eMlgte59uT9NNadXGwg6VdMbBWu63kXeURwL0DF6nO4pxapRdibHQQAe4isNg+uB882l7sgHokU0IB319BtAYg+89epBOrxRrsXlkuCv1AXDzwfAMMKSiMbNWcPF+e2OXaj2fmg0IsP9Ph/JfREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002186; c=relaxed/simple;
	bh=QNM8XrDoLyxO8QrplQys76QoUHuBhx5cFyImCS2xftE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Amr4OpGE/iFNJOf0qnuHifv4GXHH4dH2A+SPY26SQ76wNq90uaIE7q+gFQGDgCi5ndw0UGCM749rDJ2SIN18TfWThHV/RDRg0sjl1n77iJXtTkW0cWCW2k/xqJRJo+Ez+uSWnUohN6Kr1zktuTClugQAsJhCF0LwGy8RWN1FZrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j5sXNqW3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so31101055e9.1
        for <linux-media@vger.kernel.org>; Sun, 18 Aug 2024 10:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002182; x=1724606982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+LvAPeMNmcVxWf/O9PUXhk3hF91siyLCuBckMkIHMM=;
        b=j5sXNqW3+ifeujsmUNrqKZ0gabZIjYaBhP1c0mpzEB/GNPlPDhdkMgeafEcIIMMLBI
         qjqPae072Ag2tWuDsiTHxuxCbZuJUcL4K5SwnCnGa1TfsuuAlECEuuKqUZQwatLve3/4
         JR4+3OmQovMmQkyflK03hy5hDD6XycRadhFqsHEWss8OGs9x4fzRFiPrMsefrqPk69e5
         cJajfl5GtVMxJvFyipfs5rorZ8kMCtc/0qrEzlkeJM/atXEp8RqkZOdWBEiWsA8C+qEA
         7Oya6IU+RIvYh3XFqUKFXGrWB5BBzbWV3FXKdAyIiSme25vXxCUgm9ksXPO774dGQw5R
         TWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002182; x=1724606982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+LvAPeMNmcVxWf/O9PUXhk3hF91siyLCuBckMkIHMM=;
        b=TBzNoDqPZQV38QVDvcuO2ygvk3DOMlj1Aom3VFbmLJA+UyvEi8ATCFx2hOopNQRYGM
         qTms2VwblJs/TvNADTcM/MTHevgygTSBLg5iqYa5ozeouQmt5Utx0Ymkbj7BvXMs0MT1
         QLccXqpbBddtw3I17BXiFSl3pKmsSIbvxntFhMOOofDmucAcEEufJwvKNw+78iG+5U1z
         GLyC5J6ruYzrOGtQzXrQS6+m8nj1xlaPFjY74ONmmxYbYaLVt1631Ycwd5/UR9LzkA9/
         /+nl1YrwCEKIZKioFCjffHx2w5sQob2EHaujgOu0aLaiAwBkX0Du5dGnfAROoH2PvN47
         kKKg==
X-Forwarded-Encrypted: i=1; AJvYcCVI67rgrUahQ3PoxVUajVgeAlTxe7J8Q461qDP78NSQwOHgNTTnxVeMnt/2smvFIzNbEb8WwDsLdhB9TNBQ1CwRVbclQCEDnSn6oE4=
X-Gm-Message-State: AOJu0Yw11RPZIwAZ2wVT/IVXfeZPUXmDBKVGQ4YO8P27W+k0rKtYsuig
	25Oupx4J+NEDHXtEePi94xJZ8W4ndEAJj3T0V1/Oo/HinpIXQjrs0aRJz1FI34c=
X-Google-Smtp-Source: AGHT+IF8i+fXJ0Qrg98bFngXom9Apje+WExMZ0DCNmKN+9aMo2M7gbBQQTCYC8dV5MiuQlqhPluOXA==
X-Received: by 2002:a05:600c:4f96:b0:428:16a0:1c3f with SMTP id 5b1f17b1804b1-429ed7da74emr55372845e9.32.1724002182565;
        Sun, 18 Aug 2024 10:29:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded2931asm133974385e9.17.2024.08.18.10.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:29:41 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] media: dt-bindings: renesas,vsp1: add top-level constraints
Date: Sun, 18 Aug 2024 19:29:37 +0200
Message-ID: <20240818172937.121928-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818172937.121928-1-krzysztof.kozlowski@linaro.org>
References: <20240818172937.121928-1-krzysztof.kozlowski@linaro.org>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/renesas,vsp1.yaml  | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 3265e922647c..94c0ab9a5be2 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -32,8 +32,15 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks: true
-  clock-names: true
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: vclk
 
   power-domains:
     maxItems: 1
@@ -81,11 +88,6 @@ allOf:
             - description: Main clock
             - description: Register access clock
             - description: Video clock
-        clock-names:
-          items:
-            - const: aclk
-            - const: pclk
-            - const: vclk
       required:
         - clock-names
     else:
-- 
2.43.0


