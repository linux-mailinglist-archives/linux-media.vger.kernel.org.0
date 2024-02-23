Return-Path: <linux-media+bounces-5788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0703E86121E
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 935C7B21B73
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 12:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097BE7E798;
	Fri, 23 Feb 2024 12:59:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F527E595
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708693174; cv=none; b=GqsUtB7sn7IT2FHrNgHhyaHDtHr9/GafvjCRVJxZbbJ6KQCrX36vbE/sJ+JVN3N8IJNeb8MKTAiSXKJ9fD2DXIqLhcgD/uJViEmhgffKRqHe+hKzbB9KR3XXyghXVQUXOpktcDFxBV+jE/ow4Ae1D9tuJK4GIS4NXY6ANqQohPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708693174; c=relaxed/simple;
	bh=cGnrBxqGxCmEtDuWxONLei27GY0x+yDrPiamFnG8NHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NudV7v+P4HNMjDwQjGbcbN2/fS6PxdVcwwx1MIS8UCJc1qY4/qyDn9RLIGnjxRwyAXyPqRH+iJidBQE1YcMAzSYcQTBbVRV2+th0PucF34eOYOb3sscK15NH3buDK8YFWE0DHyVrapNzjezCyqKUNlhd9IZOZa4LVLiGyh2xOmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9D-0005WK-4S; Fri, 23 Feb 2024 13:59:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9C-002QaT-6U; Fri, 23 Feb 2024 13:59:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9C-00AKBw-0M;
	Fri, 23 Feb 2024 13:59:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 4/5] media: stm32-dcmipp: Convert to platform remove callback returning void
Date: Fri, 23 Feb 2024 13:59:07 +0100
Message-ID:  <7e85adb3c2f11fc10e5a18bb341c5af8b35c4d88.1708692946.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=cGnrBxqGxCmEtDuWxONLei27GY0x+yDrPiamFnG8NHg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2JahwqaMRF1CPxbj1EwCu77uTj4TmU1PEFAv0 XDuPOLeA6mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdiWoQAKCRCPgPtYfRL+ TvIEB/wO/V5+nBYCIwEezMcTGrxF/tGJ/B8e/Tpc+wD+9fdC08TczkaX3SjLpKbKXnUBz1gFtSF eSgmgjBxElnAHO8nk9zwJ36R+tTm3zouqkIPCJ9x5oOVZFTqHXWl2hkqZJ/eOBSLZ7O76LQdicn 7pJXhibFTOEsnBgJhYP5225xLWw99rc0uxtq2RV7ycJ3KqlbbSoxbuc06Dxy2yg8YJkJuYvWLat 8mB8DZ6OHnK2nY3DBQUgnPfNu6zdBlWqRGTgTSMKPzOh91wSSNgxttjlXhPA0TJwf+IAyrs5tTO 4yAdjF6oXbhvr8pgTbOMcOXlVabbFgqgVOkVUJ0h6ebidEfK
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
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 32c6619be9a2..bce821eb71ce 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -517,7 +517,7 @@ static int dcmipp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int dcmipp_remove(struct platform_device *pdev)
+static void dcmipp_remove(struct platform_device *pdev)
 {
 	struct dcmipp_device *dcmipp = platform_get_drvdata(pdev);
 	unsigned int i;
@@ -534,8 +534,6 @@ static int dcmipp_remove(struct platform_device *pdev)
 	media_device_cleanup(&dcmipp->mdev);
 
 	v4l2_device_unregister(&dcmipp->v4l2_dev);
-
-	return 0;
 }
 
 static int dcmipp_runtime_suspend(struct device *dev)
@@ -588,7 +586,7 @@ static const struct dev_pm_ops dcmipp_pm_ops = {
 
 static struct platform_driver dcmipp_pdrv = {
 	.probe		= dcmipp_probe,
-	.remove		= dcmipp_remove,
+	.remove_new	= dcmipp_remove,
 	.driver		= {
 		.name	= DCMIPP_PDEV_NAME,
 		.of_match_table = dcmipp_of_match,
-- 
2.43.0


