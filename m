Return-Path: <linux-media+bounces-48473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F764CAFF19
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 13:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19E6030C881B
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 12:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4658D3271F1;
	Tue,  9 Dec 2025 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LbGvufnG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C458326922;
	Tue,  9 Dec 2025 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283536; cv=none; b=E+jneMQ06Qx11aXKTX2FoYVbwK93tdD+QF2+B8jsuqj6Dpykkuh3Z+05P47Y28vdfrBsQgFIgFsz7DoVHnm14tZU9HE0CBTIYRlbQBDgylgUC33AKfE70GFejaplPrLnbwfo9MLz4qYeGJrfDTDTOMtMeb5pftuEPI0g6P8WQpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283536; c=relaxed/simple;
	bh=NyyRdDX2WZbA0znUhmAwrClOIgKwPmzzc+lI7uMT9ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPe6jfDaJcRwSdxLo4/5kEShwuzPQW1xTt17PfqJmA3g1gYIVezmhRBNHK5sZlQCheAIf1jb3SHjuGw0j8M/mCF95wKwGfiFQAKtPU4k9qQ1gEUdiObKwNXX+aEeVIn501kTDAEISbEMFcLkdRocV94GINgJ6sYLmHesduV8sDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LbGvufnG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25841833;
	Tue,  9 Dec 2025 13:31:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765283514;
	bh=NyyRdDX2WZbA0znUhmAwrClOIgKwPmzzc+lI7uMT9ME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LbGvufnGVH2wQu9qgZByAVecRcIA5mdtZAPfjoOssxgDH+TdY+/N1Le8aNXN5TUoW
	 bcOO4u0kBROqsaO+C9mHd5MU+m/zy+B/FCDLUTv6uV9HwA5P+yaxhmHeVf5UnGuszA
	 F+9UQlZvYiWKPXZuoT+OeKML/OD1VjJCP4CUUcyM=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: dafna@fastmail.com
Cc: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [RFC PATCH 3/6] media: rkisp1-isp: Add target_format
Date: Tue,  9 Dec 2025 12:31:33 +0000
Message-ID: <20251209123136.273938-4-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
References: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In passthough mode, we want to make sure the output format of the ISP is
identical to the input format. Add logic to ensure the format we
configure the output of the ISP with is the sink format when we are in
bypass, and the source format if we are not.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 7f0802ae3dcc..7c844e00808a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -175,9 +175,10 @@ static void rkisp1_gasket_disable(struct rkisp1_device *rkisp1)
 static void rkisp1_config_ism(struct rkisp1_isp *isp,
 			      const struct v4l2_subdev_state *sd_state)
 {
-	const struct v4l2_rect *src_crop =
+	const struct v4l2_rect *target_crop =
 		v4l2_subdev_state_get_crop(sd_state,
-					   RKISP1_ISP_PAD_SOURCE_VIDEO);
+			(isp->rkisp1->in_bypass ?
+				RKISP1_ISP_PAD_SINK_VIDEO : RKISP1_ISP_PAD_SOURCE_VIDEO));
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	u32 val;
 
@@ -185,10 +186,10 @@ static void rkisp1_config_ism(struct rkisp1_isp *isp,
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_MAX_DX, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_MAX_DY, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_DISPLACE, 0);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_OFFS, src_crop->left);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_OFFS, src_crop->top);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_SIZE, src_crop->width);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_SIZE, src_crop->height);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_OFFS, target_crop->left);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_OFFS, target_crop->top);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_H_SIZE, target_crop->width);
+	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_V_SIZE, target_crop->height);
 
 	/* IS(Image Stabilization) is always on, working as output crop */
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IS_CTRL, 1);
-- 
2.43.0


