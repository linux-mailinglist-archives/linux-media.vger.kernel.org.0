Return-Path: <linux-media+bounces-29818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1E8A83451
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 00:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 747A61B63FA0
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 22:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1C122173D;
	Wed,  9 Apr 2025 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5+hGrp5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAC721B8F5;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744239448; cv=none; b=IZSp6vmTjOErd/3hULgfBAl+uiRiNTpRGuLTGwFqETE6McXMUHXeZ4r+pPHOJ/n1nLpXT7h0Y4Qf0NGpcz+KGJf9sFTFva2nx9OWQCg8ICoM35jFhg4Oh8cjcKf89dfRrj1FUg/dhDafBeXAm78Yw8ypZFVKR79wOplU+HKMZnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744239448; c=relaxed/simple;
	bh=UNT1pMAsqJn0pGCkN1SyqdE1kYgNn4CxvqI1ODiDn60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXq1udVuKX8SS0yCxmyhQMirlhYOyfKuchfN3C85vWzJ5yKkSqYa7ZOdOCSo5MEFd+iof95NUkbeJ0Kcu4+JFf+piIscTNzX9ibwkZGDAoajkhPc6K/lNjUmoY+edOYFhcUidEvRySgaWSkhd8aCzhd4KFD+/prAsqcaz/d7m3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5+hGrp5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FC84C4CEE9;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744239447;
	bh=UNT1pMAsqJn0pGCkN1SyqdE1kYgNn4CxvqI1ODiDn60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U5+hGrp55PSYEOQHWQwoaWUcSEkJG/Hg4gE+wWP7k7NNzAZpsFU4VMjaBAei4uBgN
	 elRcujP4SDQR1Gop7Wpg5MWHirkfxXOuVHdltex+Kv/yb7JD2O0febylowWDgonMRg
	 R+fLYqMSf+ZGYBzjpNi+28HPhIinIcisk7BzxQb7RlDOhlc6XRas3Kg3S2gCfS3nYg
	 3+qHJ1LS71QalvfIhueqbUZhRIaqUTp1cTDdNx/WH+kfsvcJK1eZ55MOTo+wN/EOdv
	 dXEZMgoovUt1yscGvifOU6T8imKpRS9jGMeJWmV8V3ngQgeiFhfaaBijPivIClqdCo
	 HeqH3vB/FLp8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5789BC369A5;
	Wed,  9 Apr 2025 22:57:27 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 09 Apr 2025 17:57:22 -0500
Subject: [PATCH v3 1/4] media: dt-bindings: Document Tegra186 and Tegra194
 cec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-tegra-cec-v3-1-91640131dfa2@gmail.com>
References: <20250409-tegra-cec-v3-0-91640131dfa2@gmail.com>
In-Reply-To: <20250409-tegra-cec-v3-0-91640131dfa2@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744239446; l=1294;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=OKxF0kfZG4y0m8GxH7XJEPDEjS3nCDGshb6+1TkJSyA=;
 b=3Aq4MzVSdrZgI2CPGWCtMlp1Ksyfq5iPuzURj732chI+PPU/YpKFFSPq0frjZGKnNqs3nocfa
 m8hCRLQ1e+EBcHCi8lhVWD4xENPYiAJcspTq/dTIYX561AaTdMA2j8b
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

These are already used in device trees, so describe them here. As the
driver only declares up through Tegra210, these must use a fallback
compatible of tegra210-cec.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../bindings/media/cec/nvidia,tegra114-cec.yaml           | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
index a6b73498bc217a2e884e31af91e9d8845c9b1d76..3637fe2dfbd0dbb1baf265d7c128954df8faf740 100644
--- a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
@@ -14,10 +14,17 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra114-cec
-      - nvidia,tegra124-cec
-      - nvidia,tegra210-cec
+    oneOf:
+      - items:
+          - enum:
+              - nvidia,tegra114-cec
+              - nvidia,tegra124-cec
+              - nvidia,tegra210-cec
+      - items:
+          - enum:
+              - nvidia,tegra186-cec
+              - nvidia,tegra194-cec
+          - const: nvidia,tegra210-cec
 
   clocks:
     maxItems: 1

-- 
2.48.1



