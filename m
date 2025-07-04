Return-Path: <linux-media+bounces-36855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38107AF975D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 17:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D3B83A9545
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E314931551D;
	Fri,  4 Jul 2025 15:54:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EEC315514;
	Fri,  4 Jul 2025 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644448; cv=none; b=RHd84wGwlO/J1PCqPLJxyJLRGt4O36VOznHjTrbO6k9e62GfXCcZuvJKy1n5JIVt39t4jcxKmAesfYstX3JgXwMp/mkUFuyO408AfMWEm++tkcigbET0I3OqAC0zy8WyjDVWhSzfVYy8DCozqFivdHXH5DWWbZkp9p3Ry6WPCzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644448; c=relaxed/simple;
	bh=AN4d4CJv843ynBMIVI+NxgktoUoM3QNIdyWFWQgxNtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JllveIkPyU+qTs1op3cvX0qRj1A4wqG1Btism3Os5gq6yL1mbSaTV4xg2GBDsB9hF9MlxunNpOFs9Hy6yIKtEFCyxz5JgXFdK5Q1HEEOaKUViMyVqqRM0az+xA+VbNRqJQJviG5qi9XctSPmSBZfi6UNJSo7aDrcOK6frtk3vC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D9D1B1F0003D;
	Fri,  4 Jul 2025 15:53:55 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 1649FACA66C; Fri,  4 Jul 2025 15:48:02 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 1912BACA64F;
	Fri,  4 Jul 2025 15:46:34 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v8 1/9] dt-bindings: media: sun6i-a31-csi: Add optional interconnect properties
Date: Fri,  4 Jul 2025 17:46:18 +0200
Message-ID: <20250704154628.3468793-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704154628.3468793-1-paulk@sys-base.io>
References: <20250704154628.3468793-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An interconnect can be attached to the sun6i-a31-csi device, which is
useful to attach the dma memory offset. Add related properties.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
index 1aa5775ba2bc..978ef2dc0ae7 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
@@ -40,6 +40,12 @@ properties:
   resets:
     maxItems: 1
 
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: dma-mem
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     description: Parallel input port, connect to a parallel sensor
-- 
2.49.0


