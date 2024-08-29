Return-Path: <linux-media+bounces-17102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0FD963DF0
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC11D288CD0
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 08:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7349418A92A;
	Thu, 29 Aug 2024 08:02:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BE5189F31;
	Thu, 29 Aug 2024 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724918559; cv=none; b=EjUFUOtl97oktVm11ZZPNtMk9mPlxRX5+w0PFRcNpgYxpbwrZaemgrHV2kv1IhEIf8qG0Wg/XV5cDnayIi9DI3y4NDVZ3b0X8jfJ8BoWSHZshipLm52SkbbPs8CzGyoDfbnk2FgF1v2kBFmXv0hBMAeN+XgsfdjWC1VOB82NN2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724918559; c=relaxed/simple;
	bh=katxNtLIxt/UBrWPr2LyfEsRYwAFbyEVBzl01y4Z4N8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qikTUq4hRhzs9gTEx0/Y+xBW7REcBGJPx1SITk0FGVilenIuEIrdQB102TpVeHNYtBMUrImeJkFXduChVeJExE7juYKHqu/GVa6+pr3crKQv1CMGj8fdtbVsTiPFurnY+oqSdKrmtNvutaNlosRdV8j7RcEn2+kU3c1MWgKtVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WvYY32NWLzQr4v;
	Thu, 29 Aug 2024 15:57:43 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C96914011A;
	Thu, 29 Aug 2024 16:02:34 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 Aug
 2024 16:02:33 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-tegra@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <jacopo@jmondi.org>,
	<sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>,
	<biju.das.jz@bp.renesas.com>, <tomi.valkeinen@ideasonboard.com>,
	<liaochen4@huawei.com>
Subject: [PATCH -next 1/3] media: v4l2-subdev: enable module autoloading
Date: Thu, 29 Aug 2024 07:54:15 +0000
Message-ID: <20240829075417.526459-2-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829075417.526459-1-liaochen4@huawei.com>
References: <20240829075417.526459-1-liaochen4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500020.china.huawei.com (7.185.36.49)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/media/i2c/mt9v111.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index b0b98ed3c150..b6a2623798c5 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -1265,6 +1265,7 @@ static const struct of_device_id mt9v111_of_match[] = {
 	{ .compatible = "aptina,mt9v111", },
 	{ /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, mt9v111_of_match);
 
 static struct i2c_driver mt9v111_driver = {
 	.driver = {
-- 
2.34.1


