Return-Path: <linux-media+bounces-29863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA00A839E4
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4E648A4818
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1691B204C19;
	Thu, 10 Apr 2025 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LoXQ87V2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D11D5143;
	Thu, 10 Apr 2025 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267790; cv=none; b=fjAeiPlHnjFJWJ/Gff0rJZWnc7ewCEMJz2wdi9RfAHPMbFTGCKzuaOMNCIOz/2MEfbj4p3O9ydWFFrX8Hg41gAcF0U7Q1l9kGIkgDW9/vZkZiuKNOTjPpTnxm+7wpCVzHPfNhfeuKbfC9JYXFryYkcAKYG2z74E8UDn+mzlNrDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267790; c=relaxed/simple;
	bh=Qmh6mblMPaKUFpH+6loOYkLwSxCVt2hNWZhCNqv1ojs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2n3kMr7G/SoTR6zcEClWTWvHyNkZz298xudjuKltP2uz3cJIKVaZ4iCWB2IbX7LqYpILSz6EUE8PvYc62gnIbwK/GlhH7U1wyTdbrrtFsRKF14VIhGcRCoCvBTjbjJKvi9tpp2osWBlrfdnaVcYPFakeP+2VjrtRW9pAWeyBH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LoXQ87V2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:389d:1fcb:c0f8:ff7c:208d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7BAAEE4;
	Thu, 10 Apr 2025 08:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744267669;
	bh=Qmh6mblMPaKUFpH+6loOYkLwSxCVt2hNWZhCNqv1ojs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LoXQ87V26TjCoAP0Zyg77KBuyawJ8fJwnF5+wK8U+Vl1gW4soNZ8nlhEiP+WTtFO3
	 ZvPJMQbbdztAo/LqyshtKSK6c+zKqMKbmdGKaQOLSyKtiUJEU44maC5BLjjMdYrqPN
	 WuyMpQ85PMcR2Xa+9H4X/iERBUG7DS6rC/S0jKCU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 10 Apr 2025 12:19:00 +0530
Subject: [PATCH v2 2/6] media: ti: j721e-csi2rx: Use
 fwnode_get_named_child_node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-probe_fixes-v2-2-801bc6eebdea@ideasonboard.com>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
In-Reply-To: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1925;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Qmh6mblMPaKUFpH+6loOYkLwSxCVt2hNWZhCNqv1ojs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn92n3JSzLrDTKSmTlsu6K4vn3vcSvKyj09Eu0J
 t4u78alPSCJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ/dp9wAKCRBD3pH5JJpx
 Ra1oEACNhrTaNHHA+VsNdppXcFqScfJbsz42AWsmSrzbRjWd5O+YdtFgPaAh7jx6M6yeGCr1RUT
 W9WS16fDXPIGDU9RFu1dunif9A48hSBHozMCVjmeJXbROdTDvQLHneohNTmy7QQQxM7gTBkfeah
 9Jy3DfaTFruKX1Fvn/hR0zg9MdUUv+F0i+0r8Z69FS3BbI4R5aHFJ8ZcOPUQIcI7DdmqGv5XO4f
 V3msA22ZN2AWkPPpTBAmt56udLJMOi2J0OFQm9cZTZFbnjmsY7x9fe1xm82z9lTWYeq/9iuXnJu
 gzrqsra2bhRU405mwxjaK9N+fL8PEs4sPOfugHx4nuIawlCgIIxt9HnzT73YBPc7XEXAsXJXlT6
 N4YuEyfyLoYaz2SZXE5QUZBIJwQh5oiYQQtQV/BK3b5hjVeU7orpbcVb5Dkkoq+Qx6sJbCFT2fi
 r6kqnuTD2A1mBNBShDWHWs9II4Vy/aLqvA5EJZ4aU61PAcNQGRJ6ZWXI5hB+hu8/ORcYzv31e2U
 oBVWlqhNxvyCG6Yd6jS3lW59pprqqM/BVyfO/WWJA2G9ztHKmNOGJv/Ltx4e6wJj7H4rwt80iVQ
 5/5CrpDAlqpNVKk6KlJNtTIUEZ5aO+5PNfQbgT0OXbIRYQpvOJtKFcgxxor9y+a314VEou4zjG/
 pY6G0apCLfAe1Hg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Simplify notifier registration logic. Instead of first getting the
device node, get the fwnode of the child directly.

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
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
2.49.0


