Return-Path: <linux-media+bounces-13461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A690B72B
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26992B25E37
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAD7E542;
	Mon, 17 Jun 2024 16:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="seXaGoez"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5906F1D952C;
	Mon, 17 Jun 2024 16:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640727; cv=none; b=VqWDpZ1Y6sDRclUAetu1RiA8Qubv0d4LOEYJEh8ec2NmSUPRN34IBwf6bE0NRPemdxbOqbjTXpvqtdpvZ54bfufO/NBzmcoNE9DjT1y3s9ESEkQIKjenyjRwwPZeFC9yk68WTBo8yjX2keTJ2MWVuyScnJvnnS2g+jm4RLU+5Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640727; c=relaxed/simple;
	bh=lrzdaRgVt1hiMSXgnQLl7m2uVuyE1AR/50NiFTrNkug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=frZmefLemKEbdGC2flRjP5Nu0PsQmWJUBeOpcM4jn1+AAr0tk0C3ehrS5TCluIs8o8TGuO6NUGZChLLSJhNFNUq1endlFwBnYy0iT4KmFD5KUfxi53bOVbygwWYRsiELwS4vujlI3xN9WpsQiMzz7ilYJWzTy65JtKapgpQJ9O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=seXaGoez; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3DCA55C;
	Mon, 17 Jun 2024 18:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718640702;
	bh=lrzdaRgVt1hiMSXgnQLl7m2uVuyE1AR/50NiFTrNkug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=seXaGoezsuVluXj1DUwpRmO68Pop6T9GNUYR0X1OX6Fqi9RXj284T0w4qEb5xk0nr
	 aJpmPCUD6kJzW7Ma8Of4KoYYe8gAlNVY6zsHl11xFpZuCp2Pz75hIg0NTkHMDHDrFx
	 AEHDnw7Es5z0lz0XRht+Ayj0tCbw98N7koN4/lrc=
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
Subject: [PATCH v4 02/11] media: rcar-csi2: Disable runtime_pm in probe error
Date: Mon, 17 Jun 2024 18:11:25 +0200
Message-ID: <20240617161135.130719-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
References: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Disable pm_runtime in the probe() function error path.

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
2.45.2


