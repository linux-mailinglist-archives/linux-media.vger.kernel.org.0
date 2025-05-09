Return-Path: <linux-media+bounces-32078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02EAB0BCC
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 09:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 779351C20EF1
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 07:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE93270573;
	Fri,  9 May 2025 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtfNYfUm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6117A270557;
	Fri,  9 May 2025 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776044; cv=none; b=SR3YzIi0FE/FDZ4HFC1QWxspgoHE2N8PmuVknKOCXjQDHPafV8r5daOyERP5bTNFGCBoBWlBTP4860/1mNv7sFC8w5l/nmVgjGAG6+2/mzZxcWiTpku0D1fM2HZn1nOPkGBiUtFwcX1pu7VzEqdDtVgPEVIzDk0APYZJEFOyF2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776044; c=relaxed/simple;
	bh=om7NTmxes7IKAz7R1O7o0V5iGGNcv7oTxJIZLKrgaKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FbPhua1f95Rb8zWMwFphWeo5YPo9S5xJ4ck/V8oE57hw8QoUSqqslwI5PTKfjWMBP9Qdhz0u8x4+VT5SZ78XF8x3x9u5Gy+bDm9VrPye+QpvDtLk6PKeWQgg7K92XnF6FVJURYwzwlzc3wsZy8xZrojcU0RAA3e5psIJuA3BLdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtfNYfUm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6070C4CEE4;
	Fri,  9 May 2025 07:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746776043;
	bh=om7NTmxes7IKAz7R1O7o0V5iGGNcv7oTxJIZLKrgaKE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=RtfNYfUm3ObLoYJtNvwdpW4Uzon0XUbBdueG7cdRdO/tYwHq5yOz76HZErG+0mDPJ
	 BCQGvHkVK4fSkCnIGdKQeYYI//YnlsQjlp/CPfsYaoiuPFfMEaTOyovW+xa1jtTmCg
	 cPBQbit6VLCNCsnw0hsZ89MUE5TeYdx+CK4KIyLtA9MHNA5f3c2/5LV+g9cjkd4xd8
	 vm4uYVfHJGXj5qymHKCxeCpnAYw7CBVjqZor5M2UKaRwrAkzRhPAHLmFnKTsXndZkh
	 d66g8C7EBvNiz9g1pHCxf00cQZ4gxtmJ+ClJN9Irbr0jLuIxd0yppGWDjEdlli5+dg
	 nIbkqOOffyZoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1014C3ABC3;
	Fri,  9 May 2025 07:34:03 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Date: Fri, 09 May 2025 09:33:57 +0200
Subject: [PATCH] media: i2c: ov8858: Add sensor's pixel matrix size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-ov8858-crop-v1-1-403a0993c1de@mailoo.org>
X-B4-Tracking: v=1; b=H4sIAOSvHWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwNL3fwyCwtTC93kovwCXctkYwPzpGTLFNMkMyWgjoKi1LTMCrBp0bG
 1tQCmF1LpXQAAAA==
X-Change-ID: 20250509-ov8858-crop-9c307bc9d5b6
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746776042; l=2530;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=Tbtt8BBwWz2mwKkgqDb8gx79AJW3BuKIcJaTjg3kE+c=;
 b=eNvFV248nRzjXE5U9vVLQkc4ETvKQAQ+lcxDcHgc7pl+KP1aeE3eZt6Rl8TDdrK4i6VgyemT+
 mEJWP5lZKqlAIwvaMVlbH+WEUNKeXQMkxzSPqMDaq3Ue89eBfK9iLqg
X-Developer-Key: i=vincent.knecht@mailoo.org; a=ed25519;
 pk=MFCVQkhL3+d3NHDzNPWpyZ4isxJvT+QTqValj5gSkm4=
X-Endpoint-Received: by B4 Relay for vincent.knecht@mailoo.org/20250414
 with auth_id=377
X-Original-From: Vincent Knecht <vincent.knecht@mailoo.org>
Reply-To: vincent.knecht@mailoo.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

The OV8858 pixel array is composed as:
- vertically: 16 dummy columns, 3264 valid ones and 16 dummy columns for
  a total of 3296 columns
- horizontally: 24 optical black lines, 16 dummy ones, 2448 valid, 16
  dummies and 24 optical black lines for a total of 2528 lines

Set native and active sensor pixel sizes.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 drivers/media/i2c/ov8858.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 95f9ae7948463e95ce0b2cb58195de02ee72c02a..9a86aa46e20b48ef4bae7d70ce485985c1ba886a 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -77,6 +77,14 @@
 
 #define REG_NULL			0xffff
 
+/* OV8858 native and active pixel array size */
+#define OV8858_NATIVE_WIDTH		3296U
+#define OV8858_NATIVE_HEIGHT		2528U
+#define OV8858_PIXEL_ARRAY_LEFT		16U
+#define OV8858_PIXEL_ARRAY_TOP		40U
+#define OV8858_PIXEL_ARRAY_WIDTH	3264U
+#define OV8858_PIXEL_ARRAY_HEIGHT	2448U
+
 static const char * const ov8858_supply_names[] = {
 	"avdd",		/* Analog power */
 	"dovdd",	/* Digital I/O power */
@@ -1492,11 +1500,40 @@ static int ov8858_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov8858_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
+		return 0;
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV8858_NATIVE_WIDTH;
+		sel->r.height = OV8858_NATIVE_HEIGHT;
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = OV8858_PIXEL_ARRAY_TOP;
+		sel->r.left = OV8858_PIXEL_ARRAY_LEFT;
+		sel->r.width = OV8858_PIXEL_ARRAY_WIDTH;
+		sel->r.height = OV8858_PIXEL_ARRAY_HEIGHT;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static const struct v4l2_subdev_pad_ops ov8858_pad_ops = {
 	.enum_mbus_code = ov8858_enum_mbus_code,
 	.enum_frame_size = ov8858_enum_frame_sizes,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov8858_set_fmt,
+	.get_selection = ov8858_get_selection,
 };
 
 static const struct v4l2_subdev_ops ov8858_subdev_ops = {

---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250509-ov8858-crop-9c307bc9d5b6

Best regards,
-- 
Vincent Knecht <vincent.knecht@mailoo.org>



