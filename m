Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D64272090
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgIUKXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgIUKU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:58 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CCDC0613D6
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:54 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t10so12133483wrv.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=65FXJqBuVDUzxD7doK++gxysr5EY6cSmpC745+zOXJs=;
        b=Du24+tm/QhmhZ5IVy7r2qPHUeCurWcwjdhxfvUmy4+7fplJwd3mtGQfOB8MZgTqFl1
         vbavMjLPVGU5vW1vR8Ms6EEpiDMFdTbMx6KzdLWgyGxAGWyJ9l3IJo+b51zvZfdlaWRo
         IgYhmvKycQsZFysfm9I7u+CkXkCTVxIy6D/955vSwybNxK5FpllxCk+uP/W68dKwvAhH
         t/Cv7GX9cr5h5PmH2L6acNNPIQNFtM9K0joVNuxFlS65+lOOCrjn7Ia5FfRHY7nCHeTt
         BT/0zrRLOTDyGVt4Wh2NawrP8Tl3/QtEXp9E9Y1Xrgx0Zm5VP3P4SCeTC7G59H/yNTtC
         3F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=65FXJqBuVDUzxD7doK++gxysr5EY6cSmpC745+zOXJs=;
        b=BxqMoQDamNys4YIZza6PohM3lYy9T8596cH8YDV9nHiIeM9nfP2VxvlcXWWsvhYNmS
         MNP8s2BIxHHQenT3NIT0SApwtA7N1IDSS9z/dHxeFhGKbGQqUdxRVT2b00OJ83qfvnT0
         ltNDzaY5sUHMg9eD69MSgbnzOCXXPIzU08BTPEnIsZOqyfTOlkAnj8a3+tdUVXDyFdcd
         pIjCNyhLHaOSEbYjQpT0w0I+NDuhyrUskLM3OALGCL2rrH6IlgR9I96zL1b5i+RP2EUM
         dsrq+u/GSBn2ZyE5uYYepAO07zO4kP3MsafNIeHn2OGIyNE9xox+F6oNW2JNTZ4CezZt
         FTGw==
X-Gm-Message-State: AOAM530QXyoEVR8/Co0sMwmvrdBiUBjoa67WklfdXWVDjYSQInrULy7v
        KpuQMLMhyTwjPH3auVpdyJHA1A==
X-Google-Smtp-Source: ABdhPJwk1tGudOVy78cc5atd6bTRWuBVMmN4LKzZfKPwxptMUejJSagxk3DjbhP5ecTDndV98Boo8A==
X-Received: by 2002:a05:6000:85:: with SMTP id m5mr22915576wrx.160.1600683652749;
        Mon, 21 Sep 2020 03:20:52 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:51 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 21/49] staging: media: zoran: Use video_drvdata to get struct zoran
Date:   Mon, 21 Sep 2020 10:19:56 +0000
Message-Id: <1600683624-5863-22-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
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
index 77cd2c07c394..9d39e98c9af1 100644
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
@@ -1352,8 +1351,7 @@ static int zoran_enum_fmt(struct zoran *zr, struct v4l2_fmtdesc *fmt, int flag)
 static int zoran_enum_fmt_vid_cap(struct file *file, void *__fh,
 				  struct v4l2_fmtdesc *f)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	return zoran_enum_fmt(zr, f, ZORAN_FORMAT_CAPTURE);
 }
@@ -1361,8 +1359,7 @@ static int zoran_enum_fmt_vid_cap(struct file *file, void *__fh,
 static int zoran_enum_fmt_vid_out(struct file *file, void *__fh,
 				  struct v4l2_fmtdesc *f)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	return zoran_enum_fmt(zr, f, ZORAN_FORMAT_PLAYBACK);
 }
@@ -1370,8 +1367,7 @@ static int zoran_enum_fmt_vid_out(struct file *file, void *__fh,
 static int zoran_enum_fmt_vid_overlay(struct file *file, void *__fh,
 				      struct v4l2_fmtdesc *f)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	return zoran_enum_fmt(zr, f, ZORAN_FORMAT_OVERLAY);
 }
@@ -1421,8 +1417,7 @@ static int zoran_g_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format
 static int zoran_g_fmt_vid_overlay(struct file *file, void *__fh,
 				   struct v4l2_format *fmt)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	fmt->fmt.win.w.left = zr->overlay_settings.x;
 	fmt->fmt.win.w.top = zr->overlay_settings.y;
@@ -1439,8 +1434,7 @@ static int zoran_g_fmt_vid_overlay(struct file *file, void *__fh,
 static int zoran_try_fmt_vid_overlay(struct file *file, void *__fh,
 				     struct v4l2_format *fmt)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	if (fmt->fmt.win.w.width > BUZ_MAX_WIDTH)
 		fmt->fmt.win.w.width = BUZ_MAX_WIDTH;
@@ -1641,8 +1635,8 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh, struct v4l2_format
 
 static int zoran_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format *fmt)
 {
+	struct zoran *zr = video_drvdata(file);
 	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
 	int i;
 	int res = 0;
 
@@ -1689,8 +1683,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format
 static int zoran_g_fbuf(struct file *file, void *__fh,
 			struct v4l2_framebuffer *fb)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	memset(fb, 0, sizeof(*fb));
 	fb->base = zr->vbuf_base;
@@ -1709,8 +1702,8 @@ static int zoran_g_fbuf(struct file *file, void *__fh,
 static int zoran_s_fbuf(struct file *file, void *__fh,
 			const struct v4l2_framebuffer *fb)
 {
+	struct zoran *zr = video_drvdata(file);
 	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
 	int i, res = 0;
 	__le32 printformat = __cpu_to_le32(fb->fmt.pixelformat);
 
@@ -2042,8 +2035,7 @@ static int zoran_streamoff(struct file *file, void *__fh, enum v4l2_buf_type typ
 
 static int zoran_g_std(struct file *file, void *__fh, v4l2_std_id *std)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	*std = zr->norm;
 	return 0;
@@ -2051,8 +2043,7 @@ static int zoran_g_std(struct file *file, void *__fh, v4l2_std_id *std)
 
 static int zoran_s_std(struct file *file, void *__fh, v4l2_std_id std)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 	int res = 0;
 
 	res = zoran_set_norm(zr, std);
@@ -2065,8 +2056,7 @@ static int zoran_s_std(struct file *file, void *__fh, v4l2_std_id std)
 
 static int zoran_enum_input(struct file *file, void *__fh, struct v4l2_input *inp)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	if (inp->index >= zr->card.inputs)
 		return -EINVAL;
@@ -2082,8 +2072,7 @@ static int zoran_enum_input(struct file *file, void *__fh, struct v4l2_input *in
 
 static int zoran_g_input(struct file *file, void *__fh, unsigned int *input)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	*input = zr->input;
 
@@ -2092,8 +2081,7 @@ static int zoran_g_input(struct file *file, void *__fh, unsigned int *input)
 
 static int zoran_s_input(struct file *file, void *__fh, unsigned int input)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 	int res;
 
 	res = zoran_set_input(zr, input);
-- 
2.26.2

