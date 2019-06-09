Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E280A3A66D
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 16:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbfFIOi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 10:38:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40459 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728609AbfFIOi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 10:38:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so5866768wmj.5
        for <linux-media@vger.kernel.org>; Sun, 09 Jun 2019 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P6Q/xIQfBvYh3k/gbNxQn5lcYHvYMHeF5D1fpnrYBN0=;
        b=qePoT4dV/JqbW/9j5UGbkql85MAf5e55y0EyBoX7qBkR1u6gSaPyrlL5pGcX7K9qkf
         zCQOlh97aFk0/KDyutarW/qZLTfFBp4JIr6RThXGjf8MAqfwXz0gDHDPIKCMEvrhACEj
         gslCXOWuRPpwkmZOOL33V8mYFx1W+bjj47WAZ9+aa2WSAjZnD3iFOnWqzJqwNb4eH7OG
         v0LRRhNPYXtsoGUPdhAGhoWJHCG0+q6OnaRINLZFQrdtu/rATXIAptYMS0OW0KCLxXit
         EEW4C/77qPz9SHNVzUOC2DDmso2WFaNh5oh0/Qv6tbpWcJRgQhfMxJb7fIIGBdYc9ShD
         yVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P6Q/xIQfBvYh3k/gbNxQn5lcYHvYMHeF5D1fpnrYBN0=;
        b=Q5UXGNv65qhyhU/52FPwV7WKipE22iN+FbHqZ459V0GmSPhRMNUyvFWlMZsdt6lRya
         2PAlBcdPxSyebze7tjn6J1b/u8EGx2OVlW3/AISbkbLq876eQd3qQP5DDk99z7qD7PSR
         J3OKiW0+2Qz6KmU6UkHZOix332ORNFyV0Cy+uD17DJ0r0s0hK9NkHsC1ghahG0MMvOPn
         we+BETK3HTmEJiPf8ycoj35Wfpsivx9j3yHu+GSR29bYJprJAmFXJONl6ZTGQnTZqMGC
         fbw+UN69OxyTfMwxYnLW8PbgO88uRYMXANA/rqdqT07iIh0HTPXI9Tzeb63rMAEGzjBv
         4rZw==
X-Gm-Message-State: APjAAAX1GS1s8APFKUUwClrnmu0WtGFhlkvwm7xN86RAhYiG9pDr6y0N
        jyieg/bINSfub12YfsPBu9WkCw==
X-Google-Smtp-Source: APXvYqwrIhZjIQMvHF6kmzr5A6STPztNusKyvMwiUCZKMO/hMAg7+NZhj1x+9//tbmW0UZUfNx0sRw==
X-Received: by 2002:a1c:1bc1:: with SMTP id b184mr11089022wmb.42.1560091106264;
        Sun, 09 Jun 2019 07:38:26 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id c17sm6047713wrv.82.2019.06.09.07.38.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 09 Jun 2019 07:38:25 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [RFC PATCH 3/5] media: s5p_mfc_dec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Sun,  9 Jun 2019 16:38:18 +0200
Message-Id: <20190609143820.4662-4-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609143820.4662-1-mjourdan@baylibre.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tag all the coded formats where the s5p_mfc decoder supports dynamic
resolution switching.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_common.h |  1 +
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c    | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
index 24148020baa9..59a279abb4a7 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
@@ -728,6 +728,7 @@ struct s5p_mfc_fmt {
 	enum s5p_mfc_fmt_type type;
 	u32 num_planes;
 	u32 versions;
+	u32 flags;
 };
 
 /**
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
index 51ab2e38a270..fd0bb04245a9 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
@@ -71,6 +71,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.name		= "H264/MVC Encoded Stream",
@@ -79,6 +80,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V6PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.name		= "H263 Encoded Stream",
@@ -87,6 +89,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.name		= "MPEG1 Encoded Stream",
@@ -95,6 +98,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.name		= "MPEG2 Encoded Stream",
@@ -103,6 +107,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.name		= "MPEG4 Encoded Stream",
@@ -111,6 +116,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.name		= "XviD Encoded Stream",
@@ -119,6 +125,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.name		= "VC1 Encoded Stream",
@@ -127,6 +134,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.name		= "VC1 RCV Encoded Stream",
@@ -135,6 +143,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V5PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.name		= "VP8 Encoded Stream",
@@ -143,6 +152,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V6PLUS_BITS,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_HEVC,
@@ -150,6 +160,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V10_BIT,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_VP9,
@@ -157,6 +168,7 @@ static struct s5p_mfc_fmt formats[] = {
 		.type		= MFC_FMT_DEC,
 		.num_planes	= 1,
 		.versions	= MFC_V10_BIT,
+		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 };
 
@@ -303,6 +315,7 @@ static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	fmt = &formats[i];
 	strscpy(f->description, fmt->name, sizeof(f->description));
 	f->pixelformat = fmt->fourcc;
+	f->flags = fmt->flags;
 	return 0;
 }
 
-- 
2.21.0

