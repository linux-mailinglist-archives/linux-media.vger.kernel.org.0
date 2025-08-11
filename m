Return-Path: <linux-media+bounces-39410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A96B201AB
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B25A8162E84
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D512DCC11;
	Mon, 11 Aug 2025 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WKtDHaf0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF62DAFB1;
	Mon, 11 Aug 2025 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900497; cv=none; b=r0bLpXjp7X/x2tPDOd9iSNloDw3G8WCzMyfWumWqwrBSnCS4dpkfPplZUgLAITO27d8l9JqdDB30XpMAAt3DFZ6Jh2v7X88D52w7KPqCA7RpyCinWtY3eTvAbrwH0/GXojZhLFjuOQkN454GLkLvtq6PY/8tHbUkDCU2XXf/ggI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900497; c=relaxed/simple;
	bh=LkrAuDMyLBPzFqnNHQvajGJmFRMtYG6UoIo++14XmsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V1SSv8gFXpxeD+L9V8YOhpCTKB6qGj+hp/a/CGSwE64A5MQ9+vOk/r87p6sVHind6DfkIiqMa5Xmavfs39ROCIiF/IwVCR/3Voob8BnOOTDVoDSlcS11V6CFEz3p9EZI05cbTnoQCue+Dms114PknrXr9GAd/88Kvn/qMi4ky+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WKtDHaf0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.143])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6CC482A;
	Mon, 11 Aug 2025 10:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754900442;
	bh=LkrAuDMyLBPzFqnNHQvajGJmFRMtYG6UoIo++14XmsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WKtDHaf0stEuaAqVyPiuT5OfzLiyLT+qURVjciOFiA6lmlYfBY4PazIKHGMEBT9v+
	 xa7DIDJmWfO/MAKddmG/nIdgAFp5iHeSGN/mqomVE90t/cIDSrqTOM2yGmEa5WUtYl
	 8ZPpr4xd5fJV7/enjlxJ0FhZ/GdOg2NW/gC0aKrM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 11 Aug 2025 13:50:15 +0530
Subject: [PATCH v4 3/6] media: ti: j721e-csi2rx: Fix source subdev link
 creation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-probe_fixes-v4-3-aae22290f1d0@ideasonboard.com>
References: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
In-Reply-To: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=LkrAuDMyLBPzFqnNHQvajGJmFRMtYG6UoIo++14XmsI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBomafTSPL37suDBn1Tg7wE8UkBPskzQUhqLdHCN
 8cZOP6zxC+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJmn0wAKCRBD3pH5JJpx
 RSioD/9YmcsezCHjvreA9MCRvzf3a08Yu+93FIm1kZaH2YPzVWkg88C9pzFTGBKjUM2zrYMCwBd
 hx20WMgO7XE9uc+khQibag40FCkP3Hhds7sAPm62B4zhFRfT3fWrIcxEjjQZ4ib61sEdpkQrfBA
 wqug+elMB1vZWSQhWrGNC8Gh6YvznkVQLR/yfUzW6Vht6w0vE9mCeCJn6EjFx+zAAKTr+GqWFE6
 2DibZiPvcpkyc12nKVwoxPz0Rs8sJgvX38EbO+KvkflKUs+T/WNwpO6izitgNU9axHGW7FucItk
 pkd3mDzmGE+8kPhG6D7YnFO3uroMCiu3hfHuFBsPf+eUPlFUUojeGdUgH0moaK3f4liUS3ixYAK
 DmQmNzf5vQ7/EYD1USCQ68mRji/GiMLOohbNVE28fAq3eOdT8Q8dCU8uGVeXRrqasYdEh9Q0H9S
 Bh2Lw4u+T0HMD72jZl+Z524PCiUsT3YTN9NrDKNByKHjgrxLK7nYkk6bG6TYjWOAt11ooZt1Amu
 o07jEEpZz/XC9Fwx6wVi+RKosE049WY5obc0zQOqNN7BffxPgI1lA6DSCfGGKX+iiWyf0AKkgBN
 W/EFJ5BFp0hmfvIc/2RUVkXN2wFqQKly5WuP+JVSHqGsbIAF37jTECUIDmR7a213IwlEp7/tdVy
 fvyXabw026pjw8Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

We don't use OF ports and remote-endpoints to connect the CSI2RX bridge
and this device in the device tree, thus it is wrong to use
v4l2_create_fwnode_links_to_pad() to create the media graph link between
the two.

It works out on accident, as neither the source nor the sink implement
the .get_fwnode_pad() callback, and the framework helper falls back on
using the first source and sink pads to create the link between them.

Instead, manually create the media link from the first source pad of the
bridge to the first sink pad of the J721E CSI2RX.

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
Cc: stable@vger.kernel.org
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com> (on SK-AM68)
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index daadb870514602bd59519d6cd2966a9ff56794fe..09e5618de7dd0cdd5bf42083804ff7ca53f0973b 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -53,6 +53,8 @@
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
 
+#define CSI2RX_BRIDGE_SOURCE_PAD	1
+
 struct ti_csi2rx_fmt {
 	u32				fourcc;	/* Four character code. */
 	u32				code;	/* Mbus code. */
@@ -427,8 +429,9 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	if (ret)
 		return ret;
 
-	ret = v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
-					      MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+	ret = media_create_pad_link(&csi->source->entity, CSI2RX_BRIDGE_SOURCE_PAD,
+				    &vdev->entity, csi->pad.index,
+				    MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
 
 	if (ret) {
 		video_unregister_device(vdev);

-- 
2.50.1


