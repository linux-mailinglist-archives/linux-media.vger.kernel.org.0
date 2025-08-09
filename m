Return-Path: <linux-media+bounces-39226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 675A2B1F686
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AD58189B7B6
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8EE1B423B;
	Sat,  9 Aug 2025 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EqqBKJsK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10FC28469E
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774294; cv=none; b=VkZwCPDknlmYHD3J2v8/z8Qn3IfasWs01XQjbyHnEgXNHu3Df8YFQ6KzdsIuq6zdd2JsbXOf/mpyvGj+Bx7kgmHh+EjHZIBiowked2tWLM9atbp5Pgq5UxQ2i448EOlgGYygEresK4IaL/5JOP+4/AiLiBWECcEa2s/Uo7vao4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774294; c=relaxed/simple;
	bh=BpxI7mNvQw/gDeFWhykRnMPjMlpPL9WWtkPLJlAhIdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tKfefpJCEMI0iZQ8KihH1zbrywHLWGppaWY+CHbZt+2j3xgePbaWPab6Sym/o/oHXptacBJpY4Po18HkjJLhYA5BCvB1y7OGmk4TudUF3mDQ167X6SIih7TGzNtw4YqDs3a30RlI9KWOSt7CM0Ttb1InBCXfhrSMBAzVDndcWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EqqBKJsK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DE8D4111D;
	Sat,  9 Aug 2025 23:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774237;
	bh=BpxI7mNvQw/gDeFWhykRnMPjMlpPL9WWtkPLJlAhIdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EqqBKJsKVE58jqq/p6xwLh2E/LZsATA0JWxf6/ynZ0/h+/Sd4Ve25M+zEWO64Nj9v
	 91F8Cy4XGCmah8wjoQH5e1810CdY9U+0EUxUVOe48FCajKd0KLRby5UZx21rDI5vQG
	 nRpgbXA5/HSpheXSoKgyfE7rNJ3D52ZiARmVwhdQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	mjpeg-users@lists.sourceforge.net
Subject: [PATCH v2 34/76] media: zoran: Rename __fh to fh
Date: Sun, 10 Aug 2025 00:16:11 +0300
Message-ID: <20250809211654.28887-35-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Unless there is a good reason to do so, naming variable with double
underscore is generally not a good idea.

Rename the (mostly unused) __fh argument to ioctl handlers to fh.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/pci/zoran/zoran_driver.c | 36 +++++++++++++-------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index ec7fc1da4cc0..5b4d5dd06edb 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -245,7 +245,7 @@ static int zoran_set_input(struct zoran *zr, int input)
  *   ioctl routine
  */
 
-static int zoran_querycap(struct file *file, void *__fh, struct v4l2_capability *cap)
+static int zoran_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
 	struct zoran *zr = video_drvdata(file);
 
@@ -278,7 +278,7 @@ static int zoran_enum_fmt(struct zoran *zr, struct v4l2_fmtdesc *fmt, int flag)
 	return -EINVAL;
 }
 
