Return-Path: <linux-media+bounces-41041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0128FB345E6
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 17:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF572A244A
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 15:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7852FF159;
	Mon, 25 Aug 2025 15:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IhQcx1yx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D84F2FDC5D;
	Mon, 25 Aug 2025 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136100; cv=none; b=UFv1k8QVa7mzXHT38tWgZHEAaPunjTph0AxmLdJGw4AqDF5XP+UqMGnUPUo/or3zxJghfxVz2+dgsCs5IRZgW13lcF3WoJ7iV49Q/VDuiqRw5Mv3HLBFoK8AVUEt6KuuobJHY7ys7jXDRBB3hf56BugHhZ7fyQiIGQayjKwi+nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136100; c=relaxed/simple;
	bh=guHXFU0f2kzdHH8bw4/i4gGvFNRMxxvXfItx9t7XXpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bz4hIHmvuSRjgYv+JK7j4STdfA+snKXDHyEjFB7qgHt6nwy02qa09624JzA3962cxvl7rE5Sz3d1+WCiVdNabUYspxFIvc21puvryfsQGuebo6CxA82Ar/r1TnKgLpVoBNLIk+fCg7BSBfwshN6NCT1vC4WijrlS1Ra4TIGVVuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IhQcx1yx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756136096;
	bh=guHXFU0f2kzdHH8bw4/i4gGvFNRMxxvXfItx9t7XXpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IhQcx1yx/cXEMqwbGaNbmqa/ukqqLeX0uEvxrArr8Qvx4tLcIWnWLxwTHLQqP5Tgg
	 NvL8tSNqc0Ldrc7Vtrbirb2/eMtHPGkfyGZSF2kVdHwT56w6Rm9JjKapZ85vx3YQn5
	 YWEuhvTByha7BysZUHu397Pv4mc8TPYBwOK72sJo7+YBS483n6/6j99l5L7FH2YYYZ
	 dYIbD1cXl8/8/1ivF5AphdQYu9M1j8gjY5rmye/hL9pjUq4lvOFHwL2untrR0OzB2R
	 mDre0e+62CSJuTWCNVyqPX+Xxs2OuVi9xrB7vYaXzGslGeXNl4lIP9WYbQ6IoeOYZG
	 Fs1eRchiPeyRA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f39:d9a9:8ef1:f69a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F0A017E07FB;
	Mon, 25 Aug 2025 17:34:56 +0200 (CEST)
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
Subject: [PATCH v7 1/6] dt-bindings: vendor-prefixes: Add Verisilicon
Date: Mon, 25 Aug 2025 17:34:40 +0200
Message-ID: <20250825153450.150071-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
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


