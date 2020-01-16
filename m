Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD7013DC20
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 14:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgAPNeq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 08:34:46 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40790 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbgAPNeq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 08:34:46 -0500
Received: by mail-wm1-f67.google.com with SMTP id t14so3804276wmi.5
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2020 05:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tsG/kNWOY1oaLEfx3AisRYovgh6oCd1Sk94EaWADP1A=;
        b=1Bs13GLWG0q2oepJBkkMKBXN55AsJyFVIq83RdE7FstgXFKYTqAM1fdoPdTjTsIfPa
         kkqRNS1Wk8ISL8gDFtyPgSQq3Z1zlqP/Ns4yWx3XFdbmT1KYDVkIbjTpwmQdyn8QwUYs
         M4oMN04iFRP7BThXs5qLF4c2HLvGKJ0cEONeHTkZu0ZSn4qLZi8dp0qD2+teA/o+g4Gc
         YvKsoYRTPQgj/5F0YUO26C/UV6jOi2Z5hR/vNQdbt3TdlF6FmbWvaziQxi2xhF/7mVlL
         8dOOGV81WYjpsLXe+f6lJa5oVU1BrICKWOs6oI6dh187EIZm8ZLKyLbcu8N0Z6GbBitP
         nIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tsG/kNWOY1oaLEfx3AisRYovgh6oCd1Sk94EaWADP1A=;
        b=Nai73ISsIacvRBOdSFlA7CsQmQxpYRgjnwI9U2KpYTpALveMUjts14jX9zqqyQJFVd
         oygjkNerw+ZSv1VERoNCORbkmHUUytsVPaE1CqIbP0mgmZTEnJi5JkKxAAi3l+HR4hUI
         EQx6jsQjbtXERE/+iSr4M8ICMkGGQYTxfo73eNNtQuYaE39rmI0gjOq2L2dX6iS4iTrG
         sSzi70gmogALWksDG89ygjIGFIiS2yiSR0/QkteWvxSxs/LEF5OOaph6065ITHVU66rf
         Kt5SjWu81zzp+72vUBER8Is7vdGxG16UD6CbxqMn86xIDIGvrt0W5yrp6ZSbztJQTNT1
         1OnQ==
X-Gm-Message-State: APjAAAVpdF0pfU6xMfuMPZZ5l8lpd59SEz0JoZmV9IUGJBW+FzzMyu7l
        Z69f7Ze9UiGu2L4jB0DhL1z4gXYwuKzGig==
X-Google-Smtp-Source: APXvYqyXmfYjyCLjI7Jq4nu3MhkiOKk2tOb7dImKfGrnqC+3eVJikhsp0cBodESHkU94cTJ8uUFX7g==
X-Received: by 2002:a05:600c:145:: with SMTP id w5mr6598741wmm.157.1579181682932;
        Thu, 16 Jan 2020 05:34:42 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x14sm162559wmj.42.2020.01.16.05.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 05:34:42 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] media: meson: vdec: align stride on 32 bytes
Date:   Thu, 16 Jan 2020 14:34:33 +0100
Message-Id: <20200116133437.2443-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200116133437.2443-1-narmstrong@baylibre.com>
References: <20200116133437.2443-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The HEVC/VP9 aligns the plane stride on 32, so align the planes stride
for all codecs to 32 to satisfy HEVC/VP9 decoding using the "HEVC" HW.

This fixes VP9 decoding of streams with following (not limited) widths:
- 264
 -288
- 350
- 352
- 472
- 480
- 528
- 600
- 720
- 800
- 848
- 1440

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec.c         | 10 +++++-----
 drivers/staging/media/meson/vdec/vdec_helpers.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 20e95b71c2d6..5514d2d259a4 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -527,20 +527,20 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 		memset(pfmt[1].reserved, 0, sizeof(pfmt[1].reserved));
 		if (pixmp->pixelformat == V4L2_PIX_FMT_NV12M) {
 			pfmt[0].sizeimage = output_size;
-			pfmt[0].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[0].bytesperline = ALIGN(pixmp->width, 32);
 
 			pfmt[1].sizeimage = output_size / 2;
-			pfmt[1].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[1].bytesperline = ALIGN(pixmp->width, 32);
 			pixmp->num_planes = 2;
 		} else if (pixmp->pixelformat == V4L2_PIX_FMT_YUV420M) {
 			pfmt[0].sizeimage = output_size;
-			pfmt[0].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[0].bytesperline = ALIGN(pixmp->width, 32);
 
 			pfmt[1].sizeimage = output_size / 4;
-			pfmt[1].bytesperline = ALIGN(pixmp->width, 64) / 2;
+			pfmt[1].bytesperline = ALIGN(pixmp->width, 32) / 2;
 
 			pfmt[2].sizeimage = output_size / 2;
-			pfmt[2].bytesperline = ALIGN(pixmp->width, 64) / 2;
+			pfmt[2].bytesperline = ALIGN(pixmp->width, 32) / 2;
 			pixmp->num_planes = 3;
 		}
 	}
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index ff4333074197..fc59d8801643 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -154,8 +154,8 @@ int amvdec_set_canvases(struct amvdec_session *sess,
 {
 	struct v4l2_m2m_buffer *buf;
 	u32 pixfmt = sess->pixfmt_cap;
-	u32 width = ALIGN(sess->width, 64);
-	u32 height = ALIGN(sess->height, 64);
+	u32 width = ALIGN(sess->width, 32);
+	u32 height = ALIGN(sess->height, 32);
 	u32 reg_cur = reg_base[0];
 	u32 reg_num_cur = 0;
 	u32 reg_base_cur = 0;
-- 
2.22.0

