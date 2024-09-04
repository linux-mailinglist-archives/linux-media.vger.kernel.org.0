Return-Path: <linux-media+bounces-17628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF9196C93F
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80BEB1F291AE
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603F5189514;
	Wed,  4 Sep 2024 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfCssyf2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C95818891F;
	Wed,  4 Sep 2024 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484075; cv=none; b=K2vN2gZllW80ALzKEd+eYssFReMrRWfpie77g0z6KOyz7STO9lqkos0wrmhmEgzU4IrFy5KjsLoti4yek6yvzK62NiesX5+PgZEktgXFRljhC2rliKV6kYP5O+mLNZWHKhUWy469XnrLnaFhcg08kRXbxmWsbZrdhWA6ddpwayw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484075; c=relaxed/simple;
	bh=TlPMS9+iyWeF7BUutFeeBinJP2I92tXInMXqr1sU1PQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qCAFFYQVM03ZRczdM0xQefVRD69+cbFQyTwzzz+wAGxB8R7M/Ai04dy1MD83ctzvcGdiHULK+Fn+ZsQLLJco4pHyiOu7nofyIQvYn6vx1mNEsKwC2CIKAwJEOd+FPdFgtxKrhFmU8JGzYXf/yYLn6Z/eRUudcLURw6MGOHLOyNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfCssyf2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428e0d18666so59125475e9.3;
        Wed, 04 Sep 2024 14:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484072; x=1726088872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOCHN3EnOjt3dKmVD+Yk25XhtTBnkoSrJQy1+RtOVLc=;
        b=XfCssyf2TO8cwyaktdfTt74OU8NbRtFxhh8grV+ykvT/d5EC7zLtmnu6xLXPf87b1j
         DUWfS3oPR9Sgj/7pIMuFKFeK8vpRFcBnwSLqZa45m5WEqPNqg95y8f05KpIvzMtApaSD
         wPKkcYWTrlPAaGgBo2FXtyP/2jqWICO8z+ggQQRsyERDKa2IzpwGxVnWkJIDmfk4l82c
         J2MqLGNRzTqYK7pMxNEYmyTOEORIwjQsXzzvRxPD079C/DZcdHQECd4hmWPDLF6NT/3U
         8j9CjO4X/xor6TuOzJmm+CrXxJdDvJUDKGpNb1f6Ik1Yp6fgNDv5LhPMMzzZA1R5zPua
         M9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484072; x=1726088872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOCHN3EnOjt3dKmVD+Yk25XhtTBnkoSrJQy1+RtOVLc=;
        b=oddOCuCAKnmAPON64YEiQd3x9MBwmoJ7Nsyk/XApz4ex3sbF94ZXLWmakglGfDdf9/
         WM4DfMtjbMCEMi6cgyoOQ6VNXK+xsQBXqVcuM5CfXuNMIzjjzC7Dtvchj6IuYvhqWesG
         igAIBvIaoZ3CVTvtRtZ7wnn1J8TN1dkHP2vw3p/ES4hlWqi3Kj5p2wmB/h4PtZPrrLf1
         u3+pLnp33wUe4T84PlpEmsD1/ZCGZWs0H873hgEwcrpLAmyOjrQa0Ji2P7gYJjXgy8Ml
         UkW8CXjWtX1mjTitxxGLrzy+UqSbdUouc6A3e0zkQ+CMloj+V2Iu6HihUWUx8DG2fifO
         jUcA==
X-Forwarded-Encrypted: i=1; AJvYcCWeGdYLDdrIgpaVl0rHQOXF9tqBuVuBBfQs9kEdC0Qj5iJ6buoI/T77ZkhEeCKe4R6pYOhBVPsImZbqZE8=@vger.kernel.org, AJvYcCXqEGhD5e0hCqvmYyvjgFAt9wSrV8Far1vhJ/qUW7OPvkl0O8gJsypowgNbnIdZvWJ0lhbywVs7BhXgo2u6kPE5WdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQaDJOnj4/jZpKHKxjimnSS9vgXyhb/8Yxu/tTp7Pr2z0i19y7
	u50BDfrMbIzAibC8OV8ddGVCCZXuQ5XBFNqYeq90Ah2He9zeQ/6HXPIv+RxZ
