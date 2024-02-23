Return-Path: <linux-media+bounces-5789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8602386121F
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4163B286265
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 12:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462867E792;
	Fri, 23 Feb 2024 12:59:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671427E779
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708693174; cv=none; b=G7CnSsIF9ricXfDGNtsgmW4eRd9E58EhLShXWGdhBG9Q2LV6S9nQlD9vdcojtlNwX6BqcjRSG285edgh+Nb5JbybopdNZugqUj+sqOOwc1eAFYs29KYnQbF7uqu1tatP8Ncwg9EsdvThr/bhwgfM1rW/lVELR4bayujj5sNzpOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708693174; c=relaxed/simple;
	bh=E7ixt9bejmqPsEXF4Y9G6SEIQ5e1STE67Lq1/1c+n9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HOohWrm7Wrzn5EtmKmZWREKaKVud7te6ot3XHZenDJApqZIiZMErQabtomkf/XXhmHr4g9J5oVHxU5niiYXRXTS4r5mDG8Rkm8PH6DhtrGaq1Kn9UI5oY2J8zNlGCohNi7LeTFe7x/xc6Ol3RUJrmua+d89OHjI9CaTrnbcU1yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9C-0005W8-EW; Fri, 23 Feb 2024 13:59:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9C-002QaQ-0O; Fri, 23 Feb 2024 13:59:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9B-00AKBn-2y;
	Fri, 23 Feb 2024 13:59:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 3/5] media: nxp: imx8-isi: Convert to platform remove callback returning void
Date: Fri, 23 Feb 2024 13:59:06 +0100
Message-ID:  <2ccfcae7bab286651fcf6deff988e23c5113ac22.1708692946.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=E7ixt9bejmqPsEXF4Y9G6SEIQ5e1STE67Lq1/1c+n9A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2JagJXkMm7LYwx9xfCGyElXFSriLLDC9+0UiQ R8bb/PmHw6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdiWoAAKCRCPgPtYfRL+ TlB8CACQRNTrGnOtSKYPjUtNma55r8JlzQGu/zJ1VT74MAlqgbvfH43L7qoa5zw6oZho7NHfOAI ue1iFMv62rvfp8cLD2NAk4ZSzqAhY+svBCGz+nMJZlNmTSvAU4EcHoxcf1ZkV4UuhYyQtemehkt jHR5+9yCjhVq9PGt82UmLjP6BsEIp0aIxHHLu2ulBnajBU4VaMMrkRuPR0K4MmAcVpjoNMzUAYa ajIgWVTZxcNnjSE/cbvIaOag8uX8uqku6IrbxfuzfxpniP3k2tNhxjQgyx0g7K+Uco8VrF1EIwD WxsiMfZvfjRGkx2ZqE71o5DGq94wZrweTEbFLa3WIAX385iK
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
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index f73facb97dc5..c2013995049c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -506,7 +506,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mxc_isi_remove(struct platform_device *pdev)
+static void mxc_isi_remove(struct platform_device *pdev)
 {
 	struct mxc_isi_dev *isi = platform_get_drvdata(pdev);
 	unsigned int i;
@@ -523,8 +523,6 @@ static int mxc_isi_remove(struct platform_device *pdev)
 	mxc_isi_v4l2_cleanup(isi);
 
 	pm_runtime_disable(isi->dev);
-
-	return 0;
 }
 
 static const struct of_device_id mxc_isi_of_match[] = {
@@ -537,7 +535,7 @@ MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
 
 static struct platform_driver mxc_isi_driver = {
 	.probe		= mxc_isi_probe,
-	.remove		= mxc_isi_remove,
+	.remove_new	= mxc_isi_remove,
 	.driver = {
 		.of_match_table = mxc_isi_of_match,
 		.name		= MXC_ISI_DRIVER_NAME,
-- 
2.43.0


