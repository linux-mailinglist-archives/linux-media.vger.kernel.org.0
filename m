Return-Path: <linux-media+bounces-11176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 241DB8C0670
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 23:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D48A928216E
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 21:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E24132C23;
	Wed,  8 May 2024 21:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q6+4nBQH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E208684D2D;
	Wed,  8 May 2024 21:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715204462; cv=none; b=KwATWrvSb55QhCb6yi7lTtnKENkYc7qbw9yBI1PNg1fC+OBdU/+bd2+jOzaPSycZqBUUvSFqTC2cDwe4r9OTab+PQAsJjk4gxgvzeGhlC+DJfAp7rx8Q0ia4h5eIKL7IrDcrkIemaKlcJ54CtFVvosG1rJsEb+s4jM9F6omWKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715204462; c=relaxed/simple;
	bh=Y0faM+U61JHbDE16uPhf6jDmA9FQGes5Rn/PQHPGf54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5fg/ZI84XpqpRu4SDlLD74wvGER4HiB/4s4QFXtvzEs0qAkKvGBpJ8czY95V4jU8wS2+66J2BJkwHgJ7HIyj5/hDZ8dhYmlhut7LJaa8L09MU4vJb0yZ6hIL1qfvz8321kU63/9AyV3L7KgILvJRCmEkA1Yq8AMI45MbmrBypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q6+4nBQH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8177A2D31;
	Wed,  8 May 2024 23:40:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715204455;
	bh=Y0faM+U61JHbDE16uPhf6jDmA9FQGes5Rn/PQHPGf54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q6+4nBQHw5IJkuGW9HVA5RhNA5MqafUydy4qqnRD5XBVVTs5FSb+gcgB8fOASsq7P
	 IKMQjrO4D0O/KSF8fouH3AuQM+8uhuWtQOJ2PLL+lWZwFrtNUuCQVJFE9NLEyWCjjv
	 I2NWlY+138BBThc8KLqVCvzawWYLUD9cvVtMiY9w=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 3/3] media: rkisp1: Mark subdev state pointers as const
Date: Thu,  9 May 2024 00:40:45 +0300
Message-ID: <20240508214045.24716-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several subdev state pointers are used to access the state read-only.
Mark them as const.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c     | 8 ++++----
 drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index e45a213baf49..91301d17d356 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -173,7 +173,7 @@ static void rkisp1_gasket_disable(struct rkisp1_device *rkisp1)
  * or at the frame end interrupt
  */
 static void rkisp1_config_ism(struct rkisp1_isp *isp,
-			      struct v4l2_subdev_state *sd_state)
+			      const struct v4l2_subdev_state *sd_state)
 {
 	const struct v4l2_rect *src_crop =
 		v4l2_subdev_state_get_crop(sd_state,
@@ -201,7 +201,7 @@ static void rkisp1_config_ism(struct rkisp1_isp *isp,
  * configure ISP blocks with input format, size......
  */
 static int rkisp1_config_isp(struct rkisp1_isp *isp,
-			     struct v4l2_subdev_state *sd_state,
+			     const struct v4l2_subdev_state *sd_state,
 			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
 {
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
@@ -309,7 +309,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		rkisp1_params_disable(&rkisp1->params);
 	} else {
-		struct v4l2_mbus_framefmt *src_frm;
+		const struct v4l2_mbus_framefmt *src_frm;
 
 		src_frm = v4l2_subdev_state_get_format(sd_state,
 						       RKISP1_ISP_PAD_SOURCE_VIDEO);
@@ -429,7 +429,7 @@ static void rkisp1_config_clk(struct rkisp1_isp *isp)
 }
 
 static int rkisp1_isp_start(struct rkisp1_isp *isp,
-			    struct v4l2_subdev_state *sd_state,
+			    const struct v4l2_subdev_state *sd_state,
 			    struct media_pad *source)
 {
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 6f3931ca5b51..1fa991227fa9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -135,11 +135,11 @@ static void rkisp1_dcrop_disable(struct rkisp1_resizer *rsz,
 
 /* configure dual-crop unit */
 static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz,
-				struct v4l2_subdev_state *sd_state)
+				const struct v4l2_subdev_state *sd_state)
 {
 	struct rkisp1_device *rkisp1 = rsz->rkisp1;
-	struct v4l2_mbus_framefmt *sink_fmt;
-	struct v4l2_rect *sink_crop;
+	const struct v4l2_mbus_framefmt *sink_fmt;
+	const struct v4l2_rect *sink_crop;
 	u32 dc_ctrl;
 
 	sink_crop = v4l2_subdev_state_get_crop(sd_state, RKISP1_RSZ_PAD_SINK);
@@ -264,7 +264,7 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
 }
 
 static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
-			      struct v4l2_subdev_state *sd_state,
+			      const struct v4l2_subdev_state *sd_state,
 			      enum rkisp1_shadow_regs_when when)
 {
 	const struct rkisp1_rsz_yuv_mbus_info *sink_yuv_info, *src_yuv_info;
-- 
Regards,

Laurent Pinchart


