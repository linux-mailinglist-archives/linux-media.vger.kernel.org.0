Return-Path: <linux-media+bounces-15954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C0D94B216
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 23:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C57F283B0E
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 21:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB8715534B;
	Wed,  7 Aug 2024 21:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iRVn9RaW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B042155399
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723065806; cv=none; b=Z/Ezen1+UKhhSvFhWqwXekp5/eP5M+JQHRl5vMl3hqasgIeq6XyRrgje3Y6FRMFt042N1KTmpZF+Akoauoi4z5DzEsNab4kMumA43TgN0myWf7RW6UXl2UQSEyVlcNsVKSiIoZUhMFHOECK/hEougNnSWq3+4bic2glFWqWrqek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723065806; c=relaxed/simple;
	bh=WWdgbhwpIQfhaA8jmYsgKaxC7zTNSqU9acTfkxMYYis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dl5KifBLhHm3B0SEmhbJQ+xcnik0Jm+laP8DvEyLg3pnpqRRKXot7wwPWZ0UqD4SmpUg6MC46dG2ViQvOaBoxjrBobc/i6EjPrfTe4cdDECwmdvyF5O/2YL3MbncpvU5uvwiniOlt0H1R4mbk2t4z702d1ki3d96iKdDnySiiKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iRVn9RaW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-150-234-175.cust.dsl.teletu.it [93.150.234.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C10B56AF;
	Wed,  7 Aug 2024 23:22:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723065751;
	bh=WWdgbhwpIQfhaA8jmYsgKaxC7zTNSqU9acTfkxMYYis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRVn9RaWUlXkEx718N4WYtGyaslDhPtJpoqGj8s7Wr6RSTNgdUTJHeJWhUBM7DHIq
	 /W8ZWdSiWT5rVc1i7BvXH8zuvl0IJngngi++BX4qSDhN+lVO9WWlDWfVeWAOojNn/9
	 cq25Eow+4MVR8sBVMjGo4MnYjyLGNREbEs0HsNMY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v9 10/12] media: rkisp1: Add register definitions for the companding block
Date: Wed,  7 Aug 2024 23:22:50 +0200
Message-ID: <20240807212253.1667847-11-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807212253.1667847-1-jacopo.mondi@ideasonboard.com>
References: <20240807212253.1667847-1-jacopo.mondi@ideasonboard.com>
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
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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
2.45.2


