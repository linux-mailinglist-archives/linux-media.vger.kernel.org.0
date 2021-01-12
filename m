Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E0D2F2EF1
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 13:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733124AbhALMVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 07:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730609AbhALMVk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 07:21:40 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9914BC0617A2
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 04:20:59 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id y23so1936397wmi.1
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 04:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MbuUq4P3EHTaRZRZIMbCktw9khedoDm+hM+zJy1KsqI=;
        b=LhTgig3W3sY07dXxslzsfjFFIfbXnY40C8dWqKXdoxjaCsPK6Sxr2e7t/oPOPZPYHs
         1eQoNC/fomQriaKt2PO/gTKRdDmMUUQiU7zqiqNWSzRgRVB7LXj+orqSFahMBEglKJCA
         NUFevB0PHOengYR/AUjkRLCQ40QEEWx7YblPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MbuUq4P3EHTaRZRZIMbCktw9khedoDm+hM+zJy1KsqI=;
        b=ZHzakkvPlxKvHefKXxoeSX9rwH3mWuZWoKE9kz2ec4vGx1hYGWzOTAIhYeOLqRX8Pd
         DdnBQd4BpacRuXA5xwOqZ2/aQQkk3776X6lrKa1FaOKTM11DKDRJKN5aSR7AZ9DiVj8a
         YHksnQmhkOpIM/preGaDpUZVJPpA8xVsrW9xCjhIQO6FN6oxLoGS0yY0gYPzZmof72aA
         8N/I8TaqV8ZJOAeJ7FI6AHiVKXf0XXIZ2gbcz3FuIOdXuuwHlpLwRVPs4TxpkdATR/1S
         BAzs7eA7KTVVrAQJWexdgOf+j7MYBFfLhXodJP/XNx1u1cUi06VzOI2JfO4ymoBmnfWV
         nP1w==
X-Gm-Message-State: AOAM531r0qXY2PVd83/QNoT0eAWHYZb3aUKxHXkYOZbM0+qAxEF+cd1L
        eHOCYJvtuM5rJ03YSoy9CP3EJ5i4p1yKQZvH5/o=
X-Google-Smtp-Source: ABdhPJyIhFnoExJgUM6FYKub4zkfWO30jYVL5KHqYAuyL6Hn09FJ/56mq3n40ebrt+ImoKxV+BRInQ==
X-Received: by 2002:a1c:7217:: with SMTP id n23mr3243366wmc.167.1610454058331;
        Tue, 12 Jan 2021 04:20:58 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id w189sm3781384wmg.31.2021.01.12.04.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:20:57 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 6/9] media: sun4i-csi: Do not zero reserved fields
Date:   Tue, 12 Jan 2021 13:20:52 +0100
Message-Id: <20210112122053.10372-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Core code already clears reserved fields of struct
v4l2_pix_format_mplane, check: 4e1e0eb0e074 ("media: v4l2-ioctl: Zero
v4l2_plane_pix_format reserved fields").

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 1a2f65d83a6c..4785faddf630 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -113,8 +113,6 @@ static void _sun4i_csi_try_fmt(struct sun4i_csi *csi,
 	pix->num_planes = _fmt->num_planes;
 	pix->pixelformat = _fmt->fourcc;
 
-	memset(pix->reserved, 0, sizeof(pix->reserved));
-
 	/* Align the width and height on the subsampling */
 	width = ALIGN(pix->width, _fmt->hsub);
 	height = ALIGN(pix->height, _fmt->vsub);
@@ -131,8 +129,6 @@ static void _sun4i_csi_try_fmt(struct sun4i_csi *csi,
 		bpl = pix->width / hsub * _fmt->bpp[i] / 8;
 		pix->plane_fmt[i].bytesperline = bpl;
 		pix->plane_fmt[i].sizeimage = bpl * pix->height / vsub;
-		memset(pix->plane_fmt[i].reserved, 0,
-		       sizeof(pix->plane_fmt[i].reserved));
 	}
 }
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

