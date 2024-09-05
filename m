Return-Path: <linux-media+bounces-17675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4B896D6F1
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 364FB1F22D91
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178D419924A;
	Thu,  5 Sep 2024 11:18:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7F4155730;
	Thu,  5 Sep 2024 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725535122; cv=none; b=CJNREaJ73318ThltDPRu5gX5f1AEpB2yP82OL+hYK1XMj7M8sOTypNhrR6aq67GBXsJB6joldfmhvoAm7YQY8EEy5qByMlRKM7TrUJUoP7HA3QNsEseFG+NZnvfEY4Jf5r+grXMx1RnJhj1Xerh0PuHvyk8RwGzkNYyx1ZSoy3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725535122; c=relaxed/simple;
	bh=y3EqDBeyVCmdb0mMrYzaC93JpZi07aStyd+H8aNiG1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POD6eA0WkT1TooajwRfDFlCE73SYuJb/YVz2zBbdgo1j3uLsdEQc2/3hj7rG9qcvagG9nhJ+uGdpSj+kf00n+ynP+WJ3QfhndhsWSRPkIbsdDUJSkVr7dfqsMtRrtjUMscVQdDZ5FsfIyK2cSwJhBqNoHBBRDTGeaBkP/jl2YNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,204,1719846000"; 
   d="scan'208";a="221612434"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Sep 2024 20:18:33 +0900
Received: from localhost.localdomain (unknown [10.226.93.27])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A179A4007CFC;
	Thu,  5 Sep 2024 20:18:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Set AXI burst max length
Date: Thu,  5 Sep 2024 12:18:26 +0100
Message-ID: <20240905111828.159670-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the hardware manual section 35.2.3.26 'AXI Master Transfer Setting
Register for CRU Image Data;, it is mentioned that to improve the transfer
performance of CRU, it is recommended to use AXILEN value '0xf' for AXI
burst max length setting for image data.

Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 374dc084717f..d17e3eac4177 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -52,6 +52,11 @@
 #define AMnMBS				0x14c
 #define AMnMBS_MBSTS			0x7
 
+/* AXI Master Transfer Setting Register for CRU Image Data */
+#define AMnAXIATTR			0x158
+#define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
+#define AMnAXIATTR_AXILEN		(0xf)
+
 /* AXI Master FIFO Pointer Register for CRU Image Data */
 #define AMnFIFOPNTR			0x168
 #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
@@ -278,6 +283,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
 static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 {
 	unsigned int slot;
+	u32 amnaxiattr;
 
 	/*
 	 * Set image data memory banks.
@@ -287,6 +293,11 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 
 	for (slot = 0; slot < cru->num_buf; slot++)
 		rzg2l_cru_fill_hw_slot(cru, slot);
+
+	/* Set AXI burst max length to recommended setting */
+	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
+	amnaxiattr |= AMnAXIATTR_AXILEN;
+	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
 static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
-- 
2.43.0


