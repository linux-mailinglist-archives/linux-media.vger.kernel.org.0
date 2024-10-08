Return-Path: <linux-media+bounces-19237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACA59947AC
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBC4DB234A9
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6184C1DE8BA;
	Tue,  8 Oct 2024 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Z10/lSqO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22F1DE3C1;
	Tue,  8 Oct 2024 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388202; cv=none; b=UFCL9UyZt5+S97kbywpZuzQte4kSUWstVzkJ6gWIDlQ0feUMyemCj3DFTPYlobq5bbhGam9aOgx2q7A6ZpPDgRc4irkZoNKrbv7KdTjOKbAuj2qg7lhmcMAZ265rQpdMUMnX8pcABP2xEa2KkVZLuPgfiR6gn9XfjH3fR+XGjc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388202; c=relaxed/simple;
	bh=1CqIry95tyv+kn3op8ngGR3vg8HBawuT8sY+KxfDEoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Vd8DigIpWkbQ0hF4bn853U9IuLc90hqjAU6FFAJO3dxzPgTtds1O6aydseVbLhxr0N+IeobMZBmcnU9ejVbgl3icS3+nigeXoVYcIxpWBvAMeL/q1Cj5ZcP7AqtNGT6/yxE0/5y/Vc1kAVRhoC/nXDOlQnduQl/VvU1qHKprZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Z10/lSqO; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4987vp5D014980;
	Tue, 8 Oct 2024 13:49:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	WTSg2agHV3N14FzR8O+U/92oSmSIzVerhwhnLxMBkrw=; b=Z10/lSqOA1St0BM9
	FNxd/jLP/ZfXjKlelKBBC4td8Iw2lLNyR1S/3oTEfIp9hOHSygZkOshU2OnpppYU
	+yfSVLv6gX6vVVvMe/u6PCaEUxlee6HEW0uTS9D9NBdu6nnMlj2b2Ejj3UaCGoDZ
	VFjlY2UGT0hKTMQb+lM+wnXQY3Ct/GZNvLTiOwVPAi/pO5tzy66U3vfXO1+KiII3
	Hm+Qi8qYJjbaIlk1Ady6LrRppJe9W6sF9Fdf04XVY69uj7Up6W0hNDK8DU3AiSFY
	cRxouLzon3Xk6QoAGLcGNkd8QWaeN/VBFwPnVNagCDuM87Palbwpw9sLPtRdrN5j
	kbZ7xg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423gdmk1jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:49:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9CBB54004D;
	Tue,  8 Oct 2024 13:49:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57C6626450B;
	Tue,  8 Oct 2024 13:46:37 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:46:37 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:46:07 +0200
Subject: [PATCH 3/4] media: i2c: st-mipid02: add pm_runtime handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-st-mipid02-streams-v1-3-775c2d25cef9@foss.st.com>
References: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
In-Reply-To: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Alain
 Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add handling of pm_runtime in order to control the supplies
and clocks of the bridge.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/i2c/st-mipid02.c | 49 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 1821a8fdd618..635b8a433d63 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -14,6 +14,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <media/mipi-csi2.h>
@@ -249,8 +250,10 @@ static void mipid02_apply_reset(struct mipid02_dev *bridge)
 	usleep_range(5000, 10000);
 }
 
-static int mipid02_set_power_on(struct mipid02_dev *bridge)
+static int mipid02_set_power_on(struct device *dev)
 {
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct mipid02_dev *bridge = to_mipid02_dev(sd);
 	struct i2c_client *client = bridge->i2c_client;
 	int ret;
 
@@ -283,10 +286,15 @@ static int mipid02_set_power_on(struct mipid02_dev *bridge)
 	return ret;
 }
 
-static void mipid02_set_power_off(struct mipid02_dev *bridge)
+static int mipid02_set_power_off(struct device *dev)
 {
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct mipid02_dev *bridge = to_mipid02_dev(sd);
+
 	regulator_bulk_disable(MIPID02_NUM_SUPPLIES, bridge->supplies);
 	clk_disable_unprepare(bridge->xclk);
+
+	return 0;
 }
 
 static int mipid02_detect(struct mipid02_dev *bridge)
@@ -470,6 +478,10 @@ static int mipid02_disable_streams(struct v4l2_subdev *sd,
 	cci_write(bridge->regmap, MIPID02_DATA_LANE1_REG1, 0, &ret);
 	if (ret)
 		goto error;
+
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
+
 error:
 	if (ret)
 		dev_err(&client->dev, "failed to stream off %d", ret);
@@ -504,6 +516,10 @@ static int mipid02_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
 	/* write mipi registers */
 	cci_write(bridge->regmap, MIPID02_CLK_LANE_REG1,
 		  bridge->r.clk_lane_reg1, &ret);
@@ -539,8 +555,9 @@ static int mipid02_enable_streams(struct v4l2_subdev *sd,
 	cci_write(bridge->regmap, MIPID02_CLK_LANE_REG1, 0, &ret);
 	cci_write(bridge->regmap, MIPID02_DATA_LANE0_REG1, 0, &ret);
 	cci_write(bridge->regmap, MIPID02_DATA_LANE1_REG1, 0, &ret);
-	dev_err(&client->dev, "failed to stream on %d", ret);
 
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 	return ret;
 }
 
@@ -868,7 +885,7 @@ static int mipid02_probe(struct i2c_client *client)
 	}
 
 	/* enable clock, power and reset device if available */
-	ret = mipid02_set_power_on(bridge);
+	ret = mipid02_set_power_on(&client->dev);
 	if (ret)
 		goto entity_cleanup;
 
@@ -890,6 +907,15 @@ static int mipid02_probe(struct i2c_client *client)
 		goto power_off;
 	}
 
+	/* Enable runtime PM and turn off the device */
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(&client->dev);
+	pm_runtime_enable(dev);
+
+	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
+	pm_runtime_use_autosuspend(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
+
 	ret = v4l2_async_register_subdev(&bridge->sd);
 	if (ret < 0) {
 		dev_err(&client->dev, "v4l2_async_register_subdev failed %d",
@@ -904,8 +930,10 @@ static int mipid02_probe(struct i2c_client *client)
 unregister_notifier:
 	v4l2_async_nf_unregister(&bridge->notifier);
 	v4l2_async_nf_cleanup(&bridge->notifier);
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 power_off:
-	mipid02_set_power_off(bridge);
+	mipid02_set_power_off(&client->dev);
 entity_cleanup:
 	media_entity_cleanup(&bridge->sd.entity);
 
@@ -920,7 +948,11 @@ static void mipid02_remove(struct i2c_client *client)
 	v4l2_async_nf_unregister(&bridge->notifier);
 	v4l2_async_nf_cleanup(&bridge->notifier);
 	v4l2_async_unregister_subdev(&bridge->sd);
-	mipid02_set_power_off(bridge);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		mipid02_set_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 	media_entity_cleanup(&bridge->sd.entity);
 }
 
@@ -930,10 +962,15 @@ static const struct of_device_id mipid02_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mipid02_dt_ids);
 
+static const struct dev_pm_ops mipid02_pm_ops = {
+	RUNTIME_PM_OPS(mipid02_set_power_off, mipid02_set_power_on, NULL)
+};
+
 static struct i2c_driver mipid02_i2c_driver = {
 	.driver = {
 		.name  = "st-mipid02",
 		.of_match_table = mipid02_dt_ids,
+		.pm = pm_ptr(&mipid02_pm_ops),
 	},
 	.probe = mipid02_probe,
 	.remove = mipid02_remove,

-- 
2.25.1


