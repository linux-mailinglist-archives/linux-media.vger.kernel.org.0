Return-Path: <linux-media+bounces-20395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B22D9B29D0
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 09:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBD721F23643
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 08:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC6E190665;
	Mon, 28 Oct 2024 08:03:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5AF18D64F;
	Mon, 28 Oct 2024 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102613; cv=none; b=kzX9wr6drE5D2gIf8OsW/QodrTUI2OgffJOvWCTlzZJkPXc8paK+NorAY8gKv5qK8KVvh1g08CpXR2kZaLjOg5zRBRJDAyqD3xucFRPyao1oT2QP8p4rhtfaG3owh+iH1PU4IPZsDjrbccKs3zxgDGkC3GKFmrPoY//k8s8QLbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102613; c=relaxed/simple;
	bh=qP9Kmjy8aL7ga+PxwoatJoc2KZiMKEe1PqJ2a8W9278=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OBxHEFvv0ASo+A0JSGD17hcHCLPlnV9ejKjwsgjQZpUaQ6T9ysxPgBzu8cYIJkH8oIXr7EBtu2k45yQAaPEdiVfBtag0laXyb7veyUf7r1Oa3K26i59c0Z8PwUg5usNIOHs96Wnb/p9UPR+es/xO+4bssIZc2Oprn00LGyO0Oto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XcQr72YJyz1ynYN;
	Mon, 28 Oct 2024 16:03:35 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id 1826B18002B;
	Mon, 28 Oct 2024 16:03:27 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 28 Oct
 2024 16:03:26 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <hverkuil@xs4all.nl>, <mchehab@kernel.org>, <moinejf@free.fr>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] media: gspca: ov534-ov772x: Fix off-by-one error in set_frame_rate()
Date: Mon, 28 Oct 2024 16:02:56 +0800
Message-ID: <20241028080256.3537188-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemg200008.china.huawei.com (7.202.181.35)

In set_frame_rate(), select a rate in rate_0 or rate_1 by checking
sd->frame_rate >= r->fps in a loop, but the loop condition terminates when
the index reaches zero, which fails to check the last elememt in rate_0 or
rate_1.

Check for >= 0 so that the last one in rate_0 or rate_1 is also checked.

Fixes: 189d92af707e ("V4L/DVB (13422): gspca - ov534: ov772x changes from Richard Kaswy.")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/media/usb/gspca/ov534.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/ov534.c b/drivers/media/usb/gspca/ov534.c
index 8b6a57f170d0..bdff64a29a33 100644
--- a/drivers/media/usb/gspca/ov534.c
+++ b/drivers/media/usb/gspca/ov534.c
@@ -847,7 +847,7 @@ static void set_frame_rate(struct gspca_dev *gspca_dev)
 		r = rate_1;
 		i = ARRAY_SIZE(rate_1);
 	}
-	while (--i > 0) {
+	while (--i >= 0) {
 		if (sd->frame_rate >= r->fps)
 			break;
 		r++;
-- 
2.34.1


