Return-Path: <linux-media+bounces-8016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA9A88F2B3
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 00:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57CDE1F26099
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FFB155300;
	Wed, 27 Mar 2024 23:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="ZFaMkrGC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta242.mxroute.com (mail-108-mta242.mxroute.com [136.175.108.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0641552FB
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 23:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581475; cv=none; b=pkNa0dI9Z1G0x9ZwrTx5/O/OdnOHb3f1NLZLfYODXIC6KVgPHZdXhO88Ie/BZx6591EtcnYt2qbWJ6/FGuYt0hdbAXGEsHwf3oNe5F9DnrAORj4GyCUVEIwqAGzeM52RQWSZbk1iUxnqVpz4imk16T9PNTiA8YzUMdrSlg37Bmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581475; c=relaxed/simple;
	bh=1iE8P7W9oJH44MhsahqLftnU88zvC+0TSEH6ZniPwWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+TKjrGb2S3grApo/P85eU0eXEQovoS6hAb9yS0nfNhrqokfJiB8GXys+9FNDFmgDwoqHwtS01Z8O3GnFh+9hTNh1LR2zT39DStXKw9dO5ZJKogQEvdQqvgwrR7gCvgdMXj0P+OdDod6gnWWxEyn5GSsqyGdAvNfQOKcwAO2WV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=ZFaMkrGC; arc=none smtp.client-ip=136.175.108.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta242.mxroute.com (ZoneMTA) with ESMTPSA id 18e823447750003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 23:17:28 +0000
X-Zone-Loop: 50dd746378ee224bf39aa5af36231ee79fa6ef2f2164
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hq3LXvJ1k7/mJNF6jC9ba4k3K25mnAdHN91vxGscAic=; b=ZFaMkrGCR1VTgX5BJNZOHrhz+Z
	KLQI+o+Pd5s+9A9IseKwvfEU9EQK9bJRrCB+iG4OIo1SNJBDHHRBTyXVnU9GubB5obZfiVxtWwHcX
	cTxNm85ckb3KuflObK/r8YEazGnH8pip9kUxd7yFTxx4+aLYZejrhub1FHNMPt8bsMsma0knekvvj
	UOFLAlTz7Ai73jkJtFjKEK7eb0zz9c0vAhvMq5EpiJesb6YMjbsF/nhDiowRhy7adyO8t5CczWHRu
	37K1+kXrXa4rZKArZQdrCe5GZdNIXeslLOjFgtR+Q6mgFEai9gSmYEkolyFMnV4KTXZCBY63CugD1
	8EUSyzrQ==;
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
	Luigi311 <git@luigi311.com>
Subject: [PATCH 05/23] media: i2c: imx258: Add regulator control
Date: Wed, 27 Mar 2024 17:16:51 -0600
Message-ID: <20240327231710.53188-6-git@luigi311.com>
In-Reply-To: <20240327231710.53188-1-git@luigi311.com>
References: <20240327231710.53188-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The device tree bindings define the relevant regulators for the
sensor, so update the driver to request the regulators and control
them at the appropriate times.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Luigi311 <git@luigi311.com>
---
 drivers/media/i2c/imx258.c | 42 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index df7ed4716762..495eaada2945 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -7,6 +7,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -507,6 +508,16 @@ static const char * const imx258_test_pattern_menu[] = {
 	"Pseudorandom Sequence (PN9)",
 };
 
+/* regulator supplies */
+static const char * const imx258_supply_name[] = {
+	/* Supplies can be enabled in any order */
+	"vana",  /* Analog (2.8V) supply */
+	"vdig",  /* Digital Core (1.2V) supply */
+	"vif",  /* IF (1.8V) supply */
+};
+
+#define IMX258_NUM_SUPPLIES ARRAY_SIZE(imx258_supply_name)
+
 /* Configurations for supported link frequencies */
 #define IMX258_LINK_FREQ_634MHZ	633600000ULL
 #define IMX258_LINK_FREQ_320MHZ	320000000ULL
@@ -611,6 +622,7 @@ struct imx258 {
 	struct mutex mutex;
 
 	struct clk *clk;
+	struct regulator_bulk_data supplies[IMX258_NUM_SUPPLIES];
 };
 
 static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
@@ -995,9 +1007,19 @@ static int imx258_power_on(struct device *dev)
 	struct imx258 *imx258 = to_imx258(sd);
 	int ret;
 
+	ret = regulator_bulk_enable(IMX258_NUM_SUPPLIES,
+				    imx258->supplies);
+	if (ret) {
+		dev_err(dev, "%s: failed to enable regulators\n",
+			__func__);
+		return ret;
+	}
+
 	ret = clk_prepare_enable(imx258->clk);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "failed to enable clock\n");
+		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
+	}
 
 	return ret;
 }
@@ -1008,6 +1030,7 @@ static int imx258_power_off(struct device *dev)
 	struct imx258 *imx258 = to_imx258(sd);
 
 	clk_disable_unprepare(imx258->clk);
+	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 
 	return 0;
 }
@@ -1220,6 +1243,18 @@ static void imx258_free_controls(struct imx258 *imx258)
 	mutex_destroy(&imx258->mutex);
 }
 
+static int imx258_get_regulators(struct imx258 *imx258,
+				 struct i2c_client *client)
+{
+	unsigned int i;
+
+	for (i = 0; i < IMX258_NUM_SUPPLIES; i++)
+		imx258->supplies[i].supply = imx258_supply_name[i];
+
+	return devm_regulator_bulk_get(&client->dev,
+				    IMX258_NUM_SUPPLIES, imx258->supplies);
+}
+
 static int imx258_probe(struct i2c_client *client)
 {
 	struct imx258 *imx258;
@@ -1230,6 +1265,11 @@ static int imx258_probe(struct i2c_client *client)
 	if (!imx258)
 		return -ENOMEM;
 
+	ret = imx258_get_regulators(imx258, client);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to get regulators\n");
+
 	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
 	if (IS_ERR(imx258->clk))
 		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
-- 
2.42.0


