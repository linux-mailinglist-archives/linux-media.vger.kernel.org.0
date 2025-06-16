Return-Path: <linux-media+bounces-34946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B05ADB48D
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15D7C188CBB6
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1878D219E93;
	Mon, 16 Jun 2025 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A1uoP15I"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B6517C219;
	Mon, 16 Jun 2025 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085783; cv=none; b=HHMlxTNfMQbKL/99BXoEw80DvPwH49jrUYEL86lUJFYwbuy+VvLTG7mgr2gj7UK1bqqv7SGI2r/ZTTs4frx+GFeTGUKBPzPAgXwB2x87uLIYlRIir4ggHxV57JCCh6cSj1Afjq3V6Iz5HqHPabz/xnOf6tisdHDzlqsRfMzR6Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085783; c=relaxed/simple;
	bh=vDNhE6D0+xM9nsC71kNglJTyFvwvNCXJzkresD5/eFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdxCucekvkBJA5UiieSNx55RvqnvvEg7t4cWiIi1Sscr9NFszzc7P5hQqwIpo8zo1eOhoisK/V43mtG4kmLNCjWcgbavXafBOXUc52UZ/QeywtXZdcti37LhR2mZGVmPmpAldFyqd4Qb/eAKX8aoOw4tijnqLiWq7UwpKyHm7kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A1uoP15I; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750085773;
	bh=vDNhE6D0+xM9nsC71kNglJTyFvwvNCXJzkresD5/eFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A1uoP15IPtqeZ9ehpU2DVm9At931Kd098SWwNz3rBgdJfWHHzhDvIyRGImW8q77Jy
	 NltegXeUZxbzNOIG3fNC97xxnhU6eMaS365aqVLTvaaHRZxmRhKhrNyKT/mrMjnOqr
	 5ISzFsUZi7D2v7VrTYIjcO/DOOo53JN/Id5kcTVcGpFW5WZqw0FrkWRfk/1hh/6swG
	 q9r5npi7woo/SkaTplvXSt3ENPdEbbgCyWhxz5v18SKODSyIrhQeYMly0hMSmCA2Xl
	 629Imsdl60COZcf/IZdga4SXTsJPJ4kRstX7VW2Iq5E3vzY5JCIhn0SWrmP9vG96u+
	 AZnXSbG29D9BA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4811:e81c:4b33:730c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6367D17E108A;
	Mon, 16 Jun 2025 16:56:13 +0200 (CEST)
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Verisilicon
Date: Mon, 16 Jun 2025 16:55:49 +0200
Message-ID: <20250616145607.116639-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
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
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..1baf8304c9ac 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1635,6 +1635,8 @@ patternProperties:
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


