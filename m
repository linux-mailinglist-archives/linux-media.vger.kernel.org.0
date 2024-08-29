Return-Path: <linux-media+bounces-17137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 600EB9645A3
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 937B11C22DCA
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 13:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D491A704D;
	Thu, 29 Aug 2024 13:00:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4701CAAC;
	Thu, 29 Aug 2024 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724936425; cv=none; b=N7dGbRpWvB6uSxwaTXlalsZxBi13DdqNeWP70QTEClTvTpUMrlxCZT+nCEXTwG0FljZsMZmVnKMjkFdxaZgfDknjohtWAoQfNeksbwk7l0h6NxtXIM7HGdKvv8BBw41TZs7v+8AFSaGA0D7TKhx7ALA2Z/sTtMcS8k7RUL4JoVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724936425; c=relaxed/simple;
	bh=rlI0pIoTGDFmTKJqn3iaagPcEhM1579d/PSUv6bfBLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LG1unODCSBxuuxOTYSGhxXCYucYOEPM8jZyV0TnWsXLhIKmLf5TE7yApnVNt+eWNNSXuxsabGWWrbAZZgYP4Bfz9pgxotWXmfvd0nzAK8w8MRJB0rnTHAfyFKFVn7nhpm74XF0C0kxXYd/8X2s5x1AZdD/vGel2Lywtij/4bKoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WvhFz1PZ3z1S8tG;
	Thu, 29 Aug 2024 21:00:07 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 820741400FD;
	Thu, 29 Aug 2024 21:00:20 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 Aug
 2024 21:00:20 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <sakari.ailus@linux.intel.com>, <jacopo@jmondi.org>, <mchehab@kernel.org>,
	<laurent.pinchart@ideasonboard.com>, <biju.das.jz@bp.renesas.com>
Subject: [PATCH -next 1/2] media: i2c: mt9v111: Enable module autoloading
Date: Thu, 29 Aug 2024 12:52:02 +0000
Message-ID: <20240829125203.539977-2-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829125203.539977-1-liaochen4@huawei.com>
References: <20240829125203.539977-1-liaochen4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500020.china.huawei.com (7.185.36.49)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
on the alias from of_device_id table.

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


