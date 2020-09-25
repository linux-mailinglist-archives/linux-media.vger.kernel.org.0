Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C101D279091
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730000AbgIYSdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729770AbgIYSdQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:33:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE73C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:16 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l126so4006147pfd.5
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bT/+Sa6D+GAhAQMlD3pZwWZlV4j8Wl3G9tEqamihm64=;
        b=tJ1zeP4o/+j1dNZ6f+ZWQXe+4IXDFZe59+v6ksLWbgmuH1u18pRcM94Wfv5r8sXtPu
         462ipFCTkhwpe67/QMtE+T1wU9XW0ZSMXVQEQPGXFdoWPVvDg+OuEDH6gwsfshT+uRlQ
         D4zkBQ1ZC+iK1MQQnho3QkA5uAE0ooNhGKBnBbpwdiPHBbRt7kPcuh3CvZjZDm4iF590
         cLHzZ9H1XbpMksjoDwCrrASSfdSP6TPMPeTg+yqnD7prrCNi1gesnk8DYhe3nhfUE9+p
         ibkIJ48GIPaQBKa6oZQ3MRZpy3oBcJRjowDb54suSNBnh16Wb+FDXTkBxQvHITLwoPjw
         cZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bT/+Sa6D+GAhAQMlD3pZwWZlV4j8Wl3G9tEqamihm64=;
        b=gLO/uUk9JH4vuPITJwKbpYqsaU7sIg1jbt/3HF37wX3eGAugtN0Fs/rwFKBdufK0s4
         d+7VIAyQMPzn4g5JGgLZsj3okRvMjPrOg4caMHPnUwuIKcM+j1h3G73XynuF+nRAnSYD
         drplayzOCTQEFf8eIPbrKP/5d+esBOIcgEi/OPRWr8czOr2s/afKbwAWc8ki2pDde+S8
         FzllRZmPNjBrZpQHeCX0/cna9ylovFBnwHGelHw+tP1b2Bu7MwM7XfVmd2g8a6L3cY2G
         TntMGnRn2XZF5tUUnKWXuAZCotYE96BVHMfqhfmOZ42iRuBIyNsM1bcHflq572JD6Gqg
         9Bwg==
X-Gm-Message-State: AOAM532FkASpWv6soPOjdFMWNj/ql6pR/15EtdSmtoTApZHR4+MyBk43
        7JxHmJlAP1Eb8naopPYWrsJFeQ==
X-Google-Smtp-Source: ABdhPJxsPtGvqhg/fJRIoMlGbdAtsJBJgmleaqtXgxyMZC8IB1n7q1jhfwdSjvfxBm/lSvkohGf84A==
X-Received: by 2002:a17:902:b10b:b029:d1:e5e7:bdf8 with SMTP id q11-20020a170902b10bb02900d1e5e7bdf8mr683397plr.43.1601058795915;
        Fri, 25 Sep 2020 11:33:15 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.33.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:33:15 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 20/47] staging: media: zoran: Use video_drvdata to get struct zoran
Date:   Fri, 25 Sep 2020 18:30:30 +0000
Message-Id: <1601058657-14042-21-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using video_drvdata() is proper and shorter than using directly
fh pointers.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 40 ++++++++--------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 3a59aa66436f..518ba19e1e0a 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1320,8 +1320,7 @@ static int zoran_set_input(struct zoran *zr, int input)
 
 static int zoran_querycap(struct file *file, void *__fh, struct v4l2_capability *cap)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	strscpy(cap->card, ZR_DEVNAME(zr), sizeof(cap->card));
 	strscpy(cap->driver, "zoran", sizeof(cap->driver));
@@ -1353,8 +1352,7 @@ static int zoran_enum_fmt(struct zoran *zr, struct v4l2_fmtdesc *fmt, int flag)
 static int zoran_enum_fmt_vid_cap(struct file *file, void *__fh,
 				  struct v4l2_fmtdesc *f)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	return zoran_enum_fmt(zr, f, ZORAN_FORMAT_CAPTURE);
 }
