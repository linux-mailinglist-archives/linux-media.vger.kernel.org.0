Return-Path: <linux-media+bounces-15942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DCC94AFA9
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 20:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488DA1C2175B
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 18:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20EF13BC35;
	Wed,  7 Aug 2024 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8LZ3Lnp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC27363CB
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723055201; cv=none; b=bDIntMLmbOfyG91sux0wWBGaeGAN8rQ6xPrtrIwTf4neaG4XiKQ/Q/ZDvQYUyl5yGZKzvU7S2p5OhgKb07bOGTrSO6JTd1gvpEdGoLUcgvnAQyWFIi2GgWGScbvJ29qNJzhhTwGcYUnZcSo/puysYGguv6CyA28luQDwXPBKrKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723055201; c=relaxed/simple;
	bh=GPr/ae/WteawkkbTpj9XnXOpfhZDYvUH+gHRt/82BUY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HT6QbcdWp/4dR8LRmMcyaKEnO3QumN24DBr7OhL6aNLEMjRm2kB3znnzbaO8dgx7TE+hi8cdVfDCK+YqIq4dEatxJZM6RtYEPp1MhmI5Xdmqv7ObbsmW8KFjDvHTh8GhdrEsgcGEfzkCPtVfxjoMl2Xf0YYgLUIVPT+t+obrVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8LZ3Lnp; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6e3341c8767so2581a12.0
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2024 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723055199; x=1723659999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9RBvmW2pMc6JordabjQPLyn+p48UJwKZX19FOHwhXTo=;
        b=N8LZ3Lnp6T0HLvGB1SZDyaH9uCuNTg51vCRsdY6Rhj9VlzwHaQV9VaI8c00G+mgudm
         uhLrLuFlnQf6tOXzxWHwFxnql5zJd6jpGkAC94mutmn7bBR4mIqRF9+SV74L2gdS0BZW
         cozjTSqMkrJSErWqFU8FBh95ILa0rnATQkDQqdeaKlB9K878oUStplU5850n6DhVLaKE
         yDjjAT2vVrefETyiDInuAiCBcqwCWRRco+L+jwvdaRTWZjSeyL5iWmHpErYob88e4Lgg
         yyC3rge/RvqCZDUP+ahCUGLMauZq720gkZ3QqQX7hycMOYl9Dn65Z6JqQYXvGJdkfkIP
         Egzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723055199; x=1723659999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RBvmW2pMc6JordabjQPLyn+p48UJwKZX19FOHwhXTo=;
        b=Ce7zkB+3EikMGZBOPZEtgc1y3/LK4SWa+Dvposlgbblbb/LBXS3Z4k18x4W2NCKG+q
         YFOpPuCjHX5HHj7mwdLoqTbEZ4KOKCCid45BibuL77OJ0ZkGa9583udUWDuzRfe+wbec
         TGAUfMmLDf3aUq2xc0xxFhl6oDSrVX8J21QhyTNBQAfgvRUs5+ze6eyYKU6XfFeT53fe
         uSCOaNmpoKTIWTyrMFsZyauFLNwdAQ5RYrdmqnbB1h0MzLUrCNZGzQLj6wS9CrP5SH2F
         EsflietnTZW77yZ9FLCSdQsldltzSH+W1yqpAzuhS+yrTL3Ko0udMgzuJpIaJqbuTWqb
         FTDw==
X-Forwarded-Encrypted: i=1; AJvYcCUtsxFNXPS2rWhEt8jBZlDqmXE+WT8draFy1d78Ozc7RmBzSsdluRGnNPo/TpsvXxp7Uj5utteknterMzl1TyGGfPdnh80G3LNtiFQ=
X-Gm-Message-State: AOJu0YzPVAjWIZpzxoqibTo/++guJYtJriM7rLYG13BI7BGNhL4QpM2f
	PqKmtMZj3eceHX2FhpvrLr1uMi1ujSdYpRZjL/t0NkJxqc6W3Aao
X-Google-Smtp-Source: AGHT+IETx7Ok5yjfVhGbY0daYdspuYI80p3KSBiy9YYkjJEMuS66oIswI8O4prlpnou5C2+I0hCt3A==
X-Received: by 2002:a17:902:d4c5:b0:1fd:d6d8:134a with SMTP id d9443c01a7336-1ff575e9a3cmr153823025ad.11.1723055199008;
        Wed, 07 Aug 2024 11:26:39 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5e1c:17b4:a72d:e3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f5331asm109946855ad.70.2024.08.07.11.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 11:26:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: laurent.pinchart@ideasonboard.com
Cc: rmfrfs@gmail.com,
	martink@posteo.de,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] media: imx-mipi-csis: Switch to RUNTIME_PM_OPS()
Date: Wed,  7 Aug 2024 15:26:09 -0300
Message-Id: <20240807182610.81244-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern RUNTIME_PM_OPS()
alternative.

The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index b9729a8883d6..08d8850399b6 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1344,7 +1344,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
  * Suspend/resume
  */
 
-static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
+static int mipi_csis_runtime_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
@@ -1359,7 +1359,7 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
+static int mipi_csis_runtime_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
@@ -1379,8 +1379,8 @@ static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops mipi_csis_pm_ops = {
-	SET_RUNTIME_PM_OPS(mipi_csis_runtime_suspend, mipi_csis_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(mipi_csis_runtime_suspend, mipi_csis_runtime_resume,
+		       NULL)
 };
 
 /* -----------------------------------------------------------------------------
@@ -1571,7 +1571,7 @@ static struct platform_driver mipi_csis_driver = {
 	.driver		= {
 		.of_match_table = mipi_csis_of_match,
 		.name		= CSIS_DRIVER_NAME,
-		.pm		= &mipi_csis_pm_ops,
+		.pm		= pm_ptr(&mipi_csis_pm_ops),
 	},
 };
 
-- 
2.34.1


