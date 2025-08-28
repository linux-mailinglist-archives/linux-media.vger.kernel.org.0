Return-Path: <linux-media+bounces-41228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F819B397B2
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 11:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1D941BA5711
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 09:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FCF2ED141;
	Thu, 28 Aug 2025 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cmPplpZB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3D2FD1A8
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371584; cv=none; b=DdDAvNac8gyw04qKbSfoEobVVT9Nm6ZENhg3u+KE66UqH3DVSYsM771ouIB4DJgtgjyubf1cVYQ2yDcmT2A/kJF+huzS59lk1xb08C7rdmMHDRfpguFCxwUbOpNRV8GT14gGctHlZciVUg8kACgZhcHbjKvgEx/nBAGUa6ViNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371584; c=relaxed/simple;
	bh=1MdHhx5v3BAcGEHa/tXlUx16gIqHZGCvXZONQJHLdec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=EzrXvN5gcyQrhQW/Q/9bCc9LuyeL9k03gry4JI8F/ARlwCotcC8H2tCfSMdvgXO+qotbq1+zHAsQjeOH16KkfKZEWKDIdSvwpxxg4I8Hdc4q2RjJjeQQSyjgZRPM7QA3fkcXJJAu/cPLYXRX2edv6XJYKqW2A7gCkgFccBnsW+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cmPplpZB; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250828085940epoutp04cd1275f18388477ab1333e42a04a790a~f4qWwo2GS2596825968epoutp04v
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 08:59:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250828085940epoutp04cd1275f18388477ab1333e42a04a790a~f4qWwo2GS2596825968epoutp04v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371580;
	bh=aP3JZ6i35oNdplmxk8s2s2TwgOzarCJEvRhAfBW6bEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmPplpZBw54vZbGtX98QypJRVKh9gmWmedPB3RLW1YnEucIP9lObd2Rqvou6w4V/i
	 Vj/ygvOkBL+ur0NIm4EKAiYMOOW4lFiyoRQDdNgOUXNufKlxzJiizZ2EHPahlUvjCz
	 nz6Uync4xXsO1X7PDucTGRcUxM5M0TLIRLyVxaMQ=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250828085940epcas5p2dc296e2f6fb3094d4a92b9bec7cf8f75~f4qWCpDdZ1971119711epcas5p2B;
	Thu, 28 Aug 2025 08:59:40 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cCFhW0wmTz6B9mC; Thu, 28 Aug
	2025 08:59:39 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250828085938epcas5p3595ab67c6e5c40ab97f0b4a81faa16b3~f4qUUXAYG1632816328epcas5p3i;
	Thu, 28 Aug 2025 08:59:38 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085935epsmtip2d8cbb386c83433afe77acbe5f651cc4c~f4qRo3wsh0306303063epsmtip2W;
	Thu, 28 Aug 2025 08:59:35 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
	ravi.patel@samsung.com, shradha.t@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH v3 4/7] media: imx-mipi-csis: Move irq flag and handler to
 mipi_csis_info structure
Date: Thu, 28 Aug 2025 14:29:08 +0530
Message-ID: <20250828085911.81266-5-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828085911.81266-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085938epcas5p3595ab67c6e5c40ab97f0b4a81faa16b3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085938epcas5p3595ab67c6e5c40ab97f0b4a81faa16b3
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085938epcas5p3595ab67c6e5c40ab97f0b4a81faa16b3@epcas5p3.samsung.com>

The Tesla FSD CSIS IP has single IRQ line, which is shared between
imx-mipi-csis and fsd-csis drivers. To extend this driver for Tesla FSD
SoC support, move the IRQ flag and IRQ handler into the device
data(structure mipi_csis_info).

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index cec035059445..2443906377bd 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -322,6 +322,8 @@ struct mipi_csis_info {
 	enum mipi_csis_version version;
 	unsigned int num_clocks;
 	const char *clk_names[MIPI_CSIS_MAX_CLOCKS];
+	unsigned int irq_flag;
+	irq_handler_t irq_handler;
 };
 
 struct mipi_csis_device {
@@ -1532,7 +1534,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	mipi_csis_phy_reset(csis);
 
 	/* Now that the hardware is initialized, request the interrupt. */
-	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
+	ret = devm_request_irq(dev, irq, csis->info->irq_handler, csis->info->irq_flag,
 			       dev_name(dev), csis);
 	if (ret) {
 		dev_err(dev, "Interrupt request failed\n");
@@ -1606,6 +1608,8 @@ static const struct of_device_id mipi_csis_of_match[] = {
 			.version = MIPI_CSIS_V3_3,
 			.num_clocks = 3,
 			.clk_names = {"pclk", "wrap", "phy"},
+			.irq_flag = 0,
+			.irq_handler = mipi_csis_irq_handler,
 		},
 	}, {
 		.compatible = "fsl,imx8mm-mipi-csi2",
@@ -1613,6 +1617,8 @@ static const struct of_device_id mipi_csis_of_match[] = {
 			.version = MIPI_CSIS_V3_6_3,
 			.num_clocks = 4,
 			.clk_names = {"pclk", "wrap", "phy", "axi"},
+			.irq_flag = 0,
+			.irq_handler = mipi_csis_irq_handler,
 		},
 	},
 	{ /* sentinel */ },
-- 
2.49.0


