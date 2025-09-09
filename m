Return-Path: <linux-media+bounces-42067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D91B4A494
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63DB57A3DB7
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7404248F73;
	Tue,  9 Sep 2025 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="X/FOFqdi"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC0E2459D7;
	Tue,  9 Sep 2025 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757405300; cv=none; b=f4lOTccEYGm7YrZ+VoIJaFQw8BeoTu0ehBQ/gt4YlVpqq6wNilqheWNfF9sURmuWRteU9zmujtV1BVxuCe7S4YoRjBeuCeGrcgBL/t7XTu8TJvASs23Jf40a0xezmlxF7Dh8z2bGkioZfcLux/ey4UtU+ziJ2rRpuGstAoDonYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757405300; c=relaxed/simple;
	bh=rQQ/NYH0XT2y0bcBu9GEl4snCB+RMlEz2waML4P5UOk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LCYYFfkbcjaD+J+zR7IyjjYX1LkY/+x4YN9t0ugv7RTOw4JRhZTF/ARgEjSZG65NRtAopl5Cr3QXjKzQ7t1qJDTxUdkgVbh6wRE7gigrH+GUWPl8JSboday9Yvn8P2MWlBqHRN9oKMz6DsVMJ7Ox2eYDvpn1h5OcqdPLTkaGN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=X/FOFqdi; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58988ASD293692;
	Tue, 9 Sep 2025 03:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757405290;
	bh=uiTBbXv7BZK5wK0Y/uh/hpSNWpRN8sahZSuucIpfXwY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=X/FOFqdi3ngQkU8I8WoMO+2TTpvG5z5FKcdRhNrACdw/mYzTcMt1gZtpX7QcI9tWi
	 N25jlQS34JK+c6asgQP39m9nqJ0BgqYrWZjRrWZj0xCsS92qgh0HRDNGy1uEgH2ob1
	 zH+o+3RFGLKfxXpAYgf1+mIZ6AQ5k1BjdSL0HN9k=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58988Ao93630155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 03:08:10 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 03:08:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 03:08:09 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58987soE2319864;
	Tue, 9 Sep 2025 03:08:05 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V3 1/5] Revert "media: platform: ti: Remove unused vpdma_update_dma_addr"
Date: Tue, 9 Sep 2025 13:37:14 +0530
Message-ID: <20250909080718.1381758-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909080718.1381758-1-y-abhilashchandra@ti.com>
References: <20250909080718.1381758-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This reverts commit 9314891df119442a6ec1518b3d872c330e2bf1a1.

We're adding support for TI VIP driver, so this is no longer unused.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/ti/vpe/vpdma.c | 32 +++++++++++++++++++++++++++
 drivers/media/platform/ti/vpe/vpdma.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
index bb8a8bd7980c..da90d7f03f82 100644
--- a/drivers/media/platform/ti/vpe/vpdma.c
+++ b/drivers/media/platform/ti/vpe/vpdma.c
@@ -552,6 +552,38 @@ EXPORT_SYMBOL(vpdma_submit_descs);
 
 static void dump_dtd(struct vpdma_dtd *dtd);
 
+void vpdma_update_dma_addr(struct vpdma_data *vpdma,
+	struct vpdma_desc_list *list, dma_addr_t dma_addr,
+	void *write_dtd, int drop, int idx)
+{
+	struct vpdma_dtd *dtd = list->buf.addr;
+	dma_addr_t write_desc_addr;
+	int offset;
+
+	dtd += idx;
+	vpdma_unmap_desc_buf(vpdma, &list->buf);
+
+	dtd->start_addr = dma_addr;
+
+	/* Calculate write address from the offset of write_dtd from start
+	 * of the list->buf
+	 */
+	offset = (void *)write_dtd - list->buf.addr;
+	write_desc_addr = list->buf.dma_addr + offset;
+
+	if (drop)
+		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
+							   1, 1, 0);
+	else
+		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
+							   1, 0, 0);
+
+	vpdma_map_desc_buf(vpdma, &list->buf);
+
+	dump_dtd(dtd);
+}
+EXPORT_SYMBOL(vpdma_update_dma_addr);
+
 void vpdma_set_max_size(struct vpdma_data *vpdma, int reg_addr,
 			u32 width, u32 height)
 {
diff --git a/drivers/media/platform/ti/vpe/vpdma.h b/drivers/media/platform/ti/vpe/vpdma.h
index e4d7941c6207..393fcbb3cb40 100644
--- a/drivers/media/platform/ti/vpe/vpdma.h
+++ b/drivers/media/platform/ti/vpe/vpdma.h
@@ -222,6 +222,9 @@ void vpdma_free_desc_list(struct vpdma_desc_list *list);
 int vpdma_submit_descs(struct vpdma_data *vpdma, struct vpdma_desc_list *list,
 		       int list_num);
 bool vpdma_list_busy(struct vpdma_data *vpdma, int list_num);
+void vpdma_update_dma_addr(struct vpdma_data *vpdma,
+	struct vpdma_desc_list *list, dma_addr_t dma_addr,
+	void *write_dtd, int drop, int idx);
 
 /* VPDMA hardware list funcs */
 int vpdma_hwlist_alloc(struct vpdma_data *vpdma, void *priv);
-- 
2.34.1


