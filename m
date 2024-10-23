Return-Path: <linux-media+bounces-20071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B90D29ABEEB
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 08:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 666DE1F247ED
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 06:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A5114A4C7;
	Wed, 23 Oct 2024 06:37:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D870D13BC11
	for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 06:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665461; cv=none; b=ZIMBwxZf2JMDsCp9AsRPCdfPIJTVOwf/wZgdc7X8Scfl4Sfh6auKwjHnGkEf5KDfvll8stk1Y/Ea9WaJZbAAMBMAKACDZppK0olzT/nf7ge5CHDXccTyCoF+1o/96MYqfO5QkXPpotmWtSVaPnLbnnH4jXIT7Hjpfvd4O/3PkeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665461; c=relaxed/simple;
	bh=deTP2nQHJOWhKVKQdZZd0vk6stFDza0+aUEv29AWels=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pNGUZ8oKIPvUc38iTiGOcvjfo4n+weT/uxwhJH8DajUF0186636NH3Mf9XB0DN0pMkSn++5rhVK1HBq38RZDzS6y/U0n+PHMsyrN4vwW44l159Lt/F1PUGvMgdGs1gEN0c6Jip9Q12gMIQ2TIEweG61qzmpKf5Vb+b6OMAdBLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XYK7S5XHgzyTc1;
	Wed, 23 Oct 2024 14:36:04 +0800 (CST)
Received: from dggpemf100006.china.huawei.com (unknown [7.185.36.228])
	by mail.maildlp.com (Postfix) with ESMTPS id 18EA11400D8;
	Wed, 23 Oct 2024 14:37:36 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.178.55) by
 dggpemf100006.china.huawei.com (7.185.36.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 23 Oct 2024 14:37:35 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: pci: mgb4: Fix return value check in debugfs_init()
Date: Wed, 23 Oct 2024 14:36:38 +0800
Message-ID: <20241023063638.241-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.37.3.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf100006.china.huawei.com (7.185.36.228)

Fix the incorrect return value check for debugfs_create_dir(), which
returns ERR_PTR(-ERROR) instead of NULL when it fails.

Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c  | 2 +-
 drivers/media/pci/mgb4/mgb4_vout.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index e9332abb31729ea..808eb51b270c755 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -860,7 +860,7 @@ static void debugfs_init(struct mgb4_vin_dev *vindev)
 
 	vindev->debugfs = debugfs_create_dir(vindev->vdev.name,
 					     vindev->mgbdev->debugfs);
-	if (!vindev->debugfs)
+	if (IS_ERR(vindev->debugfs))
 		return;
 
 	vindev->regs[0].name = "CONFIG";
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 998edcbd972387d..348c8e01fcbed5a 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -683,7 +683,7 @@ static void debugfs_init(struct mgb4_vout_dev *voutdev)
 
 	voutdev->debugfs = debugfs_create_dir(voutdev->vdev.name,
 					      voutdev->mgbdev->debugfs);
-	if (!voutdev->debugfs)
+	if (IS_ERR(voutdev->debugfs))
 		return;
 
 	voutdev->regs[0].name = "CONFIG";
-- 
2.34.1


