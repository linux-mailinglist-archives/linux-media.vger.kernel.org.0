Return-Path: <linux-media+bounces-41138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E76DB37E5E
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41DC41B6120F
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F85343D62;
	Wed, 27 Aug 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eUhQmUzt"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEAF340D9C;
	Wed, 27 Aug 2025 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285700; cv=none; b=CuBNvvwfuLThn0TWxngfJ7tRuiyhUn8LG/V/8Vj4F115KCcATSgYHt4hoUXInhJnsbqL2WaPzs/VdBOhgk3RAR/79n3/rLJHo1DhymapyLOdCkMWX3j6F2KQfs5BKbUpwF1tj2P+z0jHJRGqT2fdjCqdCKe6dzzDl1a6CnuRn+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285700; c=relaxed/simple;
	bh=guHXFU0f2kzdHH8bw4/i4gGvFNRMxxvXfItx9t7XXpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnVsqrTfSd8K3MSgNcmsdFnoUiHnvha9TYKCmMmlC1RprTqYzzNkh1X/xdHjptNHKA+ISqXF2duxZA8U+Gu45jPgKzv8DAr8pt6KVsils5KEg0ceOp3CiRS9M8Tim7KO3QWvFinWV12NLppKVk86drpCAODAi2dKcgoNYnwTjpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eUhQmUzt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756285695;
	bh=guHXFU0f2kzdHH8bw4/i4gGvFNRMxxvXfItx9t7XXpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eUhQmUztgLwm0qAhvr6kSH7XIK11pXCWn1//lRoesUiRwQ7Uq87zh2YYarw+jiiD0
	 x+fpT9L7kkt0dF8wLVdON+4rYia7JHA1vYALbCRRxXdCD+z7fY94pMJ/BwLjiMN8HF
	 3ia8+Dte8vTmdz0qf2D8YOPFWzNMu9KOhVUMfOBm+ZVUi1NBiWFRwGd5bUO/OX/wot
	 mB8pI7feELXuSQQ3vmHpczsVBwaYpwAODgaO+lUspXE2oUWcbUu/Y97+4hnmS69WGH
	 p1IOqyTiews4iXVtkVCrL0CTytTTSx3Z3kEgqAy3+Q6wHYed5jyJA5XlDfZVVxHnjT
	 CV+PJdLOrruhQ==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4be:99b9:5069:3bef])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 47B1217E0483;
	Wed, 27 Aug 2025 11:08:15 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/7] dt-bindings: vendor-prefixes: Add Verisilicon
Date: Wed, 27 Aug 2025 11:07:57 +0200
Message-ID: <20250827090809.34555-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
References: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verisilicon Microelectronics is a company based in Shanghai, China,
developping hardware blocks for SoC.

https://verisilicon.com/

Add their name to the list of vendors.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47f54..ef71164ab0ec 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1654,6 +1654,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.43.0


