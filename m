Return-Path: <linux-media+bounces-10902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F08BD315
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA850B22E59
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC81156F4A;
	Mon,  6 May 2024 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ljIfV/F1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B831A155757;
	Mon,  6 May 2024 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014203; cv=none; b=PxQ7DPac5f3DPvBh57IYlsJ8jAoy07xcIpIlJusYbYTWmlOBB8sJ2ZHwj9YVlD1a+3ZWHDmZqkbfBK/QzTlrHA14X63Z2eGPABsSMLgGUaKnN+tSPX/yZpDXp8xlc4750JOSzRnHT0sC6YxLNlkoDPYvRklY4OnuMFFNJLKxdxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014203; c=relaxed/simple;
	bh=0P4tQm0jyJeqAL4uO7vmToFIEhJvTW2jbV9ewBuB59k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUCJ+umhH1f5E56lTjNGEYxwwM1XzF/qElTZJEa2CuOfDYS36i/q/KXD9nvnfy6h7dMJWUohj+HFk9Kvd6+RUyfHhYsnTqJttHgxVWcrh2VtPc6Mm5kmbmJ/gSBSyuJ8IgqHxW2rlsB9F6omWd8QQjeScC1yx3W0Y+TUMXNWNsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ljIfV/F1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0381F11D6;
	Mon,  6 May 2024 18:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715014195;
	bh=0P4tQm0jyJeqAL4uO7vmToFIEhJvTW2jbV9ewBuB59k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ljIfV/F10oPFENNLwf6f3US1HexoBYLX1XQSXUUOAIPLBfUxhTiPSRzLdKiVj3XoB
	 6XVukK/+rEe3K9taJvJIQckLldAiQsARbatd4A8o/C6OaRPw0zL9D6+iN/YttGPqxv
	 aS+SFVz1pzQ/aUAqA0FEhXC3lFFjsOFEZuzGxh/E=
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
Subject: [PATCH v2 02/11] media: rcar-csi2: Disable runtime_pm in probe error
Date: Mon,  6 May 2024 18:49:30 +0200
Message-ID: <20240506164941.110389-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
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


