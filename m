Return-Path: <linux-media+bounces-5393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A298F859956
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 21:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 515621F21611
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 20:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B630E71B4F;
	Sun, 18 Feb 2024 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KYl+7gEg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADEE6D1AB
	for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 20:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708289047; cv=none; b=Kb2Dl58TaV3YEQcLTOrWijVGsVLX56chU/hKorDeQW25BHYpvQAaJ5JHExn52Uxy2QtlSojnWLxvtsMpIqeX4MpC7DKEq0jcBsq2QEK90Jnz0Pw8zfhm2XKkK3vR+BHKWE0KOp9PQ4g0TNMl+85Nr05vke6Sld4vS4yGt4atK78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708289047; c=relaxed/simple;
	bh=j0wCPQLs+LbZ056Jh8fQyY1hzBEVcm2K/+cl1Nzg9bU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbyKKw5ghOzLueGeHEa3lMvdGo8vZ24QTHLYSJforXie+0Pbmio+BxTLLmqZYn/1Ksn4s4NjRWwNo3ADbCD2DN4+8HeHJKvNg0RkqQzMVXvozeaBsAt2JxYlngABKxB+gyVE1+X96uarMuhlhs9mj43zHoMt3pL18H4Ou45BRsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KYl+7gEg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F40611C1D;
	Sun, 18 Feb 2024 21:43:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708289034;
	bh=j0wCPQLs+LbZ056Jh8fQyY1hzBEVcm2K/+cl1Nzg9bU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KYl+7gEgXrx5cC5ESOKrxkuFse9sdBtyyJwfS87/B/ZIwId8z++WOApL2N2eGj7jY
	 2SjSde5Rpiq1abrBG0ZDn0eqPptMa53ILrsdVO/Bgorj/l2G9qLerD5Yj4gr9rgcV0
	 uK7w7zFSBonmXCBMuKtb2HNOtRdQOYy9gkKZRZD0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Helen Koike <helen.koike@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v13 10/12] media: rkisp1: Add UYVY as an output format
Date: Sun, 18 Feb 2024 22:43:48 +0200
Message-ID: <20240218204350.10916-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
References: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

Add support for UYVY as an output format. The uv_swap bit in the
MI_XTD_FORMAT_CTRL register that is used for the NV formats does not
work for packed YUV formats. Thus, UYVY support is implemented via
byte-swapping. This method clearly does not work for implementing
support for YVYU and VYUY.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Adam Ford <aford173@gmail.com>
---
Changes since v6:

- Replace MI_OUTPUT_FORMAT feature flag with MAIN_STRIDE
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 33756b44a317..0efdf8513de0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -97,6 +97,12 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
 		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.uv_swap = 0,
+		.yc_swap = 1,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV422P,
 		.uv_swap = 0,
@@ -231,6 +237,13 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
 		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.uv_swap = 0,
+		.yc_swap = 1,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV422P,
 		.uv_swap = 0,
@@ -464,6 +477,20 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
 		rkisp1_write(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL, reg);
 	}
 
+	/*
+	 * U/V swapping with the MI_XTD_FORMAT_CTRL register only works for
+	 * NV12/NV21 and NV16/NV61, so instead use byte swap to support UYVY.
+	 * YVYU and VYUY cannot be supported with this method.
+	 */
+	if (rkisp1_has_feature(rkisp1, MAIN_STRIDE)) {
+		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT);
+		if (cap->pix.cfg->yc_swap)
+			reg |= RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_BYTE_SWAP_BYTES;
+		else
+			reg &= ~RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_BYTE_SWAP_BYTES;
+		rkisp1_write(rkisp1, RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT, reg);
+	}
+
 	rkisp1_mi_config_ctrl(cap);
 
 	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_CTRL);
@@ -507,6 +534,20 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
 		rkisp1_write(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL, reg);
 	}
 
+	/*
+	 * U/V swapping with the MI_XTD_FORMAT_CTRL register only works for
+	 * NV12/NV21 and NV16/NV61, so instead use byte swap to support UYVY.
+	 * YVYU and VYUY cannot be supported with this method.
+	 */
+	if (rkisp1_has_feature(rkisp1, MAIN_STRIDE)) {
+		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT);
+		if (cap->pix.cfg->yc_swap)
+			reg |= RKISP1_CIF_OUTPUT_ALIGN_FORMAT_SP_BYTE_SWAP_BYTES;
+		else
+			reg &= ~RKISP1_CIF_OUTPUT_ALIGN_FORMAT_SP_BYTE_SWAP_BYTES;
+		rkisp1_write(rkisp1, RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT, reg);
+	}
+
 	rkisp1_mi_config_ctrl(cap);
 
 	mi_ctrl = rkisp1_read(rkisp1, RKISP1_CIF_MI_CTRL);
-- 
Regards,

Laurent Pinchart


