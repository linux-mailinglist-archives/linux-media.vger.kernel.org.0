Return-Path: <linux-media+bounces-20018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9869A9A4D
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2581C1C21F13
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 06:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD0B1465BB;
	Tue, 22 Oct 2024 06:55:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9B2770E4
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729580126; cv=none; b=rKbqdSQ2ycEMdCjHXADzeu696P9yf4bmxXxfip2n5jfgBDrVni5yaQ/Ep6ZMszMo6urbYxxnpcM9l8x8EUkX5WVfvSnwuU/eJnl/OOcyRUhMSKDtGZsEu4H1RpaDoqtJolXQ6TeJ8JhVEDyEepzkB9QHKDGel8QMRo1CNWUFA9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729580126; c=relaxed/simple;
	bh=MChgVz0/cgsJlDT4lGbDOiITkjMBvxRF6zTrsXZ8wA8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZLqzjI8m1NrSNiukZYV790vPnDl1Kq/xmW3FfY87XA/3zlQKYeHGPehB+pylDcZAyJARNRHC5LjnQxiPbFrG/9yrsAHdPvgZ0rNF6RGitVgh0sDYkI0Evp6ZOck+iqP9w3SEodssZR7/Bzs/lK4njr21s5oLieqbHqEUBrvTXvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XXjcH4gBFz1ynZ1;
	Tue, 22 Oct 2024 14:55:27 +0800 (CST)
Received: from dggpeml500024.china.huawei.com (unknown [7.185.36.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B3FC14010D;
	Tue, 22 Oct 2024 14:55:20 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 22 Oct
 2024 14:55:20 +0800
From: Yuan Can <yuancan@huawei.com>
To: <mchehab@kernel.org>, <akpm@linux-foundation.org>, <ribalda@chromium.org>,
	<yuancan@huawei.com>, <hverkuil-cisco@xs4all.nl>,
	<nabijaczleweli@nabijaczleweli.xyz>, <linux-media@vger.kernel.org>
Subject: [PATCH] media: siano: Fix error handling in smsdvb_module_init()
Date: Tue, 22 Oct 2024 14:50:37 +0800
Message-ID: <20241022065037.54572-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)

The smsdvb_module_init() returns without checking the retval from
smscore_register_hotplug().
If the smscore_register_hotplug() failed, the module failed to install,
leaving the smsdvb_debugfs not unregistered.

Fixes: 3f6b87cff66b ("[media] siano: allow showing the complete statistics via debugfs")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/media/common/siano/smsdvb-main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index 44d8fe8b220e..9b1a650ed055 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -1243,6 +1243,8 @@ static int __init smsdvb_module_init(void)
 	smsdvb_debugfs_register();
 
 	rc = smscore_register_hotplug(smsdvb_hotplug);
+	if (rc)
+		smsdvb_debugfs_unregister();
 
 	pr_debug("\n");
 
-- 
2.17.1


