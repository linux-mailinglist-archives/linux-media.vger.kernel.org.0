Return-Path: <linux-media+bounces-9079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D178A09C3
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 09:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2EE5282D67
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 07:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157F913E032;
	Thu, 11 Apr 2024 07:28:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69552EAE5
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820533; cv=none; b=Qv1iMFcDD5Xosqqn1skwj6uek7BIJuwX9J5nf+rsVy/q5GHlqCe6FIDFEQZG4fkwfB5UdUjua8SAimbAGdw0IF/LVn6mtcx4HExT/ISJj9QYw0PG4h37RH2g6oTg7OP1SOVF/rw4plarUoY3HbGA+QeSUYvlo31WY9vDENmA/Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820533; c=relaxed/simple;
	bh=7e7nGiie3B6yxrUzMgt7HY2LxDnVsFLXIhBy71O8jEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jGaViu70OsBRgZK0n+YASUYsgw1L2NGOOwhF6xZeletupwfclFM8eS4Q0aX2+X7I2YPnlhXB5ASjWuzfE2sovXTA0jQ8HuN0Aysl+QneLXBj/mFGeFMH96CJSe8Y5a3MYtVlWwuTYD/voJUmUxbVbD7e/7VDUcie/fTccZ6palM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruorT-00068O-UD; Thu, 11 Apr 2024 09:28:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruorQ-00BdtV-Dv; Thu, 11 Apr 2024 09:28:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruorQ-000Pp3-15;
	Thu, 11 Apr 2024 09:28:40 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH v2] media: staging: media: starfive: camss: Convert to platform remove callback returning void
Date: Thu, 11 Apr 2024 09:28:36 +0200
Message-ID: <20240411072836.221625-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7e7nGiie3B6yxrUzMgt7HY2LxDnVsFLXIhBy71O8jEk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmF5ElyK6/rv4tC0OtkUvcoQkxhNg1EnvjsTZbK ByE06hJlICJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZheRJQAKCRCPgPtYfRL+ TuhcB/9GaxoYkOYO5MLbp2RGnhndIsPFqFHj8cd6JifwgeLNly+7d2YURgGi2eOOW6w41LGSHCd qQphBMkPRHs4bRqnC/pwPaJam+baDAobdvUhKHcHRnsV335bWdDoflPd/lYirEl2KqBbJ9/eHUF AFNFrUN5dGaUK9vb9RZNu+VVInxvg7e8O13v50+MivbAAgRLkuScxr9KhuW0ObhZGoUB84vhwKZ y4369yC2rVaFzkakqp4KwTYlJ296gvDVnGaM08VNUQcyA4bENbEcOAp027uwQxtUt4kSvRSI5pc LQLfpHl0vjjB4egr+iHzTQ8JlazwOiCG5/Uo0i1kPfSsQ/Kq
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
Hello,

(implicit) v1: https://lore.kernel.org/linux-staging/c43a9c68e64e3e8360174ae0c6706e46d3d40a11.1709886922.git.u.kleine-koenig@pengutronix.de
    
Changes since (implicit) v1:

 - Drop doc about return value in kerneldoc, thanks to Changhuang Liang
   for noticing

Best regards
Uwe

 drivers/staging/media/starfive/camss/stf-camss.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
index a587f860101a..4ea40671b44d 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.c
+++ b/drivers/staging/media/starfive/camss/stf-camss.c
@@ -352,10 +352,8 @@ static int stfcamss_probe(struct platform_device *pdev)
 /*
  * stfcamss_remove - Remove STFCAMSS platform device
  * @pdev: Pointer to STFCAMSS platform device
- *
- * Always returns 0.
  */
-static int stfcamss_remove(struct platform_device *pdev)
+static void stfcamss_remove(struct platform_device *pdev)
 {
 	struct stfcamss *stfcamss = platform_get_drvdata(pdev);
 
@@ -364,8 +362,6 @@ static int stfcamss_remove(struct platform_device *pdev)
 	media_device_cleanup(&stfcamss->media_dev);
 	v4l2_async_nf_cleanup(&stfcamss->notifier);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id stfcamss_of_match[] = {
@@ -420,7 +416,7 @@ static const struct dev_pm_ops stfcamss_pm_ops = {
 
 static struct platform_driver stfcamss_driver = {
 	.probe = stfcamss_probe,
-	.remove = stfcamss_remove,
+	.remove_new = stfcamss_remove,
 	.driver = {
 		.name = "starfive-camss",
 		.pm = &stfcamss_pm_ops,

base-commit: 4118d9533ff3a5d16efb476a0d00afceecd92cf5
-- 
2.43.0


