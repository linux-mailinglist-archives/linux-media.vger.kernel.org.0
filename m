Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2D336662C
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 09:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236731AbhDUHVP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbhDUHVO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:21:14 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E573AC06138B
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:41 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id h20so21131375plr.4
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=81mtl71VNVXeAc/LoEtGnqgE0rmQcWx1oL6lnTpYEFU=;
        b=QwG7E9c5A70MtmjERKJ5WBTNZFDnhROkoY3yRJjTbVcbrGfjMRdwfMFeXscQ9McdOd
         jIPkKkWq093RBWv+VGgLWSo2cjJZPnWcoDhR3a7GLD+2MrjUf05G7jfx6qjupNAMzjH+
         qP8MK4N5z16LEpmr2VP0Bym0+6dlXhTqemm7CYTwGVwigVqWRUDrmIG6fm3x6yixweCy
         DOiHYjXYV5bjmYyVuh8+X9xpxawyZ7pA5l7Jaa81s3srHmY/Sg251Fdp5YD6Z0jgQ3v8
         2b+ukt1TsIqWzi477ci3mPXpvWAC7HDpmeQI4K24M59Ck0aYPtOlvfD1geDx16u77cAL
         eO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=81mtl71VNVXeAc/LoEtGnqgE0rmQcWx1oL6lnTpYEFU=;
        b=R8UdOQ43iovj+4QGpNOJHtyBkbA3GjK0DHY1qp32V4+/i8R987WAFAyZVRj1dk3AiU
         6V2jbAXqllVp3cC6S0baRdMKYXZQlI4ssysfGvmw2oK67n/xuI+qqLFzAJmLFIhuYcU8
         RYum3zHUYy1kZz+0ZuxwvyowAzfyX0Sd+/an3mfyHOsIL1xSXzgfmUrFqqzdMy5qPps1
         CyFY6UYwLmgTUhPLyAqC1zCMCxxTilhpRD7hLTH5ZHEWnwF2T7N94wLT1wqKIqXYgh9K
         urplWdjp5/V3NLWEmQ26dRr+cGqNrIAQAYnwNK1f9x55Bsd1MkO/GmdFPmBn2WRClZDG
         nQLA==
X-Gm-Message-State: AOAM533mUw+2A7I2HOilqWiTfBI+ZQs7GVxCj291NG8As2nLWqP1NtPi
        rAeuL8jfn/M9WGe0UZFKKgHDC0KFJQPeIg==
X-Google-Smtp-Source: ABdhPJy1CKPfxPbcSR7ooV6VcAtd9vL1G058fdmjvZTMkosWtkKMQIb5sTx+8S/IL/avKn02tGeSvA==
X-Received: by 2002:a17:902:8bcb:b029:ec:a192:21cf with SMTP id r11-20020a1709028bcbb02900eca19221cfmr16156239plo.71.1618989641246;
        Wed, 21 Apr 2021 00:20:41 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id p10sm907815pfo.210.2021.04.21.00.20.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:20:40 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 6/8] v4l2-utils: turn fb_formats to constexpr array
Date:   Wed, 21 Apr 2021 00:20:33 -0700
Message-Id: <20210421072035.4188497-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421072035.4188497-1-rosenp@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Forces evaluation at compile time and allows usage of a for range loop.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
index 09de70c85..639a41757 100644
--- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
@@ -1,3 +1,4 @@
+#include <array>
 #include <vector>
 
 #include <linux/fb.h>
@@ -121,16 +122,15 @@ struct bitfield2fmt {
 	__u32 pixfmt;
 };
 
-static const struct bitfield2fmt fb_formats[] = {
-	{ 10, 5,  5, 5,  0, 5, 15, 1, V4L2_PIX_FMT_ARGB555 },
-	{ 11, 5,  5, 6,  0, 5,  0, 0, V4L2_PIX_FMT_RGB565 },
-	{  1, 5,  6, 5, 11, 5,  0, 1, V4L2_PIX_FMT_RGB555X },
-	{  0, 5,  5, 6, 11, 5,  0, 0, V4L2_PIX_FMT_RGB565X },
-	{ 16, 8,  8, 8,  0, 8,  0, 0, V4L2_PIX_FMT_BGR24 },
-	{  0, 8,  8, 8, 16, 8,  0, 0, V4L2_PIX_FMT_RGB24 },
-	{ 16, 8,  8, 8,  0, 8, 24, 8, V4L2_PIX_FMT_ABGR32 },
-	{  8, 8, 16, 8, 24, 8,  0, 8, V4L2_PIX_FMT_ARGB32 },
-	{ }
+static constexpr std::array<bitfield2fmt, 8> fb_formats{
+	bitfield2fmt{ 10, 5, 5, 5, 0, 5, 15, 1, V4L2_PIX_FMT_ARGB555 },
+	bitfield2fmt{ 11, 5, 5, 6, 0, 5, 0, 0, V4L2_PIX_FMT_RGB565 },
+	bitfield2fmt{ 1, 5, 6, 5, 11, 5, 0, 1, V4L2_PIX_FMT_RGB555X },
+	bitfield2fmt{ 0, 5, 5, 6, 11, 5, 0, 0, V4L2_PIX_FMT_RGB565X },
+	bitfield2fmt{ 16, 8, 8, 8, 0, 8, 0, 0, V4L2_PIX_FMT_BGR24 },
+	bitfield2fmt{ 0, 8, 8, 8, 16, 8, 0, 0, V4L2_PIX_FMT_RGB24 },
+	bitfield2fmt{ 16, 8, 8, 8, 0, 8, 24, 8, V4L2_PIX_FMT_ABGR32 },
+	bitfield2fmt{ 8, 8, 16, 8, 24, 8, 0, 8, V4L2_PIX_FMT_ARGB32 },
 };
 
 static bool match_bitfield(const struct fb_bitfield &bf, unsigned off, unsigned len)
@@ -182,9 +182,7 @@ static int fbuf_fill_from_fb(struct v4l2_framebuffer &fb, const char *fb_device)
 			if (vi.bits_per_pixel == 8)
 				fb.fmt.pixelformat = V4L2_PIX_FMT_GREY;
 		} else {
-			for (int i = 0; fb_formats[i].pixfmt; i++) {
-				const struct bitfield2fmt &p = fb_formats[i];
-
+			for (const auto &p : fb_formats) {
 				if (match_bitfield(vi.blue, p.blue_off, p.blue_len) &&
 				    match_bitfield(vi.green, p.green_off, p.green_len) &&
 				    match_bitfield(vi.red, p.red_off, p.red_len) &&
-- 
2.30.2

