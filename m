Return-Path: <linux-media+bounces-5787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2786121C
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CBA91F22E0D
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 12:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2406B7E783;
	Fri, 23 Feb 2024 12:59:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3979B7E0FB
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708693173; cv=none; b=MGCStCclES/+UIYYI93D5uge98jxOSevqQMTX5qk/Md54KUGA9EKyoMd4OTKBDWNnXqGbndMRQ1NyXCXkXWR3C067lMIOqurGPAzzIJgWGoj0ICgKkLiPqUVUvsYoXyXnJGp6hDjXZJDV1FX1FsWNUeZz5ni1LOXnvDn7dNhDa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708693173; c=relaxed/simple;
	bh=VJMVlrS16drlOOGwbgU0Ipy8a/X2XtrdWCXFGVSA314=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KqKdfg4/IBJAL4xoVq60+0DSO3hKHUtc/MdWWaDBNrZ8mrFS7OIFKR8tcwrmVwSI4ay7kz8eQHBmVp/DRdkMfivUJnvkAfPxtbJxf/4izkcq8H391Gyd10CphhIB/ei0RYgjHth9SF8lWDZHcZwKZaS2KmtYOE38xe2FxMJF87I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9D-0005We-7v; Fri, 23 Feb 2024 13:59:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9C-002QaX-DR; Fri, 23 Feb 2024 13:59:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdV9C-00AKC0-15;
	Fri, 23 Feb 2024 13:59:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jai Luthra <j-luthra@ti.com>,
	linux-media@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 5/5] media: ti: j721e-csi2rx: Convert to platform remove callback returning void
Date: Fri, 23 Feb 2024 13:59:08 +0100
Message-ID:  <bcd484d86eadb4d65ddeac35fe4db29dbec65dea.1708692946.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=VJMVlrS16drlOOGwbgU0Ipy8a/X2XtrdWCXFGVSA314=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2JaiJcW73diK46Yovq0fxV8ISHkTBBN2Zcplh 74lJ9e/ZeCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdiWogAKCRCPgPtYfRL+ TmKQCACmNheh1VEeSDhnnaLYgwLvudtoUX8v4Ez0xJQKv015VhCsnidjH+dMruFLpts7cNGD+Gs k1s8pPzRObrHjdbUMcUjcsb2QFkZhg9QoSoFZPCh/XBOmavui8T1IGdG6s39syeaSGA9g8R0bjW XWzdzr3edqZTiSzNKkWxVZtxFDyVHWVpO+iUp0qDXxrOU3VrJWgHyHE1JSL1EuXawk0yRtpIw/F ZYK9hOPmI+4sLjUfwwe8jZ17QAsnakX6o2JlWdhKY+PkPj7CGkqAnZCEgqgwwcOTz4j45639oJB hEUVcv0v90epU2D5Xn9MqBhASKcYUPBxXO1TuJrJgMD8Ppa3
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
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 54aba055c96b..6da83d0cffaa 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1142,7 +1142,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ti_csi2rx_remove(struct platform_device *pdev)
+static void ti_csi2rx_remove(struct platform_device *pdev)
 {
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 
@@ -1154,8 +1154,6 @@ static int ti_csi2rx_remove(struct platform_device *pdev)
 	ti_csi2rx_cleanup_dma(csi);
 
 	mutex_destroy(&csi->mutex);
-
-	return 0;
 }
 
 static const struct of_device_id ti_csi2rx_of_match[] = {
@@ -1166,7 +1164,7 @@ MODULE_DEVICE_TABLE(of, ti_csi2rx_of_match);
 
 static struct platform_driver ti_csi2rx_pdrv = {
 	.probe = ti_csi2rx_probe,
-	.remove = ti_csi2rx_remove,
+	.remove_new = ti_csi2rx_remove,
 	.driver = {
 		.name = TI_CSI2RX_MODULE_NAME,
 		.of_match_table = ti_csi2rx_of_match,
-- 
2.43.0


