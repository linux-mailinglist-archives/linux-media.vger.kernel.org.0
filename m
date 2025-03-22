Return-Path: <linux-media+bounces-28592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB04A6C720
	for <lists+linux-media@lfdr.de>; Sat, 22 Mar 2025 03:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD13A1788A9
	for <lists+linux-media@lfdr.de>; Sat, 22 Mar 2025 02:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90C678F2B;
	Sat, 22 Mar 2025 02:38:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F12258A;
	Sat, 22 Mar 2025 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742611132; cv=none; b=Bsq2QteE0wEcvW7z+OW6ggkkkaN9jgPel549wyL37pjIxHR+tC2+vGbmJwRM57OxzOH6NjCqZVYj+xHzJI56EnA3gih3kDEk7O3ZxWDWVC9/VmlGrtYMHUyydYKu/iMzmofU7lE50FrbwJnYs0onp5zUWI2qoPfCCSNU5fJIjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742611132; c=relaxed/simple;
	bh=HDiGpQMUSQSSpd+1HQ3gtF15/rSaDB66Bi8OZmHTOUo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VKQ2ebY4BWVHtYav9CwWbUL2/n9J1fAvyV+xXHyInsV06kN2zdWI2Ri981Emi4eBFZGL86GWoJX79YWiZ0YbK9lWRXoioa3xnZKRLSuY0ZKKq+lnEPscmruiYH0tWZd2z4o4mEdTJ8lwNwBn1a8oZdBKBmNEFJW7g9KhSbbbYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZKNg83sDfz1g2Ck;
	Sat, 22 Mar 2025 10:34:12 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 42A73140144;
	Sat, 22 Mar 2025 10:38:46 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 22 Mar
 2025 10:38:45 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <hverkuil@xs4all.nl>, <mchehab@kernel.org>, <lumag@kernel.org>,
	<dmitry.baryshkov@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<yuehaibing@huawei.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 -next] media: cec: tda9950: Add missing I2C dependency
Date: Sat, 22 Mar 2025 10:49:14 +0800
Message-ID: <20250322024914.3622546-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf500002.china.huawei.com (7.185.36.57)

If CONFIG_I2C is not set, build fails:

drivers/media/cec/i2c/tda9950.c: In function ‘tda9950_probe’:
drivers/media/cec/i2c/tda9950.c:391:14: error: implicit declaration of function ‘i2c_check_functionality’ [-Werror=implicit-function-declaration]
	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
      |              ^~~~~~~~~~~~~~~~~~~~~~~
  CC      crypto/aes_generic.o
drivers/media/cec/i2c/tda9950.c: At top level:
drivers/media/cec/i2c/tda9950.c:503:1: warning: data definition has no type or storage class
  503 | module_i2c_driver(tda9950_driver);
      | ^~~~~~~~~~~~~~~~~
drivers/media/cec/i2c/tda9950.c:503:1: error: type defaults to ‘int’ in declaration of ‘module_i2c_driver’ [-Werror=implicit-int]
drivers/media/cec/i2c/tda9950.c:503:1: warning: parameter names (without types) in function declaration

Add missing I2C dependency to fix this.

Fixes: caa6f4a75e9f ("media: cec: move driver for TDA9950 from drm/i2c")
Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
v2: Fix patch title, also cc dri-devel list
---
 drivers/media/cec/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/i2c/Kconfig b/drivers/media/cec/i2c/Kconfig
index b9d21643eef1..c31abc26f602 100644
--- a/drivers/media/cec/i2c/Kconfig
+++ b/drivers/media/cec/i2c/Kconfig
@@ -16,6 +16,7 @@ config CEC_CH7322
 
 config CEC_NXP_TDA9950
 	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
+	depends on I2C
 	select CEC_NOTIFIER
 	select CEC_CORE
 	default DRM_I2C_NXP_TDA998X
-- 
2.34.1


