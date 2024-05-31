Return-Path: <linux-media+bounces-12350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3998D64D1
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 16:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0957828AA61
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 14:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BD7757E3;
	Fri, 31 May 2024 14:49:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EFC62A02;
	Fri, 31 May 2024 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717166977; cv=none; b=GgBavug5U2fPzFJ41KmMg7QPwQ+JcjC5tIbP/DN8xeOztYWwH6YYX0Ns3d+lp03J06wV/BewBwK164SMfeTEArecUDpo9x3BklOa03nnILhBcaXT2SxeeaciO8G7HS5HtVo+CTRmYU21dWAXr5Y3owvBN/yibi2QhvGiGlw+P/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717166977; c=relaxed/simple;
	bh=WDqR7FUN5MYbqjlweAuWRbTA/INUGEQ4XZouK1umPMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmXKXVa5S2YMkifTV2/51V5J1RjCCBzir+j8gzWlsJWntRhh1VKC3t3j0/cmKiWfS35vcsBQX5Ny8QDECrRBRUynsyygeMKUFBWTeslJXLmg6oIGW1lGaM4GIlvCm4CdRMsk4JLKaUZ7Om4cqmFRCZ454+1rgKY6wK/HwqGbhp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id F3DA24CD69;
	Fri, 31 May 2024 16:49:26 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v6 3/4] media: mgb4: Fixed signal frame rate limit handling
Date: Fri, 31 May 2024 16:49:20 +0200
Message-ID: <20240531144921.2104-4-tumic@gpxsee.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531144921.2104-1-tumic@gpxsee.org>
References: <20240531144921.2104-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Change the default DV timings for the outputs to produce a better signal less
"crippled" by the frame rate limiting. While the individual values are now
different, the resulting signal still matches the same default display as before.

Additionaly fix the corner case when the frame rate limit is set to zero causing
a "divide by zero" kernel panic.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_sysfs_out.c |  9 +++++----
 drivers/media/pci/mgb4/mgb4_vout.c      | 12 ++++++------
 drivers/media/pci/mgb4/mgb4_vout.h      |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_out.c b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
index f67ff2a48329..573aa61c69d4 100644
--- a/drivers/media/pci/mgb4/mgb4_sysfs_out.c
+++ b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
@@ -229,9 +229,9 @@ static ssize_t frame_rate_show(struct device *dev,
 	struct video_device *vdev = to_video_device(dev);
 	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
 	u32 period = mgb4_read_reg(&voutdev->mgbdev->video,
-				   voutdev->config->regs.frame_period);
+				   voutdev->config->regs.frame_limit);
 
-	return sprintf(buf, "%u\n", MGB4_HW_FREQ / period);
+	return sprintf(buf, "%u\n", period ? MGB4_HW_FREQ / period : 0);
 }
 
 /*
@@ -245,14 +245,15 @@ static ssize_t frame_rate_store(struct device *dev,
 	struct video_device *vdev = to_video_device(dev);
 	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
 	unsigned long val;
-	int ret;
+	int limit, ret;
 
 	ret = kstrtoul(buf, 10, &val);
 	if (ret)
 		return ret;
 
+	limit = val ? MGB4_HW_FREQ / val : 0;
 	mgb4_write_reg(&voutdev->mgbdev->video,
-		       voutdev->config->regs.frame_period, MGB4_HW_FREQ / val);
+		       voutdev->config->regs.frame_limit, limit);
 
 	return count;
 }
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index d98b6e87d71f..998edcbd9723 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -665,12 +665,12 @@ static void fpga_init(struct mgb4_vout_dev *voutdev)
 	mgb4_write_reg(video, regs->config, 0x00000011);
 	mgb4_write_reg(video, regs->resolution,
 		       (DEFAULT_WIDTH << 16) | DEFAULT_HEIGHT);
-	mgb4_write_reg(video, regs->hsync, 0x00102020);
-	mgb4_write_reg(video, regs->vsync, 0x40020202);
-	mgb4_write_reg(video, regs->frame_period, DEFAULT_PERIOD);
+	mgb4_write_reg(video, regs->hsync, 0x00283232);
+	mgb4_write_reg(video, regs->vsync, 0x40141F1E);
+	mgb4_write_reg(video, regs->frame_limit, DEFAULT_PERIOD);
 	mgb4_write_reg(video, regs->padding, 0x00000000);
 
-	voutdev->freq = mgb4_cmt_set_vout_freq(voutdev, 70000 >> 1) << 1;
+	voutdev->freq = mgb4_cmt_set_vout_freq(voutdev, 61150 >> 1) << 1;
 
 	mgb4_write_reg(video, regs->config,
 		       (voutdev->config->id + MGB4_VIN_DEVICES) << 2 | 1 << 4);
@@ -696,8 +696,8 @@ static void debugfs_init(struct mgb4_vout_dev *voutdev)
 	voutdev->regs[3].offset = voutdev->config->regs.hsync;
 	voutdev->regs[4].name = "VIDEO_PARAMS_2";
 	voutdev->regs[4].offset = voutdev->config->regs.vsync;
-	voutdev->regs[5].name = "FRAME_PERIOD";
-	voutdev->regs[5].offset = voutdev->config->regs.frame_period;
+	voutdev->regs[5].name = "FRAME_LIMIT";
+	voutdev->regs[5].offset = voutdev->config->regs.frame_limit;
 	voutdev->regs[6].name = "PADDING_PIXELS";
 	voutdev->regs[6].offset = voutdev->config->regs.padding;
 	if (has_timeperframe(video)) {
diff --git a/drivers/media/pci/mgb4/mgb4_vout.h b/drivers/media/pci/mgb4/mgb4_vout.h
index ab9b58b1deb7..adc8fe1e7ae6 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.h
+++ b/drivers/media/pci/mgb4/mgb4_vout.h
@@ -19,7 +19,7 @@ struct mgb4_vout_regs {
 	u32 config;
 	u32 status;
 	u32 resolution;
-	u32 frame_period;
+	u32 frame_limit;
 	u32 hsync;
 	u32 vsync;
 	u32 padding;
-- 
2.45.1


