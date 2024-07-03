Return-Path: <linux-media+bounces-14614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A063926B86
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 00:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D3281C21AC9
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 22:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59AD193097;
	Wed,  3 Jul 2024 22:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qMDTyEGs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F7A191F91
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720045562; cv=none; b=vD5uwGdS636+TXKvvsibAmpRexdEqoarRXQK+6mZZ9Et6pPkugvP4f5HrXiogoZ9s/JCQJlNw9oKqvwrKydgDLX28dRWv+oXTRAz9dcCmZw9qZlXnEWkr02pr91DNiwI/NQ5wm643eLoFoI/IuzOGDnGU2D9kPjkntHtOhY+rVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720045562; c=relaxed/simple;
	bh=oGdURJJyUhMeCw0DPfBONi7Isre1+e6VHX/AeGbNs+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdqMroDx3ew56IYvF6RA004BcQZqRuSEv+m8VF6sMKnAUGXPgQCJ4UFK7luep0fiGza/akVs++aB4g+OCN5RBYZQ97NsfJ6MeGyFihHEcaek7IiFplUb81l1mMfYjc7UyaYzplXxY1gtbibwTK0nd+4gUJLWQvXIHiILmFToe8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qMDTyEGs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80791A4C;
	Thu,  4 Jul 2024 00:25:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720045529;
	bh=oGdURJJyUhMeCw0DPfBONi7Isre1+e6VHX/AeGbNs+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qMDTyEGsVWGNCucj9mpvLrSmAvW6FUEPKmBKbvAvyYt0fxaObWPil7werPS7HjVht
	 4DT+zRuHs6BeeAs5V6vbDnD+fgiDQTv+q7xg7Q8zplhGnUijf9uV14l14HLH5I+dnW
	 56esSMcKPmO0qeQv3v2vkvr491xZ5sBVhjOZao7k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 3/5] media: rkisp1: Add register definitions for the companding block
Date: Thu,  4 Jul 2024 01:25:31 +0300
Message-ID: <20240703222533.1662-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
References: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
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
---
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index fccf4c17ee8d..f516c9c1b822 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -704,6 +704,11 @@
 #define RKISP1_CIF_ISP_DPF_SPATIAL_COEFF_MAX		0x1f
 #define RKISP1_CIF_ISP_DPF_NLL_COEFF_N_MAX		0x3ff
 
+#define RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE	BIT(0)
+#define RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE	BIT(1)
+#define RKISP1_CIF_ISP_COMPAND_CTRL_SOFT_RESET_FLAG	BIT(2)
+#define RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE		BIT(3)
+
 /* =================================================================== */
 /*                            CIF Registers                            */
 /* =================================================================== */
@@ -1394,6 +1399,23 @@
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


