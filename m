Return-Path: <linux-media+bounces-5387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C685994E
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 21:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 740D81F21323
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 20:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361F573177;
	Sun, 18 Feb 2024 20:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rdfeeLiT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0946671B49
	for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708289037; cv=none; b=uSw8DJh6tU8WYvya6dAMzqHWsbyZTwRK3q7t+qyzy2dTuGtwjYK4fCU25qDGup/s3ce3gd3A2RqgTBF2n1UzBRP5MImCFth7vQfA30geUenbyibDWRmLrMDMu5etZnDw8fgZDQj7+kf1LKLdSK6QYAq2w+Rbh+9NhYUTbkVPLs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708289037; c=relaxed/simple;
	bh=iceEoYtrQObPuI9oA6/dvwdyrJ9pE03R0toZoHOjBRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppFHLaQtBIyFu71QdcxMvfM/ZWzyMA9J47I89ewFwDSUDiabqPEv7Ze934tit5LsZ0ebTRCrZQPLJ2lAWDwEg2H79/SOqXsPGfl+NWALlr10BWOj2/XyNmXioB3VBSzshh/aGT2nb4i9yco1f3IH4bhFYz2gNP8YupsBP8+P+IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rdfeeLiT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23CD1480;
	Sun, 18 Feb 2024 21:43:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708289026;
	bh=iceEoYtrQObPuI9oA6/dvwdyrJ9pE03R0toZoHOjBRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rdfeeLiTSSQNL0in9y1NHuzgEdiDoWXrtaJJl2itre3573OQyBbcW8evIvz/zWE7a
	 z2KJ0uEkzLopblLewkIO/TutDNtw6d/PcclV41kk004mWdf+4v9vhH3S1LlTZ5Uk19
	 UKYmJoCGZsey2hoUG8HOEc4mC1YY9yJnqfXM8+a0=
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
Subject: [PATCH v13 04/12] media: rkisp1: Support devices lacking dual crop
Date: Sun, 18 Feb 2024 22:43:42 +0200
Message-ID: <20240218204350.10916-5-laurent.pinchart@ideasonboard.com>
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

Some versions of the ISP supported by the rkisp1 driver, such as the ISP
in the i.MX8MP, lack the dual crop registers and don't support cropping
at the resizer input. They instead rely on cropping in the Image
Stabilization module, at the output of the ISP, to modify the resizer
input size and implement digital zoom.

Add a dual crop feature flag to distinguish the versions of the ISP that
support dual crop from those that don't, and make sure that the sink
crop is set to the sink format when dual crop is not supported.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v12:

- Update comment in rkisp1_rsz_set_sink_crop()

Changes since v6:

- Remove mention of moving resizer input crop to image stabilizer from
  commit message
- Make sure the sink crop is set to the sink format when dual crop is
  not supported
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h  |  2 ++
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c |  6 ++++--
 .../media/platform/rockchip/rkisp1/rkisp1-resizer.c | 13 ++++++++-----
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 998fe45f5df3..857fea1d079b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -112,6 +112,7 @@ enum rkisp1_isp_pad {
  * @RKISP1_FEATURE_MIPI_CSI2: The ISP has an internal MIPI CSI-2 receiver
  * @RKISP1_FEATURE_MAIN_STRIDE: The ISP supports configurable stride on the main path
  * @RKISP1_FEATURE_SELF_PATH: The ISP has a self path
+ * @RKISP1_FEATURE_DUAL_CROP: The ISP has the dual crop block at the resizer input
  *
  * The ISP features are stored in a bitmask in &rkisp1_info.features and allow
  * the driver to implement support for features present in some ISP versions
@@ -121,6 +122,7 @@ enum rkisp1_feature {
 	RKISP1_FEATURE_MIPI_CSI2 = BIT(0),
 	RKISP1_FEATURE_MAIN_STRIDE = BIT(1),
 	RKISP1_FEATURE_SELF_PATH = BIT(2),
+	RKISP1_FEATURE_DUAL_CROP = BIT(3),
 };
 
 #define rkisp1_has_feature(rkisp1, feature) \
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 67a5c84ce117..5a3ad2c3347e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -485,7 +485,8 @@ static const struct rkisp1_info px30_isp_info = {
 	.isr_size = ARRAY_SIZE(px30_isp_isrs),
 	.isp_ver = RKISP1_V12,
 	.features = RKISP1_FEATURE_MIPI_CSI2
-		  | RKISP1_FEATURE_SELF_PATH,
+		  | RKISP1_FEATURE_SELF_PATH
+		  | RKISP1_FEATURE_DUAL_CROP,
 };
 
 static const char * const rk3399_isp_clks[] = {
@@ -505,7 +506,8 @@ static const struct rkisp1_info rk3399_isp_info = {
 	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
 	.isp_ver = RKISP1_V10,
 	.features = RKISP1_FEATURE_MIPI_CSI2
-		  | RKISP1_FEATURE_SELF_PATH,
+		  | RKISP1_FEATURE_SELF_PATH
+		  | RKISP1_FEATURE_DUAL_CROP,
 };
 
 static const struct of_device_id rkisp1_of_match[] = {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index dd77a31e6014..6f3931ca5b51 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -444,11 +444,12 @@ static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
 	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SINK);
 	sink_crop = v4l2_subdev_state_get_crop(sd_state, RKISP1_RSZ_PAD_SINK);
 
-	/* Not crop for MP bayer raw data */
+	/* Not crop for MP bayer raw data, or for devices lacking dual crop. */
 	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 
-	if (rsz->id == RKISP1_MAINPATH &&
-	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
+	if ((rsz->id == RKISP1_MAINPATH &&
+	     mbus_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) ||
+	    !rkisp1_has_feature(rsz->rkisp1, DUAL_CROP)) {
 		sink_crop->left = 0;
 		sink_crop->top = 0;
 		sink_crop->width = sink_fmt->width;
@@ -635,7 +636,8 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
 	struct v4l2_subdev_state *sd_state;
 
 	if (!enable) {
-		rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
+		if (rkisp1_has_feature(rkisp1, DUAL_CROP))
+			rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
 		rkisp1_rsz_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
 		return 0;
 	}
@@ -646,7 +648,8 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
 	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	rkisp1_rsz_config(rsz, sd_state, when);
-	rkisp1_dcrop_config(rsz, sd_state);
+	if (rkisp1_has_feature(rkisp1, DUAL_CROP))
+		rkisp1_dcrop_config(rsz, sd_state);
 
 	v4l2_subdev_unlock_state(sd_state);
 
-- 
Regards,

Laurent Pinchart


