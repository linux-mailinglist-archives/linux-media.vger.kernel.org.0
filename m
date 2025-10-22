Return-Path: <linux-media+bounces-45221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DEFBFB631
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 12:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 04C154F6D43
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B30326D48;
	Wed, 22 Oct 2025 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cFL95oC+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB836321441;
	Wed, 22 Oct 2025 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128561; cv=none; b=DlhnMstptaQqwC0/3c6RoUwnxrgYb3tM71Wz4gFqv1cBWPVGheAitswEGEQS5nF4uo9a6Tff5IMAuSXYOqpb7OQRbtTv2qKXheFxdl356J39akOb14pgLpUpDcHF5wd9I2sfa4ZKTzL8ZKoxJyV9m7ZA0CjVg/KA/DEaokUmuVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128561; c=relaxed/simple;
	bh=VxO5Aj0CaA/Xh87egtihuudIrRwyIJF9QzHLMV50RiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbwJcY3d3HG+5sW7Be9RJ/MeFH0kTfSgwkkTRwRD6oG1DYWMIcu4c2BT6DEimn/Gk8/O+Tf0SJ3cFByeaAfI6ini71+hum+yk3q9GYU+rUmZlz925eew04GP0NElB4Y/fTIXoyDK2ywIShd4sq/0R1xZDQutdpGdyddt23SbDLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cFL95oC+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2F2B13E2;
	Wed, 22 Oct 2025 12:20:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761128453;
	bh=VxO5Aj0CaA/Xh87egtihuudIrRwyIJF9QzHLMV50RiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cFL95oC+tTdBZATzozukND6oxsVTvmemEO3wxGXEpqNtAjf7CQqCDMHyaNmLKVJG0
	 xJ9P7X8B5UltcgO2uLMZW1MKB3UBRxkVSZLgUla9jF7jU2enJRc5nR+0ufmrDk90Kk
	 06DpB/G6sai9TuzroadQB8CxGLR+OLkT2x4lojZI=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v5 2/4] media: imx-mipi-csis: Move redundant debug print in probe
Date: Wed, 22 Oct 2025 11:22:26 +0100
Message-ID: <20251022102228.275627-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of data lanes is already printed as part of
mipi_csis_async_register(), making the first part of this print
redundant. Remove the redundant print, and move the debug print for
clock frequency to mipi_csis_parse_dt().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d5de7854f579..7c2a679dca2e 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1481,6 +1481,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
 	struct device_node *node = csis->dev->of_node;
 
 	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
+	dev_dbg(csis->dev, "clock frequency: %u\n", csis->clk_frequency);
 
 	csis->num_channels = 1;
 	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);
@@ -1566,9 +1567,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
 			goto err_unregister_all;
 	}
 
-	dev_info(dev, "lanes: %d, freq: %u\n",
-		 csis->bus.num_data_lanes, csis->clk_frequency);
-
 	return 0;
 
 err_unregister_all:
-- 
2.43.0


