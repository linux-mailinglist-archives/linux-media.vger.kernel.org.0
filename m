Return-Path: <linux-media+bounces-16825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A447D95F420
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58EAA1F225EC
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E80D18D65F;
	Mon, 26 Aug 2024 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V6Vj206Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0AD1925A4
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683449; cv=none; b=sijyhR2AtKCRcL/1pDIpLJq0/Rsv0mCZ921WqpjuNRtrvzuDLN0NxHJuewEpuYCMI0qNMIGeZUraQMK+ns3H4vTLPC/eXx//EjsstKsPcxTO/yjTXNnlDjZnSlEsZWLZ6/u4KLhMKP9ksPYCcPW4VXpH2MwrHOW0sEuyicP54/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683449; c=relaxed/simple;
	bh=pZV1epGz/wTS1hfjeW2geB4ciytD9LN/DMC0xOZO8Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+KPQvN03JZXsy8cuXNNrRlFBgOWb6ej5GMD5PN42ehnCSoJ7AFOov02233QNPfW6l/Urq75Fz1ufLiPV39UFilyp3xRYiqTjnzn8MSsDtiRY4R5R12R62RU6uZEAO5787kLK0ruvJbiN2AadE5fR8IENQIKmuNUevHbJOcYfO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V6Vj206Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-142-90.net.vodafone.it [5.90.142.90])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC6D9A8F;
	Mon, 26 Aug 2024 16:42:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724683377;
	bh=pZV1epGz/wTS1hfjeW2geB4ciytD9LN/DMC0xOZO8Mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V6Vj206YITen4eMqbRamPzs84dStSBV75Cl0SXgWC7duuOuNETf6v1pTJggmSigDr
	 813BxjQGHSaMYeH071Z2NdgZHx7rpjwG99yn9Yw/PCN06dlwbfRRLLGULEEjeecn1S
	 sK7wz1TzkXvCXsiERmvElw2I6CUleJbny1oe9eTE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Date: Mon, 26 Aug 2024 16:43:37 +0200
Message-ID: <20240826144338.463683-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240826144338.463683-1-jacopo.mondi@ideasonboard.com>
References: <20240826144338.463683-1-jacopo.mondi@ideasonboard.com>
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

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index f42541bb4827..fd4fec0f5d99 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1741,7 +1741,7 @@ static int pispbe_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(pispbe->dev);
 	pm_runtime_enable(pispbe->dev);
 
-	ret = pispbe_runtime_resume(pispbe->dev);
+	ret = pm_runtime_resume_and_get(pispbe->dev);
 	if (ret)
 		goto pm_runtime_disable_err;
 
-- 
2.45.2


