Return-Path: <linux-media+bounces-5102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E548539A2
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 19:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39DAA1F24BF9
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 18:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723EF60863;
	Tue, 13 Feb 2024 18:13:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F8E604D5;
	Tue, 13 Feb 2024 18:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847985; cv=none; b=A2MTGvGulAbx/8LuWa+B9lnd4d/HyUCvtOjJHMyZEhaxaYBU4ZrXLlEtamtucHwwCr6iZUkfqYlteIq3LeBi/ZNzBAWvF3FNuFzORZkkUwNTFL3+E2XX5ukarVM5zgSe30c6eNPUCJwgOBLDSRxYpqyb8wpB5XpRXe8wwhqTa3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847985; c=relaxed/simple;
	bh=mPLEFkCN6hEWOJvwLzwjPvq+OB9o1HF849Psz5TPZ5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m+ZU/2qWhvuWVxuzpu9gBbtjMlSenLzMAkXdWnhJSzEgBn8nppBIrnvVu/tmLratNCMzcWt1IJXVvINXbPVa/vPul8WNWc9r+5AtKTCWMYEUNFf3f+Yd+WVo2WC/ixyTkTwrgobdsIH0dPvH3rQMcLinesrntfYNJWfZOYoUyeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="197718685"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Feb 2024 03:13:02 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2B83D40617B1;
	Wed, 14 Feb 2024 03:12:57 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 5/5] media: platform: rzg2l-cru: rzg2l-video: Fix start reception procedure
Date: Tue, 13 Feb 2024 18:12:33 +0000
Message-Id: <20240213181233.242316-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
References: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
latest hardware manual (R01UH0914EJ0145 Rev.1.45) we need to supply all
the clocks and then release the CRU resets. Currently we are releasing
the resets and then supplying the clocks. So, fix the start reception
procedure.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 59 +++++++++----------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index d15a9bfcc98b..b16b8af6e8f8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -489,39 +489,24 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 
 		video_device_pipeline_stop(&cru->vdev);
 
-		pm_runtime_put_sync(cru->dev);
-		clk_disable_unprepare(cru->vclk);
-
 		return stream_off_ret;
 	}
 
-	ret = pm_runtime_resume_and_get(cru->dev);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(cru->vclk);
-	if (ret)
-		goto err_pm_put;
-
 	ret = rzg2l_cru_mc_validate_format(cru, sd, pad);
 	if (ret)
-		goto err_vclk_disable;
+		return ret;
 
 	pipe = media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
 	ret = video_device_pipeline_start(&cru->vdev, pipe);
 	if (ret)
-		goto err_vclk_disable;
+		return ret;
 
 	ret = v4l2_subdev_call(sd, video, pre_streamon, 0);
-	if (ret == -ENOIOCTLCMD)
-		ret = 0;
-	if (ret)
+	if (ret && ret != -ENOIOCTLCMD)
 		goto pipe_line_stop;
 
 	ret = v4l2_subdev_call(sd, video, s_stream, 1);
-	if (ret == -ENOIOCTLCMD)
-		ret = 0;
-	if (ret)
+	if (ret && ret != -ENOIOCTLCMD)
 		goto err_s_stream;
 
 	return 0;
@@ -532,12 +517,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 pipe_line_stop:
 	video_device_pipeline_stop(&cru->vdev);
 
-err_vclk_disable:
-	clk_disable_unprepare(cru->vclk);
-
-err_pm_put:
-	pm_runtime_put_sync(cru->dev);
-
 	return ret;
 }
 
@@ -636,25 +615,33 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
 	int ret;
 
+	ret = pm_runtime_resume_and_get(cru->dev);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(cru->vclk);
+	if (ret)
+		goto err_pm_put;
+
 	/* Release reset state */
 	ret = reset_control_deassert(cru->aresetn);
 	if (ret) {
 		dev_err(cru->dev, "failed to deassert aresetn\n");
-		return ret;
+		goto err_vclk_disable;
 	}
 
 	ret = reset_control_deassert(cru->presetn);
 	if (ret) {
 		reset_control_assert(cru->aresetn);
 		dev_err(cru->dev, "failed to deassert presetn\n");
-		return ret;
+		goto assert_aresetn;
 	}
 
 	ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
 			  IRQF_SHARED, KBUILD_MODNAME, cru);
 	if (ret) {
 		dev_err(cru->dev, "failed to request irq\n");
-		goto assert_resets;
+		goto assert_presetn;
 	}
 
 	/* Allocate scratch buffer. */
@@ -686,10 +673,18 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 free_image_conv_irq:
 	free_irq(cru->image_conv_irq, cru);
 
-assert_resets:
+assert_presetn:
 	reset_control_assert(cru->presetn);
+
+assert_aresetn:
 	reset_control_assert(cru->aresetn);
 
+err_vclk_disable:
+	clk_disable_unprepare(cru->vclk);
+
+err_pm_put:
+	pm_runtime_put_sync(cru->dev);
+
 	return ret;
 }
 
@@ -704,9 +699,11 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
 			  cru->scratch, cru->scratch_phys);
 
 	free_irq(cru->image_conv_irq, cru);
-	reset_control_assert(cru->presetn);
-
 	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
+
+	reset_control_assert(cru->presetn);
+	clk_disable_unprepare(cru->vclk);
+	pm_runtime_put_sync(cru->dev);
 }
 
 static const struct vb2_ops rzg2l_cru_qops = {
-- 
2.25.1


