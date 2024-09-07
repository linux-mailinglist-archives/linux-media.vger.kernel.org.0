Return-Path: <linux-media+bounces-17861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5C096FFDD
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 05:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0BF11C21D85
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 03:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A751CAAC;
	Sat,  7 Sep 2024 03:35:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C9CEAE9
	for <linux-media@vger.kernel.org>; Sat,  7 Sep 2024 03:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725680115; cv=none; b=mupveE5Ju2KGJHWmLHmOaMwevXJsmMVV1beDf32Wklm09mg725coGUPMXV/JqTVtDHRrQVDUSyaEonqGOEzeIiZDNEvif1cdqScrb7y4/1mIiMoPNhAN1mFmuU3Wc0BiUdrV0ATsTNPWGUaes8AEJ1b3hvL0x0KrCNzQENZgMpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725680115; c=relaxed/simple;
	bh=9ndR7JYgXlK6gaL2DuxYVbZkag02HgoUfkhmww6ZP34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t90vrNFihMdIPE+k/gDyeROfW8WSYPhShAPvjfSpl9TVGXqzV9r3+cWNTxkhubj0PLS5jppM5VfYzcuUR3yACmWnYWsI2pQxCyXp5VqoaWtWrl8jVUb+c5b7RfDWjvH0/WJQfvHI+xkCLodYoZaC7sA+At3y/A0aw81/ScyuPJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4X0zGn6v74z1BMZZ;
	Sat,  7 Sep 2024 11:34:09 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id E22C6180A9E;
	Sat,  7 Sep 2024 11:35:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:35:10 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
	<gregkh@linuxfoundation.org>, <lizetao1@huawei.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <ricardo@marliere.net>,
	<ruanjinjie@huawei.com>
CC: <linux-media@vger.kernel.org>
Subject: [PATCH -next v2 2/2] media: siano: remove redundant null pointer checks in cec_devnode_init()
Date: Sat, 7 Sep 2024 11:44:00 +0800
Message-ID: <20240907034400.3693797-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240907034400.3693797-1-lizetao1@huawei.com>
References: <20240907034400.3693797-1-lizetao1@huawei.com>
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


