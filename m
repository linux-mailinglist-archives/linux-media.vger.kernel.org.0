Return-Path: <linux-media+bounces-44469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E083BDAD30
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66D0754765D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF85F304BD5;
	Tue, 14 Oct 2025 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGVQ0AeC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195C3221555
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463677; cv=none; b=XsLnDxMKT/M/O3WaJ35bgtZs//LE7f9IqPOJLgK3RJNpzjxTHvIq2Ta2cztzJ0kZglGbMjnDyeGMtNO3XPdz3COhI/vt4oGBqVBIbFg+3wZcR5oq7n40CahWIj/JhLNMks5cJWPq8Km80ZjvOoqE0OXD/UkN+ZyV2Agdx8ftoM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463677; c=relaxed/simple;
	bh=aVjLQy6jHXG6PBfg80fYaovi9PV7Jy+Ug43ANwbp4Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyZZwe0UG+M3GNvEL9VMZWezQylg4Zq8W19WMq4ID97Ff3jSrST7esB6WRVIqbFWQsvjZnjiSPI+Mftjcea7Xk4io9aqGlIcj54nwoMhTemnA5IFyX+8iENMtBmK/Ol61+3KUeF2x84GfegJcpMr3fcFzj6VjFfGvVOPLjC2dME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGVQ0AeC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27EBC4CEF9;
	Tue, 14 Oct 2025 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463677;
	bh=aVjLQy6jHXG6PBfg80fYaovi9PV7Jy+Ug43ANwbp4Hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iGVQ0AeCtFl1JYJc+dy7l9yUsMuGkERl2ktlaDIy0T83aLp43RJW6FQ7WgseGm9S1
	 boOoNrruKWEocIoUyuPpptuIViDJJ+Qkf9Tjv+bX35uRl8qlg6i1bYDEr448koSckT
	 M9ftHkAjtmB4AQg26J46kGgGOaob7kxMljuVgXEAp+ofr3zt06xCr2vCgQ3QxSzP1C
	 OtdfQ8w+ztSgDTtd7HZBS6nU6LHUK2421jUgh3cJVgqn18c67GciORQgwnhZzVbF2n
	 JpS5bKhUctd9U2FaKSXDGlIVGl/jtgWRw8cTDsGAHT0JUbuM5bm2G2OEnu3Rzmz117
	 QXQIjfyhAkROQ==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 22/25] media: i2c: ov01a10: Optimize setting h/vflip values
Date: Tue, 14 Oct 2025 19:40:30 +0200
Message-ID: <20251014174033.20534-23-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since ov01a10_global_setting[] sets the initial format1 register value,
there is no need to do a read-write-modify when setting the flip controls.

Only write format1 when setting the flip-controls and remove the now
unnecessary format1 register init from ov01a10_global_setting[].

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 41 +++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 51c9c015765f..40756e4d6301 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -161,7 +161,6 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x3815, 0x01},
 	{0x3816, 0x01},
 	{0x3817, 0x01},
-	{0x3820, 0xa8},
 	{0x3822, 0x13},
 	{0x3832, 0x28},
 	{0x3833, 0x10},
@@ -241,6 +240,7 @@ struct ov01a10_sensor_cfg {
 	u32 bus_fmt;
 	int pattern_size;
 	int border_size;
+	u8 format1_base_val;
 	bool invert_hflip_shift;
 	bool invert_vflip_shift;
 };
@@ -259,6 +259,8 @@ struct ov01a10 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *vflip;
 
 	u32 link_freq_index;
 
@@ -311,22 +313,33 @@ static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
 			 NULL);
 }
 
+static void ov01a10_set_format1(struct ov01a10 *ov01a10, int *ret)
+{
+	u8 val = ov01a10->cfg->format1_base_val;
+
+	/* hflip register bit is inverted */
+	if (!ov01a10->hflip->val)
+		val |= FIELD_PREP(OV01A10_HFLIP_MASK, 0x1);
+
+	if (ov01a10->vflip->val)
+		val |= FIELD_PREP(OV01A10_VFLIP_MASK, 0x1);
+
+	cci_write(ov01a10->regmap, OV01A10_REG_FORMAT1, val, ret);
+}
+
 static int ov01a10_set_hflip(struct ov01a10 *ov01a10, bool hflip)
 {
 	struct v4l2_rect *crop = ov01a10_get_active_crop(ov01a10);
 	const struct ov01a10_sensor_cfg *cfg = ov01a10->cfg;
-	u32 val, offset;
+	u32 offset;
 	int ret = 0;
 
 	offset = crop->left;
 	if ((hflip ^ cfg->invert_hflip_shift) && cfg->border_size)
 		offset++;
 
-	val = hflip ? 0 : FIELD_PREP(OV01A10_HFLIP_MASK, 0x1);
-
 	cci_write(ov01a10->regmap, OV01A10_REG_X_WIN, offset, &ret);
-	cci_update_bits(ov01a10->regmap, OV01A10_REG_FORMAT1,
-			OV01A10_HFLIP_MASK, val, &ret);
+	ov01a10_set_format1(ov01a10, &ret);
 
 	return ret;
 }
@@ -335,18 +348,15 @@ static int ov01a10_set_vflip(struct ov01a10 *ov01a10, bool vflip)
 {
 	struct v4l2_rect *crop = ov01a10_get_active_crop(ov01a10);
 	const struct ov01a10_sensor_cfg *cfg = ov01a10->cfg;
-	u32 val, offset;
+	u32 offset;
 	int ret = 0;
 
 	offset = crop->top;
 	if ((vflip ^ cfg->invert_vflip_shift) && cfg->border_size)
 		offset++;
 
-	val = vflip ? FIELD_PREP(OV01A10_VFLIP_MASK, 0x1) : 0;
-
 	cci_write(ov01a10->regmap, OV01A10_REG_Y_WIN, offset, &ret);
-	cci_update_bits(ov01a10->regmap, OV01A10_REG_FORMAT1,
-			OV01A10_VFLIP_MASK, val, &ret);
+	ov01a10_set_format1(ov01a10, &ret);
 
 	return ret;
 }
@@ -475,10 +485,10 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 				     ARRAY_SIZE(ov01a10_test_pattern_menu) - 1,
 				     0, 0, ov01a10_test_pattern_menu);
 
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops, V4L2_CID_HFLIP,
-			  0, 1, 1, 0);
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops, V4L2_CID_VFLIP,
-			  0, 1, 1, 0);
+	ov01a10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+	ov01a10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
 
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov01a10_ctrl_ops,
 					      &props);
@@ -1088,6 +1098,7 @@ static const struct ov01a10_sensor_cfg ov01a10_cfg = {
 	.bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
 	.pattern_size = 2, /* 2x2 */
 	.border_size = 2,
+	.format1_base_val = 0xa0,
 	.invert_hflip_shift = true,
 	.invert_vflip_shift = false,
 };
-- 
2.51.0


