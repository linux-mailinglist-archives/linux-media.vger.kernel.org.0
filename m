Return-Path: <linux-media+bounces-15284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE8939B28
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 08:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 097A31F22A46
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 06:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EAD14B06A;
	Tue, 23 Jul 2024 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="Yptz1zD/"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3513CF85;
	Tue, 23 Jul 2024 06:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721717485; cv=none; b=DvKvCjDDObCI2kA9c34OoI3pSd+uVDhEeQNWP9xIoGkUB/cdV0WRB2+jAS7MAyX3Fp215tYkGFcPbTnRoaILa2H7Zlt4A7jSg5/Yp0ZoW9Z208eJ7dctCl7x7t+QdjHbcqR1dPxjI9juutY4/s0K7kxoCbNmNj2mC4ZXDr331Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721717485; c=relaxed/simple;
	bh=hzm4zDypja5gz5Itp4dPQP3GWgVYqyypukzntSlys8k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=khTMetBGD03QS+77Al1sBVZLpOhM+jWCkB2ZB6ctz2VWBsnOBMZVyRtBbErs/dLCOTrm82Hs5bZ7X+ItPZa4fjr405hU3PXQeaeoaEMVC89t72IXNFiV8IBZlpXss0C6CGxHb+n1b6q5FyoMgUZdAxvb1scWexywcaG/tWMk/v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=Yptz1zD/; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=g/eLgGJborLiVboZJO/DPw/dEglaiSY/mbEUz91hDyw=; b=Yptz1zD/1a/yBelKDILByZsYDb
	+c2Qk0o2skekmKL/7VPC6wMj3voimqse9pEtUyNCHTnwFT7pJ0dFRbXVbf3DoHEBrdA+yyr2MWPJ/
	gRler5xstujk3R1EumGUkRdP6b+g0MFVwyr/shWeEeTE3d8e6qHpp0QkjURT9pqu6tRo=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:52751 helo=localhost.localdomain)
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1sW8i0-007mSg-4d; Tue, 23 Jul 2024 08:09:12 +0200
From: Matthias Fend <matthias.fend@emfend.at>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: imx-mipi-csis: avoid logging while holding spinlock
Date: Tue, 23 Jul 2024 08:09:08 +0200
Message-Id: <20240723060909.534584-1-matthias.fend@emfend.at>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Refactor mipi_csis_log_counters() to prevent calling dev_info() while
IRQs are disabled. This reduces crucial IRQs off time to a bare minimum.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index f49b06978f14..0c34d316ed29 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -857,18 +857,21 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
 {
 	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
 				: MIPI_CSIS_NUM_EVENTS - 8;
+	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
 	unsigned long flags;
 	unsigned int i;
 
 	spin_lock_irqsave(&csis->slock, flags);
+	for (i = 0; i < num_events; ++i)
+		counters[i] =  csis->events[i].counter;
+	spin_unlock_irqrestore(&csis->slock, flags);
 
 	for (i = 0; i < num_events; ++i) {
-		if (csis->events[i].counter > 0 || csis->debug.enable)
+		if (counters[i] > 0 || csis->debug.enable)
 			dev_info(csis->dev, "%s events: %d\n",
 				 csis->events[i].name,
-				 csis->events[i].counter);
+				 counters[i]);
 	}
-	spin_unlock_irqrestore(&csis->slock, flags);
 }
 
 static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
-- 
2.25.1


