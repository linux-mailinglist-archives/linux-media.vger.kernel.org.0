Return-Path: <linux-media+bounces-37884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4098B078EE
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 17:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B12B1888598
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 14:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61852F3C24;
	Wed, 16 Jul 2025 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAPv4bSc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CBF266565;
	Wed, 16 Jul 2025 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677801; cv=none; b=UQClrGd9NSZGLw1f+UQPz9WOuw9szDYKca2LdLgd63bHaXmF/89hv9YHkYAfu2w0xyCgZTrJ0x02zNK+EtoTq/suWe1a41shvHRcKeqiRV15kWqSoywmV9jWa58Kz6cC3EAhuUZHpDNswrGwyYl9zRDxCMCkyUyfeDFa5Q3rPA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677801; c=relaxed/simple;
	bh=LG4GU43wxofeRrb1Kj/ne7psfJ9PXUNmhnVUN75A/vE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQOyGMcVIbZHU9e1v9vN66Ja4rbI5A4+kOT68utQfeBYFfF2KTS++JMb99AW48LNqg0s+pzO94gZ09Qk3bGURRtdgWTuyF5GJAs5xDWTv+sO6bmhrdPni0ycwDQb8W9zYMzocW09aM7e/5N5EHpoT5Oz/RccN9wpjiPi9N6G3T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAPv4bSc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A616CC4CEF7;
	Wed, 16 Jul 2025 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752677800;
	bh=LG4GU43wxofeRrb1Kj/ne7psfJ9PXUNmhnVUN75A/vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lAPv4bScG032rhIL+YPhJ5f877XpBWPY9z9C4DYicAyGXvt2hBKlJakHLI0xVMZbN
	 HLWn61Cis3kF9GfKezEDUGeFN1HH8Tj4XsY0KhI/19ow60QTHWRla6/lbjjSq26ifh
	 Lm6tUsKg8xu0S5tGRjJ1RKsNvgTYAnGUUGPkzSKI9q8iUZsuh0H/XH9OobqDexL6UD
	 RWg5crT7rOnzu4gLBiYoCDK6szRSnOmGEGA503WeFfYcMHoCMUGowLakfV3aAORX33
	 Bv9/nrXWEbSfdaJTeKFwNr9nHObUuDekqYwKEjB4rFP36HxbV5RyEs6XHUM1dxBU9l
	 eOwBQuvj0TuuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C183C83F22;
	Wed, 16 Jul 2025 14:56:40 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Wed, 16 Jul 2025 14:55:52 +0000
Subject: [PATCH v4 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250716-allegro_dvt_al300_dec_driver-v4-3-f87c01c9f7b5@allegrodvt.com>
References: <20250716-allegro_dvt_al300_dec_driver-v4-0-f87c01c9f7b5@allegrodvt.com>
In-Reply-To: <20250716-allegro_dvt_al300_dec_driver-v4-0-f87c01c9f7b5@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=8o/phSRDVEyPtkg3r/C/TgOkCaTm11A1elPL4evlA4A=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWSU713Gdka0vnWmp+/MVeLO2po1KewG/5TsQnQf5X7r+
 vmjkflDRykLgxgXg6yYIssHg6XPvrDV+MxoYZsPM4eVCWQIAxenAExEvZvhf4ZdxYX0V9u4lKar
 9YoH6q+f4pR10uXawYs9c1Yk3mZXMGRk+LPaeZNujv2zlxGrFv1oaix4cCr/9+emHpX65xc2dvW
 7sAAA
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Reply-To: yassine.ouaissa@allegrodvt.com

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Add SAS (Société par actions simplifiée) to the allegro of vendor
prefixe description to include French simplified joint-stock company
legal structure.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..827fa988c5af4b59cf71e4cf47163e38eb1aa4c9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -82,7 +82,7 @@ patternProperties:
   "^alfa-network,.*":
     description: ALFA Network Inc.
   "^allegro,.*":
-    description: Allegro DVT
+    description: Allegro DVT, SAS.
   "^allegromicro,.*":
     description: Allegro MicroSystems, Inc.
   "^alliedvision,.*":

-- 
2.30.2



