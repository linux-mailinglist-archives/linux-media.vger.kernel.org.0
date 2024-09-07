Return-Path: <linux-media+bounces-17837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CBC96FF67
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 05:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FD68285EB2
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 03:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE5D22EF2;
	Sat,  7 Sep 2024 03:01:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D40D12E5B;
	Sat,  7 Sep 2024 03:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678085; cv=none; b=iHagolspWtdd8RWG3q7aivD5H1mj68W1OJnEMi0k5R44NNgtwAHeD13Xfs/DMxDCl8UXFMNOYUS0Gt7/wIixBVd3Kl49AemSZFGbR/P7LwIMrbPmUKV0V9UbgB1vz9oPaDULf4f7BNV9ZuhjTaw6TT9CKQ7z1QI5ZhRX136olaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678085; c=relaxed/simple;
	bh=SKmwUqTwR74emfqWD5UsJQHM+pl4VItIE/gtYktQgus=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RFmOF+8udEX5yYxLuo64MoPRGCZGc9lgfFShXcnY8gswudxW+93vxibZAr5NER/0vhNbZnxriM/RV8vldckdIjNm93EFwqaFP9mxS31JCFiQ5eBctjWGPlB4h43InylxWMEmEZXvyBkR52xr0wcxw4FTvvDdNuVXdJ0w5etEi6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4X0yVh19smzpVVL;
	Sat,  7 Sep 2024 10:59:24 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id D335E1402C8;
	Sat,  7 Sep 2024 11:01:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:01:19 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <mchehab@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <heiko@sntech.de>,
	<yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>, <hauke@hauke-m.de>,
	<alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
	<mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
	<radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <lizetao1@huawei.com>,
	<ruanjinjie@huawei.com>, <hverkuil-cisco@xs4all.nl>,
	<u.kleine-koenig@pengutronix.de>, <jacky_chou@aspeedtech.com>,
	<jacob.e.keller@intel.com>
CC: <linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH -next v2] platform/olpc: Remove redundant null pointer checks in olpc_ec_setup_debugfs()
Date: Sat, 7 Sep 2024 11:09:59 +0800
Message-ID: <20240907031009.3591057-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240907031009.3591057-1-lizetao1@huawei.com>
References: <20240907031009.3591057-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Since the debugfs_create_dir() never returns a null pointer, checking
the return value for a null pointer is redundant. Since
debugfs_create_file() can deal with a ERR_PTR() style pointer, drop
the check.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2:
v1:
https://lore.kernel.org/all/20240903143714.2004947-1-lizetao1@huawei.com/

 drivers/platform/olpc/olpc-ec.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
index 921520475ff6..48e9861bb571 100644
--- a/drivers/platform/olpc/olpc-ec.c
+++ b/drivers/platform/olpc/olpc-ec.c
@@ -332,9 +332,6 @@ static struct dentry *olpc_ec_setup_debugfs(void)
 	struct dentry *dbgfs_dir;
 
 	dbgfs_dir = debugfs_create_dir("olpc-ec", NULL);
-	if (IS_ERR_OR_NULL(dbgfs_dir))
-		return NULL;
-
 	debugfs_create_file("cmd", 0600, dbgfs_dir, NULL, &ec_dbgfs_ops);
 
 	return dbgfs_dir;
-- 
2.34.1


