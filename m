Return-Path: <linux-media+bounces-44924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A242ABEAC95
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 18:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B24E7962313
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908F22F12BD;
	Fri, 17 Oct 2025 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="obDQn2Py";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rnWa754R"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F3B231C9F
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760716778; cv=none; b=gPSgd0aBSApsuiEz9FgdGRXprzkdbq4cl8X/yRNW5xOsF4paEjfkgud761csF94By9FUP7taUDFUiPzqmC0x47v7zvo1Mu2EEDe1jPClc2Qjm1Qxws6cct49Ggt6+5xGdTbYK3g+H+n4S0UC7bStl3Ntg7A98igBhmr6ly415BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760716778; c=relaxed/simple;
	bh=3rfRUOGwBTmBj8lA60AZVEwxCuWey8dCleZPXglv4TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CvsftI4SVB4enCBjCFs7x7t+lXHvqu2ezDPkMn7wGY4Y622EFhQ0dFKF4MYJUoWdZBC4cbjoGPjQzNo3GeMC95RD7NwG5WtGKrAs49GjcEsPbOrUr3R/RB5i4LTdEqBlafNjgP1Ys9Kx5jEv+H4Gi9g+lc1XQRGlLF/oSqN/fCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=obDQn2Py; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rnWa754R; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cp8dy37Fvz9t9f;
	Fri, 17 Oct 2025 17:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760716774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J60ARZeoH6yHHNV1eYD4xYcbRcMiyJ2+7xTBX0Mu1kk=;
	b=obDQn2Py2SUp9/20BiYE6hxzoR/hpzBb+6WjHyeoUma5diVDMdHg+lKkr3Fn9KWoSBDdhf
	sk00/195YjqLXuWJPWz0PXxLT9ykvWfxySuxgAAzwERVzHI1d5Ww8qGOTG4+AqAAGMruiq
	Qah6G+jhSSI1fZ0qXPXr5fAUN7pxJicwsLeDS56HJg9zxOx/8W2OgVILIzsKBQ2+C0GuXg
	HqAUfGUvUa3OugT/QTTqjhiOd+jFKpnwM5jNEcjkwMqCPoxAsJdKzDxIH2KZ2PT1PhOtGt
	1S7o16GZiUu1OgMSVstnFv5mmooPTZSVl7gGfGgVK02prc26wjlJxEgLwGXQRg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760716772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J60ARZeoH6yHHNV1eYD4xYcbRcMiyJ2+7xTBX0Mu1kk=;
	b=rnWa754RRvqAhRhWDfyzuzZs8RL91LnZBt/EjMHA6VzgKJKb8g2A6beVHFMZXaOTF6vYnQ
	tTeFniD30BU3Hr8n2wArG+f/Opjv2/bBmQvKXFhdipNQyfWrZxHIHbcAmxc2ZyI14lbznu
	YVBHRTx9NWzGGllt/ghjFpDDGnVM+ysQmpIh1M3TpWuX7Mj+PAw3lFwLfwCJKFscZFGAgg
	bUfL1FzZySvILeMLM6btMeCJrTKE8h1lBj3TEuS6t1meRcWL5aQANlCFRU0hXqAD5SRYqe
	TeGtO7pfJ0VSBk+w2A209/iB9kpv29rLHye9cktGV0A1NjmS5VNFsXQd7nA46g==
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] media: dt-bindings: nxp,imx8-jpeg: Document optional SRAM support
Date: Fri, 17 Oct 2025 17:58:37 +0200
Message-ID: <20251017155912.109454-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 15328b960a1f61f18bf
X-MBO-RS-META: oz5spw445857wu1tgyok8r1xu8tr74oq

Document optional phandle to mmio-sram, which can describe an SRAM
region used for descriptor storage instead of regular DRAM region.
Use of SRAM instead of DRAM for descriptor storage may improve bus
access pattern and performance.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ming Qian <ming.qian@oss.nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
---
V2: - New patch
V3: - Drop description: | and add RB from Frank
---
 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 4cba42ba7cf72..7340989489da3 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -55,6 +55,12 @@ properties:
     minItems: 1               # Wrapper and all slots
     maxItems: 5               # Wrapper and 4 slots
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional phandle to a reserved on-chip SRAM regions. The SRAM can
+      be used for descriptor storage, which may improve bus utilization.
+
 required:
   - compatible
   - reg
-- 
2.51.0


