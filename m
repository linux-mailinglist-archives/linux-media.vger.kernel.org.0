Return-Path: <linux-media+bounces-29607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A46A4A7FCFA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 12:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25724189DF90
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CFC267AF2;
	Tue,  8 Apr 2025 10:49:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082F267731;
	Tue,  8 Apr 2025 10:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109369; cv=none; b=cn8RI3D9flK22gKglZKWk/xp41UeOPi5yRDzo56YWTUUBDDTppBaiPpAkg5/QsC/T3d2dLFry1LkYQnSx9ySANixZCzbKwPuBf47YNh9o3PRO5fiw3Bd0L3ksVYY8JwUvskKOBS8y9GP/coX3mGJbsdllwcvPjdt32CR65ijyq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109369; c=relaxed/simple;
	bh=Wro/QQ/Y7WUVrtEFE+aw8JXvs1Rqp/cELrPaRNiFwhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ikwkf1e5Cx3mUSjqAFkSSJQweZJ0aKWbhaodlWj+RpSsV2FtBGHoLcI0R//VDBvXTeH0UHdaPEDGOXEgzbFK1JQXnmi9aCSiR1d3UPPHWweSdKEAUFDs1KiPrDardFYEvQLot51PQxAsf7ViuhJpMcAR4fgEslldQW1JFy/B3yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 4DAD521E96;
	Tue, 08 Apr 2025 12:49:23 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] media: mgb4: Enumerate only the available timings
Date: Tue,  8 Apr 2025 12:49:12 +0200
Message-ID: <20250408104912.2476-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Enumerate and allow setting only the available (as given by the input
source) timings, not all theoretically possible.

The "complete" set is misleading for user SW (including qv4l) and
the missing check on set even allowed timings leading to completely broken
video streams.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c | 38 +++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 434eaf0440e2..c3b82bd366dd 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -604,14 +604,31 @@ static int vidioc_s_dv_timings(struct file *file, void *fh,
 			       struct v4l2_dv_timings *timings)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
-
-	if (timings->bt.width < video_timings_cap.bt.min_width ||
-	    timings->bt.width > video_timings_cap.bt.max_width ||
-	    timings->bt.height < video_timings_cap.bt.min_height ||
-	    timings->bt.height > video_timings_cap.bt.max_height)
+	struct v4l2_dv_timings active_timings;
+
+	if (get_timings(vindev, &active_timings) < 0)
+		return -ENODATA;
+	if (timings->bt.width != active_timings.bt.width ||
+	    timings->bt.height != active_timings.bt.height ||
+	    timings->bt.polarities != active_timings.bt.polarities ||
+	    timings->bt.pixelclock != active_timings.bt.pixelclock ||
+	    timings->bt.hfrontporch != active_timings.bt.hfrontporch ||
+	    timings->bt.hsync != active_timings.bt.hsync ||
+	    timings->bt.hbackporch != active_timings.bt.hbackporch ||
+	    timings->bt.vfrontporch != active_timings.bt.vfrontporch ||
+	    timings->bt.vsync != active_timings.bt.vsync ||
+	    timings->bt.vbackporch != active_timings.bt.vbackporch)
 		return -EINVAL;
 	if (timings->bt.width == vindev->timings.bt.width &&
-	    timings->bt.height == vindev->timings.bt.height)
+	    timings->bt.height == vindev->timings.bt.height &&
+	    timings->bt.polarities == vindev->timings.bt.polarities &&
+	    timings->bt.pixelclock == vindev->timings.bt.pixelclock &&
+	    timings->bt.hfrontporch == vindev->timings.bt.hfrontporch &&
+	    timings->bt.hsync == vindev->timings.bt.hsync &&
+	    timings->bt.hbackporch == vindev->timings.bt.hbackporch &&
+	    timings->bt.vfrontporch == vindev->timings.bt.vfrontporch &&
+	    timings->bt.vsync == vindev->timings.bt.vsync &&
+	    timings->bt.vbackporch == vindev->timings.bt.vbackporch)
 		return 0;
 	if (vb2_is_busy(&vindev->queue))
 		return -EBUSY;
@@ -641,7 +658,14 @@ static int vidioc_query_dv_timings(struct file *file, void *fh,
 static int vidioc_enum_dv_timings(struct file *file, void *fh,
 				  struct v4l2_enum_dv_timings *timings)
 {
-	return v4l2_enum_dv_timings_cap(timings, &video_timings_cap, NULL, NULL);
+	struct mgb4_vin_dev *vindev = video_drvdata(file);
+
+	if (timings->index != 0)
+		return -EINVAL;
+	if (get_timings(vindev, &timings->timings) < 0)
+		return -ENODATA;
+
+	return 0;
 }
 
 static int vidioc_dv_timings_cap(struct file *file, void *fh,

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.48.1


