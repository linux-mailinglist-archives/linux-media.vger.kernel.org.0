Return-Path: <linux-media+bounces-17479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A3C96A095
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 16:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C8271F2818A
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 14:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E200A146D78;
	Tue,  3 Sep 2024 14:27:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19C713F43B
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373659; cv=none; b=t5/ZtVd5CbAPFT8u8YxuEHrTaRtEM3IY2tzTdWyg0JO7EWLaEdfNDbsAOx5HUbDls16PTDg7WaHd3e1wxEALC4tq5CX8QTbV6Tq7ja4Ko6FEr48w3cnoEBShSbnjxIcfLs/ENUn5W/aSsPtPRENA/SnHK4mp90NCsp6OSenHC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373659; c=relaxed/simple;
	bh=pZFThl30fpXtDcnl8t3CWso1+6IangjT5I44T/p8NvU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oOSwICM6kths7F6S7KkWoZG0F0aM2xvgocwRCragNMzsx7yMKlcOj3MFG+YyIwHlCA8sId7wQ4nQbmE95t1f2784JDV+q9B1U7C+se8jqqLFE+i0bBSpK5Ug4x6YIde/dAhrF2wGqsTmuHkV6JNIXhWUoPxxo/+GkN/VCcbKrzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WynxT4xnHzyR1H;
	Tue,  3 Sep 2024 22:26:37 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 3FFE118010A;
	Tue,  3 Sep 2024 22:27:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 3 Sep
 2024 22:27:33 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>, <ricardo@marliere.net>,
	<laurent.pinchart+renesas@ideasonboard.com>, <gregkh@linuxfoundation.org>
CC: <lizetao1@huawei.com>, <ruanjinjie@huawei.com>,
	<linux-media@vger.kernel.org>
Subject: [PATCH -next 1/2] media: cec: remove redundant null pointer checks in cec_devnode_init()
Date: Tue, 3 Sep 2024 22:36:06 +0800
Message-ID: <20240903143607.2004802-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
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
 drivers/media/cec/core/cec-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index e0756826d629..b4135447cdae 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -441,7 +441,7 @@ static int __init cec_devnode_init(void)
 
 #ifdef CONFIG_DEBUG_FS
 	top_cec_dir = debugfs_create_dir("cec", NULL);
-	if (IS_ERR_OR_NULL(top_cec_dir)) {
+	if (IS_ERR(top_cec_dir)) {
 		pr_warn("cec: Failed to create debugfs cec dir\n");
 		top_cec_dir = NULL;
 	}
-- 
2.34.1


