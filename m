Return-Path: <linux-media+bounces-8550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA08973FD
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 17:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4137B2F728
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 15:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0BE14D70D;
	Wed,  3 Apr 2024 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="rk7hSq5h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta38.mxroute.com (mail-108-mta38.mxroute.com [136.175.108.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7421614D6EA
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 15:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712157193; cv=none; b=dPOTPnZt8+LHJYFuWClxPA7iV+80h0Nzau1qFz0sQBTqEtjW59ONf8QPz9koy0a4jFzFBV2DGgBK1phxMKDusg4eQjDuWkhFbr6P4iLykJ0u08iXZwmLOXCu6fln6e+lXhON+eYxZi2fUpruu1UkVeTX8Ey5LZWSvYTL2iih/kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712157193; c=relaxed/simple;
	bh=VFD26JWsHitZHMcIa+CH9jAdANVV/kh1yrN1SoO8jPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPH5ZF4uWe8WInPjl4eNma7N0uSYakfj2a5kleiE/AKrmZ0+z+56GXinz/X1InE0f6HcshnSa5TNJP4JUjHfByP5BfpsJREiufuU7tKe0t9WAkDotmTKtpUP6S4KDSIzTDPUB1B4HUPXJ0cXmGC0HSdlsI7S5rrDbQPmrA/lwYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=rk7hSq5h; arc=none smtp.client-ip=136.175.108.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta38.mxroute.com (ZoneMTA) with ESMTPSA id 18ea4803d380003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:07:31 +0000
X-Zone-Loop: 78ebd42722105389de6f03b7993afff1c488830e2aa8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AVanrnf9WKtpF/lXCLFB+cot3xTKMWXeny5RAb2sVCk=; b=rk7hSq5hVUTbYzXTxr+jhRGftj
	+jBlzDtEvC9TWoTEcmSVU6e0BtPdqRltn0Y9x3lYcXZaXLbHZuNspBxEL4tPx3LG9c3wZEIm5VO5g
	WkZaGva3+xy2P1WmXGQuG6wglYpB4/Kg4NaaHzD+Pg9Wi8bu4v7LokPPAyTZPglanr4PL+hx+8kh4
	134JygV5qgBsYRms2Yts9pIwVPuarSDC5/VkeCh8hMT+WC8yRYDwuoKKqQPo9FJI2eNg+HYuGxnC9
	0gTw6pytsp1jNQ4qpuxF4ebfAGWRNpIR0yrrUm+2ZdxTooL68UO4TTSQUwZwYw8fgx+kddJbLHQ8u
	JJy0l13Q==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v3 07/25] media: i2c: imx258: Split out common registers from the mode based ones
Date: Wed,  3 Apr 2024 09:03:36 -0600
Message-ID: <20240403150355.189229-8-git@luigi311.com>
In-Reply-To: <20240403150355.189229-1-git@luigi311.com>
References: <20240403150355.189229-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Out of all the registers that are defined for each mode, only around
10 differ between the modes.

Split the table into common and mode specific ones.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 drivers/media/i2c/imx258.c | 236 ++++---------------------------------
 1 file changed, 21 insertions(+), 215 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 321b504c6a48..351add1bc5d5 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -151,7 +151,7 @@ static const struct imx258_reg mipi_data_rate_640mbps[] = {
 	{ 0x0823, 0x00 },
 };
 
