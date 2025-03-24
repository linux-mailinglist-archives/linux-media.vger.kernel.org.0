Return-Path: <linux-media+bounces-28630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A62A6D9BE
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 13:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40F523A5ABE
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 12:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91B525E46E;
	Mon, 24 Mar 2025 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QfjfnYVe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D117E25DD13;
	Mon, 24 Mar 2025 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817734; cv=none; b=l/UDSqVpRPwE2m7aP1DRf8IeyGnT+TP2I4ZQ/sCCwVUimAiGMrVjN7qBDHhsSinnYYdamN64RjIU73ALPreYphk0NC4w8ddBVJqcRf/GWE33q7Spjki39vVoY6gnKoQIVhSJTIqW7WdlV0DMibmnYtIsQXKWSHukb57u0lw85gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817734; c=relaxed/simple;
	bh=UpFQxZgo+uMsHBwx1KlKaUDye3Leu6sM+Yf5MHyMcqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nca5SXtWYs1m/FSgbHYXjrrc0cOBXL3Lvz6ALoD3OpiXuPv7cQzVupWypILJVC9Mjb1cqoqzJnu4q2wXTjze1ln4cTFgbPNjsQ55X4Z+LAAIYCLhw2wR0q8fC7HACmf1bo0w9W93BhqHuhbYjRMEJ3pUVxQPgtJQd0h+tvkAMI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QfjfnYVe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:904a:b2d:8d57:4705:738e])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7270A1666;
	Mon, 24 Mar 2025 13:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742817625;
	bh=UpFQxZgo+uMsHBwx1KlKaUDye3Leu6sM+Yf5MHyMcqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QfjfnYVeqJK0hlVXUfNX3ddEHLm8LnyLfgSApnB+o4GIci+OmAqz+amNT9W5fBAYl
	 +8n61NxPP8uZVYr56zyzAW2lLiEZ4KnTBCFa3AAgd+n/o3bKHWlITAA3fSi1YkRbn8
	 mAJn9F+kqav2Z6x6o/bT/KH93lC1CAnSdkVMgVeI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 24 Mar 2025 17:31:38 +0530
Subject: [PATCH 2/6] media: ti: j721e-csi2rx: Use
 fwnode_get_named_child_node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-probe_fixes-v1-2-5cd5b9e1cfac@ideasonboard.com>
References: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
In-Reply-To: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
To: Jai Luthra <jai.luthra@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=UpFQxZgo+uMsHBwx1KlKaUDye3Leu6sM+Yf5MHyMcqg=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn4Umxxlc7ZE3szqs2CqMLhePDJwfKksTGs8dsJ
 Y9LYdQMX8OJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ+FJsQAKCRBD3pH5JJpx
 RdefEACJ4AxKOtBrbXwagmez5f3MUQRWXwJ/YYI27wtVDVhigrqU1MlWc+LghGngxlhUQneb3Vn
 UKGV8Z/DUHZSZxhr118EbLHirEju654CkE0payIJqfaSMz+ETAX1hXhy89qJLW2UGJurpkqQe0k
 eOtrVaMq4lUNC4xj7Jpvv6pFhNOcNayTbEQVbfUyNCsJ0d5FwHUoHmYI49HPdxJp3h0fCwEmreg
 j2UCuarw5NPF60YrB6KZbzVZiy+/O0xPXt0N0PLvIYstD6EV9wkgfZ+nFWbB9qp8kAmuAef8HML
 jZs/seJg8mOZroa2I5hFxX3IdyBkOdgwGuv9P234yMZqEbzyralo62kFAby2lIn79z++r4Gxk0S
 OiYYJEK+75SxnlVvuAopmUIBumCgN1fvzhrsbrkX2HRxD8ezJnIdwCD3sZQcmOhkZyiiYL8+fNW
 io34wo1UGopMDvtGE5+on2o8GdxHqSDqrqn7YrGXbYJ2x80+yhUzY84ItXTQNI+mHMMjwN1NQAN
 BWeNtk+jRSxTCr2ep9QnvzNit6gjjyK3js7hzzMfLmTzXhs0KbZlSrwLAe7QBnxCT7yfFli+7bb
 gHvqdqKh+XYQ3s3pqiM7no/liK/RF9j13HIG5X/2nU5Ld0Sf0BttwgDRsOlAZfWeyr3wSidwEyk
 Q6E+cLcgAmk1OPQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Simplify notifier registration logic. Instead of first getting the
device node, get the fwnode of the child directly.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index a066024bf745450e2ba01d06c0fec4e6bdbfa97e..6d406925e092660cb67c04cc2a7e1e10c14e295e 100644
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
2.48.1


