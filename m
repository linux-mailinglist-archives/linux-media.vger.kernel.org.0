Return-Path: <linux-media+bounces-60416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D2pIzX1+WksFgMAu9opvQ
	(envelope-from <linux-media+bounces-60416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:48:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB064CEC66
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D7A4305027F
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 13:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E9947F2EA;
	Tue,  5 May 2026 13:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SllBr6n8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4CD43636A;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988901; cv=none; b=owbUErPUp8eeiiXCaaqwU78B4WySYh3oZX2A0BvFIOgNMDhxeu0ptcSbRyXjybTlbbIcjTcBrWHXMQWvILlaWrA+ZdZrTtGbJYFcG2qFBCrx9+fclKor3KSaN3EjbW3t8X1rKvYiW4nu+Js1yVhVcg9RluakLWIMfuczY+oRFZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988901; c=relaxed/simple;
	bh=ZkS76BCLU+zo9n7zbI28IwwrrkQ/22eIFfSB9KTS1Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chpgjjnJWRtnFs8L7waxRhsNNbm/Fh2Qxj56WSexP936p+fGRPOOTEN76VG64VPq+AvPJEmkHuD6mOosmf7nSicJXLNLc70waN+LLGkVBDBXppLUpDJW0AUpmwFI3UYP/n6iIexddHv/zdDlcQch5GcEGKHco30wCPrKiTQKOIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SllBr6n8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E5CC2BCB9;
	Tue,  5 May 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988901;
	bh=ZkS76BCLU+zo9n7zbI28IwwrrkQ/22eIFfSB9KTS1Ps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SllBr6n8Cxs9RRgpr4jdXZ4hH9fuTlXdH/1AVz4IZDTBxzvH64tVKr9S1lwzBjuVK
	 qkhMIw7b64E4/JIMpx6eERkqsB8fyq/ZP42qJTaF/fZPjqQd3qBNFUwf4SzLMwFNOF
	 LQe6Xd5NWy8blneFqInfkLgZQH0lpIZGzJaWqcis5dhfRXUs7oh8JuY4F7eBU8p9E2
	 2hA+ArljZ1E4U6S8gXYHTPFD/uvLcFrJCumhrBj08j67/psR42QaZlPVkc0yBCHsdQ
	 4qbEHoLzwOFJWdTpQe9kusM71gfRnaLILb3qP10vAymRh4lev5daJacZ9/BqmbLWTi
	 jKnTeOxBHQCSw==
Received: by wens.tw (Postfix, from userid 1000)
	id 35B365FADF; Tue, 05 May 2026 21:48:19 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count for H6
Date: Tue,  5 May 2026 21:48:05 +0800
Message-ID: <20260505134812.408316-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505134812.408316-1-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0BB064CEC66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60416-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On the H6 SoC, the Video Engine has two memory ports, thus two IOMMU
connections. The secondary one that is missing is likely used for
reading reference frames. The newer H616 is the same. On the other
hand, the D1 only has one memory port.

Add the missing IOMMU connection for the Video Engine.

Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 01f2afa023f0..932043d7f0cc 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -55,7 +55,10 @@ properties:
     description: Phandle to the device SRAM
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: VE port on IOMMU
+      - description: VE_R port on IOMMU
 
   memory-region:
     maxItems: 1
@@ -82,6 +85,22 @@ required:
   - resets
   - allwinner,sram
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h6-video-engine
+    then:
+      properties:
+        iommus:
+          minItems: 2
+    else:
+      properties:
+        iommus:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.47.3