-static const struct imx258_reg mode_4208x3120_regs[] = {
+static const struct imx258_reg mode_common_regs[] = {
 	{ 0x0136, 0x13 },
 	{ 0x0137, 0x33 },
 	{ 0x3051, 0x00 },
@@ -216,27 +216,17 @@ static const struct imx258_reg mode_4208x3120_regs[] = {
 	{ 0x0383, 0x01 },
 	{ 0x0385, 0x01 },
 	{ 0x0387, 0x01 },
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0401, 0x00 },
 	{ 0x0404, 0x00 },
-	{ 0x0405, 0x10 },
 	{ 0x0408, 0x00 },
 	{ 0x0409, 0x00 },
 	{ 0x040A, 0x00 },
 	{ 0x040B, 0x00 },
 	{ 0x040C, 0x10 },
 	{ 0x040D, 0x70 },
-	{ 0x040E, 0x0C },
-	{ 0x040F, 0x30 },
 	{ 0x3038, 0x00 },
 	{ 0x303A, 0x00 },
 	{ 0x303B, 0x10 },
 	{ 0x300D, 0x00 },
-	{ 0x034C, 0x10 },
-	{ 0x034D, 0x70 },
-	{ 0x034E, 0x0C },
-	{ 0x034F, 0x30 },
 	{ 0x0350, 0x01 },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
@@ -266,234 +256,43 @@ static const struct imx258_reg mode_4208x3120_regs[] = {
 	{ 0x0220, 0x00 },
 };
 
+static const struct imx258_reg mode_4208x3120_regs[] = {
+	{ 0x0900, 0x00 },
+	{ 0x0901, 0x11 },
+	{ 0x0401, 0x00 },
+	{ 0x0405, 0x10 },
+	{ 0x040E, 0x0C },
+	{ 0x040F, 0x30 },
+	{ 0x034C, 0x10 },
+	{ 0x034D, 0x70 },
+	{ 0x034E, 0x0C },
+	{ 0x034F, 0x30 },
+};
+
 static const struct imx258_reg mode_2104_1560_regs[] = {
-	{ 0x0136, 0x13 },
-	{ 0x0137, 0x33 },
-	{ 0x3051, 0x00 },
-	{ 0x3052, 0x00 },
-	{ 0x4E21, 0x14 },
-	{ 0x6B11, 0xCF },
-	{ 0x7FF0, 0x08 },
-	{ 0x7FF1, 0x0F },
-	{ 0x7FF2, 0x08 },
-	{ 0x7FF3, 0x1B },
-	{ 0x7FF4, 0x23 },
-	{ 0x7FF5, 0x60 },
-	{ 0x7FF6, 0x00 },
-	{ 0x7FF7, 0x01 },
-	{ 0x7FF8, 0x00 },
-	{ 0x7FF9, 0x78 },
-	{ 0x7FFA, 0x00 },
-	{ 0x7FFB, 0x00 },
-	{ 0x7FFC, 0x00 },
-	{ 0x7FFD, 0x00 },
-	{ 0x7FFE, 0x00 },
-	{ 0x7FFF, 0x03 },
-	{ 0x7F76, 0x03 },
-	{ 0x7F77, 0xFE },
-	{ 0x7FA8, 0x03 },
-	{ 0x7FA9, 0xFE },
-	{ 0x7B24, 0x81 },
-	{ 0x7B25, 0x00 },
-	{ 0x6564, 0x07 },
-	{ 0x6B0D, 0x41 },
-	{ 0x653D, 0x04 },
-	{ 0x6B05, 0x8C },
-	{ 0x6B06, 0xF9 },
-	{ 0x6B08, 0x65 },
-	{ 0x6B09, 0xFC },
-	{ 0x6B0A, 0xCF },
-	{ 0x6B0B, 0xD2 },
-	{ 0x6700, 0x0E },
-	{ 0x6707, 0x0E },
-	{ 0x9104, 0x00 },
-	{ 0x4648, 0x7F },
-	{ 0x7420, 0x00 },
-	{ 0x7421, 0x1C },
-	{ 0x7422, 0x00 },
-	{ 0x7423, 0xD7 },
-	{ 0x5F04, 0x00 },
-	{ 0x5F05, 0xED },
-	{ 0x0112, 0x0A },
-	{ 0x0113, 0x0A },
-	{ 0x0114, 0x03 },
-	{ 0x0342, 0x14 },
-	{ 0x0343, 0xE8 },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x00 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x10 },
-	{ 0x0349, 0x6F },
-	{ 0x034A, 0x0C },
-	{ 0x034B, 0x2F },
-	{ 0x0381, 0x01 },
-	{ 0x0383, 0x01 },
-	{ 0x0385, 0x01 },
-	{ 0x0387, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x12 },
 	{ 0x0401, 0x01 },
-	{ 0x0404, 0x00 },
 	{ 0x0405, 0x20 },
-	{ 0x0408, 0x00 },
-	{ 0x0409, 0x00 },
-	{ 0x040A, 0x00 },
-	{ 0x040B, 0x00 },
-	{ 0x040C, 0x10 },
-	{ 0x040D, 0x70 },
 	{ 0x040E, 0x06 },
 	{ 0x040F, 0x18 },
-	{ 0x3038, 0x00 },
-	{ 0x303A, 0x00 },
-	{ 0x303B, 0x10 },
-	{ 0x300D, 0x00 },
 	{ 0x034C, 0x08 },
 	{ 0x034D, 0x38 },
 	{ 0x034E, 0x06 },
 	{ 0x034F, 0x18 },
-	{ 0x0350, 0x01 },
-	{ 0x0204, 0x00 },
-	{ 0x0205, 0x00 },
-	{ 0x020E, 0x01 },
-	{ 0x020F, 0x00 },
-	{ 0x0210, 0x01 },
-	{ 0x0211, 0x00 },
-	{ 0x0212, 0x01 },
-	{ 0x0213, 0x00 },
-	{ 0x0214, 0x01 },
-	{ 0x0215, 0x00 },
-	{ 0x7BCD, 0x01 },
-	{ 0x94DC, 0x20 },
-	{ 0x94DD, 0x20 },
-	{ 0x94DE, 0x20 },
-	{ 0x95DC, 0x20 },
-	{ 0x95DD, 0x20 },
-	{ 0x95DE, 0x20 },
-	{ 0x7FB0, 0x00 },
-	{ 0x9010, 0x3E },
-	{ 0x9419, 0x50 },
-	{ 0x941B, 0x50 },
-	{ 0x9519, 0x50 },
-	{ 0x951B, 0x50 },
-	{ 0x3030, 0x00 },
-	{ 0x3032, 0x00 },
-	{ 0x0220, 0x00 },
 };
 
 static const struct imx258_reg mode_1048_780_regs[] = {
-	{ 0x0136, 0x13 },
-	{ 0x0137, 0x33 },
-	{ 0x3051, 0x00 },
-	{ 0x3052, 0x00 },
-	{ 0x4E21, 0x14 },
-	{ 0x6B11, 0xCF },
-	{ 0x7FF0, 0x08 },
-	{ 0x7FF1, 0x0F },
-	{ 0x7FF2, 0x08 },
-	{ 0x7FF3, 0x1B },
-	{ 0x7FF4, 0x23 },
-	{ 0x7FF5, 0x60 },
-	{ 0x7FF6, 0x00 },
-	{ 0x7FF7, 0x01 },
-	{ 0x7FF8, 0x00 },
-	{ 0x7FF9, 0x78 },
-	{ 0x7FFA, 0x00 },
-	{ 0x7FFB, 0x00 },
-	{ 0x7FFC, 0x00 },
-	{ 0x7FFD, 0x00 },
-	{ 0x7FFE, 0x00 },
-	{ 0x7FFF, 0x03 },
-	{ 0x7F76, 0x03 },
-	{ 0x7F77, 0xFE },
-	{ 0x7FA8, 0x03 },
-	{ 0x7FA9, 0xFE },
-	{ 0x7B24, 0x81 },
-	{ 0x7B25, 0x00 },
-	{ 0x6564, 0x07 },
-	{ 0x6B0D, 0x41 },
-	{ 0x653D, 0x04 },
-	{ 0x6B05, 0x8C },
-	{ 0x6B06, 0xF9 },
-	{ 0x6B08, 0x65 },
-	{ 0x6B09, 0xFC },
-	{ 0x6B0A, 0xCF },
-	{ 0x6B0B, 0xD2 },
-	{ 0x6700, 0x0E },
-	{ 0x6707, 0x0E },
-	{ 0x9104, 0x00 },
-	{ 0x4648, 0x7F },
-	{ 0x7420, 0x00 },
-	{ 0x7421, 0x1C },
-	{ 0x7422, 0x00 },
-	{ 0x7423, 0xD7 },
-	{ 0x5F04, 0x00 },
-	{ 0x5F05, 0xED },
-	{ 0x0112, 0x0A },
-	{ 0x0113, 0x0A },
-	{ 0x0114, 0x03 },
-	{ 0x0342, 0x14 },
-	{ 0x0343, 0xE8 },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x00 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x10 },
-	{ 0x0349, 0x6F },
-	{ 0x034A, 0x0C },
-	{ 0x034B, 0x2F },
-	{ 0x0381, 0x01 },
-	{ 0x0383, 0x01 },
-	{ 0x0385, 0x01 },
-	{ 0x0387, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x14 },
 	{ 0x0401, 0x01 },
-	{ 0x0404, 0x00 },
 	{ 0x0405, 0x40 },
-	{ 0x0408, 0x00 },
-	{ 0x0409, 0x00 },
-	{ 0x040A, 0x00 },
-	{ 0x040B, 0x00 },
-	{ 0x040C, 0x10 },
-	{ 0x040D, 0x70 },
 	{ 0x040E, 0x03 },
 	{ 0x040F, 0x0C },
-	{ 0x3038, 0x00 },
-	{ 0x303A, 0x00 },
-	{ 0x303B, 0x10 },
-	{ 0x300D, 0x00 },
 	{ 0x034C, 0x04 },
 	{ 0x034D, 0x18 },
 	{ 0x034E, 0x03 },
 	{ 0x034F, 0x0C },
-	{ 0x0350, 0x01 },
-	{ 0x0204, 0x00 },
-	{ 0x0205, 0x00 },
-	{ 0x020E, 0x01 },
-	{ 0x020F, 0x00 },
-	{ 0x0210, 0x01 },
-	{ 0x0211, 0x00 },
-	{ 0x0212, 0x01 },
-	{ 0x0213, 0x00 },
-	{ 0x0214, 0x01 },
-	{ 0x0215, 0x00 },
-	{ 0x7BCD, 0x00 },
-	{ 0x94DC, 0x20 },
-	{ 0x94DD, 0x20 },
-	{ 0x94DE, 0x20 },
-	{ 0x95DC, 0x20 },
-	{ 0x95DD, 0x20 },
-	{ 0x95DE, 0x20 },
-	{ 0x7FB0, 0x00 },
-	{ 0x9010, 0x3E },
-	{ 0x9419, 0x50 },
-	{ 0x941B, 0x50 },
-	{ 0x9519, 0x50 },
-	{ 0x951B, 0x50 },
-	{ 0x3030, 0x00 },
-	{ 0x3032, 0x00 },
-	{ 0x0220, 0x00 },
 };
 
 static const char * const imx258_test_pattern_menu[] = {
@@ -955,6 +754,13 @@ static int imx258_start_streaming(struct imx258 *imx258)
 		return ret;
 	}
 
+	ret = imx258_write_regs(imx258, mode_common_regs,
+				ARRAY_SIZE(mode_common_regs));
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set common regs\n", __func__);
+		return ret;
+	}
+
 	/* Apply default values of current mode */
 	reg_list = &imx258->cur_mode->reg_list;
 	ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
-- 
2.42.0


