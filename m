Return-Path: <linux-media+bounces-17480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F9F96A096
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 16:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4163A1F28346
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 14:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2C4154430;
	Tue,  3 Sep 2024 14:27:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61414036F
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373659; cv=none; b=qNZT5NkVUNFD7qD4QsA9EWeUBw2L4F0IgNGXnrSUS/PitzeKI45ufIdKqJF4JcSDzVOivwx4/XaS+rq+Sqr+x9EgUK83LkLXkMiu8F/AQuNka7mHm6GBLZDbt+LL1v3a4WqT+E5HiQFeBUKJ8+y2rhQK2XY0Gz5rjM0m7CU9dwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373659; c=relaxed/simple;
	bh=6LLZVLZVwzqPc7DQFWGl+PPhxmrYoGk9J5qMr8/MzOo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzX3172P0NLb6YnbGIPQv5tH1oVOUMMWdN4Cloy+TPzWCHCCUTNdYoW4DLzjY2JT56/agENnRTBw+CenD5g7Y3IG/cWklLENHc6lhmNr8pQALEf9Q6CQMu2d2hsXL2dv0eT17vNoQ4T81c+ftzs/kqa/0uZ2Zm1fWPTkmyLD+vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WynwG1gzrz1xwp2;
	Tue,  3 Sep 2024 22:25:34 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 99F5D1A016C;
	Tue,  3 Sep 2024 22:27:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 3 Sep
 2024 22:27:34 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>, <ricardo@marliere.net>,
	<laurent.pinchart+renesas@ideasonboard.com>, <gregkh@linuxfoundation.org>
CC: <lizetao1@huawei.com>, <ruanjinjie@huawei.com>,
	<linux-media@vger.kernel.org>
Subject: [PATCH -next 2/2] media: siano: remove redundant null pointer checks in cec_devnode_init()
Date: Tue, 3 Sep 2024 22:36:07 +0800
Message-ID: <20240903143607.2004802-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903143607.2004802-1-lizetao1@huawei.com>
References: <20240903143607.2004802-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Since the debugfs_create_dir() never returns a null pointer, checking
the return value for a null pointer is redundant, and using IS_ERR is
safe enough.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/media/common/siano/smsdvb-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
index 73990e469df9..325d674c74d9 100644
--- a/drivers/media/common/siano/smsdvb-debugfs.c
+++ b/drivers/media/common/siano/smsdvb-debugfs.c
@@ -411,7 +411,7 @@ void smsdvb_debugfs_register(void)
 	 * subsystem.
 	 */
 	d = debugfs_create_dir("smsdvb", usb_debug_root);
-	if (IS_ERR_OR_NULL(d)) {
+	if (IS_ERR(d)) {
 		pr_err("Couldn't create sysfs node for smsdvb\n");
 		return;
 	}
-- 
2.34.1


