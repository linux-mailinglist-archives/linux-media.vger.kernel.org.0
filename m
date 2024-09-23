Return-Path: <linux-media+bounces-18441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C797E509
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 05:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48DA71F21733
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 03:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AE711187;
	Mon, 23 Sep 2024 03:41:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6064B4C6E;
	Mon, 23 Sep 2024 03:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727062882; cv=none; b=kvR2H4IE+a3p8XbN4/hleG4T18gOhYEMzEsrvO9ilOcFLrAQPFaH6tX5nbinriCfOZV2NLIqk8KI8T2h/K0Hw6x/UZWJ5VakXTrF7D9oK9SbrJ3ClylurHow+BFzTfeX53v/5Vk2WIM9RbgymJCLpyBEhLUiMtWG10eJtBCaGQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727062882; c=relaxed/simple;
	bh=PasliHa3OqrzXr/dToPiB5ozILarc40/v5PlLpQ1v/U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GS9CNwAmC0OcrM806fQ7mF38CRGYaLSz1CUXX9D53jx+PWBIoWwhZ4NPCopGgTskgn1RNqNbLmjixtNEQxN7q9eN5sCqsj9a3exC8+4jyuwxgjQGCOHRUObmlRaG+nJnsERYlAgf16xPAF8g+xxvsOeo4TbiP3eaAQjDt1qunEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XBpdG618kzpSwQ;
	Mon, 23 Sep 2024 11:39:14 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id E63C9140F82;
	Mon, 23 Sep 2024 11:41:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Sep
 2024 11:41:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>, <ming.qian@nxp.com>,
	<eagle.zhou@nxp.com>, <stanimir.k.varbanov@gmail.com>,
	<quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
	<hans.verkuil@cisco.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 2/3] media: amphion: Fix pm_runtime_set_suspended() with runtime pm enabled
Date: Mon, 23 Sep 2024 11:51:14 +0800
Message-ID: <20240923035115.3008900-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923035115.3008900-1-ruanjinjie@huawei.com>
References: <20240923035115.3008900-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)

It is not valid to call pm_runtime_set_suspended() for devices
with runtime PM enabled because it returns -EAGAIN if it is enabled
already and working. So, call pm_runtime_disable() before to fix it.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/media/platform/amphion/vpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_drv.c b/drivers/media/platform/amphion/vpu_drv.c
index 2bf70aafd2ba..51d5234869f5 100644
--- a/drivers/media/platform/amphion/vpu_drv.c
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -151,8 +151,8 @@ static int vpu_probe(struct platform_device *pdev)
 	media_device_cleanup(&vpu->mdev);
 	v4l2_device_unregister(&vpu->v4l2_dev);
 err_vpu_deinit:
-	pm_runtime_set_suspended(dev);
 	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
 
 	return ret;
 }
-- 
2.34.1


