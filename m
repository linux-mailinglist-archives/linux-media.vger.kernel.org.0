Return-Path: <linux-media+bounces-19898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8362D9A4287
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42C092866F1
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBBF20263D;
	Fri, 18 Oct 2024 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrewoTl5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8438D2038DC;
	Fri, 18 Oct 2024 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265584; cv=none; b=K750IX/7sCDsiM5PA/8xoVEFu9AMZkZ7f01nAbCiTruO8xO0hvU+tz/h2raq8ey+1Zo8sR6ujHJPlHOPlGErJQPHtJaz7szUwAaXCeRqgcB7xIhmtM5cWBWwqyfDv6fl9rRpumYGSJ12I4tSXmOWgahliLaS2TwenTPupcHZBP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265584; c=relaxed/simple;
	bh=RrcYt5KgAmgJwH+Jk1tM6bXaEmcEPO+T1hSeEJBJH6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfF6VC8gaQVLTZ5Z3Bccmr/rh23aVXZDGiqbz5DKO7r79tR4pEAe7gVnw+tAxplJzYDJYW/KL/6rjzPO5cGDhaeuiHWd9b4RWBoKKb0lXab/o9t8W2VfXYg4DJdDLmb4tklsUxHXs0+duWVztnBTd++vH5Cp2MZzlxBUPxW74r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrewoTl5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-431195c3538so20467425e9.3;
        Fri, 18 Oct 2024 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265581; x=1729870381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXp4UA+UoHrYnhsF9YGKYUksYbgoE3nkj0exNQOStYI=;
        b=jrewoTl5nhGlTmbpLB5wWjcrcTz0OXX8coodOn8xqvIrvHTpz4O7AcoDRAdcNG5h6+
         scQWisg775tJ+/NSmLVLAC9FECPGD+E8/HAt0n9P5mWtnSlMsGhgJNiINAw8YTIkOahQ
         TEXjAmd/et1zAxa0xhc3NrbeJX5b/DMqUM+XsKciXP7h5uP9M+AMu3d0Mk/HQuQIOrfv
         IZ6kX+EZMoY4za4yZv5oZ3SvfVGl5VsifzG1r053e15suRq7PnRQsiT9rRMm/tXlYoC9
         bFU4m1c/cRJM8adkxNPmcaKEs98tkzINU/Mea4vxrEWFEuOqJhlU5osbQLOgDF0Y+LD5
         w5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265581; x=1729870381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXp4UA+UoHrYnhsF9YGKYUksYbgoE3nkj0exNQOStYI=;
        b=gVGc/HJ/5lcwWU2JImxNwywovznn94bMHXkG/HBpmmOb6qYW9x0aQane1URkaBBpwJ
         q/lZtEHTSvycgjkSgBqFFCPdM1874a6SzM94pRRdCMcmxqjP6hMXO7tD9KdIQ+B3CjVX
         hvXCRXWDwm7mQ93dxKVeiDVdXytKjQUMUB8XzWj+HOJX1t5T7lA2O+odzBfxLdwbxnqc
         8mUaGLYaQlxmSs/88oNY4xvAsCcIXgcpAGp04s7rtQd353OS5GsULqiGK9IfdZRI5lNI
         NyoNELXPH1RHsHmB37Msuq1ijh3VoVdpw8jpgGf5qnb80kyYBIjF3kR15djsRTgoTF8T
         1vyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2yqvxYKGqjB91inmCwnLDsVsGw6w6d7cxqmHyvqfhDF943GGO7XgDeTAqkzZLZ68bi16YrELC3J3qgBWiYklz3Og=@vger.kernel.org, AJvYcCWZX7It3zNZsBw37dclESK65CNcmJlCDkD/CcX8LKB3OcCeXsp7y1DFFimmh7Xy7Sh6sFDagIPExJo4se4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsdAgCR3eovw1jUWaljAM36Sf417GRf5D9lwvVvbOZnLsMrgpt
	7hq7qCFj5gFGHKg3Eld0ihzynKtZNMSgjLloIEDHTm4v8qTDj4+C
X-Google-Smtp-Source: AGHT+IFsPXQ31OPSKfvxNI1v5wbXXSnUh3ryJgp24vfckfeGfnmA+uhBoK1RVB6h2o4sFeE0HfecDA==
X-Received: by 2002:a05:600c:4687:b0:42c:de2f:da27 with SMTP id 5b1f17b1804b1-43161622809mr20777415e9.2.1729265580571;
        Fri, 18 Oct 2024 08:33:00 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:33:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 07/10] media: i2c: ov5645: Switch to {enable,disable}_streams
Date: Fri, 18 Oct 2024 16:32:27 +0100
Message-ID: <20241018153230.235647-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Switch from s_stream() to enable_streams() and disable_streams() pad
operations. They are preferred and required for streams support.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov5645.c | 90 +++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 357298dab9b4..a3b9402d39af 100644
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
2.43.0


