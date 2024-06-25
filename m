Return-Path: <linux-media+bounces-14094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D50916152
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 10:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1833B253E9
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 08:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FEF149DFF;
	Tue, 25 Jun 2024 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="f4RXLizk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CD1148850;
	Tue, 25 Jun 2024 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719304317; cv=none; b=kxYs/A893WE0J0sIzSd2MQyltLmec1WRxuHomrfuMHf6UJxmjh03gShX3hsGXZ6wVaywiLNE28YqSzXcSREU+d5QLkj3F8Ck1W0TUQcD66b7UmthsT/pWJ9m5iyCke0b2L78oC6Jg0evdnXdB8fzhwYACWxMLmNkr4B+WwCR7co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719304317; c=relaxed/simple;
	bh=LmfO5CUjX+AD6FODIFd4z8D5WgNrIle0Q9OSjKR7Cro=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h0+yhpntzDyr33PsUPo0DJ9F4d2jvqHabJ53tQl7NSU9n0YomfUUFN868ADbqiaqLA/5UOUKRuC52cKSskYAUsKKqac5U/OyY326C35uzGOdlbRkoVOhKX7RsVfcxZ9EOcunFhDtIPXfEWHvIk8sG9//n3oj9464hRYi3mB6QzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=f4RXLizk; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P17H8a026443;
	Tue, 25 Jun 2024 10:31:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	wtQG3ZhkBeytWTT2SWRn5kkG3sojPw2kyZipMCzkB1A=; b=f4RXLizkMMqsokZ0
	fJ469SamxnH4Jj/0a8TWrebsNNKzBK3Uzp59YoKoCzZ5yxDNaz7e0ZqLKoi2svEY
	rg+oZ8vhH2UeczJTb+bBYLLZsfy0Qx8nAF/yKD1hbhb7+9roqPTL7ios2ucDi4fu
	sEb4OPr9n0DlLHHn40daEHfLOURtL4hhtOom46KVO2xnzCTE2qxdvvUSjNd9cYsg
	i9UAbqnKnWdxB8XbMkhwEfbmx8YQZDEnSmvCR97ipu8FsiXQutQatRNkSZ4yZgtt
	VKkeIX8rNDisddr/JdA9lRLlsQ7x9+HVxVnbYgRUj6yKHcVKkEBIGtgD0nawF/4L
	FfyQkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywngdad2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 10:31:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AB0E04002D;
	Tue, 25 Jun 2024 10:31:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7469C2105AA;
	Tue, 25 Jun 2024 10:31:23 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 25 Jun
 2024 10:31:23 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] media: i2c: gc2145: use CCI_REG16_LE for little-endian registers
Date: Tue, 25 Jun 2024 10:29:55 +0200
Message-ID: <20240625082956.2556293-3-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625082956.2556293-1-alain.volmat@foss.st.com>
References: <20240625082956.2556293-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_04,2024-06-24_01,2024-05-17_01

Use CCI_REG16_LE macro in order to access little-endian
encoded registers of the P3 (CSI) section.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/i2c/gc2145.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index bbab24f3eb57..b0737fc9366d 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -68,8 +68,7 @@
 #define GC2145_DPHY_CLK_DELAY		BIT(4)
 #define GC2145_DPHY_LANE0_DELAY		BIT(5)
 #define GC2145_DPHY_LANE1_DELAY		BIT(6)
-#define GC2145_REG_FIFO_FULL_LVL_LOW	CCI_REG8(0x04)
-#define GC2145_REG_FIFO_FULL_LVL_HIGH	CCI_REG8(0x05)
+#define GC2145_REG_FIFO_FULL_LVL	CCI_REG16_LE(0x04)
 #define GC2145_REG_FIFO_MODE		CCI_REG8(0x06)
 #define GC2145_FIFO_MODE_READ_GATE	BIT(3)
 #define GC2145_FIFO_MODE_MIPI_CLK_MODULE	BIT(7)
@@ -79,8 +78,7 @@
 #define GC2145_CSI2_MODE_MIPI_EN	BIT(4)
 #define GC2145_CSI2_MODE_EN		BIT(7)
 #define GC2145_REG_MIPI_DT	CCI_REG8(0x11)
-#define GC2145_REG_LWC_LOW	CCI_REG8(0x12)
-#define GC2145_REG_LWC_HIGH	CCI_REG8(0x13)
+#define GC2145_REG_LWC		CCI_REG16_LE(0x12)
 #define GC2145_REG_DPHY_MODE	CCI_REG8(0x15)
 #define GC2145_DPHY_MODE_TRIGGER_PROG	BIT(4)
 #define GC2145_REG_FIFO_GATE_MODE	CCI_REG8(0x17)
@@ -861,8 +859,7 @@ static int gc2145_config_mipi_mode(struct gc2145 *gc2145,
 	else
 		lwc = gc2145->mode->width;
 
-	cci_write(gc2145->regmap, GC2145_REG_LWC_HIGH, lwc >> 8, &ret);
-	cci_write(gc2145->regmap, GC2145_REG_LWC_LOW, lwc & 0xff, &ret);
+	cci_write(gc2145->regmap, GC2145_REG_LWC, lwc, &ret);
 
 	/*
 	 * Adjust the MIPI FIFO Full Level
@@ -879,10 +876,8 @@ static int gc2145_config_mipi_mode(struct gc2145 *gc2145,
 		fifo_full_lvl = 0x0190;
 	}
 
-	cci_write(gc2145->regmap, GC2145_REG_FIFO_FULL_LVL_HIGH,
-		  fifo_full_lvl >> 8, &ret);
-	cci_write(gc2145->regmap, GC2145_REG_FIFO_FULL_LVL_LOW,
-		  fifo_full_lvl & 0xff, &ret);
+	cci_write(gc2145->regmap, GC2145_REG_FIFO_FULL_LVL,
+		  fifo_full_lvl, &ret);
 
 	/*
 	 * Set the FIFO gate mode / MIPI wdiv set:
-- 
2.25.1


