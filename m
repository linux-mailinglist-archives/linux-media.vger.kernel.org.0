Return-Path: <linux-media+bounces-17346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46426968626
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 13:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5B6A1F2231A
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB9B187330;
	Mon,  2 Sep 2024 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eLZJZqPW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC7187332
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725276269; cv=none; b=N4X058xMvB00TZrl4bYVZEJ708Qp/EgbOl7PgiuFxyV76fYidWUabAHB3JfjnW4BCODpHMUssDnX9v+CwshI26ilbSpoe2/VwMsUXFN0tUY/vNfRknUdszuJvHqLAAPDa0rPoS7ZSzQ6i6wBRdycmfye5Ee06tFFQM8JD0lTKeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725276269; c=relaxed/simple;
	bh=Erdp5FDXuyuMrU74gGazAV+6rDgd0aZnOx1iBhZwYIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJrsqw7Wk4qBhyJZ/t6WdI6UeWgd0n6+Hj3YUKOyk1AY5HsAsp7sFqxL7U+88LpMgHFmNp2duCC+iJflFn6XCaDwqiK80dmiX/1RaS4uHhDJfwPf6SpgdX8RkOkFi3d1xCs/YJ0JDgj4B0fwtJLG1pF0nz2wKxKTQlC6K24+uus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eLZJZqPW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-54-22.net.vodafone.it [5.90.54.22])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 032D51110;
	Mon,  2 Sep 2024 13:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725276191;
	bh=Erdp5FDXuyuMrU74gGazAV+6rDgd0aZnOx1iBhZwYIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eLZJZqPWlAMLUusAUdXdtEQ6LTPf2MYa68MImzv2yrbD7rLiBcn57dnrJ4M81oUkw
	 /avsDXyhZ2ACyX0ylkOtUlMHdbWKVeCJphm4izUQ5gEMbSriG3m7mQEEq/6DEvw7PB
	 St/Vlh7C07DuGdG4yxPUkBVcEcVdZBWCOLgIuX9I=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Date: Mon,  2 Sep 2024 13:24:06 +0200
Message-ID: <20240902112408.493201-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240902112408.493201-1-jacopo.mondi@ideasonboard.com>
References: <20240902112408.493201-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the probe() routine, the driver needs to power up the interface
in order to identify and initialize the hardware and it later suspends
it at the end of probe().

The driver erroneously resumes the interface by calling the
pispbe_runtime_resume() function directly but suspends it by
calling pm_runtime_put_autosuspend().

This causes a PM usage count imbalance at probe time, notified by the
runtime_pm framework with the below message in the system log:

 pispbe 1000880000.pisp_be: Runtime PM usage count underflow!

Fix this by suspending the interface using pm_runtime_idle() which
doesn't decrease the pm_runtime usage count and inform the PM framework
that the device is active by calling pm_runtime_set_active().

Adjust the pispbe_remove() function as well to disable
the pm_runtime in the correct order,

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
v3->v4:
- Instead of using pm_runtime for resuming, suspend using
  pm_runtime_idle() to support !CONFIG_PM

v2->v3:
- Mark pispbe_runtime_resume() as __maybe_unused as reported by
  the kernel test robot <lkp@intel.com>
---
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index d614f53f0f68..1c19ca946bd4 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1720,36 +1720,32 @@ static int pispbe_probe(struct platform_device *pdev)
 				     "Failed to get clock");
 
 	/* Hardware initialisation */
-	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
-	pm_runtime_use_autosuspend(pispbe->dev);
-	pm_runtime_enable(pispbe->dev);
-
 	ret = pispbe_runtime_resume(pispbe->dev);
 	if (ret)
-		goto pm_runtime_disable_err;
+		return ret;
 
 	pispbe->hw_busy = false;
 	spin_lock_init(&pispbe->hw_lock);
 	ret = pispbe_hw_init(pispbe);
 	if (ret)
-		goto pm_runtime_suspend_err;
+		goto runtime_suspend_err;
 
 	ret = pispbe_init_devices(pispbe);
 	if (ret)
 		goto disable_devs_err;
 
-	pm_runtime_mark_last_busy(pispbe->dev);
-	pm_runtime_put_autosuspend(pispbe->dev);
+	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
+	pm_runtime_use_autosuspend(pispbe->dev);
+	pm_runtime_set_active(pispbe->dev);
+	pm_runtime_enable(pispbe->dev);
+	pm_runtime_idle(pispbe->dev);
 
 	return 0;
 
 disable_devs_err:
 	pispbe_destroy_devices(pispbe);
-pm_runtime_suspend_err:
+runtime_suspend_err:
 	pispbe_runtime_suspend(pispbe->dev);
-pm_runtime_disable_err:
-	pm_runtime_dont_use_autosuspend(pispbe->dev);
-	pm_runtime_disable(pispbe->dev);
 
 	return ret;
 }
@@ -1760,9 +1756,11 @@ static void pispbe_remove(struct platform_device *pdev)
 
 	pispbe_destroy_devices(pispbe);
 
-	pispbe_runtime_suspend(pispbe->dev);
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
-	pm_runtime_disable(pispbe->dev);
+        pm_runtime_disable(pispbe->dev);
+        if (!pm_runtime_status_suspended(pispbe->dev))
+                pispbe_runtime_suspend(pispbe->dev);
+        pm_runtime_set_suspended(pispbe->dev);
 }
 
 static const struct dev_pm_ops pispbe_pm_ops = {
-- 
2.45.2


