Return-Path: <linux-media+bounces-48405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1543ECAD4F6
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 14:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2EE993012EDC
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 13:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AAD318138;
	Mon,  8 Dec 2025 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nE19+gsP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417892F5A34;
	Mon,  8 Dec 2025 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765201313; cv=none; b=Ugn97yZy3wXYb2biAloL7lQ/ZmWH7UafftVhS9QfLTbLdE6e2Oy7Je8wtJlz6NHQ94aHnaKrAIwHWS8czgKveU0Kch/fAtr/r+gnsLeJfyv8Jzwhi+egMxkq7uhE07RFGlaUhDsahEBj1pij7HAqR/3Qz5i2bkZAgT/4Hpd8I3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765201313; c=relaxed/simple;
	bh=Xi23dNBeLnbyP+MfAVL3IQS68z/4ZfOXaIm5R1+0ooA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QXILLORwerVDQ1cov2z2p/NSqc3druRGA+ah7dp0Lf0c+Fk5aop2bw0AmZbnjz5cam+LZjT1Yk+QHDZIUAFOha0TqmG1idkLd8s1jc0x8ngHmMTREcdvdz/89akuHtU0yHh9/PJdUm5CZeSLiiLcvdBnBmA27uQgY5xvDd1PMOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nE19+gsP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0C16C2BC86;
	Mon,  8 Dec 2025 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765201312;
	bh=Xi23dNBeLnbyP+MfAVL3IQS68z/4ZfOXaIm5R1+0ooA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nE19+gsPqXNRzQMB40dD/IYjbZ0CXRC3bAE6i1VxdXZgo1lFPBnb5wABu+sb0V9Gq
	 mObCJ3LHg8A1HV086OSBbazAvTDDGIDsRGkGBV39u7kAdQJNUjRWMCb5XWpcXM1IHa
	 K7g0L3yqrL+MpPUE7vddFUgmVUTQZeiXtkyznmXXmjAFtV9tWo6IUqmsFtnbPHVeAJ
	 FKaYD1yopiA9bO2n03jz4kXg3XhyuKQfSrH/wVMJqCQ5M4ht11h8YffqnwW+YhkkU7
	 zgwUZIwMnVMJ+UKeY+/j90v4P1ghoajqPPEHr0xZ3Es6AC2K9/c3XT7kvjj3mogPHt
	 XJU1TgM336rSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B54D3B7E2;
	Mon,  8 Dec 2025 13:41:52 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Mon, 08 Dec 2025 14:41:23 +0100
Subject: [PATCH v6 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251208-allegro_dvt_al300_dec_driver-v6-3-2e51ab2e4ce9@allegrodvt.com>
References: <20251208-allegro_dvt_al300_dec_driver-v6-0-2e51ab2e4ce9@allegrodvt.com>
In-Reply-To: <20251208-allegro_dvt_al300_dec_driver-v6-0-2e51ab2e4ce9@allegrodvt.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=dwi2brNNC57NCpVLbkKs5CwBSDc3o/+yQYET7H88jNk=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWSaXZ3HyhP9aeV7sQX71I4ZXhH/GLYp/rBSPEfXhQ9fG
 uITzDl/d5SyMIhxMciKKbJ8MFj67Atbjc+MFrb5MHNYmUCGMHBxCsBEtu5hZHi7c9riY/OXGKVx
 HIh5oH47/LvBDXMzubUGXLNtF7tGabUx/GZtLWG6euRtKd97zr92DuFiRiu1HVU4jDS2Spbtz/F
 6xA8A
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
index c7591b2aec2a..8376312dd9e4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -87,7 +87,7 @@ patternProperties:
   "^alfa-network,.*":
     description: ALFA Network Inc.
   "^allegro,.*":
-    description: Allegro DVT
+    description: Allegro DVT, SAS.
   "^allegromicro,.*":
     description: Allegro MicroSystems, Inc.
   "^alliedtelesis,.*":

-- 
2.50.1



