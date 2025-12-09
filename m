Return-Path: <linux-media+bounces-48472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCDDCAFF0E
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 13:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5EAD30B325C
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 12:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AE83277A9;
	Tue,  9 Dec 2025 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f0Vs0DS6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B10E326D74;
	Tue,  9 Dec 2025 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283532; cv=none; b=OmMmijx/Rh+iXKXNJ/2SQVYEqQk528xI8mEKquxOkw3F4YQ6HwSZLoPiyD5VhEiYY4qdOkIbJKLLxWhiDWZbtX3NHqlw/HSitUjg6XgXB8rCTMfY7zyfW70XT7114ABkcT2muKmzFddkisq/nvVBuYkam7RoXp8X57OcynF7C9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283532; c=relaxed/simple;
	bh=ug/J00ml0noX1QaBJY7xGdOLjc/+Nt6LtyzhtftDOg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Spkx0HqOn+ikeInCN8eAfnZHRPGum2/bK9B+/OnLIbK+uicNnmJLvytt8yEgmBd1/vswRfzyqpAR7Z0r6L7mkNWyxc92ONr3v6J/RT/pLWlMB3EUEO//Lgks2m4xFethHSoL0k/aECRbjMptxCx1PwMFe7elxaRKRrotR0e5zU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f0Vs0DS6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65D4D7E6;
	Tue,  9 Dec 2025 13:31:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765283512;
	bh=ug/J00ml0noX1QaBJY7xGdOLjc/+Nt6LtyzhtftDOg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f0Vs0DS6nae9owtOW6VdF8WiVnVEs02qu663ORQS8Xgcf1Myj/zs8vHshUjISmkMw
	 12TlLsuHy659AwoR23hrV3ay7W8QGWEMbhSXPE0IWsSgQEm3lFuUsHhf4aMRFfWXb2
	 4Ir4WNgu0J+SpINBGa6QnC0twBCexnTws0ZGm+OE=
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
Subject: [RFC PATCH 2/6] media: rkisp1-isp: Add in_bypass flag for YUV bypass
Date: Tue,  9 Dec 2025 12:31:32 +0000
Message-ID: <20251209123136.273938-3-isaac.scott@ideasonboard.com>
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

The rkisp1 features a 'bypass' mode for RAW and YUV formats. This
disables all ISP blocks, and makes the rkisp1 display input data from
the mipi csi receiver at the output, unmodified.

To determine whether we can activate bypass, we can detect whether both
the source and sink formats are YUV. If they are, we can set a new
in_bypass flag.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 1 +
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c    | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 5e6a4d5f6fd1..d90233e31ad3 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -532,6 +532,7 @@ struct rkisp1_device {
 	struct rkisp1_debug debug;
 	const struct rkisp1_info *info;
 	int irqs[RKISP1_NUM_IRQS];
+	bool in_bypass;
 	bool irqs_enabled;
 };
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2311672cedb1..7f0802ae3dcc 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -212,6 +212,8 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	const struct v4l2_mbus_framefmt *sink_frm;
 	const struct v4l2_rect *sink_crop;
 
+	rkisp1->in_bypass = false;
+
 	sink_frm = v4l2_subdev_state_get_format(sd_state,
 						RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_crop = v4l2_subdev_state_get_crop(sd_state,
@@ -240,7 +242,9 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 		}
 	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
 		acq_mult = 2;
-		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
+		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+			rkisp1->in_bypass = true;
+		} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
 			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
 		} else {
 			if (mbus_type == V4L2_MBUS_BT656)
-- 
2.43.0


