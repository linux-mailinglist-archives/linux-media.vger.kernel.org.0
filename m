Return-Path: <linux-media+bounces-18910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8EB98BB25
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E131F22D5D
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 11:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590161C2DA4;
	Tue,  1 Oct 2024 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b2CuAZv9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACFB1C32F6
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782288; cv=none; b=bBl80ZviBi1WZYYwaGJBBx8+fgz/onVXu8vUBGK17otnYHN+zGZwAPW+eXUdAvL7TPXua/Q8ACeUyr0ti6Cqn+OzHDhoKM+/8wTk9mG58ShXMCjV/7Lejr1mvsLIaIRzsMaIvHsk5ZEj4z25ub5t/KEqHS4HEy93xwk9ZYp1cf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782288; c=relaxed/simple;
	bh=g+YODrDjEv3uWyUI51gEvyktxOrJFkglUZ44PXcbu44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IM1XMlwPhv89jO4BTtTCJpsPIrxAc4Bo3SPjhS+0C2IcV2htsX9yarlDbybj/05/RXcA6VOjQVpoyXFw3zsjVIQYuPfP6/cqt5bT6tggH18DGKmFa99c3dRx4JVpKtty+TrxnRYtGaQ7/OJgEvR5h7mTcCe+MZ/ckUI2wAVjj3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b2CuAZv9; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-718e2855479so3851003b3a.1
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 04:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782287; x=1728387087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLdzbrr7qqklLHRlLDBt3HAIeNP30xh3waq/7+yRzz8=;
        b=b2CuAZv9c5PrM+zQ6WZKeYKoPuUU624OUTw9qiq5sslsZahxjjDf0wbNL5Ri3kn5j+
         a9qh4/oFxLQQR50CF7g6PxTtor8RpznWHT4nT/I2IuFTba6a/qjxzy486Ue0ZeYHTyiO
         3c9rg7usNanVlovHLGe54ksJ2hjW/tJr+xipI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782287; x=1728387087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLdzbrr7qqklLHRlLDBt3HAIeNP30xh3waq/7+yRzz8=;
        b=tKzr3mYmkRDLXnYmI8UFQrlM4At4KVQ0qzDC+MKzpjqqAtmMOIAt5xYit3C0He6s+M
         9AXDryoN7UFy9EdUf855Wj2LEAKHko6/8BFqFcX1P8IvffBoOBDUnSS+S2oc7PJ5xQTn
         nAQun/HdXixSIBYR7osLX1a5E2dJXfTYz1888drp8irSqHXelGFfE8fLKHG4GtR5Eerc
         pScGJ9ddNYFOpnY/Vbz4oa3h0HqroBZT41H0H+dsvq/9lkkC1Ib8SAX4PdNCJm9zEEqw
         yGhskP1TGuFC8yd3JiGWvf2+VlT8quH0qw5BoolZzyN1B2LxgxFI+oURH2SuDWtnXSUm
         Xx7w==
X-Forwarded-Encrypted: i=1; AJvYcCUTx8oBMhvqpQP9f1j6m8hFuHoQ/GlIOFYb+ARlLxeVqNzOgjtSvktD5D0H4FNrNe5Lr1i5sxBJyl7YhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVVLueXQI7iCutO6GCl7iUs44UbUwMe6X8DrVeni5EMEZ3zuMm
	e0glNC0Q4VE2FiFjSTbyYn8k2eZj7Lo9AGuMzckFHd6zEU5qlfiXLkZ3UbUA4w==
X-Google-Smtp-Source: AGHT+IEgct/3Kv8qNzy6ataUfgMbDap5NRUyRDA2O/6Uj+INj/mxGJhKqWWS0ioNmqqYyO5Ym6qkyQ==
X-Received: by 2002:a05:6a21:e8b:b0:1d2:e94d:6e6d with SMTP id adf61e73a8af0-1d4fa806eb0mr21813265637.45.1727782286787;
        Tue, 01 Oct 2024 04:31:26 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:26 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fei Shao <fshao@chromium.org>,
	Bin Liu <bin.liu@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Xia Jiang <xia.jiang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/8] dt-bindings: media: mediatek,jpeg: Relax IOMMU max item count
Date: Tue,  1 Oct 2024 19:27:21 +0800
Message-ID: <20241001113052.3124869-4-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On MediaTek platforms with Multimedia MMU (M4U), a multimedia hardware
can be assigned with a local arbiter (LARB) which has a maximum of 32
ports for MediaTek's IOMMU infrastructure. That means there can be at
most 32 items in the iommus property in theory.

Instead of relaxing the max item count every time a newly introduced
device tree hits the limit, bump the number to 32 as an one-time effort.

On the other hand, all existing and foreseeable JPEG decoder nodes at
this point have at least 2 IOMMUs, so set minItems to 2 accordingly.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
It's not in the upstream tree yet, but the upcoming MT8188 DT will have
6 IOMMUs in its JPEG decoder. This patch is to pave the way for that.

Changes in v2:
New patch.

 .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml       | 3 ++-
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml       | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index cfabf360f278..a4aacd3eb189 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -44,7 +44,8 @@ properties:
     maxItems: 1
 
   iommus:
-    maxItems: 2
+    minItems: 2
+    maxItems: 32
     description: |
       Points to the respective IOMMU block with master port as argument, see
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 83c020a673d6..5b15f8977f67 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -39,7 +39,7 @@ properties:
 
   iommus:
     minItems: 2
-    maxItems: 4
+    maxItems: 32
     description: |
       Points to the respective IOMMU block with master port as argument, see
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
-- 
2.46.1.824.gd892dcdcdd-goog


