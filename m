Return-Path: <linux-media+bounces-14247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BA91A783
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4F7A282600
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3074D187344;
	Thu, 27 Jun 2024 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cC+QLSKb"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF63018A924;
	Thu, 27 Jun 2024 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493849; cv=none; b=dWU807EfR+KcjbMevAmyXSKKTHsKGKVVHsIpDAPe58Yd5QQmS2rFDu9scUrkaNZ8BaBsQxw1dwWb+UB5X+btmWkA+3Sbd4/f24UDsKdUuI/DIahBxnXknAdEbPBZpIZ1AwT13VBjhPy8F8hhOGzAsTe04UR/uE1SWdnqTo1SyOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493849; c=relaxed/simple;
	bh=mOPOzpOxDm8At4aQJ1DhFOiUZ8dOL9TTrKSHJfLLFC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=D17BmHzJ2C+NCfAjZAaf4sj5wjVHhCaxZFL1+3WHhW1yag3jx5d/jPGlp+LCAuLlk/ZkOFZFQQ0A3kXOyuaDFWT+RgqTdKY1b8rukLwHDpUK0meuqvCGksuCMvqkWng1t4fspcN/os3cZAqLSvs1s6Ub7MkQV0fyOzyDfvR092Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cC+QLSKb; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAQAa110206;
	Thu, 27 Jun 2024 08:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493826;
	bh=0j+pRnYIz0YmwJf02oM8YeGAX8XHeGu62s1LydGmz+4=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=cC+QLSKbV+3xODMuBtA1LrYRMlYoGhxRIiqHyyp4gCEXmC0jSU0IJqTJzK8L1/anB
	 WdKGOvFdZJi/B06wAXzrRClEfD8fEt1CPw80KMtPJP9hBRDaHDx0TiJYmyaVxSMCfL
	 8N6JSD6PuxFpJIGXkYj/gZoASkMvKugmz9OqnvbQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAQhN109079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:26 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:26 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAPI4038401;
	Thu, 27 Jun 2024 08:10:25 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:39:56 +0530
Subject: [PATCH v2 01/13] media: cadence: csi2rx: Support runtime PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-1-6ae96c54c1c3@ti.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
In-Reply-To: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3486; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=tXWucuzl8lsBqZDdK9Xa9QSqspro1tIHfpB88oP8kVY=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWSyY1mUjV+r0gi6AEE+mDxcG80C11C3v0iz/
 cFcoADbdBOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1ksgAKCRBD3pH5JJpx
 RYRuD/49QcTVhDjFDpCmcBH5UqIClgaCNj0YOlSbreynilOmz4jN+fTtPsE9r7LMq08JnZyy0OY
 BejyBq0Mr4nEgfDNpOpNyXlMwYxB89x71ffzYB0tgY32GyA+q4t6Ns70qvw8z/0z9hbqDZ1cDkS
 BOymj+4jLhIRdSyMNFGSXjvvAx0G4DGiITP6q9dYSnIJrIndKMbKjP18kYQcxRHTOgHWVxidBEZ
 YWd6itX3zXJyLD4454WlhxDMiVtexjbyHuDebuvkEEC0uLgQEHBo2Yf4lhi1vJXVTeEC/yTf46n
 4Gxt7rVrgrnDiCOl1wQYruwwmI3BMzQyfTW34tjrI4pYJZKgF0zQLk3PWy4yr3he6C7m4Gm3uNh
 ZinpLXcCDJ+vCTNxp8+jbRlp3Oserw9Cfv6VFE7PIowfZEfTUfgCA1xJ+gkEfT7cIvvhYiyekUF
 et5A+xMQLxrrq0hpRlLOi0MI4NjbNCtKZCaMuMoDl9UPKkm47iyfwLcdzUx/oH9NfssgIKji/L6
 u8VMn3N0k7xlaHGFPM5lPxjrHlN4OppgWi9CyNvml8kZMIh8M3/ourQFQwo8lB2l+w76WRAHzYk
 APzzTeW3qApchd2r1GmcZRYDcs+A/Hu08PRdwYpjDRCkvh4y94BnvcT7GmhIapM8jubcBVw/xGR
 X6GiHuvREUBL5iA==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Jayshri Pawar <jpawar@cadence.com>

Use runtime power management hooks to save power when CSI-RX is not in
use. Also stop/start any in-progress streams, which might happen during
a system suspend/resume cycle.

Signed-off-by: Jayshri Pawar <jpawar@cadence.com>
Co-developed-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 43 +++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 6f7d27a48eff..751eadbe61ef 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -366,6 +366,12 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
 	int ret = 0;
 
+	if (enable) {
+		ret = pm_runtime_resume_and_get(csi2rx->dev);
+		if (ret < 0)
+			return ret;
+	}
+
 	mutex_lock(&csi2rx->lock);
 
 	if (enable) {
@@ -375,8 +381,10 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
 		 */
 		if (!csi2rx->count) {
 			ret = csi2rx_start(csi2rx);
-			if (ret)
+			if (ret) {
+				pm_runtime_put(csi2rx->dev);
 				goto out;
+			}
 		}
 
 		csi2rx->count++;
@@ -388,6 +396,8 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
 		 */
 		if (!csi2rx->count)
 			csi2rx_stop(csi2rx);
+
+		pm_runtime_put(csi2rx->dev);
 	}
 
 out:
@@ -661,6 +671,29 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 	return ret;
 }
 
+static int csi2rx_suspend(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+
+	mutex_lock(&csi2rx->lock);
+	if (csi2rx->count)
+		csi2rx_stop(csi2rx);
+	mutex_unlock(&csi2rx->lock);
+
+	return 0;
+}
+
+static int csi2rx_resume(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+
+	mutex_lock(&csi2rx->lock);
+	if (csi2rx->count)
+		csi2rx_start(csi2rx);
+	mutex_unlock(&csi2rx->lock);
+	return 0;
+}
+
 static int csi2rx_probe(struct platform_device *pdev)
 {
 	struct csi2rx_priv *csi2rx;
@@ -707,6 +740,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup;
 
+	pm_runtime_enable(csi2rx->dev);
 	ret = v4l2_async_register_subdev(&csi2rx->subdev);
 	if (ret < 0)
 		goto err_free_state;
@@ -721,6 +755,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 
 err_free_state:
 	v4l2_subdev_cleanup(&csi2rx->subdev);
+	pm_runtime_disable(csi2rx->dev);
 err_cleanup:
 	v4l2_async_nf_unregister(&csi2rx->notifier);
 	v4l2_async_nf_cleanup(&csi2rx->notifier);
@@ -739,9 +774,14 @@ static void csi2rx_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2rx->subdev);
 	v4l2_subdev_cleanup(&csi2rx->subdev);
 	media_entity_cleanup(&csi2rx->subdev.entity);
+	pm_runtime_disable(csi2rx->dev);
 	kfree(csi2rx);
 }
 
+static const struct dev_pm_ops csi2rx_pm_ops = {
+	SET_RUNTIME_PM_OPS(csi2rx_suspend, csi2rx_resume, NULL)
+};
+
 static const struct of_device_id csi2rx_of_table[] = {
 	{ .compatible = "starfive,jh7110-csi2rx" },
 	{ .compatible = "cdns,csi2rx" },
@@ -756,6 +796,7 @@ static struct platform_driver csi2rx_driver = {
 	.driver	= {
 		.name		= "cdns-csi2rx",
 		.of_match_table	= csi2rx_of_table,
+		.pm		= &csi2rx_pm_ops,
 	},
 };
 module_platform_driver(csi2rx_driver);

-- 
2.43.0


