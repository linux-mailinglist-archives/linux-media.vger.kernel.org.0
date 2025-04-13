Return-Path: <linux-media+bounces-30085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB4A873A2
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 21:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 513E21893438
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 19:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323FC1F4619;
	Sun, 13 Apr 2025 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAC0wMSO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802101F3BA6;
	Sun, 13 Apr 2025 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744572936; cv=none; b=Jel3C7z70Uxf8n2dJD0GjtTXqBI1OQHxWWCstUuxNrHGFdFE9V2Bodb/ToeUGvVkpp4hMJwpFvNEk3xHikRu8r8+fTUyJ6JSgyMyUY9W5jIUvQT2aErhyR7RDBOsIP6o/Ld7XD+SbnSe9vVaK1zFmxcpf3bRFKST04gquTfcn8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744572936; c=relaxed/simple;
	bh=jQm4GUkn7k09Sv8tq8au4UoWhWittoIMnsrYmgTP/Ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjLrb/fIOR4yxOFgnoQmj3RIMKuImWWbNsKc+ZPiMS9CYj22yyLBYlWy5LwE+8RFco2jkFwxQHiKOBuhrmXPLMu76y2LHURlUakisQ2PV9Qb6cYLhNAQd8ON4WYZ7jvC/lJgmy9NOPrUw7fsZmWBvisiYgPAOozuZxUhViW+Ew8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAC0wMSO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 719ECC4CEE7;
	Sun, 13 Apr 2025 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744572936;
	bh=jQm4GUkn7k09Sv8tq8au4UoWhWittoIMnsrYmgTP/Ko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eAC0wMSODtOLZ8WGhzgyO+6dkKMlanhVOKnr2zI8BMHycdZgyq023KUO15vX9HZeq
	 jeNAkz9T6TMZ+7ycO07KS22mGpcKBuQC3dRtCt8rZzcKImh1+Lbtxwi1i9qAyaqsFg
	 sDJe6TGrWJnw5hdQ4f2oP8QYOWIoEBIgizZQIn9KKpYMFlSM4iCnXMJoDYHbRPdphh
	 trhTX662zVi0tPnpxW5K2rvme9ClYLSrOWmcG1VnKkzed5TAW1hfHmZPeVv1bbCnc0
	 yqvLsBjQ8mT3Yc8X7ASZOA76GOFOR99BNyOlio7H0LUFPmPERS8GYdHC4ejKmjWgBU
	 ko5/P5ME/x78w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AE8C369B2;
	Sun, 13 Apr 2025 19:35:34 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 13 Apr 2025 14:35:32 -0500
Subject: [PATCH v4 1/4] media: dt-bindings: Document Tegra186 and Tegra194
 cec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-tegra-cec-v4-1-b6337b66ccad@gmail.com>
References: <20250413-tegra-cec-v4-0-b6337b66ccad@gmail.com>
In-Reply-To: <20250413-tegra-cec-v4-0-b6337b66ccad@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744572933; l=1325;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=YVLzTrqjDbAvBpxX5/oSBtHgNAH8jFfg0U2e5NvPa4o=;
 b=CbsDPDI+SmLCLbWp8Gq2YDwlS4c7C2ntk92cjYP6qni2kavzT5i3g5d3zgCc85y/oPhov4rwY
 Q7WdL8YoEYLBspsxK44Z9teyjE8qEoKGU02+DVejuaXBoFZ9z5ItoR0
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
index a6b73498bc217a2e884e31af91e9d8845c9b1d76..4b46aa755ccd31d0ca8b2004a1d6345c27ed330d 100644
--- a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
@@ -14,10 +14,16 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra114-cec
-      - nvidia,tegra124-cec
-      - nvidia,tegra210-cec
+    oneOf:
+      - enum:
+          - nvidia,tegra114-cec
+          - nvidia,tegra124-cec
+          - nvidia,tegra210-cec
+      - items:
+          - enum:
+              - nvidia,tegra186-cec
+              - nvidia,tegra194-cec
+          - const: nvidia,tegra210-cec
 
   clocks:
     maxItems: 1

-- 
2.48.1



