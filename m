Return-Path: <linux-media+bounces-16638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E2895C87F
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 895582836FF
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 08:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA3E1547FE;
	Fri, 23 Aug 2024 08:54:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C0B1494D6;
	Fri, 23 Aug 2024 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403286; cv=none; b=g1Gn2HKvOzNpNE4wVLCvbwx6Upv/dmt22NHEe0wiTQljyQ8MvoHlJXtNov6JzeNSotDqtPpxifuQ7GSSqMOkjicZ2uswzEgBLfTTBVys0xc8qVih9MmdC8r0kCBVfgaC252cm4mMEFTHCVZsNJWfxx5k2qoZmgFDKLAhj0xLAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403286; c=relaxed/simple;
	bh=KPrciHDqXPHFlBrUV6h4Z8pOP8H7Q3TzumI7zVDwU8k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PaMWNu8dR9qT2rLEGxjs51A72Vzh+fLthrpkrTO/bLi7a0dvsFVBt5boK2/tIhbQCyQIXCXR4dUUdRb/0NIGrCf4l7pCt356Icste3YhBwft4q3bpJzW6saq37Lxrk8gqwXij6Nrg07K/i4ow+a8QaAXPXB9AP0kNfMLARe5zaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wqv545YHNzyRC2;
	Fri, 23 Aug 2024 16:54:16 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 8185C1800D2;
	Fri, 23 Aug 2024 16:54:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Aug
 2024 16:54:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <s.nawrocki@samsung.com>, <mchehab@kernel.org>, <krzk@kernel.org>,
	<alim.akhtar@samsung.com>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 3/3] media: xilinx-vipp: Use for_each_child_of_node_scoped()
Date: Fri, 23 Aug 2024 17:02:17 +0800
Message-ID: <20240823090217.436622-4-ruanjinjie@huawei.com>
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
 drivers/media/platform/xilinx/xilinx-vipp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index bfe48cc0ab52..8b2c39840656 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -450,7 +450,6 @@ static int xvip_graph_dma_init_one(struct xvip_composite_device *xdev,
 static int xvip_graph_dma_init(struct xvip_composite_device *xdev)
 {
 	struct device_node *ports;
-	struct device_node *port;
 	int ret = 0;
 
 	ports = of_get_child_by_name(xdev->dev->of_node, "ports");
@@ -459,12 +458,10 @@ static int xvip_graph_dma_init(struct xvip_composite_device *xdev)
 		return -EINVAL;
 	}
 
-	for_each_child_of_node(ports, port) {
+	for_each_child_of_node_scoped(ports, port) {
 		ret = xvip_graph_dma_init_one(xdev, port);
-		if (ret) {
-			of_node_put(port);
+		if (ret)
 			break;
-		}
 	}
 
 	of_node_put(ports);
-- 
2.34.1


