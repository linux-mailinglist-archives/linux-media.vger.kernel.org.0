Return-Path: <linux-media+bounces-10693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBADE8BB053
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 17:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86781286AAE
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 15:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7281553A9;
	Fri,  3 May 2024 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pKbA/ok0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A315538A;
	Fri,  3 May 2024 15:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714751514; cv=none; b=BAcbYfaBQZw+ixAzGmLl2LcMFR0g9kgWts7ajXNkRvNl622OLDU+wsBIYBZYK//EMmDn8e2ILdyA2nOLeHgVlkP/XNZZUH9OiLkQd9fFV71qKQH/9pM4UybWrcyhaW3LSYdz+tIOOrABP6N9aPW/+mQyXpUb32GX7ju8jzpxE8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714751514; c=relaxed/simple;
	bh=tnsiy7HAH9DRJXcllyBthm34R+12lZ1pSgK3Q1x1+o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2yefrgySQ30GBzPZEzbJdw94lD2fRlz5fFrL4/5muPkBptedZcIW23TNtRhGP45MCTLQeiW4RnGVMEne1tPkz1SvU+WIBji/zSYmKttxEUySnObzoMyKE0oV2k4ssTr9haRaib6JeQcSAUmdEB72ROWCkTn9R6CAUoPbdb7VHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pKbA/ok0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DED501D1C;
	Fri,  3 May 2024 17:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714751450;
	bh=tnsiy7HAH9DRJXcllyBthm34R+12lZ1pSgK3Q1x1+o0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pKbA/ok0ryz57LbBxDdDGfbyJoSW/k4qO6CzzE+44DZiTcUiKw7ErPYK5NqmoKlf+
	 VA9rQ1M7c+Q46/JdYxq93en1lhBD1ZgIUgjU7Zn/8oQcVwe8c14wYsB2iYoTWUiIUZ
	 ps/5+77EO+01eQpYUSVcpYkelJ0ebHIgxT1WWG0w=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 03/11] media: rcar-csi2: Cleanup subdevice in remove()
Date: Fri,  3 May 2024 17:51:18 +0200
Message-ID: <20240503155127.105235-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
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


