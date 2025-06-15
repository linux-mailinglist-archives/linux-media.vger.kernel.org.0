Return-Path: <linux-media+bounces-34837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C1ADA4D9
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E638A16C669
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 23:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EB8280018;
	Sun, 15 Jun 2025 23:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Up4jD0U3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A467E1;
	Sun, 15 Jun 2025 23:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750031889; cv=none; b=r1gQLFIDes4F7MggYrjHldEiTLSEjLdJkPswRCyA3x/NbzQT9jWCcPoEuCU6xETasftn5vkgFUKEv2eACkXTkxuWo/hlBN9hWwg9ET39o0KT46VABaOdOvRHqN2qabXTq/1Pjw1sb+2yK3roCuXFvQNfTWbeRjDXo83oeZC6Eew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750031889; c=relaxed/simple;
	bh=ycDr9t/o4pQyF8qbk1WqIGmx4S876Agu45tOFN2b79g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxNyHSOoCSXwinqfSizLrnvPuC6xn/dGh0SO9lLyLg8NMBI9Kx7lTBAU/MDESHgbxOnuj59KM+bC+Zx8xTrSlvzDIQo3WuFQCWjbaPNS/QZg1X3/vfxa9JubgNLUhElQE4TUwBE63Sh71eRKrpda7tuuvX9FQs2aFLP8AVH/2uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Up4jD0U3; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=fQfa7b+m7gkk9M9nS0dfih58s9XnvLRpKTofPLeCjqw=; b=Up4jD0U3gqP7n+LU
	XF9/gckadBXC1T3+E+37/qQNil8Fy5mONp334qVIF0Z+gXy8MIBObZ9BDbdi7/Cl2ML3IgkYQat5A
	sGT2j+RpIK8urnT7fkHy76wMCP9I45uoM3NAlN0lT4VIGQ7jAnciyRzjE1UHVz6tRQzhoLLkSkMR8
	WeWo+iyea8WNp8U40dt6nz1y4J8l+Phs2Ffy0myZpOtBN7uwl6WBNCnnSLy2lt/h6WMZlEvm/3sTa
	sYvwOvm9XpnSz2E11ThKYqBNyVOwqvDcROno6JeilhWslgr4AlQqWfUSjolYey59EoN0de20i4xdh
	qgK42+aQi4uyU/yDYg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uQxEg-009kNM-1C;
	Sun, 15 Jun 2025 23:58:02 +0000
From: linux@treblig.org
To: bparrot@ti.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: platform: ti: Remove unused vpdma_update_dma_addr
Date: Mon, 16 Jun 2025 00:58:01 +0100
Message-ID: <20250615235801.148049-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

vpdma_update_dma_addr() was added in 2016 as part of
commit 2f88703a0bfd ("[media] media: ti-vpe: vpdma: Add multi-instance and
multi-client support")

but has remained unused.

Remove it.

I did see that there was a VIP driver submitted in 2020 that
doesn't seem to have got merged which did use this (and a bunch
of other unused functions).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/platform/ti/vpe/vpdma.c | 32 ---------------------------
 drivers/media/platform/ti/vpe/vpdma.h |  3 ---
 2 files changed, 35 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
index da90d7f03f82..bb8a8bd7980c 100644
--- a/drivers/media/platform/ti/vpe/vpdma.c
+++ b/drivers/media/platform/ti/vpe/vpdma.c
@@ -552,38 +552,6 @@ EXPORT_SYMBOL(vpdma_submit_descs);
 
 static void dump_dtd(struct vpdma_dtd *dtd);
 
-void vpdma_update_dma_addr(struct vpdma_data *vpdma,
-	struct vpdma_desc_list *list, dma_addr_t dma_addr,
-	void *write_dtd, int drop, int idx)
-{
-	struct vpdma_dtd *dtd = list->buf.addr;
-	dma_addr_t write_desc_addr;
-	int offset;
-
-	dtd += idx;
-	vpdma_unmap_desc_buf(vpdma, &list->buf);
-
-	dtd->start_addr = dma_addr;
-
-	/* Calculate write address from the offset of write_dtd from start
-	 * of the list->buf
-	 */
-	offset = (void *)write_dtd - list->buf.addr;
-	write_desc_addr = list->buf.dma_addr + offset;
-
-	if (drop)
-		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
-							   1, 1, 0);
-	else
-		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
-							   1, 0, 0);
-
-	vpdma_map_desc_buf(vpdma, &list->buf);
-
-	dump_dtd(dtd);
-}
-EXPORT_SYMBOL(vpdma_update_dma_addr);
-
 void vpdma_set_max_size(struct vpdma_data *vpdma, int reg_addr,
 			u32 width, u32 height)
 {
diff --git a/drivers/media/platform/ti/vpe/vpdma.h b/drivers/media/platform/ti/vpe/vpdma.h
index 393fcbb3cb40..e4d7941c6207 100644
--- a/drivers/media/platform/ti/vpe/vpdma.h
+++ b/drivers/media/platform/ti/vpe/vpdma.h
@@ -222,9 +222,6 @@ void vpdma_free_desc_list(struct vpdma_desc_list *list);
 int vpdma_submit_descs(struct vpdma_data *vpdma, struct vpdma_desc_list *list,
 		       int list_num);
 bool vpdma_list_busy(struct vpdma_data *vpdma, int list_num);
-void vpdma_update_dma_addr(struct vpdma_data *vpdma,
-	struct vpdma_desc_list *list, dma_addr_t dma_addr,
-	void *write_dtd, int drop, int idx);
 
 /* VPDMA hardware list funcs */
 int vpdma_hwlist_alloc(struct vpdma_data *vpdma, void *priv);
-- 
2.49.0


