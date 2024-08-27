Return-Path: <linux-media+bounces-16870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEBC9602F6
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 09:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80FC22835E5
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 07:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D67D154BEB;
	Tue, 27 Aug 2024 07:24:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EE1153838
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724743483; cv=none; b=aUa8RX5GDtPM2mSMCE25JBjSMi83jUcKNAxEgDbtsrwvx0JFJLAn+9AxmNMsPTRUN+WnFrJD1ABQ2rUL2545lMMD5xL4Id6HIWXgXx4cqQkoWezFUAIq5IfteIihulr4oXeZeeCmF2YXhGUcyH4IY30pZik6rKvgUTMhQtaswLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724743483; c=relaxed/simple;
	bh=slCrXG1Ld9jO8bGIPA0WRxLHWJoCJ7+Ym0rGZC9wtBo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eZlFsrQv4zY4p8PaGsldY9/jdgax0g86sHAZGV6z4gaiH+mSSpD+UM3UuLsqpxUVqV3VaehaTOnhY3LLQskdxpe/rmcIKBNMLiaOLoInl+UGLrkfkNDR2K6AQ6CAAsyzrFBMoNjZHx+cMnbxYgrvCMKp1Ou4usC5ArHVRwESLlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WtJsv0HyfzpStn;
	Tue, 27 Aug 2024 15:22:59 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 50E531401F1;
	Tue, 27 Aug 2024 15:24:39 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 15:24:38 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <hdegoede@redhat.com>, <mchehab@kernel.org>,
	<sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH] media: atomisp: Remove unused declartions
Date: Tue, 27 Aug 2024 15:11:22 +0800
Message-ID: <20240827071122.26706-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf500003.china.huawei.com (7.202.181.241)

v4l2_get_acpi_sensor_info() has been removed since commit d80be6a10cd3
("media: atomisp: Drop v4l2_get_acpi_sensor_info() function"), remain
the declarations untouched in the header files. So, let's remove these
unused declartions.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/staging/media/atomisp/include/linux/atomisp_platform.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index fdeb247036b0..ca31eea41f39 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -175,8 +175,6 @@ int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
 				    enum atomisp_bayer_order bayer_order);
 void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
 
-int v4l2_get_acpi_sensor_info(struct device *dev, char **module_id_str);
-
 /* API from old platform_camera.h, new CPUID implementation */
 #define __IS_SOC(x) (boot_cpu_data.x86_vfm == x)
 #define __IS_SOCS(x, y) (boot_cpu_data.x86_vfm == x || boot_cpu_data.x86_vfm == y)
-- 
2.17.1


