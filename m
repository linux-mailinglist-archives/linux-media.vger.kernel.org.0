Return-Path: <linux-media+bounces-3270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C70826063
	for <lists+linux-media@lfdr.de>; Sat,  6 Jan 2024 17:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688CC283B44
	for <lists+linux-media@lfdr.de>; Sat,  6 Jan 2024 16:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD94E101EF;
	Sat,  6 Jan 2024 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pqW9ONcO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789CBF9F9;
	Sat,  6 Jan 2024 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.hamster-moth.ts.net (unknown [IPv6:2001:268:c203:a8ee:6c57:4243:1eb3:6cb])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E3E1FF3;
	Sat,  6 Jan 2024 17:01:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704556922;
	bh=kRiempBB5ue59aUfTI8+HAXdGLIAfyEF0AWetnd33OM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pqW9ONcO3NtxOTylXLAexjV0gmwQqY32hQfE94WlE6eieU/t9jm99/s2soHHeKcTJ
	 GebMZ1nkZfGN4jipjgHEK8/E09gZuQsuc9K9LibH+BY5KqNcQ85O4lbFKecXnutDHE
	 jKhCe5YxuJvgCR3tLATJ3UoJOYKE6mgMto1Q+2aY=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	aford173@gmail.com,
	Paul Elder <paul.elder@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 03/10] media: rkisp1: Support devices lacking self path
Date: Sun,  7 Jan 2024 01:02:14 +0900
Message-Id: <20240106160221.4183409-4-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106160221.4183409-1-paul.elder@ideasonboard.com>
References: <20240106160221.4183409-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some versions of the ISP supported by the rkisp1 driver, such as the ISP
in the i.MX8MP, lack the self path. Support those ISP versions by adding
a self path feature flag, and massage the rest of the driver to support
the lack of a self path.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Adam Ford <aford173@gmail.com>
---
Changes since v3:

- Document the feature bit
- Reorder commit

Changes since v2:

- Simplify rkisp1_path_count()
- Use the rkisp1_has_feature() macro
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c     |  9 ++++++---
 .../platform/rockchip/rkisp1/rkisp1-common.h      | 15 +++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c   |  9 ++++++---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c     |  6 ++++--
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 83a968487f24..ca95f62822fa 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -730,6 +730,7 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
 {
 	struct device *dev = ctx;
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+	unsigned int dev_count = rkisp1_path_count(rkisp1);
 	unsigned int i;
 	u32 status;
 
@@ -742,7 +743,7 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
 
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_ICR, status);
 
