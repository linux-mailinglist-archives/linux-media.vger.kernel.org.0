Return-Path: <linux-media+bounces-21679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD349D3F5E
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 16:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59026B29263
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0B21D2794;
	Wed, 20 Nov 2024 14:56:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D6A1D07BB;
	Wed, 20 Nov 2024 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114567; cv=none; b=R+QsKw5m/CH/oCNs5sxnENnp9T/mG0EwdL8OCO39z37ai6L729eHYbe5SbWbs6dCnK7i3FwqrAW9DISJF9M5ildL1DPwBqVCs/Uj9Hx8MtX/FHNIg8E8j7nWEcxYHWj3raUzPS56c0rJlQhjTsbD7NQc3Hy2jt0To5rBHnpyjLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114567; c=relaxed/simple;
	bh=bJBlKZYXCB4Rn98K+gEtEvSRnMA5Vcm2ACXAWLyY0Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g0I8mwg1hihpvEDVlF2d8np1WRTqi7pvxMrFcOfrozaQvjF/i9ec+L2FKymT+x+VwBhLSSao1YSmwasVS2vIpI47DX24bFCfaBF6ImZkTjtEoCDqhrVutu/kGw64gxLtN1gMAnVwip99fanaHgLBKJmByqF2jbtYEGIPQmyFYJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id AFDF063356;
	Wed, 20 Nov 2024 15:48:54 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 2/3] media: mgb4: Unify register names in inputs/outputs
Date: Wed, 20 Nov 2024 15:48:45 +0100
Message-ID: <20241120144846.2271-3-tumic@gpxsee.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120144846.2271-1-tumic@gpxsee.org>
References: <20241120144846.2271-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Unify the names of HW hsync/vsync registers between the inputs and outputs.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_sysfs_in.c | 12 ++++++------
 drivers/media/pci/mgb4/mgb4_vin.c      | 20 ++++++++++----------
 drivers/media/pci/mgb4/mgb4_vin.h      |  4 ++--
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_in.c b/drivers/media/pci/mgb4/mgb4_sysfs_in.c
index 0ba66a2cf145..9626fa59e3d3 100644
--- a/drivers/media/pci/mgb4/mgb4_sysfs_in.c
+++ b/drivers/media/pci/mgb4/mgb4_sysfs_in.c
@@ -333,7 +333,7 @@ static ssize_t hsync_width_show(struct device *dev,
 	struct video_device *vdev = to_video_device(dev);
 	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
 	u32 sig = mgb4_read_reg(&vindev->mgbdev->video,
-				vindev->config->regs.signal);
+				vindev->config->regs.hsync);
 
 	return sprintf(buf, "%u\n", (sig & 0x00FF0000) >> 16);
 }
@@ -344,7 +344,7 @@ static ssize_t vsync_width_show(struct device *dev,
 	struct video_device *vdev = to_video_device(dev);
 	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
 	u32 sig = mgb4_read_reg(&vindev->mgbdev->video,
-				vindev->config->regs.signal2);
+				vindev->config->regs.vsync);
 
 	return sprintf(buf, "%u\n", (sig & 0x00FF0000) >> 16);
 }
@@ -355,7 +355,7 @@ static ssize_t hback_porch_show(struct device *dev,
 	struct video_device *vdev = to_video_device(dev);
 	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
 	u32 sig = mgb4_read_reg(&vindev->mgbdev->video,
-				vindev->config->regs.signal);
+				vindev->config->regs.hsync);
 
 	return sprintf(buf, "%u\n", (sig & 0x0000FF00) >> 8);
 }
@@ -366,7 +366,7 @@ static ssize_t hfront_porch_show(struct device *dev,
 	struct video_device *vdev = to_video_device(dev);
 	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
 	u32 sig = mgb4_read_reg(&vindev->mgbdev->video,
-				vindev->config->regs.signal);
+				vindev->config->regs.hsync);
 
 	return sprintf(buf, "%u\n", (sig & 0x000000FF));
 }
