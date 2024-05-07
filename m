Return-Path: <linux-media+bounces-11062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA268BE8B1
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 872ADB25AA0
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA45E16D4C3;
	Tue,  7 May 2024 16:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EpAHRehD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7468A16D4CF;
	Tue,  7 May 2024 16:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715098763; cv=none; b=dJ+OPmVSDf5Fk10ZER9CUxM8J8n8stz/IqO6RRAwGVdgVjIZtKxL55kNYT5squ+hK25E0pOG7OWFcZS3Laxrm9X8adk4i4NO1R7csQ/GCZxoxBjyZt747W7QbliuRnVqBnN9nigCX0gOoV2x/ApTsfCSNblaqP1/Op/8Y4tY1Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715098763; c=relaxed/simple;
	bh=Y0faM+U61JHbDE16uPhf6jDmA9FQGes5Rn/PQHPGf54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nr1DuQHl+QoIQqr7z9fnD7aAHrD1oN5png6/xNDLhOW6RfkPWJi3kdG/q2Gt/m/p2QtaW8ni6b6jnoYy5HPg/DTbXCC1U+0pw5ja1/kVmjf0zMXnX/oT0R9Y8Tq1tTzJiInqALtwbz7Ff0wU5qjTijEtcNTjlpk+JGoXmdjJEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EpAHRehD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5805C904;
	Tue,  7 May 2024 18:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715098756;
	bh=Y0faM+U61JHbDE16uPhf6jDmA9FQGes5Rn/PQHPGf54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EpAHRehD44aEViIrzxzlJQGCDoi9psZ+ClDC+e7e+gePQ70aKFSMlTGfkarRCGiLW
	 NUPU3hUABI0hMAFvdzaPj9s4ck0ycovtXnUgzCvmDY1NDzBr4IYrtV9lBG0SQ/eyCb
	 E7RyQlgMMfRGMCdwBLX0P+9tN4tLNRip71HZZkCA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 2/2] media: rkisp1: Mark subdev state pointers as const
Date: Tue,  7 May 2024 19:19:07 +0300
Message-ID: <20240507161907.27747-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240507161907.27747-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240507161907.27747-1-laurent.pinchart+renesas@ideasonboard.com>
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


