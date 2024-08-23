Return-Path: <linux-media+bounces-16642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA82595C9BA
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 11:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 251FBB268E1
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 09:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0865F180032;
	Fri, 23 Aug 2024 09:52:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367A3156C6A;
	Fri, 23 Aug 2024 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724406750; cv=none; b=DfmJusguKS7Zfc33ynztXyW554r8drBLrZqfR5DcotEnMSBcB8WXb+TBmJKFYvMXW0N//Hb3Kbxn8pgtMVoKl2ktqgaCvsrpvIpystL8vX12wbPJGIW9QvQ3MN4ZaC4k9I7X8qg5NhCC4chZi+FX38YHgGZ0AnP/8k1/aMnvga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724406750; c=relaxed/simple;
	bh=TZioZa1wbeL7RMhw5U7gT+MGpRQj3nk7W2IaRgoj72w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h1/hORkZyW6sR+FsPCONIZfMt0DZaDFz/MdgqqFFnxeuM3kib5YmkIlABEahS2eZ3iH+qFeJAD95ALHcBmwkncnjOFDj/7/MJCes0zYRm1AC4Jl34FtwH6YIJMbkkTFwGoaa8EVTsNN/NJFNG4o+Xl4+k5o2JX9GNKoMbKISA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WqwLM1rf7zpSth;
	Fri, 23 Aug 2024 17:50:51 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C9C61401F1;
	Fri, 23 Aug 2024 17:52:25 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Aug
 2024 17:52:25 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>,
	<yuehaibing@huawei.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] media: ccs: Remove unused declarations
Date: Fri, 23 Aug 2024 17:49:35 +0800
Message-ID: <20240823094935.3146696-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf500002.china.huawei.com (7.185.36.57)

Commit 2989a457171d ("media: ccs: Refactor register reading a little")
removed ccs_read_addr_no_quirk() but left declaration.

Commit 529322112a3b ("media: ccs: Use V4L2 CCI for accessing sensor
registers") removed ccs_write_addr_no_quirk() and ccs_reg_width() but
leave their declarations.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/media/i2c/ccs/ccs-reg-access.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-reg-access.h b/drivers/media/i2c/ccs/ccs-reg-access.h
index 78c43f92d99a..4b56b21a26b5 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.h
+++ b/drivers/media/i2c/ccs/ccs-reg-access.h
@@ -21,16 +21,13 @@
 
 struct ccs_sensor;
 
-int ccs_read_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 *val);
 int ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val);
 int ccs_read_addr_8only(struct ccs_sensor *sensor, u32 reg, u32 *val);
 int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val);
-int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val);
 int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val);
 int ccs_write_data_regs(struct ccs_sensor *sensor, struct ccs_reg *regs,
 			size_t num_regs);
 
-unsigned int ccs_reg_width(u32 reg);
 u32 ccs_reg_conv(struct ccs_sensor *sensor, u32 reg, u32 val);
 
 #define ccs_read(sensor, reg_name, val) \
-- 
2.34.1


