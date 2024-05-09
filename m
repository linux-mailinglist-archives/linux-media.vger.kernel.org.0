Return-Path: <linux-media+bounces-11222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C10B8C127E
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0C60281D8B
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 16:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EE016F8F6;
	Thu,  9 May 2024 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nysqjf4U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9453D16F844;
	Thu,  9 May 2024 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715271265; cv=none; b=sR2G8o5chvUwKGfBG//7ic2bRHFAXHqDT19GLxu5EFGIzf9sJBYd+D2EaFdaMyAyLShXAW/qguwYBynStDOpsALrcje/yNnCe9y/PCMPW5tXKmK9Nkv9RS/XI4PG0lSJKwWbjh68I/nyITGIZZir5K1MPEmWQwuhfyVyyl2kcdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715271265; c=relaxed/simple;
	bh=0P4tQm0jyJeqAL4uO7vmToFIEhJvTW2jbV9ewBuB59k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0jDLtYBAzM00IjICNSu7dRI9TQPGm7U/DM54LsNhsAk+qESObfjLCCYIcPoUx5o62nj8/dojaSUcvj5KDbpG+JikafnOCzAH1hXwXkZI8Git0imChrazayImO3xQyo/NlfpUbiRrXx1EZ7rSYslRP4Y8EreMIFtYN5KZiIDcgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nysqjf4U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61730CC8;
	Thu,  9 May 2024 18:14:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715271255;
	bh=0P4tQm0jyJeqAL4uO7vmToFIEhJvTW2jbV9ewBuB59k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nysqjf4UO062Bnt7r7H9Oym7dVMo6TSqAIU7IL2Pg+bw6aEjf9YJdB/0uaYp/xnT2
	 KWhy9Hf/bTJ+Z5qFm8QPg03aoyVs5+WPtoKdlRAQiIziKDRLt7MLDdyj+xlQi+0wJa
	 kTN/6O33G3S0Db/WZgTpGxpifuHFbqi4tRLtvnPc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 02/11] media: rcar-csi2: Disable runtime_pm in probe error
Date: Thu,  9 May 2024 18:13:52 +0200
Message-ID: <20240509161403.111789-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable pm_runtime in the probe() function error path.

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 582d5e35db0e..249e58c77176 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1914,12 +1914,14 @@ static int rcsi2_probe(struct platform_device *pdev)
 
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret < 0)
-		goto error_async;
+		goto error_pm_runtime;
 
 	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
 
 	return 0;
 
+error_pm_runtime:
+	pm_runtime_disable(&pdev->dev);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
-- 
2.44.0


