Return-Path: <linux-media+bounces-28568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8861A6BC34
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 14:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8B403B98F2
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 13:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED7E78F47;
	Fri, 21 Mar 2025 13:56:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D86B3D69;
	Fri, 21 Mar 2025 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565409; cv=none; b=WrnPzdM3CGvcdF/LEny4ql+hDzWf5bjlqyUeX7S43HMsfsveZyRAMkVDYRyo+jbax+9k1B2AlcIwd5qkUl2szBxwTCUMVyScl1QihVbx5jkIRU6grteizfQbTEgadgarRMDlWfa5Q1Hq4h9PheHvNQqeK7tmduZuhLJSMDg+b8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565409; c=relaxed/simple;
	bh=7jrq4o9dG8HqnaNFPuUz/jH8kmMku2AxRQ9KtOK4gCo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xnn1dPz3KFvmDeRlg47TcutgAMzql8hih8CCmDCdd225UsINcD1F5krwOOHxzDYoXyhUIwJb3aFzLprRoWDkNFTlesMvcBOaee79n7KecmewTgxP+/juoOB1SpBX3eVTnvDdZ5PZFj+gqNe6bwKNkVfAPhGMaZU9+7kh2VDg/m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZK3pz6NLBz1c0QN;
	Fri, 21 Mar 2025 21:54:51 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A7B11A016C;
	Fri, 21 Mar 2025 21:56:37 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 21 Mar
 2025 21:56:36 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <hverkuil@xs4all.nl>, <mchehab@kernel.org>, <lumag@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<yuehaibing@huawei.com>
Subject: [PATCH -next] media: cec: Add missing I2C dependency
Date: Fri, 21 Mar 2025 22:07:18 +0800
Message-ID: <20250321140718.1343784-1-yuehaibing@huawei.com>
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


