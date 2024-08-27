Return-Path: <linux-media+bounces-16875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B396036D
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 09:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0612B283E1B
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 07:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D6D17BED8;
	Tue, 27 Aug 2024 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NGfAYLY4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024B817BEB4
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744442; cv=none; b=XWXB09o3BI7WrGCrVUC8dgom6+Ri9ft0hHXBCLp3Zr9plVcs6LPyOyEXCeArTc/0CoGUgsTdKb7nbeVstx7FiDx7hNjwObwRf1tsQYW9x/9PIpofOPZjhgDewwj0SUucITXfx+5AzpelJhPGAtIRVYdzWmojOKsykD6eh6UfbQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744442; c=relaxed/simple;
	bh=C1GMOlCCmHK5jSLrEL5ZhvA7WyLSyThxLUvjpRamQGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJo8bNXk8dNlpbpbv0q+ZrLZbG8IqyQ3RqZhJ0wwYXg3JoVUUv0UPsIL2dwwFuy/z/HnEyF5QpRm8pZ8IyiMGLpVO5OvNTZGYNPvMxSv2TofqcVUTfzex7esDv4KLLv4eEKELpNH0ffcpZHY4vzpJ/3wFMxn6fljhdtKffkzweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NGfAYLY4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-141-165.net.vodafone.it [5.90.141.165])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6122B108D;
	Tue, 27 Aug 2024 09:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724744364;
	bh=C1GMOlCCmHK5jSLrEL5ZhvA7WyLSyThxLUvjpRamQGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NGfAYLY4t/QSXq8N801vnYL5CPj+Th1FRiiFc5CEOjwOyBIzFRNRIe0Qnm8XJDzIB
	 uaQ1BLgzkhlY9GuHHq5c/8gGjb/HCfGhcOydam/hBV0Zt1QtU0hIBnwOgfQzmQ8o8/
	 4Ki3aKZ0S9EGI2a5u5W/hSreEZdwweqqSWFWEn0U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Date: Tue, 27 Aug 2024 09:40:18 +0200
Message-ID: <20240827074018.534354-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
References: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pisp_be driver uses and depends on runtime_pm.

During the probe() routine, the driver needs to power up the interface
in order to identify and initialize the hardware and it later suspends
it at the end of probe().

The driver erroneously resumes the interface by calling the
pispbe_runtime_resume() function directly, without going
through the pm_runtime helpers, but later suspends it by calling
pm_runtime_put_autosuspend().

This causes a PM usage count imbalance at probe time, notified by the
runtime_pm framework with the below message in the system log:

 pispbe 1000880000.pisp_be: Runtime PM usage count underflow!

Fix this by resuming the interface using the pm runtime helpers instead
of calling the resume function directly.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
v2->v3:
- Mark pispbe_runtime_resume() as __maybe_unused as reported by
  the kernel test robot <lkp@intel.com>
- Add fixes tag
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index f42541bb4827..7b62585d7510 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1638,7 +1638,7 @@ static int pispbe_runtime_suspend(struct device *dev)
 	return 0;
 }

-static int pispbe_runtime_resume(struct device *dev)
+static int __maybe_unused pispbe_runtime_resume(struct device *dev)
 {
 	struct pispbe_dev *pispbe = dev_get_drvdata(dev);
 	int ret;
@@ -1741,7 +1741,7 @@ static int pispbe_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(pispbe->dev);
 	pm_runtime_enable(pispbe->dev);

-	ret = pispbe_runtime_resume(pispbe->dev);
+	ret = pm_runtime_resume_and_get(pispbe->dev);
 	if (ret)
 		goto pm_runtime_disable_err;

--
2.45.2