-static int zoran_enum_fmt_vid_cap(struct file *file, void *__fh,
+static int zoran_enum_fmt_vid_cap(struct file *file, void *fh,
 				  struct v4l2_fmtdesc *f)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -286,7 +286,7 @@ static int zoran_enum_fmt_vid_cap(struct file *file, void *__fh,
 	return zoran_enum_fmt(zr, f, ZORAN_FORMAT_CAPTURE);
 }
 
-static int zoran_g_fmt_vid_out(struct file *file, void *__fh,
+static int zoran_g_fmt_vid_out(struct file *file, void *fh,
 			       struct v4l2_format *fmt)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -308,13 +308,13 @@ static int zoran_g_fmt_vid_out(struct file *file, void *__fh,
 	return 0;
 }
 
-static int zoran_g_fmt_vid_cap(struct file *file, void *__fh,
+static int zoran_g_fmt_vid_cap(struct file *file, void *fh,
 			       struct v4l2_format *fmt)
 {
 	struct zoran *zr = video_drvdata(file);
 
 	if (zr->map_mode != ZORAN_MAP_MODE_RAW)
-		return zoran_g_fmt_vid_out(file, __fh, fmt);
+		return zoran_g_fmt_vid_out(file, fh, fmt);
 	fmt->fmt.pix.width = zr->v4l_settings.width;
 	fmt->fmt.pix.height = zr->v4l_settings.height;
 	fmt->fmt.pix.sizeimage = zr->buffer_size;
@@ -328,7 +328,7 @@ static int zoran_g_fmt_vid_cap(struct file *file, void *__fh,
 	return 0;
 }
 
-static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
+static int zoran_try_fmt_vid_out(struct file *file, void *fh,
 				 struct v4l2_format *fmt)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -391,7 +391,7 @@ static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 	return res;
 }
 
-static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
+static int zoran_try_fmt_vid_cap(struct file *file, void *fh,
 				 struct v4l2_format *fmt)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -399,7 +399,7 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
 	int i;
 
 	if (fmt->fmt.pix.pixelformat == V4L2_PIX_FMT_MJPEG)
-		return zoran_try_fmt_vid_out(file, __fh, fmt);
+		return zoran_try_fmt_vid_out(file, fh, fmt);
 
 	for (i = 0; i < NUM_FORMATS; i++)
 		if (zoran_formats[i].fourcc == fmt->fmt.pix.pixelformat)
@@ -427,7 +427,7 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
 	return 0;
 }
 
-static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
+static int zoran_s_fmt_vid_out(struct file *file, void *fh,
 			       struct v4l2_format *fmt)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -507,7 +507,7 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 	return res;
 }
 
-static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
+static int zoran_s_fmt_vid_cap(struct file *file, void *fh,
 			       struct v4l2_format *fmt)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -515,7 +515,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 	int res = 0;
 
 	if (fmt->fmt.pix.pixelformat == V4L2_PIX_FMT_MJPEG)
-		return zoran_s_fmt_vid_out(file, __fh, fmt);
+		return zoran_s_fmt_vid_out(file, fh, fmt);
 
 	for (i = 0; i < NUM_FORMATS; i++)
 		if (fmt->fmt.pix.pixelformat == zoran_formats[i].fourcc)
@@ -555,7 +555,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 	return res;
 }
 
-static int zoran_g_std(struct file *file, void *__fh, v4l2_std_id *std)
+static int zoran_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
 	struct zoran *zr = video_drvdata(file);
 
@@ -563,7 +563,7 @@ static int zoran_g_std(struct file *file, void *__fh, v4l2_std_id *std)
 	return 0;
 }
 
-static int zoran_s_std(struct file *file, void *__fh, v4l2_std_id std)
+static int zoran_s_std(struct file *file, void *fh, v4l2_std_id std)
 {
 	struct zoran *zr = video_drvdata(file);
 	int res = 0;
@@ -578,7 +578,7 @@ static int zoran_s_std(struct file *file, void *__fh, v4l2_std_id std)
 	return res;
 }
 
-static int zoran_enum_input(struct file *file, void *__fh,
+static int zoran_enum_input(struct file *file, void *fh,
 			    struct v4l2_input *inp)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -595,7 +595,7 @@ static int zoran_enum_input(struct file *file, void *__fh,
 	return 0;
 }
 
-static int zoran_g_input(struct file *file, void *__fh, unsigned int *input)
+static int zoran_g_input(struct file *file, void *fh, unsigned int *input)
 {
 	struct zoran *zr = video_drvdata(file);
 
@@ -604,7 +604,7 @@ static int zoran_g_input(struct file *file, void *__fh, unsigned int *input)
 	return 0;
 }
 
-static int zoran_s_input(struct file *file, void *__fh, unsigned int input)
+static int zoran_s_input(struct file *file, void *fh, unsigned int input)
 {
 	struct zoran *zr = video_drvdata(file);
 	int res;
@@ -617,7 +617,7 @@ static int zoran_s_input(struct file *file, void *__fh, unsigned int input)
 }
 
 /* cropping (sub-frame capture) */
-static int zoran_g_selection(struct file *file, void *__fh, struct v4l2_selection *sel)
+static int zoran_g_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 {
 	struct zoran *zr = video_drvdata(file);
 
@@ -652,7 +652,7 @@ static int zoran_g_selection(struct file *file, void *__fh, struct v4l2_selectio
 	return 0;
 }
 
-static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selection *sel)
+static int zoran_s_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 {
 	struct zoran *zr = video_drvdata(file);
 	struct zoran_jpg_settings settings;
-- 
Regards,

Laurent Pinchart


