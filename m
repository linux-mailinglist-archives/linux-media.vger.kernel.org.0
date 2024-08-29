Return-Path: <linux-media+bounces-17138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B89BA9645A4
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC95B1C24E28
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 13:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B411AB53F;
	Thu, 29 Aug 2024 13:00:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639519048F;
	Thu, 29 Aug 2024 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724936426; cv=none; b=msyGVmMwLDIGU82AjgkwGCKe4BRnuFqnlbqzD43D3ZA6aCHF3+npTRC3tgtdWRJ2mY+cLxZY3t7/fHxzXzQFxq73YOD7HcOkWgmSVym0FbnbWh4PYubSs7VkUDHA4pInwCw+LNGcpalCEJckt/aGxZ61jxa4jVP21RZSm7OIVgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724936426; c=relaxed/simple;
	bh=XOiyB855et7hBnGGcO/Xb4XJMsn0PbJCg0t8Xeyos/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J8cswOWV1rZbI12BVEeuZLskM8L8zv86PoRGXqjQLIaFPFfYL9tWbdwKTMkovc99U3XP2AERebxakrXv31k3Imr1Q4wYTmg/VTY0hjLaXXnL47wC+NZ8/9zfRbIMWXR6Pe/+zOTHRXCKRLnnbuj3sLqzxnanUqzAWT9a0c8zRQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WvhG03rFcz1j7jL;
	Thu, 29 Aug 2024 21:00:08 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 19F9D1A016C;
	Thu, 29 Aug 2024 21:00:21 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 Aug
 2024 21:00:20 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <sakari.ailus@linux.intel.com>, <jacopo@jmondi.org>, <mchehab@kernel.org>,
	<laurent.pinchart@ideasonboard.com>, <biju.das.jz@bp.renesas.com>
Subject: [PATCH -next 2/2] media: i2c: mt9v111: Drop redundant comma
Date: Thu, 29 Aug 2024 12:52:03 +0000
Message-ID: <20240829125203.539977-3-liaochen4@huawei.com>
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

Drop the redundant comma from mt9v111_of_match array to make the code
clean.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/media/i2c/mt9v111.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index b6a2623798c5..723fe138e7bc 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -1263,7 +1263,7 @@ static void mt9v111_remove(struct i2c_client *client)
 
 static const struct of_device_id mt9v111_of_match[] = {
 	{ .compatible = "aptina,mt9v111", },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mt9v111_of_match);
 
-- 
2.34.1


