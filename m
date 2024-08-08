Return-Path: <linux-media+bounces-16015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40DB94C5E0
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 22:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D857B226D3
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 20:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF4515B10D;
	Thu,  8 Aug 2024 20:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m52Mad5c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2B15B0F2
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723149705; cv=none; b=YyGGgf7c8rfNZE3CRuA35Q30kC8ipGFzQ7NioUsVovyvYIVnAZt69ClMKaiFazh5jpC516hg1SRF4clhEzaa+t+MLuIVqodtP+3Y/XlE3Q8sdVRgHl2tUwjBqijKmRcltt9zbTb6/DIaMKwJolDal44kEMtNGzPkj7KkTrFv+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723149705; c=relaxed/simple;
	bh=WWdgbhwpIQfhaA8jmYsgKaxC7zTNSqU9acTfkxMYYis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPs0kZbeLHrlnUzERLhhaOFvVwKtyob/GrivPIMgJsIrvbRKQwToLQdVzIwn4rAbr0j2Wb/A81ndzaRunHzwDOcbYlwlu/BSAHCxO6rxWOb0Mro73Gs/4jHkqETY3WrBxqe4EmkC8Qr6vR0xvari4ojGxIQK6noFjzU3EBthsdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m52Mad5c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-52-118.net.vodafone.it [5.90.52.118])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 272CF18BF;
	Thu,  8 Aug 2024 22:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723149638;
	bh=WWdgbhwpIQfhaA8jmYsgKaxC7zTNSqU9acTfkxMYYis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m52Mad5cc+IzFF2eFL1w+OL2KdreOpu0J04aBQPpLuLwVTsPKEf6tF0ZlOaZCJwIn
	 ISu8OMIRAn3JX/tPThUtG9DpFkWZ3/Syz4OIeHcCnGyx0++vQIEl30vgvpfoxaG7LY
	 5uyvu4u/2mmkLbfqjuQD9vO5DizkGyFgCqG2StIk=
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
Subject: [PATCH v10 10/12] media: rkisp1: Add register definitions for the companding block
Date: Thu,  8 Aug 2024 22:41:03 +0200
Message-ID: <20240808204106.2461316-11-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808204106.2461316-1-jacopo.mondi@ideasonboard.com>
References: <20240808204106.2461316-1-jacopo.mondi@ideasonboard.com>
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


