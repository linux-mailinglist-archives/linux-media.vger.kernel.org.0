Return-Path: <linux-media+bounces-17841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6112596FF6C
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 05:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F602873F4
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 03:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7595025E;
	Sat,  7 Sep 2024 03:01:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75903BBCC;
	Sat,  7 Sep 2024 03:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678092; cv=none; b=YDTsMZhDgxj+K/9IQ5ViI5oupH/i3AnvHT6YvV/hVfkzUAkwpVdhoGsyUuK4PXskYbKa/VsJotUL8QLE3uqGaOLhgNmT/lqLnzJOEKxhIf4E8rgBIx1VWBn17zsADJU1w1bHBQgT7oYM5MuPJ6BJ5xAFBQ0ykwBK9+Z+QhZuCms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678092; c=relaxed/simple;
	bh=9ndR7JYgXlK6gaL2DuxYVbZkag02HgoUfkhmww6ZP34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/N+CDi1YTsQK6KSYxx4KbE0OQ/figqjIN2NLISU00Rw2adYrWvhWrN9Gc1fmwKbfnWmR75prloPQFZLbqZNkIzv7WfEY0Bgs/keugTxU8EeJ89zdBDbTu72pwZw6JKGSKbljQo9M6S/vVRQ97hQ+bj8gNHfccYaZQWAC2kFpuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4X0yXT3KPFz1S9f6;
	Sat,  7 Sep 2024 11:00:57 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id CB8E91400CF;
	Sat,  7 Sep 2024 11:01:21 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:01:20 +0800
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
Subject: [PATCH -next v2 2/2] media: siano: remove redundant null pointer checks in cec_devnode_init()
Date: Sat, 7 Sep 2024 11:10:00 +0800
Message-ID: <20240907031009.3591057-3-lizetao1@huawei.com>
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
the return value for a null pointer is redundant, Remove this check
since debugfs_create_file can handle IS_ERR pointers.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Remove this check since debugfs_create_file can
handle IS_ERR pointers.
v1:
https://lore.kernel.org/all/20240903143607.2004802-2-lizetao1@huawei.com/

 drivers/media/common/siano/smsdvb-debugfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
index 73990e469df9..9db38ae4ecee 100644
--- a/drivers/media/common/siano/smsdvb-debugfs.c
+++ b/drivers/media/common/siano/smsdvb-debugfs.c
@@ -411,10 +411,6 @@ void smsdvb_debugfs_register(void)
 	 * subsystem.
 	 */
 	d = debugfs_create_dir("smsdvb", usb_debug_root);
-	if (IS_ERR_OR_NULL(d)) {
-		pr_err("Couldn't create sysfs node for smsdvb\n");
-		return;
-	}
 	smsdvb_debugfs_usb_root = d;
 }
 
-- 
2.34.1


