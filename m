Return-Path: <linux-media+bounces-14649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420D0927A78
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 17:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 738E61C2352C
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 15:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7561B14F0;
	Thu,  4 Jul 2024 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rd8hGCR3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B31B012A
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720108201; cv=none; b=cx+KZuA+0eZmcPZ7QiOR0Hz3LnCtEct5bEIC6G0fKaB4qwQDKn5kX8gGqcuUyScbiWiE1R5sV70G9bMk/p6r1o/oTbE0/JLz7+82rVd5tlua8OgUtr/ylWo1WCPlr76KlEB3p4N+HiqA0AnxYBstgqd1SCNs0nph8piFffacOCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720108201; c=relaxed/simple;
	bh=fJuXtbxfT7+hiDrzXfxOIVUF4esnEgufq+Cx5LGZkQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVi6brn6yQKxIi0YtfEf2JjMDdarhGQnywGYOk7FbQf6XuvSKtOTTLgWJw4kzbshmRkyXeC9SSlchogRsj509Sld/7ffquC1Ghobub9mftXQ+FDcUXBjMCvhkPa0Id1VerLpYgMU3j4QXU4mvzQbB8izxDHkVsv3hqZvu4nusfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rd8hGCR3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABF57A8F;
	Thu,  4 Jul 2024 17:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720108167;
	bh=fJuXtbxfT7+hiDrzXfxOIVUF4esnEgufq+Cx5LGZkQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rd8hGCR3VpLTWOlvyfOeW6tYDcLKRWYsj0SDnf4xprYaELBAk+svQrd5upkVfFmng
	 nj4B6CNNNc6gD+wL63e/abCholorxDTj0QUCB3J8fQD930dlqfJTH0EQDcJ3OBPM2B
	 aOui8tv+E4CLdH/mvbISXrt5L5AudzMigE8K0Un0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 3/5] media: rkisp1: Add register definitions for the companding block
Date: Thu,  4 Jul 2024 18:49:30 +0300
Message-ID: <20240704154932.6686-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240704154932.6686-1-laurent.pinchart@ideasonboard.com>
References: <20240704154932.6686-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

To prepare for adding support for the companding block to the rkisp1
driver for the version of the ISP on the i.MX8MP, add the register
definitions for it, including relevant register field values.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes since v1:

- Add comment
---
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index fccf4c17ee8d..bf0260600a19 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -704,6 +704,12 @@
 #define RKISP1_CIF_ISP_DPF_SPATIAL_COEFF_MAX		0x1f
 #define RKISP1_CIF_ISP_DPF_NLL_COEFF_N_MAX		0x3ff
 
+/* COMPAND */
+#define RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE	BIT(0)
+#define RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE	BIT(1)
+#define RKISP1_CIF_ISP_COMPAND_CTRL_SOFT_RESET_FLAG	BIT(2)
+#define RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE		BIT(3)
+
 /* =================================================================== */
 /*                            CIF Registers                            */
 /* =================================================================== */
@@ -1394,6 +1400,23 @@
 #define RKISP1_CIF_ISP_VSM_DELTA_H		(RKISP1_CIF_ISP_VSM_BASE + 0x0000001c)
 #define RKISP1_CIF_ISP_VSM_DELTA_V		(RKISP1_CIF_ISP_VSM_BASE + 0x00000020)
 
+#define RKISP1_CIF_ISP_COMPAND_BASE			0x00003200
+#define RKISP1_CIF_ISP_COMPAND_CTRL			(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_COMPAND_BLS_A_FIXED		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_COMPAND_BLS_B_FIXED		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_COMPAND_BLS_C_FIXED		(RKISP1_CIF_ISP_COMPAND_BASE + 0x0000000c)
+#define RKISP1_CIF_ISP_COMPAND_BLS_D_FIXED		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_COMPAND_EXPAND_PX_N(n)		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000014 + (n) * 4)
+#define RKISP1_CIF_ISP_COMPAND_COMPRESS_PX_N(n)		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000040 + (n) * 4)
+#define RKISP1_CIF_ISP_COMPAND_EXPAND_Y_ADDR		(RKISP1_CIF_ISP_COMPAND_BASE + 0x0000006c)
+#define RKISP1_CIF_ISP_COMPAND_EXPAND_Y_WRITE_DATA	(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000070)
+#define RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_ADDR		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000074)
+#define RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_WRITE_DATA	(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000078)
+#define RKISP1_CIF_ISP_COMPAND_EXPAND_X_ADDR		(RKISP1_CIF_ISP_COMPAND_BASE + 0x0000007c)
+#define RKISP1_CIF_ISP_COMPAND_EXPAND_X_WRITE_DATA	(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000080)
+#define RKISP1_CIF_ISP_COMPAND_COMPRESS_X_ADDR		(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000084)
+#define RKISP1_CIF_ISP_COMPAND_COMPRESS_X_WRITE_DATA	(RKISP1_CIF_ISP_COMPAND_BASE + 0x00000088)
+
 #define RKISP1_CIF_ISP_CSI0_BASE		0x00007000
 #define RKISP1_CIF_ISP_CSI0_CTRL0		(RKISP1_CIF_ISP_CSI0_BASE + 0x00000000)
 
-- 
Regards,

Laurent Pinchart


