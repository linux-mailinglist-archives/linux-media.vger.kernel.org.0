Return-Path: <linux-media+bounces-18099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 543BD973E2D
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7931C1C2478E
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9DA1A4AA4;
	Tue, 10 Sep 2024 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNrRkBzT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D4B1A7048;
	Tue, 10 Sep 2024 17:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987990; cv=none; b=f4Vkt8HYq3iHyLG0kCQxhuSsFTI4LsErGdbBavKffjZXQ7VUCNzpBivw+qlRjObR1XrHMAaTy8sxxOUHcA2DIfc1vQZet8nt0nP1QkiYXQ85pVzz3W14G0llNyyLTP4fRDMPor/iuXyTnLnuUBzUaOPN00RPA+WXqQNQksdM9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987990; c=relaxed/simple;
	bh=TlPMS9+iyWeF7BUutFeeBinJP2I92tXInMXqr1sU1PQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQikRwfxzjW2YbuttQ58dFh+3QZ0U7SlIvtPC4f0aooqYMVx1dZigMEqQRMrelJMTgy3tJ6+FZXsU632B03MK7sG0RU2oRIJemjzFV/zCl9J1LorIoSBo1Veq5IigAKp3tQe4jgy5cjqhrbIdYE05NnKv5OHA5p/9yZGqnwzERc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNrRkBzT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374ca7a10d4so3525431f8f.3;
        Tue, 10 Sep 2024 10:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987987; x=1726592787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOCHN3EnOjt3dKmVD+Yk25XhtTBnkoSrJQy1+RtOVLc=;
        b=UNrRkBzTMGcU3bD07HJDJ3Wez5xZfy8oYHumMB+8BnDK5Tswjw6kE2gCBrZJFIkXJF
         4m1QSLO82q2gLwI/TexF3Yh8fb7nORbGndY5bWM/BLShHCs8MgERaO/zyt3tBPKEq6jO
         ath1jBKWiIwtt7kGCeVdecFnrjJtszVUmcVSKQHDc/42kTbY5YMzPZXXW6YcrYrU5SqQ
         irKFARXAUmLPpadO5HU+SsrcJxtxZ38FcCtj04oyOeQi1NTAGz9ht7mXP65UIiEANdox
         MiQowe+e5kew73aZjAk8TfArnWOT9+7at14xBHHyUhiIlCJqFnxVM3tRl+1BViGGLxFF
         9upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987987; x=1726592787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOCHN3EnOjt3dKmVD+Yk25XhtTBnkoSrJQy1+RtOVLc=;
        b=emTvKiZc/2LGjhGoSMFotmIh6rUVjs6MxdzV935/8pp4TqorDwkbQ44qC5LDrdBnE9
         orfcB31Bt6lPXbOa4CG6q/qxqr1EAZ0axSAWxe/16+BsYODHIMoxMeZbw/5xqmAsqJkz
         CTiey+a6iKbXhGfLBfTryGsIOI+++JtwNmGTFqxXi2BVt/j9EvWo9Zwf7P15WUjUe4YU
         YvN4OjPakZg7LZXk3YajIqTo33e1axQUvUmfVwDCzmYC2g3yiLr2uGO/hPrXbdB8aR7j
         iQzI1/EgJJNxPX1oRuUp5pLO4VNDIVQDwiWyUCU8sCQiJCAhTPNKItrqdB+/o//DrGZv
         OtrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU++hDXXliu9OqFf6p+wgWvJgfy1KAXAviykD4DZp3ih0NF2BRQk/0PnQi+nNqfIyLP/nb+CvBYe6aTh44=@vger.kernel.org, AJvYcCU2W9LzgnWUFwBzhVuu13m3VRA2lAyA4PmHKlmOcaRhzfJ4nYF0mwEpA4GhAW/K9rU4UAK0tG7n9TyVuQzriT5Yf1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFHteUWWJCLTz0EjWPl1C66TkwqvNfmWDWdIhs7ckEXS6MM9t
	mmmhvae+x8kkv5SUw+vapi+Jyrj5+hq5qfN1icNTBRXZYJwRs0px
X-Google-Smtp-Source: AGHT+IFCaV2AU6aqCZboX5KGlyOq3otygjt59UuHU9Mo9CF+xjHrUtYmOPoP/qLilU30QZ97MlQFwA==
X-Received: by 2002:a05:6000:1249:b0:376:efb7:d19a with SMTP id ffacd0b85a97d-37892703efcmr7082438f8f.44.1725987987438;
        Tue, 10 Sep 2024 10:06:27 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 08/11] media: i2c: ov5645: Switch to {enable,disable}_streams
Date: Tue, 10 Sep 2024 18:06:07 +0100
Message-Id: <20240910170610.226189-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


