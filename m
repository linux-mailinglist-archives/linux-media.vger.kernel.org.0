Return-Path: <linux-media+bounces-36057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9BAEAC2E
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 03:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC7C1BC2B26
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B8B1714B7;
	Fri, 27 Jun 2025 01:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mRwQgX2B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C4F1632C8;
	Fri, 27 Jun 2025 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986424; cv=none; b=jdFrSVwwMx/QV7Vnw4scGrWyXsENvpRjWCixk2AIls9EzLpCpLmmtpd+87TKzIhbAb4gfilJmr4GzNA/UoD/6ZIdfJWbYEr0zrXUuESPyJdbf1bOglda7hCSICjnVKhwrSJVX+n58wWbzXz5I33cI+8TYnOO79ucSy4XbEEjxEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986424; c=relaxed/simple;
	bh=2vWSNHuUpMRiryGCLy/F2v3+8H8OmoT203YQpwm3I+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hyn6C+4nLXJf2GN2L8SJFLjlc07lirEqd62vqsrsWLCnvV2ouWZGn6DKw3FOApoQi+DcxJt0CxWJqezzYemquZ+kIWJvJborxEij8Kt2I55mXjNOSTewgrWaHwh3NyNd5wut1pTP1S6moDbeDqra4ExtJJvDV/5xTenQvY6+/Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mRwQgX2B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::cf66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C53B73B;
	Fri, 27 Jun 2025 03:06:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750986402;
	bh=2vWSNHuUpMRiryGCLy/F2v3+8H8OmoT203YQpwm3I+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mRwQgX2BWdSpaqBjp7ZYA5bsodaOmpgAsYJJXc70PTNwvcE4fpbono7b3Izb4Ur5p
	 ptMtO6DJ6TnxX1RqYHHku+tkLBkBx2gaC69L+uRMElrEY1EjfZEqSPwhr1iv7MHwHH
	 TabNBnuZlUzolXadefLu7OxYe5YarZXxO6PunPb0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Jun 2025 18:06:07 -0700
Subject: [PATCH v3 2/6] media: ti: j721e-csi2rx: Use
 fwnode_get_named_child_node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-probe_fixes-v3-2-83e735ae466e@ideasonboard.com>
References: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
In-Reply-To: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=2vWSNHuUpMRiryGCLy/F2v3+8H8OmoT203YQpwm3I+g=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBoXe6jMDU5e4a3ftkFw1Z0Dxh/M3yGgtslSRoeX
 5BwE3TR7QeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaF3uowAKCRBD3pH5JJpx
 RUhQEACfy7zPosiVhXvRkLC2J99M78ZqE/JCssfhnOi1V3k5rkZPJKGOThJXgRw9543ncb5XzxO
 h6Z3+gDSkiKcZvmOt6BxfWuAXYgEbbyKoKJUZa06L9ZQAJzougI3nC/saINEh3RdlnHR9lC5Fd5
 T8OmWYx8ymO0Qvbhln1TEV8KoqZk3hcUoPz38wJ5hX/94eVxa9HeUDympK56oRLn0zt7iOkJr2O
 yridqTeJ+GylgXo1XQBet113khNKRHrqYJq/K/plhkcpyF5eKajoiL5SbT/3t/oyhNbpzY9dJOa
 dNurwxKVG3hEjRQ6s+kiOeqRR9qkmcZiBGgxj90FG1U8G+TZ10Dj/XKDXMoyqFd4yg5c1wn9y1R
 9f1bmhb5lXHG/6hdqlLfNsVRshFzxUPsrlqsrb0YSMSKivirReuFWY9lrVDeF948F3wIzlfeR8j
 gRQ8MIBgsFrEACkniJbhyIQbWbpx1M1e4zJC57jF7biq0dsH8UDv/tY83S9yQ9hUVIEBd2pBxCM
 B7fNA9/0ias0qIqJypK+WpVOhX/NidXhLKdTBnxoR8xwczFFbJg+Ydl6vf/0/U/FdDgdnt5DxOE
 kMZB+TY/xvm3fiBES1NiBpJYiIj3+i6jAG/qyoVxdZjfvhM7FXxJlb4erf+h62v/kBWTI6QuNPp
 tgr2RkGmWeutq1Q==
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