@@ -377,7 +377,7 @@ static ssize_t vback_porch_show(struct device *dev,
 	struct video_device *vdev = to_video_device(dev);
 	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
 	u32 sig = mgb4_read_reg(&vindev->mgbdev->video,
-				vindev->config->regs.signal2);
+				vindev->config->regs.vsync);
 
 	return sprintf(buf, "%u\n", (sig & 0x0000FF00) >> 8);
 }
@@ -388,7 +388,7 @@ static ssize_t vfront_porch_show(struct device *dev,
 	struct video_device *vdev = to_video_device(dev);
 	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
 	u32 sig = mgb4_read_reg(&vindev->mgbdev->video,
-				vindev->config->regs.signal2);
+				vindev->config->regs.vsync);
 
 	return sprintf(buf, "%u\n", (sig & 0x000000FF));
 }
diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 3f171c624b40..434eaf0440e2 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -143,8 +143,8 @@ static int get_timings(struct mgb4_vin_dev *vindev,
 
 	u32 status = mgb4_read_reg(video, regs->status);
 	u32 pclk = mgb4_read_reg(video, regs->pclk);
-	u32 signal = mgb4_read_reg(video, regs->signal);
-	u32 signal2 = mgb4_read_reg(video, regs->signal2);
+	u32 hsync = mgb4_read_reg(video, regs->hsync);
+	u32 vsync = mgb4_read_reg(video, regs->vsync);
 	u32 resolution = mgb4_read_reg(video, regs->resolution);
 
 	if (!(status & (1U << 2)))
@@ -161,12 +161,12 @@ static int get_timings(struct mgb4_vin_dev *vindev,
 	if (status & (1U << 13))
 		timings->bt.polarities |= V4L2_DV_VSYNC_POS_POL;
 	timings->bt.pixelclock = pclk * 1000;
-	timings->bt.hsync = (signal & 0x00FF0000) >> 16;
-	timings->bt.vsync = (signal2 & 0x00FF0000) >> 16;
-	timings->bt.hbackporch = (signal & 0x0000FF00) >> 8;
-	timings->bt.hfrontporch = signal & 0x000000FF;
-	timings->bt.vbackporch = (signal2 & 0x0000FF00) >> 8;
-	timings->bt.vfrontporch = signal2 & 0x000000FF;
+	timings->bt.hsync = (hsync & 0x00FF0000) >> 16;
+	timings->bt.vsync = (vsync & 0x00FF0000) >> 16;
+	timings->bt.hbackporch = (hsync & 0x0000FF00) >> 8;
+	timings->bt.hfrontporch = hsync & 0x000000FF;
+	timings->bt.vbackporch = (vsync & 0x0000FF00) >> 8;
+	timings->bt.vfrontporch = vsync & 0x000000FF;
 
 	return 0;
 }
@@ -864,9 +864,9 @@ static void create_debugfs(struct mgb4_vin_dev *vindev)
 	vindev->regs[5].name = "PCLK_FREQUENCY";
 	vindev->regs[5].offset = vindev->config->regs.pclk;
 	vindev->regs[6].name = "VIDEO_PARAMS_1";
-	vindev->regs[6].offset = vindev->config->regs.signal;
+	vindev->regs[6].offset = vindev->config->regs.hsync;
 	vindev->regs[7].name = "VIDEO_PARAMS_2";
-	vindev->regs[7].offset = vindev->config->regs.signal2;
+	vindev->regs[7].offset = vindev->config->regs.vsync;
 	vindev->regs[8].name = "PADDING_PIXELS";
 	vindev->regs[8].offset = vindev->config->regs.padding;
 	if (has_timeperframe(video)) {
diff --git a/drivers/media/pci/mgb4/mgb4_vin.h b/drivers/media/pci/mgb4/mgb4_vin.h
index 8fd10c0a5554..2a2c829914ce 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.h
+++ b/drivers/media/pci/mgb4/mgb4_vin.h
@@ -22,8 +22,8 @@ struct mgb4_vin_regs {
 	u32 frame_period;
 	u32 sync;
 	u32 pclk;
-	u32 signal;
-	u32 signal2;
+	u32 hsync;
+	u32 vsync;
 	u32 padding;
 	u32 timer;
 };
-- 
2.47.0


