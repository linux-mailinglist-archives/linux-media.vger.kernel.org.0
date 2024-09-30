Return-Path: <linux-media+bounces-18774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE608989CD9
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 10:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73013284CFD
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 08:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5487617C9A3;
	Mon, 30 Sep 2024 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gF8Xkek8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9F511CA9
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 08:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685210; cv=none; b=TWQ7PeU69t5OfHjswRCFzLwgzMR9HW1oUYocGSPL30pI3bDojb2Vy7d4MpOZiaZWroZrK476Z1LG+C9fpWD15F+xnnbc6IE648UaK/IFT15l1lXCaK7kxjiD+R6c6wnud1ftZZupXerLsliZCfnUtGMlnl/65/QfN85I3UX0isk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685210; c=relaxed/simple;
	bh=c8xaMOx5eNN5h0aFA5HA05QSMBs5dlneQNGC+y/HRis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhgn7r4rgz81j+Wn3ojQ+rX/cz6XG+8HVCR0NI13TFGnjdDQZxSDrVrZG9iqssr+Aavn9xrdwey7FCOPAWP43zC6QWh0bSO/lNaCnMKeP2rkbT/FWkCocdB68nSnqnAH2CsN9bm0LiyuH10HT33oo6Yabxd0zP8LWyk0dkt+Its=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gF8Xkek8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from fedora.local (unknown [95.131.45.214])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EB6539F;
	Mon, 30 Sep 2024 10:31:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727685115;
	bh=c8xaMOx5eNN5h0aFA5HA05QSMBs5dlneQNGC+y/HRis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gF8Xkek8ulIv2naHSUdvO9w8NxS+ZgmnbOx1WL3tzsVsGQ+QMDE5pRSV9aHb+Mh2q
	 x/9X5/TxPFpk4qCIt/GtArFH/q3mE/rACGYApIBiGJVzk3DGu0aTc5MWpU9TunMBtf
	 x1ONB/czju0FcKMm2uqR7asDOtNHfPifCkGYKq8s=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 30 Sep 2024 10:33:00 +0200
Subject: [PATCH v6 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-4-63d60f9dd10f@ideasonboard.com>
References: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com>
In-Reply-To: <20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3170;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=c8xaMOx5eNN5h0aFA5HA05QSMBs5dlneQNGC+y/HRis=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBm+mJPXfQQWeNX/+iQDi5wvde8xtVbCAIIDitYf
 WUysPkTRBOJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZvpiTwAKCRByNAaPFqFW
 PGW9D/0Q7xf8jLYTmLTsPW3NWnu3gsMVxywU/agjQ7hrra3Whiw0rJlprirCag+okDthn+OfUck
 EpOCUIVADux4rfJ4UvkuuILIAB6xdGt4UFmO8dcTU9aG+MXLf0SJLGSJrtAZ8ABqv7pECrl00Dr
 iLeqXQi0eYK/4CUaZaKy/V5ZG3RkLcJ30x491cT8PN7zLo1Ppix3tTF/ZI+Kz5m9jglXhoS/8RL
 ry3Q7FZC7I74Jbqj3EqJ1l5pcraaZlOnfcS+MzdGMf3jLrMCnRM6Oj14UcHs2ff2N7zInSq2DX/
 nOHoY9h4Xx7h2PawVwCNzVKiqv9Fd6o66veYB7O87LyUJnh3Sv4HedPiNOYXl7pp3JeMv7WFg7W
 Czaiz+yJkw94Egync2M0lSVanKP0CFI8zAapyk6CVYTqwfaEPUjbo9EhWC/D5XJdn9Bn9MExb66
 WotGYZuP7NpcDs+gFbT6N4SRa5+R9Mw81r1M4UgP6SgCRYY/8tzgo24k5ZquioJPbpEunr8nDx4
 wpkb1EjQF+vlrCXbVIR+QyZAW3XWs+7piQ8ZvbF/EFD/EEAGUj+JCOIFRIILHZpRDEIAyGJL6nQ
 umcnZjKiVUo5Oqarf9Am7frydo12plvHgyzw9pUNIjpmGy3Tj6UwOk51oQ8fCVEWxk/rjyEjr5E
 BBGZQEO9KS6nPZg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

During the probe() routine, the PiSP BE driver needs to power up the
interface in order to identify and initialize the hardware.

The driver resumes the interface by calling the
pispbe_runtime_resume() function directly, without going
through the pm_runtime helpers, but later suspends it by calling
pm_runtime_put_autosuspend().

This causes a PM usage count imbalance at probe time, notified by the
runtime_pm framework with the below message in the system log:

 pispbe 1000880000.pisp_be: Runtime PM usage count underflow!

Fix this by resuming the interface using the pm runtime helpers instead
of calling the resume function directly and use the pm_runtime framework
in the probe() error path. While at it, remove manual suspend of the
interface in the remove() function. The driver cannot be unloaded if in
use, so simply disable runtime pm.

To simplify the implementation, make the driver depend on PM as the
RPI5 platform where the ISP is integrated in uses the PM framework by
default.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/Kconfig   | 1 +
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
index 46765a2e4c4d1573757ff842f208834216e582cb..a9e51fd94aadc6add70f883bfcea0c9fa91f0c4b 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/Kconfig
+++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_RASPBERRYPI_PISP_BE
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV
 	depends on ARCH_BCM2835 || COMPILE_TEST
+	depends on PM
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 1c1ced2b8d7017473ded018e4badbf0792da1819..c2f062b64380d848907a28bc2672e6d70fac8909 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1718,7 +1718,7 @@ static int pispbe_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(pispbe->dev);
 	pm_runtime_enable(pispbe->dev);
 
-	ret = pispbe_runtime_resume(pispbe->dev);
+	ret = pm_runtime_resume_and_get(pispbe->dev);
 	if (ret)
 		goto pm_runtime_disable_err;
 
@@ -1740,7 +1740,7 @@ static int pispbe_probe(struct platform_device *pdev)
 disable_devs_err:
 	pispbe_destroy_devices(pispbe);
 pm_runtime_suspend_err:
-	pispbe_runtime_suspend(pispbe->dev);
+	pm_runtime_put(pispbe->dev);
 pm_runtime_disable_err:
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
@@ -1754,7 +1754,6 @@ static void pispbe_remove(struct platform_device *pdev)
 
 	pispbe_destroy_devices(pispbe);
 
-	pispbe_runtime_suspend(pispbe->dev);
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
 }

-- 
2.46.1