-	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); ++i) {
+	for (i = 0; i < dev_count; ++i) {
 		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
 
 		if (!(status & RKISP1_CIF_MI_FRAME(cap)))
@@ -899,6 +900,7 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
 {
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
+	bool has_self_path = rkisp1_has_feature(rkisp1, SELF_PATH);
 
 	cap->ops->set_data_path(cap);
 	cap->ops->config(cap);
@@ -916,7 +918,7 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
 	 * This's also required because the second FE maybe corrupt
 	 * especially when run at 120fps.
 	 */
-	if (!other->is_streaming) {
+	if (!has_self_path || !other->is_streaming) {
 		/* force cfg update */
 		rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT,
 			     RKISP1_CIF_MI_INIT_SOFT_UPD);
@@ -1509,10 +1511,11 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
 
 int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
 {
+	unsigned int dev_count = rkisp1_path_count(rkisp1);
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); i++) {
+	for (i = 0; i < dev_count; i++) {
 		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
 
 		rkisp1_capture_init(rkisp1, i);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 6a811b7ef1b9..f7c251f79aa9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -111,6 +111,7 @@ enum rkisp1_isp_pad {
  *
  * @RKISP1_FEATURE_MIPI_CSI2: The ISP has an internal MIPI CSI-2 receiver
  * @RKISP1_FEATURE_MAIN_STRIDE: The ISP supports configurable stride on the main path
+ * @RKISP1_FEATURE_SELF_PATH: The ISP has a self path
  *
  * The ISP features are stored in a bitmask in &rkisp1_info.features and allow
  * the driver to implement support for features present in some ISP versions
@@ -119,6 +120,7 @@ enum rkisp1_isp_pad {
 enum rkisp1_feature {
 	RKISP1_FEATURE_MIPI_CSI2 = BIT(0),
 	RKISP1_FEATURE_MAIN_STRIDE = BIT(1),
+	RKISP1_FEATURE_SELF_PATH = BIT(2),
 };
 
 #define rkisp1_has_feature(rkisp1, feature) \
@@ -531,6 +533,19 @@ int rkisp1_cap_enum_mbus_codes(struct rkisp1_capture *cap,
  */
 const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_index(unsigned int index);
 
+/*
+ * rkisp1_path_count - Return the number of paths supported by the device
+ *
+ * Some devices only have a main path, while other device have both a main path
+ * and a self path. This function returns the number of paths that this device
+ * has, based on the feature flags. It should be used insted of checking
+ * ARRAY_SIZE of capture_devs/resizer_devs.
+ */
+static inline unsigned int rkisp1_path_count(struct rkisp1_device *rkisp1)
+{
+	return rkisp1_has_feature(rkisp1, SELF_PATH) ? 2 : 1;
+}
+
 /*
  * rkisp1_sd_adjust_crop_rect - adjust a rectangle to fit into another rectangle.
  *
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 44b753026ba2..106040c4181c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -358,6 +358,7 @@ static const struct dev_pm_ops rkisp1_pm_ops = {
 
 static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 {
+	unsigned int dev_count = rkisp1_path_count(rkisp1);
 	unsigned int i;
 	int ret;
 
@@ -373,7 +374,7 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 	}
 
 	/* create ISP->RSZ->CAP links */
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < dev_count; i++) {
 		struct media_entity *resizer =
 			&rkisp1->resizer_devs[i].sd.entity;
 		struct media_entity *capture =
@@ -505,7 +506,8 @@ static const struct rkisp1_info px30_isp_info = {
 	.isrs = px30_isp_isrs,
 	.isr_size = ARRAY_SIZE(px30_isp_isrs),
 	.isp_ver = RKISP1_V12,
-	.features = RKISP1_FEATURE_MIPI_CSI2,
+	.features = RKISP1_FEATURE_MIPI_CSI2
+		  | RKISP1_FEATURE_SELF_PATH,
 };
 
 static const char * const rk3399_isp_clks[] = {
@@ -524,7 +526,8 @@ static const struct rkisp1_info rk3399_isp_info = {
 	.isrs = rk3399_isp_isrs,
 	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
 	.isp_ver = RKISP1_V10,
-	.features = RKISP1_FEATURE_MIPI_CSI2,
+	.features = RKISP1_FEATURE_MIPI_CSI2
+		  | RKISP1_FEATURE_SELF_PATH,
 };
 
 static const struct of_device_id rkisp1_of_match[] = {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index a8e377701302..dd77a31e6014 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -631,6 +631,7 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
 	struct rkisp1_device *rkisp1 = rsz->rkisp1;
 	struct rkisp1_capture *other = &rkisp1->capture_devs[rsz->id ^ 1];
 	enum rkisp1_shadow_regs_when when = RKISP1_SHADOW_REGS_SYNC;
+	bool has_self_path = rkisp1_has_feature(rkisp1, SELF_PATH);
 	struct v4l2_subdev_state *sd_state;
 
 	if (!enable) {
@@ -639,7 +640,7 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
 		return 0;
 	}
 
-	if (other->is_streaming)
+	if (has_self_path && other->is_streaming)
 		when = RKISP1_SHADOW_REGS_ASYNC;
 
 	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -731,10 +732,11 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 
 int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1)
 {
+	unsigned int dev_count = rkisp1_path_count(rkisp1);
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(rkisp1->resizer_devs); i++) {
+	for (i = 0; i < dev_count; i++) {
 		struct rkisp1_resizer *rsz = &rkisp1->resizer_devs[i];
 
 		rsz->rkisp1 = rkisp1;
-- 
2.39.2


