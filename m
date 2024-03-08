Return-Path: <linux-media+bounces-6703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D411787603B
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 09:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F00D285716
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 08:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A362854657;
	Fri,  8 Mar 2024 08:52:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95279537EE
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709887921; cv=none; b=pzCBnoMrbIpOL4yAB3SS39dlJout7lhE6r+NgEO9GwwBGXeyaO8d4YJIUmmLh6Q4M4Fw/nGb2HZHhotILQtbqSAbgzaRRiiS/uPqpdcGZQ/w1fd6RcwMQ+Gai9bp6jtrfOso8PanvnCbgK+6GUmjH1p7oEZWi8fuIVSKpbQaKJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709887921; c=relaxed/simple;
	bh=qPPkBq7ua8mSMZSS/KmPPnuf2pqEFurnkpJOCJvYz78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YOZJD1pQCnKAv7M7jHXA6hmvwBiydTPdbUtfBmwQvrkeTsun8cK3c42QBNh+8Z+xDItyzGiyKro9rH48P9RWKgRqGz7dUTwitIB5uojlWABYK/MeoJy7oEzAkUFQUzf5tUfEVf6QvJhML8esbbWCthN7Y5MHrJlMe7C8SxtZga8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxI-0006xI-8X; Fri, 08 Mar 2024 09:51:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxG-0056Nc-EQ; Fri, 08 Mar 2024 09:51:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxG-002465-1B;
	Fri, 08 Mar 2024 09:51:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH] media: staging: media: starfive: camss: Convert to platform remove callback returning void
Date: Fri,  8 Mar 2024 09:51:16 +0100
Message-ID:  <c43a9c68e64e3e8360174ae0c6706e46d3d40a11.1709886922.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2079; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=qPPkBq7ua8mSMZSS/KmPPnuf2pqEFurnkpJOCJvYz78=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6tGI8ed74woPhDkITrNoLd7X3ZAWuWr7rGI59 96RuK91tJKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZerRiAAKCRCPgPtYfRL+ TuKOCACC5iYeNxqo7608sm/NbuAFRozufDF8jA4QXQ7fCf0sXqbmOS9gKZEJCc/7WicgZ47GSRx WYPbtPA2OgSRoUFunsbEnL8WfIty0QY59OTNherTa3N/WGz/lkfOc7IhdQcK4KS6Fz+RG76Um0e Lt2zXjd/ZU2/j1FPjid18o3eHnmu+uB3rO+kIb2vMdqitHyFfuJIAkxAAd6dTTNCnPm6blJ/mHU 0WtkwdkIOpdgZUydL5UGa2GuA8gXRuKhJFmVia4Fv1Ml9YQUrAdBMiUZA0RrJgvRadEoKR4Dib4 IDc/R9WhRQTQYRMF3Mch8k+yt+AgNa14FTCwtvqdpdNKNPo/
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
 drivers/staging/media/starfive/camss/stf-camss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
index a587f860101a..f9613c2c9dfe 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.c
+++ b/drivers/staging/media/starfive/camss/stf-camss.c
@@ -355,7 +355,7 @@ static int stfcamss_probe(struct platform_device *pdev)
  *
  * Always returns 0.
  */
-static int stfcamss_remove(struct platform_device *pdev)
+static void stfcamss_remove(struct platform_device *pdev)
 {
 	struct stfcamss *stfcamss = platform_get_drvdata(pdev);
 
@@ -364,8 +364,6 @@ static int stfcamss_remove(struct platform_device *pdev)
 	media_device_cleanup(&stfcamss->media_dev);
 	v4l2_async_nf_cleanup(&stfcamss->notifier);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id stfcamss_of_match[] = {
@@ -420,7 +418,7 @@ static const struct dev_pm_ops stfcamss_pm_ops = {
 
 static struct platform_driver stfcamss_driver = {
 	.probe = stfcamss_probe,
-	.remove = stfcamss_remove,
+	.remove_new = stfcamss_remove,
 	.driver = {
 		.name = "starfive-camss",
 		.pm = &stfcamss_pm_ops,

base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.43.0


