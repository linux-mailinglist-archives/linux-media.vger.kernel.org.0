Return-Path: <linux-media+bounces-17186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 084BA965590
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 05:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3830A1C21861
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 03:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EBB13635E;
	Fri, 30 Aug 2024 03:14:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D1754278
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 03:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724987643; cv=none; b=tBn/HFwPzr0bOvzTa+C/Vw0pyHncyp06Za7fEwkdJxVvXuRTA1Xi7xRKj5+FVczKdeqhPynJOmh8iKLkwc9nuUnnbiaRh72tREnPeLrPajx4ZYFtpsU51WCgaBqK2ttPmKjbDBF8NCvfTUI1TNya2Gomjlb3yySrBIrWVy409w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724987643; c=relaxed/simple;
	bh=6U1v4QA1iEkOcGOrw/NJm1ePCTrLuULDDSfavjW8DkU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zj5sK7awpvqSgp6UvZPXq/ujqUsJ21FiJFAZG+05HL4Z9Pqnwnx0vMarzIE4sfvCoekaO7o2rVLEiQrepfkxRgy1OuEZ9BhOYiFf6vd3t3oe0Kw7DBSAlFjkLGSuSHwQhXn/ABp9TlcuVjj5QOABArF0niSGQzEgT5tqRJJfeD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ww3Bw3PRJz2Dbbh;
	Fri, 30 Aug 2024 11:13:44 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id EF1081402C6;
	Fri, 30 Aug 2024 11:13:57 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 11:13:57 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <hdegoede@redhat.com>, <mchehab@kernel.org>,
	<sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
	<changhuang.liang@starfivetech.com>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH v2] media: atomisp: Remove unused declartion
Date: Fri, 30 Aug 2024 11:00:35 +0800
Message-ID: <20240830030035.15686-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

v4l2_get_acpi_sensor_info() has been removed since commit d80be6a10cd3
("media: atomisp: Drop v4l2_get_acpi_sensor_info() function"), remain
the declaration untouched in the header file. So, let's remove this
unused declartion.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
v2: Improve commit message

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


