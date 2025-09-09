Return-Path: <linux-media+bounces-42068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D0B4A496
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9326D4E18C0
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB38224E4B4;
	Tue,  9 Sep 2025 08:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RGIf/KBE"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99F624BC0A;
	Tue,  9 Sep 2025 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757405304; cv=none; b=PklFVBokZLKqpnvREoPqB4W66u0rVZpgIKLkLMMElduTqMQJta53GH51xZ4KfbnTGnG7kdzEiOQlJi6EFIXgECK5FiTNMyE9Bc9A419bcg6ltXsQvccrtBjtuBeSGRx5JRD+rK7aIESPHBeyioClQN8ExfRh4zDq2RCzRIIO9o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757405304; c=relaxed/simple;
	bh=Ne4C+BMqQcVIJtkfC1mDxaOD4y5ksTNyWClXK+XeqMY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gpzEGErIZJgnnScz3ik5Zzahwdpb5d1v63WOluuDVrNCzuB3rF3McIwXdpdJgHwrP2YUd+F9OL2aTuYnZPZOryNPqyMudpmAn4okQ7imSUVmQOe1sxX5vEuixTACCsNovW9RfC5qZail6ogp64SVvFqVM5UKXhk17V6yVtsMkRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RGIf/KBE; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58988GXl293703;
	Tue, 9 Sep 2025 03:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757405296;
	bh=0IQVsxUtSmCznRSWhfq5hVJWByYGmYfsvUXUUhaD7Ho=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RGIf/KBEMP6Zf17bpv6zouLO0BTz/fnhc5fKuBjQ0c95ObQlN6KmM95kbXmsc446F
	 gMzqz7SuUjxx22h5SMs0GpuuMBUutzN5VojLsVmm045LIzJczRvZtyzFjtQDMlObog
	 FQkcX2+27/KmlourK1eW2T5/9BnfGHC/mmanV8HU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58988FXL3008637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 03:08:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 03:08:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 03:08:15 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58987soF2319864;
	Tue, 9 Sep 2025 03:08:11 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V3 2/5] media: platform: ti: Add kerneldoc for vpdma_update_dma_addr()
Date: Tue, 9 Sep 2025 13:37:15 +0530
Message-ID: <20250909080718.1381758-3-y-abhilashchandra@ti.com>
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

Add kerneldoc for vpdma_update_dma_addr() function.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/ti/vpe/vpdma.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
index da90d7f03f82..b79b7e8479f9 100644
--- a/drivers/media/platform/ti/vpe/vpdma.c
+++ b/drivers/media/platform/ti/vpe/vpdma.c
@@ -552,6 +552,21 @@ EXPORT_SYMBOL(vpdma_submit_descs);
 
 static void dump_dtd(struct vpdma_dtd *dtd);
 
+/**
+ * vpdma_update_dma_addr() - update DMA address in a descriptor
+ * @vpdma: VPDMA device context
+ * @list: vpdma desc list to which we add this descriptor
+ * @dma_addr: new DMA address to program into the descriptor
+ * @write_dtd: descriptor pointer used to compute write-back address
+ * @drop: if true, set the drop bit in the write descriptor
+ * @idx: index of the descriptor in the list to update
+ *
+ * Updates dma addresses of the descriptor at @idx in @list.
+ * This allows reusing an existing descriptor list with a new buffer
+ * address, instead of rebuilding the list, which is needed when
+ * multiple clients share the same VPDMA engine. The list buffer is
+ * unmapped before the update and remapped after.
+ */
 void vpdma_update_dma_addr(struct vpdma_data *vpdma,
 	struct vpdma_desc_list *list, dma_addr_t dma_addr,
 	void *write_dtd, int drop, int idx)
-- 
2.34.1


