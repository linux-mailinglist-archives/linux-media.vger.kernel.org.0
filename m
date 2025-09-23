Return-Path: <linux-media+bounces-42994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 815F3B9689E
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 17:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2C421884525
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 15:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA40C231827;
	Tue, 23 Sep 2025 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Af9SaynH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2240A19C546;
	Tue, 23 Sep 2025 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758640675; cv=none; b=fNQtuwPvJufeT+IQW/XVuYzUUg0h3FCf/Ks46VcCyXgfJNHG/8yZYOM9tF2472HFzc7qvL95aByU5kG9FCctnzWTqxlTePpFPw1EB0RqX3qT6+OzvAEi3PQ63IqxNd7v8v8d1luOMAEFNF4g+5PT37UGAvcXEM5nW+L0J8wunwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758640675; c=relaxed/simple;
	bh=UFPxW4Y2NJQeuRCiFarspaMwrcVrI/dZULviR01E5sY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYmv7V/CGfeZmKR+suNmtFWFWb6Y+Z81zwYNg2Xip7e/sa79twiYRrSsylU1x0xlGlwEA94bd4YjFeE2x5Z4RNntLpFS7S0TEAClFGWbgDBqKPYeqZtVbgaPayyPIEuMBRxtgodl6Bx6FBAEz+4e+QCDENr9lrWmL3H9WL3ekIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Af9SaynH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20F5C4CEF5;
	Tue, 23 Sep 2025 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758640673;
	bh=UFPxW4Y2NJQeuRCiFarspaMwrcVrI/dZULviR01E5sY=;
	h=From:To:Cc:Subject:Date:From;
	b=Af9SaynH0+wjATv7oBYHi8v/1/MPfIG+4y8SGmhZqB9Hg38JIj4qaNI+82B94rTDs
	 zs53RRHIZi0709jrDtyWzvobdyUo15d9apHBubumn9FxNOHCcpaHig9b4cIAwD4gKq
	 d88r1HdedaeNmVsLDFzsTYof8lkmVchwsrX53BeXurgWJzp0iMx3ewGvfCL2yw9QJA
	 nDAx2b+dkpBkj98ynfKG0G7RF8EpcDlvUEYGKf3m6qIfHizSgJT+MMwAYa2otcfygU
	 +XhiRzwuf6wtnup/adnjlA2iJ6XLiI9kswAMZQpKV9Wh4YlZUsKnJ4y7qex0Aqssh4
	 a41Va00ZHWayw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v14m3-000000004dQ-30pG;
	Tue, 23 Sep 2025 17:17:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] media: c8sectpfe: fix probe device leaks
Date: Tue, 23 Sep 2025 17:16:05 +0200
Message-ID: <20250923151605.17689-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to drop the references taken to the I2C adapters during probe
on probe failure (e.g. probe deferral) and on driver unbind.

Fixes: c5f5d0f99794 ("[media] c8sectpfe: STiH407/10 Linux DVB demux support")
Cc: stable@vger.kernel.org	# 4.3
Cc: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 89bd15a4d26a..3f94d9b4ef1e 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -655,6 +655,13 @@ static irqreturn_t c8sectpfe_error_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static void c8sectpfe_put_device(void *_dev)
+{
+	struct device *dev = _dev;
+
+	put_device(dev);
+}
+
 static int c8sectpfe_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -799,6 +806,11 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 			return -ENODEV;
 		}
 
+		ret = devm_add_action_or_reset(dev, c8sectpfe_put_device,
+					       &tsin->i2c_adapter->dev);
+		if (ret)
+			return ret;
+
 		/* Acquire reset GPIO and activate it */
 		tsin->rst_gpio = devm_fwnode_gpiod_get(dev,
 						       of_fwnode_handle(child),
-- 
2.49.1


