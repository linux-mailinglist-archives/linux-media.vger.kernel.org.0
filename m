Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5442315407B
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 09:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgBFIl6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 03:41:58 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51349 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgBFIl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 03:41:58 -0500
Received: by mail-wm1-f68.google.com with SMTP id t23so5315288wmi.1
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 00:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RVrXPTZwBbLcZaQ9fhou/L2fbd5WchWNhoBm0tMKEHc=;
        b=SFFTkXTTEiDnMlPKJAzWLq/nNnpS7HQIdFI28w1/sAg7yGlzOJloJXPWZyNNuLpwm9
         USZhZzUFxkFa42WfURrziQ9+AUwUwtSsNg4qRn7ESVwkWypWvSgBHhnnCADtewlhwc18
         xCnGQWlHP+DQLwz5X2lBgGxG3BdYyuWH6yJmm/qxzFonQEUUXMeXL242pG9YTHomyIXb
         aR65hbpgC+PvVrX13IT32AUOVIFN9HmixY+cmRqCk/RBVXj0pZ9WUvvwVCs8iJKfY9vn
         CHAiUqerclFKC4wYpOnXJDPWy1O/qmSgjKW+X1duTTI/ra2hmC26/2y3EEHhEloETAk2
         Tg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RVrXPTZwBbLcZaQ9fhou/L2fbd5WchWNhoBm0tMKEHc=;
        b=Hm81zz/07GEb/KlS66+Dxhc/3cly689JuIn2WtS31dkuOa3eEI0ipk1648BtGXi3rQ
         flM5ARU9VorrzXa2Vwq0g497R2fCXocOL8Je8xnqxUpLZeJ8wDvpyLZYr4wIBxsbvR4T
         1yGqDuQy00t9KsCYS1X24hPI8le7YmyIMG3odn8ULwjaiwSPFt8k3gp0tzEpPTX6Y6m2
         IQDSvFD9/6uQjcNQHqXuQn+RLOMiOQ1ucm69FHX3tz7dHHdnynxQppAj+YvZ8Y8r3FYj
         svYeuZj4JDyKRyhYEL1ck11KrMN6b+3vKs8P6O+alm0xY2g+l7tlLSLw4NK1oJRRleI/
         6bQA==
X-Gm-Message-State: APjAAAXeJlgqjrhlpsPvIb6KzglkERCOay2UrmNqwrZ+gyLXk+4K09tI
        mNznevywngtfA4QAvv6ELhgI3P9MUtfR1Q==
X-Google-Smtp-Source: APXvYqyGtvBkTfc2Fo3xdRf91CNgY5XZEKQwvp42qZD27vyq2iDB/4kPzt8N1bZqs61WYmgorXSwcA==
X-Received: by 2002:a05:600c:2409:: with SMTP id 9mr3120720wmp.109.1580978515842;
        Thu, 06 Feb 2020 00:41:55 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
        by smtp.gmail.com with ESMTPSA id r1sm3222760wrx.11.2020.02.06.00.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 00:41:55 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] media: meson: vdec: align stride on 32 bytes
Date:   Thu,  6 Feb 2020 09:41:48 +0100
Message-Id: <20200206084152.7070-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206084152.7070-1-narmstrong@baylibre.com>
References: <20200206084152.7070-1-narmstrong@baylibre.com>
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
index 92f0258868b1..bfca4c82aa56 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -528,20 +528,20 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
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
index a4970ec1bf2e..3f7929c54dc6 100644
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

