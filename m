Return-Path: <linux-media+bounces-8554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C8B8973ED
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 17:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE637B30246
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 15:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0750E14A4ED;
	Wed,  3 Apr 2024 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="nSDBw2o8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta205.mxroute.com (mail-108-mta205.mxroute.com [136.175.108.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E0F149E1B
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712157238; cv=none; b=Efsd2qfBx5dBc/2nvZ14cjAX2HiMVm/8XNt8rJ03DK89qjrFyLATh2xF13KdlHErSsaaZzB2Wb1Qu7T1FgcQwawhGYRn/qLEs9ReTvjsytI6r2Do5XU8ri8duy4a1fjzdGhmeuLybjt8NyQZm0U/zPTtOtX6ZAC1ahJDvc5DBPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712157238; c=relaxed/simple;
	bh=YP2YU+q50j+CbuHVFQ7Q2sHtBliifq6fjUJyisehTWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7dV/sk/cREQsQQ7gPQWMO2aCvK/9pl+zxUdYMyPvvoLk309CdQ1Et9MUIlJqJe4lxm1HMXNiYIEa048O7xcqjsVkbT4Qd6D9sa9yOsFNFGnaq8cdU7WPjdfnSdF0ookjIjF5wHpuiwl1Td+uSiQqp8X0oqCgUN5KdwQ6c1qK6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=nSDBw2o8; arc=none smtp.client-ip=136.175.108.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta205.mxroute.com (ZoneMTA) with ESMTPSA id 18ea48075bf0003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:07:45 +0000
X-Zone-Loop: 1533531df116e4aed957155ba4753ff781b055f8f346
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vV24gh/XiUknGj+/6PBHcigmW60OQcUrTVgV2ZFCgAA=; b=nSDBw2o8qZiHtzGttu4lhL+mzm
	xUg7GS6gF74J/O4inDzLvqSZVcHM+gS6RUDioKpvYL9KIpzjVOUrPr/ovLyfhAeFNNgmR/0JcBtK0
	WAny9B81Z4k38CuAbcmgyIzNKyu3qskRQIGLCkjYWq39VydY6qUrSczzo8JWAYX0VcB1soPBgLgY5
	cVXc7Kqe01oRfNH1RuBKt3wJDWhpz1tQh1CJPhijbnf9ou6KPZE7R3tMjIsb76sf6fvgNqrNhnUgk
	uOMN7iFhB+/2UaZ3dXglEGLlwiXIz0ATaljweq/FU247lCLZqFWKlN3eHTnCvUHb2llEJ5q2HNqGl
	ebP4VDYA==;
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
Subject: [PATCH v3 14/25] media: i2c: imx258: Issue reset before starting streaming
Date: Wed,  3 Apr 2024 09:03:43 -0600
Message-ID: <20240403150355.189229-15-git@luigi311.com>
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

Whilst not documented, register 0x0103 bit 0 is the soft
reset for the sensor, so send it before trying to configure
the sensor.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 drivers/media/i2c/imx258.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 5a5bf2b25bdf..c242e318be11 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -20,6 +20,8 @@
 #define IMX258_MODE_STANDBY		0x00
 #define IMX258_MODE_STREAMING		0x01
 
+#define IMX258_REG_RESET		0x0103
+
 /* Chip ID */
 #define IMX258_REG_CHIP_ID		0x0016
 #define IMX258_CHIP_ID			0x0258
@@ -1052,6 +1054,16 @@ static int imx258_start_streaming(struct imx258 *imx258)
 	const struct imx258_link_freq_config *link_freq_cfg;
 	int ret, link_freq_index;
 
+	ret = imx258_write_reg(imx258, IMX258_REG_RESET, IMX258_REG_VALUE_08BIT,
+			       0x01);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to reset sensor\n", __func__);
+		return ret;
+	}
+
+	/* 12ms is required from poweron to standby */
+	fsleep(12000);
+
 	/* Setup PLL */
 	link_freq_index = imx258->cur_mode->link_freq_index;
 	link_freq_cfg = &imx258->link_freq_configs[link_freq_index];
-- 
2.42.0


