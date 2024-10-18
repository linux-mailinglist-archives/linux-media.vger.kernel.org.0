Return-Path: <linux-media+bounces-19826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2859A34B3
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE2DBB2350A
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B5018872F;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+4M4QAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2543E17C9F1;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=KzVajnWqqwqmR0jrMK9mXzqsYxoPmz2GCp/bC5bIABLYKT0LgteIs/iJke7lU2xj8ngGDTXLy/2d7fiiiQGalf38d4kdT2ns+Zk8mbVBvlmuO9y4EUxyeB75xSLFdEsDs4DY/HEroQWoArmJV3LOzoffS8cE3/Byo1qbDbd2vQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=EslwWem0URL7HGO0wGR9dgXiEgLFlOjHPztcB3xbGHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eP2eRr22ebD0jQfkFVcIZLeBC+GCL0g8SmU+6Lf8XSOG6yrnnvCSXJtsxFytgdGQrFxJN/mKOymKvFygEVpTGigUPz9J75gxRpNa2Y6EGjiI6M44OicgtNLyFabTVgoVPnW7TeNEzYjnjLHPDeLuYNdsNWqQ0VFbigSqZQ7w9Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+4M4QAJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E05C4CEC5;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=EslwWem0URL7HGO0wGR9dgXiEgLFlOjHPztcB3xbGHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+4M4QAJ9NeQhp+U1BtM50Ej1Wpn9EQIGRoEmMNJ0LQmzUuBi2xb0Yzfm7yl1pbNN
	 KpobAQpYDa/+z4rvECsuKGZwJNUnmZfxXUCsCcdnSI8m51E8t5kZh0au7EBAwROKZq
	 HD2zU3YoBV4pOMvjoNjqrfNz8W4tUZ7Up1tjVa04YRtp+f6yQdgoRqR0/zLxf5vjju
	 Y9AGHaqz3eCZ2lKZE1c7qqUWkOxFMiJ/1uRIxQ1O4E2hek79tmD3Z187AZUASG4sPj
	 QbW3lWJxCj/PxbBOD6dpqoHdwSxcVzwk3U0TnNfG7wWq1Vbdc3ivbmEsria2udDBXD
	 JkBzSCIAYN/Dg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005MeX-2Ehh;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 10/13] media: adv7604: prevent underflow condition when reporting colorspace
Date: Fri, 18 Oct 2024 07:53:12 +0200
Message-ID: <be3f7dbb52adf5b39edb4e509f4f3d973797af49.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Currently, adv76xx_log_status() reads some date using
io_read() which may return negative values. The current logic
doesn't check such errors, causing colorspace to be reported
on a wrong way at adv76xx_log_status(), as reported by Coverity.

If I/O error happens there, print a different message, instead
of reporting bogus messages to userspace.

Fixes: 54450f591c99 ("[media] adv7604: driver for the Analog Devices ADV7604 video decoder")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/i2c/adv7604.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 48230d5109f0..272945a878b3 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2519,10 +2519,10 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 	const struct adv76xx_chip_info *info = state->info;
 	struct v4l2_dv_timings timings;
 	struct stdi_readback stdi;
-	u8 reg_io_0x02 = io_read(sd, 0x02);
+	int ret;
+	u8 reg_io_0x02;
 	u8 edid_enabled;
 	u8 cable_det;
-
 	static const char * const csc_coeff_sel_rb[16] = {
 		"bypassed", "YPbPr601 -> RGB", "reserved", "YPbPr709 -> RGB",
 		"reserved", "RGB -> YPbPr601", "reserved", "RGB -> YPbPr709",
@@ -2621,13 +2621,21 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "-----Color space-----\n");
 	v4l2_info(sd, "RGB quantization range ctrl: %s\n",
 			rgb_quantization_range_txt[state->rgb_quantization_range]);
-	v4l2_info(sd, "Input color space: %s\n",
-			input_color_space_txt[reg_io_0x02 >> 4]);
-	v4l2_info(sd, "Output color space: %s %s, alt-gamma %s\n",
-			(reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
-			(((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
-				"(16-235)" : "(0-255)",
-			(reg_io_0x02 & 0x08) ? "enabled" : "disabled");
+
+	ret = io_read(sd, 0x02);
+	if (ret < 0) {
+		v4l2_info(sd, "Can't read Input/Output color space\n");
+	} else {
+		reg_io_0x02 = ret;
+
+		v4l2_info(sd, "Input color space: %s\n",
+				input_color_space_txt[reg_io_0x02 >> 4]);
+		v4l2_info(sd, "Output color space: %s %s, alt-gamma %s\n",
+				(reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
+				(((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
+					"(16-235)" : "(0-255)",
+				(reg_io_0x02 & 0x08) ? "enabled" : "disabled");
+	}
 	v4l2_info(sd, "Color space conversion: %s\n",
 			csc_coeff_sel_rb[cp_read(sd, info->cp_csc) >> 4]);
 
-- 
2.47.0


