Return-Path: <linux-media+bounces-17553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADF396B79B
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D9641C24366
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 10:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907341CEE99;
	Wed,  4 Sep 2024 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UzVzfG02"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8319C1CEAA4
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443992; cv=none; b=muhAVxX/1b2LV7OH2HlmvT0B2yvSVpuNp9p9y/shijS4PdnpurCmJEWZjJen+Fqx2AkaAFmtHUXxPIFAN8z4shRAa3SREh1s9jQwr6nE0br5Wnjf4ZH5uRSz9KDvI9juc4cVLBG9dnXDFVjDUru7QKovg03ij5fgXWAe4hKdWsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443992; c=relaxed/simple;
	bh=59Zv0VI3E2JX1bZcSBPmKAwJOnWnm4dQLG0L1/BdG4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwQeqWe4azVGb9jvgDoix4WyD6wgOMC6SFJ01djybcQXo5CZHhBPaYGY2JgZwfcKGc74CFVcLvf3W3naknCs2HaL3ts24QZQbL+XYGYjXMN9268bBUxqAN6s3z+HjF03PuDl/Bpy24gB9VRCX+JS4fLg8eHlmq23a+IzSDyoH84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UzVzfG02; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1256158E;
	Wed,  4 Sep 2024 11:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725443913;
	bh=59Zv0VI3E2JX1bZcSBPmKAwJOnWnm4dQLG0L1/BdG4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UzVzfG02pMLeFise1Q26Gr4jUgAWzZCVn0NOfeDaj5o+VoRAFk/vuSxgeXoqOEmIU
	 LTffICvFYXt5ZB5mzVXAEhs8MKIY/ZUH5qe6oEtF0j/m2ZZGnMfCnuNNMhHDhbmQ1R
	 yByWwU10ufNLzsluKXirmpp9ZDlquYW0v3unLzSY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v5 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Date: Wed,  4 Sep 2024 11:58:35 +0200
Message-ID: <20240904095836.344833-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904095836.344833-1-jacopo.mondi@ideasonboard.com>
References: <20240904095836.344833-1-jacopo.mondi@ideasonboard.com>
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
the pm_runtime in the correct order.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v4->v5:
- Indent with tabs :/

v3->v4:
- Instead of using pm_runtime for resuming, suspend using
  pm_runtime_idle() to support !CONFIG_PM

v2->v3:
- Mark pispbe_runtime_resume() as __maybe_unused as reported by
  the kernel test robot <lkp@intel.com>
---
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 1c1ced2b8d70..c66445e077a4 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1714,36 +1714,32 @@ static int pispbe_probe(struct platform_device *pdev)
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
@@ -1754,9 +1750,11 @@ static void pispbe_remove(struct platform_device *pdev)
 
 	pispbe_destroy_devices(pispbe);
 
-	pispbe_runtime_suspend(pispbe->dev);
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
+	if (!pm_runtime_status_suspended(pispbe->dev))
+		pispbe_runtime_suspend(pispbe->dev);
+	pm_runtime_set_suspended(pispbe->dev);
 }
 
 static const struct dev_pm_ops pispbe_pm_ops = {
-- 
2.46.0


