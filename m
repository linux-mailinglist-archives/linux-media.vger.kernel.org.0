Return-Path: <linux-media+bounces-16018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BBB94C7F9
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 03:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A9971C222D0
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 01:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D7579DC;
	Fri,  9 Aug 2024 01:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Agxrin6L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097D9442C
	for <linux-media@vger.kernel.org>; Fri,  9 Aug 2024 01:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723166425; cv=none; b=BRD9SwbFVBsCERMFt6HbJDVL18p+Q/S/j9z/qd5nVxJS5TwABNBsDlAoGWvOscBRhNhtBIsnl4bBEJ2+XGQkZLY8AvyN0KnJPYVWE0Bd/jia+cDZ58m1kiUJLnUFx3qtv8QZRs/ZTaSqf38Nwi/qPSPkz0hgRwikX3X4n7YD3zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723166425; c=relaxed/simple;
	bh=c1NX6PsGfK6Lt1d7QfIoUAUtpFYuhAl49VWDD1qTGmk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fq8G3U8GOr1gMK33PsRS3rl8fvTj0SUy/H3/cYmIldBPTME4cUObqcqxZVTtnzfdq+7sU5/L3aI23yO0u2BAhN5YsJby70efgnlrrXd6/oJHi2XJL/i6dLIjN5anCUpj26r4LvntsGhcc2YMNIyDMK8+/RUae4Oq/giz3I1WG4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agxrin6L; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-78f86e56b4cso224843a12.3
        for <linux-media@vger.kernel.org>; Thu, 08 Aug 2024 18:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723166423; x=1723771223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=agiCSInasZMrsuEl4KeatWxGHVMtwN91APN4/gQStY8=;
        b=Agxrin6LD6Gvcrf05VFiMMcvxdwWQTdjP3ScarYhxnLLg0C+INthHKKxijxNC+RSCX
         mhA0vhVGSpR5w6wqVutlvKS/8h4qmiAGVjpsPEZIIULcUkh+NuF+5a3EbD1dmsBWJihU
         UBS7fLNZeZ87Star29AfX7WD3100lPUBwD+cdkFOf43VbI4VQXIAOfGYhqgRpg/UlCIj
         W+046Zs8Lz+Dqql6qpbCRRBhz4hjfzsLwG1QSDt+HKzgIh0uU8Qz0t1a8X/aWPu0mu6h
         kCc8A7Abos3Kc+4H7xb5lPVBsaQnGy8lHKeiP6Htbhhft8vLZ2ZhSDH/va/hpMTt+O3Y
         ASog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723166423; x=1723771223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agiCSInasZMrsuEl4KeatWxGHVMtwN91APN4/gQStY8=;
        b=c1RWJgYM6nr+sdJ1Yixk4fO+dsjGJ/by+aAtAzyUHfWdsy3EVFO7/H4RZy1jxaJ+mj
         /Z5Qx0FO3F/nItPkw+tDqhfs6p7rg87dzTgc5MmNrI+3NMqIHBPsUNULtb0dljC7+ZIV
         Noj4vbHyv85j6XMwi3QPe3x+5P+YGGvGedz5yGIpdq5adHQtSOIwX4w9OlutM664EgwD
         mTurjx5RAhFYOyzjlBxeAI/hnW1exV1h9IxO5690neawC12oaX9iIOECEzyehlnx0IFZ
         7F4TugzQAwmT6NVIduEP0/9QWGTpkDSc6vg32TnU/FnpMhB4Odir8W5chyPyN9wg9rbK
         utcA==
X-Forwarded-Encrypted: i=1; AJvYcCUGuv0WgkLnqmN4gVbOLokznHR87WoIi7yH4Tth/5Z/6j6xNp64mMDR8je7+XbAAJH+H29r1YQOzQpBgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCewNRLvfZkHQy/6+yxmf3K7SWupj8EJ//4PKPN6vlAt6MN2Iu
	EgMRLm8xXH63xINbQPMmW892FMFARHYzOrPZA1dZkk1brd7VAhBu
X-Google-Smtp-Source: AGHT+IFGtUgwIIUr5Mzmj2R1FWfcnI8AfJMHzevWhl+VsfhAnwAitwLQGWt/e5ENsImvZahgFNeZIg==
X-Received: by 2002:a05:6a00:1151:b0:710:5d11:ec2e with SMTP id d2e1a72fcca58-710cab62135mr2760443b3a.0.1723166423085;
        Thu, 08 Aug 2024 18:20:23 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2faf39sm1692249b3a.204.2024.08.08.18.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 18:20:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: mchehab@kernel.org,
	mirela.rabulea@nxp.com,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] media: imx-jpeg: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
Date: Thu,  8 Aug 2024 22:20:13 -0300
Message-Id: <20240809012013.323607-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This allows removing the CONFIG_PM ifdefery from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 1d8913813037..3428ff9d51e9 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2888,7 +2888,6 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_PM
 static int mxc_jpeg_runtime_resume(struct device *dev)
 {
 	struct mxc_jpeg_dev *jpeg = dev_get_drvdata(dev);
@@ -2911,9 +2910,7 @@ static int mxc_jpeg_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM_SLEEP
 static int mxc_jpeg_suspend(struct device *dev)
 {
 	struct mxc_jpeg_dev *jpeg = dev_get_drvdata(dev);
@@ -2934,12 +2931,10 @@ static int mxc_jpeg_resume(struct device *dev)
 	v4l2_m2m_resume(jpeg->m2m_dev);
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops	mxc_jpeg_pm_ops = {
-	SET_RUNTIME_PM_OPS(mxc_jpeg_runtime_suspend,
-			   mxc_jpeg_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(mxc_jpeg_suspend, mxc_jpeg_resume)
+	RUNTIME_PM_OPS(mxc_jpeg_runtime_suspend, mxc_jpeg_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(mxc_jpeg_suspend, mxc_jpeg_resume)
 };
 
 static void mxc_jpeg_remove(struct platform_device *pdev)
@@ -2963,7 +2958,7 @@ static struct platform_driver mxc_jpeg_driver = {
 	.driver = {
 		.name = "mxc-jpeg",
 		.of_match_table = mxc_jpeg_match,
-		.pm = &mxc_jpeg_pm_ops,
+		.pm = pm_ptr(&mxc_jpeg_pm_ops),
 	},
 };
 module_platform_driver(mxc_jpeg_driver);
-- 
2.34.1


