Return-Path: <linux-media+bounces-15856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAA894942A
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 17:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05174B2C1FA
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 14:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F19E20FAAE;
	Tue,  6 Aug 2024 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iNFrI6eQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F234820FAA8
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955905; cv=none; b=gvUbmBtVRV5ck9nxYRkeht5tPl1zEOgQ4x9SLSad5qxPBiHtTtErBP1gA9HE4K4W7fZrxHguwgGUgQ6lV2vE4yu8c7ruSQO0+shOXwjR1mShbYn95acndyU3QEB+rCwrZDzrWi6to13543SbqvYW+90fKl3MyXGl3W+aRMEiM3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955905; c=relaxed/simple;
	bh=UKAxQ8w/QVkJtzaG9H0SeAMQYlX0KK27xYIJOwY0R48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wgx9XdsR40JIQ3mysTHN4CKtq+6NAfcO8tJ6FhzweJ5djNsvIe70Wt/jo4s4QKlAiFzMvph/tu88dNETznrjPtU7F0tMWD7hJYLq5CA7zCA3dUG0UnxzNrTmRh1aO6W1YX5E6O8udjXzoLn1EwQlOf0/1tx5kPu00xqmKm7pPrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iNFrI6eQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-24-0.net.vodafone.it [5.91.24.0])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB3C3B2A;
	Tue,  6 Aug 2024 16:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722955846;
	bh=UKAxQ8w/QVkJtzaG9H0SeAMQYlX0KK27xYIJOwY0R48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iNFrI6eQ2Na6qZuApz00PqCGNXF0hzS3vF9+AzEjbBD+VEbfV7hWdTJWeIsVwf+Fy
	 OYtxW9FO5c8F6Jt1dTYz7Vpm0/92x9eQlbfqiPmS8wgL7413f4sr8O+od6hpsicIXi
	 eHYUogSNtOX74Ee5WUqtOD3rNb8j13L9BoEQIiRE=
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
Subject: [PATCH v8 08/12] media: rkisp1: Add helper function to swap colour channels
Date: Tue,  6 Aug 2024 16:51:04 +0200
Message-ID: <20240806145110.918843-9-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806145110.918843-1-jacopo.mondi@ideasonboard.com>
References: <20240806145110.918843-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The BLS parameters passed by userspace are specified for named colour
channels (R, Gr, Gb and B), while the hardware registers reference
positions in the 2x2 CFA pattern (A, B, C and D).

The BLS values are swapped based on the CFA pattern when writing to or
reading from registers, using hand-roled switch statements. The logic is
duplicated already, and new code will require similar processing. Move
the swap logic to a shared function, using static data to control the
channels order.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.c  | 14 +++++
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  3 +
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 62 +++++--------------
 .../platform/rockchip/rkisp1/rkisp1-stats.c   | 51 +++++----------
 4 files changed, 45 insertions(+), 85 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
index f956b90a407a..60c97bb7b18b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.c
@@ -178,3 +178,17 @@ void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
 
 	rkisp1_sd_adjust_crop_rect(crop, &crop_bounds);
 }
+
+void rkisp1_bls_swap_regs(enum rkisp1_fmt_raw_pat_type pattern,
+			  const u32 input[4], u32 output[4])
+{
+	static const unsigned int swap[4][4] = {
+		[RKISP1_RAW_RGGB] = { 0, 1, 2, 3 },
+		[RKISP1_RAW_GRBG] = { 1, 0, 3, 2 },
+		[RKISP1_RAW_GBRG] = { 2, 3, 0, 1 },
+		[RKISP1_RAW_BGGR] = { 3, 2, 1, 0 },
+	};
+
+	for (unsigned int i = 0; i < 4; ++i)
+		output[i] = input[swap[pattern][i]];
+}
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 2f4bf7e97927..6fbc69128b55 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -598,6 +598,9 @@ void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
 void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
 			   const struct v4l2_mbus_framefmt *bounds);
 
