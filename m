Return-Path: <linux-media+bounces-31804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09BAAB7A8
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2BA4500C70
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 06:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCD94A243E;
	Tue,  6 May 2025 00:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZiLTBL+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442F62F7C5B;
	Mon,  5 May 2025 23:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487178; cv=none; b=ccX8Nt+vSJP3GnDx9HqBteoH4yy2s2AwIg3Q4rpVDKfBBjRFbPzG5jGl2sFacgZ58as80L4O5dKbURdsjrI+e4SnHW9orDt9wodctRTGXB4qQmdeF7IEUifUonhjBlcOCGjHd+992TC9CH0WG+xjAWlyC94YuXV755KaXASubRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487178; c=relaxed/simple;
	bh=quJUHlrNvh6BDlXRUEyzXmngo9dhRmrwthDK3udwpDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iikSTEVTlIy4tWS5+MEimvATaNfibs1Mhq3bpG6ISiiI48tg7CFvQ4qlJ/o8HkqgLXrQA8mjRuDfpREkt6a2yb/aNE1JoECT/rj5qivEEE5hSAWVHxXNr3bga+0+5+xLTkPFNIBhprGdldvUf9YNaS8yNAuqyh/2r0UbiKQO8wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZiLTBL+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56763C4CEE4;
	Mon,  5 May 2025 23:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487178;
	bh=quJUHlrNvh6BDlXRUEyzXmngo9dhRmrwthDK3udwpDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TZiLTBL+DevRdyKwhDBiA3n53db4qCVZDwQQnG18NDpEMMkNXigNfcsJp2UyHlNJr
	 ycaonNp7MXC2WFkMlaC3rOA8SEPlapprJRXOlSEm50SpU9i1ZASA1T4++xypYPyLiP
	 pyFXCRJyJFX2mE5qx3oFYsYnOYXWJ17WHpavn3xG56/lk2lIXEDBh3DWp+eq73DyGd
	 qw1duWXExSB7poSom1gg9WBYQvm7mCzVEtk2KRXiabxlIBpgcWAnJidkaqIVrPTxmv
	 dJW3AdP+E+5v5+YCxmiiFH1R1iaP/gAzD+XmGQSP6hHu5yqXExZ/uJnDVvLnSrh+8N
	 MGKyHvtrL8g6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Markus Elfring <elfring@users.sourceforge.net>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 043/114] media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
Date: Mon,  5 May 2025 19:17:06 -0400
Message-Id: <20250505231817.2697367-43-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Transfer-Encoding: 8bit

From: Markus Elfring <elfring@users.sourceforge.net>

[ Upstream commit b773530a34df0687020520015057075f8b7b4ac4 ]

An of_node_put(i2c_bus) call was immediately used after a pointer check
for an of_find_i2c_adapter_by_node() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index b7e0ec265b70c..6e3b3643a2cdb 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -811,13 +811,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		}
 		tsin->i2c_adapter =
 			of_find_i2c_adapter_by_node(i2c_bus);
+		of_node_put(i2c_bus);
 		if (!tsin->i2c_adapter) {
 			dev_err(&pdev->dev, "No i2c adapter found\n");
-			of_node_put(i2c_bus);
 			ret = -ENODEV;
 			goto err_clk_disable;
 		}
-		of_node_put(i2c_bus);
 
 		tsin->rst_gpio = of_get_named_gpio(child, "reset-gpios", 0);
 
-- 
2.39.5


