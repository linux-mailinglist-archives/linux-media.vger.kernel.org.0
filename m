Return-Path: <linux-media+bounces-5790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA28861220
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6DC82861B7
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 12:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B977EEEF;
	Fri, 23 Feb 2024 12:59:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397557D413
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708693175; cv=none; b=LcXzV2ykDM5m0coFasLzLJN6l4rjr7b5887pni0xc1WNeHYcD2yQ6KVs2DGVlZnpKKvC0Ai5csSdlQ63FzmJFnMqThTdPs5Y0mwHg6WhmKpwQlEqMj2j6NPKiQsJQUbCkmUZpRYA/wJ00nUShoXptlhEPRQfD7HmQ1GwPw0Q6CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708693175; c=relaxed/simple;
	bh=k1QMieIBunEIOZi8P48RqEFigMM1q8GmcNTidnDO258=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kp6LYgfrke4mV9+Y8F5QyMgrSuK2Z0CANy46Q7nmrASbX8RREl3FxmCLo/95I1T1wziiNi8DXujuTOVUsMjGbTgo4jEzev8/NNXahCNRnBQHbGpQsPSvq67H6AiXygiiQ76jRPj4toARclGQ4m67nJUAmP9Dy/9mkk5lPBJlIw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9D-0005W1-4m; Fri, 23 Feb 2024 13:59:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9B-002QaN-PL; Fri, 23 Feb 2024 13:59:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9B-00AKBj-2G;
	Fri, 23 Feb 2024 13:59:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Joseph Liu <kwliu@nuvoton.com>,
	Marvin Lin <kflin@nuvoton.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	kernel@pengutronix.de
Subject: [PATCH 2/5] media: nuvoton: Convert to platform remove callback returning void
Date: Fri, 23 Feb 2024 13:59:05 +0100
Message-ID:  <21a291dc5ab4e21c380648621fea9de8ea55198b.1708692946.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=k1QMieIBunEIOZi8P48RqEFigMM1q8GmcNTidnDO258=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2JaeXbyggXgi8IFWtbiV7XN3JGmmloq8ucrcJ Gyty73V0ZWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdiWngAKCRCPgPtYfRL+ Tkj2B/wM/+SfXNqRWlQg90V2FlGPB7iuSaQZvDRVwtWULuKYb82I4dsF7VO9np2oyQHrCoC1ObS E7pQ3peiJ7OjcI920Lboku3Pm/UEeiL0SDMpt0tAT6Vzxcn/s3QwsujVgCJrH/G5QZHf5K648i+ a0dPOoFAhXFuO6WEnzEZfnHgOHrzYqvk36m9A+TnY7cq+HX+GBws99OnUtC10AXvaFGwWmaNBVW e1cYbQYqOEQypiNB6QL1ovwrTnu6Oq+HsrRABf+bW+Ao1xljYHqqh36gOnjQGTbUA6WYo8BqL0r XKTH1IVY8Sn1M33i26qbhtyG1u+g3BA7gga8T8Uh5dgqD4kG
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
 drivers/media/platform/nuvoton/npcm-video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index a1fcb616b256..60fbb9140035 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1785,7 +1785,7 @@ static int npcm_video_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int npcm_video_remove(struct platform_device *pdev)
+static void npcm_video_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
@@ -1798,8 +1798,6 @@ static int npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	of_reserved_mem_device_release(dev);
-
-	return 0;
 }
 
 static const struct of_device_id npcm_video_match[] = {
@@ -1816,7 +1814,7 @@ static struct platform_driver npcm_video_driver = {
 		.of_match_table = npcm_video_match,
 	},
 	.probe = npcm_video_probe,
-	.remove = npcm_video_remove,
+	.remove_new = npcm_video_remove,
 };
 
 module_platform_driver(npcm_video_driver);
-- 
2.43.0


