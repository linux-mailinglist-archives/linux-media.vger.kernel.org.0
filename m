Return-Path: <linux-media+bounces-11223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F6B8C1280
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7064281BC2
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 16:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3495B16F8FF;
	Thu,  9 May 2024 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YxSBKFWy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A5A16F8E9;
	Thu,  9 May 2024 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715271265; cv=none; b=TZZDw8zglfZoQ659rCZP+8YnBSAq62XVeDlKUOkrFBNtTaXot4/Ofm2CbIqnpm2/nqqiZpuN1ntCBD8HsMylLhKAOK2h0zYqQ6uyHk2VHS2D9brhEZlUcCzcK2flC2UEjtut/yX5M1w/4xMn2tr4nhcfh/FrDa8QUancBnpXW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715271265; c=relaxed/simple;
	bh=tUZeqYY51KElB36hTFc/HucDTocP75BzYf6Iw+gImbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha/+NtutqRG6qITtmdhhXq9k8w2WGZhEYifiYoY4ebjkKjDUbeGlNj9HcMMJt4l3DwW1LdQ7V0l4N0XnL/DMBUxqCKqtIcFyGoDGLX4Z0BIvPXhPa6Zh9Pz8fWCysYL3pnZjfhPMG81HOdO8JvtT601Q+SDzV0/ZaySZPTTjtlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YxSBKFWy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 056042D54;
	Thu,  9 May 2024 18:14:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715271256;
	bh=tUZeqYY51KElB36hTFc/HucDTocP75BzYf6Iw+gImbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YxSBKFWyWVCZbTzSUwb4TNmd7w22DFW8FvxEACMD2Y+ChVFa7UfwT59jJvN0hkMRV
	 NKKQ6MIu7pWP+N7oBQrS5/vIeKqSZ7+VNt3XmBAB/t7OLDySlLF7f6XfvflLCZqx75
	 vR8+QrehF6tjhy6M0h2hLsiMcKYiXyE66OC8DtXs=
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
Subject: [PATCH v3 03/11] media: rcar-csi2: Cleanup subdevice in remove()
Date: Thu,  9 May 2024 18:13:53 +0200
Message-ID: <20240509161403.111789-4-jacopo.mondi@ideasonboard.com>
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

Cleanup the V4L2 subdevice in the driver's remove function to
ensure its async connection are freed, and guarantee in future that
the subdev active state is cleaned up.

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 249e58c77176..2d464e43a5be 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1938,6 +1938,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
+	v4l2_subdev_cleanup(&priv->subdev);
 
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.44.0


