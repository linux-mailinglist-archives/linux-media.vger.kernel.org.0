Return-Path: <linux-media+bounces-15943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8392794AFAA
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 20:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07127281EC8
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 18:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6510013F426;
	Wed,  7 Aug 2024 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azFPRJO5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61F63CB
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723055203; cv=none; b=Galbf6xbkcfwH6Y8WNHGl9WvmJWh8ZmX9wLXM9rEKsTlcSRPSQ0nM1qe5KPbNNWH5LR0lOJC8vgSGZCjIEHsZzBlxascukL8DHhvhKP2JzglFeM3Axl6Z4o2+EX9YGyQ0duK4mFtYnIbKm0aEJBhlrphUSe0ttaiJAnPLgtrL6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723055203; c=relaxed/simple;
	bh=neE9k74tadm/IKyi5qhGqpDAIDhCaYF2jLKpBtsis4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bz7Poir1zvVjIzhRcLzhYw/Ig6ecwKgsC1vanB41jE+wH5FZRwy1WiMRAmVHwzZ3TibXIbwz0OGJJvI0f7kbiWJrYnKD/bXSPDBgSS4JqFwrwbpCk6J76w1o6NsLEizF0kD7IFxCV6Dsk9O749aXzFMlKQAWgox+KTufzeSRNqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azFPRJO5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc5a6147f3so131815ad.2
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2024 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723055201; x=1723660001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6hDyDgSISAu5RBtfAvjzPxdTO0CqUdJoX3z0h3s1XU=;
        b=azFPRJO5x5BjkM2ILYQ23jHWb2OKfWGjOCHRyvufqlz+yDwPcV56K5PiGfqMPbSDyt
         nt6OtXM1qPhCLJC75aVG7repm1oXg+QrUE7ZKMHEGfCKEnaBY3DC65pQ2s77956gczdl
         DMpX0i2pdQZhbSwg9yWeQXYk5ofak0sYnDz7mxu4TbkvWlq5VYsoVAz7mz4cfkICpImw
         Z61vsSkHzW3vl3Bqp7BVpmm2kcaW3sGWpCM4tigxk/4Thw8qN165tFyOEsj9YVlk59dZ
         HnwMDPZ1oCIUE4Sldw57e7nd39f/CSNlyQaS+Ce7ouLc5c+pDhRHanSItjt7sqNfPUi/
         TPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723055201; x=1723660001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6hDyDgSISAu5RBtfAvjzPxdTO0CqUdJoX3z0h3s1XU=;
        b=gteIATb+ve+S1WyG+8AduPowMCAIozGBXvGfMNw2lr9dx5XhmvwvQpNfyj9zQ+L39R
         XXibw2iH3g4Joo4RtKqRwaPBVRL+3ft5jOqymontPb9YswoCySD+3BPRaUranAvTz3a7
         1p1TmJvavDGHlncP63B5VbEUizXlPYOl0gAmLWk0PcG05zHk+dW84uO4VS4U7Clp7gis
         D+cMDuOflxBGp8Dt1wVWaBuQ+Brd6isJoXieFcr6bQyJDyz13qfj/zJVFgOXEa/kw0f+
         1mJ7+0d/XdHhBiIEm62nQY0tm4R35Elb50rAAY/0DGPBpC6tJluRQAghVdBHf4S3Rn5e
         x+gA==
X-Forwarded-Encrypted: i=1; AJvYcCWo4Mvbk/K5ZInfDvFWUMhc3EzOycOmvh8fuJxVrWvzVe8vgy0HrqwX6TZsZekgOvYpB8Vwm9+ZpiMkxBqLr3P5WVg26mYEVm5k2Io=
X-Gm-Message-State: AOJu0Yx9I5k2w75X4RWn+HqAoNaqYonYybp1Yzf7klydQbquwkbacSUK
	l1KSnRhuUzanvQ4IUriBtvyp0Gvbpt0PZ+/zGrry6eSvXts8bSa3
X-Google-Smtp-Source: AGHT+IEXkgGiggx3uBP/ZtuPOlMO4vSUctYObiMhxnFk152KoQ8yOm8E0VvlxuBZHjf/RpW9LKB7Rg==
X-Received: by 2002:a17:902:dac4:b0:1fc:5b41:bac9 with SMTP id d9443c01a7336-1ff57524497mr154734835ad.7.1723055201401;
        Wed, 07 Aug 2024 11:26:41 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5e1c:17b4:a72d:e3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f5331asm109946855ad.70.2024.08.07.11.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 11:26:40 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: laurent.pinchart@ideasonboard.com
Cc: rmfrfs@gmail.com,
	martink@posteo.de,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] media: imx8mq-mipi-csi2: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
Date: Wed,  7 Aug 2024 15:26:10 -0300
Message-Id: <20240807182610.81244-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807182610.81244-1-festevam@gmail.com>
References: <20240807182610.81244-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS()/SET SYSTEM_SLEEP_PM_OPS() with their modern
RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() alternatives.

The combined usage of pm_ptr() and RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS()
allows the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions..

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index ba2e81f24965..d4a6c5532969 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -693,7 +693,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 	return ret ? -EAGAIN : 0;
 }
 
-static int __maybe_unused imx8mq_mipi_csi_suspend(struct device *dev)
+static int imx8mq_mipi_csi_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
@@ -705,7 +705,7 @@ static int __maybe_unused imx8mq_mipi_csi_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused imx8mq_mipi_csi_resume(struct device *dev)
+static int imx8mq_mipi_csi_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
@@ -716,7 +716,7 @@ static int __maybe_unused imx8mq_mipi_csi_resume(struct device *dev)
 	return imx8mq_mipi_csi_pm_resume(dev);
 }
 
-static int __maybe_unused imx8mq_mipi_csi_runtime_suspend(struct device *dev)
+static int imx8mq_mipi_csi_runtime_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
@@ -731,7 +731,7 @@ static int __maybe_unused imx8mq_mipi_csi_runtime_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused imx8mq_mipi_csi_runtime_resume(struct device *dev)
+static int imx8mq_mipi_csi_runtime_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
@@ -747,10 +747,9 @@ static int __maybe_unused imx8mq_mipi_csi_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops imx8mq_mipi_csi_pm_ops = {
-	SET_RUNTIME_PM_OPS(imx8mq_mipi_csi_runtime_suspend,
-			   imx8mq_mipi_csi_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(imx8mq_mipi_csi_suspend, imx8mq_mipi_csi_resume)
+	RUNTIME_PM_OPS(imx8mq_mipi_csi_runtime_suspend,
+		       imx8mq_mipi_csi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(imx8mq_mipi_csi_suspend, imx8mq_mipi_csi_resume)
 };
 
 /* -----------------------------------------------------------------------------
@@ -958,7 +957,7 @@ static struct platform_driver imx8mq_mipi_csi_driver = {
 	.driver		= {
 		.of_match_table = imx8mq_mipi_csi_of_match,
 		.name		= MIPI_CSI2_DRIVER_NAME,
-		.pm		= &imx8mq_mipi_csi_pm_ops,
+		.pm		= pm_ptr(&imx8mq_mipi_csi_pm_ops),
 	},
 };
 
-- 
2.34.1