@@ -1362,8 +1360,7 @@ static int zoran_enum_fmt_vid_cap(struct file *file, void *__fh,
 static int zoran_enum_fmt_vid_out(struct file *file, void *__fh,
 				  struct v4l2_fmtdesc *f)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	return zoran_enum_fmt(zr, f, ZORAN_FORMAT_PLAYBACK);
 }
@@ -1371,8 +1368,7 @@ static int zoran_enum_fmt_vid_out(struct file *file, void *__fh,
 static int zoran_enum_fmt_vid_overlay(struct file *file, void *__fh,
 				      struct v4l2_fmtdesc *f)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	return zoran_enum_fmt(zr, f, ZORAN_FORMAT_OVERLAY);
 }
@@ -1424,8 +1420,7 @@ static int zoran_g_fmt_vid_cap(struct file *file, void *__fh,
 static int zoran_g_fmt_vid_overlay(struct file *file, void *__fh,
 				   struct v4l2_format *fmt)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	fmt->fmt.win.w.left = zr->overlay_settings.x;
 	fmt->fmt.win.w.top = zr->overlay_settings.y;
@@ -1442,8 +1437,7 @@ static int zoran_g_fmt_vid_overlay(struct file *file, void *__fh,
 static int zoran_try_fmt_vid_overlay(struct file *file, void *__fh,
 				     struct v4l2_format *fmt)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	if (fmt->fmt.win.w.width > BUZ_MAX_WIDTH)
 		fmt->fmt.win.w.width = BUZ_MAX_WIDTH;
@@ -1647,8 +1641,8 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 			       struct v4l2_format *fmt)
 {
+	struct zoran *zr = video_drvdata(file);
 	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
 	int i;
 	int res = 0;
 
@@ -1696,8 +1690,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 static int zoran_g_fbuf(struct file *file, void *__fh,
 			struct v4l2_framebuffer *fb)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	memset(fb, 0, sizeof(*fb));
 	fb->base = zr->vbuf_base;
@@ -1716,8 +1709,8 @@ static int zoran_g_fbuf(struct file *file, void *__fh,
 static int zoran_s_fbuf(struct file *file, void *__fh,
 			const struct v4l2_framebuffer *fb)
 {
+	struct zoran *zr = video_drvdata(file);
 	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
 	int i, res = 0;
 	__le32 printformat = __cpu_to_le32(fb->fmt.pixelformat);
 
@@ -2049,8 +2042,7 @@ static int zoran_streamoff(struct file *file, void *__fh, enum v4l2_buf_type typ
 
 static int zoran_g_std(struct file *file, void *__fh, v4l2_std_id *std)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	*std = zr->norm;
 	return 0;
@@ -2058,8 +2050,7 @@ static int zoran_g_std(struct file *file, void *__fh, v4l2_std_id *std)
 
 static int zoran_s_std(struct file *file, void *__fh, v4l2_std_id std)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 	int res = 0;
 
 	res = zoran_set_norm(zr, std);
@@ -2073,8 +2064,7 @@ static int zoran_s_std(struct file *file, void *__fh, v4l2_std_id std)
 static int zoran_enum_input(struct file *file, void *__fh,
 			    struct v4l2_input *inp)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	if (inp->index >= zr->card.inputs)
 		return -EINVAL;
@@ -2090,8 +2080,7 @@ static int zoran_enum_input(struct file *file, void *__fh,
 
 static int zoran_g_input(struct file *file, void *__fh, unsigned int *input)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	*input = zr->input;
 
@@ -2100,8 +2089,7 @@ static int zoran_g_input(struct file *file, void *__fh, unsigned int *input)
 
 static int zoran_s_input(struct file *file, void *__fh, unsigned int input)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 	int res;
 
 	res = zoran_set_input(zr, input);
-- 
2.26.2

