Return-Path: <linux-media+bounces-21759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8899D4DB2
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AA2C281A2D
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF89E1DA0EB;
	Thu, 21 Nov 2024 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Tc1cyOr+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7484D1369B4;
	Thu, 21 Nov 2024 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732195342; cv=none; b=AigJ/u3jwZXb/zB96fOYyXvgIX+GsDFfGmkJrPTuIMPvHw3G4fKIUESjyRcW0340UUHppkK5HLGqBTvkZkIDjZNDKbpHXwbtO2/SrbUmfO6TQW7rINJkaps9q6hUXvUW6N7GmpxKxRYr57xRzTsALq/DDld3B/6vgSD7hWF8Kr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732195342; c=relaxed/simple;
	bh=zbdukW4RpLswW9YTA97O9YCIAl884Cwl+rmhWUanKGQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o9Gn7rxpLw24l/RraggWu5HL2SkJgog+MDrbFBJSZ8kW4/G6bG0LVDTwFw27IkBNRnoJDMbEE/ocdgbrb4TiYzTnAFgyyaTwLryH+PYIJHpK5CX6qgafCsSg6qT8JaEIcrOZo5lZiSVH3Yygc0yLjbCje29E/BGHn4wfe+Lwyfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Tc1cyOr+; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALAlClX018947;
	Thu, 21 Nov 2024 14:21:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	oT58q45BHt1UL79xkKrgV9Ac9/94VjkagOmgL19rZm4=; b=Tc1cyOr+kEQ8YxTp
	HvoE/Td6C19fL1PZqQlSY+e71y0kKXOPqibppW2GJHsaSO+ziXj7M0Uc0AvR1rIh
	ckChbsoEMf11DuIJ7UT52+JQxHiSZubdAJok4pYh3zm9M0N0nUTrquHnuYnSStlg
	rfPh9ipFADBeGN/Q17/r+KR7F19kM59gUt9W+PBKIOszH11q3wVdO5+VPW7kDi/u
	vgU6HYVFyCOpl7MR06UEUC/koeIXg/Dd6v+wBovhnpB405TvPSxbjzTeLCwYa6cp
	Tg8KlbL+JeBcsHZXLmjBxConU+kgwSyX3R/DsKkUILH9RGNzNmvf2LxLXvAWQ+Rf
	Ob/LYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y77nmea9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 14:21:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 22AB24004B;
	Thu, 21 Nov 2024 14:20:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B4972843D6;
	Thu, 21 Nov 2024 14:19:09 +0100 (CET)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 14:19:09 +0100
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Hugues Fruchet
	<hugues.fruchet@foss.st.com>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Erling Ljunggren <hljunggr@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Benjamin
 Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 3/3] media: verisilicon: postproc: 4K support
Date: Thu, 21 Nov 2024 14:19:04 +0100
Message-ID: <20241121131904.261230-4-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Support input larger than 4096x2048 using extended input width/height
fields of swreg92.
This is needed to decode large WebP or JPEG pictures.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 drivers/media/platform/verisilicon/hantro.h          | 2 ++
 drivers/media/platform/verisilicon/hantro_g1_regs.h  | 2 +-
 drivers/media/platform/verisilicon/hantro_postproc.c | 6 +++++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 811260dc3c77..d1337f7742e4 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -321,6 +321,8 @@ struct hantro_postproc_regs {
 	struct hantro_reg output_fmt;
 	struct hantro_reg orig_width;
 	struct hantro_reg display_width;
+	struct hantro_reg input_width_ext;
+	struct hantro_reg input_height_ext;
 };
 
 struct hantro_vp9_decoded_buffer_info {
diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
index e7d4db788e57..f6e5bbeb1914 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
+++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
@@ -351,7 +351,7 @@
 #define     G1_REG_PP_CONTROL_OUT_WIDTH(v) (((v) << 4) & GENMASK(14, 4))
 #define G1_REG_PP_MASK1_ORIG_WIDTH	G1_SWREG(88)
 #define     G1_REG_PP_ORIG_WIDTH(v)	(((v) << 23) & GENMASK(31, 23))
-#define G1_REG_PP_DISPLAY_WIDTH		G1_SWREG(92)
+#define G1_REG_PP_DISPLAY_WIDTH_IN_EXT	G1_SWREG(92)
 #define G1_REG_PP_FUSE			G1_SWREG(99)
 
 #endif /* HANTRO_G1_REGS_H_ */
diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 232c93eea7ee..84c8e287470d 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -49,7 +49,9 @@ static const struct hantro_postproc_regs hantro_g1_postproc_regs = {
 	.input_fmt = {G1_REG_PP_CONTROL, 29, 0x7},
 	.output_fmt = {G1_REG_PP_CONTROL, 26, 0x7},
 	.orig_width = {G1_REG_PP_MASK1_ORIG_WIDTH, 23, 0x1ff},
-	.display_width = {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
+	.display_width = {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 0, 0xfff},
+	.input_width_ext = {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 26, 0x7},
+	.input_height_ext = {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 29, 0x7},
 };
 
 bool hantro_needs_postproc(const struct hantro_ctx *ctx,
@@ -103,6 +105,8 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
 	HANTRO_PP_REG_WRITE(vpu, output_height, ctx->dst_fmt.height);
 	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
 	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
+	HANTRO_PP_REG_WRITE(vpu, input_width_ext, MB_WIDTH(ctx->dst_fmt.width) >> 9);
+	HANTRO_PP_REG_WRITE(vpu, input_height_ext, MB_HEIGHT(ctx->dst_fmt.height >> 8));
 }
 
 static int down_scale_factor(struct hantro_ctx *ctx)
-- 
2.25.1