+void rkisp1_bls_swap_regs(enum rkisp1_fmt_raw_pat_type pattern,
+			  const u32 input[4], u32 output[4]);
+
 /*
  * rkisp1_mbus_info_get_by_code - get the isp info of the media bus code
  *
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 559ba77a37d2..e8c0d7cf97a3 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -165,54 +165,20 @@ static void rkisp1_bls_config(struct rkisp1_params *params,
 	new_control &= RKISP1_CIF_ISP_BLS_ENA;
 	/* fixed subtraction values */
 	if (!arg->enable_auto) {
-		const struct rkisp1_cif_isp_bls_fixed_val *pval =
-								&arg->fixed_val;
-
-		switch (params->raw_type) {
-		case RKISP1_RAW_BGGR:
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
-				     pval->r);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
-				     pval->gr);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
-				     pval->gb);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
-				     pval->b);
-			break;
-		case RKISP1_RAW_GBRG:
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
-				     pval->r);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
-				     pval->gr);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
-				     pval->gb);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
-				     pval->b);
-			break;
-		case RKISP1_RAW_GRBG:
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
-				     pval->r);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
-				     pval->gr);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
-				     pval->gb);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
-				     pval->b);
-			break;
-		case RKISP1_RAW_RGGB:
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_A_FIXED,
-				     pval->r);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_B_FIXED,
-				     pval->gr);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_C_FIXED,
-				     pval->gb);
-			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_D_FIXED,
-				     pval->b);
-			break;
-		default:
-			break;
-		}
-
+		static const u32 regs[] = {
+			RKISP1_CIF_ISP_BLS_A_FIXED,
+			RKISP1_CIF_ISP_BLS_B_FIXED,
+			RKISP1_CIF_ISP_BLS_C_FIXED,
+			RKISP1_CIF_ISP_BLS_D_FIXED,
+		};
+		u32 swapped[4];
+
+		rkisp1_bls_swap_regs(params->raw_type, regs, swapped);
+
+		rkisp1_write(params->rkisp1, swapped[0], arg->fixed_val.r);
+		rkisp1_write(params->rkisp1, swapped[1], arg->fixed_val.gr);
+		rkisp1_write(params->rkisp1, swapped[2], arg->fixed_val.gb);
+		rkisp1_write(params->rkisp1, swapped[3], arg->fixed_val.b);
 	} else {
 		if (arg->en_windows & BIT(1)) {
 			rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_BLS_H2_START,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index 2795eef91bdd..a502719e916a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -304,48 +304,25 @@ static void rkisp1_stats_get_hst_meas_v12(struct rkisp1_stats *stats,
 static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
 				      struct rkisp1_stat_buffer *pbuf)
 {
+	static const u32 regs[] = {
+		RKISP1_CIF_ISP_BLS_A_MEASURED,
+		RKISP1_CIF_ISP_BLS_B_MEASURED,
+		RKISP1_CIF_ISP_BLS_C_MEASURED,
+		RKISP1_CIF_ISP_BLS_D_MEASURED,
+	};
 	struct rkisp1_device *rkisp1 = stats->rkisp1;
 	const struct rkisp1_mbus_info *in_fmt = rkisp1->isp.sink_fmt;
 	struct rkisp1_cif_isp_bls_meas_val *bls_val;
+	u32 swapped[4];
+
+	rkisp1_bls_swap_regs(in_fmt->bayer_pat, regs, swapped);
 
 	bls_val = &pbuf->params.ae.bls_val;
-	if (in_fmt->bayer_pat == RKISP1_RAW_BGGR) {
-		bls_val->meas_b =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
-		bls_val->meas_gb =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
-		bls_val->meas_gr =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
-		bls_val->meas_r =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
-	} else if (in_fmt->bayer_pat == RKISP1_RAW_GBRG) {
-		bls_val->meas_gb =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
-		bls_val->meas_b =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
-		bls_val->meas_r =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
-		bls_val->meas_gr =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
-	} else if (in_fmt->bayer_pat == RKISP1_RAW_GRBG) {
-		bls_val->meas_gr =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
-		bls_val->meas_r =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
-		bls_val->meas_b =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
-		bls_val->meas_gb =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
-	} else if (in_fmt->bayer_pat == RKISP1_RAW_RGGB) {
-		bls_val->meas_r =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_A_MEASURED);
-		bls_val->meas_gr =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_B_MEASURED);
-		bls_val->meas_gb =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_C_MEASURED);
-		bls_val->meas_b =
-			rkisp1_read(rkisp1, RKISP1_CIF_ISP_BLS_D_MEASURED);
-	}
+
+	bls_val->meas_r = rkisp1_read(rkisp1, swapped[0]);
+	bls_val->meas_gr = rkisp1_read(rkisp1, swapped[1]);
+	bls_val->meas_gb = rkisp1_read(rkisp1, swapped[2]);
+	bls_val->meas_b = rkisp1_read(rkisp1, swapped[3]);
 }
 
 static const struct rkisp1_stats_ops rkisp1_v10_stats_ops = {
-- 
2.45.2


