Return-Path: <linux-media+bounces-17860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A6596FFDC
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 05:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC59F1F22BE8
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 03:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303223A1BA;
	Sat,  7 Sep 2024 03:35:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7B1CAAC
	for <linux-media@vger.kernel.org>; Sat,  7 Sep 2024 03:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725680114; cv=none; b=Q7B3f11R2HyWW1LIQfavT41hs1p2c4bUk4VVTffpXdhGK90DSVfZ/NK4W7fLUREedpoflGOJdt/j9hYxev0UxtBmzc3eGaryGfFkH+fmyXWncdn2QoRxdRC3RSgc6euy44Q9qKSIQBefNCFYsG+HOrLTr9Kwwh1Lefu1n+s/dT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725680114; c=relaxed/simple;
	bh=whVQBy4YiYeqaKcukKbd8CbWIZ7/ozer1z+E4DyF2tY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FZ44DfKZm2P8MFHOaDz0k/zLW/17T/kQIoYT36aB+X06IxSCd2P1aZ4x+qIwTx7TJpHKRTWx4vEJdMKPh9j5kdoU3tqhAxkQ8s8/eeuvrm3RMMustsjjzw/3lXFUXbH+p98Vj3Xm52P3rYNObuAimbIj8Z+19jetyWrYLpgwzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X0zHV6Rnjz1j88w;
	Sat,  7 Sep 2024 11:34:46 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 844BE14011F;
	Sat,  7 Sep 2024 11:35:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:35:09 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
	<gregkh@linuxfoundation.org>, <lizetao1@huawei.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <ricardo@marliere.net>,
	<ruanjinjie@huawei.com>
CC: <linux-media@vger.kernel.org>
Subject: [PATCH -next v2 1/2] media: cec: remove redundant null pointer checks in cec_devnode_init()
Date: Sat, 7 Sep 2024 11:43:59 +0800
Message-ID: <20240907034400.3693797-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Since the debugfs_create_dir() never returns a null pointer, checking
the return value for a null pointer is redundant. Remove this check
since debugfs_create_file can handle IS_ERR pointers. At the same time,
debugfs_create_dir returns ERR_PTR (-ENODEV) by default when
CONFIG_DEBUG_FS=N, so there is no need for CONFIG_DEBUG_FS macro
isolation.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Remove this check since debugfs_create_file can handle IS_ERR
pointers. And drop the ifdef CONFIG_DEBUG_FS statement.
v1:
https://lore.kernel.org/all/20240903143607.2004802-1-lizetao1@huawei.com/

 drivers/media/cec/core/cec-core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index e0756826d629..77be6c11c63c 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -439,13 +439,7 @@ static int __init cec_devnode_init(void)
 		return ret;
 	}
 
-#ifdef CONFIG_DEBUG_FS
 	top_cec_dir = debugfs_create_dir("cec", NULL);
-	if (IS_ERR_OR_NULL(top_cec_dir)) {
-		pr_warn("cec: Failed to create debugfs cec dir\n");
-		top_cec_dir = NULL;
-	}
-#endif
 
 	ret = bus_register(&cec_bus_type);
 	if (ret < 0) {
-- 
2.34.1


