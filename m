Return-Path: <linux-media+bounces-40067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB7FB29853
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55E420191A
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3666526B76D;
	Mon, 18 Aug 2025 04:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LdBce9V2"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F4F26A1B9
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491882; cv=none; b=Lt3GoCdBIPF9eb3JHJfTAvoV0Qz74iB/hf+XAvg2qSJjzYm8m8bsn64xWxRaetphfdroBRRSCAQH02nttTPIzUdEWn6fwl+6gTN9beySB/b9s9/ogPLkzJdO830kjfb6zTUuN7t+3XULheSXTkuVlth8NC/jVev0BaXthoUKXUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491882; c=relaxed/simple;
	bh=osaoglW2834XEtVSZIIWowajUJ+neYIdFRn2UNOXCzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=LlG0H8/aD40ztPaQaojWWt/CN+7ihe7FZPTG8U/OojVME+xWxOQFyvbjecAkDFovwc+Lgvkfse/wvRVEwRYt/UOmunpkfOGzc/HWUxMsDI4Wiew6/ktS7qmAPh93yf31PQKUImEraqh0neZrXu6ygycMnS0SNDVMfarVAKsoymU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LdBce9V2; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818043758epoutp0485d1df3fc2ae0077a28afba994f9e9cf~cwpANszpH2679326793epoutp04A
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818043758epoutp0485d1df3fc2ae0077a28afba994f9e9cf~cwpANszpH2679326793epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491878;
	bh=c8RAz1VxJoNOGjuBNlJXeuNS5QuaDyUEil3uYRNLyxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LdBce9V2LVQPseLkN+Az4E0r7eFtanC38ht1GaLi+VBvkOPWLRedgx3wKMLRcSYMl
	 N7mSK0R/YWzeoGG3Y/gAE0a7DI8hX1bVQ8RSzbDFZ4l4Ry5qSP749LvKKzhDtmCv5V
	 POwiud+8wfneHGwuRuf/7bFtbPyuULa5cFrqhHX0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250818043757epcas5p23c15cf258ef5fc3dbf98760cf273b689~cwo-h4yvB0138801388epcas5p2K;
	Mon, 18 Aug 2025 04:37:57 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c50M86WLRz6B9mD; Mon, 18 Aug
	2025 04:37:56 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250814141030epcas5p45a75274697463bbca9cab12f776a4e8c~bp3wECC8s1288712887epcas5p4Z;
	Thu, 14 Aug 2025 14:10:30 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141026epsmtip2c41e27576eca50949b643b58df963c58~bp3sPL3m81817818178epsmtip2n;
	Thu, 14 Aug 2025 14:10:26 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 06/12] media: imx-mipi-csis: Move irq flag and handler to
 mipi_csis_info structure
Date: Thu, 14 Aug 2025 19:39:37 +0530
Message-ID: <20250814140943.22531-7-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141030epcas5p45a75274697463bbca9cab12f776a4e8c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141030epcas5p45a75274697463bbca9cab12f776a4e8c
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141030epcas5p45a75274697463bbca9cab12f776a4e8c@epcas5p4.samsung.com>

FSD CSI IP has only one IRQ line, shared between imx-mipi-csis and
fsd-csi-media drivers. To extend this driver for FSD SoC support,
move the IRQ flag and IRQ handler to the device data(structure
mipi_csis_info).

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 4afa75734f05..a3e2c8ae332f 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -285,6 +285,8 @@ struct mipi_csis_info {
 	enum mipi_csis_version version;
 	unsigned int num_clocks;
 	const char *clk_names[MIPI_CSIS_MAX_CLOCKS];
+	unsigned int irq_flag;
+	irq_handler_t irq_handler;
 };
 
 struct mipi_csis_device {
@@ -1462,7 +1464,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	mipi_csis_phy_reset(csis);
 
 	/* Now that the hardware is initialized, request the interrupt. */
-	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
+	ret = devm_request_irq(dev, irq, csis->info->irq_handler, csis->info->irq_flag,
 			       dev_name(dev), csis);
 	if (ret) {
 		dev_err(dev, "Interrupt request failed\n");
@@ -1536,6 +1538,8 @@ static const struct of_device_id mipi_csis_of_match[] = {
 			.version = MIPI_CSIS_V3_3,
 			.num_clocks = 3,
 			.clk_names = {"pclk", "wrap", "phy"},
+			.irq_flag = 0,
+			.irq_handler = mipi_csis_irq_handler,
 		},
 	}, {
 		.compatible = "fsl,imx8mm-mipi-csi2",
@@ -1543,6 +1547,8 @@ static const struct of_device_id mipi_csis_of_match[] = {
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


