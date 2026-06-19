Return-Path: <linux-media+bounces-65248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yPaBK1TTNGp7hwYAu9opvQ
	(envelope-from <linux-media+bounces-65248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 07:27:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DAF6A3F14
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 07:27:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=lRG4CZUk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65248-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65248-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D39C303EE34
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 05:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DD833BBD0;
	Fri, 19 Jun 2026 05:27:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D1031E825;
	Fri, 19 Jun 2026 05:27:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781846839; cv=none; b=ej0AAXGetTIJeUwlSC+oZqdfUA770+T69iXTKIfE8JosWeVlbBXb1CTaWzIkFqASznW0a66ZCgqejhPclFCcPSEQneKycKDx6udt0r9npfn6qkyBqW6arkTNSr7v7VI9PP9wTpJejv4zl+W8VtylixG5W193CgsVkC1X6OXelLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781846839; c=relaxed/simple;
	bh=+wpYmpN4QK9Kq9mMomSq53WN7ciVuPzh1+gRYFGNSz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8gqlwVxlyBmOfq9L5jRKUEWLG3MfLSwgKelV65XV5TBWTHvMM4xrqERXzIyeCLXqt7vJ3j6isG5CebKIv7KqeC1t0aHsiSpp3VoK4PKTpUsApJfiuc1/PNVhwoLv4hEZjUkn2lPAOjEscnax2ff4FFIck2A8LHNjBC8v1cqrAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lRG4CZUk; arc=none smtp.client-ip=213.167.242.64
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:327:f131:c148:b7f8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18D68265D;
	Fri, 19 Jun 2026 07:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781846801;
	bh=+wpYmpN4QK9Kq9mMomSq53WN7ciVuPzh1+gRYFGNSz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lRG4CZUkbnngDwhcB9kJZrhruawJeGexWa4Hf/pmGMeyhKgnIFMyfvVx0IO2NV8bB
	 48tY580oHCQyfmcR60qZ9uMq+goVAIIGWKioZU3roLwLnn08w4NM26+RgIk4RoaER6
	 pEXEGGBqjZ5hzvlAvCIj4GK68chIZisv9bIdqsB0=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	nicolas.dufresne@collabora.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com
Subject: [RFC PATCH 4/6] media: rkisp2: Use shared media graph
Date: Fri, 19 Jun 2026 14:26:31 +0900
Message-ID: <20260619052637.1110672-5-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:michael.riesch@collabora.com,m:xuhf@rock-chips.com,m:stefan.klug@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65248-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68DAF6A3F14

Make rkisp2 use shared media graph. This allows it to be in the same
media graph as rkcif on the rk3588, opening to door to allowing the
entire capture pipeline to run in inline mode.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp2/rkisp2-common.h  |  2 +-
 .../platform/rockchip/rkisp2/rkisp2-dev.c     | 42 ++++++++++---------
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h b/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
index 1eafdb5db5d8..ecf0f5e22064 100644
--- a/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
+++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
@@ -432,7 +432,7 @@ struct rkisp2_device {
 	struct regmap *gasket;
 	unsigned int gasket_id;
 	struct v4l2_device v4l2_dev;
-	struct media_device media_dev;
+	struct media_device *media_dev;
 	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *source;
 	struct rkisp2_isp isp;
diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c b/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
index 4042bf43d287..f74b7aae3159 100644
--- a/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
+++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
+#include <media/mc-shared-graph.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
 
@@ -117,7 +118,7 @@ static int rkisp2_create_links(struct rkisp2_device *rkisp2)
 			ret = media_create_pad_link(
 				source, 0, &rkisp2->isp.sd.entity,
 				RKISP2_ISP_PAD_SINK_VIDEO,
-				MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+				MEDIA_LNK_FL_ENABLED);
 		} else {
 			ret = media_create_pad_link(source, 0,
 						    &rkisp2->isp.sd.entity,
@@ -147,6 +148,12 @@ static int rkisp2_create_links(struct rkisp2_device *rkisp2)
 	if (ret)
 		return ret;
 
+	ret = media_device_shared_join_link_sink(rkisp2->media_dev, rkisp2->dev,
+						 &rkisp2->isp.sd.entity,
+						 RKISP2_ISP_PAD_SINK_VIDEO, 0);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -233,6 +240,7 @@ static int rkisp2_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rkisp2_device *rkisp2;
 	struct v4l2_device *v4l2_dev;
+	struct media_device *mdev;
 	unsigned int i;
 	int ret, irq;
 	u32 cif_id;
@@ -298,29 +306,28 @@ static int rkisp2_probe(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 
-	rkisp2->media_dev.hw_revision = info->isp_ver;
-	strscpy(rkisp2->media_dev.model, RKISP2_DRIVER_NAME,
-		sizeof(rkisp2->media_dev.model));
-	rkisp2->media_dev.dev = &pdev->dev;
-	strscpy(rkisp2->media_dev.bus_info, RKISP2_BUS_INFO,
-		sizeof(rkisp2->media_dev.bus_info));
-	media_device_init(&rkisp2->media_dev);
+	mdev = media_device_shared_join(rkisp2->dev);
+	if (IS_ERR(mdev))
+		goto err_pm_runtime_disable;
+
+	rkisp2->media_dev = mdev;
+	rkisp2->media_dev->hw_revision = info->isp_ver;
+	strscpy(rkisp2->media_dev->model, RKISP2_DRIVER_NAME,
+		sizeof(rkisp2->media_dev->model));
+	strscpy(rkisp2->media_dev->bus_info, RKISP2_BUS_INFO,
+		sizeof(rkisp2->media_dev->bus_info));
 
 	v4l2_dev = &rkisp2->v4l2_dev;
-	v4l2_dev->mdev = &rkisp2->media_dev;
+	v4l2_dev->mdev = rkisp2->media_dev;
 	strscpy(v4l2_dev->name, RKISP2_DRIVER_NAME, sizeof(v4l2_dev->name));
 
 	ret = v4l2_device_register(rkisp2->dev, &rkisp2->v4l2_dev);
 	if (ret)
 		goto err_media_dev_cleanup;
 
-	ret = media_device_register(&rkisp2->media_dev);
-	if (ret)
-		goto err_unreg_v4l2_dev;
-
 	ret = rkisp2_entities_register(rkisp2);
 	if (ret)
-		goto err_unreg_media_dev;
+		goto err_unreg_v4l2_dev;
 
 	ret = v4l2_device_register_subdev_nodes(&rkisp2->v4l2_dev);
 	if (ret)
@@ -332,12 +339,10 @@ static int rkisp2_probe(struct platform_device *pdev)
 
 err_unreg_entities:
 	rkisp2_entities_unregister(rkisp2);
-err_unreg_media_dev:
-	media_device_unregister(&rkisp2->media_dev);
 err_unreg_v4l2_dev:
 	v4l2_device_unregister(&rkisp2->v4l2_dev);
 err_media_dev_cleanup:
-	media_device_cleanup(&rkisp2->media_dev);
+	media_device_shared_leave(rkisp2->media_dev, rkisp2->dev);
 err_pm_runtime_disable:
 	pm_runtime_disable(&pdev->dev);
 	return ret;
@@ -353,10 +358,9 @@ static void rkisp2_remove(struct platform_device *pdev)
 	rkisp2_entities_unregister(rkisp2);
 	rkisp2_debug_cleanup(rkisp2);
 
-	media_device_unregister(&rkisp2->media_dev);
 	v4l2_device_unregister(&rkisp2->v4l2_dev);
 
-	media_device_cleanup(&rkisp2->media_dev);
+	media_device_shared_leave(rkisp2->media_dev, rkisp2->dev);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.47.2


