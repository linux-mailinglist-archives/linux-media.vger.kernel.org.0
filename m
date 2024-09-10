Return-Path: <linux-media+bounces-18085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF7973C60
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8543B288447
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 15:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264401A01CB;
	Tue, 10 Sep 2024 15:39:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614E519F10E;
	Tue, 10 Sep 2024 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982741; cv=none; b=TVYo8zMOAq1wK5NjMneGnGGb+hBZQmVspVV0VwbNtMZACoNygHRfRi67kufdKX9haselZtcbYoiSqAehOjZHkG/yvqUxrmtGIsnxiLd+p6czhOHobiXJuJbfzCJYb/neDE3VoS/gLvNmyKLelZhmE9uD+lWptVcxNAOp0y0ouFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982741; c=relaxed/simple;
	bh=Sru+Jm0Xua9EUuTZkWOgv2SKgkvzlCenJwKsV0GpANQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGekJ0RvMXfkwSM89cf+onSJvPek8120tjLs/nerRmuowTKzd1enjE3eqjMPhde/PxUlulkdEDgLxCarht1zOIbPgfVkbJDJ6d09gWL5Y8g5VfgceBOgxhyx3H1mAA9hAPnXZKX2CV5hir+B0gDYvkoIsePE2cnJ08UPgerMNBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X377c0YSwz1HJQL;
	Tue, 10 Sep 2024 23:35:24 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 57AA51402E0;
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
Subject: [PATCH -next v3 2/2] media: siano: remove redundant null pointer checks in cec_devnode_init()
Date: Tue, 10 Sep 2024 23:48:03 +0800
Message-ID: <20240910154803.736951-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910154803.736951-1-lizetao1@huawei.com>
References: <20240910154803.736951-1-lizetao1@huawei.com>
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
the return value for a null pointer is redundant, Remove this check
since debugfs_create_file can handle IS_ERR pointers.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Drop the redundant variable d and assign it directly
v2: https://lore.kernel.org/all/20240907034400.3693797-2-lizetao1@huawei.com/
v1 -> v2: Remove this check since debugfs_create_file can
handle IS_ERR pointers.
v1: https://lore.kernel.org/all/20240903143607.2004802-2-lizetao1@huawei.com/

 drivers/media/common/siano/smsdvb-debugfs.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
index 73990e469df9..d14ba271db50 100644
--- a/drivers/media/common/siano/smsdvb-debugfs.c
+++ b/drivers/media/common/siano/smsdvb-debugfs.c
@@ -398,8 +398,6 @@ void smsdvb_debugfs_release(struct smsdvb_client_t *client)
 
 void smsdvb_debugfs_register(void)
 {
-	struct dentry *d;
-
 	/*
 	 * FIXME: This was written to debug Siano USB devices. So, it creates
 	 * the debugfs node under <debugfs>/usb.
@@ -410,12 +408,7 @@ void smsdvb_debugfs_register(void)
 	 * node for sdio-based boards, but this may need some logic at sdio
 	 * subsystem.
 	 */
-	d = debugfs_create_dir("smsdvb", usb_debug_root);
-	if (IS_ERR_OR_NULL(d)) {
-		pr_err("Couldn't create sysfs node for smsdvb\n");
-		return;
-	}
-	smsdvb_debugfs_usb_root = d;
+	smsdvb_debugfs_usb_root = debugfs_create_dir("smsdvb", usb_debug_root);
 }
 
 void smsdvb_debugfs_unregister(void)
-- 
2.34.1


