Return-Path: <linux-media+bounces-29668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAC0A816F5
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 22:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 552321B88009
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 20:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7179325522C;
	Tue,  8 Apr 2025 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYSl2Q6d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939312451C3;
	Tue,  8 Apr 2025 20:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144222; cv=none; b=Qx+yAw01L8ArXCmTMEO0I11OcxsCiT7nkuQ0f4YEisX0++7447HUxpUPfaX+8cZo6Hf99xndHhBMsGC/eXnS8oGlrKor1TCLF8GRT9MI4zmRXznT11pohqOFYAQfmhpW6FaaA+IhzhR50fFTgAETi0ppSXdu8f2Fjov0+lO3Jj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144222; c=relaxed/simple;
	bh=wpRqqLY7CzZcHbIJblLpxYsCFyqmfoFX59k5mdxUSwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSKJH3KphhT4jA0sfsaoa2uGvR9LVi22WZXTZ2dEllC9a3NqeO/AuAw+HJzWcyUD2sJ++qavCc60R9G01jS+5tGj02z/hnxMihFOMbA62qxJ2N3iE+Ys5K4ZD7Gc+csqPdCRNN/waEFx9FlkvkRoycQMGwGvzYpP+CU6KMSHuZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYSl2Q6d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2527BC4CEE8;
	Tue,  8 Apr 2025 20:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744144222;
	bh=wpRqqLY7CzZcHbIJblLpxYsCFyqmfoFX59k5mdxUSwI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MYSl2Q6d3AyVkV+DohDIQYALdGOmN4YcBRK/EAICR3D4ntqxbSKkh+YoNDxeSYIkz
	 T4vgnAbrWS6SPUK31akcAOE0NUNihYKubSwNLExhAqFOVp0EzNDrYnJ2gAcVGf2Gcb
	 oPdHQDHWMl1Zrgm5TjaqpyNxs7wSW5zbdhJHJw/vZ3zIpd2yMPgCKJ2giMqa83Xbf1
	 g2VTXlBU9zRKkvAIoxlzZgeY38jxjvw8eCiv47mFBO7MyadpK5q4OnGXJ9VsJFH8px
	 IlJVjNjbj02YuPgluIxEXSyOQ95enpgzi00oGSRUHBCnaWZtvRb1A51SkJUTeu/uAX
	 bAB9bXi3szBvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06969C369A1;
	Tue,  8 Apr 2025 20:30:22 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 08 Apr 2025 15:29:58 -0500
Subject: [PATCH v2 1/4] media: dt-bindings: Document Tegra186 and Tegra194
 cec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-tegra-cec-v2-1-2f004fdf84e8@gmail.com>
References: <20250408-tegra-cec-v2-0-2f004fdf84e8@gmail.com>
In-Reply-To: <20250408-tegra-cec-v2-0-2f004fdf84e8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744144221; l=1268;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=SBYzrweVVHLN9la+8OOVglqXjFrZuIt0vhyqD1iWVzg=;
 b=c/Vwe4H1CX5ETUdsgR85HAxn13r302DIxxMZB8i6lEvx6Us0UXfEeqEXDKvJg+EQxc6dsxPN0
 AOwS25krisOAEiJ9xrZedblBCP6j4yEnQVdweo4DHva7rRea6m8qyjG
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
index a6b73498bc217a2e884e31af91e9d8845c9b1d76..20d8eb975c2bf67acd407a4683a698b2bfb7c5f8 100644
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
+        - enum:
+          - nvidia,tegra114-cec
+          - nvidia,tegra124-cec
+          - nvidia,tegra210-cec
+      - items:
+        - enum:
+          - nvidia,tegra186-cec
+          - nvidia,tegra194-cec
+        - const: nvidia,tegra210-cec
 
   clocks:
     maxItems: 1

-- 
2.48.1



