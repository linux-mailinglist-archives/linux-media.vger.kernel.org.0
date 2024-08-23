Return-Path: <linux-media+bounces-16636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E095C879
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 887E41F23702
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 08:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B739514A098;
	Fri, 23 Aug 2024 08:54:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03066149000;
	Fri, 23 Aug 2024 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403285; cv=none; b=eCUn2QW8wzCjbKaP+mxSyFxJvGnY5XLLdFkNruhEWtgKBdaKzDJoxUatlho7mHASNNZY3Vtw+pD7VO0BZJL6PjQyiVs/raIjChdpgLFlERKZpJ+5qjgQ7uMA5QKUW6t2KryEzqb1VPMwCpacaNK+rgoaXMR1xBRDMmWQaPdzXBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403285; c=relaxed/simple;
	bh=rtcgeT33srsfJzQEt0F/hj82yicRHFrRh+i12ro1Wnc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DryxPtYPLRhD/mQt8cPjzurcyUaVFRslUSVetSXSSv+vmUqe9Gk01721NbkNasUrdKDlIKWOHUBklvHhvzHkTBWm6QEUsbtxgh6G737JnIMmgL0AfBuelJRtpSwoL6LZl89dOQzn27lCwvQi7knFymKIEkE1t4mAqjxkH4K/T/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wqv1p3GSVz1HGkX;
	Fri, 23 Aug 2024 16:51:26 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A4C7140360;
	Fri, 23 Aug 2024 16:54:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Aug
 2024 16:54:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <s.nawrocki@samsung.com>, <mchehab@kernel.org>, <krzk@kernel.org>,
	<alim.akhtar@samsung.com>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/3] media: samsung: exynos4-is: Use for_each_available_child_of_node_scoped()
Date: Fri, 23 Aug 2024 17:02:15 +0800
Message-ID: <20240823090217.436622-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823090217.436622-1-ruanjinjie@huawei.com>
References: <20240823090217.436622-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Avoids the need for manual cleanup of_node_put() in early exits
from the loop.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 .../platform/samsung/exynos4-is/media-dev.c   | 27 ++++++-------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 5f10bb4eb4f7..73d620c325ec 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -482,15 +482,12 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 static int fimc_md_parse_port_node(struct fimc_md *fmd,
 				   struct device_node *port)
 {
-	struct device_node *ep;
 	int ret;
 
-	for_each_child_of_node(port, ep) {
+	for_each_child_of_node_scoped(port, ep) {
 		ret = fimc_md_parse_one_endpoint(fmd, ep);
-		if (ret < 0) {
-			of_node_put(ep);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -501,7 +498,6 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 {
 	struct device_node *parent = fmd->pdev->dev.of_node;
 	struct device_node *ports = NULL;
-	struct device_node *node;
 	int ret;
 
 	/*
@@ -518,7 +514,7 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 	fmd->num_sensors = 0;
 
 	/* Attach sensors linked to MIPI CSI-2 receivers */
-	for_each_available_child_of_node(parent, node) {
+	for_each_available_child_of_node_scoped(parent, node) {
 		struct device_node *port;
 
 		if (!of_node_name_eq(node, "csis"))
@@ -530,10 +526,8 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 
 		ret = fimc_md_parse_port_node(fmd, port);
 		of_node_put(port);
-		if (ret < 0) {
-			of_node_put(node);
+		if (ret < 0)
 			goto cleanup;
-		}
 	}
 
 	/* Attach sensors listed in the parallel-ports node */
@@ -541,12 +535,10 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 	if (!ports)
 		goto rpm_put;
 
-	for_each_child_of_node(ports, node) {
+	for_each_child_of_node_scoped(ports, node) {
 		ret = fimc_md_parse_port_node(fmd, node);
-		if (ret < 0) {
-			of_node_put(node);
+		if (ret < 0)
 			goto cleanup;
-		}
 	}
 	of_node_put(ports);
 
@@ -736,10 +728,9 @@ static int fimc_md_register_platform_entity(struct fimc_md *fmd,
 static int fimc_md_register_platform_entities(struct fimc_md *fmd,
 					      struct device_node *parent)
 {
-	struct device_node *node;
 	int ret = 0;
 
-	for_each_available_child_of_node(parent, node) {
+	for_each_available_child_of_node_scoped(parent, node) {
 		struct platform_device *pdev;
 		int plat_entity = -1;
 
@@ -762,10 +753,8 @@ static int fimc_md_register_platform_entities(struct fimc_md *fmd,
 			ret = fimc_md_register_platform_entity(fmd, pdev,
 							plat_entity);
 		put_device(&pdev->dev);
-		if (ret < 0) {
-			of_node_put(node);
+		if (ret < 0)
 			break;
-		}
 	}
 
 	return ret;
-- 
2.34.1


