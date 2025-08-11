Return-Path: <linux-media+bounces-39409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72043B201A6
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A492189CE0A
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364752DAFC3;
	Mon, 11 Aug 2025 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bd5LrS0W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034A92DAFB1;
	Mon, 11 Aug 2025 08:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900483; cv=none; b=F3Wp2vcPCyW/CeE0FQ6VkzlemPhAQCQweUG6LRzrsFcJYKIKgk10HUtZD2oMSPbydZ2x4t62mmDxF21DiAmMjA+hR9804NLjJl7EOE1jxz/hGrgfFwjmfwD0YrN8NxI5Rpczz+HCKiIUf4tuo0yaL47NuowU/SQK39XanQXhz/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900483; c=relaxed/simple;
	bh=4JaC67pewBjlRN9jYK99BP9039cjK2et04ZLp3t6VvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ET6V6hQJAhqqUwMU4DIq/qhrFH2C/HxyRUoSuyMjZIj5mUiPV7q2yYI9SWd5CxP1Q/zc31VRrU+zNyMKo3XkfRtq1RIDEbyaGcg+JGDvuWqEbaoZ0f7NAWhDMisBTbEcJdCaPckQeMduzkooHIyskIMxg5p9mkLjGQCEDvtZ5e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bd5LrS0W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.143])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6631782A;
	Mon, 11 Aug 2025 10:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754900428;
	bh=4JaC67pewBjlRN9jYK99BP9039cjK2et04ZLp3t6VvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bd5LrS0WUn6DgS13rvmHQ2BOu/SpNArsRU+jHrsRdnVMXDdiSoTPajv4LOQQlQgcD
	 4nE3Rc2KgKsPYR9kQSEObNzZh82MKQKZXChu1cWg4HYNpdNwTqTGRl9wbNNAzpoBrP
	 ksx5gT2a0dDA3kNFITgn1yfzpnUbgrJsSqPxT7Hs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 11 Aug 2025 13:50:14 +0530
Subject: [PATCH v4 2/6] media: ti: j721e-csi2rx: Use
 fwnode_get_named_child_node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-probe_fixes-v4-2-aae22290f1d0@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=4JaC67pewBjlRN9jYK99BP9039cjK2et04ZLp3t6VvQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBomafShpECaVuFVnQOwJ9PVwOIgtN3AitpZhvqA
 mcP/A12pEyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJmn0gAKCRBD3pH5JJpx
 Rfs2EADHCvSnPQ2Uycu7HTTCBBt4oePwTbOkwndYoz3NuPSd3U4vmwHRDzAFz6HS6QWQUWrv/ga
 Y9sQCBxcRtWL0eze0pEMETKlWEZvhiwL4Mr37AYGO2mJxrwtQXFg5k3xEZHfjevoTRugwiZ4DKu
 FOKjCtZ2GfzRzE0g6TccmxDiWiTZ55DeE44b9x4rh8Ct0SeE35qV2VTNRq98l3LKkbHm3MdR04j
 CBIca81is88d0jQ/ATCUSR+JSC57lNQ+vZGhJyZzYm2fCVRWt9Unvgyr20rN9nxEvfcO3a13w6e
 AS2G4xicXm8PPWrXLgmbEZnN3bhEprrLSolQnWwKGMNMvyCqWzeR6UcBc0C/ml77c3TY/KzJSpT
 dBAJeZG0y5zaRZACJzZ0AkQFWzJOpU4Iow0LyjsLDKH8DDNnB/TFfz/NuWCAzPGPVfLOkHI5qaz
 VpQ3Gv7SewtPLE1PxOQ5TkShuOQvdEKyC+CkAF1qAEy7L2mRx4Nu+/SvPP5gw81EFM2lRbwxKO5
 QvhTpybptiKu81aU8ONI+iINxn2vM2lEPdoYz7B7F4kSuFrWn3AGg8odD/kagfFPBfSLSlg6cyj
 MkxHie5Zg2HmfQV2tABzQSIARQ8rRCfqOUwWdLYJtMr8dE5gpD5plcezAv+wICoOndxPYqvCpc+
 oSM0aTKXiqlFY+g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Simplify notifier registration logic. Instead of first getting the
device node, get the fwnode of the child directly.

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com> (on SK-AM68)
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6d4cccbe1fdea11f6aefd63a985a9a3c16a7a9fe..daadb870514602bd59519d6cd2966a9ff56794fe 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include <media/mipi-csi2.h>
 #include <media/v4l2-device.h>
@@ -450,25 +451,23 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
 {
 	struct fwnode_handle *fwnode;
 	struct v4l2_async_connection *asc;
-	struct device_node *node;
 	int ret;
 
-	node = of_get_child_by_name(csi->dev->of_node, "csi-bridge");
-	if (!node)
+	fwnode = fwnode_get_named_child_node(csi->dev->fwnode, "csi-bridge");
+	if (!fwnode)
 		return -EINVAL;
 
-	fwnode = of_fwnode_handle(node);
-	if (!fwnode) {
-		of_node_put(node);
-		return -EINVAL;
-	}
-
 	v4l2_async_nf_init(&csi->notifier, &csi->v4l2_dev);
 	csi->notifier.ops = &csi_async_notifier_ops;
 
 	asc = v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
 				       struct v4l2_async_connection);
-	of_node_put(node);
+	/*
+	 * Calling v4l2_async_nf_add_fwnode grabs a refcount,
+	 * so drop the one we got in fwnode_get_named_child_node
+	 */
+	fwnode_handle_put(fwnode);
+
 	if (IS_ERR(asc)) {
 		v4l2_async_nf_cleanup(&csi->notifier);
 		return PTR_ERR(asc);

-- 
2.50.1


