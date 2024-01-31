Return-Path: <linux-media+bounces-4510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC19843F05
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 13:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABB181F3113B
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 12:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFE87762C;
	Wed, 31 Jan 2024 12:00:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4222C76902
	for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706702441; cv=none; b=VrvCBn4f2o5dz9v/eyeUPrB56yAoh43c1EqqsNP9pGSe6fyYVZxsSy2l2dfBjk/FVKa5ssl60kmhc2y40gPDep8qQyBApyE8jWaRBzJY80dHQX3sb85TKVSV4cOpDCRcWvbW06UgBHvWhHr/gJ9BqUlj5sXzIxvIG7soK6MOMeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706702441; c=relaxed/simple;
	bh=NgXw5xq1jmpdtgZbRKp9Llj30Em1DyzVlnP5fwyJngA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g3Epdz8elivj4lqjyvrJ6EoEhBqPd7P7JgM0lKVyowT6YfkLGtAvFQTDYnKqc8xISgTg6QMRIg6OT7gpJLTqa+i4EGB4kNejRCWH25MYaws/9acU0ieJN+u3PyiVfwfx9RWRDK9mzxkMfRPcfJP+J5bW56ByxNHaUXcvT8a33tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1rV9Gc-0005sZ-6S; Wed, 31 Jan 2024 13:00:34 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1rV9Gb-003cbp-Mv; Wed, 31 Jan 2024 13:00:33 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: [PATCH] media: imx: csc/scaler: fix v4l2_ctrl_handler memory leak
Date: Wed, 31 Jan 2024 13:00:33 +0100
Message-Id: <20240131120033.858877-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Free the memory allocated in v4l2_ctrl_handler_init on release.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 1fd39a2fca98..95cca281e8a3 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -803,6 +803,7 @@ static int ipu_csc_scaler_release(struct file *file)
 
 	dev_dbg(priv->dev, "Releasing instance %p\n", ctx);
 
+	v4l2_ctrl_handler_free(&ctx->ctrl_hdlr);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
-- 
2.39.2


