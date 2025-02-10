Return-Path: <linux-media+bounces-25866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB4FA2E2FF
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 05:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6665C165B03
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 04:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58CE143C40;
	Mon, 10 Feb 2025 04:01:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1413A25B;
	Mon, 10 Feb 2025 04:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160068; cv=none; b=NygixDqvxH6hXn8G+n6bE9IVHDzIGb0wM0K4Gd7431Y+GOjTUSfRhasAFQPd43vRm8ZvGnzW1BBXBagbOwAgjooKyem0Zh+1EjbWhIdUw8GsHjbRbiVf0em8hJHLYniLWPwLv4f1UY0ws5vJG6xIDRdaT5gBPfDBlFant2cIfh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160068; c=relaxed/simple;
	bh=f0KDuAUflNARbT58GUMeTukf/oPlGSMSUkPVBMaPwtU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HBawrKqB7trm4zjAqX9p9UqiPMBYpancOs2xsV10ZWBm7V8qGuvoc1zpEwdGTglf94yAb0wr0f5Jq/1FNRKoWdccf3ceZtSPcljS4bsuM1YCwnbRT3YTBbJ2YIp+lW9dYo4u/uzPxCglSvKhwHRbPc9x5VnwG0zEWWCe1alk+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YrrNc3m5Cz1W5QX;
	Mon, 10 Feb 2025 11:56:32 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 93505140159;
	Mon, 10 Feb 2025 12:00:56 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 10 Feb 2025 12:00:56 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 10 Feb 2025 12:00:55 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <matt@ranostay.sg>, <mchehab@kernel.org>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2] media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code
Date: Mon, 10 Feb 2025 11:48:42 +0800
Message-ID: <20250210034842.17410-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemn100009.china.huawei.com (7.202.194.112)

Use HWMON_CHANNEL_INFO macro to simplify code.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 -v2: detach this patch from the series[1]

[1] https://lore.kernel.org/lkml/20250124022635.16647-3-lihuisong@huawei.com/T/

---
 drivers/media/i2c/video-i2c.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 036a6375627a..0dd991d70d53 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -264,18 +264,8 @@ static int amg88xx_set_power(struct video_i2c_data *data, bool on)
 
 #if IS_REACHABLE(CONFIG_HWMON)
 
-static const u32 amg88xx_temp_config[] = {
-	HWMON_T_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info amg88xx_temp = {
-	.type = hwmon_temp,
-	.config = amg88xx_temp_config,
-};
-
 static const struct hwmon_channel_info * const amg88xx_info[] = {
-	&amg88xx_temp,
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	NULL
 };
 
-- 
2.22.0


