Return-Path: <linux-media+bounces-19634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7889499DBCF
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 03:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29A501F23781
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 01:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C2C155336;
	Tue, 15 Oct 2024 01:42:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0243231C83;
	Tue, 15 Oct 2024 01:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728956555; cv=none; b=pwKQkdNNm76nEduzx8GgVtFilIuAN1soz/FGCRTyCcVZ16tyOdoq2dRfZNte5aVFaTypKdaRNLa6P/OO80xTgRykuSRGoC1igt7p7NHVE6z37YJeIscgOJi7YbWTs8nN38InNy8+qDg/oIS+yuXwf5+fMsuYE4TJ8+IwTHV2kmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728956555; c=relaxed/simple;
	bh=4JSQUriljyvh23qQwYuuRmuTN4NwLKLToX4bqCC1j7I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G/4PpWzt5QprjG5c+OQQyJp/S0Xw9zb3YA5jwkmMyhbBFH7JyLrecj+Gxvw/yiCj/2fVsapegpFd1v/spJ+ucYbe/G11BylB0EEOldlv57o9ULVJPcH5ZdA8fwPSM3vjQdt7zJSa5GXBhCq0BUP8vy0PVnKCbf6mf+uxLw5fnas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XSGxV33VbzfdCN;
	Tue, 15 Oct 2024 09:39:58 +0800 (CST)
Received: from dggpemf100006.china.huawei.com (unknown [7.185.36.228])
	by mail.maildlp.com (Postfix) with ESMTPS id CFB4C1400D5;
	Tue, 15 Oct 2024 09:42:24 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.178.55) by
 dggpemf100006.china.huawei.com (7.185.36.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Oct 2024 09:42:24 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: nuvoton: Fix an error check in npcm_video_ece_init()
Date: Tue, 15 Oct 2024 09:40:53 +0800
Message-ID: <20241015014053.669-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.37.3.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf100006.china.huawei.com (7.185.36.228)

When function of_find_device_by_node() fails, it returns NULL instead of
an error code. So the corresponding error check logic should be modified
to check whether the return value is NULL and set the error code to be
returned as -ENODEV.

Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 60fbb91400355c2..db454c9d2641f8f 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1667,9 +1667,9 @@ static int npcm_video_ece_init(struct npcm_video *video)
 		dev_info(dev, "Support HEXTILE pixel format\n");
 
 		ece_pdev = of_find_device_by_node(ece_node);
-		if (IS_ERR(ece_pdev)) {
+		if (!ece_pdev) {
 			dev_err(dev, "Failed to find ECE device\n");
-			return PTR_ERR(ece_pdev);
+			return -ENODEV;
 		}
 		of_node_put(ece_node);
 
-- 
2.34.1


