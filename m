Return-Path: <linux-media+bounces-20679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 353059B8E0B
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 675F51C210CD
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1751015DBAB;
	Fri,  1 Nov 2024 09:41:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62715667B;
	Fri,  1 Nov 2024 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730454097; cv=none; b=L6jiEUiWfb8dFOaNUYqawuOLJuQRT/zT0715UWASs3X9U7JDBaqB5A224v03gXTipCsBBWYMQmESs3ze5hga88SRKHECyfpci/qG+H22TpU5stzToHG4Jvvx2akWQHvnCFIKnlrSOHsF3xiTaZOUqgO9EdmaKYCARuAYjgH6d0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730454097; c=relaxed/simple;
	bh=EDUkQtfNBeqggKtTDqGaUGqzrG/JbmviQpQegALOkIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lpJjQCo7EqyIjbSmP5i6mWEY0TP9FYXVN0bpKOyhCNHS1KGgwYtky4rRjbaSv8fc8hIFd4pcT8FMZxtMQWrSK+LwkMaWO9hdkbtcXabeBF1SAq+0xBAX4bGB7pJrkbEbfru7roHca2Hcw34a+UInhSnFLYSCt5UnJI1cZgorENE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XfwmK6bqGzdkXj;
	Fri,  1 Nov 2024 17:38:57 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id 6E1A2180115;
	Fri,  1 Nov 2024 17:41:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 1 Nov
 2024 17:41:31 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>, <ming.qian@nxp.com>,
	<eagle.zhou@nxp.com>, <stanimir.k.varbanov@gmail.com>,
	<quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
	<shijie.qin@nxp.com>, <hverkuil-cisco@xs4all.nl>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>
CC: <chenridong@huawei.com>, <ruanjinjie@huawei.com>
Subject: [PATCH v2 2/3] media: amphion: Fix pm_runtime_set_suspended() with runtime pm enabled
Date: Fri, 1 Nov 2024 17:40:49 +0800
Message-ID: <20241101094050.2421038-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101094050.2421038-1-ruanjinjie@huawei.com>
References: <20241101094050.2421038-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg200008.china.huawei.com (7.202.181.35)

It is not valid to call pm_runtime_set_suspended() for devices
with runtime PM enabled because it returns -EAGAIN if it is enabled
already and working. So, call pm_runtime_disable() before to fix it.

Cc: stable@vger.kernel.org
Fixes: b50a64fc54af ("media: amphion: add amphion vpu device driver")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Add fix tag.
- Add Cc stable.
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