X-Google-Smtp-Source: AGHT+IHZpCwBbgsqrX1K5IUcdMqJRqZMpH3d48/SJE6eA2d4GRAAcTDTJ4yIh/wf4xey6BdUT8qqmw==
X-Received: by 2002:a5d:59a2:0:b0:374:c42f:bac1 with SMTP id ffacd0b85a97d-374c42fbc87mr10363182f8f.8.1725484072428;
        Wed, 04 Sep 2024 14:07:52 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 08/12] media: i2c: ov5645: Switch to {enable,disable}_streams
Date: Wed,  4 Sep 2024 22:07:15 +0100
Message-Id: <20240904210719.52466-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 90 +++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 9497ec737cb7..dc93514608ee 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -923,71 +923,71 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
+static int ov5645_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
-	struct ov5645 *ov5645 = to_ov5645(subdev);
-	struct v4l2_subdev_state *state;
+	struct ov5645 *ov5645 = to_ov5645(sd);
 	int ret;
 
-	state = v4l2_subdev_lock_and_get_active_state(&ov5645->sd);
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(ov5645->dev);
-		if (ret < 0) {
-			v4l2_subdev_unlock_state(state);
-			return ret;
-		}
+	ret = pm_runtime_resume_and_get(ov5645->dev);
+	if (ret < 0)
+		return ret;
 
-		ret = ov5645_set_register_array(ov5645,
+	ret = ov5645_set_register_array(ov5645,
 					ov5645->current_mode->data,
 					ov5645->current_mode->data_size);
-		if (ret < 0) {
-			dev_err(ov5645->dev, "could not set mode %dx%d\n",
-				ov5645->current_mode->width,
-				ov5645->current_mode->height);
-			goto err_rpm_put;
-		}
-		ret = __v4l2_ctrl_handler_setup(&ov5645->ctrls);
-		if (ret < 0) {
-			dev_err(ov5645->dev, "could not sync v4l2 controls\n");
-			goto err_rpm_put;
-		}
-
-		ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x45);
-		if (ret < 0)
-			goto err_rpm_put;
-
-		ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
-				       OV5645_SYSTEM_CTRL0_START);
-		if (ret < 0)
-			goto err_rpm_put;
-	} else {
-		ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x40);
-		if (ret < 0)
-			goto stream_off_rpm_put;
+	if (ret < 0) {
+		dev_err(ov5645->dev, "could not set mode %dx%d\n",
+			ov5645->current_mode->width,
+			ov5645->current_mode->height);
+		goto err_rpm_put;
+	}
+	ret = __v4l2_ctrl_handler_setup(&ov5645->ctrls);
+	if (ret < 0) {
+		dev_err(ov5645->dev, "could not sync v4l2 controls\n");
+		goto err_rpm_put;
+	}
 
-		ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
-				       OV5645_SYSTEM_CTRL0_STOP);
+	ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x45);
+	if (ret < 0)
+		goto err_rpm_put;
 
-		goto stream_off_rpm_put;
-	}
+	ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
+			       OV5645_SYSTEM_CTRL0_START);
+	if (ret < 0)
+		goto err_rpm_put;
 
-	v4l2_subdev_unlock_state(state);
 	return 0;
 
 err_rpm_put:
 	pm_runtime_put_sync(ov5645->dev);
 	return ret;
+}
+
+static int ov5645_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct ov5645 *ov5645 = to_ov5645(sd);
+	int ret;
+
+	ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x40);
+	if (ret < 0)
+		goto rpm_put;
+
+	ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
+			       OV5645_SYSTEM_CTRL0_STOP);
 
-stream_off_rpm_put:
+rpm_put:
 	pm_runtime_mark_last_busy(ov5645->dev);
 	pm_runtime_put_autosuspend(ov5645->dev);
-	v4l2_subdev_unlock_state(state);
+
 	return ret;
 }
 
 static const struct v4l2_subdev_video_ops ov5645_video_ops = {
-	.s_stream = ov5645_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
@@ -996,6 +996,8 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov5645_set_format,
 	.get_selection = ov5645_get_selection,
+	.enable_streams = ov5645_enable_streams,
+	.disable_streams = ov5645_disable_streams,
 };
 
 static const struct v4l2_subdev_core_ops ov5645_core_ops = {
-- 
2.34.1


