Return-Path: <linux-media+bounces-5785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B721386121A
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E81B01C22AD9
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 12:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321367E772;
	Fri, 23 Feb 2024 12:59:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507657BAE3
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708693172; cv=none; b=qWr2zFcYvrOZOPrjs5kB/JaUy4Pn3rf3c9TVq3cPJ8FGsqcSFdb56Woq0r8D/i5bNbSWLrt+a6wAxRy7a5qqAu7FFqrF+UL+4/0YLOIkcXlDgKeJxjk6Yi0WEJfLu2810JX4KvP3TXJ8wPcDlfIpPa6wyMPvG48py5WBRHsRnjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708693172; c=relaxed/simple;
	bh=6KDLoKf6mZzNDX/Q0mFCWqcKKweFt8H6FUi1gMldOeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WeZVQhbGzLakCXExHD9F+ygpIVgs/WXJyPENLiA/3WzsVgh3jwWwxWbzipySwELCmrseGfq2cjUnGyhgTfTqWNKuF6NVos8y1u+qFK6MPEMw74fhiQOF+5aEAcCDX/2K8/VNukMyo/DlVAKpkVPw1dmYg+GPb5xwz9ZeRxAeXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9C-0005Vk-5q; Fri, 23 Feb 2024 13:59:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9B-002QaK-IA; Fri, 23 Feb 2024 13:59:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9B-00AKBf-1Y;
	Fri, 23 Feb 2024 13:59:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	linux-media@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 1/5] media: chips-media: wave5: Convert to platform remove callback returning void
Date: Fri, 23 Feb 2024 13:59:04 +0100
Message-ID:  <dfcaf3d23ea35655d8b3a9254ee00f40c20c95c4.1708692946.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=6KDLoKf6mZzNDX/Q0mFCWqcKKweFt8H6FUi1gMldOeg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2JaduGL/BHYkF5ozhlNcW13lrMy6KqqvkstF2 InIW0iW04CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdiWnQAKCRCPgPtYfRL+ Tv/jB/9Y2cLIxlQSkrPm54LsOd/9mDZFXP4WZ9F7s/uf68m7Ci8pbNTj2LEi4rBTC+FPRsbOz96 m+j5abjiFRDWe5LF2T+9Qpss55qmg5mTe9Aka+7lhZtjrRzXtZEiJuJulSKQ40UtDBrS/edOND7 jxDYvUW0lPQyY9Aa88eM52paoKqAO97xVwg7HBDpTCkF2BZbUXD8cHnqlI1MlkGrBRCXQjzrVUF 6t9AMufGm7qMqGe3mFsCdoxsARg9pgOgy0F7RFAw1OmZPgvtlXnAOUDA0nx/Zl4QjG6eDbVEFp4 G5rZug0UGFlO0n/6SNuYiH0vZ+lMKbgCRIGOiVWNlOeeKOJs
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 0d90b5820bef..1b3df5b04249 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -250,7 +250,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wave5_vpu_remove(struct platform_device *pdev)
+static void wave5_vpu_remove(struct platform_device *pdev)
 {
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
@@ -262,8 +262,6 @@ static int wave5_vpu_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 	wave5_vdi_release(&pdev->dev);
 	ida_destroy(&dev->inst_ida);
-
-	return 0;
 }
 
 static const struct wave5_match_data ti_wave521c_data = {
@@ -283,7 +281,7 @@ static struct platform_driver wave5_vpu_driver = {
 		.of_match_table = of_match_ptr(wave5_dt_ids),
 		},
 	.probe = wave5_vpu_probe,
-	.remove = wave5_vpu_remove,
+	.remove_new = wave5_vpu_remove,
 };
 
 module_platform_driver(wave5_vpu_driver);
-- 
2.43.0


