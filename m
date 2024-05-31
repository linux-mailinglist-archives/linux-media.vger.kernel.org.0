Return-Path: <linux-media+bounces-12351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 246578D64D4
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 16:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A88501F2758A
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 14:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7212C74C1B;
	Fri, 31 May 2024 14:49:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B9C558B9;
	Fri, 31 May 2024 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717166978; cv=none; b=ZQj9W9Aw0T3u3I7hJXoBKpEXrlOSUHPfKHsMHoJ1xt0AvJ3xhRprNRSQKnyT0QQBR1XQV+qkwQdjAwnz8jPuUG4/X6hDaVufAAPvGNFNALtFjnbDF+CIFZxH4LfOgxfoTN/h6aefAHqY11bId9/anDHjGlqlyy8bKmTBX8/UkoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717166978; c=relaxed/simple;
	bh=obniZfSDW/k/GqDjUVIYlNk7TKGfBf5TeVHiB4wZLko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E2GrfRg1KQ89VlCGJaUw0lz4h/kDP+cph8hAHfjYaekMOVZgoYDVsscjnApktxyt8HnB/T7Qa92Pqen0XsMRNm97eJq1NQ4w7GWCGRDKJaQ0LO9YbAx/Uw9dutMh0xQH/F01A8UGLB5k2lBA24Kaq/BaFHdYIpKTe4g520h0kkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 04ED14ABED;
	Fri, 31 May 2024 16:49:27 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v6 4/4] media: admin-guide: mgb4: Outputs DV timings documentation update
Date: Fri, 31 May 2024 16:49:21 +0200
Message-ID: <20240531144921.2104-5-tumic@gpxsee.org>
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

Properly document the function of the mgb4 output "frame_rate" sysfs parameter
and update the default DV timings values according to the latest code changes.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 Documentation/admin-guide/media/mgb4.rst | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/media/mgb4.rst b/Documentation/admin-guide/media/mgb4.rst
index e434d4a9eeb3..b9da127c074d 100644
--- a/Documentation/admin-guide/media/mgb4.rst
+++ b/Documentation/admin-guide/media/mgb4.rst
@@ -227,8 +227,13 @@ Common FPDL3/GMSL output parameters
     open.*
 
 **frame_rate** (RW):
-    Output video frame rate in frames per second. The default frame rate is
-    60Hz.
+    Output video signal frame rate limit in frames per second. Due to
+    the limited output pixel clock steps, the card can not always generate
+    a frame rate perfectly matching the value required by the connected display.
+    Using this parameter one can limit the frame rate by "crippling" the signal
+    so that the lines are not equal (the porches of the last line differ) but
+    the signal appears like having the exact frame rate to the connected display.
+    The default frame rate limit is 60Hz.
 
 **hsync_polarity** (RW):
     HSYNC signal polarity.
@@ -253,33 +258,33 @@ Common FPDL3/GMSL output parameters
     and there is a non-linear stepping between two consecutive allowed
     frequencies. The driver finds the nearest allowed frequency to the given
     value and sets it. When reading this property, you get the exact
-    frequency set by the driver. The default frequency is 70000kHz.
+    frequency set by the driver. The default frequency is 61150kHz.
 
     *Note: This parameter can not be changed while the output v4l2 device is
     open.*
 
 **hsync_width** (RW):
-    Width of the HSYNC signal in pixels. The default value is 16.
+    Width of the HSYNC signal in pixels. The default value is 40.
 
 **vsync_width** (RW):
-    Width of the VSYNC signal in video lines. The default value is 2.
+    Width of the VSYNC signal in video lines. The default value is 20.
 
 **hback_porch** (RW):
     Number of PCLK pulses between deassertion of the HSYNC signal and the first
-    valid pixel in the video line (marked by DE=1). The default value is 32.
+    valid pixel in the video line (marked by DE=1). The default value is 50.
 
 **hfront_porch** (RW):
     Number of PCLK pulses between the end of the last valid pixel in the video
     line (marked by DE=1) and assertion of the HSYNC signal. The default value
-    is 32.
+    is 50.
 
 **vback_porch** (RW):
     Number of video lines between deassertion of the VSYNC signal and the video
-    line with the first valid pixel (marked by DE=1). The default value is 2.
+    line with the first valid pixel (marked by DE=1). The default value is 31.
 
 **vfront_porch** (RW):
     Number of video lines between the end of the last valid pixel line (marked
-    by DE=1) and assertion of the VSYNC signal. The default value is 2.
+    by DE=1) and assertion of the VSYNC signal. The default value is 30.
 
 FPDL3 specific input parameters
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.45.1


