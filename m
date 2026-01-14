Return-Path: <linux-media+bounces-50671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1463FD1DEF6
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A067930703F4
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF913904E7;
	Wed, 14 Jan 2026 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oab1aact"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A838F924;
	Wed, 14 Jan 2026 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385371; cv=none; b=P55CThJp0WWvrTh/Oj8WaOah6NUturSg/67Y/PIi/KFXc4mHXmfqci84jYOacPM4xPMWcwsxspyEFw6AEtTjmKTymZcbPRMjR80CZJpUfTNw4CCEg7SLXKm6zj0O8CIWkM77FQNvvimuNH790CTH5lsaKrD3gVhp+KSxQKY3QbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385371; c=relaxed/simple;
	bh=kzz1stJ/eG8rdi6weyOcBPC+8rDtte6uRtWAAV5e9pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQ/8Iw10yzg4zVs0QpGP9swEF1xZvPfjV0dzA7JVIxSGwy8kssz+qk0ZNtBTkAAbNuYCnfiKxFtbWNkSziuLY+ZM37WBMhqe3GHyX7HZYvW9VoCpaA/clwP+V+ugZ2ULDgqqTxlfs9aFbArRseRWx2XY8ToAxddTq2VtJ4TxGP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oab1aact; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768385368;
	bh=kzz1stJ/eG8rdi6weyOcBPC+8rDtte6uRtWAAV5e9pQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oab1aactIrGMSI3JwCXPVsqN7dTfh0347oBjUsOOxVtvswc88KEmgVqaxHFYYVC5t
	 v3m93YY8zcZJ1RAHtXffzO9urKECL1ztur8ogx2EGDWGx81Kq99tGY3YNEKEjeblfV
	 SskMKasELF/gWKFkYWxGOccTJ3TC66f1UfB4beVrAd4nvdOhdlPYin0dOb/XZx1+cu
	 ECu4Q+RtDcSFHVHQ5R/8Nfg4SIoMS1ubDPVVQ+I3WdrSQGJwMk08b7+jv2OuDShmgG
	 4Ip5JNQY7aN5WJFSe0wRbJIEIOLATxeC/7k2CeoUNO9nqh+eUt7oMCVvBq6q36Vq0/
	 chgv2mT/e5OPA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:1dad:60e8:7174:bd20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E935F17E1355;
	Wed, 14 Jan 2026 11:09:27 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v12 1/6] dt-bindings: vendor-prefixes: Add Verisilicon
Date: Wed, 14 Jan 2026 11:09:13 +0100
Message-ID: <20260114100922.149187-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
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
index c7591b2aec2a..ce5c413948b1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1745,6 +1745,8 @@ patternProperties:
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


