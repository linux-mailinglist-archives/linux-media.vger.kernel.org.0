Return-Path: <linux-media+bounces-18086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABF4973C61
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 340B01F2797E
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 15:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E821A0AE1;
	Tue, 10 Sep 2024 15:39:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045EE191476;
	Tue, 10 Sep 2024 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982742; cv=none; b=Yedn149ZAo7+KmYZjHz7jNwlaVsmAR3kMCtqJXTufDySAw5pw/iRjgvBnCvEmqK0kCg8cEWj5Bo4Wayu2M/ljloz5VwYngCra4NxGjevkrvlb87NTPA4VSvub2EczUGbDeCrdb68rfEbEphrmsBHEXorDlouDIhxRTP4fKusANk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982742; c=relaxed/simple;
	bh=YRf1kntM3OQ/bV0snIFQ6PnuTop0YlcgFHTlaiqRqaA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sUByT7vvosuxa+0FbxXJTaB0S5KYV7GlOqP1aoFn5R0XucPkVVFvT7YI9CKa5s82+/9VDaXr6t8pQ0GENumMKQxBS77zaULUBlgPUhKuyca1Hsij4R0zcj2LRtDlHbW1m95ruf/dxi7TyokYq/t2rzHoLwQLaVY7eY/CtZgeMps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4X37Cc55Xjz69SX;
	Tue, 10 Sep 2024 23:38:52 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 06BD0180AE6;
	Tue, 10 Sep 2024 23:38:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 10 Sep
 2024 23:38:57 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
	<gregkh@linuxfoundation.org>, <ricardo@marliere.net>, <ruanjinjie@huawei.com>
CC: <lizetao1@huawei.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH -next v3 1/2] media: cec: remove redundant null pointer checks in cec_devnode_init()
Date: Tue, 10 Sep 2024 23:48:02 +0800
Message-ID: <20240910154803.736951-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Since the debugfs_create_dir() never returns a null pointer, checking
the return value for a null pointer is redundant. Remove this check
since debugfs_create_file can handle IS_ERR pointers. At the same time,
debugfs_create_dir returns ERR_PTR (-ENODEV) by default when
CONFIG_DEBUG_FS=N, so there is no need for CONFIG_DEBUG_FS macro
isolation.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Drop the null pointer check for top_cec_dir
v2: https://lore.kernel.org/all/20240907034400.3693797-1-lizetao1@huawei.com/
v1 -> v2: Remove this check since debugfs_create_file can handle IS_ERR
pointers. And drop the ifdef CONFIG_DEBUG_FS statement.
v1: https://lore.kernel.org/all/20240903143607.2004802-1-lizetao1@huawei.com/

 drivers/media/cec/core/cec-core.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index e0756826d629..2897283ebe72 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -374,10 +374,6 @@ int cec_register_adapter(struct cec_adapter *adap,
 	}
 
 	dev_set_drvdata(&adap->devnode.dev, adap);
-#ifdef CONFIG_DEBUG_FS
-	if (!top_cec_dir)
-		return 0;
-
 	adap->cec_dir = debugfs_create_dir(dev_name(&adap->devnode.dev),
 					   top_cec_dir);
 
@@ -388,7 +384,6 @@ int cec_register_adapter(struct cec_adapter *adap,
 		return 0;
 	debugfs_create_file("error-inj", 0644, adap->cec_dir, adap,
 			    &cec_error_inj_fops);
-#endif
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cec_register_adapter);
@@ -439,13 +434,7 @@ static int __init cec_devnode_init(void)
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


